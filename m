Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789D210EBC6
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 07:11:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z99so12615729ede.5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 00:11:52 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------YjFyvXtu6S0sFPxgCov6d0A0"
Message-ID: <f718ac1d-5671-e5e1-470c-3d55fe5863d7@gmail.com>
Date: Tue, 12 Apr 2022 10:11:45 +0300
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
 <164971155549.2972.15837439771476111401@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <164971155549.2972.15837439771476111401@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915/kms=5Fbig=5Ffb=3A_m?=
 =?utf-8?q?ove_start_of_crc_calculation_past_first_commit_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------YjFyvXtu6S0sFPxgCov6d0A0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

Here is another false positive, I was just patching kms_big_fb here.

/Juha-Pekka

On 12.4.2022 0.12, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	series starting with [i-g-t,1/2] tests/i915/kms_big_fb: 
> move start of crc calculation past first commit (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/102359/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11484 -> IGTPW_6916
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6916 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6916, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html
>
>
>     Participating hosts (49 -> 43)
>
> Additional (2): fi-kbl-soraka fi-hsw-4770
> Missing (8): fi-bxt-dsi shard-tglu fi-tgl-u2 bat-dg2-8 fi-bsw-cyan 
> shard-rkl shard-dg1 fi-skl-6700k2
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_6916:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_exec_suspend@basic-s0@smem:
>       o fi-icl-u2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-icl-u2/igt@gem_exec_suspend@basic-s0@smem.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-icl-u2/igt@gem_exec_suspend@basic-s0@smem.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_6916 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@amdgpu/amd_basic@semaphore:
>
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +17
>         similar issues
>  *
>
>     igt@gem_exec_fence@basic-busy@bcs0:
>
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
>  *
>
>     igt@gem_exec_suspend@basic-s3@smem:
>
>       o fi-bdw-5557u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html>
>         (i915#146 <https://gitlab.freedesktop.org/drm/intel/issues/146>)
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>  *
>
>     igt@gem_softpin@allocator-basic-reserve:
>
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +10
>         similar issues
>  *
>
>     igt@i915_pm_backlight@basic-brightness:
>
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>  *
>
>     igt@i915_selftest@live@gt_pm:
>
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>
>         (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>  *
>
>     igt@kms_chamelium@dp-crc-fast:
>
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>  *
>
>     igt@kms_chamelium@dp-edid-read:
>
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>  *
>
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>
>      o
>
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>
>      o
>
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>
>  *
>
>     igt@kms_psr@primary_mmap_gtt:
>
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_psr@primary_mmap_gtt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>  *
>
>     igt@runner@aborted:
>
>       o fi-icl-u2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-icl-u2/igt@runner@aborted.html>
>         (i915#3690
>         <https://gitlab.freedesktop.org/drm/intel/issues/3690> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>
>       o fi-cfl-8109u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html>
>         (i915#5341
>         <https://gitlab.freedesktop.org/drm/intel/issues/5341> /
>         i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html>
>  *
>
>     igt@kms_pipe_crc_basic@read-crc-pipe-b:
>
>       o fi-cfl-8109u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>
>         +11 similar issues
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6419 -> IGTPW_6916
>
> CI-20190529: 20190529
> CI_DRM_11484: 8034f05811fe63be8ced11c140e59a8cea07a3d6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_6916: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html
> IGT_6419: 33a5adf20dc435cc2c6dd584caa3674c89032762 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--------------YjFyvXtu6S0sFPxgCov6d0A0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Lakshmi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Here is another false positive, I was
      just patching kms_big_fb here.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">/Juha-Pekka<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 12.4.2022 0.12, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164971155549.2972.15837439771476111401@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>series starting with [i-g-t,1/2] tests/i915/kms_big_fb:
              move start of crc calculation past first commit (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/102359/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/102359/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11484 -&gt; IGTPW_6916</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_6916 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_6916, please notify your bug team to allow
        them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html</a></p>
      <h2>Participating hosts (49 -&gt; 43)</h2>
      <p>Additional (2): fi-kbl-soraka fi-hsw-4770 <br>
        Missing (8): fi-bxt-dsi shard-tglu fi-tgl-u2 bat-dg2-8
        fi-bsw-cyan shard-rkl shard-dg1 fi-skl-6700k2 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_6916:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_exec_suspend@basic-s0@smem:
          <ul>
            <li>fi-icl-u2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-icl-u2/igt@gem_exec_suspend@basic-s0@smem.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-icl-u2/igt@gem_exec_suspend@basic-s0@smem.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_6916 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@amdgpu/amd_basic@semaphore:</p>
          <ul>
            <li>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a>) +17 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@basic-busy@bcs0:</p>
          <ul>
            <li>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s3@smem:</p>
          <ul>
            <li>fi-bdw-5557u: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/146"
                moz-do-not-send="true">i915#146</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2190"
                moz-do-not-send="true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@allocator-basic-reserve:</p>
          <ul>
            <li>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +10 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_backlight@basic-brightness:</p>
          <ul>
            <li>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3012"
                moz-do-not-send="true">i915#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_pm:</p>
          <ul>
            <li>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1886"
                moz-do-not-send="true">i915#1886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@dp-crc-fast:</p>
          <ul>
            <li>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +8 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@dp-edid-read:</p>
          <ul>
            <li>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +8 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
          <ul>
            <li>
              <p>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/533"
                  moz-do-not-send="true">i915#533</a>)</p>
            </li>
            <li>
              <p>fi-kbl-soraka: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/533"
                  moz-do-not-send="true">i915#533</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@primary_mmap_gtt:</p>
          <ul>
            <li>fi-hsw-4770: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-hsw-4770/igt@kms_psr@primary_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>fi-icl-u2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-icl-u2/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3690"
                moz-do-not-send="true">i915#3690</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                moz-do-not-send="true">i915#4312</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
          <ul>
            <li>fi-cfl-8109u: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5341"
                moz-do-not-send="true">i915#5341</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/62"
                moz-do-not-send="true">i915#62</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
          <ul>
            <li>fi-cfl-8109u: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11484/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/62"
                moz-do-not-send="true">i915#62</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html"
                moz-do-not-send="true">PASS</a> +11 similar issues</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_6419 -&gt; IGTPW_6916</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_11484: 8034f05811fe63be8ced11c140e59a8cea07a3d6 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_6916:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6916/index.html</a><br>
        IGT_6419: 33a5adf20dc435cc2c6dd584caa3674c89032762 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------YjFyvXtu6S0sFPxgCov6d0A0--
