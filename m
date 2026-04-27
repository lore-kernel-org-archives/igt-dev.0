Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A919DFF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB3D10E1D3;
	Mon, 27 Apr 2026 05:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBCSDw1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9810E1D3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777267041; x=1808803041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2NcIjt6XScm2lgmzl5SkJVXJ+EmcB2GSXQQGA99XhYM=;
 b=WBCSDw1leVUtpDYT7AhljL1APKWm8iXeEOySIWyadeZcVUc/66aTZKF2
 6EOACTHdU8YsiTOc+lsmDIAUcQi9O2dYlo03/IUGhZ4Co9FZOZgrj5hMf
 VKslg8lxjxznDteLaN9geYtIO4NtXf6GKYwuLkEvV86zZGHC3G00T6czV
 BF/tJBNo26Ly78Hv+KtFxKTmFtrikXeL99pwO5U/qZgvrujt/fFvYcvgV
 kwydpr0zbC3eAxtFxP+rnFm/BDTLBBYyvd3zwwFVaDiqdZhIfveKijcNH
 8Ow+ZsQrZ4xl86oD1smr9hoboJH4tC55HTrtTV/gL+PfUtpH/6tNeJGaU A==;
X-CSE-ConnectionGUID: 9A1CytwkRP6EX5QG+faZEw==
X-CSE-MsgGUID: VrQGTmi7RGqlDD6Qo2VaxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="82007841"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="82007841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:17:21 -0700
X-CSE-ConnectionGUID: +9XQqcNXTUKY8atf2wMQ7Q==
X-CSE-MsgGUID: IzSLjFnsRfWu8ke6e/DV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="232539761"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:17:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:17:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:17:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULOi3iUei5/Y6VeU/c2U4X99HiIVr8a1naQFql/g+JDmetWZlO1oeH9sNTBp8kaCiezolxMmE+0hLOqZ0fUSDZXpEfQP4Cs+kshDExWyWGS8q1hQMqdCFeI5jLzicor6c5vIi7SKd5PH3y6MFMdtYyu24EJamrnMrGVUovv4YSMASVcQbehCX9dcPRYDOz6wlA9uUH7Jx6nfE+xSXSomcpaEHGo+Z42TrZGUSo/w9KjTnFWUQhGXkD2TYrRM3mabarbVyIyWMXTH0quM+OcJDu/asa7eSGUG69arvAY3kp3FaasRW5n3KK29ziwBWUuFf00zkFsLY3iso8pEMzoYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbS4vRJOJUc/ZwRepSR3IoOe02dw4m/g7ORXsbByubM=;
 b=ZE6sysHPozW2MAZHykwPFc/z97lrHJUHrfFbnxxrmJmyo7JrUXnzfKdfFKHmhEKcHnVo6W3hMDvLyHsQLzGR+Myw4BTJRCqSL8S58XvVn+owKt9z1gRc5cbfQWwuxRjl8Furkqs+xTQ5OXrallwdeBj/g4tmpqtpABnxwSXXKXdfJCLu908eNiE3Q+Ohlr4HekuqnNPxfhRucPVpWHV74SzMluXfiLbld4M0hcsIoZaBcdpnqzWOl+P5WgXm5+WeTweBp/ebR1YMoEkl/iTr+1THIN69NZHb7Eux3jfGEPo9VUxb7sTDRHytlbsQbOl/EiFwdV/80NXEKlXSgnbQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 27 Apr
 2026 05:17:18 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:17:18 +0000
Message-ID: <761b1815-3012-4f5a-9916-508226fff572@intel.com>
Date: Mon, 27 Apr 2026 10:47:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/8] tools/intel_vbt_decode: dump eDP data rate
 override field
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-7-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-7-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a6e0ea-c78d-4148-3c2c-08dea41c405b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ygHcthAbfCRfhPcPXz8WNFbNFSDXudvQ45L67NM0MGpGnrSoaJeW0ons2lFwk0fZs4UwTg1Evncd4pcfVg0bmbdmKQM1Xv0hQ+4VG0gVpegPssoG80BYVD+EKDp2yu7F+UhJGslaM7zlj7eu5oJwu+RVrMb3H98BX6NirMDYn7XfzKqkB/kP6Zl2nmhLfvzE9/M9BPYxOOVyulQl0X6qf0D0OixcU/VWzRMheNAu66i+NoyJXikTKS/o/SXRODglv0og+b4xHERunGbGaH94BkmiEYx63YrN1SxqWl1az9RSq78m8nw9EsQPcZyQXT8UihcA8BcC/N8tAXTTd6Q8TtZufyh7D7qgVBdjG/X4iwdVnG8OM5euPi/LsqRMbpNraanTpwZV/QV0eLpvkgawm981ccAxiZZcLjVkVQsxLvuKiba0CXFwF0TW4KIO/6WUubjXP3modKrjMbqvoQJX0CM3y2iasox90WBx1bAUFIyPhR640Hgl/wVNpG7xo7UCtt0iMcp3/lSFeQ44wIsRlYhr8zojwKhl0LxBixwN5l20VyLlhWeYFo3awKSlOX3/9OYdEb3Qq0wAuWLsD0DbrtFTFE5EfeLasYnVS8LjglZqR0uFuiz4jdqr8Fbx7eN4wxvyFid5BUkJwPcNNEJ13is4S1iuZZsSR0cJOwnmXhdNOQlE3UW26JXhe5eg7oO9/EOISR7+zhlU+5cK1WBt9/WJT9adJZbVbACqKQjg2iw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVoveXBFRnlteHd6MWt5L0pHR3lXem1LWWgzQmduaHRzZFlBSFVmK0t2OGlD?=
 =?utf-8?B?bk9UYzBnU3AreFpaR29JT2s5eUFDSmZjV3BiNmRYbGdzNjJ0bjZKSGJKRnd0?=
 =?utf-8?B?SURTeUJlR0E2WjVtWUFnWjgxYmhBQy9nYlJ5dG9MM3FPRGR2WWJ3S2wrVU9D?=
 =?utf-8?B?YmdyZnhPTlk5OXMremdET3p1b2RueHU3aEE4MWNvMzBlWEg4dHRtVlV5L3Fa?=
 =?utf-8?B?ZW1HZll6SGZLYU10WExHRGpKdURPZnM5cWVMQ1htLzVDdkk1QmROSCtJWTl1?=
 =?utf-8?B?WXpkSWxJUm02aVNRQzJwVEpZMHJocjJyZjBTbU1VUlpTVEw0Qml5TTU4TklG?=
 =?utf-8?B?NWI3dVRVRkV2SzV3Vk5IUHNOTjgwZ204Z0hzS3NsQlFuQUxrV3hvd3NucnBQ?=
 =?utf-8?B?Y2dXcE5kMnpOcmgyV0NRUFhBL0taRlVpMCtpUDJkbVB3bHdPQTBrait4V1BM?=
 =?utf-8?B?WUo1TEVIaHhObTBVdk5FRy9waEZRMzV3YklWQldwbFBhR2FnZE9JY1dkYUhF?=
 =?utf-8?B?Q3pibEFNZzZvM2hQMlRMRm1kb3oyUDcyKzk1cDZlY0c4U0dWZzZQaXlsOEpv?=
 =?utf-8?B?SUkzczF2QXp6TDdGUHlNMzBEZkhRdVZpcDZHWkVJbkk0K04zSHlHRmRhMUVo?=
 =?utf-8?B?NUlIdldJQU5QWGwzalFGMVdSL05JVDYzZzdRS0ZoY0hmVHVKZG81R1BjWC93?=
 =?utf-8?B?amUwV3RrSDJ3cEVpMDFrQnBET2QwOE5iVm93ZStaTG1ob24zOWJFSWg0R1cx?=
 =?utf-8?B?Y2dqQ3VaVnJEQXpVV0RGOGNab0Q4Qnh2eTVFbGN4VnJsOWpseTZjVTcycnJP?=
 =?utf-8?B?cmtHSHpiUTNoSVJSajFpTzh0OXJIeDFRNEV4SFR1c2NVRi80OFQ2SEQyem4z?=
 =?utf-8?B?RnErNWp1VDZvSjBaTVREV1VpTWNielU5V25MSkxTaEtrTUowSUVYcm5FVWxK?=
 =?utf-8?B?dGJJOFJtQUFLeEFyaGFKV1krYUdEZlYyM2VJWXJUMFMwMWc5Z1RxVWJVUjYx?=
 =?utf-8?B?RFFOVW9SOUFmMElmcnZqN28vVHJETS9ESmRxSzc1S2pzQlFLelRrUFlLQ2hY?=
 =?utf-8?B?ZnVLWERwcHRRVGJDNXRnclJXcng4bEwvT1Jzb0hlZjdiVFFhbzlxZTdWV0FI?=
 =?utf-8?B?Y0lyOFhsVE1JUWNFcTJlbVF4ajVOVTFRRmZwM0JUOGNrN21vODJBMXYzVGRl?=
 =?utf-8?B?V21nbzFQbW1SM0loRlE1VUV3QzY0MHV2RXBJSXloMzhTbmZCZWVsaHVmcm9V?=
 =?utf-8?B?Q3ltd3pYbGJpUWdTMk5NR3g4NTJmTWNzbDE1bHRTRWFHeXBGd1A1ZFdPbGU5?=
 =?utf-8?B?Z3FmYVBXZWd4eXIxWGJhZ3lXZWlaVjFiU0FseVE5bUk3WHF3TnBVUDcxU284?=
 =?utf-8?B?MnQ0bEVNeXd0cFNSbmVyWittMlY5anhaREw0T2s0Q3NNcjRhSkxIM21UL0N4?=
 =?utf-8?B?MnpuSjBudURiaFE5U2ZmL2VTYVZWT0VIR2JKTVBlSlczbm5RRnNjTWpsV3ZR?=
 =?utf-8?B?VkJLYnRCQXNIUlp6RjEzODY3MDFvOUlqU21XdEpEK3k4WGhLYkdRRjVKKzBr?=
 =?utf-8?B?a2lpaTJXMHVZRWRDSEtxTlFQSEo5cFNzeWU0K2JYelJGSzA4cmZvcnRzUUR5?=
 =?utf-8?B?U0J3c25SNjdPb0U3NkhNZjRPK244NSs2eUpDalduN1JGYTJTczJBRHVIbE5j?=
 =?utf-8?B?V01sOFVZa3BXMUcvQUJibTdiYjdlejF2MlU1dys5MHY0OWE3WFRCOGlQbWxq?=
 =?utf-8?B?d0F0SytyZ0o5QmxvODdlL1ZldTdzQm1SRzFJR2tHTHpldUY2VlcxbFlpSnp2?=
 =?utf-8?B?TzlWS3MxaTJnNzZKdDl3L0ZBT2VROHhkSDhxZGZmb0haMG9NcTFGdmQ4Wnd4?=
 =?utf-8?B?ZDRGQVIyb3htYk11RWVtcllQVGhhYXhiV0VLYVpvOU1sa1B0Z0Zabnh0VGlM?=
 =?utf-8?B?KzBwdEtIa1p2TEcrb0dLM0xkSUFTQjN5eWVibjhBOVJ6d2MrK2FkYjUvSlhY?=
 =?utf-8?B?UEMwWklrcmh0dEVhM3ZqeG04d0ExWVNzd1RXNGp2N0s1VUNlWUJCZzFQbVJ0?=
 =?utf-8?B?TG9zSWlPRTI1VVJ4ZTVKS2xvUHJGOUNaZmpSMU5hVWQybm11MTlMZUVNam9k?=
 =?utf-8?B?dldRV1p5bzN3cjZtcGNaSEJmRWdYWnBFZTNHNmR2R0I4cEZlaGh4RnZIcWc2?=
 =?utf-8?B?MHZ5Sk5OU3B0aDI3b2FPbTBJZUV5TElMNEVxbDd1ZWh6YVR2UWlVaFFKaFNK?=
 =?utf-8?B?S2ZLdGNmU29ROVNIUW1qRTd5MHBYVnJFVGswSXFTeWNDVHBRTHdtOWV0OVZY?=
 =?utf-8?B?bVIxK3F2TmRWdi8zVWJ3TWo2eEJBWFpJSGZ1ZklPdE11RVhzMTZsQT09?=
X-Exchange-RoutingPolicyChecked: ALQhvGKdEknddfamx3Q+JA8GoYclXvsS0zq5/MQkTgtMAdqDNRnQESJLlvKqI4Peb3IoIV972Mfrp6JRVtNYvaLE/RaQBpSrHvMou+87gUaw/SFVbz+Z8nqKPyfLMgO0ql9DGVvdjuSxi6PX+lE4gnmS4UAcL4uQWtCuXk+MsmTtY3w0CofTsnv/vq5V1/HyFqZNFuz118mf+MC+S2ujHvp6Tw/50SGHSPzhbuV/aAmqE3G75ECJDhcdh74yhVr2IH0+aLtuQoNeyJ8/eA7RlidfmzUTkH+mgbPiZh6vnAaD7802QkHF/tDWWjBqtgj3XuS3a8r5ywxx9oxVypcW1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a6e0ea-c78d-4148-3c2c-08dea41c405b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:17:18.2781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5BbUXyYVsXwvptQQboQj5Yxt41JVk9JUtMzsgTO5GEkU8LW/1UQTC11Ojnp8dMVWYbn18UI+aesyxPQCJZzqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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


On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> Add decoding support for the eDP data rate override field introduced
> in VBT version 263+.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 7785e9e82b1f..6c0273aeecfc 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1121,6 +1121,39 @@ static const char * const hdmi_frl_rate_str[] = {
>   	[5] = "12 GT/s",
>   };
>   
> +static void dump_edp_data_rate_override(uint32_t edp_data_rate_override)
> +{
> +	int i;
> +	static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
> +		{ BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
> +	};
> +
> +	edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
> +
> +	printf("\t\teDP data rate override:");
> +
> +	if (!edp_data_rate_override) {
> +		printf("(none)\n");
Nit: Add a space before (none)?
> +		return;
> +	}
> +	printf("\n");
> +
> +	for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
> +		if (link_rates[i][0] & edp_data_rate_override)
> +			printf("\t\t\t%d kbps\n", link_rates[i][1]);

Nit: '%d' -> '%u' ?

Both can be fixed during merge. With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +}
> +
>   static void dump_child_device(struct context *context,
>   			      const struct child_device_config *child)
>   {
> @@ -1281,6 +1314,9 @@ static void dump_child_device(struct context *context,
>   
>   	if (context->bdb->version >= 256)
>   		printf("\t\tEFP panel index: %d\n", child->efp_index);
> +
> +	if (context->bdb->version >= 263)
> +		dump_edp_data_rate_override(child->edp_data_rate_override);
>   }
>   
>   static void dump_child_devices(struct context *context, const uint8_t *devices,
