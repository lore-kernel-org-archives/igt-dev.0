Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D0D5A6E7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 07:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3FB10E6B9;
	Tue, 26 Nov 2024 07:09:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3F010E6B9;
 Tue, 26 Nov 2024 07:09:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdsc=3A_?=
 =?utf-8?q?Add_meaningfull_skip_message_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 07:09:13 -0000
Message-ID: <173260495386.3236041.9820994835026034299@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126054658.1951121-1-pranay.samala@intel.com>
In-Reply-To: <20241126054658.1951121-1-pranay.samala@intel.com>
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

Series: tests/intel/kms_dsc: Add meaningfull skip message (rev2)
URL   : https://patchwork.freedesktop.org/series/141738/
State : success

== Summary ==

CI Bug Log - changes from IGT_8125 -> IGTPW_12197
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8125 and IGTPW_12197:

### New IGT tests (18) ###

  * igt@kms_dsc@dsc-basic@pipe-a-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12197 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          NOTRUN -> [ABORT][3] ([i915#12919]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  
#### Possible fixes ####

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][4] ([i915#3555] / [i915#3840] / [i915#9886]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][6] ([i915#3555] / [i915#3840]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][8] ([i915#3555] / [i915#3840]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][10] ([i915#3555] / [i915#3840]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-adlp-6:         [SKIP][12] ([i915#3555] / [i915#3840]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-adlp-6/igt@kms_dsc@dsc-basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-adlp-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][14] ([i915#3555] / [i915#9886]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][16] ([i915#9886]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][18] ([i915#3555] / [i915#3840]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][20] ([i915#3555] / [i915#3840]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - {bat-mtlp-9}:       [SKIP][22] ([i915#3555] / [i915#3840] / [i915#9159]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - {bat-arls-6}:       [SKIP][24] ([i915#9886]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][26] ([i915#3555] / [i915#3840] / [i915#9159]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][28] ([i915#3555] / [i915#3840]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          [SKIP][30] ([i915#3555] / [i915#9886]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-jsl-1/igt@kms_dsc@dsc-basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][32] ([i915#9886]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][34] ([i915#3555] / [i915#3840]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][36] ([i915#3555] / [i915#3840]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8125 -> IGTPW_12197
  * Linux: CI_DRM_15743 -> CI_DRM_15744

  CI-20190529: 20190529
  CI_DRM_15743: 6510562075d8541c218e72188f9ef339f8ba371f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15744: ae312905c5a9fc7ce599a74422f068725101c475 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12197: 12197
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12197/index.html
