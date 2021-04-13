Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 13 Apr 2021 04:42:33 -0000
Message-ID: <161828895315.8795.1316383632013123289@emeril.freedesktop.org>
References: <20210413035350.261794-1-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0431198228=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0431198228==
Content-Type: multipart/alternative;
 boundary="===============4042664600308927504=="

--===============4042664600308927504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation
URL   : https://patchwork.freedesktop.org/series/88986/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9962 -> IGTPW_5735
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html

Known issues
------------

  Here are the changes found in IGTPW_5735 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][2] ([i915#2283])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283


Participating hosts (47 -> 41)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6063 -> IGTPW_5735

  CI-20190529: 20190529
  CI_DRM_9962: 2847b855cf291d61694ccfefa4f37d74d61f752b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

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
-igt@gem_exec_balancer@ringsize

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html

--===============4042664600308927504==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9962 -&gt; IGTPW_5735</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5735 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (47 -&gt; 41)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6063 -&gt; IGTPW_5735</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9962: 2847b855cf291d61694ccfefa4f37d74d61f752b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5735/index.html<br />
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>-igt@gem_ctx_clone@engines<br />
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
-igt@gem_exec_balancer@ringsize</p>

</body>
</html>

--===============4042664600308927504==--

--===============0431198228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0431198228==--
