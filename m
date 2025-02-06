Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3FBC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 19:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ACB10E30C;
	Thu,  6 Feb 2025 19:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7HBANuD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DCB10E0B1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738870539; x=1770406539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9+Fgzn/8N/Uhx0a8sgidqU5SV70sMwj90LN4KPLFf54=;
 b=P7HBANuDpTuDDfNIbtHdWlLUWv87sgc+xJbRcFvF/dbx679Ow92anbta
 SIMYv2EBoyfbqpG2WEY6jY8vvL/JgOghQlkxTRUk+S3tt8CeQBdClmUtx
 ABxhiAes4oXqVv53xO2JT+fQhSyh4OuzbfGLj27RKdR97VXxE76QLhTv7
 b3KjvmN/AjbCTQLJx255BYxC8doO5KGYsAtdCb1pKd25CtYNBhFy/SYJd
 u40Jwrs+6FuG2JaupaPnxBUd//484INd9RkoE2fQADHia+lTFmMjqY5I6
 TIoVHgFfcougFTP1VHkPUiDGSh7fVKzFuXGcBYmoZRs4456+NpN0EVZ80 w==;
X-CSE-ConnectionGUID: 82ic4meCTfisCVcbIOWsxQ==
X-CSE-MsgGUID: tA7T+FwBTrmvdnFK7BA+FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42333510"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="42333510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:35:39 -0800
X-CSE-ConnectionGUID: sRJ6PBH+Qr66KiGkIjGW1g==
X-CSE-MsgGUID: d2JJC71GSFiF/Qvi4C90Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111080247"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 11:35:39 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 11:35:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 11:35:38 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 11:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWrWBIT1m81UKFrYuKD4PmT+Bxw7ubPfSDxdGpBxtTzTBhswWIUt3yaRHN/iZlwDkIyYQ/kqXAWP4bSnNhLNXsDVQ/nyPI3E0guFGnWBh4cdglCBnPeWX/8RmoPc5/kbJGF9R7RpZ4RL8VOCJ4rmUqlW6SZKdX2CQedwj8oMTyuTc8cm1HLlEoFFhndQM3Gu0Bjur3cEkHHRO2cSll5LIfvz5hADkTlqkGvmG3PUtRuD522skUR0muzCMSugnym4mXKK2LFJevfKdf7s2q1ht6iGnkS2enmPslbfO8Z6EdeM2cD+OPmwV95UsnmgfFHKFlVBts4D34o3FKiqHOJWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0+icXIqAHfOsNESoIS75ZuUqPJ32nVOqhv/beILdfs=;
 b=xXfijgniCRqkuXXKG3JFvO+6E5O+g9Ul5obmQfdNzgB1MgUYzCP9UGjXc6/DSakSx9q4F9ISg2fA0QMmuKG631adjwY5kirjtwIWFYpZoRiT/Rp2gqKQLomsCvOlnj1rWBSXHzOBYNIp/z1OatPtEaovZxqtBDL/0WalrOIuRfvXOKIIhCnCHbMvW0idxAW0H4LX/zqF4Nx5GRsWueb72Cj+p460tCInIEby5bLfCWC3lHiuyo1YdZWhCuOq/a6qCE40U5Wl5RZkOvWLHfrZTAxw0k21J0R6fM9hdgwUS8p24GuBzcquI1dKI1WqFbO/gCtGajj84J+4VweID0FI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 19:35:35 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 19:35:35 +0000
Date: Thu, 6 Feb 2025 14:35:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6UPA-zaG1AwWAlX@intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
 <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
 <Z6UMzbDHC9vMPRI2@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6UMzbDHC9vMPRI2@msatwood-mobl>
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c058b5c-b215-432c-413b-08dd46e56cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KGVXxqWzR5vAGssRin2YRacNJPR1bpsQLcvet2YxSe4jTdiR0dXCcMOYYnhO?=
 =?us-ascii?Q?orw412+TVc8aQ9pVddqVgv+aAjMV6OTdb6xxjHO6QsIW+qOBt20ijYiWePZi?=
 =?us-ascii?Q?FszuE/9A7SifnlDO59mKf6ZTqWZF77rJvZ8W79d5+OIpf0DHq3YWAZ85x3Fj?=
 =?us-ascii?Q?Fmq1JmGtfeeXpePxbUOC5uaSXcS5bjArwqdsAh6xPyuLnDprISN/C4SGG4Tr?=
 =?us-ascii?Q?uJwq2Td+rcY5xHY+jSWO0gy6bQVbp4rZ9Xo02iWMrpyg06iTapOd8qOCvtkq?=
 =?us-ascii?Q?czmYKtndNvfkHi8yJDpLqhp32bGlK6HWnM6eJAZZggFHeIer24gUzHicMNZX?=
 =?us-ascii?Q?ETr+fhMK8a1tsOl8ppEf7KBoOOmJoutqGAZ5cHO3Bx3KVUJQ+yFDBj8NNeQ4?=
 =?us-ascii?Q?UsM3iZTS8AamN3k9ZTuO0THwfpF320We+6/XKzXVivqMexlS5OoBllJ9+nLs?=
 =?us-ascii?Q?x7PYUAYocix8aHC7LwfLRZHZNtGTLb6pxFkF1cYJs9mbXq7HjSCvKIsx9nSN?=
 =?us-ascii?Q?K2d0+MlHSzqeOOl2E/AemOoVtgasdj3Err2jET4cDarNPW0UehRZmOfX+S74?=
 =?us-ascii?Q?QBB0qAkDK4teDh1qO4852NUI4D/qoT5EZW1oQ6sL3luvpJN+y7e1qpXkFwzz?=
 =?us-ascii?Q?Skw0gQSN+t4+TkltF+iW4EW24+ie98Sb1bRyEFyR6mVJJN9dWkTzRrRRAvMH?=
 =?us-ascii?Q?AOYE/DO5JD7Kqyy52rJF6pK8PctxYYZ+q80p7Zo4nyhtQGdmcXQgBFezQvo+?=
 =?us-ascii?Q?/bVN/0FtlBdtUk2fbVq/zB25f56jliz5XwAZHRlahOIOg+x2QKwdiqjv0E/e?=
 =?us-ascii?Q?V4dkdFbCeIg43GvnRUvSNF5ogc9ZkkrvQFq5sdSqT/d4vDEJ1H0uQzBc1TkM?=
 =?us-ascii?Q?+/xbLbZmrklCedtwanb6fbyrDp4SyHD+Ca3lj1KvybRc12C00KcCThjkqMVn?=
 =?us-ascii?Q?A0s0Vq0EfJsTfgyUB45fPBH9wpfQMttudzd/nrTytuart2AJJHbd7wDnWLgf?=
 =?us-ascii?Q?1Q+bNRCsT2nSGmtwBs0DJkCXfJ2SqtGNL870CmTYrqLkf+j0jOWGJ7x546TX?=
 =?us-ascii?Q?i5FKzDx0o+UaT8zHZUMimcfLydNyAM4h+o8ODw82VYsWsJ+5qhTMjUnwI1hI?=
 =?us-ascii?Q?e5jhay6i2aym7ckxFTHXfOfQ0GpqFw0VLXBADMYCSzhyY0uGh1Tx3LWwkHSu?=
 =?us-ascii?Q?CUs5Hk04qRRzMAKycHKlRFEEIY8BL65+aeTLzYtC2bRNwuqNLA3/OMzuYgoI?=
 =?us-ascii?Q?iGy1PAU5OKibjx32lTb22GIUXeiCEnItkDp2PxhTmOigjW5x/y0YRP+xV5Wa?=
 =?us-ascii?Q?7yi4Q7LU1bmD2yhVVgK1lwrgMgv9/9PlkJSnEOzKH9u+2CUMtab0jCdLOnBN?=
 =?us-ascii?Q?x3c8eeffPinYDVV6LJtpdwD2HGXh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+LyXErcKxWY5GzIeeAGD8wUwcQLN55iQp65pGlW8gDRy7SHWZEzJKeqsoZI/?=
 =?us-ascii?Q?Np3Jlf031VDTXAZmbHLsHrDDfW97dPiyIspryVWEcd/8ZU8lA5INCTqht8RJ?=
 =?us-ascii?Q?SAMkEy7yoZFcUlXpQ/Z9x06SEEu8SiXz8Psgs7Pu3R8f2kliCHiOtzdROSpN?=
 =?us-ascii?Q?aILaZJaO/34kxpzgtxzPdZbcyn38ytoGR1NbDlumZyreStuN7UOxzmuM48tX?=
 =?us-ascii?Q?sgm1pgNCwilrxkx6OthfErtR5wXooOhVmhJg0n9NpeCSnF8y64LV4IabSw1R?=
 =?us-ascii?Q?kad26q3pxQKlVhO3N6T0/tIWFgqdQi3520CF24PtHyYUEoWri4lTpShKhxEW?=
 =?us-ascii?Q?ktvrt4gbdYHFewVIGWldeI85srOZTgQ68QMihm8S0f3OyZz8HQ1v+Q+Iy4tk?=
 =?us-ascii?Q?UevCikKmLHMMXG6cVY0mwBFpZmZlO+GssU7aNABpIc9a+e11+nbS6MUwfvXs?=
 =?us-ascii?Q?sy75FIJ1XQKgCTalxGUHj4i2WQSnGbNshP5s/Tn8oP+HKVV+9MkKVvYC3NxS?=
 =?us-ascii?Q?Wh5tVHkQe2pBGwDHUpfTFwio7Fxx2L/8B1GhzhBtSJ+2oiLZ/4gssEC+uRkl?=
 =?us-ascii?Q?Udd0gUpQ/cUw95KKr6aPjIpbGNoGkPlFSi6d6fFMpFwj1yAa8b3NccMIftqM?=
 =?us-ascii?Q?wV4QaC+PdtlTCypHJUZpuFc4XS91X18zB5+BWvA03ERyXyAcLupx13jRZwgy?=
 =?us-ascii?Q?S5h65xAX2LthbIe217ncn8EjQB8UXjWp2qSQRzaN+U1FLnCRvnpKcG+wuXYZ?=
 =?us-ascii?Q?4IESq2yj2vfchPTST5HxUbWwnaACF0tUBnwdNU8XSeMEEdkjVjMmBE7BN8E3?=
 =?us-ascii?Q?ev1DlIWXTMTFgZ+rHZFRLjeScCtc7kHN2faJnq8aNzYEsdCajCLXwoTeeZ5k?=
 =?us-ascii?Q?hfGfY09Dtl35FdENw6MatFisK0OKpizTO6NIKQVpNXje/3EVsCwJsNHbzZyP?=
 =?us-ascii?Q?JUNGiafwzwKLG0ayF/UTsqPRCL7vcn8gAccIdxR8lKualShkV+UqfDCzS3kp?=
 =?us-ascii?Q?Wk1ASdZ1FngORNane6Bgo//0BpJBsN8gxUilb5VdeWoO1o5HlHwxMGFQFgS2?=
 =?us-ascii?Q?GxAuUZFTSrCC+sIWC5sLleuesFaXsPCZeoEdOAr7XLAw18slK/pV3bpuP6gK?=
 =?us-ascii?Q?OzmmFxn8+eKPjQiAH5Vsfyo6OH/4G6g3xuYMCREkEqoSQdLG/441Yc1Jybxo?=
 =?us-ascii?Q?belQXnxwbkNtic1xO3YfLXnNbUKSumySfRF6A1/Eu1lYDY/eUkr1bJT7qcAG?=
 =?us-ascii?Q?LCkg/Ydgo2Rcyerlvc0wMqPPTmGPLU4xb9rnpvPVK4wG9FMiOIuYVOiOiJzo?=
 =?us-ascii?Q?aoIJtw+QHEU+JGWJbMw6HuZ8iQl1aDdiFuvCscaMruBVq7w+sloE7cMtPGTD?=
 =?us-ascii?Q?GPHQOPffEYFIutKOaBd4jhGxlXLkBgdB3N1Uf7GulUlbB5H/bBmooIuHAj0c?=
 =?us-ascii?Q?P9X9SqGMfrYjIWoepP4hhCO4P9Ntq6I+k5zkg6uCBO/JihTPu01XPj7RUJhb?=
 =?us-ascii?Q?NZayXzkeD387kayg7jx4/Pt3mqPEVcJhgrmw/4sxZXp+wCXVMp1B9Um/Z7WR?=
 =?us-ascii?Q?cc+mA+Og/dKFrQ36Fb6HSRY8+2pavJGJa88sjigZCketjNBnd1GUOyUJ39Wc?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c058b5c-b215-432c-413b-08dd46e56cd5
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 19:35:35.3785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdSzCDj39IwnJo/0x2IvVczUOwZg0vHTPD73KXjfDFt/pb+cJRvTjE1+JSDXn3oxrPRbCpVF+0q/b2lC8pHsVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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

On Thu, Feb 06, 2025 at 11:26:05AM -0800, Matt Atwood wrote:
> On Thu, Feb 06, 2025 at 10:01:13AM -0800, Matt Roper wrote:
> > On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
> > > On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> > > > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > > > > There have been several changes to pciids upstream that need to be
> > > > > sync'd into igt.
> > > > > 
> > > > > Sync with the following kernel commits:
> > > > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > > > ranges")
> > > > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > > > 
> > > > The updates below look correct (they match the kernel header), but the
> > > > commit message here is confusing.  IGT updates to this file generally
> > > > specify which actual kernel commit you're synchronizing against; none of
> > > > the four listed above match the content you've copied here because there
> > > > are additional changes not present in those.
> > > Because there are now several out of sync next branches, saying as
> > > of this commit idea was not working. Hence this approach.
> > 
> > You should generally be syncing with drm-next after things land there.
> > So which drm-next commit are you syncing with for this commit?
> They hadnt been in a drm-next commit yet. At the time it was just after
> a next cut, at this point we can probably just wait for them to land.

I agree with Atwood here. We had changes coming from drm-intel-next
and changes coming to drm-xe-next. In the kernel history the changes
coming from drm-xe-next are on top of the drm-intel-next ones. But
they landed first here in the IGT.

Now it is in a situation that individual patches from drm-intel-next
would conflict here badly. The safest thing is to keep it simple and
use a single patch like this.

This is the final copy of the file directly with the proper mention
to the commit ids. I really believe we should just go ahead and push
this to finalize the alignment before something else gets in the way.

> 
> MattA
> > 
> > 
> > Matt
> > 
> > > 
> > > MattA
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > > ---
> > > > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > > > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > > > > 
> > > > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > > > index 23f349f65..4736ea525 100644
> > > > > --- a/lib/pciids.h
> > > > > +++ b/lib/pciids.h
> > > > > @@ -717,37 +717,66 @@
> > > > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> > > > >  
> > > > >  /* DG2 */
> > > > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > > > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56BF, ## __VA_ARGS__)
> > > > >  
> > > > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > > > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > > > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x5692, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56BD, ## __VA_ARGS__)
> > > > >  
> > > > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > > > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > > > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x5695, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x56B3, ## __VA_ARGS__)
> > > > >  
> > > > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > > > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x5697, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > > > +
> > > > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > > > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > > > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > @@ -782,9 +811,12 @@
> > > > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > > > >  
> > > > >  /* MTL */
> > > > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > > > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > > > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > > > > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > > > > +
> > > > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> > > > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > > > > -- 
> > > > > 2.45.0
> > > > > 
> > > > 
> > > > -- 
> > > > Matt Roper
> > > > Graphics Software Engineer
> > > > Linux GPU Platform Enablement
> > > > Intel Corporation
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
