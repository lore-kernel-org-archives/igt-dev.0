Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3774787751869954685=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 11 Sep 2023 09:08:10 -0000
Message-ID: <169442329088.31366.7982693309869878411@emeril.freedesktop.org>
References: <20230911074026.1944119-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230911074026.1944119-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel/kms=5Ffbt=3A_Use_Linear_modifier_as_default?=
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

--===============3774787751869954685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_fbt: Use Linear modifier as default
URL   : https://patchwork.freedesktop.org/series/123520/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7478_BAT -> XEIGTPW_9762_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9762_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9762_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9762_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][1] ([Intel XE#632]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9762_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#526])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#483]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][8] ([Intel XE#608]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][10] ([Intel XE#524]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/526
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632


Build changes
-------------

  * IGT: IGT_7478 -> IGTPW_9762
  * Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -> xe-365-0533b5d42b2f8ec916646c10715ac45215e87689

  IGTPW_9762: 9762
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/index.html

--===============3774787751869954685==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_fbt: Use Linear modifier as default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123520/">https://patchwork.freedesktop.org/series/123520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7478_BAT -&gt; XEIGTPW_9762_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9762_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9762_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9762_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9762_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/526">Intel XE#526</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-adlp-7/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9762/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7478 -&gt; IGTPW_9762</li>
<li>Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -&gt; xe-365-0533b5d42b2f8ec916646c10715ac45215e87689</li>
</ul>
<p>IGTPW_9762: 9762<br />
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a<br />
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689</p>

</body>
</html>

--===============3774787751869954685==--
