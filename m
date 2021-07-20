Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 20 Jul 2021 09:09:53 -0000
Message-ID: <162677219328.12851.2883580645186066802@emeril.freedesktop.org>
References: <20210720071614.995556-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210720071614.995556-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fprime=3A_Use_256B_aligned_width?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0857726372=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0857726372==
Content-Type: multipart/alternative;
 boundary="===============6226921992526044419=="

--===============6226921992526044419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Use 256B aligned width
URL   : https://patchwork.freedesktop.org/series/92751/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10355 -> IGTPW_6038
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6038 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6038, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6038:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10355/fi-icl-y/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/fi-icl-y/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_6038 that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888


Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6146 -> IGTPW_6038

  CI-20190529: 20190529
  CI_DRM_10355: 65fe031bdaf9618ce996781f0b5b98cd3959e600 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html
  IGT_6146: 6caef22e4aafed275771f564d4ea4cab09896ebc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html

--===============6226921992526044419==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Use 256B aligned width</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92751/">https://patchwork.freedesktop.org/series/92751/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10355 -&gt; IGTPW_6038</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6038 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6038, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6038:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10355/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/fi-icl-y/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6038 that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6146 -&gt; IGTPW_6038</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10355: 65fe031bdaf9618ce996781f0b5b98cd3959e600 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6038/index.html<br />
  IGT_6146: 6caef22e4aafed275771f564d4ea4cab09896ebc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6226921992526044419==--

--===============0857726372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0857726372==--
