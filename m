Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD17E6C605
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 05:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5794A10E0DC;
	Tue,  3 Dec 2024 05:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="im9MMd6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C595C10E0DC
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 05:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733203682; x=1764739682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J2fyMl6jnY3T21rxgYL8G+OwPgb8mmYXjFzthUWaa6A=;
 b=im9MMd6yTmkLDsE9dy9QSGqm3I2Mc7Dy26Oa/Qzb18prgklcVSn3Rj10
 rP2WrF6m6slT2fgG58pzf8mLp5LjPichl9zCPKA89UFyOH4+Fvry8mmls
 6tva1J28znJRatFqfD48osFIyiaRm9jpmfJvAt3u7BFN69Ns9qTIFAwBR
 sppvKC0v20maHCc71HYESlC0XdnR1xoiOV+VFsKpB+rHssJKUY7UFnGPr
 UH2End735U1nDSvoqzzPP/mDD5pZsXRqDZnpnf/fe+y9oWAQSg1uw+5zo
 +1LXr67oMlxs1tEugZ6P/Esggi46NJdcr43oaLwaeWnqTwoMz1vPc5w8V A==;
X-CSE-ConnectionGUID: 6JFUcY3NS3eOpTkbqLRf5g==
X-CSE-MsgGUID: 6T0w4sfBTcaL4GHCymsNEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58806984"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="58806984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 21:28:01 -0800
X-CSE-ConnectionGUID: AOok1wlJRZyouUW9F3sf2w==
X-CSE-MsgGUID: xtvtXhsbTkmZCTzoqQlSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="98097636"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 21:28:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 21:28:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 21:28:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 21:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGg9RDVlcBizKA5YjYPtM3P9p3kpYCtfEikFNcqEw0ilrY7Zf0um89stdt5U9Da9Y8r3nw/8aWJMRyHTD8QOiUrH54agFrKWHkexGRP7fS+NaE0bxRGBUASqks4kI6R0kOiOHuYcDyR9Ls+VkdK7UvcgODDodxjwGzHlIWJEd10aFM4KAMNBklEBrgXFxqJG9iHgDBXTuSKGLeWUXEyzeBKqLVKKWBHKIPvdd7CgS5vJGqu5qubUqTGOmchAmFQena5B8WpIJtCTw71LyZi92wMq8SNYK1xc4EdiPCMIMRQ/09ieGTFBYetv4QDYP0w3djKBmP1Gh5xJna7DH63R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1DwqTzkqCdxUBo1PeJJRFrxjmw8mOXu50PXWyLcs/I=;
 b=r08GjV5d7Z0x+r2v1zcACcykM8vqoyjI96cNbMg2mhtcQAOOwROoHOaZRsUSNaJRlNZL9XhGmIho7CM57n5KLLChTDQWMvTKmfnA43QsgMtXlRKujtFqVAwFWmq+HeEFseB/8FbeP4DLdDiEcgl3sn9CapHC4dsuiENQgdUs+KGlkIiVcPqR3KgcpkROK9+UB+cErwowkHRwyolcpfxtm896GmvXvjbni69quYOr/HRKGX+nTuPMGGaaY2H5AyIl3smEoF7pLx07YF+pwG8SVBGygaD2zPKGtEBGgpBlh0kGI8+OUorKqXobU3wc6wC7SdJEI1e8jOpUmC2kS0bVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 05:27:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 05:27:57 +0000
Message-ID: <2670fdbf-0fbb-44e8-bae2-7e3021f5d94d@intel.com>
Date: Tue, 3 Dec 2024 10:57:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v8 3/4] tests/kms_sharpness_filter: Add adaptive
 sharpness filter test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20241122185708.1755203-1-swati2.sharma@intel.com>
 <20241122185708.1755203-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241122185708.1755203-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0245.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 58953238-2e25-4bc8-ab4d-08dd135b3e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNyRVh6b05Gb2M4TEhnUVNTczkybURueFZiL2pDYnd3Wkl0K0swaGxxSXR1?=
 =?utf-8?B?a1ovRE5EdnVkODJCc1RlSHVPWllSNGFUVUY0UVVTODd3ZnB0dWd3TFRDZ3No?=
 =?utf-8?B?cXBFeWZ3aDAxcWh5dDhRcXRNM1hKUzAxSFUrVllTSmNqbGNNRVoxc0lEN09P?=
 =?utf-8?B?QjBZUWJSZStCVVhHVk1Ic25HZDBKTjlYWSs4WHV3a2ZQb01UOW15dUlyMFlv?=
 =?utf-8?B?bjA3d2Voc2dJNFh6VUUwd0t3OHhzaHk0NTU2R3pKYXFjL0I2cXl1ekwwS2pl?=
 =?utf-8?B?MHZKalVNN012K2Q1SVk2YUc5OW0vek1TeHZCOVF6anh5clE2cDFobnVQNVov?=
 =?utf-8?B?Nnp1RXZ6cFhLbFBkOGNCaVRNdXBjMXQrMlhSUkJPK050b3BMNkJvcmx4WFlt?=
 =?utf-8?B?cHQxT0dpMTN6TStqMFdHajdUTklxdUZPTlgweUQvSUxkQ05kTjBacEdLbnEr?=
 =?utf-8?B?OGdxQVdmRWNFcFBpOXFhTU1rdlVmU3UxNnR3bWNib3JFcGRIaTQydk4rNkJG?=
 =?utf-8?B?aWNLMG0ySVVjV25zT2UzOWc5Zm9qampHSG1qMzBnVHZwSkRhMmt1QythbWRn?=
 =?utf-8?B?S1ZqTHlVdzd2NERxOWRjNm5FVG1SaXgzZlFSRGh0eHZpajhOaTNCbFNvN1FX?=
 =?utf-8?B?M0k3VGJwcWN4WThTK1V2MndDR1kyeUpqbThhNjhQWFVvd21GK1ZZK1ZxRDJT?=
 =?utf-8?B?eXc2SkxFTmpHOUp5ZVVGcFB4Y29Cb29KTnBMMXgybERPdk1USVo5dStQTXNX?=
 =?utf-8?B?TWZvMXQwQjh3MWFFLzJaNk1ydG9NQXVIUU1nczc1M3lscUFKcTJ2dkFRK3p6?=
 =?utf-8?B?Y0pHcTZmVHRZM3RvL25sV1ljWmhMRXVySEp2aTQwaXluSFk5YmlERVBiSmky?=
 =?utf-8?B?REMzVi9OUTIya3ZOeXBFMU1KOERvTzZaSEI1bEdNNjJmSWorbDNaZDhQaDF3?=
 =?utf-8?B?aVNZQXl3eGhFOFIzUXRwc2pqQ09KSjhsMytLZDgxdVZQMXJtYkx6K1FBMnJM?=
 =?utf-8?B?ajNQMDBJeHdUK0Y5ZzJxdi83ZWpUV3lreGRKS2t3NklMUFl3eE4wbE1aYnVp?=
 =?utf-8?B?UWRGQTI3MEd5SkI0UERSVHBoTWc5Q2R2MWFVS3RqQjRzUlNEVUs1NkYyeEhz?=
 =?utf-8?B?elo4cTMwQ3VHSE9pcHJQYThDV0YwaFEvU1IwTDhKOUdOVWdzTHJ5anVybXJr?=
 =?utf-8?B?azZwM1NOdHNDOUZqdXRFNSt3K1RkK3Zrc3ZFZ1hxVlZvNlByTXVqekw5MTJL?=
 =?utf-8?B?OGwvc3pOaUNaK3hYd2ZFTXE3QVZyWDdSN0J3NXFXL1g3TW56elpvS3ViUUtE?=
 =?utf-8?B?bFFvMzkrOXJ0bjUzUm01d1FoakdqTVRXR0twY0Q3bVRUdHcxd1NQRTJJRUFa?=
 =?utf-8?B?QWNSc25RYlYzdjg3UE1JdGViNGd5dTB2bzJQSjJPdWVFRzJIY3JpUHhkVENk?=
 =?utf-8?B?ZHVNcWlNT2xsMDQ1Q2FMUDUyaTdpR0xHQTRTVzRpdEpFeE1iVGhTRklSYXFl?=
 =?utf-8?B?dkZ4d3Q5VE5VSVBFbGRLb3BxQUZYdGpEZFVUaEZrNFloZUY3U1RwOW5xempQ?=
 =?utf-8?B?djFLOVZ0dndnbVNQbnkxeE9JVmJuY29rUEc2dE1XYTA3RTgrYll4SmNVSDVB?=
 =?utf-8?B?RThla3dSYVcxQ01ZZnRycW9MNndDVTBZdlpFVGR1TUo0dGxBSHBLOXhmVmgx?=
 =?utf-8?B?M3d1MHRwK09nVE5hWUYzc0Z6bVhlUTBKNDRJYlpReTVhYTY1YytBaTRITXVj?=
 =?utf-8?B?cUcyWUttbGcyejZkT3VJMElDbXhXUGJqM2FZVXUyRHNiZEEwZGtveUI2cWpo?=
 =?utf-8?B?SjR3bzNiLzV6UW00eHpiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGcyNGxEamN3eWRJajY5QlpJMk5ZZ29XMzU3MjhkNmoxUFZldFlTeW9wY2Ri?=
 =?utf-8?B?SnAwMTFyT3hTdmhmd2JBNlk1STM2VGQ0WWx1RHRlRk8xeVRYVGpHOEJlOG5G?=
 =?utf-8?B?ejk2b3RDeFk0RDg4VDkzZkM0cFdoTU4yeitTTEMwSFBZbUpLc1c5RTNQNjJ4?=
 =?utf-8?B?TTFFQ3VNQ3kzeGJ6UGVPSm4yUWlTTzJzT0JvMFV4bVJkSXE5RWg3cUlPMXVT?=
 =?utf-8?B?SWV5Z2QyNklOdmxla1FUTmI2akJicld4bnRlSEdmT3lyR1BNVmI5RXliL211?=
 =?utf-8?B?Qk00MnJPSms0NjlmRmVoSzB0b3Rvd0VHamtFWUd5VG5USTE0MFNiaENlMVo0?=
 =?utf-8?B?bDdnamRxUWNZNERGdEQ4UjYveVNxR0F2TE9SWklYTnQ0b1V3WEREOVBqZXM0?=
 =?utf-8?B?eUE5MC9xbkQ4V0pYN1lSRG0wTlFFSVRKODJrYXU5cjlIc2tyMldhNWZLUE9S?=
 =?utf-8?B?SktIZFB6clRxbElKNXd3SGRxVXF4dE5kemJ5Uk83Q0d5MXhkUVFpUmt3UDAv?=
 =?utf-8?B?aW9pd1NwNmc1VGhIS2x1NjdlY0ZtUzkwWGxjRWwzK1BKYmtTVzMwcnJZSmc4?=
 =?utf-8?B?bHBhOGdFdXhUMDczM0xGdFJBWDN1MEtGY1ZFbE1tcXMvc01Jb2tTdGZqNmVC?=
 =?utf-8?B?enEwRlBidWxwVnl6WWFOZ3hxR0E5MVZTMWMreXBRMkFUZnR1T0J0cGFDUlYw?=
 =?utf-8?B?RS9ERnRpWFU0c3JzZkswN1JSZHFHbUtqN0xoS0pkVW1zaENocFpSTDA3SFlS?=
 =?utf-8?B?VEpoRnhjOFZYeVp1Q09OTlprU1BTc3dRUXBGVno3ZUthWlhFMEd5YkI5WXBI?=
 =?utf-8?B?MmQxN3MxbXpnRmJUQ0tTZWhPeUppc1FsWkZHN3U4STEwdTErK2VaQkFIWU1W?=
 =?utf-8?B?TFI0OWhFSEhoakVyZllCQUtCNEc1R1RCK2Z5WnBSVTQ5YkJGQVVHRVdiM2xC?=
 =?utf-8?B?SkhPNEZTYm9BUXlaRU1MMy93SnR2ZHcwQ3ZQWVd3U2xVTlFkZHpCWG4zVXFq?=
 =?utf-8?B?NDQ4Y1RhTVErYUhDdFpud2JaejZLWFF0OXF1Q1hqYWdvSmI1WG4raG4xZTVu?=
 =?utf-8?B?cE5RaXVER0dtaytVbWxmUlFTR2lCUWxSYkgzdmhBeVY2VGJnaEtJNXg1Y29k?=
 =?utf-8?B?cWEyK0k1dTVRYzdxNmtxNnhBQXlWRFpIcE9uWUYrSSsyb2RIQnFzaW1oNGxQ?=
 =?utf-8?B?dTNZQzNoZU9QbDlzQjd2TEZPZUZXYWJsMG12eXlZSEs2aTM0YThhcnJVQlA0?=
 =?utf-8?B?eFd4VHVabmx3dkJrZzRULy9BUHRpVmZmOTRyQUdtaUpSV0dUYzRKM1kxK1F0?=
 =?utf-8?B?M2dlRGROQTdxc2VvK2NBL2lJaUpHbGFjY2taQUxRTWVpUWQ1RnRxemordE15?=
 =?utf-8?B?N2QxaFgzQVFqYjFaREkySGY0VVRtc0dsYzYrbDdIMGpLdVI1UVhJS0tXN2tS?=
 =?utf-8?B?L0hDN2c3bHJ4OVJaRUpNRzRvaThNZXl4cVl0SWg0TWtlKzNkMTFhWDZtT0w4?=
 =?utf-8?B?cjdoOTlzaFJJd0VETE44ZXM2aEVLdW1idHRKamhHZzFwbWFneUtlQ25zbjRY?=
 =?utf-8?B?YzNXZzlsN3AxM3JmT1IyME9KUnlnM0diVE5hSTZGMUxYRk85czlFcVdCS3dm?=
 =?utf-8?B?VmpYZ2VCbDk3ZDMzM0RIU3dROStQM1dJdlZyc1ZZcjNHWTQrcFQrWE9ScWNZ?=
 =?utf-8?B?c0FPOUdkOEdwcnh0ZGlhVWNZRnNyMmJBaG03aEViS1paOTNKdlRHaGFHNUFh?=
 =?utf-8?B?V3lWRjliM3lKNHpTcGRlUjlMUXAxeCtWK3ZsQXk5K1ZodFArMVFGRkw0VUYr?=
 =?utf-8?B?eGRrMzczU1ZNUVBsMnBpcGloTDlRYW81cFM1ZEZUUC9wd2J4T3hieUxDaGJM?=
 =?utf-8?B?bnFJL2NGVlB3RWlZV0tGWGZ3MVFQdmQrZ2tTbmEzTCtGSU0ydCtZU25RUms1?=
 =?utf-8?B?UGFUdGNNeFk0aVNoUE0xdW9zQjI0QzY0Q3NOMTBPUWlUVUxSb0dtaUFGTHZ4?=
 =?utf-8?B?aitNdE4vTFFYK3pLQmJDczJTd0sxeHYyQmo4V2FWVnJTV3RJdnhmNHFNY1N3?=
 =?utf-8?B?SWw5YnNsVUV4T0NZY3R6ZVJLWGNxN2k5OE1Pc1V3MmptT0RnQVF1VkNFazhL?=
 =?utf-8?B?QmVaRW4rYlhTdnNpanpVaDh4YjhXak11YUhBY2g5c1BlTFVlK252ckZxR1o1?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58953238-2e25-4bc8-ab4d-08dd135b3e88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 05:27:57.5590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eBSFrqp6UveAGp5u77wqyfeQo168sYU2YrndmZE3Cjbk5r1jXoUYt6vsyT6XzYNM6m5aY8HXANvTM3gkzFMwLAz+/Rssg3vNArOD8ijd7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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


On 11/23/2024 12:27 AM, Swati Sharma wrote:
> New test is added to validate adaptive sharpness filter on
> LNL platform. Various testcases are added to validate this
> feature. These are non CRC based tests and manual verification
> is required.
>
> Pipe scaler is repurposed to perform a portion of this work.
> This means pipe scaling will be unavailable while the sharpening
> function is being used. The other scaler can be used for plane
> scaler.
>
> 15 subtests are added:
> 	-basic: verify basic functionality
> 	-toggle: switch between enable and disable
> 	-tap: verify different taps selected based on resolution
> 	-modifiers: verify casf with different modifiers
> 	-rotation: verify casf with different rotation
> 	-formats: verify casf with different formats
> 	-dpms: verify casf with dpms
> 	-suspend: verify casf with suspend
> 	-upscale: apply plane scaler and casf together
> 	-downscale: apply plane scaler and casf together
> 	-strength: vary strength and check difference in sharpness
> 	-invalid filter with scaler: enable scaler on 2 planes and attempt
> 				     is made to enable casf
> 	-invalid filter with plane: enable 2 NV12 planes and attempt
> 				    is made to enable casf
> 	-invalid plane with filter: enable 1 NV12 plane and casf and attempt
> 				    is made to enable 2nd NV12 plane
> 	-invalid filter with scaling mode: enable scaling_mode property and attempt
> 					   is made to enable casf
>
> TODO: -Enable casf with varying output formats (YCBCR/RGB)
>
> v2: -Updated modifier type to uint64_t.
>      -Replaced IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
> v3: -Updated setup_fb with height and width.
> v4: -Renamed tests/intel/kms_sharpness_filter.c -> tests/kms_sharpness_filter.c (Ankit)
>      -Added subtest invalid filter with connector. (Ankit)
>      -Updated documentation. (Bhanu)
>      -Used driver_close_driver instead close. (Bhanu)
>      -Added check to avoid debug print for invalid tests and filter strength = 0. (Ankit)
> v5: -Instead of using default strength as MAX, use MID value strength.
>      -Add relevant debug print for test skip.
>      -Fix indentation.
>      -Renamed invalid-filter-with-connector -> invalid-filter-with-scaling-mode
>      -Reworked on invalid-filter-with-scaling-mode(), added provision to
>       validate other scaling modes.
> v6: -Skip test if ret=-EINVAL for downscaling test.
>      -Change if() for tap subtest.
> v8: -Optimize tap-filter subtest (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 739 +++++++++++++++++++++++++++++++++++
>   tests/meson.build            |   1 +
>   2 files changed, 740 insertions(+)
>   create mode 100644 tests/kms_sharpness_filter.c
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> new file mode 100644
> index 000000000..9f261e72f
> --- /dev/null
> +++ b/tests/kms_sharpness_filter.c
> @@ -0,0 +1,739 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter
> + * Driver requirement: xe
> + * Functionality: casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify that following a resolution change, distict taps are selected.
> + *
> + * SUBTEST: filter-strength
> + * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + *
> + * SUBTEST: filter-toggle
> + * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-modifiers
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + * Functionality: casf, tiling
> + *
> + * SUBTEST: filter-rotations
> + * Description: Verify content adaptive sharpness filter with varying rotations.
> + * Functionality: casf, rotation
> + *
> + * SUBTEST: filter-formats
> + * Description: Verify content adaptive sharpness filter with varying formats.
> + * Functionality: casf, pixel-format
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-scaler
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 plane scalers have already been enabled and
> + * 		attempt is made to enable sharpness filter.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-plane
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 NV12 planes have already been enabled and attempt is
> + * 		made to enable the sharpness filter.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-plane-with-filter
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 1 NV12 plane and sharpness filter have already been enabled
> + * 		and attempt is made to enable the second NV12 plane.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-filter-with-scaling-mode
> + * Description: Negative check for content adaptive sharpness filter
> + *              when scaling mode is already enabled and attempt is made to enable
> + *              sharpness filter.
> + * Functionality: casf, scaling
> +*/
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> +
> +/*
> + * Until the CRC support is added test needs to be invoked with
> + * --interactive|--i to manually verify if "sharpened" image
> + * is seen without corruption for each subtest.
> + */
> +
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
> +#define NROUNDS				10
> +#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> +#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> +		||  (type == TEST_FILTER_DOWNSCALE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> +
> +enum test_type {
> +	TEST_FILTER_TAP,
> +	TEST_FILTER_BASIC,
> +	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_MODIFIERS,
> +	TEST_FILTER_ROTATION,
> +	TEST_FILTER_FORMATS,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
> +	TEST_FILTER_STRENGTH,
> +	TEST_INVALID_FILTER_WITH_SCALER,
> +	TEST_INVALID_FILTER_WITH_PLANE,
> +	TEST_INVALID_PLANE_WITH_FILTER,
> +	TEST_INVALID_FILTER_WITH_SCALING_MODE,
> +};
> +
> +const int filter_strength_list[] = {
> +	MIN_FILTER_STRENGTH,
> +	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
> +	MID_FILTER_STRENGTH,
> +	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
> +	MAX_FILTER_STRENGTH,
> +};
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} modifiers[] = {
> +	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> +	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> +	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> +};
> +static const int formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR16161616F,
> +};
> +static const igt_rotation_t rotations[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_180,
> +};
> +static const uint32_t scaling_modes[] = {
> +	DRM_MODE_SCALE_FULLSCREEN,
> +	DRM_MODE_SCALE_CENTER,
> +	DRM_MODE_SCALE_ASPECT,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	bool limited;
> +	enum pipe pipe_id;
> +	struct igt_fb fb[4];
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane[4];
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	int filter_tap;
> +	uint64_t modifier;
> +	const char *modifier_name;
> +	uint32_t format;
> +	igt_rotation_t rotation;
> +	uint32_t scaling_mode;
> +} data_t;
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static bool has_scaling_mode(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
> +}
> +
> +static drmModeModeInfo *get_mode(igt_output_t *output, int tap)

Currently we loop for each filter tap (3 ,5, 7) for each pipe (0,1,2,3) 
for each connected output for each mode, just to find the appropriate mode.

With 4 panels each with say 10 modes, this becomes 3 x 4 x 4 x10 iterations.

I think what we need is a function to get 3 appropriate modes 1 for each 
filter tap for a given output.

That way we need to iterate over the number of modes of a given output 
only once.

Something like:

staticvoidget_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3]){

...

for (int i = 0; i < connector->count_modes; i++) {
                total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;

if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
                        mode[0] = &connector->modes[i];

if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
                    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
                        mode[1] = &connector->modes[i];

if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
                        mode[2] = &connector->modes[i];
        }

...

}

The function can be called in the loop for each output and then we can 
iterate over number of filter taps 3, 5, 7.

> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *mode[3] = { NULL };
> +	int total_pixels = 0;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER && mode[0] == NULL)
> +			mode[0] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
> +		    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER && mode[1] == NULL)
> +			mode[1] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER && mode[2] == NULL)
> +			mode[2] = &connector->modes[i];
> +	}
> +
> +	switch (tap) {
> +	case TAP_3:
> +		return mode[0];
> +	case TAP_5:
> +		return mode[1];
> +	case TAP_7:
> +		return mode[2];
> +	default:
> +		igt_assert(0);
> +	}
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup_fbs(data_t *data)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	cleanup_fbs(data);
> +}
> +
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	int ret;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_output_t *output = data->output;
> +
> +	data->plane[1] = igt_output_get_plane(output, 1);
> +	data->plane[2] = igt_output_get_plane(output, 2);
> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +	}
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 640, 480, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(ret, 0);
> +
> +		mode->hdisplay = 640;
> +		mode->vdisplay = 480;
> +
> +		igt_output_override_mode(data->output, mode);
> +		igt_plane_set_fb(data->plane[2], NULL);
> +		igt_plane_set_fb(data->plane[1], &data->fb[2]);
> +
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_SCALING_MODE, data->scaling_mode);
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum test_type type)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +	int ret;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	if (type == TEST_FILTER_TAP) {
> +		mode = get_mode(output, data->filter_tap);
> +		igt_require(mode != NULL);
> +	        igt_info("Mode %dx%d@%d on output %s\n", mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +			  igt_output_name(output));
> +		igt_output_override_mode(output, mode);
> +	}
> +
> +	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
> +		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	igt_plane_set_fb(data->plane[0], &data->fb[0]);
> +
> +	if (igt_plane_has_rotation(data->plane[0], data->rotation))
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
> +	else
> +		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
> +
> +	if (SET_PLANES)
> +		set_planes(data, type);
> +
> +	/* Set filter strength property */
> +	set_filter_strength_on_pipe(data);
> +
> +	if (!INVALID_TEST && data->filter_strength != 0)
> +		igt_debug("Sharpened image should be observed for filter strength > 0\n");
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	else
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		data->plane[3] = igt_output_get_plane(data->output, 3);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
> +		igt_plane_set_fb(data->plane[3], &data->fb[3]);
> +
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE)
> +		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			      "Scaling op not supported, cdclk limits might be exceeded.\n");
> +
> +	if (INVALID_TEST)
> +		igt_assert_eq(ret, -EINVAL);
> +	else
> +		igt_assert_eq(ret, 0);
> +
> +	cleanup(data);
> +}
> +
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data, enum test_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	char name[40];
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {

Instead of this perhaps we should use for_each_connected_output() then 
for each pipe

So if we have DP-1, DP-2, DP-3 we will run DP-1 for pipe 0 to3, for 
filter tap 3,5,7 then DP-2 and so on...

With this we just need to iterate over modes of each output once.


> +		igt_display_reset(display);
> +
> +		data->output = output;
> +		data->pipe_id = pipe;
> +		data->pipe = &display->pipes[data->pipe_id];
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!has_sharpness_filter(data->pipe)) {
> +			igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
> +			kmstest_pipe_name(pipe));
> +			continue;
> +		}
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +
> +		switch (type) {
> +		case TEST_FILTER_BASIC:
> +			snprintf(name, sizeof(name), "-basic");
> +			break;
> +		case TEST_FILTER_TAP:
> +			snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +			break;
> +		case TEST_FILTER_TOGGLE:
> +			snprintf(name, sizeof(name), "-toggle");
> +			break;
> +		case TEST_FILTER_MODIFIERS:
> +			snprintf(name, sizeof(name), "-%s", data->modifier_name);
> +			break;
> +		case TEST_FILTER_ROTATION:
> +			snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> +			break;
> +		case TEST_FILTER_FORMATS:
> +			snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> +			break;
> +		case TEST_FILTER_DPMS:
> +			snprintf(name, sizeof(name), "-dpms");
> +			break;
> +		case TEST_FILTER_SUSPEND:
> +			snprintf(name, sizeof(name), "-suspend");
> +			break;
> +		case TEST_FILTER_UPSCALE:
> +			snprintf(name, sizeof(name), "-upscale");
> +			break;
> +		case TEST_FILTER_DOWNSCALE:
> +			snprintf(name, sizeof(name), "-downscale");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALER:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_PLANE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> +			break;
> +		case TEST_INVALID_PLANE_WITH_FILTER:
> +			snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> +			break;
> +		case TEST_FILTER_STRENGTH:
> +			snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +
> +		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
> +			test_sharpness_filter(data, type);
> +
> +		if (data->limited)
> +			break;
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'l':
> +		data->limited = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +
> +data_t data = {};
> +
> +igt_main_args("l", NULL, help_str, opt_handler, &data)
> +{
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;

Alignment seems to be off here, also in below dynamic subtests.

Also IMHO this patch can be broken into smaller patches, perhaps one for 
the skeleton with basic tests.

Then one to add invalid tests, filter tap tests etc. that introduce 
separate functions/macros etc.

Regards,

Ankit



> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> +		}
> +
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");
> +	igt_subtest_with_dynamic("filter-tap") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_tap_list); k++) {
> +			data.filter_tap = filter_tap_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +		}
> +	}
> +
> +	igt_describe("Verify that varying strength(0-255), affects "
> +		     "the degree of sharpeness applied.");
> +	igt_subtest_with_dynamic("filter-strength") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
> +			data.filter_strength = filter_strength_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> +		}
> +	}
> +
> +	igt_describe("Verify toggling between enabling and disabling "
> +		     "content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-toggle") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < NROUNDS; k++) {
> +			data.filter_strength = DISABLE_FILTER;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying modifiers.");
> +	igt_subtest_with_dynamic("filter-modifiers") {
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
> +			data.modifier = modifiers[k].modifier;
> +			data.modifier_name = modifiers[k].name;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying rotations.");
> +	igt_subtest_with_dynamic("filter-rotations") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
> +			data.rotation = rotations[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying formats.");
> +	igt_subtest_with_dynamic("filter-formats") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
> +			data.format = formats[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 plane scalers have already been enabled and "
> +		     "attempt is made to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 NV12 planes have already been enabled and attempt is "
> +		     "made to enable the sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 1 NV12 plane and sharpness filter have already been enabled "
> +		     "and attempt is made to enable the second NV12 plane.");
> +	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when scaling mode is already enabled and attempt is made "
> +		     "to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
> +			data.scaling_mode = scaling_modes[k];
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..84d8bed4b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -58,6 +58,7 @@ test_progs = [
>   	'kms_sequence',
>   	'kms_setmode',
>   	'kms_sysfs_edid_timing',
> +	'kms_sharpness_filter',
>   	'kms_tiled_display',
>   	'kms_tv_load_detect',
>   	'kms_universal_plane',
