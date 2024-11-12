Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1394D41D56
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EFA10E570;
	Tue, 12 Nov 2024 05:52:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E8210E073;
 Tue, 12 Nov 2024 05:52:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2885506979964595638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/chamelium=3A_Reduce_e?=
 =?utf-8?q?did_count_to_avoid_timeout_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 Nov 2024 05:52:11 -0000
Message-ID: <173139073176.2906242.12634121797463565890@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112050442.1854319-1-pranay.samala@intel.com>
In-Reply-To: <20241112050442.1854319-1-pranay.samala@intel.com>
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

--===============2885506979964595638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium: Reduce edid count to avoid timeout (rev7)
URL   : https://patchwork.freedesktop.org/series/140426/
State : success

== Summary ==

CI Bug Log - changes from IGT_8103 -> IGTPW_12076
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12076 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] ([i915#12061]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][3] -> [ABORT][4] ([i915#12061]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - bat-apl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-apl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6] ([i915#7828])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#7828])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-rkl-11600/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg1-7:          NOTRUN -> [SKIP][8] ([i915#7828])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#7828])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-11:        NOTRUN -> [SKIP][11] ([i915#7828])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-rpls-4:         NOTRUN -> [SKIP][12] ([i915#7828])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-7567u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-8809g/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-ilk-650:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-ilk-650/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] ([i915#7828])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] ([i915#7828] / [i915#9792])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg1-6:          NOTRUN -> [SKIP][21] ([i915#12311])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-twl-2:          NOTRUN -> [SKIP][22] ([i915#11151])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-8700k/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-14:         NOTRUN -> [SKIP][25] ([i915#7828])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-bsw-nick/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-kbl-2:          NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-kbl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-6:         NOTRUN -> [SKIP][28] ([i915#7828])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-atsm-1:         NOTRUN -> [SKIP][29] ([i915#6078])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-atsm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-jsl-3:          NOTRUN -> [SKIP][30] ([i915#7828])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#7828])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][34] ([i915#7828])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-8:          NOTRUN -> [SKIP][36] ([i915#7828])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlm-1:         NOTRUN -> [SKIP][38] ([i915#7828] / [i915#9900])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-jsl-1:          NOTRUN -> [SKIP][39] ([i915#7828])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-glk-j4005/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-9:         NOTRUN -> [SKIP][42] ([i915#7828])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adls-6:         NOTRUN -> [SKIP][43] ([i915#7828])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-twl-1:          NOTRUN -> [SKIP][44] ([i915#11151])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-twl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][45] ([i915#9197]) -> [PASS][46] +2 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8103 -> IGTPW_12076
  * Linux: CI_DRM_15674 -> CI_DRM_15675

  CI-20190529: 20190529
  CI_DRM_15674: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15675: c8443e3741e360704258967feb87d253d8f0864a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12076: 20710e75ec985749dae02b6b492eadca67d75a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/index.html

--===============2885506979964595638==
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
<tr><td><b>Series:</b></td><td>tests/chamelium: Reduce edid count to avoid timeout (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140426/">https://patchwork.freedesktop.org/series/140426/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8103 -&gt; IGTPW_12076</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12076 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-apl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-rplp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-rkl-11600/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg1-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-x1275/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-rpls-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-8109u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-7567u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-8809g/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-ilk-650/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-tgl-1115g4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-twl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-cfl-8700k/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-blb-e6850/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-14/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-bsw-nick/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-kbl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-atsm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-jsl-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-hsw-4770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-ivb-3770/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-elk-e7500/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-kbl-guc/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlm-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-jsl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-pnv-d510/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/fi-glk-j4005/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adlp-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-adls-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-twl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8103/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12076/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8103 -&gt; IGTPW_12076</li>
<li>Linux: CI_DRM_15674 -&gt; CI_DRM_15675</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15674: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15675: c8443e3741e360704258967feb87d253d8f0864a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12076: 20710e75ec985749dae02b6b492eadca67d75a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2885506979964595638==--
