Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 22 Oct 2020 16:34:58 -0000
Message-ID: <160338449825.7805.12082859582520290299@emeril.freedesktop.org>
References: <20201022150943.3041180-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201022150943.3041180-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmmap=5Fgtt=3A_Trim_object_size_for_ptracing?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0634137018=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0634137018==
Content-Type: multipart/alternative;
 boundary="===============7720126893015060908=="

--===============7720126893015060908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_mmap_gtt: Trim object size for ptracing
URL   : https://patchwork.freedesktop.org/series/82959/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9184 -> IGTPW_5085
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html

Known issues
------------

  Here are the changes found in IGTPW_5085 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_create@basic-files:
    - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#1635])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-apl-guc/igt@gem_ctx_create@basic-files.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-apl-guc/igt@gem_ctx_create@basic-files.html

  * igt@vgem_basic@unload:
    - fi-skl-guc:         [PASS][3] -> [DMESG-WARN][4] ([i915#2203])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-skl-guc/igt@vgem_basic@unload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-skl-guc/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@gem_basic@create-fd-close:
    - fi-byt-j1900:       [DMESG-WARN][5] ([i915#1982]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-byt-j1900/igt@gem_basic@create-fd-close.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-byt-j1900/igt@gem_basic@create-fd-close.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-icl-u2:          [DMESG-WARN][9] ([i915#1982] / [i915#289]) -> [DMESG-WARN][10] ([i915#289])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html

  
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289


Participating hosts (46 -> 39)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5085

  CI-20190529: 20190529
  CI_DRM_9184: f815594e102e8ca3bfd611f11fb68c3ddb18dcd6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html

--===============7720126893015060908==
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
<tr><td><b>Series:</b></td><td>i915/gem_mmap_gtt: Trim object size for ptracing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82959/">https://patchwork.freedesktop.org/series/82959/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9184 -&gt; IGTPW_5085</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5085 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-apl-guc/igt@gem_ctx_create@basic-files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-apl-guc/igt@gem_ctx_create@basic-files.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-skl-guc/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_basic@create-fd-close:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-byt-j1900/igt@gem_basic@create-fd-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-byt-j1900/igt@gem_basic@create-fd-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (46 -&gt; 39)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5822 -&gt; IGTPW_5085</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9184: f815594e102e8ca3bfd611f11fb68c3ddb18dcd6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7720126893015060908==--

--===============0634137018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0634137018==--
