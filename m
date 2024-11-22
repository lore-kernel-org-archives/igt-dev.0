Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C49E65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1F610E0D8;
	Fri, 22 Nov 2024 08:01:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAD110E0D8;
 Fri, 22 Nov 2024 08:01:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fbig=5Ff?=
 =?utf-8?q?b=3A_Intel_display_version_20_onwards_doesn=27t_do_hflip_with_til?=
 =?utf-8?q?e4_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 08:01:29 -0000
Message-ID: <173226248912.1624855.7766671639563047419@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122053400.1931176-1-pranay.samala@intel.com>
In-Reply-To: <20241122053400.1931176-1-pranay.samala@intel.com>
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

== Series Details ==

Series: tests/intel/kms_big_fb: Intel display version 20 onwards doesn't do hflip with tile4 (rev2)
URL   : https://patchwork.freedesktop.org/series/141478/
State : success

== Summary ==

CI Bug Log - changes from IGT_8121 -> IGTPW_12170
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12170:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - {bat-mtlp-9}:       NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12170 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adls-6/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - bat-adlp-11:        NOTRUN -> [SKIP][7] ([i915#10470])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adlp-11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - fi-hsw-4770:        NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-hsw-4770/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#4538] / [i915#5286]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adls-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-jsl-1:          NOTRUN -> [SKIP][10] ([i915#5286]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-jsl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-arlh-2:         NOTRUN -> [SKIP][11] ([i915#11346]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-arlh-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#5286]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-rkl-11600/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-pnv-d510/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-dg1-7:          NOTRUN -> [SKIP][14] ([i915#4538] / [i915#5286]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-dg1-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-glk-j4005/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-adlp-9:         NOTRUN -> [SKIP][16] ([i915#4538] / [i915#5286]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][17] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-kbl-x1275/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-rpls-4:         NOTRUN -> [SKIP][18] ([i915#4538] / [i915#5286]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-rpls-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][19] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-cfl-8109u/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][20] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-kbl-7567u/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][21] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-kbl-8809g/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-apl-1:          NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-apl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-rplp-1:         NOTRUN -> [SKIP][23] ([i915#4538] / [i915#5286]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-rplp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-ilk-650:         NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-ilk-650/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][25] ([i915#5286]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-tgl-1115g4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][26] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-cfl-guc/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][27] ([i915#9792]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-adlp-11:        NOTRUN -> [SKIP][28] ([i915#10470] / [i915#10501]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adlp-11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - bat-dg1-6:          NOTRUN -> [SKIP][29] ([i915#12311]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-dg1-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][30] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-cfl-8700k/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][31] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-blb-e6850/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - bat-jsl-3:          NOTRUN -> [SKIP][32] ([i915#5286]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-jsl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - bat-twl-2:          NOTRUN -> [SKIP][33] ([i915#11153]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-twl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-ivb-3770/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][35] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-elk-e7500/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][36] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-bsw-nick/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-kbl-guc/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - bat-adlm-1:         NOTRUN -> [SKIP][38] ([i915#9900]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adlm-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - bat-kbl-2:          NOTRUN -> [SKIP][39] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-kbl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - bat-adlp-6:         NOTRUN -> [SKIP][40] ([i915#4538] / [i915#5286]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][41] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/fi-skl-6600u/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - {bat-mtlp-9}:       [INCOMPLETE][42] ([i915#12601]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-mtlp-9/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][44] ([i915#12903]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][46] ([i915#12061]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [DMESG-WARN][48] ([i915#12253]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][50] ([i915#9197]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - bat-apl-1:          [DMESG-WARN][52] ([i915#12921]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-apl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/bat-apl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11153]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11153
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12601]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12601
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8121 -> IGTPW_12170
  * Linux: CI_DRM_15725 -> CI_DRM_15727

  CI-20190529: 20190529
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15727: bb17c42521f57b592e9ad49daca1f9f9045d3199 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12170: 12170
  IGT_8121: 8121

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/index.html
