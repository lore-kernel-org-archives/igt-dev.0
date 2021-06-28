Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 10:00:31 -0000
Message-ID: <162487443157.2572.1679291981763611032@emeril.freedesktop.org>
References: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210618104457.19969-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/7=5D_tests/device=5Freset=3A_Unload?=
 =?utf-8?q?_snd_driver_before_i915_unbind_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0535372032=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0535372032==
Content-Type: multipart/alternative;
 boundary="===============6803448300954445291=="

--===============6803448300954445291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/7] tests/device_reset: Unload snd driver before i915 unbind (rev3)
URL   : https://patchwork.freedesktop.org/series/91670/
State : success

== Summary ==

CI Bug Log - changes from IGT_6120 -> IGTPW_5954
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5954 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5954, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5954:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-hsw-4770:        [WARN][1] ([i915#2283]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
    - fi-bdw-5557u:       [WARN][3] ([i915#2283]) -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-dg1-1}:         [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-dg1-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-dg1-1/igt@core_hotunplug@unbind-rebind.html
    - {fi-hsw-gt1}:       [WARN][7] ([i915#2283]) -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_5954 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][9] ([fdo#109271]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-WARN][10] ([i915#2868]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-bsw-cyan fi-hsw-4200u fi-bdw-samus fi-bsw-n3050 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6120 -> IGTPW_5954

  CI-20190529: 20190529
  CI_DRM_10282: 67f5a18128770817e4218a9e496d2bf5047c51e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html
  IGT_6120: c45c6b727c1efaced0b53620bd41c8e4facfb31f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

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

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html

--===============6803448300954445291==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/7] tests/device_reset: Unload snd driver before i915 unbind (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91670/">https://patchwork.freedesktop.org/series/91670/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6120 -&gt; IGTPW_5954</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5954 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5954, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5954:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-dg1-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-dg1-1/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5954 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_basic@cs-gfx:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@common-hpd-after-suspend:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6120/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-bsw-cyan fi-hsw-4200u fi-bdw-samus fi-bsw-n3050 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6120 -&gt; IGTPW_5954</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10282: 67f5a18128770817e4218a9e496d2bf5047c51e8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5954/index.html<br />
  IGT_6120: c45c6b727c1efaced0b53620bd41c8e4facfb31f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0<br />
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
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip</p>

</body>
</html>

--===============6803448300954445291==--

--===============0535372032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0535372032==--
