Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Jun 2021 16:18:44 -0000
Message-ID: <162377392430.8817.16815167725377512624@emeril.freedesktop.org>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/17=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1789295596=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1789295596==
Content-Type: multipart/alternative;
 boundary="===============0141708943193679130=="

--===============0141708943193679130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev8)
URL   : https://patchwork.freedesktop.org/series/91371/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10225 -> IGTPW_5927
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5927 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5927, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5927:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-hsw-4770:        [WARN][1] ([i915#2283]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
    - fi-bdw-5557u:       [WARN][3] ([i915#2283]) -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-hsw-gt1}:       [WARN][5] ([i915#2283]) -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_5927 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][7] ([i915#3303]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Participating hosts (48 -> 38)
------------------------------

  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-ctg-p8600 bat-adls-3 fi-dg1-1 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6107 -> IGTPW_5927

  CI-20190529: 20190529
  CI_DRM_10225: 52beaf52657f49ffda64af3c46548fb0907cf66d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html
  IGT_6107: 2bec4e7619f04d2ca86006917acd3b5c86fb73a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_cdclk@basic
+igt@kms_cdclk@mode-transition
+igt@kms_cdclk@plane-scaling
+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc
+igt@kms_dither@fb-16bpc-vs-panel-12bpc
+igt@kms_dp_dsc@basic-dsc-enable
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888
-igt@kms_dp_dsc@basic-dsc-enable-dp
-igt@kms_dp_dsc@basic-dsc-enable-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html

--===============0141708943193679130==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91371/">https://patchwork.freedesktop.org/series/91371/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10225 -&gt; IGTPW_5927</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5927 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5927, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5927:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5927 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10225/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (48 -&gt; 38)</h2>
<p>Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-ctg-p8600 bat-adls-3 fi-dg1-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6107 -&gt; IGTPW_5927</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10225: 52beaf52657f49ffda64af3c46548fb0907cf66d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5927/index.html<br />
  IGT_6107: 2bec4e7619f04d2ca86006917acd3b5c86fb73a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_addfb_basic@invalid-smem-bo-on-discrete<br />
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_cdclk@basic<br />
+igt@kms_cdclk@mode-transition<br />
+igt@kms_cdclk@plane-scaling<br />
+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-12bpc<br />
+igt@kms_dp_dsc@basic-dsc-enable<br />
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888<br />
-igt@kms_dp_dsc@basic-dsc-enable-dp<br />
-igt@kms_dp_dsc@basic-dsc-enable-edp</p>

</body>
</html>

--===============0141708943193679130==--

--===============1789295596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1789295596==--
