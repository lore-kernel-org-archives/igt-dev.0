Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Jul 2021 16:39:17 -0000
Message-ID: <162584875720.9813.401401467609050839@emeril.freedesktop.org>
References: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVkRTQyBB?=
 =?utf-8?q?DLP_related_patches_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0258217467=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0258217467==
Content-Type: multipart/alternative;
 boundary="===============1407643838998230588=="

--===============1407643838998230588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VDSC ADLP related patches (rev3)
URL   : https://patchwork.freedesktop.org/series/92324/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10326 -> IGTPW_6006
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html

Known issues
------------

  Here are the changes found in IGTPW_6006 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic:
    - fi-bdw-gvtdvm:      [PASS][1] -> [DMESG-WARN][2] ([i915#3428])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10326/fi-bdw-gvtdvm/igt@gem_ctx_exec@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/fi-bdw-gvtdvm/igt@gem_ctx_exec@basic.html

  * igt@runner@aborted:
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][3] ([i915#3428])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/fi-bdw-gvtdvm/igt@runner@aborted.html

  
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428


Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-5557u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6134 -> IGTPW_6006

  CI-20190529: 20190529
  CI_DRM_10326: 8fa21d35c119a14a3cb14035dde5a9cc7e2321d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6006: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dp_dsc@basic-dsc-enable
+igt@kms_dp_dsc@xrgb8888-dsc-compression
-igt@kms_dp_dsc@basic-dsc-enable-dp
-igt@kms_dp_dsc@basic-dsc-enable-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html

--===============1407643838998230588==
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
<tr><td><b>Series:</b></td><td>VDSC ADLP related patches (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92324/">https://patchwork.freedesktop.org/series/92324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10326 -&gt; IGTPW_6006</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6006 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10326/fi-bdw-gvtdvm/igt@gem_ctx_exec@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/fi-bdw-gvtdvm/igt@gem_ctx_exec@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/fi-bdw-gvtdvm/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-5557u fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6134 -&gt; IGTPW_6006</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10326: 8fa21d35c119a14a3cb14035dde5a9cc7e2321d2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6006: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6006/index.html<br />
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dp_dsc@basic-dsc-enable<br />
+igt@kms_dp_dsc@xrgb8888-dsc-compression<br />
-igt@kms_dp_dsc@basic-dsc-enable-dp<br />
-igt@kms_dp_dsc@basic-dsc-enable-edp</p>

</body>
</html>

--===============1407643838998230588==--

--===============0258217467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0258217467==--
