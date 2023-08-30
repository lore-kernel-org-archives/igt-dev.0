Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2483533944077324112=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 30 Aug 2023 22:53:54 -0000
Message-ID: <169343603481.15233.14908136499705784494@emeril.freedesktop.org>
References: <20230830214719.113454-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230830214719.113454-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_drm-uapi?=
 =?utf-8?q?/xe=5Fdrm=3A_Remove_max=5Fpage=5Fsize_and_align_with_latest_uap?=
 =?utf-8?q?i=2E?=
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

--===============2483533944077324112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.
URL   : https://patchwork.freedesktop.org/series/123083/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7459_BAT -> XEIGTPW_9684_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_9684_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_module_load@load:
    - {bat-pvc-2}:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7459/bat-pvc-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9684/bat-pvc-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9684_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9684/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7459 -> IGTPW_9684
  * Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -> xe-347-4b8fbc13f29ca69fe2ce030456fab1b145bc71bc

  IGTPW_9684: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9684/index.html
  IGT_7459: 7459
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5
  xe-347-4b8fbc13f29ca69fe2ce030456fab1b145bc71bc: 4b8fbc13f29ca69fe2ce030456fab1b145bc71bc



--===============2483533944077324112==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123083/">https://patchwork.freedesktop.org/series/123083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7459_BAT -&gt; XEIGTPW_9684_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9684_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7459/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9684/bat-pvc-2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9684_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9684/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7459 -&gt; IGTPW_9684</li>
<li>Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -&gt; xe-347-4b8fbc13f29ca69fe2ce030456fab1b145bc71bc</li>
</ul>
<p>IGTPW_9684: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9684/index.html<br />
  IGT_7459: 7459<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5<br />
  xe-347-4b8fbc13f29ca69fe2ce030456fab1b145bc71bc: 4b8fbc13f29ca69fe2ce030456fab1b145bc71bc</p>

</body>
</html>

--===============2483533944077324112==--
