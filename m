Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4229905948969494803=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 30 Oct 2023 22:22:50 -0000
Message-ID: <169870457056.25485.8474027170144615635@emeril.freedesktop.org>
References: <20231030163458.4101383-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231030163458.4101383-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel/kms=5Fccs=3A_Avoid_i915_calls_on_XE_device?=
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

--===============4229905948969494803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_ccs: Avoid i915 calls on XE device
URL   : https://patchwork.freedesktop.org/series/125767/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7566_BAT -> XEIGTPW_10088_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10088_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10088_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7566 -> IGTPW_10088
  * Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -> xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050

  IGTPW_10088: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10088/index.html
  IGT_7566: 7566
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/index.html

--===============4229905948969494803==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: Avoid i915 calls on XE device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125767/">https://patchwork.freedesktop.org/series/125767/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7566_BAT -&gt; XEIGTPW_10088_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10088_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/bat-atsm-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10088/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10088_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7566 -&gt; IGTPW_10088</li>
<li>Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -&gt; xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050</li>
</ul>
<p>IGTPW_10088: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10088/index.html<br />
  IGT_7566: 7566<br />
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700<br />
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050</p>

</body>
</html>

--===============4229905948969494803==--
