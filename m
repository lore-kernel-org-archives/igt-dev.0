Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3444847122338695201=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 23 Nov 2023 12:39:48 -0000
Message-ID: <170074318811.8137.15937632797530471684@emeril.freedesktop.org>
References: <20231123113228.30729-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231123113228.30729-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/kms=5Ffrontbuffer=5Ftracking=3A_Add_new_subtest_to_test_F?=
 =?utf-8?q?BC_on_each_pipe_=28rev2=29?=
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

--===============3444847122338695201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe (rev2)
URL   : https://patchwork.freedesktop.org/series/126708/
State : success

== Summary ==

CI Bug Log - changes from IGT_7598 -> IGTPW_10254
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html

Participating hosts (38 -> 34)
------------------------------

  Missing    (4): bat-mtlp-8 bat-adlp-11 fi-snb-2520m bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_10254 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#9662])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@rcs0:
    - bat-dg2-9:          [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html

  
  [i915#9662]: https://gitlab.freedesktop.org/drm/intel/issues/9662


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7598 -> IGTPW_10254

  CI-20190529: 20190529
  CI_DRM_13914: 0b1d4056dbe497edc6d866ca5b3f54c5927bd7c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html
  IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_frontbuffer_tracking@pipe-fbc-rte

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html

--===============3444847122338695201==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126708/">https://patchwork.freedesktop.org/series/126708/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7598 -&gt; IGTPW_10254</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html</p>
<h2>Participating hosts (38 -&gt; 34)</h2>
<p>Missing    (4): bat-mtlp-8 bat-adlp-11 fi-snb-2520m bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10254 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9662">i915#9662</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-await@rcs0:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7598 -&gt; IGTPW_10254</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13914: 0b1d4056dbe497edc6d866ca5b3f54c5927bd7c0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html<br />
  IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_frontbuffer_tracking@pipe-fbc-rte</p>

</body>
</html>

--===============3444847122338695201==--
