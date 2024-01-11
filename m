Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3864365135906105095=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsto?=
 =?utf-8?q?re=3A_don=27t_pass_gt=5Fid_as_bind_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 11 Jan 2024 11:01:57 -0000
Message-ID: <170497091756.270358.5996001799880642152@5338d5abeb45>
References: <20240111090152.296752-1-matthew.auld@intel.com>
In-Reply-To: <20240111090152.296752-1-matthew.auld@intel.com>
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

--===============3864365135906105095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_store: don't pass gt_id as bind queue
URL   : https://patchwork.freedesktop.org/series/128560/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14111 -> IGTPW_10510
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-rpls-2 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10510:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@slpc:
    - {bat-adls-6}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-adls-6/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_10510 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-dg2-8:          [PASS][2] -> [INCOMPLETE][3] ([i915#9275])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-dg2-8/igt@gem_exec_suspend@basic-s3@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-dg2-8/igt@gem_exec_suspend@basic-s3@smem.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - {bat-adls-6}:       [INCOMPLETE][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-adls-6/igt@i915_selftest@live@gt_timelines.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-adls-6/igt@i915_selftest@live@gt_timelines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7669 -> IGTPW_10510

  CI-20190529: 20190529
  CI_DRM_14111: 86d0316f679868605ed771544c96bab5c8eaf994 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10510: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html
  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html

--===============3864365135906105095==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_store: don&#x27;t pass gt_id as bind queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128560/">https://patchwork.freedesktop.org/series/128560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14111 -&gt; IGTPW_10510</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-rpls-2 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10510:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-adls-6/igt@i915_selftest@live@slpc.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10510 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3@smem:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-dg2-8/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-dg2-8/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_timelines:<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-adls-6/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/bat-adls-6/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7669 -&gt; IGTPW_10510</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14111: 86d0316f679868605ed771544c96bab5c8eaf994 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10510: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html<br />
  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3864365135906105095==--
