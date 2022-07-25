Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919FB10EF2F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jul 2022 10:30:39 +0000 (UTC)
Date: Mon, 25 Jul 2022 03:30:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <20220725103030.pwpobx3c5qzdafcn@ldmartin-desk2>
References: <20220723191255.2700675-1-lucas.demarchi@intel.com>
 <165860984923.27984.11898937175723156175@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <165860984923.27984.11898937175723156175@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?orce_rescan_when_module_is_loaded?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Jul 23, 2022 at 08:57:29PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: lib: Force rescan when module is loaded
>URL   : https://patchwork.freedesktop.org/series/106635/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from IGT_6595_full -> IGTPW_7554_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_7554_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_7554_full, please notify your bug team to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.html
>
>Participating hosts (9 -> 10)
>------------------------------
>
>  Additional (1): shard-dg1
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_7554_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@api_intel_allocator@fork-simple-stress-signal:
>    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal.html
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@api_intel_allocator@fork-simple-stress-signal.html

 From https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/dmesg0.txt
it looks like machine crashed while starting the test and shouldn't be
caused by this patch that simply updates the cached list of devices in
userspace.

Lucas De Marchi
