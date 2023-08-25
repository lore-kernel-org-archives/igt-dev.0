Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2420322479925983308=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 25 Aug 2023 05:06:26 -0000
Message-ID: <169293998688.10955.15044457410280085400@emeril.freedesktop.org>
References: <20230825033243.1690-1-karthik.b.s@intel.com>
In-Reply-To: <20230825033243.1690-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/i9?=
 =?utf-8?q?15/kms=5Fbig=5Fjoiner=3A_Test_Cleanup?=
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

--===============2420322479925983308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_big_joiner: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/122882/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7452_BAT -> XEIGTPW_9655_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9655_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9655_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9655_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#400]) -> [DMESG-FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9655_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][7] ([Intel XE#277]) -> [SKIP][8] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_7452 -> IGTPW_9655

  IGTPW_9655: 9655
  IGT_7452: 7452
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5



--===============2420322479925983308==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_big_joiner: Test Cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122882/">https://patchwork.freedesktop.org/series/122882/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7452_BAT -&gt; XEIGTPW_9655_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9655_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9655_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9655_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9655_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9655/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7452 -&gt; IGTPW_9655</li>
</ul>
<p>IGTPW_9655: 9655<br />
  IGT_7452: 7452<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5</p>

</body>
</html>

--===============2420322479925983308==--
