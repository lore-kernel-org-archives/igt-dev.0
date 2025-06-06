Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B888C5B555
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 14:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031B810EACB;
	Fri,  6 Jun 2025 14:41:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC1C10EAC8;
 Fri,  6 Jun 2025 14:41:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2734688692338359079=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tools/intel=5Freg=3A_add_?=
 =?utf-8?q?support_to_hw_address_port_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Jun 2025 14:41:37 -0000
Message-ID: <174922089737.56455.12413349530597461941@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605064137.510521-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250605064137.510521-1-dafna.hirschfeld@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============2734688692338359079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_reg: add support to hw address port (rev2)
URL   : https://patchwork.freedesktop.org/series/149926/
State : success

== Summary ==

CI Bug Log - changes from IGT_8400 -> IGTPW_13252
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13252 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hugepages:
    - bat-arlh-2:         [PASS][1] -> [DMESG-FAIL][2] ([i915#14243]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arlh-2/igt@i915_selftest@live@hugepages.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/igt@i915_selftest@live@hugepages.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-11:         [INCOMPLETE][3] ([i915#12061]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-dg2-11/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@client:
    - bat-dg2-11:         [INCOMPLETE][5] ([i915#14201]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-dg2-11/igt@i915_selftest@live@client.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-dg2-11/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@guc_hang:
    - bat-twl-2:          [INCOMPLETE][7] ([i915#14096]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-twl-2/igt@i915_selftest@live@guc_hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-twl-2/igt@i915_selftest@live@guc_hang.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][9] ([i915#13735]) -> [PASS][10] +81 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-11:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][15] ([i915#13735] / [i915#180]) -> [PASS][16] +53 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@gem_render_tiled_blits@basic:
    - bat-arlh-2:         [SKIP][17] ([i915#10197] / [i915#10211] / [i915#11346] / [i915#11725]) -> [SKIP][18] ([i915#10197] / [i915#10211] / [i915#11346] / [i915#11725] / [i915#4079])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arlh-2/igt@gem_render_tiled_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/igt@gem_render_tiled_blits@basic.html
    - bat-arlh-3:         [SKIP][19] ([i915#10211] / [i915#11725]) -> [SKIP][20] ([i915#10211] / [i915#11725] / [i915#4079])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arlh-3/igt@gem_render_tiled_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arlh-2:         [SKIP][21] ([i915#10206] / [i915#11346] / [i915#11724]) -> [SKIP][22] ([i915#10206] / [i915#11346] / [i915#11724] / [i915#4079])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arlh-2/igt@gem_tiled_pread_basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/igt@gem_tiled_pread_basic.html
    - bat-arlh-3:         [SKIP][23] ([i915#11724]) -> [SKIP][24] ([i915#11724] / [i915#4079])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8400/bat-arlh-3/igt@gem_tiled_pread_basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-3/igt@gem_tiled_pread_basic.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#14096]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8400 -> IGTPW_13252
  * Linux: CI_DRM_16654 -> CI_DRM_16660

  CI-20190529: 20190529
  CI_DRM_16654: 308a53b9affc92eca9eaa6117dd62c79d5419ce7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16660: 18c655116ff21afbb7c0dc013f52a011f90c91a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13252: a8d26aded903fe187e21b99f63143b6516e9e5b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8400: 90a23a10be60c805ab0da456e846d1ec45799f9d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/index.html

--===============2734688692338359079==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tools/intel_reg: add support to hw address p=
ort (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149926/">https://patchwork.freedesktop.org/series/149926/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13252/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13252/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8400 -&gt; IGTPW_13252</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/index=
.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13252 that come from known issues:</=
p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hugepages:<ul>
<li>bat-arlh-2:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arlh-2/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/=
igt@i915_selftest@live@hugepages.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 ot=
her test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-dg2-11/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#120=
61</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_132=
52/bat-dg2-11/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-dg2-11:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-dg2-11/igt@i915_selftest@live@client.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i91=
5#14201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13252/bat-dg2-11/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_hang:</p>
<ul>
<li>bat-twl-2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-twl-2/igt@i915_selftest@live@guc_hang.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i9=
15#14096</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13252/bat-twl-2/igt@i915_selftest@live@guc_hang.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
35">i915#13735</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13252/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</=
a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061=
">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13252/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +=
1 other test pass</li>
<li>bat-dg2-11:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061=
">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13252/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1373=
5">i915#13735</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13252/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.ht=
ml">PASS</a> +53 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-2:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arlh-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#1=
0197</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10211">i915#10211</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11346">i915#11346</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/igt@gem_ren=
der_tiled_blits@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#1=
1346</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11725">i915#11725</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arlh-3:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#1=
0211</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11725">i915#11725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13252/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
211">i915#10211</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11725">i915#11725</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arlh-2:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arlh-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1134=
6">i915#11346</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11724">i915#11724</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13252/bat-arlh-2/igt@gem_tiled_pread_basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
10206">i915#10206</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11346">i915#11346</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11724">i915#11724</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arlh-3:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8400/bat-arlh-3/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724">i915#11724</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13252/ba=
t-arlh-3/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11724">i915#11724</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8400 -&gt; IGTPW_13252</li>
<li>Linux: CI_DRM_16654 -&gt; CI_DRM_16660</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16654: 308a53b9affc92eca9eaa6117dd62c79d5419ce7 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  CI_DRM_16660: 18c655116ff21afbb7c0dc013f52a011f90c91a4 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13252: a8d26aded903fe187e21b99f63143b6516e9e5b4 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8400: 90a23a10be60c805ab0da456e846d1ec45799f9d @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2734688692338359079==--
