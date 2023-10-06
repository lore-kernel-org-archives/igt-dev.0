Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8123387164616112808=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 06 Oct 2023 06:54:31 -0000
Message-ID: <169657527189.6466.13744954979432021324@emeril.freedesktop.org>
References: <20231006045430.4968-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231006045430.4968-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/km?=
 =?utf-8?q?s=5Fcursor=5Fcrc=3A_Optimize_the_test_for_simulation?=
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

--===============8123387164616112808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Optimize the test for simulation
URL   : https://patchwork.freedesktop.org/series/124696/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7518_BAT -> XEIGTPW_9935_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_9935_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#282] / [Intel XE#749])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] ([Intel XE#282])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#773]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#400]) -> [TIMEOUT][10] ([Intel XE#430] / [Intel XE#530])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#400]) -> [TIMEOUT][12] ([Intel XE#530])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [Intel XE#773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/773


Build changes
-------------

  * IGT: IGT_7518 -> IGTPW_9935

  IGTPW_9935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9935/index.html
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/index.html

--===============8123387164616112808==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Optimize the test for simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124696/">https://patchwork.freedesktop.org/series/124696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7518_BAT -&gt; XEIGTPW_9935_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9935_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/773">Intel XE#773</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9935/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7518 -&gt; IGTPW_9935</li>
</ul>
<p>IGTPW_9935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9935/index.html<br />
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e</p>

</body>
</html>

--===============8123387164616112808==--
