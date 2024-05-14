Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0CC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 00:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666B710E12C;
	Tue, 14 May 2024 00:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIFa4uOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EA810E12C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 00:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715646937; x=1747182937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9dT6gETb3nLrp8sLyy3ZtZ34jNMuVI+/FVDAPuEp7bo=;
 b=dIFa4uOoXX2xo62mhoSJY7/U7eLWw9Rnjw3W82QWd52kZ1w8iN2mjnkD
 +41HWQvkGappjPlAEomUspP80ZuAee2qdavcKDt49arzE/6WsyUkqwSsA
 KaqAWkKcgsQLlgUw/IwH3BqkyY+Z0pGczjvAf3IEUAK6MVbLu2X6Gvuu8
 9iePnHtjmJ6Fhpi2aMqZ2d6mA+5ABF4A2CsZNQ6/lvdzN90GCZjSc9k7R
 2ZTK9YFCc6PI3Dgyj6sY8N2fCantQK2JeIEMGxqkYA4fBy+z8BlkVhXp3
 m7bHAXn65IQ85F+Dur2/3pVrm+52aCw6LzrYc7Sk0C0UVHIOC4+ZziFf+ A==;
X-CSE-ConnectionGUID: V40N+ReSSvOrKI4Mtc0bXw==
X-CSE-MsgGUID: FW77mqVqTdSNwRIrLTSDRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22277640"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22277640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 17:35:36 -0700
X-CSE-ConnectionGUID: 6NFYg5ZmQmiX+OEAHf9Lkw==
X-CSE-MsgGUID: qOX1xyAeST2PWd5bBUfYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="53706635"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 17:35:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 17:35:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 17:35:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 17:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehGYB9sw8EYlhg5LcXB5VNDVNgrmd8uZha1dolqgJAuLJvjEdYnyT4iuHqyjHx5JByYtk59Q355MlaX3iVPiS7dMZ5k2KMM2f0xPCttpkTi621gy99WZWPc2iPJWSPrVEgod3gTWtj3Qg4cGSfZ+eVT9usUjL6sdgbkQilHTCr2Seq1e+aXkKLyiBGi8bH1IWsxQ3s4bgIMGk3X1Uk4AK6RGzUVMzwGj72ABgkMezIX5YBnS3Q9ImnAiDmcsti7safG5F8cxWPmbjoFwULleY/U/lwLV/opU9yyahqWM6He4Lwiqa9RBxgSPCQqwPi/Rx5pVor5xCPJ6fpjHgWxi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABYG/d/NWGf3Gtac2/NF3KtwwI5XR17aByVjSTPV+Ng=;
 b=ICJhsi9s+ufIUJrWOiQ7B4ARNU2lo0HXKiDcRUZ/HS0PfUggGdW/1pPmUhnH3YvfAYj6q8Tsr/6X82gw6mI4bYkQR4id2vRgKq795F4I8cb98HsmF7CRoFh37c6RibBzbR2ja/InAJFG93NG/4RYuf56sK5kWzgGt3/XwVqIsvvPK43v8JWA9UxL3GqdZ6gKKbZ5AFWwIZA+5pnoKW8busfgRJFqZUS/entbEOnWEKTT7ue7iALrXDvQ+Qe59hrYfXBmlgAgq2riu3NDsFAc/k795g6LjesYnE5z0h8YCpBWwPJZzkS+8G4Dz9SNnYbl3WHPXJOoYaDDfsrCeqbryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 00:35:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 00:35:28 +0000
Date: Mon, 13 May 2024 17:35:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/perf: move igt_require into subtests
Message-ID: <ZkKxyMdaehP07/YD@orsosgc001>
References: <20240513160638.137890-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240513160638.137890-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: ad514c48-908c-4eb0-a164-08dc73adc10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzlOL2RGdlh3c0dia0pYRFE1V2NrbnlQemJvQU1ZUDZXTWVsVWFGc3JEYnB5?=
 =?utf-8?B?MkNDbmcxaHZwOVBvY0xvc1IwM2xsZC8xMzlhQjQ1by9lTzJMK3c3dFlVaDRH?=
 =?utf-8?B?T1VpUUJsUHZzbFhWZnQ5Zi9mS2U2YzZTUFBFVk5JeVl2cHYxQ3A0eXJmclhD?=
 =?utf-8?B?SXNQSG1wS210LzJMcmhuWTVHMTBMZElSWU1zalJTaWRiSjl0UUh4eHhiUEZK?=
 =?utf-8?B?OEFvUVZQZUdlNVdNMmxaTTNLZlpSM085dVNvYklBZFFqdHZFN1VhOGVNNWx5?=
 =?utf-8?B?TVN2Y0V5MjFTVUZjODJZVHozdGJPUHZwaGk4dG1rREk2dFJOUUJxVmErWmlZ?=
 =?utf-8?B?OEY2Z3ZueGthcWt3MWJnQzk4VXVqT0dJZFh0MXhIZHlSU24xczY1RlJ6SnBV?=
 =?utf-8?B?WTJFQm91QzgvYTZtdUpvcWt5bWRJL3p0cVJ6ZnEwZEFUTXArVTBlN2FxSEd5?=
 =?utf-8?B?U2JFT2k0MjhzYjNYM1g2ZUYwRDhSLytHT2dva0RVcHk0UUlZdGkzVGlsWFhB?=
 =?utf-8?B?V25rZjRNaVZhMUppRm91VjRxRE15Y09RTmFsY0RWSSthdm1qNmovb0VHU1Zm?=
 =?utf-8?B?Nk1yOUpZSEQvNnpvWXUrUzlZQ2ZRTk1nUXJtMVhSQTJqVXFxazh6ZXphdHcz?=
 =?utf-8?B?Y3JhY3R6TWFCMUs3ejcrUFZKcWpTY1Fpd1pHR2tmS1gvWjdnVzRpYlJPS01Z?=
 =?utf-8?B?QndIOE5FSmRsMEdlMUN2K0lhTzMwV2t5NjVBTUFVS2ZHQWJpZEwveUxIczRO?=
 =?utf-8?B?SVhPckFjZE81STFjM2JMSWF5Vmg2TXRCYnBaOWR6TWtYNlhIeG5QelF1MjlL?=
 =?utf-8?B?dUdqRFhNNEJwSDNxVnhPZFdwd25DNW9ERHJWZXhCREVkelVyZ1ZHTXhtQ3pi?=
 =?utf-8?B?c1BVZjVwTnplNHFyWis4VjgxR2dHTDdtTW9VSjJIc0dHMVFuTldpbUV6Yy8z?=
 =?utf-8?B?c1pKaVJSR3NIb21uNGlBUXZCeHFSUnRjdHBrK1BaWnBTM3BnSkVLVE9RMTlN?=
 =?utf-8?B?SnhPK0pvT2Fzdk5SQzVVQWNyR2JiM2E2dlBkUU1jeFhDMzNJY1BRcXdpakpt?=
 =?utf-8?B?TEoxQkhHN3NkSEpnVWxrb1kzVlU0NGs3eEY4NHd2REJjemZMVHZKVURqVnFR?=
 =?utf-8?B?RG8rTm43LytzUURJZEVjamkvTEppbjRRNDIxNUtqbDc5M0RHZEFoVzcvSHdC?=
 =?utf-8?B?bTFHd2xDTndEVXQ4ekJwS3dBQ1k5djFCR3pCNjlkQk93c1FrOU03MTV0LzBl?=
 =?utf-8?B?ck1LVnczYXBITHBGQmI3WDJUa0t2a3lacCswbkJtS25qOXRvTUxuTFlvZ2RP?=
 =?utf-8?B?cVB0WHQxdU5LRGtiazFscldQbDl2NHV0U1cwWlYxNVB1TXlzVkk0Zk9XUENJ?=
 =?utf-8?B?L3lCR3hrUERVa1dCK0crMlhPa1hxOU9OTFFkTzR5UmFOclFCM1l2MVJMYjUv?=
 =?utf-8?B?MzVvL1pBaXdkdXpncythUnBTN29hZlFnQ2RFNkhyR2NQemhsRFF0UDh6K0xa?=
 =?utf-8?B?VVJneDBqL1lJazQ0OStyckY4SjRVbitrK21yQ292aWdRa3V1TDdTa3hKSmZp?=
 =?utf-8?B?VUg4OExNQ29uL1Q4RW42b20rR005QjFabysxeFM4dURJM0VaWTNsbTc0KzhE?=
 =?utf-8?B?SC9TSk5oMWg0NXNqaDE1ckx1b0d2b21WUzZnVCtLRFVvRGtzQ2xoRndYTTE1?=
 =?utf-8?B?M1Rrb3lPSEhremtZNkU2bisrMFJ5dUhQN1pXd2h4TVQ2U1k5M1ZiZnp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2svT2lUakg0UitZbU5KNlpBUjl1Y0dYMEh0K2gvOVpEc21wNy8wS0VsOU9m?=
 =?utf-8?B?RHlSRnFnbU5JVkluSndBdERSV2J5N3BBLzhzTllhUmNDaG0vbVNEeWV1RFY3?=
 =?utf-8?B?QTdEZ0RCbWkyMHRxaWVhREFUdCtxWUpuUFAvSUpjOUhtR2JId0owZ2VPVXVo?=
 =?utf-8?B?T0NpQTdQNm9LVlZ0OVRsOGV1ZVZTaEsvMGFXcHRJak0wZFRnMmo1MUJxYUtz?=
 =?utf-8?B?Z0h3SU5tL3lEY0l3a3JHY1QrNUExbnNuWXA3N0dxZFlsYzFFTm5IMm9kNHRW?=
 =?utf-8?B?dFRjQzhha2ozMURuMGw2R0VBb2wwTzRRVmc5Vmk2MCtyN09IM1FLek5KR0tT?=
 =?utf-8?B?bDlsbnhOTUdjRk1ub3hMQkZEUHoxQ1RTbFBTU0tCcGpUV2U1REUwRFdobFF2?=
 =?utf-8?B?SGJ6VkU2RCt3QWY0WFV4bzErVUNYTVNjVldoMlFnZEdnalUrNjlJbnZCMHZM?=
 =?utf-8?B?NEZ5OFFLMjdSaXhpems0WTg4MjdIM09yZVN1T2M3NnEvcUl4NFUvV1J5NVlO?=
 =?utf-8?B?NG9iNXVBYXUyd2RGaEZjUjNaOGp4dVVNVk5KUlNBUDVvNzY4cHB4UjBwUEFJ?=
 =?utf-8?B?ZlpLdjdVcS9jUEhIcWwxdEZvbW1Tdlk0S3RTMnNKd0hwcEQ0YmovUmVaUVBG?=
 =?utf-8?B?UFFNWGdsQnk5aHEwNkJ1NS9IUlJzeEx5YXZNTmlOcUdVVXYwQlk4K1FYd004?=
 =?utf-8?B?bHNXRW1oV0hHa29sZ3o1ZE1xUDNWekhLMVEyOGNFWUl5bjdod0FVNTdDZ0t4?=
 =?utf-8?B?NHZMeXZ0cHlzTUw2RDlscW93eDVpcnFhaG5uU0JkLzBiOTBnYjQ2cGF3cHdW?=
 =?utf-8?B?RlVwQ3V6eTYrZVdxSldYQ240cGhVMDF2djB2R1gxVithVGNRYnF2Tmg3UE52?=
 =?utf-8?B?NjlmNkJuNnVFSmpWb2Vqelk5TXQ1MC9oa01rT3BBQ1JZK2dVMzZWdU5aaTN6?=
 =?utf-8?B?NWNSMVZIM2k5cGFqTVg3KzZSejR6U0tqMC9QSjRPUjRqblByN2laN0dqZTUy?=
 =?utf-8?B?bWpBa2RaZnY3ODdqMnVCelM2bEE4d1pGeEpRTC91UWhPS2hUaXI5bWhaSzZC?=
 =?utf-8?B?U0ZUMWtvc1Aza3c2elVvek02T3lhNTFQRnlIRHhVNnVOa25sN3g2eENPWUlM?=
 =?utf-8?B?d0lBWUxOL2daQ2Z2YVEwOTZndnJ5a3RuK1lzejAxR292QkFkeXc2Z0VtUkVh?=
 =?utf-8?B?bG1rUUMrS2NFUVdEaVkzMWQrdWR4NEdlV1I4dlpTSk9uckRyaVdTVklGTnIw?=
 =?utf-8?B?ODZHcWFXRHdpUDJScjRjRXlNL1FQVWxaMW1MY2FpUnFZTERUem45SGZEaDUw?=
 =?utf-8?B?Lzlac3NJRSsxbFk4MGN2VDR1MHNUSk1JR1lyMGt1RVk1YldJY2h0WHMyZlBX?=
 =?utf-8?B?ZWh3SGJPUlMwVU1TVFUxY2o5bXAvUFBCTDZHNVcvZGNJK0U0OWNIbk8xcGJ2?=
 =?utf-8?B?eVBTL2RJak0vd2RHQU5MOWdtczVRQS8zVWYyWnlVTlBwYWFOc2JJNGQ4MGxU?=
 =?utf-8?B?Q3JrNkoyd0dSRUR1T0p6eHF2MjlrajQwclhqUFg2TTlCejdvYUh2cjREakQ2?=
 =?utf-8?B?Qlc0UmN1TTVVR0N1cFRseUFyT05kUmczbzJ3NzZlV1ZiNUpnK2lGNEhML3VH?=
 =?utf-8?B?NTJuYisxMTVmdDRTbjRYbStpaXJFNWZycG1aUVhIb1grd3p2K2toM1NzYU5K?=
 =?utf-8?B?MkhOdUlpblFMbVJKTEhVUUIyMTAyUUZTRWVkNXBOWWJLUlJBMUt5OHI1Sk5j?=
 =?utf-8?B?RlFSbkFoaGdxczIvRGFPUVI3RVhjWUZDUFg0NUN2VTYvZTQ3Ny8yQktpRU83?=
 =?utf-8?B?WWxqNWRhczkrUlFNaXp6b1VoN09LRXpsQlcvbys4MHg3QVEwbEllRzVLKzRa?=
 =?utf-8?B?NUxwdTJYT1lMTGYzWkZTSjBVYWxDdTlQQjVTVU9MZTVFTEZ0WUtoRHg2Y3hG?=
 =?utf-8?B?d2hTTFduUzdKbGpiM2JxTXF4d3BPNmtzaXlRNlE5Q2tUU2ZqR0F4Nm94NUh1?=
 =?utf-8?B?cDJ4bGh6MmtvdnRLZ1NnOXp6eTVFVXFoNzdGVUUyWHVzeTVud0lEemN0UGhJ?=
 =?utf-8?B?VU9VR0xFdlRQcC85b1Y3MFRBcVRZYWtJY29aNHFUMEwvOG1uV0llNWVZQmN6?=
 =?utf-8?B?RE9LajJFbWdrNUFFb3dWWkJFem9PdmFLNm5XbGhyZ2pXL0ZNemJWQVFQTzRE?=
 =?utf-8?Q?oO+gZOUnNUSWmwTNrDZLtsg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad514c48-908c-4eb0-a164-08dc73adc10a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 00:35:28.5989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+aDXFQCRPKhC/qqCk4IfGcOnDxreAP3A7mpbBQfMMLFSxYZqH645pZis9pQR4QqCZmuR+ZpmJWgqi0XEKwivYLex2g9yDMtAMQMI3+1wyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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

On Mon, May 13, 2024 at 06:06:38PM +0200, Kamil Konieczny wrote:
>Using igt_require() and igt_skip() in second or later
>igt_fixture can confuse developers reading failure logs. Move all
>such igt_require() to subtest which needs them.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM, thanks for fixing this.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh


>---
> tests/intel/perf.c | 31 +++++++++++++++++++------------
> 1 file changed, 19 insertions(+), 12 deletions(-)
>
>diff --git a/tests/intel/perf.c b/tests/intel/perf.c
>index 7a63a3bdd..8ac48feca 100644
>--- a/tests/intel/perf.c
>+++ b/tests/intel/perf.c
>@@ -6048,22 +6048,24 @@ igt_main
> 	}
>
> 	igt_subtest_group {
>-		igt_fixture igt_require(intel_gen(devid) >= 12);
>-
> 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
> 		igt_subtest_with_dynamic("gen12-mi-rpc") {
>+			igt_require(intel_gen(devid) >= 12);
> 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
> 			__for_each_render_engine(drm_fd, e)
> 				gen12_test_mi_rpc(e);
> 		}
>
> 		igt_describe("Test OA TLB invalidate");
>-		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate")
>+		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate") {
>+			igt_require(intel_gen(devid) >= 12);
> 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
> 				gen12_test_oa_tlb_invalidate(e);
>+		}
>
> 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
> 		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
>+			igt_require(intel_gen(devid) >= 12);
> 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
> 			igt_require_f(render_copy, "no render-copy function\n");
> 			__for_each_render_engine(drm_fd, e)
>@@ -6072,11 +6074,11 @@ igt_main
> 	}
>
> 	igt_subtest_group {
>-		igt_fixture igt_require(i915_perf_revision(drm_fd) >= 6);
>-
> 		igt_describe("Verify invalid class instance");
>-		igt_subtest("gen12-invalid-class-instance")
>+		igt_subtest("gen12-invalid-class-instance") {
>+			igt_require(i915_perf_revision(drm_fd) >= 6);
> 			test_invalid_class_instance();
>+		}
>
> 		/*
> 		 * OAR and OAG use cases can be separately opened only on gen12
>@@ -6095,8 +6097,10 @@ igt_main
> 		}
>
> 		igt_describe("Verify concurrent reads from OA buffers in different groups");
>-		igt_subtest("gen12-group-concurrent-oa-buffer-read")
>+		igt_subtest("gen12-group-concurrent-oa-buffer-read") {
>+			igt_require(i915_perf_revision(drm_fd) >= 6);
> 			test_group_concurrent_oa_buffer_read();
>+		}
> 	}
>
> 	igt_subtest("rc6-disable")
>@@ -6108,20 +6112,23 @@ igt_main
> 			test_stress_open_close(e);
>
> 	igt_subtest_group {
>-		igt_fixture {
>+		igt_describe("Verify invalid SSEU opening parameters");
>+		igt_subtest_with_dynamic("global-sseu-config-invalid") {
> 			igt_require(i915_perf_revision(drm_fd) >= 4);
> 			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
>-		}
>
>-		igt_describe("Verify invalid SSEU opening parameters");
>-		igt_subtest_with_dynamic("global-sseu-config-invalid")
> 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
> 				test_global_sseu_config_invalid(ctx, e);
>+		}
>
> 		igt_describe("Verify specifying SSEU opening parameters");
>-		igt_subtest_with_dynamic("global-sseu-config")
>+		igt_subtest_with_dynamic("global-sseu-config") {
>+			igt_require(i915_perf_revision(drm_fd) >= 4);
>+			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
>+
> 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
> 				test_global_sseu_config(ctx, e);
>+		}
> 	}
>
> 	igt_subtest("invalid-create-userspace-config")
>-- 
>2.42.0
>
