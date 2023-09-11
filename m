Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5228304852081818014=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 11 Sep 2023 06:57:30 -0000
Message-ID: <169441545097.31366.7427893584998389882@emeril.freedesktop.org>
References: <20230911060345.324372-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230911060345.324372-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Extend_c?=
 =?utf-8?q?ompute_square_to_i915_and_Xe_=28rev3=29?=
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

--===============5228304852081818014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend compute square to i915 and Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/122568/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7478_BAT -> XEIGTPW_9760_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9760_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9760_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9760_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#252]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-atsm-2/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-atsm-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#252]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-dg2-oem2/igt@xe_compute@compute-square.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9760_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@xe_compute@compute-square:
    - bat-pvc-2:          [SKIP][7] ([Intel XE#252]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-pvc-2/igt@xe_compute@compute-square.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-pvc-2/igt@xe_compute@compute-square.html

  
  [Intel XE#252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/252
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7478 -> IGTPW_9760
  * Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -> xe-365-0533b5d42b2f8ec916646c10715ac45215e87689

  IGTPW_9760: 9760
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/index.html

--===============5228304852081818014==
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
<tr><td><b>Series:</b></td><td>Extend compute square to i915 and Xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122568/">https://patchwork.freedesktop.org/series/122568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7478_BAT -&gt; XEIGTPW_9760_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9760_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9760_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9760_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/252">Intel XE#252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/252">Intel XE#252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9760_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_compute@compute-square:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7478/bat-pvc-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/252">Intel XE#252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9760/bat-pvc-2/igt@xe_compute@compute-square.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7478 -&gt; IGTPW_9760</li>
<li>Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -&gt; xe-365-0533b5d42b2f8ec916646c10715ac45215e87689</li>
</ul>
<p>IGTPW_9760: 9760<br />
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a<br />
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689</p>

</body>
</html>

--===============5228304852081818014==--
