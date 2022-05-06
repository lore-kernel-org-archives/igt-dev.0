Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0916348576882771675=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 May 2022 12:10:54 -0000
Message-ID: <165183905479.18817.1872944840282151897@emeril.freedesktop.org>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW1wcm92?=
 =?utf-8?q?e_logic_to_work_with_audio_dependency_on_DRM_driver?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0916348576882771675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve logic to work with audio dependency on DRM driver
URL   : https://patchwork.freedesktop.org/series/103672/
State : success

== Summary ==

CI Bug Log - changes from IGT_6468 -> IGTPW_7052
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html

Participating hosts (42 -> 43)
------------------------------

  Additional (3): bat-dg2-8 bat-dg2-9 bat-jsl-1 
  Missing    (2): fi-bxt-dsi fi-bsw-cyan 

Known issues
------------

  Here are the changes found in IGTPW_7052 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][2] ([i915#3921]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6468/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#5171]: https://gitlab.freedesktop.org/drm/intel/issues/5171
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5181]: https://gitlab.freedesktop.org/drm/intel/issues/5181
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5602]: https://gitlab.freedesktop.org/drm/intel/issues/5602
  [i915#5606]: https://gitlab.freedesktop.org/drm/intel/issues/5606
  [i915#5616]: https://gitlab.freedesktop.org/drm/intel/issues/5616
  [i915#5703]: https://gitlab.freedesktop.org/drm/intel/issues/5703
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
  [i915#5917]: https://gitlab.freedesktop.org/drm/intel/issues/5917


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6468 -> IGTPW_7052

  CI-20190529: 20190529
  CI_DRM_11616: 65a5fe9ac96c60bd6dfcc44a0bb8d584912ea53d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7052: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html

--===============0916348576882771675==
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
<tr><td><b>Series:</b></td><td>Improve logic to work with audio dependency on DRM driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103672/">https://patchwork.freedesktop.org/series/103672/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6468 -&gt; IGTPW_7052</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html</p>
<h2>Participating hosts (42 -&gt; 43)</h2>
<p>Additional (3): bat-dg2-8 bat-dg2-9 bat-jsl-1 <br />
  Missing    (2): fi-bxt-dsi fi-bsw-cyan </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7052 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium@common-hpd-after-suspend:<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6468/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6468 -&gt; IGTPW_7052</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11616: 65a5fe9ac96c60bd6dfcc44a0bb8d584912ea53d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7052: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7052/index.html<br />
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0916348576882771675==--
