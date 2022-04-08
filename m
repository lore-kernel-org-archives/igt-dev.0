Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9238D10E69E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 18:12:17 +0000 (UTC)
Date: Fri, 8 Apr 2022 11:12:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20220408181215.7r37sqjb74bm4yex@ldmartin-desk2>
References: <20220407051908.3390083-1-lucas.demarchi@intel.com>
 <164944036505.22676.4540825793246675591@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <164944036505.22676.4540825793246675591@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci/fast-feedback=3A_Move_gem=5Flmem=5Fswapping_further_?=
 =?utf-8?b?KHJldjMp?=
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

On Fri, Apr 08, 2022 at 05:52:45PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: tests/intel-ci/fast-feedback: Move gem_lmem_swapping further (rev3)
>URL   : https://patchwork.freedesktop.org/series/102312/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from CI_DRM_11477_full -> IGTPW_6906_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_6906_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_6906_full, please notify your bug team to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html
>
>Participating hosts (11 -> 6)
>------------------------------
>
>  Missing    (5): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_6906_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@gem_exec_balancer@parallel-out-fence:
>    - shard-kbl:          NOTRUN -> [DMESG-WARN][1]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@gem_exec_balancer@parallel-out-fence.html
>
>  * igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-apl:          [PASS][2] -> [INCOMPLETE][3]
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
>   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

None of these failures are related to the change in the test order.

Proceeding with merge to unblock the fixes to BAT

Lucas De Marchi
