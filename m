Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2416D10E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 22:44:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------rnMbhc3GX0p9Oeet1lVhgDe3"
Message-ID: <f9655489-d457-43e3-fbef-f438584f464a@intel.com>
Date: Tue, 25 Apr 2023 15:44:43 -0700
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230425162405.1730513-1-vinay.belgaumkar@intel.com>
 <168245609472.25939.5018033787476572172@emeril.freedesktop.org>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <168245609472.25939.5018033787476572172@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?slpc=3A_Add_basic_IGT_test_=28rev8=29?=
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

--------------rnMbhc3GX0p9Oeet1lVhgDe3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/2023 1:54 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/slpc: Add basic IGT test (rev8)
> *URL:* 	https://patchwork.freedesktop.org/series/115698/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html
>
>
>   CI Bug Log - changes from IGT_7271 -> IGTPW_8858
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8858 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8858, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html
>
>
>     Participating hosts (39 -> 38)
>
> Missing (1): fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8858:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     {igt@i915_pm_freq_api@freq-basic-api} (NEW):
>
>      o
>
>         bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html>
>         +1 similar issue
>
>      o
>
>         fi-tgl-1115g4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html>
>         +1 similar issue
>
>      o
>
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html>
>         +1 similar issue
>
>  *
>
>     {igt@i915_pm_freq_api@freq-reset} (NEW):
>
>      o
>
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html>
>         +1 similar issue
>
>      o
>
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html>
>         +1 similar issue
>
These are not regressions. i915_pm_freq_api is not supposed to run on 
non-guc platforms.
>
>  *
>      o
>
>  *
>
>     igt@i915_selftest@live@gt_heartbeat:
>
>       o fi-kbl-soraka: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html>
>
Failure has nothing to do with this patch.

Thanks,

Vinay.

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o {bat-mtlp-8}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_pm_rps@basic-api.html>
>         (i915#8346
>         <https://gitlab.freedesktop.org/drm/intel/issues/8346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_pm_rps@basic-api.html>
>  *
>
>     igt@i915_selftest@live@slpc:
>
>       o {bat-mtlp-8}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@slpc.html>
>         +2 similar issues
>
>
>     New tests
>
> New tests have been introduced between IGT_7271 and IGTPW_8858:
>
>
>       New IGT tests (6)
>
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o Statuses : 25 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api@gt0:
>
>       o Statuses : 13 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api@gt1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@i915_pm_freq_api@freq-reset:
>
>       o Statuses : 25 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@i915_pm_freq_api@freq-reset@gt0:
>
>       o Statuses : 13 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@i915_pm_freq_api@freq-reset@gt1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_8858 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     {igt@i915_pm_freq_api@freq-basic-api} (NEW):
>
>      o
>
>         fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-skl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-cfl-8109u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-cfl-8700k: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-ivb-3770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-elk-e7500: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-kbl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-ilk-650: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-cfl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-kbl-x1275: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>  *
>
>     {igt@i915_pm_freq_api@freq-reset} (NEW):
>
>      o
>
>         fi-blb-e6850: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-blb-e6850/igt@i915_pm_freq_api@freq-reset.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         {bat-kbl-2}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>      o
>
>         fi-apl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>      o
>
>         bat-dg1-7: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-7/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-7/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-adlp-9: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-9/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-9/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-adlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-6/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-6/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-rplp-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rplp-1/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rplp-1/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-dg1-5: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-5/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-5/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-atsm-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-atsm-1/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-dg2-9: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-9/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-9/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-dg2-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-adln-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-adlm-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlm-1/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlm-1/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>      o
>
>         bat-rpls-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_pm_rps@basic-api.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>
>  *
>
>     igt@i915_selftest@live@gt_lrc:
>
>       o bat-adln-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_selftest@live@gt_lrc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_selftest@live@gt_lrc.html>
>         (i915#7609 <https://gitlab.freedesktop.org/drm/intel/issues/7609>)
>  *
>
>     igt@i915_selftest@live@reset:
>
>       o bat-rpls-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_selftest@live@reset.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_selftest@live@reset.html>
>         (i915#8384 <https://gitlab.freedesktop.org/drm/intel/issues/8384>)
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
>
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html>
>         (i915#7932 <https://gitlab.freedesktop.org/drm/intel/issues/7932>)
>  *
>
>     igt@kms_pipe_crc_basic@read-crc:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html>
>         (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>
>
>         Possible fixes
>
>   * igt@i915_selftest@live@requests:
>       o {bat-mtlp-8}: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@requests.html>
>
>
>         Warnings
>
>   * igt@i915_suspend@basic-s3-without-i915:
>       o fi-tgl-1115g4: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#7443 <https://gitlab.freedesktop.org/drm/intel/issues/7443>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7271 -> IGTPW_8858
>
> CI-20190529: 20190529
> CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html
> IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
>
>     Testlist changes
>
> +igt@i915_pm_freq_api@freq-basic-api
> +igt@i915_pm_freq_api@freq-reset
>
--------------rnMbhc3GX0p9Oeet1lVhgDe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/2023 1:54 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:168245609472.25939.5018033787476572172@emeril.freedesktop.org">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/slpc: Add basic IGT test (rev8)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/115698/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/115698/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_7271 -&gt; IGTPW_8858</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_8858 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_8858, please notify your bug team to allow
        them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html</a></p>
      <h2>Participating hosts (39 -&gt; 38)</h2>
      <p>Missing (1): fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_8858:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
          <ul>
            <li>
              <p>bat-jsl-3: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>fi-tgl-1115g4: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>bat-jsl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
          <ul>
            <li>
              <p>fi-rkl-11600: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>bat-adls-5: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
          </ul>
        </li>
      </ul>
    </blockquote>
    These are not regressions. i915_pm_freq_api is not supposed to run
    on non-guc platforms. <br>
    <blockquote type="cite" cite="mid:168245609472.25939.5018033787476572172@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
            <li>
              <br>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_heartbeat:</p>
          <ul>
            <li>fi-kbl-soraka: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Failure has nothing to do with this patch.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:168245609472.25939.5018033787476572172@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>{bat-mtlp-8}: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8346" moz-do-not-send="true">i915#8346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@slpc:</p>
          <ul>
            <li>{bat-mtlp-8}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@slpc.html" moz-do-not-send="true">FAIL</a> +2 similar issues</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between IGT_7271 and IGTPW_8858:</p>
      <h3>New IGT tests (6)</h3>
      <ul>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>Statuses : 25 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api@gt0:</p>
          <ul>
            <li>Statuses : 13 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api@gt1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset:</p>
          <ul>
            <li>Statuses : 25 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset@gt0:</p>
          <ul>
            <li>Statuses : 13 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset@gt1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_8858 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
          <ul>
            <li>
              <p>fi-glk-j4005: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-skl-guc: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-kbl-soraka: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-cfl-8109u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-kbl-7567u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-cfl-8700k: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-kbl-8809g: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-ivb-3770: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-elk-e7500: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-bsw-nick: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-kbl-guc: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-ilk-650: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-cfl-guc: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-kbl-x1275: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-hsw-4770: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
          <ul>
            <li>
              <p>fi-blb-e6850: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-blb-e6850/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-bsw-n3050: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>{bat-kbl-2}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-skl-6600u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>fi-apl-guc: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +1 similar
                issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>
              <p>bat-dg1-7: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-7/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-7/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-adlp-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-adlp-6: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-6/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-6/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-rplp-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rplp-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rplp-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-dg1-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-5/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-5/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-atsm-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-atsm-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-dg2-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-dg2-11: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-adln-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-dg2-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-adlm-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlm-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlm-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
            <li>
              <p>bat-rpls-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_lrc:</p>
          <ul>
            <li>bat-adln-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609" moz-do-not-send="true">i915#7609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@reset:</p>
          <ul>
            <li>bat-rpls-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_selftest@live@reset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_selftest@live@reset.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8384" moz-do-not-send="true">i915#8384</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
          <ul>
            <li>bat-dg2-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932" moz-do-not-send="true">i915#7932</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@read-crc:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@i915_selftest@live@requests:
          <ul>
            <li>{bat-mtlp-8}: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@requests.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@i915_suspend@basic-s3-without-i915:
          <ul>
            <li>fi-tgl-1115g4: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443" moz-do-not-send="true">i915#7443</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7271 -&gt; IGTPW_8858</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_8858:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html</a><br>
        IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
      <h2>Testlist changes</h2>
      <p>+igt@i915_pm_freq_api@freq-basic-api<br>
        +igt@i915_pm_freq_api@freq-reset</p>
    </blockquote>
  </body>
</html>

--------------rnMbhc3GX0p9Oeet1lVhgDe3--
