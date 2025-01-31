Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2774C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 19:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C60A10E430;
	Fri, 31 Jan 2025 19:30:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98C010E1D1;
 Fri, 31 Jan 2025 19:30:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6195180103110940927=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=3A_Fre?=
 =?utf-8?q?e_up_CRC_resources?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jan 2025 19:30:46 -0000
Message-ID: <173835184668.3301340.1479008381020638231@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
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

--===============6195180103110940927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic: Free up CRC resources
URL   : https://patchwork.freedesktop.org/series/144203/
State : success

== Summary ==

CI Bug Log - changes from IGT_8219 -> IGTPW_12529
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8219 and IGTPW_12529:

### New IGT tests (1) ###

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  

Known issues
------------

  Here are the changes found in IGTPW_12529 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@plane-immutable-zpos:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-8809g/igt@kms_atomic@plane-immutable-zpos.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-bsw-nick/igt@kms_atomic@plane-immutable-zpos.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-guc/igt@kms_atomic@plane-immutable-zpos.html
    - bat-atsm-1:         NOTRUN -> [SKIP][4] ([i915#6078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-atsm-1/igt@kms_atomic@plane-immutable-zpos.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#9792])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-mtlp-6/igt@kms_atomic@plane-immutable-zpos.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-x1275/igt@kms_atomic@plane-immutable-zpos.html
    - bat-adlp-11:        NOTRUN -> [SKIP][7] ([i915#10470] / [i915#10501])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-adlp-11/igt@kms_atomic@plane-immutable-zpos.html
    - bat-dg1-6:          NOTRUN -> [SKIP][8] ([i915#12311])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-dg1-6/igt@kms_atomic@plane-immutable-zpos.html
    - bat-kbl-2:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-kbl-2/igt@kms_atomic@plane-immutable-zpos.html
    - bat-arlh-2:         NOTRUN -> [SKIP][10] ([i915#11346])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-arlh-2/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1:
    - bat-twl-1:          NOTRUN -> [DMESG-WARN][11] ([i915#1982]) +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-twl-1/igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8219 -> IGTPW_12529

  CI-20190529: 20190529
  CI_DRM_16052: 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12529: eada2b49181e06e8d3ed1916acea2728b8ffc878 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/index.html

--===============6195180103110940927==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic: Free up CRC resources</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144203/">https://patchwork.freedesktop.org/series/144203/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8219 -&gt; IGTPW_12529</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8219 and IGTPW_12529:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic@plane-immutable-zpos@pipe-a-dp-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12529 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-8809g/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-bsw-nick/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-guc/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a></li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-atsm-1/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-mtlp-6/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/fi-kbl-x1275/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-adlp-11/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-dg1-6/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>)</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-kbl-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-arlh-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12529/bat-twl-1/igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8219 -&gt; IGTPW_12529</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16052: 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12529: eada2b49181e06e8d3ed1916acea2728b8ffc878 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6195180103110940927==--
