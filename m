Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Nov 2020 12:41:16 -0000
Message-ID: <160440727685.25742.941276514146545843@emeril.freedesktop.org>
References: <20201103104712.29233-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201103104712.29233-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1916429936=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1916429936==
Content-Type: multipart/alternative;
 boundary="===============3761760471976521772=="

--===============3761760471976521772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev8)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9252 -> IGTPW_5123
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html

Known issues
------------

  Here are the changes found in IGTPW_5123 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-lmem:        [PASS][1] -> [DMESG-WARN][2] ([i915#2605])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-skl-lmem/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-skl-lmem/igt@core_hotunplug@unbind-rebind.html
    - fi-blb-e6850:       [PASS][3] -> [INCOMPLETE][4] ([i915#2540])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [PASS][5] -> [DMESG-WARN][6] ([i915#1635] / [i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-apl-guc/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-icl-u2:          [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2540]: https://gitlab.freedesktop.org/drm/intel/issues/2540
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5830 -> IGTPW_5123

  CI-20190529: 20190529
  CI_DRM_9252: bb8053708f1889f738f4247e84ef5e051e1e178d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_allocator@alloc-simple
+igt@api_intel_allocator@fork-simple-once
+igt@api_intel_allocator@fork-simple-stress
+igt@api_intel_allocator@fork-simple-stress-signal
+igt@api_intel_allocator@print
+igt@api_intel_allocator@random-allocator
+igt@api_intel_allocator@reopen
+igt@api_intel_allocator@reopen-fork
+igt@api_intel_allocator@reserve
+igt@api_intel_allocator@reserve-simple
+igt@api_intel_allocator@reuse
+igt@api_intel_allocator@simple-allocator
+igt@api_intel_allocator@two-level-inception
+igt@api_intel_allocator@two-level-inception-interruptible
+igt@api_intel_bb@add-remove-objects
+igt@api_intel_bb@blit-noreloc-keep-cache-random
+igt@api_intel_bb@blit-noreloc-purge-cache-random
+igt@api_intel_bb@destroy-bb
+igt@api_intel_bb@object-noreloc-keep-cache-random
+igt@api_intel_bb@object-noreloc-keep-cache-simple
+igt@api_intel_bb@object-noreloc-purge-cache-random
+igt@api_intel_bb@object-noreloc-purge-cache-simple
+igt@api_intel_bb@object-reloc-keep-cache
+igt@api_intel_bb@object-reloc-purge-cache
+igt@api_intel_bb@purge-bb
+igt@api_intel_bb@reset-bb
-igt@api_intel_bb@check-canonical

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html

--===============3761760471976521772==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9252 -&gt; IGTPW_5123</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5123 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-skl-lmem/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-skl-lmem/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2540">i915#2540</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5830 -&gt; IGTPW_5123</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9252: bb8053708f1889f738f4247e84ef5e051e1e178d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html<br />
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_allocator@alloc-simple<br />
+igt@api_intel_allocator@fork-simple-once<br />
+igt@api_intel_allocator@fork-simple-stress<br />
+igt@api_intel_allocator@fork-simple-stress-signal<br />
+igt@api_intel_allocator@print<br />
+igt@api_intel_allocator@random-allocator<br />
+igt@api_intel_allocator@reopen<br />
+igt@api_intel_allocator@reopen-fork<br />
+igt@api_intel_allocator@reserve<br />
+igt@api_intel_allocator@reserve-simple<br />
+igt@api_intel_allocator@reuse<br />
+igt@api_intel_allocator@simple-allocator<br />
+igt@api_intel_allocator@two-level-inception<br />
+igt@api_intel_allocator@two-level-inception-interruptible<br />
+igt@api_intel_bb@add-remove-objects<br />
+igt@api_intel_bb@blit-noreloc-keep-cache-random<br />
+igt@api_intel_bb@blit-noreloc-purge-cache-random<br />
+igt@api_intel_bb@destroy-bb<br />
+igt@api_intel_bb@object-noreloc-keep-cache-random<br />
+igt@api_intel_bb@object-noreloc-keep-cache-simple<br />
+igt@api_intel_bb@object-noreloc-purge-cache-random<br />
+igt@api_intel_bb@object-noreloc-purge-cache-simple<br />
+igt@api_intel_bb@object-reloc-keep-cache<br />
+igt@api_intel_bb@object-reloc-purge-cache<br />
+igt@api_intel_bb@purge-bb<br />
+igt@api_intel_bb@reset-bb<br />
-igt@api_intel_bb@check-canonical</p>

</body>
</html>

--===============3761760471976521772==--

--===============1916429936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1916429936==--
