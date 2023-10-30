Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2938712792664184903=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernd Kuhls" <bernd@kuhls.net>
Date: Mon, 30 Oct 2023 22:57:05 -0000
Message-ID: <169870662523.25485.11589934430411771012@emeril.freedesktop.org>
References: <20231030195809.3527410-1-bernd@kuhls.net>
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_s?=
 =?utf-8?q?tarting_with_=5Bv3=2C1/7=5D_build=3A_check_that_outb_is_present?=
 =?utf-8?q?_in_io=2Eh?=
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

--===============2938712792664184903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/7] build: check that outb is present in io.h
URL   : https://patchwork.freedesktop.org/series/125776/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7566_BAT -> XEIGTPW_10089_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10089_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10089_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Possible fixes ####

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-dg2-oem2:       [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7566 -> IGTPW_10089
  * Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -> xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050

  IGTPW_10089: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10089/index.html
  IGT_7566: 7566
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/index.html

--===============2938712792664184903==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/7] build: check that outb is present in io.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125776/">https://patchwork.freedesktop.org/series/125776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7566_BAT -&gt; XEIGTPW_10089_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10089_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10089_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10089/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7566 -&gt; IGTPW_10089</li>
<li>Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -&gt; xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050</li>
</ul>
<p>IGTPW_10089: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10089/index.html<br />
  IGT_7566: 7566<br />
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700<br />
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050</p>

</body>
</html>

--===============2938712792664184903==--
