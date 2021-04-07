Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6486489A9F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 08:29:08 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed, 7 Apr 2021 08:29:05 +0000
Message-ID: <SN6PR11MB34217697449095B84B8B7B4FDF759@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210407030952.44288-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YG1igzvUPT41npFD@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YG1igzvUPT41npFD@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] test/i915/basic-wide-active: set max
 relocation limit
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
To: "Latvala, Petri" <petri.latvala@intel.com>, "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandey,
 Hariom" <hariom.pandey@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

We have limitation with driver in respect to many relocs thus relocs are removed from GEN12 onwards but still GEN11 and below are using many relocs. This patch makes practical possible number combinations in order to make test pass on GEN11 and below.

Maarten would you like to add anything here with respect to Petri's comment below!

Thanks,
Tejas

> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: 07 April 2021 13:13
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Pandey, Hariom
> <hariom.pandey@intel.com>
> Subject: Re: [igt-dev] [i-g-t] test/i915/basic-wide-active: set max relocation
> limit
> 
> On Wed, Apr 07, 2021 at 08:39:52AM +0530, Tejas Upadhyay wrote:
> > practically its highly unlike to get as many relocations which
> > basic-wide-active test is testing thus setting and adjusting max limit
> > and count to avoid failures on legacy platforms like KBL.
> 
> The previous such patch against gem_exec_reloc had an unaddressed
> objection and it was still merged. If you don't agree with the objection, you
> still need to explain how in your view it's not valid.
> 
> This commit message quite clearly says the purpose of this patch is to ignore
> failures, improving passrate metrics instead of driver health. The same
> objection to this patch applies as far as I can see, so nak on this.
> 
> 
> --
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
