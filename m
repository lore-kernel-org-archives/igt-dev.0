Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4164306644823686606=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 26 Apr 2023 08:23:15 -0000
Message-ID: <168249739548.17153.10897634153875041785@emeril.freedesktop.org>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_intel-bb_with_Xe_=28rev9=29?=
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

--===============4164306644823686606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrate intel-bb with Xe (rev9)
URL   : https://patchwork.freedesktop.org/series/116578/
State : success

== Summary ==

CI Bug Log - changes from IGT_7271 -> IGTPW_8865
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8865 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8865, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8865:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       [ABORT][1] ([i915#8397]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@slpc:
    - {bat-mtlp-8}:       NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_8865 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@migrate:
    - bat-atsm-1:         [PASS][4] -> [FAIL][5] ([i915#6268] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][6] ([i915#3546]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [ABORT][7] ([i915#7920]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][9] ([i915#7932]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8397]: https://gitlab.freedesktop.org/drm/intel/issues/8397


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7271 -> IGTPW_8865

  CI-20190529: 20190529
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8865: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_gpgpu_fill@basic
+igt@xe_intel_bb@add-remove-objects
+igt@xe_intel_bb@bb-with-allocator
+igt@xe_intel_bb@blit-reloc
+igt@xe_intel_bb@blit-simple
+igt@xe_intel_bb@create-in-region
+igt@xe_intel_bb@delta-check
+igt@xe_intel_bb@destroy-bb
+igt@xe_intel_bb@full-batch
+igt@xe_intel_bb@intel-bb-blit-none
+igt@xe_intel_bb@intel-bb-blit-x
+igt@xe_intel_bb@intel-bb-blit-y
+igt@xe_intel_bb@lot-of-buffers
+igt@xe_intel_bb@offset-control
+igt@xe_intel_bb@purge-bb
+igt@xe_intel_bb@render
+igt@xe_intel_bb@reset-bb
+igt@xe_intel_bb@simple-bb
+igt@xe_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html

--===============4164306644823686606==
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
<tr><td><b>Series:</b></td><td>Integrate intel-bb with Xe (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116578/">https://patchwork.freedesktop.org/series/116578/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7271 -&gt; IGTPW_8865</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8865 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8865, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8865:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8397">i915#8397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-mtlp-8/igt@i915_selftest@live@slpc.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8865 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-atsm-1/igt@i915_selftest@live@migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7271 -&gt; IGTPW_8865</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8865: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8865/index.html<br />
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_gpgpu_fill@basic<br />
+igt@xe_intel_bb@add-remove-objects<br />
+igt@xe_intel_bb@bb-with-allocator<br />
+igt@xe_intel_bb@blit-reloc<br />
+igt@xe_intel_bb@blit-simple<br />
+igt@xe_intel_bb@create-in-region<br />
+igt@xe_intel_bb@delta-check<br />
+igt@xe_intel_bb@destroy-bb<br />
+igt@xe_intel_bb@full-batch<br />
+igt@xe_intel_bb@intel-bb-blit-none<br />
+igt@xe_intel_bb@intel-bb-blit-x<br />
+igt@xe_intel_bb@intel-bb-blit-y<br />
+igt@xe_intel_bb@lot-of-buffers<br />
+igt@xe_intel_bb@offset-control<br />
+igt@xe_intel_bb@purge-bb<br />
+igt@xe_intel_bb@render<br />
+igt@xe_intel_bb@reset-bb<br />
+igt@xe_intel_bb@simple-bb<br />
+igt@xe_intel_bb@simple-bb-ctx</p>

</body>
</html>

--===============4164306644823686606==--
