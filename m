Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8778404271577258148=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Tue, 03 Oct 2023 10:39:08 -0000
Message-ID: <169632954821.4383.8893621095534790285@emeril.freedesktop.org>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Kunit_fi?=
 =?utf-8?q?xes_and_improvements?=
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

--===============8778404271577258148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Kunit fixes and improvements
URL   : https://patchwork.freedesktop.org/series/124554/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7508_BAT -> XEIGTPW_9910_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9910_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9910_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9910_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9910_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7508 -> IGTPW_9910
  * Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -> xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489

  IGTPW_9910: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9910/index.html
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313
  xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/index.html

--===============8778404271577258148==
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
<tr><td><b>Series:</b></td><td>Kunit fixes and improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124554/">https://patchwork.freedesktop.org/series/124554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7508_BAT -&gt; XEIGTPW_9910_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9910_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9910_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9910_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9910_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7508 -&gt; IGTPW_9910</li>
<li>Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -&gt; xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489</li>
</ul>
<p>IGTPW_9910: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9910/index.html<br />
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313<br />
  xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489</p>

</body>
</html>

--===============8778404271577258148==--
