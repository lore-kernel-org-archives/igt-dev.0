Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4362583914587637828=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Apr 2023 07:28:50 -0000
Message-ID: <168206213086.5824.10051970469333516914@emeril.freedesktop.org>
References: <8254ed384aa30dbe615f7efbe760addf38b0d27c.1682059913.git.mchehab@kernel.org>
In-Reply-To: <8254ed384aa30dbe615f7efbe760addf38b0d27c.1682059913.git.mchehab@kernel.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?b?OTE1X2hhbmdtYW46IHVzZSBpZ3RfZGVzY3JpYmVfZigp?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4362583914587637828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_hangman: use igt_describe_f()
URL   : https://patchwork.freedesktop.org/series/116800/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13037 -> IGTPW_8836
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html

Participating hosts (38 -> 32)
------------------------------

  Missing    (6): fi-kbl-soraka bat-adlp-9 fi-ilk-650 fi-snb-2520m fi-glk-j4005 bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_8836 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [PASS][1] -> [ABORT][2] ([i915#7913] / [i915#7979])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [PASS][3] -> [ABORT][4] ([i915#4983] / [i915#7911])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-rpls-1/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-ivb-3770:        NOTRUN -> [SKIP][5] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][6] ([i915#5334]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-atsm-1:         [DMESG-FAIL][8] ([i915#7699]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-atsm-1/igt@i915_selftest@live@migrate.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7263 -> IGTPW_8836

  CI-20190529: 20190529
  CI_DRM_13037: c61620cfd82da4300b7992335bca9274568accba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8836: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html
  IGT_7263: a6bd8f415c4ec41b5a014c7db47e46c81ffd0074 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_gpgpu_fill@basic
-igt@xe_intel_bb@add-remove-objects
-igt@xe_intel_bb@bb-with-allocator
-igt@xe_intel_bb@blit-reloc
-igt@xe_intel_bb@blit-simple
-igt@xe_intel_bb@create-in-region
-igt@xe_intel_bb@delta-check
-igt@xe_intel_bb@destroy-bb
-igt@xe_intel_bb@full-batch
-igt@xe_intel_bb@intel-bb-blit-none
-igt@xe_intel_bb@intel-bb-blit-x
-igt@xe_intel_bb@intel-bb-blit-y
-igt@xe_intel_bb@lot-of-buffers
-igt@xe_intel_bb@offset-control
-igt@xe_intel_bb@purge-bb
-igt@xe_intel_bb@render
-igt@xe_intel_bb@reset-bb
-igt@xe_intel_bb@simple-bb
-igt@xe_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html

--===============4362583914587637828==
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
<tr><td><b>Series:</b></td><td>i915/i915_hangman: use igt_describe_f()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116800/">https://patchwork.freedesktop.org/series/116800/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13037 -&gt; IGTPW_8836</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html</p>
<h2>Participating hosts (38 -&gt; 32)</h2>
<p>Missing    (6): fi-kbl-soraka bat-adlp-9 fi-ilk-650 fi-snb-2520m fi-glk-j4005 bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8836 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7979">i915#7979</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13037/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7263 -&gt; IGTPW_8836</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13037: c61620cfd82da4300b7992335bca9274568accba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8836: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8836/index.html<br />
  IGT_7263: a6bd8f415c4ec41b5a014c7db47e46c81ffd0074 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_gpgpu_fill@basic<br />
-igt@xe_intel_bb@add-remove-objects<br />
-igt@xe_intel_bb@bb-with-allocator<br />
-igt@xe_intel_bb@blit-reloc<br />
-igt@xe_intel_bb@blit-simple<br />
-igt@xe_intel_bb@create-in-region<br />
-igt@xe_intel_bb@delta-check<br />
-igt@xe_intel_bb@destroy-bb<br />
-igt@xe_intel_bb@full-batch<br />
-igt@xe_intel_bb@intel-bb-blit-none<br />
-igt@xe_intel_bb@intel-bb-blit-x<br />
-igt@xe_intel_bb@intel-bb-blit-y<br />
-igt@xe_intel_bb@lot-of-buffers<br />
-igt@xe_intel_bb@offset-control<br />
-igt@xe_intel_bb@purge-bb<br />
-igt@xe_intel_bb@render<br />
-igt@xe_intel_bb@reset-bb<br />
-igt@xe_intel_bb@simple-bb<br />
-igt@xe_intel_bb@simple-bb-ctx</p>

</body>
</html>

--===============4362583914587637828==--

