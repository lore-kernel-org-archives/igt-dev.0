Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8493741347836703809=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Thu, 29 Sep 2022 14:37:09 -0000
Message-ID: <166446222952.11956.2597448114907754176@emeril.freedesktop.org>
References: <20220825111825.74620-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220825111825.74620-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fforce=5Fconnector=5Fbasic=3A_Test_Cleanup_=28rev5=29?=
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

--===============8493741347836703809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: Test Cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/107744/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12198 -> IGTPW_7889
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7889 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7889, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html

Participating hosts (49 -> 44)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7889:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-adln-1/igt@i915_selftest@live@slpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/bat-adln-1/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_7889 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][5] -> [FAIL][6] ([i915#6298])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          [WARN][7] ([i915#6008]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][9] ([i915#6818]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6669 -> IGTPW_7889

  CI-20190529: 20190529
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7889: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html

--===============8493741347836703809==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: Test Cleanup (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107744/">https://patchwork.freedesktop.org/series/107744/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12198 -&gt; IGTPW_7889</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7889 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7889, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html</p>
<h2>Participating hosts (49 -&gt; 44)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7889:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7889 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6818">i915#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6669 -&gt; IGTPW_7889</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7889: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7889/index.html<br />
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8493741347836703809==--
