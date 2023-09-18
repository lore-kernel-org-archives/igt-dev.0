Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7421103000178067972=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Mon, 18 Sep 2023 20:58:31 -0000
Message-ID: <169507071175.32416.11527578547573780234@emeril.freedesktop.org>
References: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_IGT_?=
 =?utf-8?q?Kunit_implementation_issues_=28rev3=29?=
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

--===============7421103000178067972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix IGT Kunit implementation issues (rev3)
URL   : https://patchwork.freedesktop.org/series/123434/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7493_BAT -> XEIGTPW_9821_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_9821_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#483]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-dg2-oem2/igt@xe_live_ktest@bo.html
    - bat-atsm-2:         [SKIP][3] ([Intel XE#483]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-atsm-2/igt@xe_live_ktest@bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-atsm-2/igt@xe_live_ktest@bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@dmabuf:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#483]) -> [FAIL][6] ([Intel XE#674])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-atsm-2/igt@xe_live_ktest@dmabuf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-atsm-2/igt@xe_live_ktest@dmabuf.html
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#483]) -> [FAIL][8] ([Intel XE#674])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/674


Build changes
-------------

  * IGT: IGT_7493 -> IGTPW_9821
  * Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -> xe-378-36847d2f951d5149463d85714a2df030d9cea11c

  IGTPW_9821: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9821/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d
  xe-378-36847d2f951d5149463d85714a2df030d9cea11c: 36847d2f951d5149463d85714a2df030d9cea11c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/index.html

--===============7421103000178067972==
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
<tr><td><b>Series:</b></td><td>Fix IGT Kunit implementation issues (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123434/">https://patchwork.freedesktop.org/series/123434/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7493_BAT -&gt; XEIGTPW_9821_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9821_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-atsm-2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-atsm-2/igt@xe_live_ktest@bo.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/674">Intel XE#674</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9821/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/674">Intel XE#674</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7493 -&gt; IGTPW_9821</li>
<li>Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -&gt; xe-378-36847d2f951d5149463d85714a2df030d9cea11c</li>
</ul>
<p>IGTPW_9821: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9821/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d<br />
  xe-378-36847d2f951d5149463d85714a2df030d9cea11c: 36847d2f951d5149463d85714a2df030d9cea11c</p>

</body>
</html>

--===============7421103000178067972==--
