Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Dec 2020 12:08:30 -0000
Message-ID: <160708371004.27541.15564454741310637305@emeril.freedesktop.org>
References: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exercise_execution_along_context_while_closi?=
 =?utf-8?q?ng_it_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0678706136=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0678706136==
Content-Type: multipart/alternative;
 boundary="===============5937925205971592150=="

--===============5937925205971592150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_exec: Exercise execution along context while closing it (rev3)
URL   : https://patchwork.freedesktop.org/series/84530/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9441 -> IGTPW_5248
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html

Known issues
------------

  Here are the changes found in IGTPW_5248 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-tgl-y:           [DMESG-WARN][3] ([i915#402]) -> [PASS][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-tgl-y/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/fi-tgl-y/igt@gem_exec_gttfill@basic.html

  
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5880 -> IGTPW_5248

  CI-20190529: 20190529
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_exec@basic-close-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html

--===============5937925205971592150==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_exec: Exercise execution along context while closing it (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84530/">https://patchwork.freedesktop.org/series/84530/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9441 -&gt; IGTPW_5248</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5248 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-tgl-y/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/fi-tgl-y/igt@gem_exec_gttfill@basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5880 -&gt; IGTPW_5248</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html<br />
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_ctx_exec@basic-close-race</p>

</body>
</html>

--===============5937925205971592150==--

--===============0678706136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0678706136==--
