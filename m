Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Apr 2021 22:43:51 -0000
Message-ID: <161921783108.2791.1927201999516544354@emeril.freedesktop.org>
References: <20210423214853.876911-1-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1349771162=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1349771162==
Content-Type: multipart/alternative;
 boundary="===============5160360463873570493=="

--===============5160360463873570493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev4)
URL   : https://patchwork.freedesktop.org/series/88986/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10005 -> IGTPW_5761
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html

Known issues
------------

  Here are the changes found in IGTPW_5761 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750


Participating hosts (43 -> 37)
------------------------------

  Additional (1): fi-rkl-11500t 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6074 -> IGTPW_5761

  CI-20190529: 20190529
  CI_DRM_10005: 7a27cb7ac19a95d801c391044cea5274677e7744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5761: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html
  IGT_6074: 3f43ae9fd22dc5a517786b984dc3aa717997664f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html

--===============5160360463873570493==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10005 -&gt; IGTPW_5761</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5761 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10005/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Additional (1): fi-rkl-11500t <br />
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6074 -&gt; IGTPW_5761</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10005: 7a27cb7ac19a95d801c391044cea5274677e7744 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5761: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5761/index.html<br />
  IGT_6074: 3f43ae9fd22dc5a517786b984dc3aa717997664f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>-igt@api_intel_bb@bb-with-vm<br />
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

--===============5160360463873570493==--

--===============1349771162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1349771162==--
