Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0404754693422653532=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Aug 2021 08:40:51 -0000
Message-ID: <162867125194.27219.11702692447433147782@emeril.freedesktop.org>
References: <20210811073513.726866-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210811073513.726866-1-thomas.hellstrom@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flmem=5Fswapping=3A_Add_the_gem=5Flmem=5Fswapping_tes?=
 =?utf-8?q?t?=
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
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0404754693422653532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test
URL   : https://patchwork.freedesktop.org/series/93584/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6168 -> IGTPW_6115
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6115 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6115, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6115:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-rkl-11600:       [PASS][1] -> [SKIP][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
Known issues
------------

  Here are the changes found in IGTPW_6115 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [PASS][3] -> [DMESG-WARN][4] ([i915#3925])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#1888])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@runner@aborted:
    - fi-rkl-guc:         NOTRUN -> [FAIL][7] ([i915#1602])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-guc/igt@runner@aborted.html

  
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925


Participating hosts (36 -> 34)
------------------------------

  Missing    (2): fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6168 -> IGTPW_6115

  CI-20190529: 20190529
  CI_DRM_10465: b183cdc9ca5e84a70c1d9d57ab317319fb6bed65 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6115: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html
  IGT_6168: 3bd2406f7610c44cc4381650cc86631cff63932d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_lmem_swapping@basic
+igt@gem_lmem_swapping@heavy-multi
+igt@gem_lmem_swapping@heavy-random
+igt@gem_lmem_swapping@heavy-verify-multi
+igt@gem_lmem_swapping@heavy-verify-random
+igt@gem_lmem_swapping@parallel-multi
+igt@gem_lmem_swapping@parallel-random
+igt@gem_lmem_swapping@parallel-random-engines
+igt@gem_lmem_swapping@parallel-random-verify
+igt@gem_lmem_swapping@random
+igt@gem_lmem_swapping@random-engines
+igt@gem_lmem_swapping@smem-oom
+igt@gem_lmem_swapping@verify
+igt@gem_lmem_swapping@verify-random

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html

--===============0404754693422653532==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93584/">https://patchwork.freedesktop.org/series/93584/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6168 -&gt; IGTPW_6115</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6115 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6115, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6115:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-pipe-b:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6115 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6168/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (36 -&gt; 34)</h2>
<p>Missing    (2): fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6168 -&gt; IGTPW_6115</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10465: b183cdc9ca5e84a70c1d9d57ab317319fb6bed65 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6115: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6115/index.html<br />
  IGT_6168: 3bd2406f7610c44cc4381650cc86631cff63932d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_lmem_swapping@basic<br />
+igt@gem_lmem_swapping@heavy-multi<br />
+igt@gem_lmem_swapping@heavy-random<br />
+igt@gem_lmem_swapping@heavy-verify-multi<br />
+igt@gem_lmem_swapping@heavy-verify-random<br />
+igt@gem_lmem_swapping@parallel-multi<br />
+igt@gem_lmem_swapping@parallel-random<br />
+igt@gem_lmem_swapping@parallel-random-engines<br />
+igt@gem_lmem_swapping@parallel-random-verify<br />
+igt@gem_lmem_swapping@random<br />
+igt@gem_lmem_swapping@random-engines<br />
+igt@gem_lmem_swapping@smem-oom<br />
+igt@gem_lmem_swapping@verify<br />
+igt@gem_lmem_swapping@verify-random</p>

</body>
</html>

--===============0404754693422653532==--
