Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BACFD8FF2
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 18:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6610E9CB;
	Thu, 26 Feb 2026 18:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFDqTOuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9510E97C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772130055; x=1803666055;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wlWMzSTDMHlYfNihbxTgFAC2tZCp9cDX3GMc5HrQEr0=;
 b=TFDqTOuR/yYlDV67ouVY23kPoP+44pZSjTUrhGEC/PXAv9RJfxycC2II
 2Ir5QVc0PWYXMZE1gDmNx0bmgWeCwal5/cbjuamuUTkBbgMr8n7UNDAzu
 QTE247N1pNLs/3iNeYnMfvwOYDrXnwhR9s1mee/h25SOT6EX12/pXNI7p
 WUjOxp5jQdUvEYEd2EqckcdHM4VENhkbhpRl+lKPcEUdv7/h2W72+CXJ/
 v7jQMXY266Or5CfwwA6WAQn0/9i05GKcPDIxekoId7Ftxsro/B00EK8U7
 lsqLHZ5BlN0sC1oamHguv30P4lC24sD9PhXTa2lO1/ZYBYC48dsiBsVxr g==;
X-CSE-ConnectionGUID: V3UuXkwOTCiDj3htzh2fMw==
X-CSE-MsgGUID: 7zIRZXZQSMKX2BdYhoyQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84662323"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84662323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:20:54 -0800
X-CSE-ConnectionGUID: uLJbkA68R26l2R2MW8HwqA==
X-CSE-MsgGUID: 6rTH2bk7RLetYPnKzikocw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:20:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:20:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 10:20:53 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:20:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GY707hT9PO0isSBIRHBgsGRsIKQGRejedbKdmgx2NwB5iBmqWIOm3O+VUGHgCATh0tG4msDp36dULpgfakGYZuMfgiqlzx2xgvKcHWne8mlZjh4hq6dCpTIVR8npjW0z2hVWJEjtRorVuEIpwDrEFT0dW/XFePvcz+DSXOklxyYF0e1R8HUtT8XOlgYHipRRVuW1dtJ9AG+XGsl2V5X2dBPUl8+6HFZI3tdIkGfLL+sj3OJ21fyovLNdJ3W4gepReKihzrZHwETbZXD+QPqTfiEOZyHib6q+96gm0ApIRDxFKlOL8CivfQFPJgLi5UGEbtB36458xrwkGnvHLgC4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIqLPfrtKH2h3hg9+Nh1yVC2wjOVJsl1OVniw1cCQjY=;
 b=QMRg8lzgFM4UMFhtrMiTDSve3+nZlZ68I/8QjogX81AwfW34W7iqgdkxpm1XYq+VMZLRy1K2VPuXGlwdljzc+fTBsB64UHTMWdqQQwHx2OLH2sX7F86JN3Th1BB9kt8SsBPJcqgbN/OdbaNbY9aF/jw5qGHe4Yp33A0py3K7INtlYBNP3c1yfyzWa4XhLeAfE0EUQvdWDykYeh0EwPjJDFy6JdK3CKE2b378zsfw5yq7ku4zlobvPnnMLVDYd5s0WT87NvdqGDogV4aTJ0OA0Dd0//jxwYf9D8nasxEHECGzU/5/GYTrjGGJZM6tX2Fii97T7hzwcJ3dilKByhVI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB9473.namprd11.prod.outlook.com (2603:10b6:8:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 18:20:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 18:20:52 +0000
Date: Thu, 26 Feb 2026 10:20:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Wait for compute walker before
 returning to ring
Message-ID: <aaCPAXa/r7FeJw7b@lstrano-desk.jf.intel.com>
References: <20260122104528.980532-2-zbigniew.kempczynski@intel.com>
 <aYCxngV3yoXnYQaR@fdugast-desk>
 <qpbdm4jnjgoeygdnrbdjvbqx2arrp64cuze62izvzvp5v6xbaw@76hvvll2vrzb>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qpbdm4jnjgoeygdnrbdjvbqx2arrp64cuze62izvzvp5v6xbaw@76hvvll2vrzb>
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: 225b3686-0f6d-4823-eaf8-08de7563c649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: nO/QW+dmAAtLJpSkYj3lxhJe/fI6RArjRl560fYvPa0/GclrXaWwRi9JWXDz154WX0HBDmGSdYcljKzoMqN+WcvaVUYhyAOB1ZS2qE5GBnJsRWteXNSwh0Weu+JI/vi4pclzSDaI3OJSw/3h0GjfPRkHPC7efGAkR5x5nCbourPulolHtR0lCHEKPpEe80fZCLnYd6y8xKJbcAYGOBWyULW7zvn/STOMXPUbvSRkDoZRBrs/LZqavf5MeO5TQPwF3STXm3IESewrls3c41X3JV5aRkSiqj7ySYX3WYdCXo3RmA2GHMQ/BcfQnekxvi4nMMj5QiVXIQwIrIIRl+ssMS1A7TUm1ppano8Yen+4yT1MM9skD8rdyBxmUFNCyQGxFUJ6zd7I5Ypbxii+26XnibtJQxbM9tZ3a2Dh0KeTKOIo1tI+i6Tw7q9eth2WZIQbRPXnucJDzF0pIEx7XEkK+/bPAZdyjmlEb18NTHJV3K4fSSRb4zeSj5Ua1qygO+JY+dIyDJRpwiRvl+ETmoHW8iLwXq6zt1qTLlk2+qTgK+lPR7Z7+8AKul3tGSAT+CqCmxhmEMZKfQw49ueE+oExkuINjLBK7OShAyo/fKAiUkKFXvHmlGtQ+TVX0xnq+lA6+4NZc1O8kvBrJUPJTrBz53S2rGQ7g3bb7h6U9/f+hnrPAePPPm9qeUr76GgIBgiM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9LU2FRcG5ZY0wvcmU4SURmS2VEa3U3N1Q4bHpnZitpUGRpOTlDWjFpR0s1?=
 =?utf-8?B?OVRMZW5vU3ZqRXJqRFdWandVd3ZYMWVwNEdTb0FKblhrVHRxQjFlL1hQMWtG?=
 =?utf-8?B?NS9HRkloWEpTejFXOWJ1V3pVbGF3eXQ4L09VRmRCVVV0MU90WXZnVTRQOC9I?=
 =?utf-8?B?U3Vvbm16UGtkYlcwcWw1YXRhemVONXMzdy9Ra1RsUXM5dFFzNGsralRpaGcx?=
 =?utf-8?B?cjMvZXBiUFByZ1gzNVB1QXRGeFZUTFNEN2t6K3JpQjQ4eUV6YWU0UjA5enZu?=
 =?utf-8?B?bnBUcFpCbW84TUM3SUg3L0ZUbEdmT3ROeFZBQ0FnL1BmNDR6ekJ4clNycjM1?=
 =?utf-8?B?OHVrcSt0bExvcGk5d3k1Uk5YS1RKME9sTGx0eWlBQnB6RE04bElFblFqSFFN?=
 =?utf-8?B?SHBMaXFyb2FhYjBCWkk4c0pSVXk1Rk9PclJ4SmxlVUg4TldDTXRES1ZXL2hw?=
 =?utf-8?B?aFkzZk9rZENRVlRhUlQrQlN2bDVJdm5hVnJwT2U1ZGRud0RTb1ZwK2dmV0FC?=
 =?utf-8?B?aUV3Rkx0MjcrNkJZdUJOcVFqdVpGM0J4UEJJaElCZEdMMWhOVmdhUzZDMmQ5?=
 =?utf-8?B?MjJOaG5sZTBBNmpHZ21NelZYcVM4eWgzc3RaOTYzc3lYNmlnS3p4Smp4SkRO?=
 =?utf-8?B?a1VsejkyUjRjVHN5c2lsZ0dod1hSdEE4czBrUmlXdXFjblV1V1ZTTDJnMUlS?=
 =?utf-8?B?dFNrcWhqcElGa29scEJQbjFFV1oybEpmNzFYSXptYXRVbGpKRTdRZjZIV3Va?=
 =?utf-8?B?TkRzWW9TQnRBVVY4MkhtMTYzYjZyTmx0bC9BeHJQWndHVjdmOVQ5dWV3REEr?=
 =?utf-8?B?c1gxWEhwMHBkN0I2ZkQxVFBGQXBuTU9scE4zVXBtYVBuVFIvc1BhdlBEQWtQ?=
 =?utf-8?B?dkY2L1RBYVkwbU9BZ0hZcmhVSzRUTHV0ZWJxb0tzMUJqRjBocm14NFJ4Kzha?=
 =?utf-8?B?UVFpa3dTVjNkMjhRSzhBT1ZGa29XWmllSGtGNG9RL2xRYWo1Tm5LM0NEVGlE?=
 =?utf-8?B?aTJkMHAxTkZTUVBmc1VianQ4Lzdxd21MMXJrRWpqT0t2aUIzRm95Tk5uN094?=
 =?utf-8?B?S25QMkpoQ3ltbGxEVEk0eVlrWkJPdk5sbWF1WkdZUWM5eGVCbjd4R2RDeXVU?=
 =?utf-8?B?aG5McGJVR3puZkIwS0VldVhwWlhCNW1GbjZoYzJURUNCbU91UzB6RjhoaFcx?=
 =?utf-8?B?WEZQM2NzbFRUNy9ZS3UzeHRXaFgxaXdHWE1Sc0IvdEREYTA4cjJMNjZVNlE0?=
 =?utf-8?B?TW9Gd1ZHRVJrS3RZMW1kQ1U1Zmw2YjhwbjFUQTZwbktncHdNdlhxekgwdnF6?=
 =?utf-8?B?VWFPMHlaam1PMlFicVBZSy9hOWpYWFlWNjVNYmYveVM2dEw0OEg1TkJzSlBu?=
 =?utf-8?B?L0V2RXhJZUEyN0VVeWxNUVNOVVNrb3hYVWxHSC9kaFViV014eG1wYjVhZVhu?=
 =?utf-8?B?amdMWU04ODRXMU5VZ1pvWU9LRUhTTlN5VVFiRjdJZEJDR3Z0dXdoanBQU1pS?=
 =?utf-8?B?OWlQeTdkTFFDVDZyOUlTVzBOQXNmV1liZW5JSldiNjhyWlRRM0tzeWZLWGtZ?=
 =?utf-8?B?Smgzckt3ZmpmNVgrUWttRmNFMlJFMU40L3YvTVpHVDVnTkc2QVdLdjZFS2dL?=
 =?utf-8?B?L2MwQS9JYW9sSkJ5ZWRaenNISzhjYkJSMlRDdEdsSWZiTlZGaVRIYWJtTHdm?=
 =?utf-8?B?MStYUGxNUlZWN2llYU43QXRONkRXcStrbzl5bU1ORDFDa08yYXVLOVVFZXJH?=
 =?utf-8?B?VEV4ZGJOUlYwcXVXZGkvV2I0RzJsQ0FuTWhrMkZpZ2orejJWSEFOby9vUEdI?=
 =?utf-8?B?MTdBV2Q2WmdMZUt0WEdnSTVpSEdLcFJrc1Mwb2w0amw5U1dOL2lXUVBNNjRF?=
 =?utf-8?B?SkgvR04xb2E1aFFMYkpkQy9zSlZmODNaTjRmREVsYWRTNkJlOWgyUlZqTnlX?=
 =?utf-8?B?cDNmUGxkVlQyRncyM3lYNUVMT1RDNGNNNk9uYkRLUDdnbVVEU0F4N0RMSUQ4?=
 =?utf-8?B?UzdXT3J2Z0dsRlowK0g1eE1KeG4xdDQ0VlRqV0xFTU9la2g0TkJLT1NpcXht?=
 =?utf-8?B?d0g3Vm5BNUhOOTZIS1FNWDJDR0R6dWVESnIxakViQSt3WHl1YzBLM3c4Qm05?=
 =?utf-8?B?N0E3aEgrRFJNZjFtbTdWWGdFTUJ4L3NiVzdhUjA2Wlo3TXFTUzZLOWFhOG4r?=
 =?utf-8?B?VHh5aVplZk8weVoxVHd1QjVJaDNuOGVZVEcxTkRIWDFtOHNmNlJRZFhUd3Vp?=
 =?utf-8?B?SFJ6T3hzK0d6M0tBZ2NvNnZlS21rS3MzZjI0eEhnbHFPWmN6M2dRcm8vdWxa?=
 =?utf-8?B?U3BWenN0cks4bWlPL0c2ZXJxM1R5RkxzYVJhNDA1MnArN0t2OEcySnljdERE?=
 =?utf-8?Q?qcUvxgSCJ8V3DFVs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 225b3686-0f6d-4823-eaf8-08de7563c649
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:20:52.4683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRD62qMa489xOYqMeQDOPteG2ICdizuLvjjFQUajQkC5/C0uPRa14cUW5qEbAz6Ug+pcH1IkoXhNI0umF25WPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9473
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

On Tue, Feb 03, 2026 at 08:57:56AM +0100, Zbigniew Kempczyński wrote:
> On Mon, Feb 02, 2026 at 03:15:58PM +0100, Francois Dugast wrote:
> > On Thu, Jan 22, 2026 at 11:45:29AM +0100, Zbigniew Kempczyński wrote:
> > > Most compute tests don't need to synchronize at the batch level as
> > > kmd executes pipe-control at some point. Last xe driver proposal (link
> > > below) causes turning off preemption before pipe-control preventing
> > > entering to SIP and finish the WMTP test properly.
> > > 
> > > Change adds pipe-control at batch level causing sync wait on
> > > compute-walker and preventing disabling the preemption prematurely.
> > 
> > This looks right and does solve the issue when applying the referenced KMD
> > change, so it would be necessary going forward.
> > 
> > For maintainability, can we please replace the 8 occurrences of 0x00100000
> > with a define, maybe in a preparation patch?
> 
> Maybe emit_pipe_control() function similar to xe_ring_ops.c  would be better?
> 

Yes, let's drop the hard coded numbers in this IGT but this can be done
in a follow up as this patch is no worse than the existing code. I also
just merged the KMD part which will break so CI so...

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> --
> Zbigniew
> 
> > 
> > Francois
> > 
> > > 
> > > Link: https://patchwork.freedesktop.org/series/160113/
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  lib/intel_compute.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > > index 00ef280e8f..8578b6e402 100644
> > > --- a/lib/intel_compute.c
> > > +++ b/lib/intel_compute.c
> > > @@ -1694,6 +1694,13 @@ static void xe2lpg_compute_exec_compute(int fd,
> > >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > >  
> > > +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> > > +	addr_bo_buffer_batch[b++] = 0x00100000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +
> > >  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> > >  }
> > >  
> > > @@ -2032,6 +2039,13 @@ static void xe3p_compute_exec_compute(int fd,
> > >  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> > >  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> > >  
> > > +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> > > +	addr_bo_buffer_batch[b++] = 0x00100000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > > +
> > >  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> > >  }
> > >  
> > > -- 
> > > 2.43.0
> > > 
