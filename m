Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5305745665785750502=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_lib/amdgpu=3A_add_support_for_gang_cs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Wed, 17 Jan 2024 05:23:34 -0000
Message-ID: <170546901408.519920.6318353532708517064@5338d5abeb45>
References: <20240117045441.256498-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240117045441.256498-1-vitaly.prosyak@amd.com>
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

--===============5305745665785750502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib/amdgpu: add support for gang cs
URL   : https://patchwork.freedesktop.org/series/128859/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7675_BAT -> XEIGTPW_10538_BAT
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

  Here are the changes found in XEIGTPW_10538_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1161]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7675/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10538/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  [Intel XE#1161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161


Build changes
-------------

  * IGT: IGT_7675 -> IGTPW_10538
  * Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -> xe-633-b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf

  IGTPW_10538: 10538
  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065
  xe-633-b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf: b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10538/index.html

--===============5305745665785750502==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib/amdgpu: add support for gang cs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128859/">https://patchwork.freedesktop.org/series/128859/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10538/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10538/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7675_BAT -&gt; XEIGTPW_10538_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10538_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7675/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161">Intel XE#1161</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10538/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7675 -&gt; IGTPW_10538</li>
<li>Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -&gt; xe-633-b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf</li>
</ul>
<p>IGTPW_10538: 10538<br />
  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065<br />
  xe-633-b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf: b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf</p>

</body>
</html>

--===============5305745665785750502==--
