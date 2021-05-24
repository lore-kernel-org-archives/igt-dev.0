Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 May 2021 17:31:58 -0000
Message-ID: <162187751842.10905.11186793258701572113@emeril.freedesktop.org>
References: <20210524163429.5658-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210524163429.5658-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IHRo?=
 =?utf-8?q?e_multiprocess_mode_of_intel_allocator?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1303254644=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1303254644==
Content-Type: multipart/alternative;
 boundary="===============5360284890594390459=="

--===============5360284890594390459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix the multiprocess mode of intel allocator
URL   : https://patchwork.freedesktop.org/series/90481/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10127 -> IGTPW_5843
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5843 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5843, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5843:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-tgl-dsi}:       [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10127/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5843 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][3] ([i915#3462]) -> [INCOMPLETE][4] ([i915#2782] / [i915#2940] / [i915#3462])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10127/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462


Participating hosts (41 -> 14)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_5843 prevented too many machines from booting.

  Missing    (27): fi-kbl-soraka fi-apl-guc fi-snb-2520m fi-skl-6600u fi-snb-2600 fi-cml-u2 fi-bdw-5557u fi-bsw-n3050 fi-glk-dsi fi-ilk-650 fi-hsw-4770 fi-ivb-3770 fi-skl-6700k2 fi-kbl-7567u fi-ehl-1 fi-cfl-8700k fi-dg1-1 fi-cml-drallion fi-ehl-2 fi-hsw-gt1 fi-rkl-11500t fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6092 -> IGTPW_5843

  CI-20190529: 20190529
  CI_DRM_10127: d6d3a2a996af7a82e567e96a19410ac9d7246794 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html
  IGT_6092: d87087c321da07035d4f96d98c34e451b3ccb809 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html

--===============5360284890594390459==
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
<tr><td><b>Series:</b></td><td>Fix the multiprocess mode of intel allocator</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90481/">https://patchwork.freedesktop.org/series/90481/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10127 -&gt; IGTPW_5843</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5843 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5843, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5843:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10127/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5843 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10127/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 14)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_5843 prevented too many machines from booting.</p>
<p>Missing    (27): fi-kbl-soraka fi-apl-guc fi-snb-2520m fi-skl-6600u fi-snb-2600 fi-cml-u2 fi-bdw-5557u fi-bsw-n3050 fi-glk-dsi fi-ilk-650 fi-hsw-4770 fi-ivb-3770 fi-skl-6700k2 fi-kbl-7567u fi-ehl-1 fi-cfl-8700k fi-dg1-1 fi-cml-drallion fi-ehl-2 fi-hsw-gt1 fi-rkl-11500t fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6092 -&gt; IGTPW_5843</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10127: d6d3a2a996af7a82e567e96a19410ac9d7246794 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5843/index.html<br />
  IGT_6092: d87087c321da07035d4f96d98c34e451b3ccb809 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5360284890594390459==--

--===============1303254644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1303254644==--
