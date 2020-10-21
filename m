Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 21 Oct 2020 09:47:44 -0000
Message-ID: <160327366491.17471.7434104640612988472@emeril.freedesktop.org>
References: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
In-Reply-To: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_refactoring_cursor-alpha_subtests_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0106970161=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0106970161==
Content-Type: multipart/alternative;
 boundary="===============8271788503300847801=="

--===============8271788503300847801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: refactoring cursor-alpha subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/81060/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9174 -> IGTPW_5080
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html

Known issues
------------

  Here are the changes found in IGTPW_5080 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [DMESG-WARN][1] ([i915#1982]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [DMESG-WARN][3] ([i915#1982]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [DMESG-WARN][5] ([i915#1982]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2417]: https://gitlab.freedesktop.org/drm/intel/issues/2417


Participating hosts (44 -> 39)
------------------------------

  Additional (1): fi-skl-guc 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5080

  CI-20190529: 20190529
  CI_DRM_9174: 66ac51120c329a9f93352cf480f5098adab24af8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_cursor_crc@pipe-a-cursor-alpha
+igt@kms_cursor_crc@pipe-b-cursor-alpha
+igt@kms_cursor_crc@pipe-c-cursor-alpha
+igt@kms_cursor_crc@pipe-d-cursor-alpha
+igt@kms_cursor_crc@pipe-e-cursor-alpha
+igt@kms_cursor_crc@pipe-f-cursor-alpha
-igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent
-igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-b-cursor-alpha-transparent
-igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-c-cursor-alpha-transparent
-igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent
-igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent
-igt@kms_cursor_crc@pipe-f-cursor-alpha-opaque
-igt@kms_cursor_crc@pipe-f-cursor-alpha-transparent

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html

--===============8271788503300847801==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: refactoring cursor-alpha subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81060/">https://patchwork.freedesktop.org/series/81060/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9174 -&gt; IGTPW_5080</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5080 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Additional (1): fi-skl-guc <br />
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5822 -&gt; IGTPW_5080</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9174: 66ac51120c329a9f93352cf480f5098adab24af8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_cursor_crc@pipe-a-cursor-alpha<br />
+igt@kms_cursor_crc@pipe-b-cursor-alpha<br />
+igt@kms_cursor_crc@pipe-c-cursor-alpha<br />
+igt@kms_cursor_crc@pipe-d-cursor-alpha<br />
+igt@kms_cursor_crc@pipe-e-cursor-alpha<br />
+igt@kms_cursor_crc@pipe-f-cursor-alpha<br />
-igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent<br />
-igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-b-cursor-alpha-transparent<br />
-igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-c-cursor-alpha-transparent<br />
-igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent<br />
-igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent<br />
-igt@kms_cursor_crc@pipe-f-cursor-alpha-opaque<br />
-igt@kms_cursor_crc@pipe-f-cursor-alpha-transparent</p>

</body>
</html>

--===============8271788503300847801==--

--===============0106970161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0106970161==--
