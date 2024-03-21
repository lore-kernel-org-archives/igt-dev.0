Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D508C6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 19:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92D9112073;
	Thu, 21 Mar 2024 19:45:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58014112082;
 Thu, 21 Mar 2024 19:45:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5125693988747003981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib=3A_Inline_igt=5Fx86=5Ff?=
 =?utf-8?q?eatures=28=29_into_ifunc_resolvers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Turner" <mattst88@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 19:45:32 -0000
Message-ID: <171105033235.941104.15129473973805595278@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304221800.1161896-1-mattst88@gmail.com>
In-Reply-To: <20240304221800.1161896-1-mattst88@gmail.com>
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

--===============5125693988747003981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Inline igt_x86_features() into ifunc resolvers (rev2)
URL   : https://patchwork.freedesktop.org/series/130696/
State : success

== Summary ==

CI Bug Log - changes from IGT_7775 -> IGTPW_10876
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html

Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-tgl-1115g4 fi-apl-guc fi-snb-2520m fi-kbl-8809g bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_10876 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [PASS][1] -> [DMESG-WARN][2] ([i915#5591])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-11:         [FAIL][3] ([i915#10378]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
    - bat-dg2-14:         [FAIL][5] ([i915#10378]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlm-1:         [ABORT][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-adlm-1/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-adlm-1/igt@i915_selftest@live@hangcheck.html

  
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7775 -> IGTPW_10876

  CI-20190529: 20190529
  CI_DRM_14463: 0cd99ca612f004f19c35f4966a584f0a729bbc31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@2x-modeset
-igt@kms_big_joiner@basic-force-joiner
-igt@kms_big_joiner@invalid-modeset-force-joiner

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html

--===============5125693988747003981==
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
<tr><td><b>Series:</b></td><td>lib: Inline igt_x86_features() into ifunc resolvers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130696/">https://patchwork.freedesktop.org/series/130696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7775 -&gt; IGTPW_10876</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-tgl-1115g4 fi-apl-guc fi-snb-2520m fi-kbl-8809g bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10876 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7775/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7775 -&gt; IGTPW_10876</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14463: 0cd99ca612f004f19c35f4966a584f0a729bbc31 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10876/index.html<br />
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@2x-modeset<br />
-igt@kms_big_joiner@basic-force-joiner<br />
-igt@kms_big_joiner@invalid-modeset-force-joiner</p>

</body>
</html>

--===============5125693988747003981==--
