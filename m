Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2050293480499762061=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@intel.com>
Date: Wed, 06 Dec 2023 19:55:00 -0000
Message-ID: <170189250042.26426.9674540243960568084@emeril.freedesktop.org>
References: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_add_crea?=
 =?utf-8?q?te-big-vram_subtest_=28rev3=29?=
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

--===============2050293480499762061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add create-big-vram subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/126831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7625_BAT -> XEIGTPW_10355_BAT
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

  Here are the changes found in XEIGTPW_10355_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#524])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7625 -> IGTPW_10355
  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-555-42c08951a31c679822795d72ada017e004d89102

  IGTPW_10355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10355/index.html
  IGT_7625: f40c67d84e142095ac6215be154e1f3710f26cba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-555-42c08951a31c679822795d72ada017e004d89102: 42c08951a31c679822795d72ada017e004d89102

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/index.html

--===============2050293480499762061==
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
<tr><td><b>Series:</b></td><td>add create-big-vram subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126831/">https://patchwork.freedesktop.org/series/126831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7625_BAT -&gt; XEIGTPW_10355_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10355_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10355/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7625 -&gt; IGTPW_10355</li>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-555-42c08951a31c679822795d72ada017e004d89102</li>
</ul>
<p>IGTPW_10355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10355/index.html<br />
  IGT_7625: f40c67d84e142095ac6215be154e1f3710f26cba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-555-42c08951a31c679822795d72ada017e004d89102: 42c08951a31c679822795d72ada017e004d89102</p>

</body>
</html>

--===============2050293480499762061==--
