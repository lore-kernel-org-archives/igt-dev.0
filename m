Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3300554367609607859=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Thu, 18 Aug 2022 22:32:02 -0000
Message-ID: <166086192280.16682.3890648394238556376@emeril.freedesktop.org>
References: <20220818205113.21212-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20220818205113.21212-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?uc=3A_Disable_i915=5Fpm=5Frps_when_SLPC_is_enabled?=
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

--===============3300554367609607859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/guc: Disable i915_pm_rps when SLPC is enabled
URL   : https://patchwork.freedesktop.org/series/107472/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12000 -> IGTPW_7661
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7661 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7661, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html

Participating hosts (31 -> 30)
------------------------------

  Missing    (1): fi-hsw-4770 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7661:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-ivb-3770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-ivb-3770/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-ivb-3770/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rps@basic-api:
    - fi-rkl-guc:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
    - bat-dg1-6:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/bat-dg1-6/igt@i915_pm_rps@basic-api.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [INCOMPLETE][7] ([i915#6598]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rps@basic-api:
    - {bat-rplp-1}:       [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/bat-rplp-1/igt@i915_pm_rps@basic-api.html

  
Known issues
------------

  Here are the changes found in IGTPW_7661 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][11] -> [DMESG-FAIL][12] ([i915#4528])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-bsw-nick:        NOTRUN -> [INCOMPLETE][13] ([i915#6598])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bsw-nick/igt@i915_suspend@basic-s3-without-i915.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][14] ([fdo#109271] / [i915#2403] / [i915#4312])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bdw-5557u:       [DMESG-FAIL][15] ([i915#5334]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [DMESG-FAIL][17] ([i915#3428] / [i915#6217]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-elk-e7500:       [INCOMPLETE][19] -> [INCOMPLETE][20] ([i915#6598] / [i915#6601])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6632 -> IGTPW_7661

  CI-20190529: 20190529
  CI_DRM_12000: b5282cd7398a2137ca26e7701647e8992d29ad5c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7661: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html
  IGT_6632: a0ac4d449e551fd5c78b56f85cd534330ea60507 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html

--===============3300554367609607859==
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
<tr><td><b>Series:</b></td><td>i915/guc: Disable i915_pm_rps when SLPC is enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107472/">https://patchwork.freedesktop.org/series/107472/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12000 -&gt; IGTPW_7661</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7661 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7661, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html</p>
<h2>Participating hosts (31 -&gt; 30)</h2>
<p>Missing    (1): fi-hsw-4770 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7661:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-ivb-3770/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-ivb-3770/igt@core_hotunplug@unbind-rebind.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/bat-dg1-6/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/bat-dg1-6/igt@i915_pm_rps@basic-api.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rps@basic-api:<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/bat-rplp-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/bat-rplp-1/igt@i915_pm_rps@basic-api.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7661 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bsw-nick/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6217">i915#6217</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12000/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6601">i915#6601</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6632 -&gt; IGTPW_7661</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12000: b5282cd7398a2137ca26e7701647e8992d29ad5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7661: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7661/index.html<br />
  IGT_6632: a0ac4d449e551fd5c78b56f85cd534330ea60507 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3300554367609607859==--
