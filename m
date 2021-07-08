Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 08 Jul 2021 20:48:19 -0000
Message-ID: <162577729929.32075.12118243117346966478@emeril.freedesktop.org>
References: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVkRTQyBB?=
 =?utf-8?q?DLP_related_patches_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1370067855=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1370067855==
Content-Type: multipart/alternative;
 boundary="===============0748573478243811972=="

--===============0748573478243811972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VDSC ADLP related patches (rev2)
URL   : https://patchwork.freedesktop.org/series/92324/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10319 -> IGTPW_6000
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html

Known issues
------------

  Here are the changes found in IGTPW_6000 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2] ([i915#1982] / [i915#262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6132 -> IGTPW_6000

  CI-20190529: 20190529
  CI_DRM_10319: 4b4a9f252ab44da921f5e0067ec26d29e5c43d8e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6000: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dp_dsc@basic-dsc-enable
+igt@kms_dp_dsc@xrgb8888-dsc-compression
-igt@kms_dp_dsc@basic-dsc-enable-dp
-igt@kms_dp_dsc@basic-dsc-enable-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html

--===============0748573478243811972==
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
<tr><td><b>Series:</b></td><td>VDSC ADLP related patches (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92324/">https://patchwork.freedesktop.org/series/92324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10319 -&gt; IGTPW_6000</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6000 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@debugfs_test@read_all_entries:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6132 -&gt; IGTPW_6000</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10319: 4b4a9f252ab44da921f5e0067ec26d29e5c43d8e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6000: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html<br />
  IGT_6132: 61fb9cdf2a9132e3618c8b08b9d20fec0c347831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dp_dsc@basic-dsc-enable<br />
+igt@kms_dp_dsc@xrgb8888-dsc-compression<br />
-igt@kms_dp_dsc@basic-dsc-enable-dp<br />
-igt@kms_dp_dsc@basic-dsc-enable-edp</p>

</body>
</html>

--===============0748573478243811972==--

--===============1370067855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1370067855==--
