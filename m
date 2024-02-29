Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D5C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 18:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4DD10E123;
	Thu, 29 Feb 2024 18:40:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6114A10E123;
 Thu, 29 Feb 2024 18:40:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1115403548954526012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_revamp_big_joiner_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Feb 2024 18:40:02 -0000
Message-ID: <170923200239.397863.6726963106825731621@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229181021.130314-1-kunal1.joshi@intel.com>
In-Reply-To: <20240229181021.130314-1-kunal1.joshi@intel.com>
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

--===============1115403548954526012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14368 -> IGTPW_10758
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10758 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10758, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-arls-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10758:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_joiner@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg1-7/igt@kms_big_joiner@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-9/igt@kms_big_joiner@basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rplp-1/igt@kms_big_joiner@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-9/igt@kms_big_joiner@basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adln-1/igt@kms_big_joiner@basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-6/igt@kms_big_joiner@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][7] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-11/igt@kms_big_joiner@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-14/igt@kms_big_joiner@basic.html

  * {igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):
    - bat-dg2-9:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-arls-4}:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adlp-6:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][12] +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-6600u/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-rpls-3}:       NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - fi-apl-guc:         NOTRUN -> [FAIL][14] +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-dg2-8:          NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-arls-3:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-adls-6}:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adlp-9:         NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adln-1:         NOTRUN -> [DMESG-FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-rplp-1:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rplp-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-tgl-1115g4/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][24] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-rpls-3}:       NOTRUN -> [SKIP][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-adls-6}:       NOTRUN -> [SKIP][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):
    - fi-skl-guc:         NOTRUN -> [FAIL][27] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-guc/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html
    - bat-jsl-3:          NOTRUN -> [FAIL][28] +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html
    - bat-jsl-1:          NOTRUN -> [FAIL][29] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][30] +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-7567u/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [FAIL][31] +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8109u/igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations.html

  * igt@kms_big_joiner@invalid-modeset:
    - bat-jsl-3:          NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][33] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-8:          NOTRUN -> [SKIP][34] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][35] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-1:          NOTRUN -> [SKIP][36] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-1:         NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-3:         NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_joiner@basic:
    - {bat-arls-4}:       NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-4/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - {bat-adls-6}:       NOTRUN -> [SKIP][40] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_busy@basic:
    - {bat-rpls-3}:       NOTRUN -> [SKIP][41] +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-rpls-3}:       [SKIP][42] ([i915#4103]) -> [SKIP][43] +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-rpls-3}:       [PASS][44] -> [SKIP][45] +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - {bat-rpls-3}:       [SKIP][46] ([i915#3555] / [i915#3840] / [i915#9886]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_dsc@dsc-basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_dsc@dsc-basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14368 and IGTPW_10758:

### New IGT tests (5) ###

  * igt@kms_big_joiner@force-joiner-basic:
    - Statuses : 22 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@force-joiner-basic@1x-joiner:
    - Statuses : 1 dmesg-fail(s) 17 fail(s)
    - Exec time: [0.01, 2.81] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset:
    - Statuses : 24 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:
    - Statuses : 7 fail(s) 9 pass(s)
    - Exec time: [0.01, 1.33] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_10758 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@kms_big_joiner@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][49] ([fdo#109271]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-pnv-d510/igt@kms_big_joiner@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][50] ([fdo#109271]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-glk-j4005/igt@kms_big_joiner@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][51] ([fdo#109271]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-7567u/igt@kms_big_joiner@basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][52] ([fdo#109271]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-guc/igt@kms_big_joiner@basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][53] ([fdo#109271]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-x1275/igt@kms_big_joiner@basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][54] ([fdo#109271]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8109u/igt@kms_big_joiner@basic.html
    - fi-ilk-650:         NOTRUN -> [SKIP][55] ([fdo#109271]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-ilk-650/igt@kms_big_joiner@basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][56] ([fdo#109271]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-blb-e6850/igt@kms_big_joiner@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][57] ([i915#9792]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-6/igt@kms_big_joiner@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][58] ([fdo#109271]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-6600u/igt@kms_big_joiner@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][59] ([fdo#109271]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-guc/igt@kms_big_joiner@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][60] ([fdo#109271]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8700k/igt@kms_big_joiner@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][61] ([fdo#109271]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-bsw-nick/igt@kms_big_joiner@basic.html
    - bat-kbl-2:          NOTRUN -> [SKIP][62] ([fdo#109271]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-kbl-2/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - bat-atsm-1:         NOTRUN -> [SKIP][63] ([i915#6078]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-atsm-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][64] ([fdo#109271]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][65] ([fdo#109271]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][66] ([fdo#109271]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][67] ([fdo#109271]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][68] ([fdo#109271]) +19 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][69] ([i915#9197])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {bat-rpls-3}:       [DMESG-WARN][70] ([i915#5591]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
    - bat-dg2-14:         [INCOMPLETE][72] ([i915#10137]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-dg2-14/igt@i915_selftest@live@hangcheck.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-14/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9920]: https://gitlab.freedesktop.org/drm/intel/issues/9920


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7738 -> IGTPW_10758

  CI-20190529: 20190529
  CI_DRM_14368: 68e66ae04f6f2718699716285e8ddb09a469af35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10758: 10758
  IGT_7738: 7738


Testlist changes
----------------

+igt@kms_big_joiner@force-joiner-basic
+igt@kms_big_joiner@force-joiner-invalid-modeset
-igt@kms_big_joiner@2x-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/index.html

--===============1115403548954526012==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14368 -&gt; IGTPW_10758</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10758 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10758, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-arls-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10758:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg1-7/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-9/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rplp-1/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-9/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adln-1/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-6/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-14/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-6600u/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a> +1 other test fail</li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-8/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlp-9/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">DMESG-FAIL</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rplp-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-tgl-1115g4/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-guc/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-7567u/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8109u/igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
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
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-arls-4/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_busy@basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14368 and IGTPW_10758:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_big_joiner@force-joiner-basic:</p>
<ul>
<li>Statuses : 22 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-basic@1x-joiner:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 17 fail(s)</li>
<li>Exec time: [0.01, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset:</p>
<ul>
<li>Statuses : 24 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:</p>
<ul>
<li>Statuses : 7 fail(s) 9 pass(s)</li>
<li>Exec time: [0.01, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset@invalid_combinations:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10758 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-pnv-d510/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-glk-j4005/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-7567u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-x1275/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8109u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-ilk-650/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-blb-e6850/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-mtlp-6/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-6600u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-skl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-cfl-8700k/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-bsw-nick/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-kbl-2/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-atsm-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14368/bat-dg2-14/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10758/bat-dg2-14/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7738 -&gt; IGTPW_10758</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14368: 68e66ae04f6f2718699716285e8ddb09a469af35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10758: 10758<br />
  IGT_7738: 7738</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@force-joiner-basic<br />
+igt@kms_big_joiner@force-joiner-invalid-modeset<br />
-igt@kms_big_joiner@2x-modeset</p>

</body>
</html>

--===============1115403548954526012==--
