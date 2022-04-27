Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8331997632161684655=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 27 Apr 2022 12:51:11 -0000
Message-ID: <165106387119.24235.4864043048692691581@emeril.freedesktop.org>
References: <20220427120406.1485871-1-jouni.hogander@intel.com>
In-Reply-To: <20220427120406.1485871-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX3Bz?=
 =?utf-8?q?r2=5Fsu=3A_Use_FB=5FDAMAGE=5FCLIPS_only_when_supported?=
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

--===============8331997632161684655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_psr2_su: Use FB_DAMAGE_CLIPS only when supported
URL   : https://patchwork.freedesktop.org/series/103215/
State : success

== Summary ==

CI Bug Log - changes from IGT_6457 -> IGTPW_7015
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html

Participating hosts (49 -> 42)
------------------------------

  Additional (1): bat-jsl-2 
  Missing    (8): bat-dg1-5 fi-hsw-4200u bat-adlm-1 fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 bat-rpls-1 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7015 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#3576])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6457/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [DMESG-WARN][3] ([i915#3576]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6457/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/bat-adlp-4/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5329]: https://gitlab.freedesktop.org/drm/intel/issues/5329
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5820]: https://gitlab.freedesktop.org/drm/intel/issues/5820


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6457 -> IGTPW_7015

  CI-20190529: 20190529
  CI_DRM_11550: 56b089ae03ef8ea8ab7f474eaa70367898891ef0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html
  IGT_6457: 8da0e93c79b1431349cd789f4c1771ae27949488 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html

--===============8331997632161684655==
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
<tr><td><b>Series:</b></td><td>kms_psr2_su: Use FB_DAMAGE_CLIPS only when supported</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103215/">https://patchwork.freedesktop.org/series/103215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6457 -&gt; IGTPW_7015</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html</p>
<h2>Participating hosts (49 -&gt; 42)</h2>
<p>Additional (1): bat-jsl-2 <br />
  Missing    (8): bat-dg1-5 fi-hsw-4200u bat-adlm-1 fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 bat-rpls-1 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7015 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6457/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6457/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6457 -&gt; IGTPW_7015</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11550: 56b089ae03ef8ea8ab7f474eaa70367898891ef0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7015/index.html<br />
  IGT_6457: 8da0e93c79b1431349cd789f4c1771ae27949488 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8331997632161684655==--
