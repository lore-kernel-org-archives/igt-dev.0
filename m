Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Aug 2020 21:57:18 -0000
Message-ID: <159778783867.18759.5603009996817331340@emeril.freedesktop.org>
References: <20200417211025.109574-1-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0719550216=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0719550216==
Content-Type: multipart/alternative;
 boundary="===============4678427552133927972=="

--===============4678427552133927972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add nouveau-crc tests (rev4)
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8901 -> IGTPW_4890
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html

Known issues
------------

  Here are the changes found in IGTPW_4890 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][3] ([fdo#109271]) -> [DMESG-FAIL][4] ([i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-x1275:       [DMESG-WARN][5] ([i915#62] / [i915#92]) -> [DMESG-WARN][6] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][7] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][8] ([i915#62] / [i915#92]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4890

  CI-20190529: 20190529
  CI_DRM_8901: 39e63f96cd9438015d6204a3ca33819447e4c066 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4890: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@nouveau_crc@ctx-flip-threshold-reset-after-capture
+igt@nouveau_crc@pipe-a-ctx-flip-detection
+igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-a-source-outp-complete
+igt@nouveau_crc@pipe-a-source-outp-inactive
+igt@nouveau_crc@pipe-a-source-rg
+igt@nouveau_crc@pipe-b-ctx-flip-detection
+igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-b-source-outp-complete
+igt@nouveau_crc@pipe-b-source-outp-inactive
+igt@nouveau_crc@pipe-b-source-rg
+igt@nouveau_crc@pipe-c-ctx-flip-detection
+igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-c-source-outp-complete
+igt@nouveau_crc@pipe-c-source-outp-inactive
+igt@nouveau_crc@pipe-c-source-rg
+igt@nouveau_crc@pipe-d-ctx-flip-detection
+igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-d-source-outp-complete
+igt@nouveau_crc@pipe-d-source-outp-inactive
+igt@nouveau_crc@pipe-d-source-rg
+igt@nouveau_crc@pipe-e-ctx-flip-detection
+igt@nouveau_crc@pipe-e-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-e-source-outp-complete
+igt@nouveau_crc@pipe-e-source-outp-inactive
+igt@nouveau_crc@pipe-e-source-rg
+igt@nouveau_crc@pipe-f-ctx-flip-detection
+igt@nouveau_crc@pipe-f-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-f-source-outp-complete
+igt@nouveau_crc@pipe-f-source-outp-inactive
+igt@nouveau_crc@pipe-f-source-rg

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html

--===============4678427552133927972==
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
<tr><td><b>Series:</b></td><td>Add nouveau-crc tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/74811/">https://patchwork.freedesktop.org/series/74811/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8901 -&gt; IGTPW_4890</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4890 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5769 -&gt; IGTPW_4890</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8901: 39e63f96cd9438015d6204a3ca33819447e4c066 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4890: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@nouveau_crc@ctx-flip-threshold-reset-after-capture<br />
+igt@nouveau_crc@pipe-a-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-a-source-outp-complete<br />
+igt@nouveau_crc@pipe-a-source-outp-inactive<br />
+igt@nouveau_crc@pipe-a-source-rg<br />
+igt@nouveau_crc@pipe-b-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-b-source-outp-complete<br />
+igt@nouveau_crc@pipe-b-source-outp-inactive<br />
+igt@nouveau_crc@pipe-b-source-rg<br />
+igt@nouveau_crc@pipe-c-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-c-source-outp-complete<br />
+igt@nouveau_crc@pipe-c-source-outp-inactive<br />
+igt@nouveau_crc@pipe-c-source-rg<br />
+igt@nouveau_crc@pipe-d-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-d-source-outp-complete<br />
+igt@nouveau_crc@pipe-d-source-outp-inactive<br />
+igt@nouveau_crc@pipe-d-source-rg<br />
+igt@nouveau_crc@pipe-e-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-e-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-e-source-outp-complete<br />
+igt@nouveau_crc@pipe-e-source-outp-inactive<br />
+igt@nouveau_crc@pipe-e-source-rg<br />
+igt@nouveau_crc@pipe-f-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-f-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-f-source-outp-complete<br />
+igt@nouveau_crc@pipe-f-source-outp-inactive<br />
+igt@nouveau_crc@pipe-f-source-rg</p>

</body>
</html>

--===============4678427552133927972==--

--===============0719550216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0719550216==--
