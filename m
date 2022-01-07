Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4373857925938186728=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Jan 2022 18:13:51 -0000
Message-ID: <164157923183.24391.13352192958010291516@emeril.freedesktop.org>
References: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fuserptr=5Fblits=3A_Skip_sd-probe_test_for_discrete_p?=
 =?utf-8?q?latforms?=
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
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4373857925938186728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_userptr_blits: Skip sd-probe test for discrete platforms
URL   : https://patchwork.freedesktop.org/series/98615/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11054 -> IGTPW_6545
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html

Participating hosts (45 -> 36)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (10): bat-dg1-6 bat-dg1-5 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6545 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][1] -> [DMESG-WARN][2] ([i915#4269])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11054/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +57 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Warnings ####

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [FAIL][4] ([i915#4547]) -> [INCOMPLETE][5] ([i915#4838])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11054/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6325 -> IGTPW_6545

  CI-20190529: 20190529
  CI_DRM_11054: fa1b08e2ffac9e40a4e0ce8dc17ff11a1163f560 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html

--===============4373857925938186728==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_userptr_blits: Skip sd-probe test for discrete platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98615/">https://patchwork.freedesktop.org/series/98615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11054 -&gt; IGTPW_6545</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html</p>
<h2>Participating hosts (45 -&gt; 36)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (10): bat-dg1-6 bat-dg1-5 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6545 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11054/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11054/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4838">i915#4838</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6325 -&gt; IGTPW_6545</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11054: fa1b08e2ffac9e40a4e0ce8dc17ff11a1163f560 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6545/index.html<br />
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4373857925938186728==--
