Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C08C9B9FB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 08:01:50 +0000 (UTC)
Date: Thu, 11 Aug 2022 10:01:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YvS3acwtaeMPrHe9@zkempczy-mobl2>
References: <20220810081949.17706-1-zbigniew.kempczynski@intel.com>
 <YvOm0ASUb2cN+EcO@platvala-desk.ger.corp.intel.com>
 <YvSx/FLfmokc3sYb@zkempczy-mobl2>
 <YvS02pYIx4f6KJ+Y@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvS02pYIx4f6KJ+Y@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: Rescan pci
 properties if PCI_SLOT_NAME wasn't found
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 10:50:50AM +0300, Petri Latvala wrote:

<cut>

> > > > -		dump_props_and_attrs(dev);
> > > > +		if (is_pci_subsystem(dev))
> > > > +			dump_props_and_attrs(dev);
> > 
> > This incidentally left in patch I've sent (I just narrowed debugging
> > to pci subsystem). Do you want to resend or I can just go back with 
> > previous code and merge?
> 
> Up to you. Breakage potential very small I'd say.

I decided to merge, nothing wrong should happen.

--
Zbigniew

> 
> 
> -- 
> Petri Latvala
