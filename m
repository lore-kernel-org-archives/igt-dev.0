Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8276721924627876791=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Aug 2021 04:55:43 -0000
Message-ID: <162865774302.27218.10184302661679419896@emeril.freedesktop.org>
References: <20210811032652.14357-1-karthik.b.s@intel.com>
In-Reply-To: <20210811032652.14357-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci=3A_Remove_kms=5Frotation=5Fcrc_from_pre-merge_blacklis?=
 =?utf-8?q?t?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8276721924627876791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Remove kms_rotation_crc from pre-merge blacklist
URL   : https://patchwork.freedesktop.org/series/93580/
State : success

== Summary ==

CI Bug Log - changes from IGT_6167 -> IGTPW_6113
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html

Known issues
------------

  Here are the changes found in IGTPW_6113 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [PASS][1] -> [DMESG-WARN][2] ([i915#3925])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6167/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_busy@basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#3555])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@runner@aborted:
    - fi-rkl-guc:         NOTRUN -> [FAIL][4] ([i915#1602])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925


Participating hosts (36 -> 33)
------------------------------

  Missing    (3): fi-bdw-samus fi-bsw-cyan fi-kbl-guc 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6167 -> IGTPW_6113

  CI-20190529: 20190529
  CI_DRM_10465: b183cdc9ca5e84a70c1d9d57ab317319fb6bed65 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html
  IGT_6167: 9e8cedeaf26344c7afd7185d6c2cf4b174560a33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html

--===============8276721924627876791==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Remove kms_rotation_crc from pre-merge blacklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93580/">https://patchwork.freedesktop.org/series/93580/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6167 -&gt; IGTPW_6113</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6113 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6167/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-11600/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (36 -&gt; 33)</h2>
<p>Missing    (3): fi-bdw-samus fi-bsw-cyan fi-kbl-guc </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6167 -&gt; IGTPW_6113</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10465: b183cdc9ca5e84a70c1d9d57ab317319fb6bed65 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6113/index.html<br />
  IGT_6167: 9e8cedeaf26344c7afd7185d6c2cf4b174560a33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8276721924627876791==--
