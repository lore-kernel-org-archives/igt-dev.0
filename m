Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368D10E2DC
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 12:20:18 +0000 (UTC)
Date: Mon, 11 Sep 2023 14:20:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Message-ID: <20230911122015.sdckyf56deszmdic@zkempczy-mobl2>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
 <20230904110458.24177-3-sai.gowtham.ch@intel.com>
 <20230904123934.stxmaelmzxg3366l@zkempczy-mobl2>
 <BYAPR11MB3413605657BFBE884AA82502D0E8A@BYAPR11MB3413.namprd11.prod.outlook.com>
 <20230907093628.hlpa7kh47nddjz7z@zkempczy-mobl2>
 <BYAPR11MB3413A74B3E8C02EE4C8A0330D0EEA@BYAPR11MB3413.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3413A74B3E8C02EE4C8A0330D0EEA@BYAPR11MB3413.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/intel_blt: check if blt
 commands are supported by the platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 03:36:41PM +0200, Ch, Sai Gowtham wrote:
> 
> 
> >-----Original Message-----
> >From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> >Sent: Thursday, September 7, 2023 3:06 PM
> >To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> >Cc: igt-dev@lists.freedesktop.org; Stolarek, Karolina
> ><karolina.stolarek@intel.com>
> >Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/intel_blt: check if blt commands are
> >supported by the platforms
> >
> >On Tue, Sep 05, 2023 at 06:11:54AM +0200, Ch, Sai Gowtham wrote:
> >>
> >>
> >> >-----Original Message-----
> >> >From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> >> >Sent: Monday, September 4, 2023 6:10 PM
> >> >To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> >> >Cc: igt-dev@lists.freedesktop.org; Stolarek, Karolina
> >> ><karolina.stolarek@intel.com>
> >> >Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/intel_blt: check if blt
> >> >commands are supported by the platforms
> >> >
> >> >On Mon, Sep 04, 2023 at 04:34:56PM +0530, sai.gowtham.ch@intel.com
> >wrote:
> >> >> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >> >>
> >> >> Check if mem-copy/mem-set commands are supported by fd device.
> >> >>
> >> >> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >> >> ---
> >> >>  lib/intel_blt.c | 32 ++++++++++++++++++++++++++++++++
> >> >> lib/intel_blt.h |  2 ++
> >> >>  2 files changed, 34 insertions(+)
> >> >>
> >> >> diff --git a/lib/intel_blt.c b/lib/intel_blt.c index
> >> >> 429511920..b55fa9b52 100644
> >> >> --- a/lib/intel_blt.c
> >> >> +++ b/lib/intel_blt.c
> >> >> @@ -289,6 +289,38 @@ bool blt_has_block_copy(int fd)
> >> >>  	return blt_supports_command(cmds_info, XY_BLOCK_COPY);  }
> >> >>
> >> >> +/**
> >> >> + * blt_has_mem_copy
> >> >> + * @fd: drm fd
> >> >> + *
> >> >> + * Check if mem copy is supported by @fd device
> >> >> + *
> >> >> + * Returns:
> >> >> + * true if it does, false otherwise.
> >> >> + */
> >> >> +bool blt_has_mem_copy(int fd)
> >> >> +{
> >> >> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> >> >> +
> >> >> +	return blt_supports_command(cmds_info, MEM_COPY); }
> >> >> +
> >> >> +/**
> >> >> + * blt_has_mem_set
> >> >> + * @fd: drm fd
> >> >> + *
> >> >> + * Check if mem set is supported by @fd device
> >> >> + *
> >> >> + * Returns:
> >> >> + * true if it does, false otherwise.
> >> >> + */
> >> >> +bool blt_has_mem_set(int fd)
> >> >> +{
> >> >> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> >> >> +
> >> >> +	return blt_supports_command(cmds_info, MEM_SET); }
> >> >> +
> >> >
> >> >It is not true if you'll use those functions in i915 igts.
> >> Do you mean path for i915 needs to be enabled ?
> >
> >Yes, if I'm not wrong PVC will be supported on i915 as either.
> >So if blt_has_mem_set() will return true for it it should have the implementation
> >in the blitter library. Generally you got almost everything you need
> >(mem_set/copy code is already written so what you need is to extract this and
> >support two ways of entering it (for i915 and for xe).
> 
> Sure will make this work for both i915 and xe. 
> >
> >> >mem-set and mem-copy commands you've introduced in 1/4 patch should
> >> >be part of intel_blt.[ch] library.
> >> Do you mean MEM_SET and MEM_COPY  in 3/4 patch ? Can you elaborate ?
> >
> >Related to above comment. You need to have batch commands + prepare
> >execution. Batch commands + execution for Xe you already have in the test. I
> >would migrate this to intel_blt.c and add i915 execution path.
> >
> do you mean something similar to "emit_blt_fast_copy" for fast_copy, mem_copy/set has to be migrated to 
> Intel_blt.c ?  

Yes, emit_blt_mem_set/copy as batch generator. Apart of this
blt_mem_set/copy which do execution on i915 or xe driver.

--
Zbigniew

> 
> ----
> Ch Sai Gowtham
> >Then in the test just call the mem_set or mem_copy depending what you want
> >to test to.
> >
> >--
> >Zbigniew
> >
> >> >
> >> >BTW first patch 1/4 won't compile in step-by-step mode because it
> >> >uses code from following patches.
> >> I'll correct that in my next patch series.
> >> ----
> >> Ch Sai Gowtham
> >> >
> >> >--
> >> >Zbigniew
> >> >
> >> >
> >> >>  /**
> >> >>   * blt_has_fast_copy
> >> >>   * @fd: drm fd
> >> >> diff --git a/lib/intel_blt.h b/lib/intel_blt.h index
> >> >> b8b3d724d..d9c8883c7 100644
> >> >> --- a/lib/intel_blt.h
> >> >> +++ b/lib/intel_blt.h
> >> >> @@ -175,6 +175,8 @@ bool blt_cmd_has_property(const struct
> >> >intel_cmds_info *cmds_info,
> >> >>  			  uint32_t prop);
> >> >>
> >> >>  bool blt_has_block_copy(int fd);
> >> >> +bool blt_has_mem_copy(int fd);
> >> >> +bool blt_has_mem_set(int fd);
> >> >>  bool blt_has_fast_copy(int fd);
> >> >>  bool blt_has_xy_src_copy(int fd);
> >> >>  bool blt_has_xy_color(int fd);
> >> >> --
> >> >> 2.39.1
> >> >>
