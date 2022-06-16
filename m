Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72DA11A389
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 12:16:57 +0000 (UTC)
Message-ID: <5873e036-ba02-43fd-daaa-e0e69b64db6b@intel.com>
Date: Thu, 16 Jun 2022 17:46:31 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220610090910.4089211-1-bhanuprakash.modem@intel.com>
 <165518197237.12485.8989029849405191362@emeril.freedesktop.org>
 <7b957e42-80ed-79eb-ddd1-fe47596fce78@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <7b957e42-80ed-79eb-ddd1-fe47596fce78@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_IGT_test_cleanup_=28rev3=29?=
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

Hi Lakshmi,

On Tue-14-06-2022 10:32 am, Modem, Bhanuprakash wrote:
> On Tue-14-06-2022 10:16 am, Patchwork wrote:
>> *Patch Details*
>> *Series:*    tests/kms_cursor_legacy: IGT test cleanup (rev3)
>> *URL:*    https://patchwork.freedesktop.org/series/104973/ 
>> <https://patchwork.freedesktop.org/series/104973/>
>> *State:*    failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/index.html 
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/index.html>
>>
>>
>>   CI Bug Log - changes from CI_DRM_11755 -> IGTPW_7296
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_7296 absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_7296, please notify your bug team to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>> External URL: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/index.html
>>
>>
>>     Participating hosts (44 -> 39)
>>
>> Additional (1): fi-icl-u2
>> Missing (6): fi-cml-u2 bat-dg1-5 bat-adlm-1 bat-adlp-4 bat-jsl-2 
>> bat-jsl-1
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in IGTPW_7296:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
> 
> These skips are expected as this patch converts existing tests to 
> Dynamic. Please help to re-report.

Just realized that you were not part of TO/CC list :-(.

Can you please re-report this false positive?

- Bhanu

> 
> - Bhanu
> 
>>
>>
>>         Suppressed
>>
>> The following results come from untrusted machines, tests, or statuses.
>> They do not affect the overall result.
>>
>>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>>       o {fi-ehl-2}: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>
>>
>>     New tests
>>
>> New tests have been introduced between CI_DRM_11755 and IGTPW_7296:
>>
>>
>>       New IGT tests (7)
>>
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
>>
>>       o Statuses : 9 pass(s) 3 skip(s)
>>       o Exec time: [0.00, 2.25] s
>>   *
>>
>>     
>> igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
>>
>>       o Statuses : 9 pass(s) 3 skip(s)
>>       o Exec time: [0.00, 2.34] s
>>   *
>>
>>     
>> igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size: 
>>
>>
>>       o Statuses : 9 pass(s) 3 skip(s)
>>       o Exec time: [0.00, 2.38] s
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
>>
>>       o Statuses : 12 pass(s)
>>       o Exec time: [0.93, 1.46] s
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
>>
>>       o Statuses : 12 pass(s)
>>       o Exec time: [0.94, 2.16] s
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
>>
>>       o Statuses : 12 pass(s)
>>       o Exec time: [0.94, 2.28] s
>>   *
>>
>>     igt@kms_cursor_legacy@basic-flip-before-cursor:
>>
>>       o Statuses : 5 skip(s)
>>       o Exec time: [0.0] s
>>
>>
>>     Known issues
>>
>> Here are the changes found in IGTPW_7296 that come from known issues:
>>
>>
>>       IGT changes
>>
>>
>>         Issues hit
>>
>>   *
>>
>>     igt@gem_huc_copy@huc-copy:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@gem_huc_copy@huc-copy.html> 
>>
>>         (i915#2190 
>> <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>>   *
>>
>>     igt@gem_lmem_swapping@random-engines:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html> 
>>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>>         similar issues
>>   *
>>
>>     igt@i915_pm_rpm@module-reload:
>>
>>       o fi-icl-u2: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@i915_pm_rpm@module-reload.html> 
>>
>>         (i915#3049 
>> <https://gitlab.freedesktop.org/drm/intel/issues/3049>)
>>   *
>>
>>     igt@i915_selftest@live@execlists:
>>
>>       o fi-icl-u2: NOTRUN -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@i915_selftest@live@execlists.html> 
>>
>>         (i915#2867
>>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) +4
>>         similar issues
>>   *
>>
>>     igt@i915_selftest@live@gem:
>>
>>       o fi-pnv-d510: NOTRUN -> DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-pnv-d510/igt@i915_selftest@live@gem.html> 
>>
>>         (i915#4528 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>>   *
>>
>>     igt@i915_selftest@live@gt_engines:
>>
>>       o bat-dg1-6: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg1-6/igt@i915_selftest@live@gt_engines.html> 
>>
>>         -> INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/bat-dg1-6/igt@i915_selftest@live@gt_engines.html> 
>>
>>         (i915#4418 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4418>)
>>   *
>>
>>     igt@i915_selftest@live@gtt:
>>
>>       o fi-bdw-5557u: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-bdw-5557u/igt@i915_selftest@live@gtt.html> 
>>
>>         -> INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-bdw-5557u/igt@i915_selftest@live@gtt.html> 
>>
>>         (i915#5685 
>> <https://gitlab.freedesktop.org/drm/intel/issues/5685>)
>>   *
>>
>>     igt@i915_selftest@live@hangcheck:
>>
>>       o fi-adl-ddr5: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html> 
>>
>>         -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html> 
>>
>>         (i915#5591 
>> <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>>   *
>>
>>     igt@i915_selftest@live@requests:
>>
>>       o fi-blb-e6850: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-blb-e6850/igt@i915_selftest@live@requests.html> 
>>
>>         -> DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-blb-e6850/igt@i915_selftest@live@requests.html> 
>>
>>         (i915#4528 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>>   *
>>
>>     igt@i915_suspend@basic-s3-without-i915:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html> 
>>
>>         (i915#5903 
>> <https://gitlab.freedesktop.org/drm/intel/issues/5903>)
>>   *
>>
>>     igt@kms_chamelium@hdmi-hpd-fast:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html> 
>>
>>         (fdo#111827
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>>         similar issues
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>>
>>       o
>>
>>         fi-cfl-8700k: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-bsw-nick: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-bsw-nick/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>>         similar issues
>>
>>       o
>>
>>         fi-glk-dsi: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-kbl-guc: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-kbl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +3
>>         similar issues
>>
>>       o
>>
>>         fi-tgl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (i915#4103 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>       o
>>
>>         fi-bxt-dsi: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-glk-j4005: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-skl-6700k2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-rkl-11600: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (i915#4103 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>       o
>>
>>         fi-adl-ddr5: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (i915#4103 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>       o
>>
>>         fi-cfl-guc: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-cfl-8109u: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-skl-6600u: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-rkl-guc: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (i915#4103 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>       o
>>
>>         fi-skl-guc: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         fi-kbl-soraka: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (fdo#109271 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>
>>       o
>>
>>         bat-dg1-6: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html> 
>>
>>         (i915#4103 
>> <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>   *
>>
>>     
>> {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size} 
>>
>>     (NEW):
>>
>>       o fi-blb-e6850: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>>         similar issues
>>   *
>>
>>     igt@kms_cursor_legacy@basic-flip-after-cursor:
>>
>>       o
>>
>>         fi-kbl-8809g: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>>         similar issues
>>
>>       o
>>
>>         fi-bdw-gvtdvm: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-after-cursor.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>>         similar issues
>>
>>   *
>>
>>     {igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):
>>
>>       o fi-kbl-7567u: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>>         similar issues
>>   *
>>
>>     igt@kms_cursor_legacy@basic-flip-before-cursor@atomic:
>>
>>       o fi-pnv-d510: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>>         similar issues
>>   *
>>
>>     
>> igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size: 
>>
>>
>>       o fi-elk-e7500: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html> 
>>
>>         (fdo#109271
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>>         similar issues
>>   *
>>
>>     igt@kms_flip@basic-flip-vs-modeset@a-edp1:
>>
>>       o fi-tgl-u2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html> 
>>
>>         -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html> 
>>
>>         (i915#402 <https://gitlab.freedesktop.org/drm/intel/issues/402>)
>>         +1 similar issue
>>   *
>>
>>     igt@kms_force_connector_basic@force-connector-state:
>>
>>       o fi-icl-u2: NOTRUN -> WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html> 
>>
>>         (i915#6008 
>> <https://gitlab.freedesktop.org/drm/intel/issues/6008>)
>>   *
>>
>>     igt@kms_force_connector_basic@force-load-detect:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html> 
>>
>>         (fdo#109285 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>>   *
>>
>>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html> 
>>
>>         (fdo#109278 
>> <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>>   *
>>
>>     igt@kms_setmode@basic-clone-single-crtc:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html> 
>>
>>         (i915#3555 
>> <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>   *
>>
>>     igt@prime_vgem@basic-userptr:
>>
>>       o fi-icl-u2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-icl-u2/igt@prime_vgem@basic-userptr.html> 
>>
>>         (fdo#109295
>>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>>         i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
>>
>>
>>         Possible fixes
>>
>>   *
>>
>>     igt@i915_selftest@live@gt_heartbeat:
>>
>>       o {fi-jsl-1}: DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html> 
>>
>>         (i915#5334
>>         <https://gitlab.freedesktop.org/drm/intel/issues/5334>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html> 
>>
>>   *
>>
>>     igt@i915_selftest@live@late_gt_pm:
>>
>>       o fi-cfl-8109u: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html> 
>>
>>         (i915#5904
>>         <https://gitlab.freedesktop.org/drm/intel/issues/5904>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html> 
>>
>>         +29 similar issues
>>   *
>>
>>     igt@i915_selftest@live@mman:
>>
>>       o {bat-dg2-9}: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg2-9/igt@i915_selftest@live@mman.html> 
>>
>>         (i915#5763
>>         <https://gitlab.freedesktop.org/drm/intel/issues/5763>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/bat-dg2-9/igt@i915_selftest@live@mman.html> 
>>
>>         +5 similar issues
>>   *
>>
>>     igt@i915_selftest@live@requests:
>>
>>       o fi-pnv-d510: DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-pnv-d510/igt@i915_selftest@live@requests.html> 
>>
>>         (i915#4528
>>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-pnv-d510/igt@i915_selftest@live@requests.html> 
>>
>>   *
>>
>>     igt@i915_suspend@basic-s2idle-without-i915:
>>
>>       o fi-cfl-8109u: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html> 
>>
>>         (i915#5904
>>         <https://gitlab.freedesktop.org/drm/intel/issues/5904> / i915#62
>>         <https://gitlab.freedesktop.org/drm/intel/issues/62>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html> 
>>
>>   *
>>
>>     igt@kms_flip@basic-plain-flip@a-edp1:
>>
>>       o {bat-adlp-6}: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-6/igt@kms_flip@basic-plain-flip@a-edp1.html> 
>>
>>         (i915#3576
>>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/bat-adlp-6/igt@kms_flip@basic-plain-flip@a-edp1.html> 
>>
>>         +1 similar issue
>>
>>
>>         Warnings
>>
>>   * igt@i915_pm_rpm@module-reload:
>>       o fi-cfl-8109u: DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html> 
>>
>>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>>         -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html> 
>>
>>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>>
>> {name}: This element is suppressed. This means it is ignored when 
>> computing
>> the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>>
>>     Build changes
>>
>>   * CI: CI-20190529 -> None
>>   * IGT: IGT_6522 -> IGTPW_7296
>>
>> CI-20190529: 20190529
>> CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ 
>> git://anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_7296: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7296/index.html
>> IGT_6522: 5be5a1a1f168a59614101b77385f05f12ec7d30a @ 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>
>>
>>     Testlist changes
>>
>> +++ 18 lines
>> --- 96 lines
>>
> 
