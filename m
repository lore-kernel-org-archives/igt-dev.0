Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 16 Jul 2021 15:38:05 -0000
Message-ID: <162644988575.12776.17540884253349354756@emeril.freedesktop.org>
References: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zOiBW?=
 =?utf-8?q?arious_cleanups_and_fixes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0821374907=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0821374907==
Content-Type: multipart/alternative;
 boundary="===============6071539640450548716=="

--===============6071539640450548716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms: Various cleanups and fixes
URL   : https://patchwork.freedesktop.org/series/92656/
State : success

== Summary ==

CI Bug Log - changes from IGT_6143 -> IGTPW_6031
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html

Known issues
------------

  Here are the changes found in IGTPW_6031 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][1] ([i915#1602] / [i915#2029])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][2] ([i915#3303]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6143/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [SKIP][4] ([fdo#109271]) -> [FAIL][5] ([i915#579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6143/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6143 -> IGTPW_6031

  CI-20190529: 20190529
  CI_DRM_10345: 8c6a974b932fbaa798102b4713ceedf3b04227d9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6031: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html
  IGT_6143: cd649eee0f74fa6ee71de18ff59b5ae39fd62159 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_big_fb@linear-8bpp-rotate-0-hflip
+igt@kms_big_fb@linear-8bpp-rotate-90-hflip
+igt@kms_big_fb@linear-8bpp-rotate-180-hflip
+igt@kms_big_fb@linear-8bpp-rotate-270-hflip
+igt@kms_big_fb@linear-16bpp-rotate-0-hflip
+igt@kms_big_fb@linear-16bpp-rotate-90-hflip
+igt@kms_big_fb@linear-16bpp-rotate-180-hflip
+igt@kms_big_fb@linear-16bpp-rotate-270-hflip
+igt@kms_big_fb@linear-32bpp-rotate-0-hflip
+igt@kms_big_fb@linear-32bpp-rotate-90-hflip
+igt@kms_big_fb@linear-32bpp-rotate-180-hflip
+igt@kms_big_fb@linear-32bpp-rotate-270-hflip
+igt@kms_big_fb@linear-64bpp-rotate-0-hflip
+igt@kms_big_fb@linear-64bpp-rotate-90-hflip
+igt@kms_big_fb@linear-64bpp-rotate-180-hflip
+igt@kms_big_fb@linear-64bpp-rotate-270-hflip
+igt@kms_big_fb@x-tiled-8bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-8bpp-rotate-90-hflip
+igt@kms_big_fb@x-tiled-8bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-8bpp-rotate-270-hflip
+igt@kms_big_fb@x-tiled-16bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-16bpp-rotate-90-hflip
+igt@kms_big_fb@x-tiled-16bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-16bpp-rotate-270-hflip
+igt@kms_big_fb@x-tiled-32bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-32bpp-rotate-90-hflip
+igt@kms_big_fb@x-tiled-32bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-32bpp-rotate-270-hflip
+igt@kms_big_fb@x-tiled-64bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-64bpp-rotate-90-hflip
+igt@kms_big_fb@x-tiled-64bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-64bpp-rotate-270-hflip
+igt@kms_big_fb@yf-tiled-8bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-8bpp-rotate-90-hflip
+igt@kms_big_fb@yf-tiled-8bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-8bpp-rotate-270-hflip
+igt@kms_big_fb@yf-tiled-16bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-16bpp-rotate-90-hflip
+igt@kms_big_fb@yf-tiled-16bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-16bpp-rotate-270-hflip
+igt@kms_big_fb@yf-tiled-32bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-32bpp-rotate-90-hflip
+igt@kms_big_fb@yf-tiled-32bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-32bpp-rotate-270-hflip
+igt@kms_big_fb@yf-tiled-64bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-64bpp-rotate-90-hflip
+igt@kms_big_fb@yf-tiled-64bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-64bpp-rotate-270-hflip
+igt@kms_big_fb@y-tiled-8bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-8bpp-rotate-90-hflip
+igt@kms_big_fb@y-tiled-8bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-8bpp-rotate-270-hflip
+igt@kms_big_fb@y-tiled-16bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-16bpp-rotate-90-hflip
+igt@kms_big_fb@y-tiled-16bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-16bpp-rotate-270-hflip
+igt@kms_big_fb@y-tiled-32bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-32bpp-rotate-90-hflip
+igt@kms_big_fb@y-tiled-32bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-32bpp-rotate-270-hflip
+igt@kms_big_fb@y-tiled-64bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-64bpp-rotate-90-hflip
+igt@kms_big_fb@y-tiled-64bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-64bpp-rotate-270-hflip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html

--===============6071539640450548716==
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
<tr><td><b>Series:</b></td><td>kms: Various cleanups and fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92656/">https://patchwork.freedesktop.org/series/92656/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6143 -&gt; IGTPW_6031</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6031 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6143/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6143/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6143 -&gt; IGTPW_6031</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10345: 8c6a974b932fbaa798102b4713ceedf3b04227d9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6031: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6031/index.html<br />
  IGT_6143: cd649eee0f74fa6ee71de18ff59b5ae39fd62159 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_big_fb@linear-8bpp-rotate-0-hflip<br />
+igt@kms_big_fb@linear-8bpp-rotate-90-hflip<br />
+igt@kms_big_fb@linear-8bpp-rotate-180-hflip<br />
+igt@kms_big_fb@linear-8bpp-rotate-270-hflip<br />
+igt@kms_big_fb@linear-16bpp-rotate-0-hflip<br />
+igt@kms_big_fb@linear-16bpp-rotate-90-hflip<br />
+igt@kms_big_fb@linear-16bpp-rotate-180-hflip<br />
+igt@kms_big_fb@linear-16bpp-rotate-270-hflip<br />
+igt@kms_big_fb@linear-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@linear-32bpp-rotate-90-hflip<br />
+igt@kms_big_fb@linear-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@linear-32bpp-rotate-270-hflip<br />
+igt@kms_big_fb@linear-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@linear-64bpp-rotate-90-hflip<br />
+igt@kms_big_fb@linear-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@linear-64bpp-rotate-270-hflip<br />
+igt@kms_big_fb@x-tiled-8bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-8bpp-rotate-90-hflip<br />
+igt@kms_big_fb@x-tiled-8bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-8bpp-rotate-270-hflip<br />
+igt@kms_big_fb@x-tiled-16bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-16bpp-rotate-90-hflip<br />
+igt@kms_big_fb@x-tiled-16bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-16bpp-rotate-270-hflip<br />
+igt@kms_big_fb@x-tiled-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-32bpp-rotate-90-hflip<br />
+igt@kms_big_fb@x-tiled-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-32bpp-rotate-270-hflip<br />
+igt@kms_big_fb@x-tiled-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-64bpp-rotate-90-hflip<br />
+igt@kms_big_fb@x-tiled-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-64bpp-rotate-270-hflip<br />
+igt@kms_big_fb@yf-tiled-8bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-8bpp-rotate-90-hflip<br />
+igt@kms_big_fb@yf-tiled-8bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-8bpp-rotate-270-hflip<br />
+igt@kms_big_fb@yf-tiled-16bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-16bpp-rotate-90-hflip<br />
+igt@kms_big_fb@yf-tiled-16bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-16bpp-rotate-270-hflip<br />
+igt@kms_big_fb@yf-tiled-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-32bpp-rotate-90-hflip<br />
+igt@kms_big_fb@yf-tiled-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-32bpp-rotate-270-hflip<br />
+igt@kms_big_fb@yf-tiled-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-64bpp-rotate-90-hflip<br />
+igt@kms_big_fb@yf-tiled-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-64bpp-rotate-270-hflip<br />
+igt@kms_big_fb@y-tiled-8bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-8bpp-rotate-90-hflip<br />
+igt@kms_big_fb@y-tiled-8bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-8bpp-rotate-270-hflip<br />
+igt@kms_big_fb@y-tiled-16bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-16bpp-rotate-90-hflip<br />
+igt@kms_big_fb@y-tiled-16bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-16bpp-rotate-270-hflip<br />
+igt@kms_big_fb@y-tiled-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-32bpp-rotate-90-hflip<br />
+igt@kms_big_fb@y-tiled-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-32bpp-rotate-270-hflip<br />
+igt@kms_big_fb@y-tiled-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-64bpp-rotate-90-hflip<br />
+igt@kms_big_fb@y-tiled-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-64bpp-rotate-270-hflip</p>

</body>
</html>

--===============6071539640450548716==--

--===============0821374907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0821374907==--
