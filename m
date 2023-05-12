Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCD310E65C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 09:29:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------ICjMHJx6goi0vHxH0V0LteKN"
Message-ID: <6a1f55ac-a25c-d17f-9cd3-fa5504326a26@linux.intel.com>
Date: Fri, 12 May 2023 11:29:35 +0200
MIME-Version: 1.0
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 "Das, Nirmoy" <nirmoy.das@intel.com>
References: <20230511152251.18043-1-nirmoy.das@intel.com>
 <168383393860.29009.3981532439452384519@emeril.freedesktop.org>
 <64f59e9d-55bb-9b91-7c15-468971dd6c0e@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <64f59e9d-55bb-9b91-7c15-468971dd6c0e@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9w?=
 =?utf-8?q?rime=5Fvgem=3A_Remove_test=5Fuserptr_test_=28rev2=29?=
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
--------------ICjMHJx6goi0vHxH0V0LteKN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/12/2023 11:13 AM, Andrzej Hajda wrote:
>
>
> On 11.05.2023 21:38, Patchwork wrote:
>> Project List - Patchwork *Patch Details*
>> *Series:* 	test/prime_vgem: Remove test_userptr test (rev2)
>> *URL:* 	https://patchwork.freedesktop.org/series/117633/
>> *State:* 	success
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html
>>
>>
>>   CI Bug Log - changes from CI_DRM_13138 -> IGTPW_8944
>>
>>
>>     Summary
>>
>> *WARNING*
>>
>> Minor unknown changes coming with IGTPW_8944 need to be verified
>> manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_8944, please notify your bug team to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>> External URL: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html
>>
>>
>>     Participating hosts (41 -> 39)
>>
>> Missing (2): fi-kbl-soraka fi-snb-2520m
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in IGTPW_8944:
>>
>>
>>       IGT changes
>>
>>
>>         Warnings
>>
>>  *
>>
>>     igt@prime_vgem@basic-userptr:
>>
>>      o
>>
>>         bat-dg2-9: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-9/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>>         i915#4873
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4873>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-9/igt@prime_vgem@basic-userptr.html>
>>
>
> I guess test should be removed from tests/intel-ci/fast-feedback.testlist.


Thanks for pointing the file out. Sent a another patch to remove that 
test from that file.


Regards,

Nirmoy

>
> Regards
> Andrzej
>
>>  *
>>      o
>>
>>      o
>>
>>         bat-dg2-11: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>>         i915#4873
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4873>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@prime_vgem@basic-userptr.html>
>>
>>      o
>>
>>         bat-dg2-8: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>>         i915#4873
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4873>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@prime_vgem@basic-userptr.html>
>>
>>      o
>>
>>         bat-adlm-1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlm-1/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlm-1/igt@prime_vgem@basic-userptr.html>
>>
>>      o
>>
>>         bat-dg1-5: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-5/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>>         i915#4873
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4873>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-5/igt@prime_vgem@basic-userptr.html>
>>
>>      o
>>
>>         bat-dg1-7: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-7/igt@prime_vgem@basic-userptr.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>>         i915#4873
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4873>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-7/igt@prime_vgem@basic-userptr.html>
>>
>>
>>         Suppressed
>>
>> The following results come from untrusted machines, tests, or statuses.
>> They do not affect the overall result.
>>
>>  *
>>
>>     igt@prime_vgem@basic-userptr:
>>
>>      o
>>
>>         {bat-mtlp-6}: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-6/igt@prime_vgem@basic-userptr.html>
>>         (i915#8368
>>         <https://gitlab.freedesktop.org/drm/intel/issues/8368>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-6/igt@prime_vgem@basic-userptr.html>
>>
>>      o
>>
>>         {bat-mtlp-8}: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-8/igt@prime_vgem@basic-userptr.html>
>>         (i915#8368
>>         <https://gitlab.freedesktop.org/drm/intel/issues/8368>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-8/igt@prime_vgem@basic-userptr.html>
>>
>>
>>     Known issues
>>
>> Here are the changes found in IGTPW_8944 that come from known issues:
>>
>>
>>       IGT changes
>>
>>
>>         Issues hit
>>
>>  *
>>
>>     igt@i915_selftest@live@migrate:
>>
>>       o bat-dg2-11: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@i915_selftest@live@migrate.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@i915_selftest@live@migrate.html>
>>         (i915#7699
>>         <https://gitlab.freedesktop.org/drm/intel/issues/7699> /
>>         i915#7953 <https://gitlab.freedesktop.org/drm/intel/issues/7953>)
>>  *
>>
>>     igt@i915_selftest@live@requests:
>>
>>       o bat-rpls-2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@i915_selftest@live@requests.html>
>>         -> ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@i915_selftest@live@requests.html>
>>         (i915#4983
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4983> /
>>         i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>)
>>  *
>>
>>     igt@i915_selftest@live@slpc:
>>
>>       o bat-rpls-1: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@i915_selftest@live@slpc.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@i915_selftest@live@slpc.html>
>>         (i915#6367
>>         <https://gitlab.freedesktop.org/drm/intel/issues/6367> /
>>         i915#7953 <https://gitlab.freedesktop.org/drm/intel/issues/7953>)
>>
>>
>>         Possible fixes
>>
>>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
>>       o bat-dg2-8: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html>
>>         (i915#7932
>>         <https://gitlab.freedesktop.org/drm/intel/issues/7932>) ->
>>         PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html>
>>
>>
>>         Warnings
>>
>>  *
>>
>>     igt@kms_setmode@basic-clone-single-crtc:
>>
>>       o bat-rplp-1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>>         i915#4579
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4579>) ->
>>         ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html>
>>         (i915#4579
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4579> /
>>         i915#8260 <https://gitlab.freedesktop.org/drm/intel/issues/8260>)
>>  *
>>
>>     igt@prime_vgem@basic-userptr:
>>
>>      o
>>
>>         bat-rpls-2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>>      o
>>
>>         fi-tgl-1115g4: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>>      o
>>
>>         bat-jsl-3: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-3/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-3/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         fdo#112080 <https://bugs.freedesktop.org/show_bug.cgi?id=112080>)
>>
>>      o
>>
>>         bat-jsl-1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-1/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-1/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         fdo#112080 <https://bugs.freedesktop.org/show_bug.cgi?id=112080>)
>>
>>      o
>>
>>         bat-rpls-1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>>      o
>>
>>         bat-adlp-9: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlp-9/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301> /
>>         i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlp-9/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>>      o
>>
>>         fi-rkl-11600: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-rkl-11600/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301> /
>>         i915#3708
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-rkl-11600/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>>      o
>>
>>         bat-adls-5: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adls-5/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3301>) ->
>>         SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adls-5/igt@prime_vgem@basic-userptr.html>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>>
>> {name}: This element is suppressed. This means it is ignored when 
>> computing
>> the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>>
>>     Build changes
>>
>>   * CI: CI-20190529 -> None
>>   * IGT: IGT_7285 -> IGTPW_8944
>>
>> CI-20190529: 20190529
>> CI_DRM_13138: b35107d813ef012806df9eeeea1ff9f37adf0400 @ 
>> git://anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_8944: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html
>> IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>
>>
>>     Testlist changes
>>
>> -igt@prime_vgem@basic-userptr
>>
>
--------------ICjMHJx6goi0vHxH0V0LteKN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/12/2023 11:13 AM, Andrzej Hajda
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:64f59e9d-55bb-9b91-7c15-468971dd6c0e@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <div class="moz-cite-prefix">On 11.05.2023 21:38, Patchwork wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:168383393860.29009.3981532439452384519@emeril.freedesktop.org">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <title>Project List - Patchwork</title>
        <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
        <b>Patch Details</b>
        <table>
          <tbody>
            <tr>
              <td><b>Series:</b></td>
              <td>test/prime_vgem: Remove test_userptr test (rev2)</td>
            </tr>
            <tr>
              <td><b>URL:</b></td>
              <td><a
                  href="https://patchwork.freedesktop.org/series/117633/"
                  moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/117633/</a></td>
            </tr>
            <tr>
              <td><b>State:</b></td>
              <td>success</td>
            </tr>
            <tr>
              <td><b>Details:</b></td>
              <td><a
                  href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html"
                  moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html</a></td>
            </tr>
          </tbody>
        </table>
        <h1>CI Bug Log - changes from CI_DRM_13138 -&gt; IGTPW_8944</h1>
        <h2>Summary</h2>
        <p><strong>WARNING</strong></p>
        <p>Minor unknown changes coming with IGTPW_8944 need to be
          verified<br>
          manually.</p>
        <p>If you think the reported changes have nothing to do with the
          changes<br>
          introduced in IGTPW_8944, please notify your bug team to allow
          them<br>
          to document this new failure mode, which will reduce false
          positives in CI.</p>
        <p>External URL: <a class="moz-txt-link-freetext"
            href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html"
            moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html</a></p>
        <h2>Participating hosts (41 -&gt; 39)</h2>
        <p>Missing (2): fi-kbl-soraka fi-snb-2520m </p>
        <h2>Possible new issues</h2>
        <p>Here are the unknown changes that may have been introduced in
          IGTPW_8944:</p>
        <h3>IGT changes</h3>
        <h4>Warnings</h4>
        <ul>
          <li>
            <p>igt@prime_vgem@basic-userptr:</p>
            <ul>
              <li>
                <p>bat-dg2-9: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-9/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                    moz-do-not-send="true">i915#4873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-9/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
            </ul>
          </li>
        </ul>
      </blockquote>
      <br>
      I guess test should be removed from
      tests/intel-ci/fast-feedback.testlist.<br>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for pointing the file out. Sent a another patch to remove
      that test from that file.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy <br>
    </p>
    <blockquote type="cite"
      cite="mid:64f59e9d-55bb-9b91-7c15-468971dd6c0e@intel.com"> <br>
      Regards<br>
      Andrzej<br>
      <br>
      <blockquote type="cite"
        cite="mid:168383393860.29009.3981532439452384519@emeril.freedesktop.org">
        <ul>
          <li>
            <ul>
              <li> <br>
              </li>
              <li>
                <p>bat-dg2-11: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                    moz-do-not-send="true">i915#4873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
              <li>
                <p>bat-dg2-8: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                    moz-do-not-send="true">i915#4873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
              <li>
                <p>bat-adlm-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlm-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlm-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
              <li>
                <p>bat-dg1-5: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-5/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                    moz-do-not-send="true">i915#4873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-5/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
              <li>
                <p>bat-dg1-7: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-7/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                    moz-do-not-send="true">i915#4873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-7/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
            </ul>
          </li>
        </ul>
        <h4>Suppressed</h4>
        <p>The following results come from untrusted machines, tests, or
          statuses.<br>
          They do not affect the overall result.</p>
        <ul>
          <li>
            <p>igt@prime_vgem@basic-userptr:</p>
            <ul>
              <li>
                <p>{bat-mtlp-6}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-6/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">FAIL</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/8368"
                    moz-do-not-send="true">i915#8368</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-6/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
              <li>
                <p>{bat-mtlp-8}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-8/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">FAIL</a> (<a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/8368"
                    moz-do-not-send="true">i915#8368</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-8/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a></p>
              </li>
            </ul>
          </li>
        </ul>
        <h2>Known issues</h2>
        <p>Here are the changes found in IGTPW_8944 that come from known
          issues:</p>
        <h3>IGT changes</h3>
        <h4>Issues hit</h4>
        <ul>
          <li>
            <p>igt@i915_selftest@live@migrate:</p>
            <ul>
              <li>bat-dg2-11: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@i915_selftest@live@migrate.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@i915_selftest@live@migrate.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7699"
                  moz-do-not-send="true">i915#7699</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7953"
                  moz-do-not-send="true">i915#7953</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_selftest@live@requests:</p>
            <ul>
              <li>bat-rpls-2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@i915_selftest@live@requests.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@i915_selftest@live@requests.html"
                  moz-do-not-send="true">ABORT</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4983"
                  moz-do-not-send="true">i915#4983</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7913"
                  moz-do-not-send="true">i915#7913</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_selftest@live@slpc:</p>
            <ul>
              <li>bat-rpls-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@i915_selftest@live@slpc.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@i915_selftest@live@slpc.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6367"
                  moz-do-not-send="true">i915#6367</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7953"
                  moz-do-not-send="true">i915#7953</a>)</li>
            </ul>
          </li>
        </ul>
        <h4>Possible fixes</h4>
        <ul>
          <li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
            <ul>
              <li>bat-dg2-8: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7932"
                  moz-do-not-send="true">i915#7932</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html"
                  moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
        </ul>
        <h4>Warnings</h4>
        <ul>
          <li>
            <p>igt@kms_setmode@basic-clone-single-crtc:</p>
            <ul>
              <li>bat-rplp-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4579"
                  moz-do-not-send="true">i915#4579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html"
                  moz-do-not-send="true">ABORT</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4579"
                  moz-do-not-send="true">i915#4579</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8260"
                  moz-do-not-send="true">i915#8260</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@basic-userptr:</p>
            <ul>
              <li>
                <p>bat-rpls-2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
              <li>
                <p>fi-tgl-1115g4: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
              <li>
                <p>bat-jsl-3: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-3/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-3/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=112080"
                    moz-do-not-send="true">fdo#112080</a>)</p>
              </li>
              <li>
                <p>bat-jsl-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=112080"
                    moz-do-not-send="true">fdo#112080</a>)</p>
              </li>
              <li>
                <p>bat-rpls-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
              <li>
                <p>bat-adlp-9: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlp-9/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlp-9/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
              <li>
                <p>fi-rkl-11600: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-rkl-11600/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                    moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-rkl-11600/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
              <li>
                <p>bat-adls-5: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adls-5/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a> / <a
                    href="https://gitlab.freedesktop.org/drm/intel/issues/3301"
                    moz-do-not-send="true">i915#3301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adls-5/igt@prime_vgem@basic-userptr.html"
                    moz-do-not-send="true">SKIP</a> (<a
                    href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                    moz-do-not-send="true">fdo#109295</a>)</p>
              </li>
            </ul>
          </li>
        </ul>
        <p>{name}: This element is suppressed. This means it is ignored
          when computing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
        <h2>Build changes</h2>
        <ul>
          <li>CI: CI-20190529 -&gt; None</li>
          <li>IGT: IGT_7285 -&gt; IGTPW_8944</li>
        </ul>
        <p>CI-20190529: 20190529<br>
          CI_DRM_13138: b35107d813ef012806df9eeeea1ff9f37adf0400 @
          git://anongit.freedesktop.org/gfx-ci/linux<br>
          IGTPW_8944: <a class="moz-txt-link-freetext"
            href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html"
            moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html</a><br>
          IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ <a
            class="moz-txt-link-freetext"
            href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git"
            moz-do-not-send="true">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
        <h2>Testlist changes</h2>
        <p>-igt@prime_vgem@basic-userptr</p>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------ICjMHJx6goi0vHxH0V0LteKN--
