Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5746747386160071019=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 01 Dec 2023 05:36:06 -0000
Message-ID: <170140896629.19688.3714666959662572769@emeril.freedesktop.org>
References: <20231201040119.2954812-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201040119.2954812-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/km?=
 =?utf-8?q?s=5Fvrr=3A_Add_new_subtest_to_switch_RR_without_modeset_=28rev4?=
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

--===============5746747386160071019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add new subtest to switch RR without modeset (rev4)
URL   : https://patchwork.freedesktop.org/series/127047/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7613_BAT -> XEIGTPW_10314_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10314_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10314_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10314_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-atsm-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - bat-pvc-2:          NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-pvc-2/igt@kms_vrr@flipline.html

  * {igt@kms_vrr@seamless-rr-switch} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-adlp-7/igt@kms_vrr@seamless-rr-switch.html

  
New tests
---------

  New tests have been introduced between XEIGT_7613_BAT and XEIGTPW_10314_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@seamless-rr-switch:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10314_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#455]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-adlp-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-dg2-oem2/igt@kms_vrr@negative-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7613 -> IGTPW_10314
  * Linux: xe-542-84f2c2adec155170779f65ff63b4e80a51d22448 -> xe-543-450234a8c60f880247d4f3a3137058eec6f4e491

  IGTPW_10314: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10314/index.html
  IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-542-84f2c2adec155170779f65ff63b4e80a51d22448: 84f2c2adec155170779f65ff63b4e80a51d22448
  xe-543-450234a8c60f880247d4f3a3137058eec6f4e491: 450234a8c60f880247d4f3a3137058eec6f4e491

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/index.html

--===============5746747386160071019==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add new subtest to switch RR without modeset (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127047/">https://patchwork.freedesktop.org/series/127047/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7613_BAT -&gt; XEIGTPW_10314_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10314_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10314_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10314_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-atsm-2/igt@kms_vrr@flip-basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-pvc-2/igt@kms_vrr@flipline.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-adlp-7/igt@kms_vrr@seamless-rr-switch.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7613_BAT and XEIGTPW_10314_BAT:</p>
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
<p>Here are the changes found in XEIGTPW_10314_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-adlp-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10314/bat-dg2-oem2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7613 -&gt; IGTPW_10314</li>
<li>Linux: xe-542-84f2c2adec155170779f65ff63b4e80a51d22448 -&gt; xe-543-450234a8c60f880247d4f3a3137058eec6f4e491</li>
</ul>
<p>IGTPW_10314: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10314/index.html<br />
  IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-542-84f2c2adec155170779f65ff63b4e80a51d22448: 84f2c2adec155170779f65ff63b4e80a51d22448<br />
  xe-543-450234a8c60f880247d4f3a3137058eec6f4e491: 450234a8c60f880247d4f3a3137058eec6f4e491</p>

</body>
</html>

--===============5746747386160071019==--
