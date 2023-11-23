Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CDD10E6CC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 05:45:51 +0000 (UTC)
Message-ID: <6739606c-fc44-1166-4dc8-bd5bc00b67ce@collabora.com>
Date: Thu, 23 Nov 2023 11:15:44 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231113100419.1111165-1-vignesh.raman@collabora.com>
 <170004502637.645.3681967947163878544@emeril.freedesktop.org>
 <13f211df-2eb5-86d4-50d5-aa97011b40cd@intel.com>
 <20231116150239.w3tlpq3za44glcsi@kamilkon-desk.igk.intel.com>
 <DM6PR11MB38191BCB1462BBCE07982C97F2BBA@DM6PR11MB3819.namprd11.prod.outlook.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <DM6PR11MB38191BCB1462BBCE07982C97F2BBA@DM6PR11MB3819.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=2Cv6=5D_lib/igt=5Fkms=3A_Fix_memo?=
 =?utf-8?q?ry_corruption_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Stone <daniels@collabora.com>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.co.uk>, "Yedireswarapu,
 SaiX Nandan" <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi maintainers,

Pipeline is successful for the series,
https://patchwork.freedesktop.org/series/126327/

Please could you apply/merge the patches in this series. Thank you.

Regards,
Vignesh

On 21/11/23 17:25, Illipilli, TejasreeX wrote:
> Hi,
> 
> https://patchwork.freedesktop.org/series/126327/ - Re-reported
> 
> Thanks,
> Tejasree
> 
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Thursday, November 16, 2023 8:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; LGCI Bug Filing <lgci.bug.filing@intel.com>; Patchwork <patchwork@emeril.freedesktop.org>; Vignesh Raman <vignesh.raman@collabora.com>; Yedireswarapu, SaiX Nandan <saix.nandan.yedireswarapu@intel.com>
> Subject: Re: [igt-dev] ✗ Fi.CI.BAT: failure for series starting with [i-g-t,1/3,v6] lib/igt_kms: Fix memory corruption (rev2)
> 
> Hi,
> 
> adding lgci bug filing  team to Cc: lgci.bug.filing@intel.com
> 
> Regards,
> Kamil
> 
> On 2023-11-15 at 19:27:07 +0530, Modem, Bhanuprakash wrote:
>> Sai, Can you please help to re-report below false positives?
>>
>> - Bhanu
>>
>> On Wed-15-11-2023 04:13 pm, Patchwork wrote:
>>> *Patch Details*
>>> *Series:*	series starting with [i-g-t,1/3,v6] lib/igt_kms: Fix memory
>>> corruption (rev2)
>>> *URL:*	https://patchwork.freedesktop.org/series/126327/
>>> <https://patchwork.freedesktop.org/series/126327/>
>>> *State:*	failure
>>> *Details:*
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/index.html
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/index.html>
>>>
>>>
>>>    CI Bug Log - changes from IGT_7589 -> IGTPW_10192
>>>
>>>
>>>      Summary
>>>
>>> *FAILURE*
>>>
>>> Serious unknown changes coming with IGTPW_10192 absolutely need to
>>> be verified manually.
>>>
>>> If you think the reported changes have nothing to do with the
>>> changes introduced in IGTPW_10192, please notify your bug team
>>> (lgci.bug.filing@intel.com) to allow them to document this new
>>> failure mode, which will reduce false positives in CI.
>>>
>>> External URL:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/index.html
>>>
>>>
>>>      Participating hosts (39 -> 37)
>>>
>>> Additional (1): bat-mtlp-8
>>> Missing (3): fi-hsw-4770 bat-adlp-11 fi-snb-2520m
>>>
>>>
>>>      Possible new issues
>>>
>>> Here are the unknown changes that may have been introduced in IGTPW_10192:
>>>
>>>
>>>        IGT changes
>>>
>>>
>>>          Possible regressions
>>>
>>>    * igt@i915_selftest@live@requests:
>>>        o bat-atsm-1: PASS
>>>          
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-atsm-1/igt@i9
>>> 15_selftest@live@requests.html> -> INCOMPLETE
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-atsm-1/igt
>>> @i915_selftest@live@requests.html>
>>>
>>>
>>>          Suppressed
>>>
>>> The following results come from untrusted machines, tests, or statuses.
>>> They do not affect the overall result.
>>>
>>>    *
>>>
>>>      {igt@kms_psr@psr_primary_page_flip@edp-1}:
>>>
>>>        o
>>>
>>>          bat-jsl-3: PASS
>>>          
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-jsl-3/igt@kms
>>> _psr@psr_primary_page_flip@edp-1.html> -> SKIP
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-jsl-3/igt@
>>> kms_psr@psr_primary_page_flip@edp-1.html>
>>>
>>>        o
>>>
>>>          bat-jsl-1: PASS
>>>          
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-jsl-1/igt@kms
>>> _psr@psr_primary_page_flip@edp-1.html> -> SKIP
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-jsl-1/igt@
>>> kms_psr@psr_primary_page_flip@edp-1.html>
>>>
>>>
>>>      Known issues
>>>
>>> Here are the changes found in IGTPW_10192 that come from known issues:
>>>
>>>
>>>        IGT changes
>>>
>>>
>>>          Issues hit
>>>
>>>    *
>>>
>>>      igt@debugfs_test@basic-hwmon:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/intel/issues/9318>)
>>>    *
>>>
>>>      igt@gem_lmem_swapping@random-engines:
>>>
>>>        o fi-bsw-n3050: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8 other tests skip
>>>    *
>>>
>>>      igt@gem_lmem_swapping@verify-random:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>>>    *
>>>
>>>      igt@gem_mmap@basic:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>>>    *
>>>
>>>      igt@gem_mmap_gtt@basic:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>>>    *
>>>
>>>      igt@gem_render_tiled_blits@basic:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>>>    *
>>>
>>>      igt@i915_pm_rps@basic-api:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>>>    *
>>>
>>>      igt@i915_suspend@basic-s3-without-i915:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html> (i915#6645 <https://gitlab.freedesktop.org/drm/intel/issues/6645>)
>>>    *
>>>
>>>      igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>>>    *
>>>
>>>      igt@kms_addfb_basic@basic-y-tiled-legacy:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +8 other tests skip
>>>    *
>>>
>>>      igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 other test skip
>>>    *
>>>
>>>      igt@kms_dsc@dsc-basic:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840> / i915#9159 <https://gitlab.freedesktop.org/drm/intel/issues/9159>)
>>>    *
>>>
>>>      igt@kms_force_connector_basic@force-load-detect:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>>>    *
>>>
>>>      igt@kms_force_connector_basic@prune-stale-modes:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>>>    *
>>>
>>>      igt@kms_hdmi_inject@inject-audio:
>>>
>>>        o fi-bsw-n3050: NOTRUN -> FAIL
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html> (IGT#3 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3>)
>>>    *
>>>
>>>      igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>>>
>>>        o bat-adlp-9: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +3 other tests skip
>>>    *
>>>
>>>      igt@kms_pipe_crc_basic@suspend-read-crc:
>>>
>>>        o bat-rpls-1: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>)
>>>    *
>>>
>>>      igt@kms_setmode@basic-clone-single-crtc:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8809 <https://gitlab.freedesktop.org/drm/intel/issues/8809>)
>>>    *
>>>
>>>      igt@prime_vgem@basic-fence-mmap:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>>>    *
>>>
>>>      igt@prime_vgem@basic-fence-read:
>>>
>>>        o bat-mtlp-8: NOTRUN -> SKIP
>>>          
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-mtlp-8/igt
>>> @prime_vgem@basic-fence-read.html> (i915#3708
>>> <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other
>>> tests skip
>>>
>>>
>>>          Possible fixes
>>>
>>>    *
>>>
>>>      igt@gem_exec_suspend@basic-s0@smem:
>>>
>>>        o bat-dg2-9: INCOMPLETE
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html> (i915#9275 <https://gitlab.freedesktop.org/drm/intel/issues/9275>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html>
>>>    *
>>>
>>>      igt@i915_selftest@live@gt_heartbeat:
>>>
>>>        o bat-jsl-1: DMESG-FAIL
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html>
>>>    *
>>>
>>>      igt@i915_selftest@live@migrate:
>>>
>>>        o bat-rpls-1: INCOMPLETE
>>>          <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-rpls-1/igt@i915_selftest@live@migrate.html> (i915#9667 <https://gitlab.freedesktop.org/drm/intel/issues/9667>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-rpls-1/igt@i915_selftest@live@migrate.html>
>>>    *
>>>
>>>      igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>>>
>>>        o bat-rplp-1: ABORT
>>>          
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/bat-rplp-1/igt@km
>>> s_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html>
>>> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>>> -> PASS
>>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/bat-rplp-1/igt
>>> @kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html>
>>>
>>> {name}: This element is suppressed. This means it is ignored when
>>> computing the status of the difference (SUCCESS, WARNING, or FAILURE).
>>>
>>>
>>>      Build changes
>>>
>>>    * CI: CI-20190529 -> None
>>>    * IGT: IGT_7589 -> IGTPW_10192
>>>
>>> CI-20190529: 20190529
>>> CI_DRM_13876: 46c7c3a2db20f83da3cae4392b36860ebef6623b @
>>> git://anongit.freedesktop.org/gfx-ci/linux
>>> IGTPW_10192:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10192/index.html
>>> IGT_7589: bfba7de83474a6fee994ba845ab3d9a79bc2b5b0 @
>>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>>
>>>
>>>      Testlist changes
>>>
>>> +++ 744 lines
>>> --- 0 lines
>>>
