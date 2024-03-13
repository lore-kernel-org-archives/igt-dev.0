Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A1FC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 18:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83F10F83E;
	Wed, 13 Mar 2024 18:05:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD7110F83C;
 Wed, 13 Mar 2024 18:05:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6630060098917343154=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_New_rotation_test_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Mar 2024 18:05:28 -0000
Message-ID: <171035312817.732599.6227533272059818858@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
In-Reply-To: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
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

--===============6630060098917343154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New rotation test (rev2)
URL   : https://patchwork.freedesktop.org/series/131011/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14426 -> IGTPW_10825
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/index.html

Participating hosts (35 -> 30)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (6): bat-dg1-7 fi-snb-2520m fi-glk-j4005 bat-adln-1 bat-jsl-1 bat-arls-2 

Known issues
------------

  Here are the changes found in IGTPW_10825 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] +39 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@coherency:
    - bat-dg2-9:          [PASS][3] -> [ABORT][4] ([i915#10366])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14426/bat-dg2-9/igt@i915_selftest@live@coherency.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-dg2-9/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [PASS][5] -> [DMESG-WARN][6] ([i915#5591])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14426/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7759 -> IGTPW_10825

  CI-20190529: 20190529
  CI_DRM_14426: 72f447f984cf5526e6ad32a6e2770124c67d59d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10825: 10825
  IGT_7759: 7759


Testlist changes
----------------

+igt@kms_rotation@rotations

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/index.html

--===============6630060098917343154==
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
<tr><td><b>Series:</b></td><td>New rotation test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131011/">https://patchwork.freedesktop.org/series/131011/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14426 -&gt; IGTPW_10825</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/index.html</p>
<h2>Participating hosts (35 -&gt; 30)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (6): bat-dg1-7 fi-snb-2520m fi-glk-j4005 bat-adln-1 bat-jsl-1 bat-arls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10825 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14426/bat-dg2-9/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-dg2-9/igt@i915_selftest@live@coherency.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14426/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10825/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7759 -&gt; IGTPW_10825</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14426: 72f447f984cf5526e6ad32a6e2770124c67d59d3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10825: 10825<br />
  IGT_7759: 7759</p>
<h2>Testlist changes</h2>
<p>+igt@kms_rotation@rotations</p>

</body>
</html>

--===============6630060098917343154==--
