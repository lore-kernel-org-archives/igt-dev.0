Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6501911959432565828=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Aug 2021 17:06:48 -0000
Message-ID: <162818320837.30840.17106196821279100700@emeril.freedesktop.org>
References: <20210805160622.516552-1-bindu.r@amd.com>
In-Reply-To: <20210805160622.516552-1-bindu.r@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbw=3A_New_test_for_bandwidth_validation_=28rev3=29?=
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
To: Bindu Ramamurthy <bindu.r@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6501911959432565828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: New test for bandwidth validation (rev3)
URL   : https://patchwork.freedesktop.org/series/92976/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10451 -> IGTPW_6091
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html

Known issues
------------

  Here are the changes found in IGTPW_6091 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [DMESG-WARN][1] ([i915#2203] / [i915#2868]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10451/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6160 -> IGTPW_6091

  CI-20190529: 20190529
  CI_DRM_10451: 3bea0ad83735904d380d83bcca30557268acf887 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html
  IGT_6160: 4287344dd6a39d9036c5fb9a047a7d8f10bee981 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+igt@kms_bw@linear-tiling-1-displays-2560x1440p
+igt@kms_bw@linear-tiling-1-displays-3840x2160p
+igt@kms_bw@linear-tiling-2-displays-1920x1080p
+igt@kms_bw@linear-tiling-2-displays-2560x1440p
+igt@kms_bw@linear-tiling-2-displays-3840x2160p
+igt@kms_bw@linear-tiling-3-displays-1920x1080p
+igt@kms_bw@linear-tiling-3-displays-2560x1440p
+igt@kms_bw@linear-tiling-3-displays-3840x2160p
+igt@kms_bw@linear-tiling-4-displays-1920x1080p
+igt@kms_bw@linear-tiling-4-displays-2560x1440p
+igt@kms_bw@linear-tiling-4-displays-3840x2160p
+igt@kms_bw@linear-tiling-5-displays-1920x1080p
+igt@kms_bw@linear-tiling-5-displays-2560x1440p
+igt@kms_bw@linear-tiling-5-displays-3840x2160p
+igt@kms_bw@linear-tiling-6-displays-1920x1080p
+igt@kms_bw@linear-tiling-6-displays-2560x1440p
+igt@kms_bw@linear-tiling-6-displays-3840x2160p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html

--===============6501911959432565828==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: New test for bandwidth validation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92976/">https://patchwork.freedesktop.org/series/92976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10451 -&gt; IGTPW_6091</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6091 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@hdmi-hpd-fast:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10451/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6160 -&gt; IGTPW_6091</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10451: 3bea0ad83735904d380d83bcca30557268acf887 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6091/index.html<br />
  IGT_6160: 4287344dd6a39d9036c5fb9a047a7d8f10bee981 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_bw@linear-tiling-1-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-1-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-1-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-2-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-2-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-2-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-3-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-3-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-3-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-4-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-4-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-4-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-5-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-5-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-5-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-6-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-6-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-6-displays-3840x2160p</p>

</body>
</html>

--===============6501911959432565828==--
