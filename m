Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200E6E21A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 18:23:25 +0000 (UTC)
Date: Tue, 17 Aug 2021 11:23:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20210817182323.27humrgyngecimav@ldmartin-desk2>
References: <20210817172439.2159386-1-lucas.demarchi@intel.com>
 <162922338721.22607.360640800385399909@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <162922338721.22607.360640800385399909@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_ensure_array_size_matches_loop_method?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 06:03:07PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: i915/i915_pm_rps: ensure array size matches loop method
>URL   : https://patchwork.freedesktop.org/series/93755/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from CI_DRM_10490 -> IGTPW_6130
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_6130 absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_6130, please notify your bug team to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_6130:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@i915_pm_rps@basic-api:
>    - fi-kbl-guc:         [PASS][1] -> [FAIL][2]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-guc/igt@i915_pm_rps@basic-api.html
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-guc/igt@i915_pm_rps@basic-api.html

it seems I have some more required patches in order for this
to work since in my tree I don't have the loop in the main function. I
will take a look what is missing here.

Lucas De Marchi
