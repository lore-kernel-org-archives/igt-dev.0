Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF2EE7716E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 23:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195E10EFD8;
	Thu,  5 Dec 2024 23:24:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4210EFD8;
 Thu,  5 Dec 2024 23:24:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_prevent_consecutive_unplu?=
 =?utf-8?q?g?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Dec 2024 23:24:04 -0000
Message-ID: <173344104455.3134186.13078186113738625092@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
In-Reply-To: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

Series: prevent consecutive unplug
URL   : https://patchwork.freedesktop.org/series/142152/
State : success

== Summary ==

CI Bug Log - changes from IGT_8139 -> IGTPW_12252
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): bat-mtlp-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12252:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-twl-2/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - bat-adlp-6:         NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-11/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-14/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-dg2-8:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - {bat-arls-6}:       NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-arls-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-adls-6:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-adls-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-arls-5:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-arls-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-rkl-11600/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-arlh-3:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-arlh-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-dg1-7:          NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg1-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-adlp-9:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-adlp-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-rpls-4:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-rpls-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-twl-1:          NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-twl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-rplp-1:         NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-rplp-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-tgl-1115g4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-dg2-9:          NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-adlp-11:        NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-adlp-11/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html

  
New tests
---------

  New tests have been introduced between IGT_8139 and IGTPW_12252:

### New IGT tests (2) ###

  * igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12252 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][21] -> [FAIL][22] ([i915#12903])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-twl-2:          [PASS][23] -> [ABORT][24] ([i915#12435])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-twl-2/igt@i915_selftest@live.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-twl-2:          [PASS][25] -> [ABORT][26] ([i915#9500])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-twl-2/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-twl-2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][27] -> [ABORT][28] ([i915#12061]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - bat-dg2-13:         [PASS][29] -> [FAIL][30] ([i915#12440])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * {igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe} (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][31] ([i915#12311]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg1-6/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-cfl-8700k/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-blb-e6850/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - bat-kbl-2:          NOTRUN -> [SKIP][34] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-kbl-2/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html
    - bat-jsl-3:          NOTRUN -> [SKIP][35] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-jsl-3/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][36] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-ivb-3770/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][37] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-elk-e7500/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-bsw-nick/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-kbl-guc/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-adlm-1:         NOTRUN -> [SKIP][40] ([i915#9900]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-adlm-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][41] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-hsw-4770/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-jsl-1:          NOTRUN -> [SKIP][42] +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-jsl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-arlh-2:         NOTRUN -> [SKIP][43] ([i915#11346]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-arlh-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][44] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-glk-j4005/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][45] +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-cfl-8109u/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-kbl-7567u/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][47] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-kbl-8809g/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-ilk-650:         NOTRUN -> [SKIP][48] +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-ilk-650/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-cfl-guc/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][50] +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/fi-kbl-x1275/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][51] ([i915#9197]) -> [PASS][52] +3 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12440]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8139 -> IGTPW_12252

  CI-20190529: 20190529
  CI_DRM_15796: 1b7746f770882ce40dacae683e8e65657c40c2b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12252: 12252
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/index.html
