Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4431523780906600000=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 07 Nov 2023 19:23:42 -0000
Message-ID: <169938502268.21169.7629553465024614511@emeril.freedesktop.org>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_drm-uapi?=
 =?utf-8?q?=3A_sync_with_drm-next_f2cab4b318ee?=
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

--===============4431523780906600000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi: sync with drm-next f2cab4b318ee
URL   : https://patchwork.freedesktop.org/series/126084/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7575_BAT -> XEIGTPW_10131_BAT
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

  Here are the changes found in XEIGTPW_10131_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10131/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [Intel XE#862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/862


Build changes
-------------

  * IGT: IGT_7575 -> IGTPW_10131
  * Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -> xe-476-3b0bded07ef9f00e6120c6856e86e3faf897191f

  IGTPW_10131: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10131/index.html
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b
  xe-476-3b0bded07ef9f00e6120c6856e86e3faf897191f: 3b0bded07ef9f00e6120c6856e86e3faf897191f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10131/index.html

--===============4431523780906600000==
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
<tr><td><b>Series:</b></td><td>drm-uapi: sync with drm-next f2cab4b318ee</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126084/">https://patchwork.freedesktop.org/series/126084/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10131/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10131/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7575_BAT -&gt; XEIGTPW_10131_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10131_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10131/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7575 -&gt; IGTPW_10131</li>
<li>Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -&gt; xe-476-3b0bded07ef9f00e6120c6856e86e3faf897191f</li>
</ul>
<p>IGTPW_10131: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10131/index.html<br />
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b<br />
  xe-476-3b0bded07ef9f00e6120c6856e86e3faf897191f: 3b0bded07ef9f00e6120c6856e86e3faf897191f</p>

</body>
</html>

--===============4431523780906600000==--
