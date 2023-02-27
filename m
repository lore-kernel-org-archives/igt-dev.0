Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8022485820673914687=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: pallavi.mishra@intel.com
Date: Mon, 27 Feb 2023 19:25:54 -0000
Message-ID: <167752595469.26338.12206073355735922557@emeril.freedesktop.org>
References: <20230227185259.2600-1-pallavi.mishra@intel.com>
In-Reply-To: <20230227185259.2600-1-pallavi.mishra@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_i915/sysfs=5Fheartbeat=5Finter?=
 =?utf-8?q?val=3A_Update_test_to_work_with_GuC_submission?=
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

--===============8022485820673914687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,i-g-t] i915/sysfs_heartbeat_interval: Update test to work with GuC submission
URL   : https://patchwork.freedesktop.org/series/114435/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12787 -> IGTPW_8533
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8533 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8533, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): bat-adls-5 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8533:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-busy@vecs0:
    - bat-adls-5:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_fence@basic-busy@vecs0:
    - fi-kbl-x1275:       [DMESG-WARN][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12787/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_8533 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adls-5:         NOTRUN -> [SKIP][4] ([i915#7456])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/bat-adls-5/igt@debugfs_test@basic-hwmon.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@vcs0:
    - fi-kbl-x1275:       [ABORT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12787/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vcs0.html

  
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7173 -> IGTPW_8533

  CI-20190529: 20190529
  CI_DRM_12787: 70da1d04c2abaaaef514174168a7e5595dbae6f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8533: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html

--===============8022485820673914687==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,i-g-t] i915/sysfs_heartbeat_interval: Update test to work with GuC submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114435/">https://patchwork.freedesktop.org/series/114435/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12787 -&gt; IGTPW_8533</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8533 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8533, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): bat-adls-5 <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8533:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@vecs0:<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@vecs0:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12787/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8533 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@vcs0:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12787/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7173 -&gt; IGTPW_8533</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12787: 70da1d04c2abaaaef514174168a7e5595dbae6f3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8533: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8533/index.html<br />
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8022485820673914687==--
