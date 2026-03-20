Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736DB1093183
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 07:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C82E10E00D;
	Fri, 20 Mar 2026 07:51:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43FD10E00D;
 Fri, 20 Mar 2026 07:51:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1438960447246359035=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms/feature=5Fdiscovery?=
 =?utf-8?q?=3A_Add_VRR_capability_subtest_per_output_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Mar 2026 07:51:04 -0000
Message-ID: <177399306471.378555.197955718503041917@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
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

--===============1438960447246359035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms/feature_discovery: Add VRR capability subtest per output (rev2)
URL   : https://patchwork.freedesktop.org/series/160389/
State : success

== Summary ==

CI Bug Log - changes from IGT_8812 -> IGTPW_14817
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_14817 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dp6:
    - bat-mtlp-9:         [FAIL][7] ([i915#15850]) -> [FAIL][8] ([i915#15849])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arlh-2:         [SKIP][9] ([i915#11346]) -> [SKIP][10] ([i915#11346] / [i915#15856]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arlh-2:         [SKIP][11] ([i915#11346]) -> [SKIP][12] ([i915#11346] / [i915#15857])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-arlh-2:         [SKIP][13] ([i915#11346]) -> [SKIP][14] ([i915#11346] / [i915#15855]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15849
  [i915#15850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15850
  [i915#15855]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15855
  [i915#15856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15856
  [i915#15857]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15857


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8812 -> IGTPW_14817

  CI-20190529: 20190529
  CI_DRM_18178: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14817: 3762437a0ac9cbd66f02cd0fc7dcbc5281485aeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8812: 8812

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/index.html

--===============1438960447246359035==
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
<tr><td><b>Series:</b></td><td>kms/feature_discovery: Add VRR capability subtest per output (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160389/">https://patchwork.freedesktop.org/series/160389/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8812 -&gt; IGTPW_14817</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14817 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp6:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15850">i915#15850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15849">i915#15849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15856">i915#15856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15857">i915#15857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8812/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14817/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15855">i915#15855</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8812 -&gt; IGTPW_14817</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18178: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14817: 3762437a0ac9cbd66f02cd0fc7dcbc5281485aeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8812: 8812</p>

</body>
</html>

--===============1438960447246359035==--
