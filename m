Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3020495E69
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 18:54:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------6yRN5xGTD9esgp0VD0fGaN4P"
Message-ID: <2934f9ad-670c-c0dd-fcc7-2ad16c1dcf45@linux.intel.com>
Date: Tue, 12 Jul 2022 20:54:09 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20220712135024.5571-1-nirmoy.das@intel.com>
 <165763714163.12861.8206426204526675548@emeril.freedesktop.org>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <165763714163.12861.8206426204526675548@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fquery=3A_fix_cache_type_iteration_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------6yRN5xGTD9esgp0VD0fGaN4P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/12/2022 4:45 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/i915_query: fix cache type iteration (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/106195/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11876 -> IGTPW_7501
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7501 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7501, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html
>
>
>     Participating hosts (43 -> 41)
>
> Missing (2): fi-ctg-p8600 fi-hsw-4200u
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7501:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@hangcheck:
>       o fi-bdw-gvtdvm: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-bdw-gvtdvm/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bdw-gvtdvm/igt@i915_selftest@live@hangcheck.html>
>

Unrelated failure.


Nirmoy

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_7501 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>      o
>
>         fi-hsw-4770: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>
>      o
>
>         fi-hsw-g3258: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html>
>         (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>
>  *
>
>     igt@kms_chamelium@common-hpd-after-suspend:
>
>      o
>
>         fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>      o
>
>         fi-blb-e6850: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-blb-e6850/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
>  *
>
>     igt@runner@aborted:
>
>      o
>
>         fi-hsw-4770: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-4770/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5594
>         <https://gitlab.freedesktop.org/drm/intel/issues/5594> /
>         i915#6246 <https://gitlab.freedesktop.org/drm/intel/issues/6246>)
>
>      o
>
>         fi-hsw-g3258: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-g3258/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#6246 <https://gitlab.freedesktop.org/drm/intel/issues/6246>)
>
>      o
>
>         fi-bdw-gvtdvm: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bdw-gvtdvm/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
>
>         Possible fixes
>
>  *
>
>     igt@i915_module_load@reload:
>
>       o {bat-adln-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-adln-1/igt@i915_module_load@reload.html>
>         (i915#6297
>         <https://gitlab.freedesktop.org/drm/intel/issues/6297>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-adln-1/igt@i915_module_load@reload.html>
>  *
>
>     igt@i915_pm_rpm@module-reload:
>
>       o {bat-rpls-2}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-rpls-2/igt@i915_pm_rpm@module-reload.html>
>         (i915#5537
>         <https://gitlab.freedesktop.org/drm/intel/issues/5537>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-rpls-2/igt@i915_pm_rpm@module-reload.html>
>  *
>
>     igt@i915_selftest@live@execlists:
>
>       o fi-bsw-n3050: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-bsw-n3050/igt@i915_selftest@live@execlists.html>
>         (i915#5847
>         <https://gitlab.freedesktop.org/drm/intel/issues/5847>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bsw-n3050/igt@i915_selftest@live@execlists.html>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o bat-dg1-5: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-dg1-5/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957
>         <https://gitlab.freedesktop.org/drm/intel/issues/4957>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-dg1-5/igt@i915_selftest@live@hangcheck.html>
>  *
>
>     igt@i915_selftest@live@requests:
>
>       o fi-blb-e6850: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>  *
>
>     igt@i915_selftest@live@reset:
>
>       o {bat-rpls-2}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-rpls-2/igt@i915_selftest@live@reset.html>
>         (i915#4983
>         <https://gitlab.freedesktop.org/drm/intel/issues/4983>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-rpls-2/igt@i915_selftest@live@reset.html>
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6578 -> IGTPW_7501
>
> CI-20190529: 20190529
> CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7501: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html
> IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------6yRN5xGTD9esgp0VD0fGaN4P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/12/2022 4:45 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:165763714163.12861.8206426204526675548@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/i915_query: fix cache type iteration (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/106195/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/106195/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11876 -&gt; IGTPW_7501</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_7501 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_7501, please notify your bug team to allow
        them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html</a></p>
      <h2>Participating hosts (43 -&gt; 41)</h2>
      <p>Missing (2): fi-ctg-p8600 fi-hsw-4200u </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_7501:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@hangcheck:
          <ul>
            <li>fi-bdw-gvtdvm: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-bdw-gvtdvm/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bdw-gvtdvm/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Unrelated failure.</p>
    <p><br>
    </p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:165763714163.12861.8206426204526675548@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_7501 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>
              <p>fi-hsw-4770: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4785"
                  moz-do-not-send="true">i915#4785</a>)</p>
            </li>
            <li>
              <p>fi-hsw-g3258: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4785"
                  moz-do-not-send="true">i915#4785</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@common-hpd-after-suspend:</p>
          <ul>
            <li>
              <p>fi-bsw-n3050: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>)</p>
            </li>
            <li>
              <p>fi-blb-e6850: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-blb-e6850/igt@kms_chamelium@common-hpd-after-suspend.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>
              <p>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-4770/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                  moz-do-not-send="true">i915#4312</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5594"
                  moz-do-not-send="true">i915#5594</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6246"
                  moz-do-not-send="true">i915#6246</a>)</p>
            </li>
            <li>
              <p>fi-hsw-g3258: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-hsw-g3258/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                  moz-do-not-send="true">i915#4312</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6246"
                  moz-do-not-send="true">i915#6246</a>)</p>
            </li>
            <li>
              <p>fi-bdw-gvtdvm: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bdw-gvtdvm/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                  moz-do-not-send="true">i915#4312</a>)</p>
            </li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@i915_module_load@reload:</p>
          <ul>
            <li>{bat-adln-1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-adln-1/igt@i915_module_load@reload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6297"
                moz-do-not-send="true">i915#6297</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-adln-1/igt@i915_module_load@reload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@module-reload:</p>
          <ul>
            <li>{bat-rpls-2}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-rpls-2/igt@i915_pm_rpm@module-reload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5537"
                moz-do-not-send="true">i915#5537</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-rpls-2/igt@i915_pm_rpm@module-reload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@execlists:</p>
          <ul>
            <li>fi-bsw-n3050: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-bsw-n3050/igt@i915_selftest@live@execlists.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5847"
                moz-do-not-send="true">i915#5847</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-bsw-n3050/igt@i915_selftest@live@execlists.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>bat-dg1-5: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-dg1-5/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4494"
                moz-do-not-send="true">i915#4494</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4957"
                moz-do-not-send="true">i915#4957</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-dg1-5/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@requests:</p>
          <ul>
            <li>fi-blb-e6850: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/fi-blb-e6850/igt@i915_selftest@live@requests.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4528"
                moz-do-not-send="true">i915#4528</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/fi-blb-e6850/igt@i915_selftest@live@requests.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@reset:</p>
          <ul>
            <li>{bat-rpls-2}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/bat-rpls-2/igt@i915_selftest@live@reset.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4983"
                moz-do-not-send="true">i915#4983</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/bat-rpls-2/igt@i915_selftest@live@reset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_6578 -&gt; IGTPW_7501</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_7501:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7501/index.html</a><br>
        IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------6yRN5xGTD9esgp0VD0fGaN4P--
