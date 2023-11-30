Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5488704024074643255=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 30 Nov 2023 22:18:03 -0000
Message-ID: <170138268305.15642.5564934728776572510@emeril.freedesktop.org>
References: <20231130173837.2915568-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231130173837.2915568-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/km?=
 =?utf-8?q?s=5Fvrr=3A_Add_new_subtest_to_switch_RR_without_modeset_=28rev3?=
 =?utf-8?q?=29?=
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

--===============5488704024074643255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add new subtest to switch RR without modeset (rev3)
URL   : https://patchwork.freedesktop.org/series/127047/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7612_BAT -> XEIGTPW_10310_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10310_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10310_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10310_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-atsm-2/igt@kms_vrr@flip-basic.html

  * {igt@kms_vrr@seamless-rr-switch} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-pvc-2/igt@kms_vrr@seamless-rr-switch.html
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-adlp-7/igt@kms_vrr@seamless-rr-switch.html

  
New tests
---------

  New tests have been introduced between XEIGT_7612_BAT and XEIGTPW_10310_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@seamless-rr-switch:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10310_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#455])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-adlp-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-dg2-oem2/igt@kms_vrr@negative-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7612 -> IGTPW_10310
  * Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -> xe-541-68b673dd7ccbe64715e0a7492897e8d992040016

  IGTPW_10310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10310/index.html
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/index.html

--===============5488704024074643255==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add new subtest to switch RR without modeset (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127047/">https://patchwork.freedesktop.org/series/127047/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7612_BAT -&gt; XEIGTPW_10310_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10310_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10310_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10310_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-atsm-2/igt@kms_vrr@flip-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch} (NEW):</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-pvc-2/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-adlp-7/igt@kms_vrr@seamless-rr-switch.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7612_BAT and XEIGTPW_10310_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@seamless-rr-switch:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10310_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-adlp-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10310/bat-dg2-oem2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7612 -&gt; IGTPW_10310</li>
<li>Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -&gt; xe-541-68b673dd7ccbe64715e0a7492897e8d992040016</li>
</ul>
<p>IGTPW_10310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10310/index.html<br />
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083<br />
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016</p>

</body>
</html>

--===============5488704024074643255==--
