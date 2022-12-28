Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6947458199965713096=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Wed, 28 Dec 2022 12:42:04 -0000
Message-ID: <167223132464.24092.2589991622955890523@emeril.freedesktop.org>
References: <20221216191124.27930-1-mohammed.thasleem@intel.com>
In-Reply-To: <20221216191124.27930-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc_=3A_Check_DC5_state_with_externel_active_pa?=
 =?utf-8?q?nel_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============6947458199965713096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc : Check DC5 state with externel active panel (rev3)
URL   : https://patchwork.freedesktop.org/series/112025/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12528 -> IGTPW_8279
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8279 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8279, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html

Participating hosts (40 -> 42)
------------------------------

  Additional (3): fi-kbl-soraka bat-dg2-9 fi-bsw-kefka 
  Missing    (1): bat-rpls-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8279:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_8279 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271]) +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html
    - fi-pnv-d510:        [PASS][3] -> [FAIL][4] ([i915#7229])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adlp-4:         NOTRUN -> [SKIP][7] ([i915#4613]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlp-4:         NOTRUN -> [SKIP][8] ([i915#6621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - bat-adlp-4:         NOTRUN -> [SKIP][11] ([fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-snb-2600:        NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-snb-2600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][15] ([fdo#109271]) +17 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][16] ([fdo#109295] / [i915#3301] / [i915#3708])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-adlp-4:         NOTRUN -> [SKIP][17] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - bat-adlp-4:         [DMESG-WARN][18] ([i915#7077]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8109u:       [DMESG-FAIL][20] ([i915#5334]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][22] ([i915#4785]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - {bat-adlp-9}:       [DMESG-WARN][24] ([i915#2867]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7104 -> IGTPW_8279

  CI-20190529: 20190529
  CI_DRM_12528: 7e9f060b6f2ad746710306da06ba9c4a53876357 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8279: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_dc@dc5-dpms-negative
-igt@kms_dsc@dsc-with-invalid-bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html

--===============6947458199965713096==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc : Check DC5 state with externel active panel (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112025/">https://patchwork.freedesktop.org/series/112025/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12528 -&gt; IGTPW_8279</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8279 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8279, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html</p>
<h2>Participating hosts (40 -&gt; 42)</h2>
<p>Additional (3): fi-kbl-soraka bat-dg2-9 fi-bsw-kefka <br />
  Missing    (1): bat-rpls-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8279:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8279 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-snb-2600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12528/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7104 -&gt; IGTPW_8279</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12528: 7e9f060b6f2ad746710306da06ba9c4a53876357 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8279: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8279/index.html<br />
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_dc@dc5-dpms-negative<br />
-igt@kms_dsc@dsc-with-invalid-bpc</p>

</body>
</html>

--===============6947458199965713096==--
