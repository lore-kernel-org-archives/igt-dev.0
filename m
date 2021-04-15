Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Apr 2021 19:44:07 -0000
Message-ID: <161851584729.1079.15402148599729528863@emeril.freedesktop.org>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1515211223=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1515211223==
Content-Type: multipart/alternative;
 boundary="===============2314123265829306764=="

--===============2314123265829306764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev3)
URL   : https://patchwork.freedesktop.org/series/88986/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9976 -> IGTPW_5748
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html

Known issues
------------

  Here are the changes found in IGTPW_5748 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        NOTRUN -> [INCOMPLETE][1] ([i915#2782])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [DMESG-WARN][2] ([i915#1982] / [k.org#205379]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9976/fi-tgl-y/igt@i915_module_load@reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/fi-tgl-y/igt@i915_module_load@reload.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6067 -> IGTPW_5748

  CI-20190529: 20190529
  CI_DRM_9976: 73739c865de5c4c504adff6d9873ca5dea2dc704 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html
  IGT_6067: 14317b92a672d9a20cd04fc3b0c80e2fb12d51d5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html

--===============2314123265829306764==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9976 -&gt; IGTPW_5748</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5748 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9976/fi-tgl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/fi-tgl-y/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6067 -&gt; IGTPW_5748</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9976: 73739c865de5c4c504adff6d9873ca5dea2dc704 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5748/index.html<br />
  IGT_6067: 14317b92a672d9a20cd04fc3b0c80e2fb12d51d5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
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

--===============2314123265829306764==--

--===============1515211223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1515211223==--
