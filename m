Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22A26E4E8
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 12:27:18 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>) id 1k0lAy-0007vh-Jo
 for igt-dev@lists.freedesktop.org; Wed, 29 Jul 2020 15:27:16 +0300
Date: Wed, 29 Jul 2020 15:27:16 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200729122716.GK20883@platvala-desk.ger.corp.intel.com>
References: <20200729113425.29486-1-petri.latvala@intel.com>
 <159602494155.20643.9225337378942950783@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159602494155.20643.9225337378942950783@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D__runner/resultgen=3A_Remember_?=
 =?utf-8?q?to_close_fd_to_aborted=2Etxt?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 12:15:41PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] runner/resultgen: Remember to close fd to aborted.txt
> URL   : https://patchwork.freedesktop.org/series/80034/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8813 -> IGTPW_4816
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4816 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4816, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4816:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - <WALL OF TEXT, ENTIRE WORLD EXPLODING>


For those following along at home, this is the regression that has slipped in drm-tip that we weren't able to catch previously.


-- 
Petri Latvala



>     - fi-ilk-650:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-ilk-650/igt@runner@aborted.html
>     - fi-pnv-d510:        NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-pnv-d510/igt@runner@aborted.html
>     - fi-kbl-x1275:       NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-kbl-x1275/igt@runner@aborted.html
>     - fi-bsw-kefka:       NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bsw-kefka/igt@runner@aborted.html
>     - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bdw-gvtdvm/igt@runner@aborted.html
>     - fi-cfl-8700k:       NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-cfl-8700k/igt@runner@aborted.html
>     - fi-skl-6600u:       NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-skl-6600u/igt@runner@aborted.html
>     - fi-cfl-8109u:       NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-cfl-8109u/igt@runner@aborted.html
>     - fi-icl-u2:          NOTRUN -> [FAIL][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-icl-u2/igt@runner@aborted.html
>     - fi-gdg-551:         NOTRUN -> [FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-gdg-551/igt@runner@aborted.html
>     - fi-bsw-nick:        NOTRUN -> [FAIL][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bsw-nick/igt@runner@aborted.html
>     - fi-snb-2520m:       NOTRUN -> [FAIL][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-snb-2520m/igt@runner@aborted.html
>     - fi-skl-lmem:        NOTRUN -> [FAIL][13]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-skl-lmem/igt@runner@aborted.html
>     - fi-kbl-r:           NOTRUN -> [FAIL][14]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-kbl-r/igt@runner@aborted.html
>     - fi-bdw-5557u:       NOTRUN -> [FAIL][15]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bdw-5557u/igt@runner@aborted.html
>     - fi-bwr-2160:        NOTRUN -> [FAIL][16]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bwr-2160/igt@runner@aborted.html
>     - fi-hsw-4770:        NOTRUN -> [FAIL][17]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-hsw-4770/igt@runner@aborted.html
>     - fi-kbl-7500u:       NOTRUN -> [FAIL][18]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-kbl-7500u/igt@runner@aborted.html
>     - fi-kbl-guc:         NOTRUN -> [FAIL][19]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-kbl-guc/igt@runner@aborted.html
>     - fi-snb-2600:        NOTRUN -> [FAIL][20]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-snb-2600/igt@runner@aborted.html
>     - fi-cml-u2:          NOTRUN -> [FAIL][21]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-cml-u2/igt@runner@aborted.html
>     - fi-ivb-3770:        NOTRUN -> [FAIL][22]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-ivb-3770/igt@runner@aborted.html
>     - fi-byt-j1900:       NOTRUN -> [FAIL][23]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-byt-j1900/igt@runner@aborted.html
>     - fi-elk-e7500:       NOTRUN -> [FAIL][24]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-elk-e7500/igt@runner@aborted.html
>     - fi-cml-s:           NOTRUN -> [FAIL][25]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-cml-s/igt@runner@aborted.html
>     - fi-icl-y:           NOTRUN -> [FAIL][26]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-icl-y/igt@runner@aborted.html
>     - fi-skl-guc:         NOTRUN -> [FAIL][27]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-skl-guc/igt@runner@aborted.html
>     - fi-skl-6700k2:      NOTRUN -> [FAIL][28]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-skl-6700k2/igt@runner@aborted.html
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][29]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-bsw-n3050/igt@runner@aborted.html
>     - fi-tgl-u2:          NOTRUN -> [FAIL][30]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-tgl-u2/igt@runner@aborted.html
>     - fi-blb-e6850:       NOTRUN -> [FAIL][31]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-blb-e6850/igt@runner@aborted.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@runner@aborted:
>     - {fi-tgl-dsi}:       NOTRUN -> [FAIL][32]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-tgl-dsi/igt@runner@aborted.html
>     - {fi-ehl-1}:         NOTRUN -> [FAIL][33]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-ehl-1/igt@runner@aborted.html
>     - {fi-kbl-7560u}:     NOTRUN -> [FAIL][34]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/fi-kbl-7560u/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
> 
> Participating hosts (42 -> 36)
> ------------------------------
> 
>   Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5750 -> IGTPW_4816
> 
>   CI-20190529: 20190529
>   CI_DRM_8813: fd31b1aef933dbd497f1ebf07d5cef1052edf8ea @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4816: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/index.html
>   IGT_5750: 95d906bf458634850626f7e5d6a707191022279f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4816/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
