Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D35AC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 09:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1860710F4AC;
	Thu, 28 Mar 2024 09:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blj5XirV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE710F4AC
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711617528; x=1743153528;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/8ACJzOnw9ZLlsToM/AApwX/IcWRngY0OweeATEjBF0=;
 b=blj5XirVEMMsaeK3hhXQL/RHsIc3xpDdMIcELAlzPyjNfgf/ZtnF7YPr
 REcdlLa1dsgqpluddhMZpSmWqPrAaWCrEw6s/ConRd22TwBFDc/w7e/WN
 DPiGm6UT51c++ZN+apGIF6fkeInNha6TVy95+FVkGacPdGOq7KjumwA/d
 /I5xn5QENJB43/y11hiOO37aB0kUH39AKUEdx0YZvL+NMzP8rSPYrVyei
 RDMdIsk86VkUF43XcRgVxt61PLLuXz3xqdIS7PMD49dsBZXb0wplQSeCO
 vMg4iofzZnduEy7M/Mc3Jd1egQW/rMN/1hvGUmgtccltNIhHq1+lOzrQ1 Q==;
X-CSE-ConnectionGUID: g+7JO6lZScWY8JXE7xAiDQ==
X-CSE-MsgGUID: P/lO6M1RTeuOadZwRVs2RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24208748"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="24208748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16998053"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 02:18:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 02:18:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 02:18:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 02:18:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 02:18:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g81hta8vg8WegCj5gxgl/HUKuz6o/okziNKsxXVXnB6/TX8JgiLUpn+txufXa46YGpbm6/R3PjKBuWRDCrDimNZYpJbWrVXgTmRU2Sc47NrBwLaW1p0sph2aBVHlZdy1iqwLRXDBKdQjcjqMGN72y7YBrwwE7jZnE9pKoxe5NLdWDPGfOJnAz7T6ReOxkmBCBMBKfqJu89L86ElvVzdIRXYTgYmI5s/QbN1QFYk+gxY0vgwVopDyPkApHUhFwe/cZzsummaaCTTCVXXP9Gv756jeHqpdtPiGeTo94/L/plf64vjBLDcjnSxYBYTFbNja7m+d3/GIdWvyGnoMcZBMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSg8drPnsE4Fbozsgi9IqkOytkcwa41K15emY6pRmrk=;
 b=oCkQVWrlE1I/l+BUrt4ls2CzmNaSNgAXrCR4zPFnQwkCWrgMay+3CRiiYCZi5AzA1hxW3OoksWD6ylawdmLfbBjkkWytuooH7YVZXK5rF1AdG0BPpSlJuHo2uHabviN/GUNKZj7R8mQ1tax+CGkgBKirxMBEoXz31+d+eKeUyz0cyh5JUdCmHviwlb7WVfFVj200JWBVOcn6s4CIAo1ZI0Gl3/cmjZKOD8bP3x90t5tYbScbGAKPnkxJtH80SSBEgXhpiwzqPSnHFtjuVE7g1wGqhvN2qm3ShkqtUGDZaKVoo1yV3wRWgePkd3+UW3eAK1AUdTADU0FUdAP9AsGGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 09:18:39 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 09:18:39 +0000
Message-ID: <284149e7-6f4d-4c55-a619-f48ea1198808@intel.com>
Date: Thu, 28 Mar 2024 14:48:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240328083939.1361225-1-kunal1.joshi@intel.com>
 <20240328083939.1361225-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240328083939.1361225-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: a79e3d7d-df30-432d-2e12-08dc4f080e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +o6s5Iq9oxkh27fsulRzvsXwhiD/p3RI7vQ/T/C4sY6DfckYDtpsyTV3TNAOduXFXnvvIt9qzIWMpk/Yb1eWIYx1njZsLqR262UAWdqB9QAX0oy+LNYzYP9pyEgKfPvA8wLX4d0G7ApCwtbWNzpVcDtf3BYFRRRN3lNUyPS+2cRZdtuqv6zxBnfVAUERWrMa6R/o5ci2RU1KlU4M6fGpUWK+r6/RmmHFi9dauihmbAmSxydn4Tw0Dcpd43Lz1Jw8IWGMaqqOdkfOZigPUE6RMiCfy9mxwXUWAoa3A9DtR0dLyfhSB2XUUoIwkGlbdzW5XXg3X5y/60IVKZ7v4HtpOfjgc29KQOUrl4UXGXabh20YEO2Ur2Ltmryxqdit0+zAIy1/elAnOMPr/w8TZxdA3uKz0+R78ma7oM2/GjGVz9hcErzMVWGr1L/Gg+7y5VKu0x3OdCem6S/4C7W9jLbqOsvwIadnlxWOcyVBTMdHz7LEYaWrKLW0LtYtpfDKEJhkncY5j/YrALVmwHi12YosUpjefbEYiR+L8O0ftTowDqaQV2b8zwrnX89qRN/cf9PhpD3B/D9LbX67Srvn7kKzfXuFKvSk1WXr5jRMmrbEI/bhFGboc7Vv9eIGLdfc4Y/FkEDlPKw7QPK1MKuUdiHkyotjohPiE2QTqheSgYZiEHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2JoaWRiSFgrWnlOYTZpTmVYVFV1ekp4MkN5UW9ZNXN3ZmN2WE8wMzZmRWh5?=
 =?utf-8?B?SlhzWXJRRVZNRE4vbG4zUlR0MzRacTJWcElwREtpdFVvNHhBWlg2TkRKay9r?=
 =?utf-8?B?VWhQMWhzTkV4dFNKemM3WFk5NnBpUm4xVHJKakRTN1A2bG1mWlRxM2gyTTBE?=
 =?utf-8?B?T04rcEd6MTgxd2dqUEVtbFdXNllLNExybXBXdHRlWndQTzU2akVyalQrLytL?=
 =?utf-8?B?QzdGT1JRRG0vMHVodmQycURodDFnVTloQWxqM3lCb3VnSjlMMjZWOFdaeHhJ?=
 =?utf-8?B?eVcyREJkbjB5OCtvUDNXT2E1eWNWV0JsM3hHUU5lK2gzL3g1WVdvZWxadEcw?=
 =?utf-8?B?Ni83N25oTThucFJUUGJQR0hmQ1VjbG4yNUVNci9EM2NSa2RaR242YS9oQ1N3?=
 =?utf-8?B?Mlh5U1o4dHVIbWFUcXJmYUxhdFcxTC93SHZIbElPZEVCVUNZVm5OUVVhYkxW?=
 =?utf-8?B?ZXhKWHdSbHVndFJla3dYV2puWVd5OTVWcm4yNTJGejUxY2ZHR2R2bFdWWTMx?=
 =?utf-8?B?am11KzJwOENQN2Jka3VJU1FYVXpJL2NMNFMvMjlUSWJjeENyRFJyVUJEcXpv?=
 =?utf-8?B?M1Z6a0FuUkNHRHhJb2FZQVJ4TVNtWm5VTldTaW5qM3lodHF2NEtRTlREMkNo?=
 =?utf-8?B?VE1CZUUyY2FHT2dCamFUNlZlNVV2YlBmc2RKNzRNdmJkb01RUUYxVnZuV0dy?=
 =?utf-8?B?aytXZGJiQ3ZFL3FQZDhwMWZrcHRVNmw2Vld6ZkFEWHhxS2dldURsbEc1dVhZ?=
 =?utf-8?B?b0lqVEZHbVZLaWh2WEhvR25LOFA5eUIybCt5OHRIQkdxR0I2bzJKUTlVbnVN?=
 =?utf-8?B?R21qVkExaER3TnU5MVY3Q0NORnRHYVlHWmxOY1VTSWtpVVl1bGtlakdsK1VZ?=
 =?utf-8?B?NG9IeU9IYmhiSDFpWGZxWE9HVklCalpKYlp5OHJTWVZZSEdvS2FyWTNtNXZ1?=
 =?utf-8?B?K1dpZVJtTlFVZXRCZlBmeVpHcmxHTXhKbERXaXZveWJOVkY2RFo3T25mS1V0?=
 =?utf-8?B?dGNjcTluSjRWeUhjUnRTN0laWXZTNGRqTlNjWFVjNWM2L1BvcEhlWEVZclVF?=
 =?utf-8?B?MHlTb3VOS1pxUTNpbUpjeXd3TUx2QURiMGFYdGg1UU9TUXBBUGpGTzhiWU5k?=
 =?utf-8?B?RHMxcFVZTGE1TDBVZC90RjRiT0ZhaW9vWE5MbDlGRnN2YjNVREUxUi9qMHQ3?=
 =?utf-8?B?WENDNy8rTHdlWTZXYmJZV1EzOG1oTVI4RXc0OEx2cFBSTUdWRGRzbEo5V21Y?=
 =?utf-8?B?Y3l3Znc3UUtKSG5RU0FmSmhTNkNXZHVCSWtYR0RveVN4bnJEamw3Tm0wQ1c1?=
 =?utf-8?B?ZjV5SVdwNEhBUlZtSEtBQXRnR2h5ejNFM3Y4ZXcyM2NBbE1uVm5DWGxKMk5S?=
 =?utf-8?B?UHJha2NSSm8xSGNZbzJJOVNhdk9CYnpPczRkYnR0d3hpMnJNVnpKc3NKeVZi?=
 =?utf-8?B?OTE4VEM1RElxM21qWEE2NGI4S3IxWHNCaVhzQ04rYXBvTEx3LzBoLzhHaFNO?=
 =?utf-8?B?SjBNdmtpMGtiZHYzbmd6RzhGaUl5MllBclM5dUlzb3g4THIzS2JYNDJrZE9l?=
 =?utf-8?B?YkZoVVc0K3YxSTIyM25NTUNqRk05enNnRGwvRTVIN1YyZWZUVFF1U21oMEM5?=
 =?utf-8?B?TWw1eEVLaTA0TEJqUytRVlUrNmRHRHp4UGtrdVdLaVV5ZzRhNVluMld0Mzd0?=
 =?utf-8?B?RzZ0ZkxKb3ViVmU3aVd4S3c3eVhkMVFzYXlLNVBsYlllQ2JoeTRHMlROUDdO?=
 =?utf-8?B?RkZtb3hlekFQSm9yMlM0S05EVmo3K0pTSEJ5d2tBNGFBTFc0anAzb0dFemw1?=
 =?utf-8?B?QklYSTFRSXZNTVFvMGtCQ1l6ZjVmQ0FVK1ViVUl5dDY5SGtNUDBRQ21nejBK?=
 =?utf-8?B?cDBoREVRWHR4TS9VY1JYZ3FDNUorSDZJM2w5NWx4aHE1bU1LY1dKaXJPL05Z?=
 =?utf-8?B?MzM2UlFsOFRKUGFOdm84RExLSlRTQ0VickpMN3VZbGVpUkRRNzNkVUh5bnUx?=
 =?utf-8?B?UHBSUGhKKzRZSDA2UWtjd0JFUEtLbklUblJONVoxS1ZSazFjT0REeW9HQ3BJ?=
 =?utf-8?B?OWlabjMyejBHT3Q4eTN4TGZzZnRZR2VEL3oyYzUxOEpiQk9pQ0MxYisxOXR5?=
 =?utf-8?B?a0tiU1FMdjhFZjd3VmhtczcrTzdWVkRDWUhPV0REUkZYNzN6QzBRLzJKRXlL?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a79e3d7d-df30-432d-2e12-08dc4f080e08
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 09:18:39.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFsJazi23/8wF2ai7/OX8V6whf6jLbE3TvtvIv4Q2sAv29fegaioNB6G4HhpKqNbV13LgX7dDCkp8HV9mvR2KlPuZx/N8oFkumMISmEQjyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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


On 3/28/2024 2:09 PM, Kunal Joshi wrote:
> modify test to support simultaneously testing multiple bigjoiner
> output and ignoring fused off pipes.
>
> v2: Don't change license (Bhanu)
>      Print the pipe name (Bhanu)
>      Remove unwanted commit (Bhanu)
>      Move combine output logic to igt_fixture (Bhanu)
>      split revamp and force joiner (Bhanu)
>
> v3: Ignored fused pipes (Stan)
>
> v4: Ignore master pipes who doesn't have slave (Ankit)
>      Retain subtest names (Ankit)
>      Use commit instead of try_commit (Ankit)
>      Fix typo (Ankit)
>
> v5: Fix condition and remove last pipe (Ankit)
>      Remove nested if (Ankit)
>      Use pointer to output instead of id (Ankit)
>      Add missing igt_describe (Ankit)
>
> v6: Use uint_32 (Ankit)
>      Cosmetic changes (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 402 ++++++++++++++++++-----------------
>   1 file changed, 207 insertions(+), 195 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 99b1b898d..bc4facead 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,177 +44,236 @@
>    * SUBTEST: basic
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> - * SUBTEST: 2x-modeset
> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>    */
>   
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
> -struct bigjoiner_output {
> -	uint32_t output_id;
> -	drmModeModeInfo mode;
> -};
> +#define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
> -	igt_display_t display;
> -	struct igt_fb fb;
> +	int big_joiner_output_count;
> +	int non_big_joiner_output_count;
> +	int mixed_output_count;
> +	int output_count;
>   	int n_pipes;
> -	enum pipe pipe1;
> -	enum pipe pipe2;
> -	struct bigjoiner_output output[2];
> +	uint32_t master_pipes;
> +	igt_output_t *big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	igt_display_t display;
>   } data_t;
>   
>   static int max_dotclock;
>   
> -static void test_invalid_modeset(data_t *data)
> +static void set_all_master_pipes_for_platform(data_t *data)
>   {
> -	igt_output_t *output;
> -	igt_display_t *display = &data->display;
> -	int ret;
> +	enum pipe pipe;
>   
> -	igt_info("Bigjoiner test on ");
> -	for_each_connected_output(display, output){
> -		enum pipe p = output->pending_pipe;
> -		drmModeModeInfo *mode;
> -		igt_pipe_t *pipe;
> -		igt_plane_t *plane;
> -
> -		if (p == PIPE_NONE)
> -			continue;
> +	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> +		if (data->display.pipes[pipe].enabled && data->display.pipes[pipe + 1].enabled) {
> +			data->master_pipes |= BIT(pipe);
> +			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +		}
> +	}
> +}
>   
> -		mode = igt_output_get_mode(output);
> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
> -		kmstest_dump_mode(mode);
> +static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
> +{
> +	if ((data->master_pipes & available_pipe_mask) == 0)
> +		return PIPE_NONE;
>   
> -		pipe = &display->pipes[p];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	return ffs(data->master_pipes & available_pipe_mask) - 1;
> +}
>   
> -		igt_plane_set_fb(plane, &data->fb);
> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	}
> +static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, unsigned int available_pipe_mask)

Here too available_pipe_mask needs to be uint32_t.

With this changed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>



> +{
> +	enum pipe master_pipe;
> +	uint32_t attempt_mask;
>   
> -	igt_assert(!igt_check_bigjoiner_support(display));
> +	attempt_mask = BIT(pipe);
> +	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (master_pipe == PIPE_NONE)
> +		return PIPE_NONE;
>   
> -	igt_display_reset(&data->display);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
> +		 kmstest_pipe_name(pipe + 1), output->name);
> +	igt_output_set_pipe(output, pipe);
>   
> -	igt_assert_lt(ret, 0);
> +	return master_pipe;
>   }
>   
> -static void test_basic_modeset(data_t *data)
> +static void test_single_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	enum pipe pipe, master_pipe;
> +	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_output_t **outputs;
> +	igt_fb_t fb;
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output = NULL;
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
>   
> -	igt_display_reset(display);
> +	outputs = data->big_joiner_output;
>   
> -	for_each_connected_output(display, output) {
> -		if (data->output[0].output_id == output->id) {
> -			bigjoiner_output = output;
> -			break;
> +	for (i = 0; i < output_count; i++) {
> +		output = outputs[i];
> +		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
> +			igt_display_reset(&data->display);
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
>   		}
>   	}
> -
> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
> -
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output, mode);
> -
> -	pipe = &display->pipes[data->pipe1];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
> -	igt_plane_set_fb(plane, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static void test_dual_display(data_t *data)
> +static void test_multi_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	uint32_t available_pipe_mask;
> +	enum pipe pipe, master_pipe;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[output_count];
> +	igt_fb_t fb[output_count];
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output[2];
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane1, *plane2;
> -	int count = 0;
> -
> -	igt_display_reset(display);
> -
> -	for_each_connected_output(display, output) {
> -		if (data->output[count].output_id == output->id) {
> -			bigjoiner_output[count] = output;
> -			count++;
> -		}
>   
> -		if (count > 1)
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = data->big_joiner_output;
> +
> +	igt_display_reset(&data->display);
> +	for (i = 0; i < output_count; i++) {
> +		output = outputs[i];
> +		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb[i]);
> +			igt_plane_set_fb(primary[i], &fb[i]);
> +
> +			available_pipe_mask &= ~BIT(master_pipe);
> +			available_pipe_mask &= ~BIT(master_pipe + 1);
>   			break;
> +		}
>   	}
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	for (i = 0; i < output_count; i++) {
> +		igt_plane_set_fb(primary[i], NULL);
> +		igt_remove_fb(data->drm_fd, &fb[i]);
> +	}
> +}
>   
> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
> -
> -	/* Set up first big joiner output on Pipe A*/
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output[0], mode);
> +static void test_invalid_modeset_two_joiner(data_t *data,
> +					    bool mixed)
> +{
> +	int i, j, ret;
> +	uint32_t available_pipe_mask;
> +	uint32_t attempt_mask;
> +	enum pipe master_pipe;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
> +	drmModeModeInfo *mode;
>   
> -	pipe = &display->pipes[data->pipe1];
> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = mixed ? data->mixed_output : data->big_joiner_output;
>   
> -	igt_plane_set_fb(plane1, &data->fb);
> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
> +	for (i = 0; i < data->n_pipes - 1; i++) {
> +		igt_display_reset(&data->display);
> +		attempt_mask = BIT(data->pipe_seq[i]);
> +		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* Set up second big joiner output on Pipe C*/
> -	mode = &data->output[1].mode;
> -	igt_output_override_mode(bigjoiner_output[1], mode);
> +		if (master_pipe == PIPE_NONE)
> +			continue;
>   
> -	pipe = &display->pipes[data->pipe2];
> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			output = outputs[j];
> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> +			mode = igt_output_get_mode(output);
> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh,
> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb[j]);
> +			igt_plane_set_fb(primary[j], &fb[j]);
> +		}
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			igt_plane_set_fb(primary[j], NULL);
> +			igt_remove_fb(data->drm_fd, &fb[j]);
> +		}
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
> +}
>   
> -	igt_plane_set_fb(plane2, &data->fb);
> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
> +static void test_big_joiner_on_last_pipe(data_t *data)
> +{
> +	int i, len, ret;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +	drmModeModeInfo *mode;
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	len = data->big_joiner_output_count;
> +	outputs = data->big_joiner_output;
>   
> -	/* Clean up */
> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
> -	igt_plane_set_fb(plane1, NULL);
> -	igt_plane_set_fb(plane2, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	for (i = 0; i < len; i++) {
> +		igt_display_reset(&data->display);
> +		output = outputs[i];
> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +		mode = igt_output_get_mode(output);
> +		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +							  DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_plane_set_fb(primary, &fb);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
>   }
>   
>   igt_main
>   {
> -	data_t data;
> +	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
> -	int valid_output = 0, i, count = 0, j = 0;
> -	uint16_t width = 0, height = 0;
> -	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	data_t data;
>   
>   	igt_fixture {
> +		data.big_joiner_output_count = 0;
> +		data.non_big_joiner_output_count = 0;
> +		data.mixed_output_count = 0;
> +		data.output_count = 0;
> +		j = 0;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> -
>   		igt_display_require(&data.display, data.drm_fd);
> +		set_all_master_pipes_for_platform(&data);
>   		igt_require(data.display.is_atomic);
> -
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> @@ -228,105 +287,58 @@ igt_main
>   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
>   			if (found) {
> -				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
> -				count++;
> -
> -				width = max(width, mode.hdisplay);
> -				height = max(height, mode.vdisplay);
> +				data.big_joiner_output[data.big_joiner_output_count++] = output;
> +				igt_output_override_mode(output, &mode);
> +			} else {
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   			}
> -			valid_output++;
> +			data.output_count++;
> +		}
> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> +			/*
> +			 * Mixed output consists of 1 bigjoiner output and 1 non bigjoiner output
> +			 */
> +			data.mixed_output[data.mixed_output_count++] = data.big_joiner_output[0];
> +			data.mixed_output[data.mixed_output_count++] = data.non_big_joiner_output[0];
>   		}
> -
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> -			pipe_seq[j] = i;
> +			data.pipe_seq[j] = i;
>   			j++;
>   		}
> -
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic") {
> -		for (i = 0; i < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> -				test_basic_modeset(&data);
> -		}
> +			igt_require_f(data.big_joiner_output_count > 0,
> +				      "No bigjoiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_single_joiner(&data, data.big_joiner_output_count);
> +			if (data.big_joiner_output_count > 1)
> +				igt_dynamic_f("multi-joiner")
> +					test_multi_joiner(&data, data.big_joiner_output_count);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
>   	igt_subtest_with_dynamic("invalid-modeset") {
> -		data.pipe1 = pipe_seq[j - 1];
> -
> -		igt_display_reset(&data.display);
> -		for_each_connected_output(&data.display, output) {
> -			if (data.output[0].output_id != output->id)
> -				continue;
> -
> -			mode = data.output[0].mode;
> -			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, &mode);
> -
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(data.pipe1),
> -				      igt_output_name(output))
> -				test_invalid_modeset(&data);
> -		}
> -
> -		if(valid_output > 1) {
> -			for (i = 0; i < data.n_pipes - 1; i++) {
> -				igt_output_t *first_output = NULL, *second_output = NULL;
> -
> -				data.pipe1 = pipe_seq[i];
> -				data.pipe2 = pipe_seq[i + 1];
> -
> -				igt_display_reset(&data.display);
> -				for_each_connected_output(&data.display, output) {
> -					if (data.output[0].output_id == output->id) {
> -						first_output = output;
> -						mode = data.output[0].mode;
> -
> -						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, &mode);
> -					} else if (second_output == NULL) {
> -						second_output = output;
> -						igt_output_set_pipe(output, data.pipe2);
> -
> -						break;
> -					}
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
> -					      kmstest_pipe_name(data.pipe1),
> -					      igt_output_name(first_output),
> -					      kmstest_pipe_name(data.pipe2),
> -					      igt_output_name(second_output))
> -					test_invalid_modeset(&data);
> -			}
> -		}
> -	}
> -
> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> -	igt_subtest_with_dynamic("2x-modeset") {
> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			data.pipe2 = pipe_seq[i + 2];
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> -				test_dual_display(&data);
> -		}
> +		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				test_big_joiner_on_last_pipe(&data);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false);
> +		if (data.mixed_output_count)
> +			igt_dynamic_f("mixed_output")
> +				test_invalid_modeset_two_joiner(&data, true);
>   	}
>   
>   	igt_fixture {
> -		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
