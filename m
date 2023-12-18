Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D9A10E390
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:46:14 +0000 (UTC)
Date: Mon, 18 Dec 2023 17:19:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
Message-ID: <20231218161918.dj4b5zqdzwogdbkg@kamilkon-desk.igk.intel.com>
References: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
 <c3cae6fc-8a97-4abd-9918-bba55c1757ca@gmail.com>
 <DM4PR11MB614147FFF506542FADD01654B98CA@DM4PR11MB6141.namprd11.prod.outlook.com>
 <20231214143628.xyisz4tovwg3jjo2@kamilkon-desk.igk.intel.com>
 <SJ1PR11MB61292ABDFB706F233E749456B990A@SJ1PR11MB6129.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB61292ABDFB706F233E749456B990A@SJ1PR11MB6129.namprd11.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Garg, Nemesa" <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-12-18 at 10:14:34 +0000, Borah, Chaitanya Kumar wrote:
> Hello Kamil,
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Thursday, December 14, 2023 8:06 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Juha-Pekka
> > Heikkila <juhapekka.heikkila@gmail.com>; Garg, Nemesa
> > <nemesa.garg@intel.com>
> > Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
> > 
> > Hi,
> > 
> > On 2023-12-14 at 04:48:27 +0000, Borah, Chaitanya Kumar wrote:
> > > Hello JP,
> > >
> > > > -----Original Message-----
> > > > From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > Sent: Wednesday, December 13, 2023 6:47 PM
> > > > To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; igt-
> > > > dev@lists.freedesktop.org
> > > > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > > > Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
> > > >
> > > > This is not correct. This does not synchronize with kernel commit.
> > > > i915_pciids.h is supposed to be copied as is from kernel.
> > >
> > > This has crossed my mind but there are a lot of changes[1] unrelated to
> > ARL-S if we just copy the file.
> > > Therefore, it made me a bit uncomfortable. Should I go ahead anyway?
> > >
> > > At least for PVC device ids, we might have to take an exception. Or may be
> > they did not belong there in the first place.
> > >
> > 
> > You may add only ARL-S but then write in subject what you did as it is not
> > syncing, for example:
> > 
> > [PATCH] lib/i915_pciids: Add ARL-S
> > 
> > and describe why you added only that. Write also which commit (hash and
> > subject) you used (working link could also help).
> > 
> > One more thing: why not adding all without removing PVC ids?
> > 
> 
> Actually, I will go ahead and do that. I will post a patch soon.
> 
> Regards
> 
> Chaitanya

Last thing, please add i-g-t in subject after PATCH, so it will be:

[PATCH i-g-t] describe here your patch

Regards,
Kamil

[...cut...]
