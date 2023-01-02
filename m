Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712F110E381
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jan 2023 19:06:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------JMIcy0Lf2U0UyDg7zRes6VH0"
Message-ID: <96f3bffb-9941-1d0e-87ae-07354393c099@intel.com>
Date: Mon, 2 Jan 2023 20:05:58 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20221229155842.2448977-1-andrzej.hajda@intel.com>
 <167266494637.12726.13825658551659481202@emeril.freedesktop.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <167266494637.12726.13825658551659481202@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_remove_fb_after_test_=28rev2=29?=
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
--------------JMIcy0Lf2U0UyDg7zRes6VH0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.01.2023 14:09, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_plane_scaling: remove fb after test (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/112291/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
>
>
>   CI Bug Log - changes from CI_DRM_12536 -> IGTPW_8287
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8287 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8287, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
>
>
>     Participating hosts (45 -> 43)
>
> Missing (2): fi-snb-2520m fi-pnv-d510
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8287:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@perf:
>       o fi-kbl-soraka: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@perf.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@perf.html>
>

Not related to the patch.

Regards
Andrzej

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_8287 that come from known issues:
>
>
>       IGT changes
>
>
>         Possible fixes
>
>  *
>
>     igt@i915_module_load@load:
>
>       o fi-kbl-soraka: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_module_load@load.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_module_load@load.html>
>  *
>
>     igt@i915_selftest@live@gt_heartbeat:
>
>       o fi-kbl-soraka: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html>
>         (i915#5334
>         <https://gitlab.freedesktop.org/drm/intel/issues/5334>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html>
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:
>
>       o {bat-adlp-9}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html>
>         (i915#4289
>         <https://gitlab.freedesktop.org/drm/intel/issues/4289>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html>
>         +1 similar issue
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7105 -> IGTPW_8287
>
> CI-20190529: 20190529
> CI_DRM_12536: 4c18d8b1c2a1f11e99f865f60fbce9fedd3376fc @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
> IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--------------JMIcy0Lf2U0UyDg7zRes6VH0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 02.01.2023 14:09, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:167266494637.12726.13825658551659481202@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_plane_scaling: remove fb after test (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/112291/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/112291/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_12536 -&gt; IGTPW_8287</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_8287 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_8287, please notify your bug team to allow
        them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a></p>
      <h2>Participating hosts (45 -&gt; 43)</h2>
      <p>Missing (2): fi-snb-2520m fi-pnv-d510 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_8287:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@perf:
          <ul>
            <li>fi-kbl-soraka: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@perf.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@perf.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Not related to the patch.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <blockquote type="cite"
cite="mid:167266494637.12726.13825658551659481202@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_8287 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>fi-kbl-soraka: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_module_load@load.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_module_load@load.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_heartbeat:</p>
          <ul>
            <li>fi-kbl-soraka: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5334"
                moz-do-not-send="true">i915#5334</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:</p>
          <ul>
            <li>{bat-adlp-9}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4289"
                moz-do-not-send="true">i915#4289</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7105 -&gt; IGTPW_8287</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_12536: 4c18d8b1c2a1f11e99f865f60fbce9fedd3376fc @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_8287:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a><br>
        IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
    <br>
  </body>
</html>

--------------JMIcy0Lf2U0UyDg7zRes6VH0--
