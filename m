Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FABE77197
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 01:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2638110E7D0;
	Wed,  8 Jan 2025 01:40:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CEA10E7D0;
 Wed,  8 Jan 2025 01:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5835543650647965340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Remove_redundant_hotplug_?=
 =?utf-8?q?detection_assertion_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Jan 2025 01:40:28 -0000
Message-ID: <173630042890.1135633.11787104860185965473@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107205434.969797-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250107205434.969797-1-ramanaidu.naladala@intel.com>
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

--===============5835543650647965340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove redundant hotplug detection assertion (rev2)
URL   : https://patchwork.freedesktop.org/series/143141/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8179 -> IGTPW_12399
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12399 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12399, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12399:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - bat-adlp-9:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-twl-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-twl-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-11/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-rpls-4:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rpls-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-dg2-14:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-14/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-arls-5:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-rplp-1:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rplp-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-rkl-11600/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-jsl-3:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-adlp-11:        NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-11/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-dg2-8:          NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-adls-6:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-jsl-1:          NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-arlh-3:         NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-dg1-7:          NOTRUN -> [SKIP][17] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - {bat-arls-6}:       NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  
Known issues
------------

  Here are the changes found in IGTPW_12399 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-cfl-8109u:       [PASS][20] -> [DMESG-WARN][21] ([i915#11621])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8179/fi-cfl-8109u/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8109u/igt@i915_module_load@load.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-7567u/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8700k/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-8809g/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-kbl-2:          NOTRUN -> [SKIP][25] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-kbl-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-arlh-2:         NOTRUN -> [SKIP][26] ([i915#11346]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-guc/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-adls-6:         NOTRUN -> [SKIP][28] ([i915#7828]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adls-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - fi-ilk-650:         NOTRUN -> [SKIP][29] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-jsl-1:          NOTRUN -> [SKIP][30] ([i915#7828]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][31] ([i915#7828]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-tgl-1115g4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][32] +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-guc/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][33] ([i915#7828] / [i915#9792]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-adlp-9:         NOTRUN -> [SKIP][34] ([i915#7828]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-arls-5:         NOTRUN -> [SKIP][35] ([i915#7828]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-arlh-2:         NOTRUN -> [SKIP][36] ([i915#11151] / [i915#11346]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][37] ([i915#7828]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-rkl-11600/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - fi-ivb-3770:        NOTRUN -> [SKIP][38] +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-dg1-6:          NOTRUN -> [SKIP][39] ([i915#12311]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][40] +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][41] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#9792]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - bat-arlh-3:         NOTRUN -> [SKIP][43] ([i915#11151]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-dg1-7:          NOTRUN -> [SKIP][44] ([i915#7828]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-jsl-3:          NOTRUN -> [SKIP][45] ([i915#7828]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-twl-2:          NOTRUN -> [SKIP][46] ([i915#11151]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-dg2-11:         NOTRUN -> [SKIP][47] ([i915#7828]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][48] +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][49] +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-rpls-4:         NOTRUN -> [SKIP][50] ([i915#7828]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][51] +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-dg2-14:         NOTRUN -> [SKIP][52] ([i915#7828]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-dg2-8:          NOTRUN -> [SKIP][53] ([i915#7828]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-rplp-1:         NOTRUN -> [SKIP][54] ([i915#7828]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-adlp-11:        NOTRUN -> [SKIP][55] ([i915#7828]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][56] ([i915#7828]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - bat-dg1-6:          NOTRUN -> [SKIP][57] ([i915#12311] / [i915#7828]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8179 -> IGTPW_12399
  * Linux: CI_DRM_15915 -> CI_DRM_15920

  CI-20190529: 20190529
  CI_DRM_15915: 89042e0bb417f4d67280e1d7fa9bbcca51734571 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15920: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12399: 4a988bee49dc8aa63788fc23ca223ff62aec856c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/index.html

--===============5835543650647965340==
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
<tr><td><b>Series:</b></td><td>Remove redundant hotplug detection assertion (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143141/">https://patchwork.freedesktop.org/series/143141/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8179 -&gt; IGTPW_12399</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12399 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12399, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12399:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-twl-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-11/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rpls-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-14/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rplp-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-rkl-11600/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-11/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>{bat-arls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12399 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8179/fi-cfl-8109u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8109u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-7567u/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8700k/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-8809g/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-kbl-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-guc/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adls-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-tgl-1115g4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-guc/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arls-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-rkl-11600/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-arlh-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12399/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8179 -&gt; IGTPW_12399</li>
<li>Linux: CI_DRM_15915 -&gt; CI_DRM_15920</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15915: 89042e0bb417f4d67280e1d7fa9bbcca51734571 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15920: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12399: 4a988bee49dc8aa63788fc23ca223ff62aec856c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5835543650647965340==--
