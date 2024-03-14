Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA164C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 21:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186610FA3D;
	Thu, 14 Mar 2024 21:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="johHYU4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72010EE53
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710451906; x=1741987906;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=vNVoW+8X0WgunTKNLpO0hrqkj25nbu3jQKeQSAnOVUY=;
 b=johHYU4wuHHDG9g86QYILwvvLy1GJH/Hp8RSbpl8Z25J6VnWmaJLgIQc
 bR/+/aWGvdJj7DEKNoCh8Isv802kmKu9S2DY+PTudNfD7VQQ7UgFEYWFK
 3QlS35zLEd3E1gCRWQyqigDv8cZAJxXiNk9GkG1txy/A9jr76RLrQoCZe
 2FVwnsfGbqtWuAtMp5/I6LGv8oBdWfq38mEd4ozqEBsh6+io7pQdEYsYe
 WrjnS41fMk5POJnjT+LlpHwwekVhySgpHRkz6KFafbqhZdTZen6qruURJ
 SxzlrG4fUHUl6VW9GmsA16csSFDQFjETZTdj2j96cDnQthwQaheyGf04b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5166938"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208,217";a="5166938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208,217";a="12468050"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 14:31:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 14:31:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 14:31:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 14:31:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 14:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb2ABKePTvjCZ0eEkoJDdR9G3F/WofDODZBQSaZ3cMR59rKtySE6XrNUXfpxWk9VT5mgQiN0eoyONYo3A/BjsNuLhN0iOW4oOkdA+63C28/ervTfe7bpM6fwxdAPkQY+k5RIwg9nrScgFuhjX3cW8JzsaeHFJnLBdNA44SmhN2i2KGbv1msMQlw5JowJVjBRaBO7mAfiowQrc4w0Q4cKKV/xWpvxSKh0cQP/EYTIzSF+/uvHNewy3OSOjaFTEEredKLZIkfMQ0D0pdXfIU/g1T/QI/ZIrAGVfKqA3T0MM3Q/swLm79GrBZEY2biTZyBMCggsERGMc3a2N9RvqAihZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYrMuxrvdk/4fvMYSNGxccitX0IgbA1O+zIJTNd7Jts=;
 b=kioiiTolxHuLDG0UFtsXQMYgDH6GvZtMRDL1QOjNmPMBod5JCEWBHztLS86wb7YN1FR3lvnKW9F8pYqEZYYfG0+xWBUlrJMmLhX4imMqMEx06/iHGlBPcO//CSO2NqrsTpAZsi4dZc95/ppG8PUbMSC9zQc5biv+7VLK72fPTpm9adtoiZF0yaNtCU6t067y6BITgoysf2XWSUCNqU8oru0og3EeMjmnOwXPK6jdxU7tlnrbMfKscK1XNngx9q6CQiAc2sg0LOIIh+irq5BIuW5gqiGN2uDDj8810IxBXhkA+V9T+Uw8CAFdpUc2kHHuKEdh0J8zs/6PYWuXNIlN2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 21:31:41 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::57f3:87f3:884d:2c32]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::57f3:87f3:884d:2c32%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 21:31:41 +0000
Content-Type: multipart/alternative;
 boundary="------------xBNpUvFtr0VMjFquQQPgRBsU"
Message-ID: <83788132-275f-4281-a49e-358f19407cbc@intel.com>
Date: Thu, 14 Mar 2024 14:31:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add compute
 threadgroup preempt test
Content-Language: en-US
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240314210026.2463551-1-janga.rahul.kumar@intel.com>
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240314210026.2463551-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 52623281-585f-4313-ca5f-08dc446e2340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYa8mXXlo8by6gxOWWNwS9sZwS8ngy5OC2VhoYxgYpptEN8A3F4MJShN239ItzOrVzETcyevHM/GH/8hvleXosqp1FpVDrDcGtN7oAC1wiGrxLbvOWLVl2npXBRtrud30xHFbE0JJexEXJqnzd3YqXlg0kPHq4P22dz/55WYaO2VtxpwkumMyRVyffXHbHHTJ77ZVAzrz708puHY2pa4PrPrzki2IVnLpR2mKnI7KpHLI2gS0cR4CHcHbiYiED0NQLwXEVvNXxf6mzm1bcdZ+GBnzlBdWvMA0JaSB57pN87WPfp+cy+OzpmuTST8/ynx22HQpovZr0My33NdOpD/OIgwwlEJkUTg2rWH7itV86ZneOJ292yWUVnoAaxF5tB6L1duiNJb3YfbvlAD9WtLKoB/wpwhM135SjZ0zBVgaBHBKcUNXH1DUy91n4WoJJh3RYVnUhvmlaiL5wtLKTFn7gP1fcl2Ion0cKavHDeekdpS0Sxbi3nYO6xR58TMI3gVNzF8rgwak8j3XTfbODNNTCVSXR/3A344yeQuadQiJHXlEvzUF4WSsmTuJO08RhvvHyehNNkHvOuhkYNq2bUz5NhTpyk9lseQ/Zb8Y7tEfRLGOM08oHl7kUjusZRfZ/KT7D3QPVeOa1Dh8cJ0yxVP3YcPxM6V/E7RFEZfF81llyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTVHYnhramxVc3AydGFsQU5GTG4zUjRCSG4xY0ZFNGtLbTJSRmJ3bjdGaTZC?=
 =?utf-8?B?em5TVndWMUVOOTdvSHlxZGV4bkw0TWw3RllXTWxFdGJkcDB3ajZYaDM2eEJJ?=
 =?utf-8?B?OFBSckdNTk9PZW15VldmN0Qra1k2VE4zVUxTOUVQd29KUmN2d0NiL0tWblQw?=
 =?utf-8?B?S205eGx4RDcweStQcDhNNmdlMm04SVJDa0FUeFc3cXkrWDZsU3pBbXZKbC96?=
 =?utf-8?B?U2pNajJ0TVJVS3V3clhZckw0emxMYXVQUDdMN2pabVA2STBJT0xGWnEwTDZW?=
 =?utf-8?B?L1pkblBtcXRubXpVRFlFdzEyYWMzM0wvcTlUWW9OQWI4cjBiUDhEdXNyQ0dB?=
 =?utf-8?B?aDF0dmdwdVNOeE5jY2tvVUU3WmZ4UHFLSHZOaGhZWE9pSFArS2NVRlgyaEhX?=
 =?utf-8?B?Z0VDcWlxWTRqZCtvZnhPSmE2NW5xZUtZRHJQN0IzeWF6aE44ZkE4WW85RUlW?=
 =?utf-8?B?WGlTb21aOWhJdUVkQWc3YjBTV2RCNk00RmlRSUtGVy9tQ013TkozYktDdTJp?=
 =?utf-8?B?NFY2VWpERXVZRHIvL0M0dTQyZUtMRFpONFlvNzRMckQvbjlFcnp4QnNFV2ZG?=
 =?utf-8?B?NWlKOUtFeDVnRnVEeFpNRWtxa0wrQXVFWG4wZ0ZZSjl6cTVBYWcyRUNRY1Fx?=
 =?utf-8?B?QXY3aVNjVFVuU0xlRGsyQVlQQWd4bTFEV1pqcG9CQWo4L21FMldUaUlkNFN3?=
 =?utf-8?B?Z0pYVUVzcjZWcFNCcVZqRHQvMFczUm45ZTR4aDFVa09CV0dOMmkyZDVad055?=
 =?utf-8?B?NVMvSmQ2YlBOWmpQM0Z1L210dUFKRTczRnJqUk5wMnlxOFZ2cnpDYXBXbTY5?=
 =?utf-8?B?bDRtdVlNcUtFaDA2T2t1M1VNUlpLSTBRLzY2aytRV2grZ2NiV1cyL0srU25Z?=
 =?utf-8?B?ZHRNc2U5S2E1S2RUUjBoaGZvMHk2K3RSemNReFYvQkgyUS9xYXJxSVdYdFI1?=
 =?utf-8?B?OHQ3b3lSRDdBejdUR1VvckNYZ2E5QVpBaUNJK0hKVHR6WFhia25QRVVuVS9D?=
 =?utf-8?B?UXFDV01BTHZzZVAzV3grVlB5clJ3ZG1MT1RzTys1WVBxVHI5REVpZDkyN08w?=
 =?utf-8?B?UGtMdzJJQW1iRi9ESHpoQzVLaWhtY2wzcG0xK283c05mT28vUGZZN2l0S3FY?=
 =?utf-8?B?MzZhSWNwdVNnUUx0OG9EN2RIWVkvV2FaZXE0aXFOQThCQmZHZkczQ3hMSjgr?=
 =?utf-8?B?amRyNkF3ak1vSitvOXQ1Nkw1S3AxMTJxSzRLazdvbCtpWjlKeXlHeXo3c0xM?=
 =?utf-8?B?a0VHZjNKY2dDSFVIbWRVSGFZbm15TXUwMmJCME1UdzlicWxLVStIbEt4bGxT?=
 =?utf-8?B?R3p0T3d4K2dKWlhkN1hDZjNlZ1o3enhJQVRpd3R4Wkh5b3BFbFVMR3c5SXNH?=
 =?utf-8?B?WEk3MkQ1VVltQS9RTURNVU4rOXloQlpQK0ZUK1NiYVEyNDRmWWVuWFJMR0hp?=
 =?utf-8?B?cEw2VGRUOU1BS2xtVittbjNlUngzcXZOOHZBREg1REJJUzRPREwyUlRFYmxy?=
 =?utf-8?B?TXBkcnRUQTNlSElVOGhxaEpSUXcwWmdTRG1abllTL3RNTFlBeGMySjB6RThU?=
 =?utf-8?B?UDlwSkNGYmFER1VtQnF6VUp0T3k3NUx1anRaQ2hMckJtY0lpWjFGSFEvT2Vo?=
 =?utf-8?B?RDFMcXJ0V0tkZjh3SGZpMDdHbkd6eXA5WGVMdkVlelhCUEVrRXdvbXVLdjEy?=
 =?utf-8?B?V3pkelZFcm4rL1NGeFRFYnVYSUpDRGYrVW5RZHh6ZDFzZkMwZXdGRHc5RnA3?=
 =?utf-8?B?SVVhVjRXeVBEcHRvVnBGeU5PWHNIZ3hrREhNSXlud3hRSDlnNEpxUktDVm1l?=
 =?utf-8?B?ay9HN3N6T3hsRytsVGNCSnhxWmFLSzk1NSt6K3dMZzZnS0QyK1g5OUp4K3Jm?=
 =?utf-8?B?OXgzOHBSdlBCWGR3VU5lajdTNDZwOGpGMjdsMldDTzhmT3N1MW5PNG9abzZL?=
 =?utf-8?B?NXVsamFVL2Q1RkFqNDk0a2Uvbzk1MTVqREFtdHI5STJIbWd3SUhkbEttemlN?=
 =?utf-8?B?OXZTNkthd0xDM2ZMVVBXZXU5bjJCb1ZyWGtFM3B4WldNRlBvNFZTcVFUZDdG?=
 =?utf-8?B?d3pRVEhwK25TUnoraWhIUWhxRmJvNWlueHdmcURrbkIzc2lXMlBLOHFZWU16?=
 =?utf-8?B?UVMrUUF2V3ZPZkVNc0NjRVp3dHIxVDZrdTE5VUNXZWowR2lyQ1kxL1ZXMGZW?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52623281-585f-4313-ca5f-08dc446e2340
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 21:31:40.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnN/gVGw4md6x5MrJA/JH2PNdVu+8AGKrlj2WeC5exX3FQU7RNSJse1lKuquuCC9kF3/lRKEq2EaljaP5BnfyUPQtaeEUxdNuyKOxVuenTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

--------------xBNpUvFtr0VMjFquQQPgRBsU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/14/2024 2:00 PM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
>
> Test submits long kernel with a higher threadgroup count, lower
> iteration kernel and a short opencl kernel to exercise threadgroup
> preemption scenario with WMTP disabled.
>
> v2: Use macros instead of const values. Add documentation for
>      validation check. (Nirmoy)
>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
> Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   lib/intel_compute.c              | 74 +++++++++++++++++++++++++-------
>   lib/intel_compute.h              |  3 +-
>   tests/intel/xe_compute_preempt.c | 24 +++++++++--
>   3 files changed, 80 insertions(+), 21 deletions(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index c5d253ebc..9d3b97efe 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -43,6 +43,13 @@
>   #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
>   #define OFFSET_STATE_SIP			0xFFFF0000
>   
> +/*
> + * TGP  - ThreadGroup Preemption
> + * WMTP - Walker Mid Thread Preemption
> + */
> +#define TGP_long_kernel_loop_count		10
> +#define WMTP_long_kernel_loop_count		1000000
> +
>   struct bo_dict_entry {
>   	uint64_t addr;
>   	uint32_t size;
> @@ -1162,7 +1169,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   					uint64_t addr_state_contect_data_base,
>   					uint64_t offset_indirect_data_start,
>   					uint64_t kernel_start_pointer,
> -					uint64_t sip_start_pointer)
> +					uint64_t sip_start_pointer,
> +					bool	 threadgroup_preemption)
>   {
>   	int b = 0;
>   
> @@ -1236,7 +1244,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   	addr_bo_buffer_batch[b++] = 0xbe040000;
>   	addr_bo_buffer_batch[b++] = 0xffffffff;
>   	addr_bo_buffer_batch[b++] = 0x000003ff;
> -	addr_bo_buffer_batch[b++] = 0x00000002;
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +
>   	addr_bo_buffer_batch[b++] = 0x00000001;
>   	addr_bo_buffer_batch[b++] = 0x00000001;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1251,7 +1264,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   
>   	addr_bo_buffer_batch[b++] = kernel_start_pointer;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000000;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Mid Thread Preemption BitField:20
> +
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x0c000020;
> @@ -1369,7 +1387,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>   				  ADDR_INSTRUCTION_STATE_BASE,
>   				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>   				  OFFSET_INDIRECT_DATA_START,
> -				  OFFSET_KERNEL, 0);
> +				  OFFSET_KERNEL, 0, false);
>   
>   	bo_execenv_exec(&execenv, ADDR_BATCH);
>   
> @@ -1527,7 +1545,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   					unsigned int short_kernel_size,
>   					const unsigned char *sip_kernel,
>   					unsigned int sip_kernel_size,
> -					struct drm_xe_engine_class_instance *eci)
> +					struct drm_xe_engine_class_instance *eci,
> +					bool threadgroup_preemption)
>   {
>   #define XE2_BO_PREEMPT_DICT_ENTRIES 11
>   	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
> @@ -1564,6 +1583,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
>   	struct bo_execenv execenv_short, execenv_long;
>   	float *dinput;
> +	unsigned int long_kernel_loop_count;
>   	struct drm_xe_sync sync_long = {
>   		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>   		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -1574,7 +1594,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>   		.handle = syncobj_create(fd, 0),
>   	};
> -	unsigned int long_kernel_loop_count = 1000000;
> +
> +	if (threadgroup_preemption)
> +		long_kernel_loop_count = TGP_long_kernel_loop_count;
> +	else
> +		long_kernel_loop_count = WMTP_long_kernel_loop_count;
>   
>   	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
>   		bo_dict_short[i] = bo_dict_long[i];
> @@ -1622,12 +1646,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>   				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>   				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
>   
>   	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
>   				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>   				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
>   
>   	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
>   
> @@ -1655,9 +1679,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>   
>   		f1 = ((float *) bo_dict_long[5].data)[i];
>   
> -		if (f1 != long_kernel_loop_count)
> -			igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> -		igt_assert(f1 == long_kernel_loop_count);
> +		if (threadgroup_preemption) {
> +			if (f1 < long_kernel_loop_count)
> +				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> +
> +			/* Final incremented value should be greater than loop count
> +			 * as the kernel is ran by multiple threads and output variable
> +			 * is shared among all threads. This enusres multiple threadgroup
> +			 * workload execution
> +			 */
> +			igt_assert(f1 > long_kernel_loop_count);
> +		} else {
> +			if (f1 != long_kernel_loop_count)
> +				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> +			igt_assert(f1 == long_kernel_loop_count);
> +		}
>   	}
>   
>   	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> @@ -1675,7 +1711,8 @@ static const struct {
>   			     unsigned int short_kernel_size,
>   			     const unsigned char *sip_kernel,
>   			     unsigned int sip_kernel_size,
> -			     struct drm_xe_engine_class_instance *eci);
> +			     struct drm_xe_engine_class_instance *eci,
> +			     bool threadgroup_preemption);
>   	uint32_t compat;
>   } intel_compute_preempt_batches[] = {
>   	{
> @@ -1686,7 +1723,8 @@ static const struct {
>   };
>   
>   static bool __run_intel_compute_kernel_preempt(int fd,
> -		struct drm_xe_engine_class_instance *eci)
> +		struct drm_xe_engine_class_instance *eci,
> +		bool threadgroup_preemption)
>   {
>   	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>   	unsigned int batch;
> @@ -1724,7 +1762,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>   							  kernels->kernel, kernels->size,
>   							  kernels->sip_kernel,
>   							  kernels->sip_kernel_size,
> -							  eci);
> +							  eci,
> +							  threadgroup_preemption);
>   
>   	return true;
>   }
> @@ -1733,11 +1772,14 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>    * exercise preemption scenario.
>    *
>    * @fd: file descriptor of the opened DRM Xe device
> + * @eci: engine class instance
> + * @thread_preemption: enable/disable threadgroup preemption test
>    *
>    * Returns true on success, false otherwise.
>    */
>   bool run_intel_compute_kernel_preempt(int fd,
> -		struct drm_xe_engine_class_instance *eci)
> +		struct drm_xe_engine_class_instance *eci,
> +		bool threadgroup_preemption)
>   {
> -	return __run_intel_compute_kernel_preempt(fd, eci);
> +	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
>   }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index fe9637b91..3c2cd010c 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -37,5 +37,6 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
>   
>   bool run_intel_compute_kernel(int fd);
>   bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
> -bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
> +bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
> +				      bool threadgroup_preemption);
>   #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 0aeb10547..2bc27eff1 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -27,11 +27,16 @@
>    * Description:
>    *      Exercise multiple walker mid thread preemption scenario
>    * Functionality: compute openCL kernel
> + * SUBTEST: compute-threadgroup-preempt
> + * GPU requirement: LNL
> + * Description:
> + *      Exercise compute walker threadgroup preemption scenario
> + * Functionality: compute openCL kernel
>    */
>   static void
> -test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
> +test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
>   {
> -	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
> +	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
>   }
>   
>   igt_main
> @@ -49,7 +54,7 @@ igt_main
>   				continue;
>   
>   			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> -				test_compute_preempt(xe, hwe);
> +				test_compute_preempt(xe, hwe, false);
>   		}
>   	}
>   
> @@ -61,12 +66,23 @@ igt_main
>   
>   			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
>   				igt_fork(child, 100)
> -					test_compute_preempt(xe, hwe);
> +					test_compute_preempt(xe, hwe, false);
>   				igt_waitchildren();
>   			}
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		xe_for_each_engine(xe, hwe) {
> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
> +			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> +			test_compute_preempt(xe, hwe, true);
> +		}
> +	}
> +
>   	igt_fixture
>   		drm_close_driver(xe);
>   

> Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com> 
> <mailto:jagmeet.randhawa@intel.com>
--------------xBNpUvFtr0VMjFquQQPgRBsU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/14/2024 2:00 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:janga.rahul.kumar@intel.com">janga.rahul.kumar@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240314210026.2463551-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>

Test submits long kernel with a higher threadgroup count, lower
iteration kernel and a short opencl kernel to exercise threadgroup
preemption scenario with WMTP disabled.

v2: Use macros instead of const values. Add documentation for
    validation check. (Nirmoy)

Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>
Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 lib/intel_compute.c              | 74 +++++++++++++++++++++++++-------
 lib/intel_compute.h              |  3 +-
 tests/intel/xe_compute_preempt.c | 24 +++++++++--
 3 files changed, 80 insertions(+), 21 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c5d253ebc..9d3b97efe 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -43,6 +43,13 @@
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
+/*
+ * TGP  - ThreadGroup Preemption
+ * WMTP - Walker Mid Thread Preemption
+ */
+#define TGP_long_kernel_loop_count		10
+#define WMTP_long_kernel_loop_count		1000000
+
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
@@ -1162,7 +1169,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_state_contect_data_base,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
-					uint64_t sip_start_pointer)
+					uint64_t sip_start_pointer,
+					bool	 threadgroup_preemption)
 {
 	int b = 0;
 
@@ -1236,7 +1244,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = 0x00000002;
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
+	else
+		addr_bo_buffer_batch[b++] = 0x00000002;
+
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1251,7 +1264,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = kernel_start_pointer;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00000000;
+	else
+		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Mid Thread Preemption BitField:20
+
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x0c000020;
@@ -1369,7 +1387,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				  OFFSET_INDIRECT_DATA_START,
-				  OFFSET_KERNEL, 0);
+				  OFFSET_KERNEL, 0, false);
 
 	bo_execenv_exec(&amp;execenv, ADDR_BATCH);
 
@@ -1527,7 +1545,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
 					unsigned int sip_kernel_size,
-					struct drm_xe_engine_class_instance *eci)
+					struct drm_xe_engine_class_instance *eci,
+					bool threadgroup_preemption)
 {
 #define XE2_BO_PREEMPT_DICT_ENTRIES 11
 	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
@@ -1564,6 +1583,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
 	float *dinput;
+	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -1574,7 +1594,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
-	unsigned int long_kernel_loop_count = 1000000;
+
+	if (threadgroup_preemption)
+		long_kernel_loop_count = TGP_long_kernel_loop_count;
+	else
+		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
 	for (int i = 0; i &lt; XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
@@ -1622,12 +1646,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
 
 	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &amp;sync_long, 1);
 
@@ -1655,9 +1679,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 		f1 = ((float *) bo_dict_long[5].data)[i];
 
-		if (f1 != long_kernel_loop_count)
-			igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);
-		igt_assert(f1 == long_kernel_loop_count);
+		if (threadgroup_preemption) {
+			if (f1 &lt; long_kernel_loop_count)
+				igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);
+
+			/* Final incremented value should be greater than loop count
+			 * as the kernel is ran by multiple threads and output variable
+			 * is shared among all threads. This enusres multiple threadgroup
+			 * workload execution
+			 */
+			igt_assert(f1 &gt; long_kernel_loop_count);
+		} else {
+			if (f1 != long_kernel_loop_count)
+				igt_debug(&quot;[%4d] f1: %f != %u\n&quot;, i, f1, long_kernel_loop_count);
+			igt_assert(f1 == long_kernel_loop_count);
+		}
 	}
 
 	bo_execenv_unbind(&amp;execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
@@ -1675,7 +1711,8 @@ static const struct {
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
 			     unsigned int sip_kernel_size,
-			     struct drm_xe_engine_class_instance *eci);
+			     struct drm_xe_engine_class_instance *eci,
+			     bool threadgroup_preemption);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -1686,7 +1723,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1724,7 +1762,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 							  kernels-&gt;kernel, kernels-&gt;size,
 							  kernels-&gt;sip_kernel,
 							  kernels-&gt;sip_kernel_size,
-							  eci);
+							  eci,
+							  threadgroup_preemption);
 
 	return true;
 }
@@ -1733,11 +1772,14 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  * exercise preemption scenario.
  *
  * @fd: file descriptor of the opened DRM Xe device
+ * @eci: engine class instance
+ * @thread_preemption: enable/disable threadgroup preemption test
  *
  * Returns true on success, false otherwise.
  */
 bool run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
-	return __run_intel_compute_kernel_preempt(fd, eci);
+	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index fe9637b91..3c2cd010c 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,6 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
+bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
+				      bool threadgroup_preemption);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 0aeb10547..2bc27eff1 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -27,11 +27,16 @@
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ * SUBTEST: compute-threadgroup-preempt
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise compute walker threadgroup preemption scenario
+ * Functionality: compute openCL kernel
  */
 static void
-test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), &quot;GPU not supported\n&quot;);
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), &quot;GPU not supported\n&quot;);
 }
 
 igt_main
@@ -49,7 +54,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class))
-				test_compute_preempt(xe, hwe);
+				test_compute_preempt(xe, hwe, false);
 		}
 	}
 
@@ -61,12 +66,23 @@ igt_main
 
 			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class)) {
 				igt_fork(child, 100)
-					test_compute_preempt(xe, hwe);
+					test_compute_preempt(xe, hwe, false);
 				igt_waitchildren();
 			}
 		}
 	}
 
+	igt_subtest_with_dynamic(&quot;compute-threadgroup-preempt&quot;) {
+		xe_for_each_engine(xe, hwe) {
+			if (hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &amp;&amp;
+			    hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+				continue;
+
+			igt_dynamic_f(&quot;engine-%s&quot;, xe_engine_class_string(hwe-&gt;engine_class))
+			test_compute_preempt(xe, hwe, true);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 </pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:20240314210026.2463551-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap=""><span style="border: 0px; font: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: inherit; box-sizing: border-box;">Reviewed-by: Jagmeet Randhawa <a href="mailto:jagmeet.randhawa@intel.com" data-linkindex="0" id="LPlnk599238" style="border: 0px; font: inherit; margin: 0px; padding: 0px; vertical-align: baseline;">&lt;jagmeet.randhawa@intel.com&gt;</a></span>
</pre>
    </blockquote>
  </body>
</html>

--------------xBNpUvFtr0VMjFquQQPgRBsU--
