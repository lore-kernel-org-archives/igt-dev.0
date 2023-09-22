Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3581796346973775512=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Fri, 22 Sep 2023 22:43:03 -0000
Message-ID: <169542258353.5197.15733999431913667530@emeril.freedesktop.org>
References: <20230922211902.2506191-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230922211902.2506191-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_include/?=
 =?utf-8?q?drm-uapi=3A_Update_to_latest_i915=5Fdrm=2Eh_from_drm-next?=
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

--===============3581796346973775512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: include/drm-uapi: Update to latest i915_drm.h from drm-next
URL   : https://patchwork.freedesktop.org/series/124144/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7499_BAT -> XEIGTPW_9857_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_9857_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#597] / [Intel XE#714])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714


Build changes
-------------

  * IGT: IGT_7499 -> IGTPW_9857
  * Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -> xe-391-b489a0b530fc8c24d11b50ddb754e4fd15311768

  IGTPW_9857: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9857/index.html
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec
  xe-391-b489a0b530fc8c24d11b50ddb754e4fd15311768: b489a0b530fc8c24d11b50ddb754e4fd15311768

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/index.html

--===============3581796346973775512==
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
<tr><td><b>Series:</b></td><td>include/drm-uapi: Update to latest i915_drm.h from drm-next</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124144/">https://patchwork.freedesktop.org/series/124144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7499_BAT -&gt; XEIGTPW_9857_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9857_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9857/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7499 -&gt; IGTPW_9857</li>
<li>Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -&gt; xe-391-b489a0b530fc8c24d11b50ddb754e4fd15311768</li>
</ul>
<p>IGTPW_9857: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9857/index.html<br />
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec<br />
  xe-391-b489a0b530fc8c24d11b50ddb754e4fd15311768: b489a0b530fc8c24d11b50ddb754e4fd15311768</p>

</body>
</html>

--===============3581796346973775512==--
