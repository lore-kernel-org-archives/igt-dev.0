Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104ACD3C549
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 04:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167A10E0F5;
	Fri, 18 Oct 2024 04:46:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF7710E0F5;
 Fri, 18 Oct 2024 04:46:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4055079769180579781=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/chamelium/kms=5Fchamelium=5Fedid=3A_Use_ex?=
 =?utf-8?q?tended_flag_to_reduce_the_number_of_edid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Oct 2024 04:46:09 -0000
Message-ID: <172922676976.1280877.324439785965696858@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018035914.1740924-1-pranay.samala@intel.com>
In-Reply-To: <20241018035914.1740924-1-pranay.samala@intel.com>
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

--===============4055079769180579781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the number of edid
URL   : https://patchwork.freedesktop.org/series/140143/
State : success

== Summary ==

CI Bug Log - changes from IGT_8078 -> IGTPW_11935
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11935:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - {bat-dg1-6}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  
Known issues
------------

  Here are the changes found in IGTPW_11935 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - bat-rplp-1:         NOTRUN -> [SKIP][2] ([i915#7828])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-arlh-2:         NOTRUN -> [SKIP][3] ([i915#11151] / [i915#11346])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#7828])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-rkl-11600/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg1-7:          NOTRUN -> [SKIP][5] ([i915#7828])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-11:        NOTRUN -> [SKIP][7] ([i915#7828])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-rpls-4:         NOTRUN -> [SKIP][8] ([i915#7828])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-7567u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-arls-2:         NOTRUN -> [SKIP][11] ([i915#7828])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-ilk-650:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-ilk-650/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][13] ([i915#7828])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#7828] / [i915#9792])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-twl-2:          NOTRUN -> [SKIP][16] ([i915#11151])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-8700k/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-14:         NOTRUN -> [SKIP][19] ([i915#7828])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-bsw-nick/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-kbl-2:          NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-kbl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-6:         NOTRUN -> [SKIP][22] ([i915#7828])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-atsm-1:         NOTRUN -> [SKIP][23] ([i915#6078])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-atsm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-jsl-3:          NOTRUN -> [SKIP][24] ([i915#7828])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#7828])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][28] ([i915#7828])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-8:          NOTRUN -> [SKIP][30] ([i915#7828])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlm-1:         NOTRUN -> [SKIP][32] ([i915#7828])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-jsl-1:          NOTRUN -> [SKIP][33] ([i915#7828])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-arls-1:         NOTRUN -> [SKIP][34] ([i915#7828])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-bsw-n3050/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-glk-j4005/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-9:         NOTRUN -> [SKIP][38] ([i915#7828])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adls-6:         NOTRUN -> [SKIP][39] ([i915#7828])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-twl-1:          NOTRUN -> [SKIP][40] ([i915#11151])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-twl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - {bat-arlh-3}:       [ABORT][41] ([i915#12133]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arlh-3/igt@i915_selftest@live.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-3/igt@i915_selftest@live.html
    - bat-arls-2:         [ABORT][43] ([i915#12133]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arls-2/igt@i915_selftest@live.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - {bat-arlh-3}:       [ABORT][45] ([i915#12061]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-2:         [ABORT][47] ([i915#12061]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arls-2/igt@i915_selftest@live@workarounds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8078 -> IGTPW_11935
  * Linux: CI_DRM_15543 -> CI_DRM_15554

  CI-20190529: 20190529
  CI_DRM_15543: 81420006f741f9783adea6ab5620ce54697f1b20 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15554: 8059169563b0ed0040968e476d451c436274e0ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11935: 11935
  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/index.html

--===============4055079769180579781==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the number of edid</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140143/">https://patchwork.freedesktop.org/series/140143/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8078 -&gt; IGTPW_11935</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11935:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:<ul>
<li>{bat-dg1-6}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11935 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-rkl-11600/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-7567u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-ilk-650/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-cfl-8700k/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-bsw-nick/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-kbl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-atsm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-kbl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-bsw-n3050/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/fi-glk-j4005/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-twl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arls-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8078/bat-arls-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11935/bat-arls-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8078 -&gt; IGTPW_11935</li>
<li>Linux: CI_DRM_15543 -&gt; CI_DRM_15554</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15543: 81420006f741f9783adea6ab5620ce54697f1b20 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15554: 8059169563b0ed0040968e476d451c436274e0ed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11935: 11935<br />
  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4055079769180579781==--
