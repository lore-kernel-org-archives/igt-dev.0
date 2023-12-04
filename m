Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6194835593981945771=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 04 Dec 2023 09:30:14 -0000
Message-ID: <170168221496.20594.11217505138729484831@emeril.freedesktop.org>
References: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/km?=
 =?utf-8?q?s=5Fvrr=3A_Add_new_subtest_to_switch_RR_without_modeset_=28rev6?=
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

--===============6194835593981945771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add new subtest to switch RR without modeset (rev6)
URL   : https://patchwork.freedesktop.org/series/127047/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7614_BAT -> XEIGTPW_10327_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10327_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10327_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10327_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-atsm-2/igt@kms_vrr@flip-basic.html

  * {igt@kms_vrr@seamless-rr-switch-drrs} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][2] +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-pvc-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  
New tests
---------

  New tests have been introduced between XEIGT_7614_BAT and XEIGTPW_10327_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10327_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#455]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-adlp-7/igt@kms_vrr@flip-basic.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][4] ([Intel XE#465]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-dg2-oem2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-dg2-oem2/igt@kms_vrr@negative-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/465


Build changes
-------------

  * IGT: IGT_7614 -> IGTPW_10327
  * Linux: xe-544-a8b405ffc0326c79abf737389d99c290648f381d -> xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4

  IGTPW_10327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10327/index.html
  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-544-a8b405ffc0326c79abf737389d99c290648f381d: a8b405ffc0326c79abf737389d99c290648f381d
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/index.html

--===============6194835593981945771==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add new subtest to switch RR without modeset (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127047/">https://patchwork.freedesktop.org/series/127047/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7614_BAT -&gt; XEIGTPW_10327_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10327_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10327_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10327_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-atsm-2/igt@kms_vrr@flip-basic.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch-drrs} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-pvc-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7614_BAT and XEIGTPW_10327_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10327_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-adlp-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-dg2-oem2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/465">Intel XE#465</a>) +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10327/bat-dg2-oem2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7614 -&gt; IGTPW_10327</li>
<li>Linux: xe-544-a8b405ffc0326c79abf737389d99c290648f381d -&gt; xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4</li>
</ul>
<p>IGTPW_10327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10327/index.html<br />
  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-544-a8b405ffc0326c79abf737389d99c290648f381d: a8b405ffc0326c79abf737389d99c290648f381d<br />
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4</p>

</body>
</html>

--===============6194835593981945771==--
