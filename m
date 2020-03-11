Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A74A6E0DB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 07:16:01 +0000 (UTC)
Date: Wed, 11 Mar 2020 09:15:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200311071557.GA14594@platvala-desk.ger.corp.intel.com>
References: <20200309165617.499759-1-emil.l.velikov@gmail.com>
 <158385582495.5456.12185226106672613147@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158385582495.5456.12185226106672613147@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9j?=
 =?utf-8?q?ore=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28re?=
 =?utf-8?b?djIp?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 03:57:04PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: test/core_setmaster: new test for drop/set master semantics (rev2)
> URL   : https://patchwork.freedesktop.org/series/74400/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8106_full -> IGTPW_4282_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4282_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4282_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4282_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@core_setmaster@master-drop-set-user} (NEW):
>     - shard-iclb:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@core_setmaster@master-drop-set-user.html
>     - shard-kbl:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl1/igt@core_setmaster@master-drop-set-user.html
>     - shard-snb:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb4/igt@core_setmaster@master-drop-set-user.html
>     - shard-tglb:         NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-tglb2/igt@core_setmaster@master-drop-set-user.html
>     - shard-apl:          NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl2/igt@core_setmaster@master-drop-set-user.html
>     - shard-glk:          NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk3/igt@core_setmaster@master-drop-set-user.html
>     - shard-hsw:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race:
>     - shard-kbl:          [PASS][8] -> [INCOMPLETE][9] +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race.html

Lakshmi, igt@kms_flip@modeset-vs-vblank-race is a false positive.


> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8106_full and IGTPW_4282_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.03] s
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - Statuses : 7 fail(s)
>     - Exec time: [0.01, 0.04] s
>

And these look as expected. Lakshmi, heads-up, the failure on
igt@core_setmaster@master-drop-set-user above will appear in
post-merge soon. Above logs can be used to file the bug report now.

Patch merged, thanks.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
