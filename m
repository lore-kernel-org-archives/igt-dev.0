Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8009038104914808052=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Thu, 15 Dec 2022 09:44:54 -0000
Message-ID: <167109749458.25118.6548827633130526829@emeril.freedesktop.org>
References: <20221215081934.13919-1-jeevan.b@intel.com>
In-Reply-To: <20221215081934.13919-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdraw=3A_Change_MOCS_settings_for_MTL?=
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

--===============8009038104914808052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_draw: Change MOCS settings for MTL
URL   : https://patchwork.freedesktop.org/series/111958/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12508 -> IGTPW_8237
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8237 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8237, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html

Participating hosts (19 -> 18)
------------------------------

  Missing    (1): fi-rkl-11600 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8237:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12508/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  
Known issues
------------

  Here are the changes found in IGTPW_8237 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@allocator-basic:
    - fi-ivb-3770:        NOTRUN -> [SKIP][3] ([fdo#109271]) +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-ivb-3770/igt@gem_softpin@allocator-basic.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-rkl-guc:         [PASS][4] -> [INCOMPLETE][5] ([i915#4983])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12508/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7094 -> IGTPW_8237

  CI-20190529: 20190529
  CI_DRM_12508: 50bbaf39d655c47685f84dd1fb0c2cb4fb7e5286 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8237: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html
  IGT_7094: 1763071e9d50c5e992257c9197cb26f166de6fae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html

--===============8009038104914808052==
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
<tr><td><b>Series:</b></td><td>lib/igt_draw: Change MOCS settings for MTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111958/">https://patchwork.freedesktop.org/series/111958/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12508 -&gt; IGTPW_8237</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8237 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8237, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html</p>
<h2>Participating hosts (19 -&gt; 18)</h2>
<p>Missing    (1): fi-rkl-11600 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8237:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12508/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8237 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-ivb-3770/igt@gem_softpin@allocator-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12508/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7094 -&gt; IGTPW_8237</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12508: 50bbaf39d655c47685f84dd1fb0c2cb4fb7e5286 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8237: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8237/index.html<br />
  IGT_7094: 1763071e9d50c5e992257c9197cb26f166de6fae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8009038104914808052==--
