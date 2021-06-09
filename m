Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Jun 2021 19:03:06 -0000
Message-ID: <162326538624.27475.13564149235850209007@emeril.freedesktop.org>
References: <20210609173632.248880-1-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0511673358=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0511673358==
Content-Type: multipart/alternative;
 boundary="===============7443585560903019164=="

--===============7443585560903019164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev6)
URL   : https://patchwork.freedesktop.org/series/88986/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10198 -> IGTPW_5906
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5906:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fence@nb-await:
    - {fi-rkl-11500t}:    [SKIP][1] ([i915#3539]) -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-rkl-11500t/igt@gem_exec_fence@nb-await.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-rkl-11500t/igt@gem_exec_fence@nb-await.html

  
Known issues
------------

  Here are the changes found in IGTPW_5906 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [PASS][3] -> [INCOMPLETE][4] ([i915#2782])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#2203] / [i915#2868])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-u2:          [INCOMPLETE][7] ([i915#2782] / [i915#3462]) -> [DMESG-FAIL][8] ([i915#3462])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@i915_selftest@live@execlists.html
    - fi-bsw-kefka:       [INCOMPLETE][9] ([i915#2782] / [i915#2940] / [i915#3462]) -> [DMESG-FAIL][10] ([i915#3462])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
    - fi-tgl-u2:          [DMESG-FAIL][11] ([i915#3462]) -> [INCOMPLETE][12] ([i915#3462])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-tgl-u2/igt@i915_selftest@live@execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-tgl-u2/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-icl-u2:          [FAIL][13] ([i915#2782] / [i915#3363]) -> [FAIL][14] ([i915#2426] / [i915#2782] / [i915#3363])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][15] ([i915#3462]) -> [FAIL][16] ([i915#1602] / [i915#2029])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bdw-5557u/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bdw-5557u/igt@runner@aborted.html
    - fi-bxt-dsi:         [FAIL][17] ([i915#2426] / [i915#3363]) -> [FAIL][18] ([i915#3363])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bxt-dsi/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bxt-dsi/igt@runner@aborted.html
    - fi-cml-s:           [FAIL][19] ([i915#3363] / [i915#3462]) -> [FAIL][20] ([i915#2082] / [i915#2426] / [i915#3363] / [i915#3462])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-cml-s/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-cml-s/igt@runner@aborted.html
    - fi-kbl-7567u:       [FAIL][21] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][22] ([i915#1436] / [i915#3363])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-kbl-7567u/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-kbl-7567u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539


Participating hosts (46 -> 39)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6103 -> IGTPW_5906

  CI-20190529: 20190529
  CI_DRM_10198: c50f36ae2f61278b857abe46b8e226191bc13f7b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5906: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_ctx_param@invalid-get-engines
+igt@gem_ctx_param@invalid-get-no-zeromap
+igt@gem_ctx_param@invalid-get-ringsize
+igt@gem_ctx_param@invalid-set-no-zeromap
+igt@gem_ctx_param@invalid-set-ringsize
-igt@api_intel_bb@bb-with-vm
-igt@gem_ctx_clone@engines
-igt@gem_ctx_clone@flags
-igt@gem_ctx_clone@invalid
-igt@gem_ctx_clone@scheduler
-igt@gem_ctx_clone@vm
-igt@gem_ctx_engines@idempotent
-igt@gem_ctx_engines@libapi
-igt@gem_ctx_param@non-root-set-no-zeromap
-igt@gem_ctx_param@root-set-no-zeromap-disabled
-igt@gem_ctx_param@root-set-no-zeromap-enabled
-igt@gem_ctx_persistence@clone
-igt@gem_ctx_persistence@close-replace-race
-igt@gem_ctx_persistence@replace
-igt@gem_ctx_persistence@replace-hostile
-igt@gem_ctx_ringsize@active
-igt@gem_ctx_ringsize@clone
-igt@gem_ctx_ringsize@create
-igt@gem_ctx_ringsize@idempotent
-igt@gem_ctx_ringsize@idle
-igt@gem_ctx_ringsize@invalid
-igt@gem_ctx_ringsize@plugged
-igt@gem_exec_balancer@bonded-cork
-igt@gem_exec_balancer@bonded-early
-igt@gem_exec_balancer@bonded-imm
-igt@gem_exec_balancer@ringsize
-igt@gem_vm_create@async-destroy
-igt@gem_vm_create@destroy-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html

--===============7443585560903019164==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10198 -&gt; IGTPW_5906</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5906:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_fence@nb-await:<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-rkl-11500t/igt@gem_exec_fence@nb-await.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-rkl-11500t/igt@gem_exec_fence@nb-await.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5906 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-y/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-y/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-tgl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-tgl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 39)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6103 -&gt; IGTPW_5906</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10198: c50f36ae2f61278b857abe46b8e226191bc13f7b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5906: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html<br />
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_ctx_param@invalid-get-engines<br />
+igt@gem_ctx_param@invalid-get-no-zeromap<br />
+igt@gem_ctx_param@invalid-get-ringsize<br />
+igt@gem_ctx_param@invalid-set-no-zeromap<br />
+igt@gem_ctx_param@invalid-set-ringsize<br />
-igt@api_intel_bb@bb-with-vm<br />
-igt@gem_ctx_clone@engines<br />
-igt@gem_ctx_clone@flags<br />
-igt@gem_ctx_clone@invalid<br />
-igt@gem_ctx_clone@scheduler<br />
-igt@gem_ctx_clone@vm<br />
-igt@gem_ctx_engines@idempotent<br />
-igt@gem_ctx_engines@libapi<br />
-igt@gem_ctx_param@non-root-set-no-zeromap<br />
-igt@gem_ctx_param@root-set-no-zeromap-disabled<br />
-igt@gem_ctx_param@root-set-no-zeromap-enabled<br />
-igt@gem_ctx_persistence@clone<br />
-igt@gem_ctx_persistence@close-replace-race<br />
-igt@gem_ctx_persistence@replace<br />
-igt@gem_ctx_persistence@replace-hostile<br />
-igt@gem_ctx_ringsize@active<br />
-igt@gem_ctx_ringsize@clone<br />
-igt@gem_ctx_ringsize@create<br />
-igt@gem_ctx_ringsize@idempotent<br />
-igt@gem_ctx_ringsize@idle<br />
-igt@gem_ctx_ringsize@invalid<br />
-igt@gem_ctx_ringsize@plugged<br />
-igt@gem_exec_balancer@bonded-cork<br />
-igt@gem_exec_balancer@bonded-early<br />
-igt@gem_exec_balancer@bonded-imm<br />
-igt@gem_exec_balancer@ringsize<br />
-igt@gem_vm_create@async-destroy<br />
-igt@gem_vm_create@destroy-race</p>

</body>
</html>

--===============7443585560903019164==--

--===============0511673358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0511673358==--
