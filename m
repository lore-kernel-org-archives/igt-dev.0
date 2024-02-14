Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8391FC48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 21:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51E10E3CD;
	Wed, 14 Feb 2024 21:31:19 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAD710E467;
 Wed, 14 Feb 2024 21:31:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4027801220260162830=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMvaW50ZWwveGVfdm06IFRl?=
 =?utf-8?b?c3QgRFJNX1hFX1ZNX0JJTkRfT1BfVU5NQVBfQUxM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Feb 2024 21:31:18 -0000
Message-ID: <170794627865.1238604.6620079759884188807@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214204450.185531-1-jose.souza@intel.com>
In-Reply-To: <20240214204450.185531-1-jose.souza@intel.com>
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

--===============4027801220260162830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Test DRM_XE_VM_BIND_OP_UNMAP_ALL
URL   : https://patchwork.freedesktop.org/series/129909/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14273 -> IGTPW_10676
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10676:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fence@basic-busy@bcs0:
    - {bat-arls-1}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-arls-1/igt@gem_exec_fence@basic-busy@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-arls-1/igt@gem_exec_fence@basic-busy@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_10676 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([fdo#109271]) +35 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adlm-1:         NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlm-1:         NOTRUN -> [SKIP][6] ([i915#6621])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][7] -> [ABORT][8] ([i915#7911])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlm-1:         NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlm-1:         NOTRUN -> [SKIP][10] ([i915#1849] / [i915#4342])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-adlm-1:         NOTRUN -> [SKIP][11] ([i915#9875] / [i915#9900]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlm-1:         NOTRUN -> [SKIP][12] ([i915#5354])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#3555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-adlm-1:         NOTRUN -> [SKIP][14] ([i915#3708] / [i915#9900])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - bat-adlm-1:         NOTRUN -> [SKIP][15] ([i915#3708]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - {bat-arls-1}:       [DMESG-WARN][16] ([i915#10194]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][18] ([i915#9500]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - fi-apl-guc:         [DMESG-WARN][20] ([i915#180] / [i915#1982] / [i915#8585]) -> [DMESG-WARN][21] ([i915#180] / [i915#8585])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/fi-apl-guc/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/fi-apl-guc/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7713 -> IGTPW_10676

  CI-20190529: 20190529
  CI_DRM_14273: 775195df6145d7ce4ebd290a9fe2fced9cc554be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10676: 10676
  IGT_7713: 7713


Testlist changes
----------------

+igt@xe_vm@unbind-all
-igt@kms_colorop@plane-ctm_3x4_50_desat
-igt@kms_colorop@plane-ctm_3x4_bt709_dec
-igt@kms_colorop@plane-ctm_3x4_bt709_dec_enc
-igt@kms_colorop@plane-ctm_3x4_bt709_enc
-igt@kms_colorop@plane-ctm_3x4_bt709_enc_dec
-igt@kms_colorop@plane-ctm_3x4_overdrive
-igt@kms_colorop@plane-ctm_3x4_oversaturate
-igt@kms_colorop@plane-srgb_eotf
-igt@kms_colorop@plane-srgb_eotf-srgb_inv_eotf
-igt@kms_colorop@plane-srgb_inv_eotf
-igt@kms_color@plane-ctm3x3
-igt@kms_color@plane-ctm3x3-lut1d
-igt@kms_color@plane-lut1d
-igt@kms_color@plane-lut1d-ctm3x3
-igt@kms_color@plane-lut1d-ctm3x3-lut1d
-igt@kms_color@plane-lut1d-lut1d
-igt@kms_properties@colorop-properties-atomic
-igt@kms_properties@colorop-properties-legacy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/index.html

--===============4027801220260162830==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Test DRM_XE_VM_BIND_OP_UNMAP_ALL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129909/">https://patchwork.freedesktop.org/series/129909/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14273 -&gt; IGTPW_10676</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10676:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_fence@basic-busy@bcs0:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-arls-1/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-arls-1/igt@gem_exec_fence@basic-busy@bcs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10676 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9875">i915#9875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-adlm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14273/fi-apl-guc/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10676/fi-apl-guc/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7713 -&gt; IGTPW_10676</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14273: 775195df6145d7ce4ebd290a9fe2fced9cc554be @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10676: 10676<br />
  IGT_7713: 7713</p>
<h2>Testlist changes</h2>
<p>+igt@xe_vm@unbind-all<br />
-igt@kms_colorop@plane-ctm_3x4_50_desat<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_dec<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_dec_enc<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_enc<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_enc_dec<br />
-igt@kms_colorop@plane-ctm_3x4_overdrive<br />
-igt@kms_colorop@plane-ctm_3x4_oversaturate<br />
-igt@kms_colorop@plane-srgb_eotf<br />
-igt@kms_colorop@plane-srgb_eotf-srgb_inv_eotf<br />
-igt@kms_colorop@plane-srgb_inv_eotf<br />
-igt@kms_color@plane-ctm3x3<br />
-igt@kms_color@plane-ctm3x3-lut1d<br />
-igt@kms_color@plane-lut1d<br />
-igt@kms_color@plane-lut1d-ctm3x3<br />
-igt@kms_color@plane-lut1d-ctm3x3-lut1d<br />
-igt@kms_color@plane-lut1d-lut1d<br />
-igt@kms_properties@colorop-properties-atomic<br />
-igt@kms_properties@colorop-properties-legacy</p>

</body>
</html>

--===============4027801220260162830==--
