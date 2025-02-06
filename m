Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB22CC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 18:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974010E0C6;
	Thu,  6 Feb 2025 18:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC7X+AtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5BF10E0C6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738864923; x=1770400923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YDPyJPsENqhGLjoQoDOTF9G0h9NSxqSjglUQNsB3nqA=;
 b=IC7X+AtI8zd4fQxcsUSA5lDxYv7JHRJ43o/8KQRRJ8KB3EQX/bAfgFba
 iTViRmz7J1zf8zI98MitEP9dLKjFb/g4ZS01e96TmthQlhoaVFMxPKuTZ
 Zbn9LQDbajVqnpIA478PBm7StSP8yCfhGRx8UFkIlsg/3Xxjk46kmz1Sp
 PXpHYttsa0B+mtxN6mkDrTyaYPXSEpyoJ3FgXCkePvemFT5r0M1EDcxbY
 ksBOKFWLpvRu18ZNJU/SRoG78BH2XwbYh2kz1b8j0Ev4GsO6Co2jK4OVg
 nKPAYpEUB3sYX7puRSFgH/eh6wtWejpAnX7O1a63kENASs20aKRLORG02 Q==;
X-CSE-ConnectionGUID: GDZnIYimSgKvCICd7gYVLg==
X-CSE-MsgGUID: wfJpDIIvTXa2dQU9uR3vQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42323820"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="42323820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:02:02 -0800
X-CSE-ConnectionGUID: D6hSsZl8RqmOfkxA1nzcUA==
X-CSE-MsgGUID: cBgyFG76Qx+9ukhZca4pFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115895190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 10:02:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:02:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:02:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:01:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSrvB2CyGG0mhVEkQ2dD1mynik0VEN8WNmvpJDJI0kkVD10ajkWef9Och9xaFBTSG1yAIVvDv98KVW2e+l+uRI7rwSTYBSlwL6Msqg7e+FnwGRBI4JHrMLXA3haK+a7cuYhTx58wBIXVeXESS4/g09j3SYzMn3zdK5aX7/jwX5Lb/BDUmswmU+ynqOiXYrHvcboWdW9UnyfbTj7eyl+xwwcLVLGhcQe33RObZqoNtdNuNCgLJaW88/6EkoJVJcw06xqgqOm/IVJzIL7nEfwSzt3YN0tHXC/z4HCh8+zpUHRnxci7qJ5Mr7Z///snjuknPrVNYi4ZbUvkRdVZpz6KXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2ptq4cqdQCnnkrIrJl5vPhXVHknGxW6KNj3iAnruTk=;
 b=xxvpaFJQVERPEMCuaZ/QUl9ZwVAVOBs0+jyFruSicnwRPwLjNRdq5ICOdQu7aDrtz1YCETZID25XJYbQ24W2buuP7T9bLQPi6f80CJ6J0bxVwEvM0tdTKH+/XIyw8hpcF+vSpDbiqxhX1vWz9vbIwp03R6IWghhl42JeBE3da1cTS4UMbPTxTfeDusqq0t0PON5uWEUIah/DSIAX/AD8lGAyKuZSGNcs+iKqPXDRJ9P98a6VEMyjxoC/mpNF6pZ+ow5GUe10Ealexv8RUpsyZsF655Awzf8LMN4U6X4v5Lq5r9U8wuVFXLqHH8BMsfsRc6o4skaIqeR7sSkHBsHtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 6 Feb
 2025 18:01:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 18:01:16 +0000
Date: Thu, 6 Feb 2025 10:01:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6TsGM6LD26qIcRY@msatwood-mobl>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c66725d-9848-42a0-f8ef-08dd46d84047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m1KnHAAsvZ1GwYoDtjvf8dthJG29UOVgThqJdym/BzCkDT7JKbZTjhzlpsKi?=
 =?us-ascii?Q?eb+jL/xq3HXIXNWo0yn30RXrd2FnpshcZPUkbrOhec/zZb+nlvyX4n618E3d?=
 =?us-ascii?Q?0oDpIxfZ7dSI8WAV7FLAyYUoN3XqKIjq7XqzV+StX+jUE+0u/mIG584H94nB?=
 =?us-ascii?Q?M5o4zGfZ+HLMblV0CE4GE8PL+6Cg5vfJqhL3O+Yjv6zkEH3eGrfiurdhBjsG?=
 =?us-ascii?Q?qhZQap7yc/V7CgVV7HlOw+QIN96CFv1lfATKkShE7SM+jcLopvFzRzYXcakR?=
 =?us-ascii?Q?rufHxg/TxX+rI0Pvyz74vfxPu791PNIELxistVSpzz7oOe2haMLsRh8ecZzI?=
 =?us-ascii?Q?TX++U6mFuHjGDKOiJXHBhUH4WaLh2J8uK0I650r19dq4GvOMY4E0kfWybSBq?=
 =?us-ascii?Q?s4pCB+yQBCktnZnCXiVDGTu3r3Y5lI5slMUZWq67bDx4hu76EVI2gFQ38snI?=
 =?us-ascii?Q?dPa1diHInC/PyEpHOMlA+rVsAUhpVW7xCzVq9frXTooR6KnZKp0rHKUgT392?=
 =?us-ascii?Q?2FG8zmZWzJvyitiycdldn3h/CtrhG81ux7eYpVaPd8y4pFpF/y3w2CljA31+?=
 =?us-ascii?Q?ufbF3VQMJliuZKsG8wxXzJquDj4P8nbaTP4dkqg+mTKD9NgSksIrdQDyxPDy?=
 =?us-ascii?Q?QxMqQ2CiyPT2Nc+SD5Jdp6/39/G5+sg8qnPlCSsAPQOyKEghtpoNS+WLBRrj?=
 =?us-ascii?Q?cIBsKALRCRKpYjsHhnXrk2jzOTSivtKkkRj4NUU49+c0kgmpqQhw18yo7N+w?=
 =?us-ascii?Q?XW8/RykxaLvo6qvFm6wLb1OCwVDSzvi8mq2afv/yGbLQiVyoBA4xG4vYpkf9?=
 =?us-ascii?Q?ZfESnt11/gPzMyYNCvEOlIg2RQ1t2CYdIjVm2xVVB+5tXk6Bnz4SmqysPhLW?=
 =?us-ascii?Q?88EyElkvdqs4TJkfvb+hLAhlWxzlOFXuoxX7VkqbKUP1PDj0m6xuaKtFqVdj?=
 =?us-ascii?Q?5FaVdfLaG1IIJuawcWp/m2qO2H/s2m3YbpvH2oLytKmCfRUeh4xPvn/rsXoO?=
 =?us-ascii?Q?NSUWu+6k50bcKgIS1IAgtoiSQKxlFNOYzP+kKtO8DrF89dkm3b43O0rV+3eP?=
 =?us-ascii?Q?HdWwuaSJhALUh3Mnh+e3bJBfPiAFj1F+c2rfL2DmMMBbPue6KYSSXJ4ejlTi?=
 =?us-ascii?Q?Zys3OnOg/r3H1kt1PV5jlX3z4aXaUduswNc2MIlJjMZ3R/QaLr8yKsMMxSAJ?=
 =?us-ascii?Q?OHNHWAJQyIgdGhZ4qeRDzeNWTs9VaVE9WMzqVa45g2+Rb5QHUQqUABXM2DYo?=
 =?us-ascii?Q?xARcsHD6LZbLv1U5udeMVctAU039vv6fOryMgWfO4XqP2KYLFHCXQ3pPqru0?=
 =?us-ascii?Q?OEkLsCtscEtH1QeilnyWbq1fg7tflYp/yaIRL8uTbz6tYoBlY20vLYTNcN/f?=
 =?us-ascii?Q?2UkqaFLY9en2GgSUk3kdtlgiCROP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VZ8yJnhxWUUj8zz2e+xsqACD3fSWeitOA35630sfKW3c7frqkHFC7BRCb8I3?=
 =?us-ascii?Q?yd4zMaVl494qaHI55D9gyCbUKTyWMkLZfkH4wwGziat6kdoDhpg31Q0GVAx3?=
 =?us-ascii?Q?euiPhttVPdsk6dlNUBIIY8j60KluONnfHjJ8nNHPPILJtcUg0cYi26OKfXv0?=
 =?us-ascii?Q?4vdOOf89bPQ8nLhbG5tLDu/voK1n/XTxMGGkz63MV+YmtzofAYqRQI/q4JfB?=
 =?us-ascii?Q?7vGmp0kM0QO0T08XdLbnrKBE8VlC0xX0GNQo0ukHsKMkyfPCRk7q+ZgRTnED?=
 =?us-ascii?Q?XdLovv9QBTwIAUkElVJdCiOgJHsZg4v5GXW3KofsUW4B9YKsid0H8vC4/9eA?=
 =?us-ascii?Q?zxGDNiaV/Ie7RS/iZirWpF+p2X1L2Mn4Nx9gp3DCq/3MRJyXRjkHu0aO0AFn?=
 =?us-ascii?Q?OPTzxVPV2QXhrJWt+PgyOLkwqvBp4IzFOIF3aiE7WgDKaWetfXyMcwgU/ENk?=
 =?us-ascii?Q?IHehtQahwdEmoGmZCM/ib8BXVO7FSqjvlgxOsujpLHqX6pwduZEUJfAhwYdE?=
 =?us-ascii?Q?fcNwVIubYB2kpFGHHY7QOqY4kM8ixNiQKFfO73XsXWcWq8juVYPTfUqmOWVm?=
 =?us-ascii?Q?Xhn24UVSBcGjeUf95EOiSLxHWSjLf4ql9cx0Y2ubzIUgTpIke8kpx4MTtb9X?=
 =?us-ascii?Q?GGEWNQukP3yEPjNfBxoS6FPyktevBmyjp4WihvttmvP2JZwb6EVamJ6ovC3+?=
 =?us-ascii?Q?IDHLeGYhVmv5FCA8md+KVkaOE1ih2GyWh5qFz4zXdf+seFlc4tSdcEU3Hl/P?=
 =?us-ascii?Q?jtPB3FxwAA68TyyFnBSDv+6P0pdzKt2e4R0dWDPhoEHUJfJNj8hFnfasyNXP?=
 =?us-ascii?Q?ArGXS5sLxt83hLkK9UkCWFKi674n6y8qMnr9hgck6PgIiIv2YJHfpYZXWGjs?=
 =?us-ascii?Q?5nuh0BkwUYsxMHVppszICHApq+InCDKAK/OIYo7w904gsoTJ1l688tysfqTF?=
 =?us-ascii?Q?F9SGf++Q8jIaharpq60r4azEhNDdYqFoinmT1uLxu66YXhisNhnQSKLmu9rQ?=
 =?us-ascii?Q?2jDB7JkSrpN9n/UnbgOhXttkRc8JrYvwdw3s5Epogz22ixoSKPPRTp9xTKdz?=
 =?us-ascii?Q?FwasOZWGJIexRu7vcfHgTRRP/wy/5HargYCJ/YvxHDjQ934J9Lej2+phlRmE?=
 =?us-ascii?Q?KRqNKCrppD5apLunZ6/hC0kIZSsZr7tB8/52U/CTJzwp0pOV8QOpIrWqwYQ4?=
 =?us-ascii?Q?3vTmQ5vors+MZU9L8feBXF+F59a4TI9Lgt6GcR7PSCxi1suMCZ1rgGem6BeX?=
 =?us-ascii?Q?aduYKWumuoLsFVfDJP0PVpmz7fz2LD2rjYy+gs5ZZLiT44+LSqWXtuoUAXrA?=
 =?us-ascii?Q?uLTkfvSKR3kFYOkG3XhI+AiUHhvzOcXQd3lgeU+3EvTtz/aphLdBur6wWNm2?=
 =?us-ascii?Q?5YHtaxtR0e2mSNy/+LpCeKBwESSq0XFdr9u9ckkoDS2iHKWujyzPPmgOYo1B?=
 =?us-ascii?Q?NZD6cXuary0eTg0DoXirnmfFlxNWnZSsJQbCWaN8ZZqiKz3ejiYempSrE0py?=
 =?us-ascii?Q?OITrCTfNEl8diRsdXVM+8xmQTxlnCcyjxVn9ntxGp/GUSoSnyl5+6DGEsT1o?=
 =?us-ascii?Q?LUOlzUdXn2X8Y+rJXlzSLqus2MjT0cSiw5CcfBZk76tlQdjXke+BolkO33hO?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c66725d-9848-42a0-f8ef-08dd46d84047
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:01:16.3653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a4OoOeW4VNlUJLKLi+vK14j6SiHk3EUUsWga5bFaIpQxUq/BIOEXWjeWghkjP/1EInyg7GYPa45vlW0kzch/r2U4iwB99BafmHZBdiBxpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
X-OriginatorOrg: intel.com
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

On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
> On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > > There have been several changes to pciids upstream that need to be
> > > sync'd into igt.
> > > 
> > > Sync with the following kernel commits:
> > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > ranges")
> > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > 
> > The updates below look correct (they match the kernel header), but the
> > commit message here is confusing.  IGT updates to this file generally
> > specify which actual kernel commit you're synchronizing against; none of
> > the four listed above match the content you've copied here because there
> > are additional changes not present in those.
> Because there are now several out of sync next branches, saying as
> of this commit idea was not working. Hence this approach.

You should generally be syncing with drm-next after things land there.
So which drm-next commit are you syncing with for this commit?


Matt

> 
> MattA
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > ---
> > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > index 23f349f65..4736ea525 100644
> > > --- a/lib/pciids.h
> > > +++ b/lib/pciids.h
> > > @@ -717,37 +717,66 @@
> > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> > >  
> > >  /* DG2 */
> > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> > >  	MACRO__(0x56BF, ## __VA_ARGS__)
> > >  
> > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > > +	MACRO__(0x5692, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> > >  	MACRO__(0x56BD, ## __VA_ARGS__)
> > >  
> > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > > +	MACRO__(0x5695, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> > >  	MACRO__(0x56B3, ## __VA_ARGS__)
> > >  
> > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > > +	MACRO__(0x5697, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > @@ -782,9 +811,12 @@
> > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > >  
> > >  /* MTL */
> > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > > -- 
> > > 2.45.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
