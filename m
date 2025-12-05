Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AD3D3399E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 17:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9823910EB6F;
	Fri,  5 Dec 2025 17:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TASYtzeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD210EB6F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764955006; x=1796491006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nsIA6lkOiTv40Vp/p+TVBbfGm5LIf3rKHHQuGWGq+aU=;
 b=TASYtzeEwqy16UQmQtK8e0HN55eEYDmZaUuV9UMrm6R/vYo8OctYzsYI
 ZWCY6AIdsvNifz/Nkav2yg85R2Mv64wMBKGtdICp9Q5y36J+F764R6bcx
 qzaq+nq76byxvl+d13r7IWBXtQ09en2wfkYl4FclADx9vOVKDIQa/kH7Z
 vjvod06lhb4US8999wVWE8+WhAo77iYTGaeIYs7AYdW5v8+GNLS+v56IU
 lQJH6CkHYrMuZ8ul0fx97nTSY3sHN4FQErTh2trjhE8yKHQN7ZcZWEkIL
 o2YnTHCC4Oss4CTwrPLJR54/+aa8vtXTzB+kvjaWvGkiXKPpV4P2Dacwk A==;
X-CSE-ConnectionGUID: +xNpwIXrS0KvWGchJMk12A==
X-CSE-MsgGUID: 1WjM9t/OQQa88oRv8eanWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70610715"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="70610715"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:16:45 -0800
X-CSE-ConnectionGUID: SAZ1DfCgSGShP3/AzqWiww==
X-CSE-MsgGUID: zb/eIGHRQ02DZ38/Fs9Tgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199521562"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 09:16:44 -0800
Date: Fri, 5 Dec 2025 18:16:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Message-ID: <20251205171640.4sf52txxuzncsr4x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Wang, X" <x.wang@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
 <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <aR2-bUaoRjDBsO93@bvivekan-mobl1>
 <SA3PR11MB80464E069FB8D679B69877E186D7A@SA3PR11MB8046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA3PR11MB80464E069FB8D679B69877E186D7A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Wang,,
On 2025-11-19 at 16:39:26 +0000, Wang, X wrote:
> 
> 
> > -----Original Message-----
> > From: Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Sent: Wednesday, November 19, 2025 04:56
> > To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> > Francois <francois.dugast@intel.com>
> > Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
> > platforms
> > 
> > On 18.11.2025 23:24, Wang, X wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > Balasubramani Vivekanandan
> > > > Sent: Tuesday, November 18, 2025 06:25
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> > > > Francois <francois.dugast@intel.com>; Vivekanandan, Balasubramani
> > > > <balasubramani.vivekanandan@intel.com>
> > > > Subject: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy
> > > > for Xe2 platforms
> > > >
> > > > The source and destination mocs index fields has changed in the
> > > > MEM_COPY instruction in platforms after Xe2. So we need to check for
> > > > the IP version before placing the mocs index in the instruction.
> > > >
> > > > Signed-off-by: Balasubramani Vivekanandan
> > > > <balasubramani.vivekanandan@intel.com>
> > > > ---
> > > >  lib/intel_blt.h  |  4 +++-
> > > >  lib/xe/xe_spin.c | 11 +++++++++--
> > > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/lib/intel_blt.h b/lib/intel_blt.h index
> > > > 54a096c03..2fae045bc
> > > > 100644
> > > > --- a/lib/intel_blt.h
> > > > +++ b/lib/intel_blt.h
> > > > @@ -53,7 +53,9 @@
> > > >  #include "intel_cmds_info.h"
> > > >
> > > >  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 :
> > > > 256)
> > > > -#define XE2_MEM_COPY_MOCS_SHIFT                     25
> > > > +#define GEN12_MEM_COPY_MOCS_SHIFT		25
> > > > +#define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
> > > > +#define XE2_MEM_COPY_DST_MOCS_SHIFT		3
> > > >
> > > >  enum blt_color_depth {
> > > >  	CD_8bit,
> > > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index
> > > > 72b13ef42..1b12ce991
> > > > 100644
> > > > --- a/lib/xe/xe_spin.c
> > > > +++ b/lib/xe/xe_spin.c
> > > > @@ -54,6 +54,7 @@ void xe_spin_init(struct xe_spin *spin, struct
> > > > xe_spin_opts *opts)
> > > >  	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
> > > >  	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin,
> > > > timestamp);
> > > >  	int b = 0;
> > > > +	uint32_t devid;
> > > >
> > > >  	spin->start = 0;
> > > >  	spin->end = 0xffffffff;
> > > > @@ -163,8 +164,14 @@ void xe_spin_init(struct xe_spin *spin, struct
> > > > xe_spin_opts *opts)
> > > >  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
> > > >  		spin->batch[b++] = opts->mem_copy->dst_offset;
> > > >  		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
> > > > -		spin->batch[b++] = opts->mem_copy->src->mocs_index <<
> > > > XE2_MEM_COPY_MOCS_SHIFT |
> > > > -				   opts->mem_copy->dst->mocs_index;
> > > > +
> > > > +		devid = intel_get_drm_devid(opts->mem_copy->fd);
> > > > +		if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> > >
> > > NIT: could we use the existing helper intel_gen() ?
> > >  if (intel_gen(intel_get_drm_devid(opts->mem_copy->fd)) >= 20)
> > 
> > Both intel_gen() and intel_graphics_ver() are both checking for graphics_ver.
> > intel_gen() was created for legacy platforms where the graphics IPs where
> > identified by a generation.
> > Modern platforms has a separate version for each of its IPs like GT, Media,
> > Display. So I would suggest in any future code, we check for the IP_VER
> > instead of generation.
> > 
> 
> I don't think that distinction is quite right. intel_gen() is intended for scenarios where we only need to check the major IP version—like in this case, where we simply need to identify Xe2+ platforms. intel_graphics_ver()
>  combines the major and minor versions, so it is generally used when we need to check for a specific device revision. Both APIs are valid for use on legacy and post-Xe2 platforms, depending on the granularity required.
> 
> Xin

I agree with this but imho is is not a blocker, as there are
many other places to change where IP_VER(V, 0) is used.

I will merge it now and leave fixes for later.

Regards,
Kamil

PS. Bala, please look into failures and reply with Cc to our CI.

> 
> > Regards,
> > Bala
> > 
> > >
> > > - Xin
> > >
> > > > +			spin->batch[b++] = opts->mem_copy->src-
> > > > >mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
> > > > +					   opts->mem_copy->dst->mocs_index
> > > > << XE2_MEM_COPY_DST_MOCS_SHIFT;
> > > > +		else
> > > > +			spin->batch[b++] = opts->mem_copy->src-
> > > > >mocs_index << GEN12_MEM_COPY_MOCS_SHIFT |
> > > > +					   opts->mem_copy->dst-
> > > > >mocs_index;
> > > >  	}
> > > >
> > > >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END |
> > MI_DO_COMPARE | 2;
> > > > --
> > > > 2.43.0
> > >
