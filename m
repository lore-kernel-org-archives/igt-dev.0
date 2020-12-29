Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Dec 2020 11:45:34 -0000
Message-ID: <160924233436.17549.13796401305839478701@emeril.freedesktop.org>
References: <20201229103852.234352-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201229103852.234352-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fengines=3A_Exercise_independence_across_all_physical?=
 =?utf-8?q?_engines_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1970378567=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1970378567==
Content-Type: multipart/alternative;
 boundary="===============1217231213324078781=="

--===============1217231213324078781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_engines: Exercise independence across all physical engines (rev3)
URL   : https://patchwork.freedesktop.org/series/85293/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9530 -> IGTPW_5338
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html

Known issues
------------

  Here are the changes found in IGTPW_5338 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-byt-j1900:       NOTRUN -> [SKIP][1] ([fdo#109271]) +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       NOTRUN -> [INCOMPLETE][2] ([i915#142] / [i915#2405])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-byt-j1900:       NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@runner@aborted:
    - fi-byt-j1900:       NOTRUN -> [FAIL][4] ([i915#1814])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bsw-nick:        [DMESG-FAIL][5] ([i915#2675] / [i915#541]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2675]: https://gitlab.freedesktop.org/drm/intel/issues/2675
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (39 -> 36)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (4): fi-bdw-samus fi-tgl-y fi-bsw-cyan fi-dg1-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5926 -> IGTPW_5338

  CI-20190529: 20190529
  CI_DRM_9530: 4b094e30c7d79e59faef5ce793d6ebbcdbede5a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html
  IGT_5926: c81567cf1c05050f7becd4d78ebe349dfb2f9520 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_engines@independent-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html

--===============1217231213324078781==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_engines: Exercise independence across all physical engines (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85293/">https://patchwork.freedesktop.org/series/85293/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9530 -&gt; IGTPW_5338</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5338 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-byt-j1900/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2675">i915#2675</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (1): fi-byt-j1900 <br />
  Missing    (4): fi-bdw-samus fi-tgl-y fi-bsw-cyan fi-dg1-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5926 -&gt; IGTPW_5338</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9530: 4b094e30c7d79e59faef5ce793d6ebbcdbede5a2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html<br />
  IGT_5926: c81567cf1c05050f7becd4d78ebe349dfb2f9520 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_ctx_engines@independent-all</p>

</body>
</html>

--===============1217231213324078781==--

--===============1970378567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1970378567==--
