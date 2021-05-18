Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 11:30:16 -0000
Message-ID: <162133741610.23337.6018826904727594915@emeril.freedesktop.org>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1865316791=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1865316791==
Content-Type: multipart/alternative;
 boundary="===============3502940481375974092=="

--===============3502940481375974092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev5)
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from IGT_6087 -> IGTPW_5817
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html

Known issues
------------

  Here are the changes found in IGTPW_5817 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +30 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-elk-e7500:       [PASS][2] -> [FAIL][3] ([i915#3457])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html
    - fi-glk-dsi:         [PASS][4] -> [FAIL][5] ([i915#3457])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-kefka:       [PASS][6] -> [FAIL][7] ([i915#3457]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [PASS][8] -> [FAIL][9] ([i915#3177] / [i915#3457])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_wait@busy@all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-pnv-d510:        [PASS][10] -> [FAIL][11] ([i915#3457])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@gem_wait@wait@all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@gem_wait@wait@all.html
    - fi-bsw-nick:        [PASS][12] -> [FAIL][13] ([i915#3457]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_wait@wait@all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_wait@wait@all.html

  * igt@i915_module_load@reload:
    - fi-ilk-650:         NOTRUN -> [DMESG-FAIL][14] ([i915#3457]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@i915_module_load@reload.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-ilk-650:         NOTRUN -> [FAIL][16] ([i915#3457]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-elk-e7500:       [PASS][17] -> [FAIL][18] ([i915#53]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-ilk-650:         NOTRUN -> [FAIL][19] ([i915#53]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - fi-pnv-d510:        [PASS][20] -> [FAIL][21] ([i915#53])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-bsw-n3050:       [FAIL][22] ([i915#3457]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - fi-bsw-kefka:       [FAIL][24] ([i915#3457]) -> [PASS][25] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-nick:        [FAIL][26] ([i915#3457]) -> [PASS][27] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_wait@busy@all:
    - fi-glk-dsi:         [FAIL][28] ([i915#3457]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_wait@busy@all.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@gem_wait@busy@all.html
    - fi-bsw-kefka:       [FAIL][30] ([i915#3177] / [i915#3457]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_wait@busy@all.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bwr-2160:        [FAIL][32] ([i915#3457]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@gem_wait@wait@all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bwr-2160/igt@gem_wait@wait@all.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         [INCOMPLETE][34] ([i915#3457]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-elk-e7500:       [FAIL][36] ([i915#53]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-bwr-2160:        [FAIL][38] ([i915#53]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][40] ([i915#3457] / [i915#3472]) -> [FAIL][41] ([i915#3472])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
    - fi-ilk-650:         [FAIL][42] ([i915#3457] / [i915#3472]) -> [FAIL][43] ([i915#3472])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - fi-kbl-r:           [DMESG-WARN][44] ([i915#3457]) -> [DMESG-WARN][45] ([i915#3457] / [i915#92])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-r/igt@i915_module_load@reload.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-r/igt@i915_module_load@reload.html
    - fi-bsw-kefka:       [DMESG-FAIL][46] ([i915#1982] / [i915#3457]) -> [DMESG-WARN][47] ([i915#1982] / [i915#3457])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@i915_module_load@reload.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@i915_module_load@reload.html

  * igt@runner@aborted:
    - fi-glk-dsi:         [FAIL][48] ([i915#3363] / [k.org#202321]) -> [FAIL][49] ([i915#2426] / [i915#3363] / [k.org#202321])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][50] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][51] ([i915#1436] / [i915#3363])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-soraka/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-soraka/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][52] ([i915#2426] / [i915#3363]) -> [FAIL][53] ([i915#3363])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-cfl-guc/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-cfl-guc/igt@runner@aborted.html
    - fi-kbl-7567u:       [FAIL][54] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][55] ([i915#1436] / [i915#3363])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-7567u/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-7567u/igt@runner@aborted.html
    - fi-skl-guc:         [FAIL][56] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][57] ([i915#1436] / [i915#3363])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-skl-guc/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-skl-guc/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3472]: https://gitlab.freedesktop.org/drm/intel/issues/3472
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-dg1-1 fi-bsw-cyan fi-bdw-samus fi-kbl-7500u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6087 -> IGTPW_5817

  CI-20190529: 20190529
  CI_DRM_10095: a0301381199253bca72b57df9b8162bf483dbea4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5817: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_pxp@create-protected-buffer
+igt@gem_pxp@create-regular-buffer
+igt@gem_pxp@create-regular-context-1
+igt@gem_pxp@create-regular-context-2
+igt@gem_pxp@create-valid-protected-context
+igt@gem_pxp@display-protected-crc-without-hdcp
+igt@gem_pxp@display-protected-crc-with-hdcp
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted
+igt@gem_pxp@fail-invalid-protected-context
+igt@gem_pxp@hw-rejects-pxp-buffer
+igt@gem_pxp@hw-rejects-pxp-context
+igt@gem_pxp@protected-encrypted-src-copy-not-readible
+igt@gem_pxp@protected-raw-src-copy-not-readible
+igt@gem_pxp@regular-baseline-src-copy-readible
+igt@gem_pxp@reject-modify-context-protection-off-1
+igt@gem_pxp@reject-modify-context-protection-off-2
+igt@gem_pxp@reject-modify-context-protection-off-3
+igt@gem_pxp@reject-modify-context-protection-on
+igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html

--===============3502940481375974092==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6087 -&gt; IGTPW_5817</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5817 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bwr-2160/igt@gem_wait@wait@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-r/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-r/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-dg1-1 fi-bsw-cyan fi-bdw-samus fi-kbl-7500u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6087 -&gt; IGTPW_5817</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10095: a0301381199253bca72b57df9b8162bf483dbea4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5817: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html<br />
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pxp@create-protected-buffer<br />
+igt@gem_pxp@create-regular-buffer<br />
+igt@gem_pxp@create-regular-context-1<br />
+igt@gem_pxp@create-regular-context-2<br />
+igt@gem_pxp@create-valid-protected-context<br />
+igt@gem_pxp@display-protected-crc-without-hdcp<br />
+igt@gem_pxp@display-protected-crc-with-hdcp<br />
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted<br />
+igt@gem_pxp@fail-invalid-protected-context<br />
+igt@gem_pxp@hw-rejects-pxp-buffer<br />
+igt@gem_pxp@hw-rejects-pxp-context<br />
+igt@gem_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@gem_pxp@protected-raw-src-copy-not-readible<br />
+igt@gem_pxp@regular-baseline-src-copy-readible<br />
+igt@gem_pxp@reject-modify-context-protection-off-1<br />
+igt@gem_pxp@reject-modify-context-protection-off-2<br />
+igt@gem_pxp@reject-modify-context-protection-off-3<br />
+igt@gem_pxp@reject-modify-context-protection-on<br />
+igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume</p>

</body>
</html>

--===============3502940481375974092==--

--===============1865316791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1865316791==--
