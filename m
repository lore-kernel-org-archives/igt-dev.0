Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 14 Feb 2021 13:19:08 -0000
Message-ID: <161330874875.29804.8086187346585668366@emeril.freedesktop.org>
References: <20210214122559.1980-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210214122559.1980-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?reduce_executions_time_on_multiplane_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1687215051=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1687215051==
Content-Type: multipart/alternative;
 boundary="===============7320834202053505306=="

--===============7320834202053505306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: reduce executions time on multiplane tests
URL   : https://patchwork.freedesktop.org/series/87073/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9774 -> IGTPW_5504
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html

Known issues
------------

  Here are the changes found in IGTPW_5504 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_basic@create-fd-close:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_basic@create-fd-close.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_basic@create-fd-close.html

  * igt@gem_huc_copy@huc-copy:
    - fi-byt-j1900:       NOTRUN -> [SKIP][3] ([fdo#109271]) +27 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7500u:       [PASS][4] -> [DMESG-WARN][5] ([i915#2605])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-byt-j1900:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@runner@aborted:
    - fi-kbl-guc:         NOTRUN -> [FAIL][7] ([i915#2292] / [i915#2426] / [k.org#204565])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-kbl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#2411] / [i915#402]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][10] ([i915#402]) -> [PASS][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2292]: https://gitlab.freedesktop.org/drm/intel/issues/2292
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (44 -> 39)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6003 -> IGTPW_5504

  CI-20190529: 20190529
  CI_DRM_9774: 75084ba7750368d8a2bf6ccc543b729e1b3394a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html
  IGT_6003: 627cc5353535d61fa33c5f7ff7e64f154c84f10a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html

--===============7320834202053505306==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: reduce executions time on multiplane tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87073/">https://patchwork.freedesktop.org/series/87073/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9774 -&gt; IGTPW_5504</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5504 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_basic@create-fd-close:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_basic@create-fd-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_basic@create-fd-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2292">i915#2292</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=204565">k.org#204565</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9774/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Additional (1): fi-byt-j1900 <br />
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6003 -&gt; IGTPW_5504</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9774: 75084ba7750368d8a2bf6ccc543b729e1b3394a6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5504/index.html<br />
  IGT_6003: 627cc5353535d61fa33c5f7ff7e64f154c84f10a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7320834202053505306==--

--===============1687215051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1687215051==--
