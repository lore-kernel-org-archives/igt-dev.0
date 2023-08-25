Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0670570093686127284=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 10:38:27 -0000
Message-ID: <169295990752.10954.17636746438515543158@emeril.freedesktop.org>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_XE_s?=
 =?utf-8?q?upport_for_Async_flip_tests?=
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

--===============0670570093686127284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add XE support for Async flip tests
URL   : https://patchwork.freedesktop.org/series/122893/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7452_BAT -> XEIGTPW_9659_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9659_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9659_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9659_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-3-4-rc_ccs-cc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-3-4-rc_ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y-rc_ccs:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][4] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@crc@pipe-a-dp-3.html

  * igt@kms_async_flips@test-cursor@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@test-cursor@pipe-a-dp-3.html

  * igt@kms_async_flips@test-time-stamp@pipe-a-edp-1:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][6] +32 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@test-time-stamp@pipe-a-edp-1.html

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-adlp-7/igt@kms_psr@primary_page_flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9659_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][9] ([Intel XE#324])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][10] ([Intel XE#324])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#539]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-atsm-2/igt@kms_async_flips@crc.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][12] ([Intel XE#277]) -> [SKIP][13] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_7452 -> IGTPW_9659

  IGTPW_9659: 9659
  IGT_7452: 7452
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5



--===============0670570093686127284==
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
<tr><td><b>Series:</b></td><td>Add XE support for Async flip tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122893/">https://patchwork.freedesktop.org/series/122893/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7452_BAT -&gt; XEIGTPW_9659_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9659_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9659_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9659_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-3-4-rc_ccs-cc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-3-4-rc_ccs-cc.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-linear.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y-rc_ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y-rc_ccs.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@crc@pipe-a-dp-3.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-dg2-oem2/igt@kms_async_flips@test-cursor@pipe-a-dp-3.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@test-time-stamp@pipe-a-edp-1.html">DMESG-FAIL</a> +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-adlp-7/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_psr@primary_page_flip.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9659_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-atsm-2/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9659/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7452 -&gt; IGTPW_9659</li>
</ul>
<p>IGTPW_9659: 9659<br />
  IGT_7452: 7452<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5</p>

</body>
</html>

--===============0670570093686127284==--
