Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848E6E1B8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 12:50:33 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 06 May 2021 14:50:27 +0200
Message-ID: <3648975.VQhiAETyHQ@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <YJPlQFfmNG6lifAs@platvala-desk.ger.corp.intel.com>
References: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
 <7840520.eFmWaWnqpD@jkrzyszt-mobl1.ger.corp.intel.com>
 <YJPlQFfmNG6lifAs@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_Fix_non-card0_processing_=28rev4=29?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On czwartek, 6 maja 2021 14:46:56 CEST Petri Latvala wrote:
> On Thu, May 06, 2021 at 02:43:12PM +0200, Janusz Krzysztofik wrote:
> > On czwartek, 6 maja 2021 12:47:26 CEST Petri Latvala wrote:
> > > On Thu, May 06, 2021 at 12:41:07PM +0200, Janusz Krzysztofik wrote:
> > > > On czwartek, 6 maja 2021 10:42:55 CEST Patchwork wrote:
> > > > > == Series Details ==
> > > > > 
> > > > > Series: lib/i915/perf: Fix non-card0 processing (rev4)
> > > > > URL   : https://patchwork.freedesktop.org/series/89701/
> > > > > State : failure
> > > > > 
> > > > > == Summary ==
> > > > > 
> > > > > CI Bug Log - changes from IGT_6080_full -> IGTPW_5786_full
> > > > > ====================================================
> > > > > 
> > > > > Summary
> > > > > -------
> > > > > 
> > > > >   **FAILURE**
> > > > > 
> > > > >   Serious unknown changes coming with IGTPW_5786_full absolutely need to be
> > > > >   verified manually.
> > > > >   
> > > > >   If you think the reported changes have nothing to do with the changes
> > > > >   introduced in IGTPW_5786_full, please notify your bug team to allow them
> > > > >   to document this new failure mode, which will reduce false positives in 
> > > > CI.
> > > > > 
> > > > >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/
> > > > index.html
> > > > > 
> > > > > Possible new issues
> > > > > -------------------
> > > > > 
> > > > >   Here are the unknown changes that may have been introduced in 
> > > > IGTPW_5786_full:
> > > > > 
> > > > > ### IGT changes ###
> > > > > 
> > > > > #### Possible regressions ####
> > > > > 
> > > > >   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> > > > >     - shard-tglb:         [PASS][1] -> [FAIL][2]
> > > > >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-tglb6/
> > > > igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> > > > >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb5/
> > > > igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> > > > > 
> > > > >   * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
> > > > >     - shard-apl:          [PASS][3] -> [FAIL][4]
> > > > >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-apl2/
> > > > igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
> > > > >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl8/
> > > > igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
> > > > >     - shard-kbl:          [PASS][5] -> [FAIL][6] +1 similar issue
> > > > >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl2/
> > > > igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
> > > > >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
> > > > igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
> > > > 
> > > > The change only affects two tests which are calling intel_perf_for_fd(): perf 
> > > > and core_hotunplug.  In the two latter cases reported above, none of those two 
> > > > tests were executed in the same run before the reported failure occurred so 
> > > > there is no way for the change to be responsible for that failure.
> > > > 
> > > > In the first case of the above three, a perf test was indeed executed a few 
> > > > steps before the reported failure occurred, but for me it's hard to understand 
> > > > how that could be the reason of that failure, close to impossible.  Lakshmi, 
> > > > can we please retry?
> > > 
> > > Retest queued.
> > 
> > The second attempt have apparently given better results, thank you.
> 
> But the shard results are not in yet, that was just BAT.

Oh, I missed that, sorry.

Janusz

> 
> 
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
