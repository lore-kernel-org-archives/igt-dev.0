Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6ABC87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 06:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEF610E5E1;
	Tue,  5 Aug 2025 06:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQnSiY+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5210810E5E1
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754375077; x=1785911077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8XjEUh7OzqxQ8lN0K0b8/e63aGlsWhmqUGnsFwWOW88=;
 b=mQnSiY+rwo13+8thXzdI0Op+YnU26SA8VzSmhKK2TZK+CYRo6Fno4//F
 F5mWbmTYqPqpjmbbrs31b6MqTUXw5i1mMeS0hfMb3jjyQwPoeJjVMDUWh
 owyLA3THA9/Drjemwsd43LvlWA6pg/U9KKlbDcQ74cXQ4boO4MoZJpJI/
 Pj0JZb8feuWuYSlOdr9NIiDftEW+3lCDA7JOSNY632xO64nsz3smebo0V
 QcsVdrZU7kWXAWRahPGP8qKaTvpHgfkN05c3e138EESuQb0PqXSuxID2J
 xQGIZPGfevjC/oxmvogdGbuqXK9iSmZepkgu2DlbyfR7kzxNdpYUnRUnQ Q==;
X-CSE-ConnectionGUID: okhw9EQ6SUCxqqwLPeAwaA==
X-CSE-MsgGUID: RFTa3xAVT2S9rWfXKvIdAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="79210533"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="79210533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:24:37 -0700
X-CSE-ConnectionGUID: 99v6WRo7TtCztqCG2L5sjg==
X-CSE-MsgGUID: 5VM/LoQkS7ajKTPyYh1SXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168554284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:24:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:24:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 23:24:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUssnymb9mNigJinMcoRQR668aE9VW1Ma0s3F8JVPOG/953t3Lvn4H2+/zfWyPRb+1qEcgT3S4puE/bopmhVzzEkMoV70kuS7ZPiTptOT0S1xbDmqrtKf8q70EK11by+ewEcxC6f5gYL356/Hvz4lzulNGE7OppLe7HBo9L0m5JS+bz2d9N5Rwvi2YGKPdc5o9xyYNzHq1MjNCsTe8L+tYInr1/rjqo9Fh5Nes+KxtOlOgGRXG+6B5cPiNa5wfnELsYHxspy+tj9Zqsmfs1Fl1OYv6yPejYjCK/YmCa9aYL29rg57SqXth5rF4xBeJSOAjTCBBuxdnAoebQmA3YiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zhHVki/GZjQ6hW8L0hDWxuepSPPT61dslXi094hHdY=;
 b=CWKAHCjiWksbtGl5Vcgn4tMA5GsxA7qoK2PxMevFrmWGzeEifKNzb1lCVPgXWkisdbM4X4s7IbXUWM4b2WOO6jjF02pQfMWYG+gGcq8x3kvz9RqBS4nhfputPjz9WLgMMOup7nF3Kc4r3Lg9FCsgvwjSIh6EQNo+BdxDW7HV+WJj6EFT70WpLDpy6tRKdZuna3T+lPWbMYxG40bPVJ/HMhH0lb4yF9IksGU/VHEhQeNy8yECWVBh8k6zD4H5jBhwa69WGflBiyFjo4zmOpwvUqjCdIf54+2hqeTxxaUWfUvj1CnR9wJ58YWVScIOaMDTbNbmILnEyzhGJNZGkxCyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 06:23:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 06:23:50 +0000
Message-ID: <e34d6906-f04d-45b4-868c-833936ce22b7@intel.com>
Date: Tue, 5 Aug 2025 11:53:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_pm: Skip LPM policy control on unsupported
 SATA hosts
To: Damien Le Moal <dlemoal@kernel.org>, <igt-dev@lists.freedesktop.org>
CC: <imre.deak@intel.com>, <anshuman.gupta@intel.com>
References: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
 <d696461e-bf6d-4f68-a826-02e3c362518e@kernel.org>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <d696461e-bf6d-4f68-a826-02e3c362518e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: f86b0c9b-3365-4cec-d120-08ddd3e8a476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NExzVmhYRURIaCt6d0paQVp5cVpqMVRtWmlBSmEwK2ZtZEZxMUJQMWNHT0dy?=
 =?utf-8?B?aEo0Y0g0MHVydEFEWGRVV0dtN2tXdFpqQVdUZVB4WnhWREhzRmhtaXJIMmd1?=
 =?utf-8?B?V0oxdHNYMllIVzdsd3lrc04zNFRDd01EdW83NVRvck1ueFBiT2lneUVMdC9p?=
 =?utf-8?B?QlpkQ3NGZzZQUHhRVFRSeTFtdHRxQ0IybWVNR3prYnBMRXhSbG5JckpST21p?=
 =?utf-8?B?N3V4MnJiM1A1SnhrL3VlOUFWVE9yNFY5RnJhU2VOajZGMWVVbEFhakVPcmRI?=
 =?utf-8?B?MktHeFQ3K0tOWnRILzhEWEtsU0wvZnNXWlpabjJZZTBaUHZoV2poUi9uYzJB?=
 =?utf-8?B?T3p3Y1R5cDRNSCtWWDk5SXFBR09LTkNmaUZOWGtIbXM4eDNORHgxZU80Nk5M?=
 =?utf-8?B?TUE5ZlBBYmx1cS9GVzR4ajZ6YVNKRDNTRDFvbjNWK2FJODl6elhRdGluMzVk?=
 =?utf-8?B?N0U4bDJocWFpS3lKUndEbDdoRDNLa2tqM2ZkbkJwbFVEMXhxQ05YTTFnZG5Z?=
 =?utf-8?B?ZkhpYzlZd3pKMjJpY0doYWdCVUlLVXZWejY3YXNTb29HdkRyZGZsUXBBUjIx?=
 =?utf-8?B?RnhNNHFNYkNnaE9QV1FaMHdHM1RlOWZOSXlGOXlsZ05kOUhBb0VXV1hkZHZS?=
 =?utf-8?B?SnhOK1hzTHhrZTh2dER1QmhBU1p4Z254Zko1L1BYOE5TWjNUeU02dXk2akx3?=
 =?utf-8?B?NUNJeUlwazZ5bDBtQnpWdlByeHRIK1JPSUtWNzhqaFZsZWRhSUhwbjFNTjQx?=
 =?utf-8?B?WXFTZFdOS1dKdEIwWVZTZ29PZWFxMXJJdWU2SmtJSmZteUlBdUZCOHNkZUdV?=
 =?utf-8?B?Yk9zREtMOERkWnlqbmNZZXRLdkl1ajhUY1I2OSttamE0T2N1TUpBd0FjSGcz?=
 =?utf-8?B?NXY5RW1hcWFoY0NrQ2ZVSFFRRm8xZGg3MlMvOFBEVkVxOGVTckIvT3FUdzR6?=
 =?utf-8?B?NHArMG1WWDFIbHBHN2tBWGhQNFdLZFA4UTlMaEJnQnkxZWpKQU9zK3EzODZ5?=
 =?utf-8?B?S2ZjMFNnc0VYdGJnNWpVTkxQeUFxbGdrYTlQdjVJYllESzAxcnJjMnFGb3Aw?=
 =?utf-8?B?ZG9td0FRWlNzdkNTVGhHQ2lSblpXNTVsRjVtRGhWQ3VFVXJSVnUzcTRrVEFS?=
 =?utf-8?B?d2ZvVTlnM1FUMG9kY1JrN0pCblQ4R2VuMWUxVHRGN3RLOVdROCtXU1VNUThU?=
 =?utf-8?B?VkFnL2Q4L01rQlduVTUrUU4yMW4xdkNLTkh1eEh4cENFTkhzL1ZSTmhXS2Z4?=
 =?utf-8?B?NXk5RU5NVzM3YWRMZE5DZjE0bmFDRC9WL2V5dG9pdHZtWSt5Q1VwRE1OaUtE?=
 =?utf-8?B?NlJMSUdYcmF5b2o0RXFFbFdIUXRUT21zK212eVg3UHluVzVReHlCMXpXNWN2?=
 =?utf-8?B?dE01b3dTeXYwdWFaMjVnQTZyM2tpaE9Db1VxMkhMU1JydzBlTVl6Zml2RDI0?=
 =?utf-8?B?TURLaUVMa0cvZHhDQTV6THJzblI2dndUWHZBMnJmdkVGRXJkRXFrbG9scHZY?=
 =?utf-8?B?clhrNzQ2ejhFalcyMTN0L2JDM1ZSQXZScHZHZU9mNEZLcmpSUWVSY0g1Mkta?=
 =?utf-8?B?RDNjSi9ZZHV3engzOWtmVVA5WmUyWDRNdWN6a0dDc1o3Q2NDcEdIbElPNWov?=
 =?utf-8?B?bTVDTFZKaDdBWlQ4VFY4bTNtVGkzYXRLc1I0a2FocGtmUVpHUkFBb2I3WHUx?=
 =?utf-8?B?bk43Qjd0eE9lVU1vT3FWK0RWSlRUc3Ivb2ZRVE9GMFRraE1iaGhmRGUvMk54?=
 =?utf-8?B?L1lReFd4L3VzZzRBL1FmVnE2dHFwd2JOeWI2bjlzcmJEMWxGNThtNFQ0d094?=
 =?utf-8?B?cjgvN0EyK3VkSlZKRU1oMkVLczh3ZmovVHg3TlhhVzEvQkNjT3VscGpmVjJ5?=
 =?utf-8?B?cE4vL0U3RXlxMUYxcHY5ZEY5QzF6MktYRGJlRFZvRkhSMjZBQmtjbjB6YVRs?=
 =?utf-8?Q?n4NHtWLOd2dI0UFEvZfGWFqm1YPoXoxb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpIV2lGYUxWYllMWUYyTzNaWU5KQUs5M05kV3VmU3YwUXpROTQ1ZExGV1ZI?=
 =?utf-8?B?S2xMa2Z2VGZMOG1ocm43OVRlcHBNZEowN1dBbVg3WkNSM0xubkcxME1YczJs?=
 =?utf-8?B?UnlFR0ViOW93V1dZUDJENU05VmpyYjdNMDduRm9pMlZoZGQ5TVk1aGRTTkhU?=
 =?utf-8?B?UjJpc2ZHZUk5VktrY1dYdUdqUXN6R1kxZTllUnJGV3FCNmY1cXJCYTNYK0pP?=
 =?utf-8?B?K05jN3JXWFA2OVM5MkZpWVFjMHhxeUJPZndWNVBtMWRuSUR6aHIwVFNqZDNF?=
 =?utf-8?B?dEhBSVhGY04rckprZkI0RXVKVjg4aW9hdE13a1Yza0RubzJ3S0RIT3ZPVXQy?=
 =?utf-8?B?cFROU1FidjJwWUovUEhya0x1WHJQejZkTlI5ZTVKSHoxOEZSSmlmTnFWRVYy?=
 =?utf-8?B?cHNHVXprR1JuTWJuTjc0Q0VodENwVVRBcVoyeVJnaFZqOGFaSXlWNTc2L0la?=
 =?utf-8?B?ejNCVm5sblVJNUxMTGJaQlBsUWp3RVpPNG9yNmY5NTU5RWtiSEFGSW54c0pp?=
 =?utf-8?B?ejBMZ09aVjYydHhDM2xJUDlaYVAxZjVsUGdvQVNGSHB3R2gyTk1ESll0bWIr?=
 =?utf-8?B?a3VUMTQ2enM1RVF0eUM4QUNWTGRHOHRha1pQZnRaeFRhb2lhQk43bytaRCtG?=
 =?utf-8?B?aXhFY3h2amMwZmhZclBGY2ZTVUhUWlN1cnlzN1hXWUZkMEdra0JWTXIwajcw?=
 =?utf-8?B?dThaTzNZeUxVREx1d2RqRWgwQWY2TE51dW14S1RuVzhPTHF3L0V0TWFiY1RP?=
 =?utf-8?B?T25GM0tDMkxpbS9CZHorQTQzVjRjREZXbTRlYzIrSFJzY3ZxN1R4RXBONDFj?=
 =?utf-8?B?UENiQWZCbzkzemtobTFxdlRWdmVVM0owb2hUMXFSWFdnY0xDM3NBb1JmUmZ0?=
 =?utf-8?B?VzhGSEx2V0RCdlF0Z0xScyszaEo1SDFYN01Bd3VzQlFUS3VGV1dLV2ZDYjgr?=
 =?utf-8?B?bEhLRzBOQWJoUkxMZTZYelBiRlJKcTlZNHNGTHhNWW42MHVDRUZjZmFJbkR0?=
 =?utf-8?B?cS9BRVRZMGJMYitzak5VZUVadDFOOVJqMkxBa3FpM2xGRWdNalRlSEx0OGN5?=
 =?utf-8?B?MkFHMjZDdTdiWGJNVnZ0eGdZeDk3S0tYdFFuRnVNcEQyNW1PTm5FM3lDZW5O?=
 =?utf-8?B?QnF4cU1xZkIxR3VXV1BEemtwTlBURkJMNDYyRzB5L01oalQ0WGJjMnlKcGpU?=
 =?utf-8?B?d2JPMnc2bkY2ckZWWlVTMzdFZjFFUzViUE00TU9JU1lER0V5K0orMmJFYjRl?=
 =?utf-8?B?NURHcEVoZFpwVURJN3c4Y0paM1JkZGFUa1dkTGdVUFlhSko3ZWRQWEZUM0lh?=
 =?utf-8?B?eTNwRFY2SDMwYW9rTWovRDJDR3NFZjVPN0pWblMzMldjVjNuNnRGVCtuK290?=
 =?utf-8?B?TkhJRVU1M3JxV01FZmVDMTZxL0Y3d1p3QTBvMGpzVTZSMkFuUnFyNkp1bjlS?=
 =?utf-8?B?S3UvRUVtYjRyZTR1UFVmbjQrZHUvVyt4SDBpSURwazJPampOcFpsQUE4SFVL?=
 =?utf-8?B?Rk9SL2EyWlFXU2NZZ3hqdHJzM0NvaEt2cVhsYWNKRWR0UGxQcUNXTVRrMzdY?=
 =?utf-8?B?T3VPQVhmN3ZIMGdYRXZsd1hodm4rRzFEbE5UVDVBNzNLNjZQRFRUQXd3Q2d2?=
 =?utf-8?B?ekxrN2J2NnA1ZnZpTThDYXRNNmRmb3lKTENJSHozZ1FBWXEybEJkTmxpOVZq?=
 =?utf-8?B?UmpydjlYbytSSzZ4aDlTOEh0emZYdGRsSkJZM0Y5VlVENUFVMzBXUjBocVhv?=
 =?utf-8?B?cjcyeUNZbENramppS1E2WU9US29uK3FMZldIR2traVhBNWthaVVGdFd3bXJt?=
 =?utf-8?B?bnRkU3d2azhLV2hUK1ZocFZoby9reWY0bVF4U3NDT2N4Rm9Cc0ZvY054RlNQ?=
 =?utf-8?B?TlI1S0ZhUlp0eTdBUnF1Z2V4bW1xdnpUK3JlQVR6cndwZm93SWxzVFN5Nzlh?=
 =?utf-8?B?emgxM0RTc1lDaTlZaTlBVnFqWWplalF4OG9rdEhuZkxEVDNweGgzbDdtQ01F?=
 =?utf-8?B?MHhLT1FsN2NPTDQwQ0RKdS9JOWcvSFRlbzlVODdoN3pUWnJoNlZGT1dUNitD?=
 =?utf-8?B?N2NtNzI4Z3lZWVFON2hOR2JhdTgyT3hrbFQwcjREOW1OUGtESHBVQ0xMV29J?=
 =?utf-8?B?TDA0MDFMa1dxdTZEcGx5aE56UzhicFlRbmc2a3dIb3MwRFhiaEdWbkx6YklH?=
 =?utf-8?Q?8LiDl/Ya3SkWHDqx0EA8kJs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f86b0c9b-3365-4cec-d120-08ddd3e8a476
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:23:50.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jItzHqEEQ9qlxSjlcBDpr2B7eJJs5SeVq3LU6sfEt1kuiLHlI8JuMFMcl1RYatkuubuak/7JaE7GfmSC6R9m5Ojkgt10oGUB4aICIUUxrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
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



On 7/31/2025 1:34 PM, Damien Le Moal wrote:
> On 7/31/25 4:41 PM, Chaitanya Kumar Borah wrote:
>> With [1], LPM policy control is now disabled for external SATA ports.
>> This led to a regression in our CI runs [2]. Discussions on the regression
>> resulted in patch [3] which introduces a new sysfs entry, querying
>> which we can determine if LPM policy control is allowed on a host or not.
>>
>> Store/Re-store LPM policy only when it is allowed. If the sysfs entry is
>> not present assume LPM policy control is allowed. This  maintains backward
>> compatibility.
> 
> Note: allowed, yes, but that does not mean it will actually work or do
> anything, since the port or the device may not be supporting LPN at all.
> 
>>
>> [1] https://lore.kernel.org/linux-ide/20250701125321.69496-8-dlemoal@kernel.org/
>> [2] https://lore.kernel.org/linux-ide/07563042-6576-41cd-9a95-de83cfc95de1@intel.com/
>> [3] https://lore.kernel.org/linux-ide/20250730001947.332661-1-dlemoal@kernel.org/
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Patch looks OK to me (nit below though).
> 
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> 
> 
>> ---
>>   lib/igt_pm.c | 35 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
>> index cf1c442f8..1ffcdcef3 100644
>> --- a/lib/igt_pm.c
>> +++ b/lib/igt_pm.c
>> @@ -321,6 +321,35 @@ void igt_pm_enable_audio_runtime_pm(void)
>>   		igt_debug("Failed to enable audio runtime PM! (%d)\n", -err);
>>   }
>>   
>> +static bool lpm_supported_by_sata_host(int host_num)
>> +{
>> +	int fd;
>> +	ssize_t len;
>> +	char buf[2];
>> +	char file_name[PATH_MAX];
>> +
>> +	snprintf(file_name, PATH_MAX,
>> +		 "/sys/class/scsi_host/host%d/link_power_management_supported",
>> +		 host_num);
>> +
>> +	fd = open(file_name, O_RDONLY);
>> +
>> +	/* assume LPM is supported if sysfs entry is absent. This preserves default behaviour */
>> +	if (fd < 0)
>> +		return true;
>> +
>> +	len = read(fd, buf, 1);
>> +
>> +	close(fd);
> 
> Nit: this would all be a lot simpler using scanf:
> 	
> 	snprintf(file_name, PATH_MAX,
> 		 "/sys/class/scsi_host/host%d/link_power_management_supported",
> 		 host_num);
> 
> 	/*
> 	 * If sysfs entry is absent, assume that LPM is supported to
> 	 * preserve the default behaviour.
> 	 */
> 	if (scanf(file_name, "%d", &supported) != 1)
> 		return true;
> 
> 	return supported;
> 


Thank you for the review Damien! This seems like a good idea. However, I 
am considering if I should keep using the POSIX calls to keep it 
consistent with the rest of the file.

I also wonder if the original approach was chosen intentionally to avoid 
stale data from sysfs — though in this specific case, it may not make 
much of a difference.

Regards

Chaitanya


>> +
>> +	if (len <= 0)
>> +		return true;
>> +
>> +	buf[len] = '\0';
>> +
>> +	return buf[0] == '1';
>> +}
>> +
>>   static void __igt_pm_enable_sata_link_power_management(void)
>>   {
>>   	int fd, i;
>> @@ -372,6 +401,9 @@ static void __igt_pm_enable_sata_link_power_management(void)
>>   	igt_install_exit_handler(__igt_pm_sata_link_pm_exit_handler);
>>   
>>   	for (i = 0; i < __scsi_host_cnt; i++) {
>> +		if (!lpm_supported_by_sata_host(i))
>> +			continue;
>> +
>>   		snprintf(file_name, PATH_MAX,
>>   			 "/sys/class/scsi_host/host%d/link_power_management_policy",
>>   			 i);
>> @@ -412,6 +444,9 @@ static void __igt_pm_restore_sata_link_power_management(void)
>>   	for (i = 0; i < __scsi_host_cnt; i++) {
>>   		int8_t policy;
>>   
>> +		if (!lpm_supported_by_sata_host(i))
>> +			continue;
>> +
>>   		if (__sata_pm_policies[i] == POLICY_UNKNOWN)
>>   			continue;
>>   		else
> 
> 

