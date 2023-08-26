Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1935326056794617847=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Sat, 26 Aug 2023 19:58:15 -0000
Message-ID: <169307989507.6794.14258302371730018997@emeril.freedesktop.org>
References: <20220421133638.1492-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220421133638.1492-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_kms_leas?=
 =?utf-8?q?e?=
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

--===============1935326056794617847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms lease
URL   : https://patchwork.freedesktop.org/series/122944/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7454_BAT -> XEIGTPW_9668_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9668_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9668_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 3)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9668_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_lease@simple_lease@pipe-c-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_lease@simple_lease@pipe-c-dp-3.html

  * igt@kms_lease@simple_lease@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_lease@simple_lease@pipe-d-edp-1.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9668_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([i915#5274])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_lease@lease_revoke@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][4] ([Intel XE#456]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_lease@lease_revoke@pipe-c-edp-1.html

  * igt@kms_lease@multimaster-lease:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#539]) +20 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-atsm-2/igt@kms_lease@multimaster-lease.html

  * igt@kms_lease@simple_lease@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#456]) +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_lease@simple_lease@pipe-a-dp-3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - bat-adlp-7:         [PASS][8] -> [FAIL][9] ([Intel XE#400]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7454/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([i915#1072]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#252])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#288]) +17 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#255])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][14] ([Intel XE#483]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/252
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/456
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7454 -> IGTPW_9668

  IGTPW_9668: 9668
  IGT_7454: 7454
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5



--===============1935326056794617847==
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
<tr><td><b>Series:</b></td><td>kms lease</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122944/">https://patchwork.freedesktop.org/series/122944/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7454_BAT -&gt; XEIGTPW_9668_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9668_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9668_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 3)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9668_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_lease@simple_lease@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_lease@simple_lease@pipe-c-dp-3.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_lease@simple_lease@pipe-d-edp-1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9668_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_lease@lease_revoke@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/456">Intel XE#456</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-atsm-2/igt@kms_lease@multimaster-lease.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_lease@simple_lease@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/456">Intel XE#456</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) +2 similar issues</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7454/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/252">Intel XE#252</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9668/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7454 -&gt; IGTPW_9668</li>
</ul>
<p>IGTPW_9668: 9668<br />
  IGT_7454: 7454<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5</p>

</body>
</html>

--===============1935326056794617847==--
