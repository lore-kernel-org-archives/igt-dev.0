Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC11C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B7C10E00A;
	Wed, 29 Jul 2026 11:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/Nf0ve8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8400F10E64E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323284; x=1816859284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ll58QvNmGFUopSG3P/dUWzIuIuS6WhiP+g7QdmNcxgQ=;
 b=i/Nf0ve8NLtSlnEKi5ZIlxVz5XJJU9FnGptv0C3C9Kz7QRPynSBkrhFY
 p+v1bJOwsHUMTLxgcVCb2Rv3kaEwzijJpLF8dSo26YtyRLy87I33CgeWv
 2ughNPU8w7VkmijOIsEs6yxj+dNyTDJ/GmEGM0ARptuUGHmzQ6usG1aO+
 +xJnROj9InFZTv6CTxarWxy3+hz1Gf+YWuRSarKNnPci3yyqx3RhhdhdV
 PPB4zyvU4+lE4IhjW8opqdWZFmRg6IGKJc4ej3HCxLbd1jTWTI8zVq6xP
 rePas9WzggTYQ6PkqhTY6QP9YI6GE8CvXyGTz2ZnVkpmfNMhnL5zfIe0J A==;
X-CSE-ConnectionGUID: xONc266UT/egXbzYjJwwkA==
X-CSE-MsgGUID: 0Wtd4ZCTQr28mM1T5hGy4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89813152"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89813152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:08:04 -0700
X-CSE-ConnectionGUID: QegYlB5VRBaB1L3Re/H5CQ==
X-CSE-MsgGUID: Iy3m9ovlQnqzPcFUqXCB3Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:08:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:08:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:08:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVM2LF9ZRBy6oKjx9cAVXCO+oq62gV3EN2T2SlNuP03rIRU/8qe4JBLBvLemtNRZmH+WYEhXUWoEwgh18NyZKinkMbItBeiztqclsUTQJiSSUmDlTj3DoBWseqr23am9ImzmNFjfmR1F/toOPoOMSFvRn3SP0GCB9uzxEqgZUww/6+F0BichBIZTwuV5Uj1wFpxApqSZDOsJvUiEHHzJQfIPsm6Vdmoshv2yatvksCWeq0FZ6eLKiP0Ym0PRV+iz1v1vxHiYtDuudu7B/JaMyDOIYjW0CPzX/NCZxLDMh42U22QstamYudiC/0HP2MQ+q1Xoi8/zlqFjUq8o2hShvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDj5fRqh1iUmZ1PSfX4AQoCMnRdoWcpmn7Hq0r/vZlA=;
 b=xE5WshzuzdmAAbrkpQUIiHeBdXZdifpZSxMfvuQ9LDrlCV6sH58zLH5tGNNZqaUkZ4Fy1SGh6H/Eu9sd45Cjp5fETWXOOsDBYWDZCz2SSFzZRV3CpndQ1UQN2uWo07Rz8LpfDmz4pgvmyM3o0OVpL0O7/zMdaOSgXAaJcE0nyPgBtnKi+HYxqQ0Z8puCEXBlncrMonY4aoajcqzslGJK25n29+oXzzDycUgPKBOlQP575Dz1uypbmKirlhiPDuLQaXM0BKs8CGXWSi8SczT22O6mtaF7mXAAjRHfqRscVSex/l1yntSw7xrZsAnnds13y4saeuNkLmQvShl2aeG6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 11:07:54 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 11:07:53 +0000
Message-ID: <0e5ba4be-988b-4769-b849-d1ba8c28e3d5@intel.com>
Date: Wed, 29 Jul 2026 16:37:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Block non-Intel pvr* Imagination tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>
References: <20260729110031.80284-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260729110031.80284-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3e8451-2d05-47e4-ff99-08deed61a2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|42112799006|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CEAymAlbAAWPAj+uYZgwhXjn4z3aOaj0MNkS/i6TbzV4gQet+xluCJF8B4JjnpXRqCqVnUl0XpOscPhY55JPwzIGjqAJSLJ+lkjldv7Xr0ERDrp1MKAfAqVh+PRePhFD71r0tq87A3WxTApe7lSxXGYTpPCTDkhKOcA2qjrx2/Sbd0UD/x6wwMUftwfMc1BhNxVY2EvDo6DAP4K08h6Ls3BuubTftZ8q3ZRAxQQQ1jTwvMD0u9ShDpmQm7BrkAu0bxnOli1xY8k664OhZjIqObD/0bsvbaOjNlWPv4KAeqGnoaD9aqlGv73DT7UGrSlpNTDCRfUvu8U2PjxSjTDEsFaN/8Szdn/qEElUHUIvI6nb1o22FFRZNf2L8SWst+RdtEgFUoiQSVrgU6kYe/L0cB2XVKgGPRd5K8WyMaeQgqEbgbglTK3n1DstsDr/iKrTxhYCeKgP2o943OeCXRZzVSkIQa0+/niejI/zhjx0jMtDgdgbckPLx3R2Ib4v6fddYwywKfzNMBIyuA3we08RJxbTpe47asZASMZwI1pXiRIzcO2gIKHWQvdnxDic37izlD08FRb46b7M5gjRHwaC3LaM9mF8yrqZv4KN3G9RJ3vvIRUFABap1TwjVtXtyKjHLyvqWFXsP8Q9HOvFHRBBiCVJhlaWwSuImmjneCVaTGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(42112799006)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2N1Tlo3TG41dVRvcFplczc0aTB6dDAya1V4UjNTSFFWUDVUTllOMjErSmJF?=
 =?utf-8?B?Rm9uNURPY1RsSXplcjVDKzd1NzlIakFvOFRhc29QUjlwbjNCY3dBaW5BQUlJ?=
 =?utf-8?B?bFd0cS9hcTliMG5kVFgxMkhTZk1RdkRta3h0U1JGQThCMUZmT2NhenhydVAy?=
 =?utf-8?B?N0NJVEtFNGRBUzFPRk9NMzRzTWxIVHBsNHZiTy9YOWVxdHloTGg0L2x3ckwx?=
 =?utf-8?B?M2V3Tk9kUzhVMkptRFlpYmYxWnh4SUl1dXhxT1Vtd1RYZmVDMVE1aStEeFRy?=
 =?utf-8?B?MHA0NEpNYWNhNlVqWVBJZ1cycmU3YlVORUcyeE1HMGdOR21FTDY2YzRZT05Y?=
 =?utf-8?B?ek1NK0QrSXkvakhxZXdZM0NNYVBwTmpUdkg2dDhpbEdpUE5LeHhjd0ZuYnpm?=
 =?utf-8?B?dW5iSDhyeDd0TzdMbWplNDExa2VHQ29COFlXZG5EeE9vQy80V1ZGbEkwL2dC?=
 =?utf-8?B?NFNrNi9Lc2s4RVg5Z0RrT0g3RFE2M01KMndrSUhqcE4xNWFkejZmZjJmWlYz?=
 =?utf-8?B?NnF3d0V6RlV4STRDbHBOMGR4Nkc2NlNuVFlvSXg2SUhLcXRRcFpPd3NKYkxk?=
 =?utf-8?B?K2xydEFBNHk2ZXhFaCszZEdUeFZGWGtxTm56eHZGc2VyaEdxbGcrbXF5NmJx?=
 =?utf-8?B?MFdZL0RhUHhhWTAzMUNGNDdpcEZudFNUbVRJU25TS256Sm9EQzM2UjkyRWVC?=
 =?utf-8?B?QmdKUVZHeHpiakcxeENmK20yQ0U3RkpDaWJqUEdmTU85OXA5Mmg4WWNpK1h2?=
 =?utf-8?B?ZHQwdlRuVEg4bHBsMWh0cFNJSFcyZWYzYTlJa2VXWUhzdGMyUVg2alhmVGps?=
 =?utf-8?B?N0NoRFNacWI1Zm8rU2ZoLzBJbnFDSC84Zk5OQndmeEJCL01DMHBnc29obE8v?=
 =?utf-8?B?SzljellTdGNDUlBTbGpqU2hsY2RCQXVrVHY0L3Zxcm5nMXpZejByUmxra29s?=
 =?utf-8?B?QkVIbStzbDNLSElvTkg2MDlFQ0h2Sm1zREpOL2I2LzUzMTV5WkFEcXJmTU50?=
 =?utf-8?B?WVBHdU1JRDZVbWFIQ3dXR1FkNFhjbG5zengwTHE5RDBFQ2RuL29rVWVjZk5L?=
 =?utf-8?B?YldDSTgzQ3ZKVWk1clpZbXZTM2ZRVUdYRjlTVlQrdXZyMG5ESkx0RExqWnlK?=
 =?utf-8?B?L1llWTRobmNOOUdUYTMzOFRQOVp3VXVZQkhjNFk0VDRlZzJrNXB3VFkwbktS?=
 =?utf-8?B?Rmp5WStGTjQrMEFqbDgwVlNLUGIvelJ6N0lLeTRKWU9vOURqY2xENHpnZDkv?=
 =?utf-8?B?YnppVDY1S29aNlVMc0pWb1R0MSsxdVNPbmlwSTVRMnlPRmVYVTlEdHU0azlm?=
 =?utf-8?B?SWVDZEwzY1BTT3dwU3J6ZFc1ejhyaGU4cmFqQTNkdVIvb2Uxeks3c2pBMVpi?=
 =?utf-8?B?aElLdkxVRVdsd2Y3MG9DOGZ4U3FIVzJtV1NqY1c3T0VmYy9vUHMvVzRBRUE4?=
 =?utf-8?B?L2psdmRzeEJvc0hoQmIwcThGZHFaOGswSC91dkIweFRtWTliRVh4b2JaUmZ4?=
 =?utf-8?B?K2U4Uy90aHN3bEVjSENXaVNVSFQ1NHpOL0lER0VSdFBDNUtSdkI4aFRaRGtQ?=
 =?utf-8?B?MC9ndEpjcFJOQmNNQXRRMUcvKzh0cW9ibDJsbTFqMGNsNEVENVlac2tjZmpZ?=
 =?utf-8?B?NXpsNFlzTk1rK1ZPR28vNkVrK3pPRzlZTFhJTmVyZmgzbHVVdTNwVElFUmFK?=
 =?utf-8?B?cUlDMUpsSEEycW9pL1FrNDBjQURqYU5Zckhhbjc1ckhwd296Sk9jOURBb1Zt?=
 =?utf-8?B?dUp2TDJOZlBmQnl6RjNKRDljRTU0VEhpSG1aTkJFUUFNSGVTRWI2WlZRTDMy?=
 =?utf-8?B?aTFFTGNhckUvUlFVa3ZBWG5zdk9wVlZ4S0hiNXVyRWhKWFh0MGtIVSsrQ1hq?=
 =?utf-8?B?NkdnWktMNVFHZCsxQVkxTUQ4Vkl1ME9KWis0U2RVSnpwdzB5SWVPeUlwVkEr?=
 =?utf-8?B?NkRybndOT29qOUI2Wnk3V3pjOU1QYUZBeU5MTWRSREpudXJ2ZzlHQURtS0M4?=
 =?utf-8?B?SzhYS1NEbmQ5S2pZeDZnYVorK21EK0JQSGJnalhJZERoa3Jnc25xVk81bnFq?=
 =?utf-8?B?RU9CRHRwQ2hnZWJUS0JPQjJ6WDJTZnB0eUVWblI3L3NkSzlYam40eFVrb2ln?=
 =?utf-8?B?WnFEdnRuUTFra1JuWUFTT3FmYjhnK0RRTE9Tb1cyWURIaU9mS2RoaHZWdVRj?=
 =?utf-8?B?VUk2R1BwWm10VzZCQk93dDh3NHBWTEtOcTNBdkRyZjMwbmtJWEpsUUdxRzBy?=
 =?utf-8?B?ZEkwUGEzVEJFUUVndUt6OE1Rd2V5VTM1cVlTc25ZNEw3b3VZaFdiMFV2bWlQ?=
 =?utf-8?B?WjNzb3Y4aUdrR1VrdVVneFZJZmlwbUdpaDh4NzNzNVcrdlB2UXBhdz09?=
X-Exchange-RoutingPolicyChecked: JrqY5IdagbuCfYqHAMwQDGPwxnNRIjfYkhfP6BxDY5HFP0LWnM3h0Yf7OEx051JP/F2uO0ZBM9ay8L+Yk+TnzXBnqu09zjlxLznOMZu0pfP6xugpBiTc8MGHuhWPDQq0wUlqUAbJaP9IHtaWUiCF6ZwVducWc33OMRHbP7Il0HOxql8cPm9m4Ti6f771sCRLWhKTmWDpjgfROzzJbgqznVdfGaUe85FZo2G7vK3WLkpUS8jrz6WGmpBnVJmkkITIM3kkU/QF1TRmhQGgVqHrwhjmwY0cn+KKP3WaU/G2qvJc8Vnu63das64+v3FIwopJ9M0788wGLKQevBTR5rBQtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3e8451-2d05-47e4-ff99-08deed61a2eb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:07:53.8445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Lbo266hNwBphz2J2BCoM0KzorRTsJrm/AkChknDX5XrrOeRqjxD0YFne3jlYBorT70qV/HgBLMaKXcQGj5THg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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


On 7/29/2026 4:30 PM, Kamil Konieczny wrote:
> Block all non-Intel Imagination tests with prefix pvr.
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.blocklist.txt   | 1 +
>   2 files changed, 5 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index bfb1e6b5a..da467ae49 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -126,6 +126,10 @@ igt@panfrost.*
>   ###############################################
>   igt@panthor.*
>   ###############################################
> +# Imagination
> +###############################################
> +igt@pvr.*
> +###############################################
>   # Qualcomm
>   ###############################################
>   igt@msm.*
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 0e6babd0b..410f43b17 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -9,6 +9,7 @@ igt@msm.*
>   igt@nouveau_.*
>   igt@panfrost.*
>   igt@panthor.*
> +igt@pvr.*
>   igt@v3d.*
>   igt@vc4.*
>   igt@vgem_.*
