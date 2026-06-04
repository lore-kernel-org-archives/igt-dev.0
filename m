Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B151CD6E60
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 01:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79510E061;
	Thu,  4 Jun 2026 01:23:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342D310E061;
 Thu,  4 Jun 2026 01:23:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8538740940634954349=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib=3A_replace_libprocps/?=
 =?utf-8?q?libproc2_with_/proc-based_process_enumeration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 01:23:14 -0000
Message-ID: <178053619419.41956.16936475393544174946@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603182801.900747-1-jia.yao@intel.com>
In-Reply-To: <20260603182801.900747-1-jia.yao@intel.com>
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

--===============8538740940634954349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: replace libprocps/libproc2 with /proc-based process enumeration
URL   : https://patchwork.freedesktop.org/series/167838/
State : success

== Summary ==

CI Bug Log - changes from IGT_8947 -> IGTPW_15300
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15300 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-adls-6:         NOTRUN -> [SKIP][1] ([i915#15931])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#15656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#7707]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][5] ([i915#4103]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#3840])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#5354])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#1072] / [i915#9732]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#3555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3291]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@vgem_basic@create:
    - bat-mtlp-9:         [FAIL][12] ([i915#16296]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-mtlp-9/igt@vgem_basic@create.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-mtlp-9/igt@vgem_basic@create.html
    - bat-arls-6:         [FAIL][14] ([i915#16296]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arls-6/igt@vgem_basic@create.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arls-6/igt@vgem_basic@create.html
    - fi-hsw-4770:        [FAIL][16] ([i915#16296]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-hsw-4770/igt@vgem_basic@create.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-hsw-4770/igt@vgem_basic@create.html
    - bat-mtlp-8:         [FAIL][18] ([i915#16296]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-mtlp-8/igt@vgem_basic@create.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-mtlp-8/igt@vgem_basic@create.html
    - bat-arls-5:         [FAIL][20] ([i915#16296]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arls-5/igt@vgem_basic@create.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arls-5/igt@vgem_basic@create.html
    - bat-arlh-2:         [FAIL][22] ([i915#16296]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arlh-2/igt@vgem_basic@create.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arlh-2/igt@vgem_basic@create.html
    - fi-rkl-11600:       [FAIL][24] ([i915#16296]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-rkl-11600/igt@vgem_basic@create.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-rkl-11600/igt@vgem_basic@create.html
    - bat-arlh-3:         [FAIL][26] ([i915#16296]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arlh-3/igt@vgem_basic@create.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arlh-3/igt@vgem_basic@create.html
    - fi-pnv-d510:        [FAIL][28] ([i915#16296]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-pnv-d510/igt@vgem_basic@create.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-pnv-d510/igt@vgem_basic@create.html
    - bat-dg1-7:          [FAIL][30] ([i915#16296]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg1-7/igt@vgem_basic@create.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg1-7/igt@vgem_basic@create.html
    - fi-glk-j4005:       [FAIL][32] ([i915#16296]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-glk-j4005/igt@vgem_basic@create.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-glk-j4005/igt@vgem_basic@create.html
    - bat-adlp-9:         [FAIL][34] ([i915#16296]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-9/igt@vgem_basic@create.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-9/igt@vgem_basic@create.html
    - bat-rpls-4:         [FAIL][36] ([i915#16296]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-rpls-4/igt@vgem_basic@create.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-rpls-4/igt@vgem_basic@create.html
    - fi-cfl-8109u:       [FAIL][38] ([i915#16296]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-8109u/igt@vgem_basic@create.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-8109u/igt@vgem_basic@create.html
    - fi-kbl-7567u:       [FAIL][40] ([i915#16296]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-7567u/igt@vgem_basic@create.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-7567u/igt@vgem_basic@create.html
    - bat-twl-1:          [FAIL][42] ([i915#16296]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-twl-1/igt@vgem_basic@create.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-twl-1/igt@vgem_basic@create.html
    - fi-kbl-8809g:       [FAIL][44] ([i915#16296]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-8809g/igt@vgem_basic@create.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-8809g/igt@vgem_basic@create.html
    - bat-jsl-5:          [FAIL][46] ([i915#16296]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-jsl-5/igt@vgem_basic@create.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-jsl-5/igt@vgem_basic@create.html
    - bat-apl-1:          [FAIL][48] ([i915#16296]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-apl-1/igt@vgem_basic@create.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-apl-1/igt@vgem_basic@create.html
    - bat-rplp-1:         [FAIL][50] ([i915#16296]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-rplp-1/igt@vgem_basic@create.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-rplp-1/igt@vgem_basic@create.html
    - fi-ilk-650:         [FAIL][52] ([i915#16296]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-ilk-650/igt@vgem_basic@create.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-ilk-650/igt@vgem_basic@create.html
    - fi-tgl-1115g4:      [FAIL][54] ([i915#16296]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-tgl-1115g4/igt@vgem_basic@create.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-tgl-1115g4/igt@vgem_basic@create.html
    - fi-cfl-guc:         [FAIL][56] ([i915#16296]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-guc/igt@vgem_basic@create.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-guc/igt@vgem_basic@create.html
    - bat-dg2-9:          [FAIL][58] ([i915#16296]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-9/igt@vgem_basic@create.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-9/igt@vgem_basic@create.html
    - fi-kbl-x1275:       [FAIL][60] ([i915#16296]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-x1275/igt@vgem_basic@create.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-x1275/igt@vgem_basic@create.html
    - bat-adlp-11:        [FAIL][62] ([i915#16296]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-11/igt@vgem_basic@create.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-11/igt@vgem_basic@create.html
    - bat-dg1-6:          [FAIL][64] ([i915#16296]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg1-6/igt@vgem_basic@create.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg1-6/igt@vgem_basic@create.html
    - fi-cfl-8700k:       [FAIL][66] ([i915#16296]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-8700k/igt@vgem_basic@create.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-8700k/igt@vgem_basic@create.html
    - bat-kbl-2:          [FAIL][68] ([i915#16296]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-kbl-2/igt@vgem_basic@create.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-kbl-2/igt@vgem_basic@create.html
    - bat-adlp-6:         [FAIL][70] ([i915#16296]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-6/igt@vgem_basic@create.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-6/igt@vgem_basic@create.html
    - fi-skl-6600u:       [FAIL][72] ([i915#16296]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-skl-6600u/igt@vgem_basic@create.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-skl-6600u/igt@vgem_basic@create.html
    - bat-atsm-1:         [FAIL][74] ([i915#16296]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-atsm-1/igt@vgem_basic@create.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-atsm-1/igt@vgem_basic@create.html
    - bat-twl-2:          [FAIL][76] ([i915#16296]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-twl-2/igt@vgem_basic@create.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-twl-2/igt@vgem_basic@create.html
    - fi-ivb-3770:        [FAIL][78] ([i915#16296]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-ivb-3770/igt@vgem_basic@create.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-ivb-3770/igt@vgem_basic@create.html
    - bat-dg2-14:         [FAIL][80] ([i915#16296]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-14/igt@vgem_basic@create.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-14/igt@vgem_basic@create.html
    - fi-elk-e7500:       [FAIL][82] ([i915#16296]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-elk-e7500/igt@vgem_basic@create.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-elk-e7500/igt@vgem_basic@create.html
    - bat-dg2-8:          [FAIL][84] ([i915#16296]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-8/igt@vgem_basic@create.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-8/igt@vgem_basic@create.html
    - fi-bsw-nick:        [FAIL][86] ([i915#16296]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-nick/igt@vgem_basic@create.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-bsw-nick/igt@vgem_basic@create.html
    - fi-bsw-n3050:       [FAIL][88] ([i915#16296]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-n3050/igt@vgem_basic@create.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-bsw-n3050/igt@vgem_basic@create.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#16296]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8947 -> IGTPW_15300
  * Linux: CI_DRM_18611 -> CI_DRM_18623

  CI-20190529: 20190529
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18623: 740ac771c704c3fa301d7c99952028fe579c7f0b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15300: 55a850dc7b17fd3fb6123750f385fab792f1bbeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/index.html

--===============8538740940634954349==
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
<tr><td><b>Series:</b></td><td>lib: replace libprocps/libproc2 with /proc-based process enumeration</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167838/">https://patchwork.freedesktop.org/series/167838/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8947 -&gt; IGTPW_15300</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15300 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@create:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-mtlp-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-mtlp-9/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arls-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arls-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-hsw-4770/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-hsw-4770/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-mtlp-8/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-mtlp-8/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arls-5/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arls-5/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arlh-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arlh-2/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-rkl-11600/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-rkl-11600/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-arlh-3/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-arlh-3/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-pnv-d510/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-pnv-d510/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg1-7/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg1-7/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-glk-j4005/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-glk-j4005/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-9/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-rpls-4/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-rpls-4/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-8109u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-8109u/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-7567u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-7567u/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-twl-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-twl-1/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-8809g/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-8809g/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-jsl-5/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-jsl-5/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-apl-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-apl-1/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-rplp-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-rplp-1/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-ilk-650/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-ilk-650/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-tgl-1115g4/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-tgl-1115g4/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-guc/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-guc/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-9/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-kbl-x1275/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-kbl-x1275/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-11/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-11/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg1-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg1-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-cfl-8700k/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-cfl-8700k/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-kbl-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-kbl-2/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-adlp-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-adlp-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-skl-6600u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-skl-6600u/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-atsm-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-atsm-1/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-twl-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-twl-2/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-ivb-3770/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-ivb-3770/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-14/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-14/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-elk-e7500/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-elk-e7500/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/bat-dg2-8/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/bat-dg2-8/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-nick/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-bsw-nick/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8947/fi-bsw-n3050/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15300/fi-bsw-n3050/igt@vgem_basic@create.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8947 -&gt; IGTPW_15300</li>
<li>Linux: CI_DRM_18611 -&gt; CI_DRM_18623</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18611: f059886850b97ea5c089703ba3e566a4f847fa19 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18623: 740ac771c704c3fa301d7c99952028fe579c7f0b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15300: 55a850dc7b17fd3fb6123750f385fab792f1bbeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8538740940634954349==--
