Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB06E917
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Sep 2021 12:09:47 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:12:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YUHjSluN9n6AW+iE@platvala-desk.ger.corp.intel.com>
References: <20210915033358.561080-1-bhanuprakash.modem@intel.com>
 <163167942182.30117.13497902848252578416@emeril.freedesktop.org>
 <YUHh0i/CQKPLitQP@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUHh0i/CQKPLitQP@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium=3A___Skip_CTM_test_if_property_is_not_p?=
 =?utf-8?q?resent_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>, jaswanthx.kattamanchi@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 15, 2021 at 03:06:42PM +0300, Petri Latvala wrote:
> On Wed, Sep 15, 2021 at 04:17:01AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/kms_color_chamelium: Skip CTM test if property is not present (rev2)
> > URL   : https://patchwork.freedesktop.org/series/94653/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from CI_DRM_10586 -> IGTPW_6220
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_6220 absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_6220, please notify your bug team to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in IGTPW_6220:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@i915_module_load@reload:
> >     - fi-skl-guc:         NOTRUN -> [DMESG-WARN][1]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_module_load@reload.html
> >     - fi-kbl-7500u:       [PASS][2] -> [INCOMPLETE][3]
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@i915_module_load@reload.html
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@i915_module_load@reload.html
> 
> Lakshmi, false positives for filtering here

Ah, Lakshmi is on vacation. Jaswanth, see above.

-- 
Petri Latvala



> 
> 
> 
> > 
> >   
> > #### Suppressed ####
> > 
> >   The following results come from untrusted machines, tests, or statuses.
> >   They do not affect the overall result.
> > 
> >   * igt@i915_module_load@reload:
> >     - {fi-jsl-1}:         [TIMEOUT][4] -> [INCOMPLETE][5]
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-jsl-1/igt@i915_module_load@reload.html
> >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-jsl-1/igt@i915_module_load@reload.html
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in IGTPW_6220 that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@core_hotunplug@unbind-rebind:
> >     - fi-skl-6700k2:      [PASS][6] -> [INCOMPLETE][7] ([i915#4130])
> >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
> >    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
> >     - fi-icl-u2:          [PASS][8] -> [INCOMPLETE][9] ([i915#4130])
> >    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
> >    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
> >     - fi-kbl-7567u:       [PASS][10] -> [INCOMPLETE][11] ([i915#4130])
> >    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> >    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> > 
> >   * igt@gem_exec_suspend@basic-s3:
> >     - fi-tgl-1115g4:      [PASS][12] -> [FAIL][13] ([i915#1888])
> >    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
> >    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
> > 
> >   * igt@i915_selftest@live@mman:
> >     - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][14] ([i915#4129])
> >    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@i915_selftest@live@mman.html
> >     - fi-skl-guc:         NOTRUN -> [INCOMPLETE][15] ([i915#3796] / [i915#4129])
> >    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_selftest@live@mman.html
> > 
> >   * igt@runner@aborted:
> >     - fi-cfl-guc:         NOTRUN -> [FAIL][16] ([i915#2426] / [i915#3363])
> >    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@runner@aborted.html
> >     - fi-skl-guc:         NOTRUN -> [FAIL][17] ([i915#1436] / [i915#2426] / [i915#3363])
> >    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@runner@aborted.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@core_hotunplug@unbind-rebind:
> >     - fi-cfl-guc:         [INCOMPLETE][18] ([i915#4130]) -> [PASS][19]
> >    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> >    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> >     - fi-skl-guc:         [INCOMPLETE][20] ([i915#4130]) -> [PASS][21]
> >    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
> >    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@runner@aborted:
> >     - fi-kbl-7500u:       [FAIL][22] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][23] ([i915#2426] / [i915#3363])
> >    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@runner@aborted.html
> >    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@runner@aborted.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
> >   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
> >   [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
> >   [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
> >   [i915#2932]: https://gitlab.freedesktop.org/drm/intel/issues/2932
> >   [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
> >   [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
> >   [i915#3796]: https://gitlab.freedesktop.org/drm/intel/issues/3796
> >   [i915#3970]: https://gitlab.freedesktop.org/drm/intel/issues/3970
> >   [i915#4129]: https://gitlab.freedesktop.org/drm/intel/issues/4129
> >   [i915#4130]: https://gitlab.freedesktop.org/drm/intel/issues/4130
> > 
> > 
> > Participating hosts (41 -> 36)
> > ------------------------------
> > 
> >   Missing    (5): fi-cml-u2 bat-dg1-6 fi-bsw-cyan bat-jsl-2 fi-bdw-samus 
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_6209 -> IGTPW_6220
> > 
> >   CI-20190529: 20190529
> >   CI_DRM_10586: 84dcd8a1b2a281b296db22fac5f7ffe52dd7c501 @ git://anongit.freedesktop.org/gfx-ci/linux
> >   IGTPW_6220: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html
> >   IGT_6209: 07d6594ed02f55b68d64fa6dd7f80cfbc1ce4ef8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html
