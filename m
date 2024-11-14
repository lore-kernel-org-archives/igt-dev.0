Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2959D68B33
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEDE10E81E;
	Thu, 14 Nov 2024 16:12:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFEB10E81F;
 Thu, 14 Nov 2024 16:12:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8582156057865682018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/xe=5Feudebug=3A_Conve?=
 =?utf-8?q?rt_comments_to_be_C-styled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Grzegorzek" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Nov 2024 16:12:54 -0000
Message-ID: <173160077469.4127496.1171654591512885718@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114144156.82071-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20241114144156.82071-1-dominik.grzegorzek@intel.com>
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

--===============8582156057865682018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_eudebug: Convert comments to be C-styled
URL   : https://patchwork.freedesktop.org/series/141357/
State : success

== Summary ==

CI Bug Log - changes from IGT_8111 -> IGTPW_12107
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/index.html

Participating hosts (46 -> 46)
------------------------------

  Additional (1): bat-mtlp-9 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12107 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-adlp-6:         [DMESG-WARN][1] ([i915#12253]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-adlp-6/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-adlp-6/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-arls-5:         [ABORT][3] ([i915#10341]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-5/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-5/igt@i915_selftest@live.html
    - {bat-arls-6}:       [DMESG-FAIL][5] ([i915#10341]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-6/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][7] ([i915#12061]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-adlp-6:         [INCOMPLETE][9] ([i915#9413]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-adlp-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-adlp-6/igt@i915_selftest@live@workarounds.html
    - {bat-arls-6}:       [DMESG-FAIL][11] ([i915#9500]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [DMESG-WARN][13] ([i915#12253]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12799]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8111 -> IGTPW_12107

  CI-20190529: 20190529
  CI_DRM_15697: 92018261c565a3040d58359e890ce947c29907ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12107: a02e78c646cebed41a0b6d1957ad6257b74309bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/index.html

--===============8582156057865682018==
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
<tr><td><b>Series:</b></td><td>tests/xe_eudebug: Convert comments to be C-styled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141357/">https://patchwork.freedesktop.org/series/141357/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8111 -&gt; IGTPW_12107</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/index.html</p>
<h2>Participating hosts (46 -&gt; 46)</h2>
<p>Additional (1): bat-mtlp-9 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12107 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-adlp-6/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-adlp-6/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-5/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-5/igt@i915_selftest@live.html">PASS</a></li>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-6/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-6/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-adlp-6/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-adlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8111/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12107/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8111 -&gt; IGTPW_12107</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15697: 92018261c565a3040d58359e890ce947c29907ed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12107: a02e78c646cebed41a0b6d1957ad6257b74309bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8582156057865682018==--
