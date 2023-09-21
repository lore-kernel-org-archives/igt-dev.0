Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4596451954419074738=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Thu, 21 Sep 2023 00:11:30 -0000
Message-ID: <169525509008.7232.912021613124826048@emeril.freedesktop.org>
References: <20230920204632.730526-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230920204632.730526-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/inte?=
 =?utf-8?q?l=5Fcompute=3A_Fix_Incorrect_array_size_for_XEHPC_platforms?=
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

--===============4596451954419074738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Fix Incorrect array size for XEHPC platforms
URL   : https://patchwork.freedesktop.org/series/124010/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7494_BAT -> XEIGTPW_9832_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9832_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9832_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9832_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@dmabuf:
    - bat-pvc-2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_live_ktest@dmabuf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:
    - bat-pvc-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9832_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#538]) +33 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#539]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#275] / [Intel XE#541]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#540]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#537]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#536])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#535]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_psr@primary_page_flip.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][10] ([Intel XE#389]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#482]) +3 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#533]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#255])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#531])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][16] ([Intel XE#524]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7494/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_module_load@load:
    - bat-pvc-2:          [INCOMPLETE][18] ([Intel XE#597]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7494/bat-pvc-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597


Build changes
-------------

  * IGT: IGT_7494 -> IGTPW_9832
  * Linux: xe-386-805557401e7aaeeec5aeb1de6688853390738bee -> xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c

  IGTPW_9832: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9832/index.html
  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-386-805557401e7aaeeec5aeb1de6688853390738bee: 805557401e7aaeeec5aeb1de6688853390738bee
  xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c: 6e4a4aa0279d8de30726606ccf74de109af20e6c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/index.html

--===============4596451954419074738==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Fix Incorrect array size for XEHPC platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124010/">https://patchwork.freedesktop.org/series/124010/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7494_BAT -&gt; XEIGTPW_9832_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9832_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9832_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9832_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@dmabuf:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_live_ktest@dmabuf.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9832_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/538">Intel XE#538</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/275">Intel XE#275</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/536">Intel XE#536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7494/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7494/bat-pvc-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9832/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7494 -&gt; IGTPW_9832</li>
<li>Linux: xe-386-805557401e7aaeeec5aeb1de6688853390738bee -&gt; xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c</li>
</ul>
<p>IGTPW_9832: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9832/index.html<br />
  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-386-805557401e7aaeeec5aeb1de6688853390738bee: 805557401e7aaeeec5aeb1de6688853390738bee<br />
  xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c: 6e4a4aa0279d8de30726606ccf74de109af20e6c</p>

</body>
</html>

--===============4596451954419074738==--
