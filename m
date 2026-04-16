Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233FBF433D1
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 05:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EBA10E179;
	Thu, 16 Apr 2026 05:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtJFHrP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA0310E179
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 05:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776316623; x=1807852623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FoxhLcx/CzYoG24fDkjsiD948Kr8fRd8MRmLH93MCrk=;
 b=dtJFHrP8WKrOnedaor06tQL3zGKs6RxDtEQju5WCRr8azfwtgMhQSvdA
 aA3f2fFgOUzctvU0jrG7umEb0VWf1DzznTUFCSBpLGcjQU3WFPiCc2IhY
 ziarabPDZuzgcLSfc0Lv4LZKff4ZaByQcYWREI9Du2YmwBwCUiYNv4eLq
 hk0KeQr1K3g6RA0yFCWa15+o710B1/t6fVp/ZQYdNpJYR8GzShyCbGPIE
 ogw7M5lFU/qCbfXqU8rrkPmJFvEOpWk9fCDcKRUsoUopVyxH/IY/igbjQ
 RmfJtlD2zVtKFjJYG3RkkTecDIWu6sG+ceVAI4wWCiZ7Hb0FtegsfpG7i w==;
X-CSE-ConnectionGUID: 8dsBaTlYQNOtwEFv96w9qg==
X-CSE-MsgGUID: FavquJg6RLqFXMzOWoX1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77489462"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77489462"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:17:03 -0700
X-CSE-ConnectionGUID: RBplo3qQSYa9f8NvnznaxA==
X-CSE-MsgGUID: 0ecGnq0GQ6ObjmCtvHy7AA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:17:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:17:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 22:17:01 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:17:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PddlTn0JuoGnSOeizERLDnprJfPTub4SBkKLlm5NFcPm65tTOGsM641y5KMtfIYAaTpfL8etClhreY5vh0ozxmggo3J8Bqo6qOPnq5a3Fdd7BsRJNfVcvcc/n6RN0PJcV5xi4KD9MVkNQH4bdV91xgxVkUvi6NxvDHlV9rtFFxO2U794yH44b5SJoylJN+KJ4TW0jO1rC+1LWaCYhV1U+1VXVIu5sWyjShOE4Orr7NYehmjkT4/K0LxJ7POnHCshJMQshSwd3bAR3rLG15BvKa7u7cLnrknfDcNr9AaONFdzlOmPByT0ndnugLKfQ8eckgxR+ghqoD2U5a26sm/SDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZhf8JGHnGaSRh318WpHkess5JKuHVxwzNkDJ11iI7s=;
 b=LRfixaWvHjdNIMBmkVrKzbPbh3EBOdhjbMCgbto/DQqi5VAhydcraSF7ciaCrRncoSygoK4VXOQrD/eSwHad7a53UmfKhtklHWSON1Gw/IzZPIet/t3TLFU65+rY8HFCPa73C+hISwRTFMCwdtpWamQWwYe4vjboBR+WUQVGhqhLqpXkQVWolyCI9sRUVE4cluPKgMHsdYmhR3uUBKdvJzTV+9TM1yPFhphYTIgl5REhBpIQX9RJBAHs/mPTJN0JXyXAcXw12Ha+9e8qEdZvAMv24bBEEeImKeRmsAS1tEGG3Qm6zxtThoBQP/c53XVl5FJyQVkkKdCfxlizkePxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 05:16:59 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Thu, 16 Apr 2026
 05:16:59 +0000
Message-ID: <1b10d2c0-0045-4d7d-a005-3fa6f736b9de@intel.com>
Date: Thu, 16 Apr 2026 10:46:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_properties: Add skip on headless
 machines
To: sumit kishore <sumit.kishore@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260415104806.472042-1-sumit.kishore@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260415104806.472042-1-sumit.kishore@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: de9f1dbf-1054-4f2c-68e6-08de9b77628b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: dtwG/qSPlDfoZUSfZB1extRVFYIK2q3p9Zji6vG2LJCsM9iLvBpBN++JR7iSauZJ+Khme8eosKreY32y5O2KEFoQ2iMlnJtQj3l96luQWN0TRwZTCd6P6tFGLoxj2K1vc+ipxxBhvr/yqfVZlQTtq4+hG17b9kByO1OwyGEjjCq1HVgeFB8iJflTNf0U42NwBhVBwxuZMywDSm/nCN+p3URD7Y/uZ48HemPhUQXX+U8KvPQ/Kj/RMQ96MKhq1yUrUh0TJkfcVuxHnWlleCAiAkenzrj965bcmU9wgE0cDWejQFRinXPS91B1+E5refKCW0RnM4ObxP1oM/QjzXj6H67uGaEyLgmpKzIItqFYqJJmQ69WXv711WwdDmxy/s4MXZitNe+F3H9OjEbR8ZIOJuV268ZNJ4CV7m/D8F0pr1NgrP5ode5sQTIiRQl3yFIgd4iJVMMIGpvNKLs7EB7VhfWdz91b8ZK95GsA3RWRpF/aX15CGSxqb8HBYnW+/nXR05BgSYJFMEnMRqU47Ixm3WNh+fq9uLveQPN7ayavICpd1K/mSu54+nhsaGELjz7IKmgXN+Ui0yx647kj1p/mnWUQnXxy7avUqjydhHYJYcyugy5+Oqi9nw1LOcUvbByS+W+CbcFCfIABfh8wLxm2CgObSPAUPsPcqXvqntG1Noz+TYwsZ1XsYzhw+cwkhqnu8KDdJBBu3g9vuFhkvoOtINPg2mSUlXt9Mao6SCwgKyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFLK2JvMmJ1RUFkbFlMeE1rMXdzQmFmclRtVnQ4RVBTTXJaV0l3ZUN4LzNU?=
 =?utf-8?B?ZnphUzBWUStiS0ZKSFdpTkVPRGQwQzZYTjU2VzV6RlFtVDQ4TEhHQnFqUmt1?=
 =?utf-8?B?dWNubVhtbzNpZitEcml3OVArNWZyakNVMDFYRU9pbmIySXk3RUhvRU4rVlNQ?=
 =?utf-8?B?bFhtUmVmQWJoRHQzbCtkN2xTdDNHM0w0YXMrOWhGUW5QalV4MDNLek5pbkhz?=
 =?utf-8?B?bDdrK25JTnI3eGxDaXp4cWRScEFSczdlUVlLZ1pEQ3crRjBJemcvY3dxMk56?=
 =?utf-8?B?azFWZUtIRDM5dVk3a0ZCWFpXMUJQcmdtejV3Mjd0SURycGhDTWtxMUplbjdK?=
 =?utf-8?B?VXREZmJKUEFQNjR3VkVKajZpMUdXK21jR1l6NUR5czlsVXFGaUpic2ExdUgw?=
 =?utf-8?B?TGg0MmNnWHR2Z3RkZHpVbHpPZTBoSEdncXpnRUdEODRsZXpha2JBTEc5RUJK?=
 =?utf-8?B?eHljS2JhT0ZwN0pGNFdhMEVUbmpoTkVLVUxYZENvdnM5c3l6M1l1b2FPNCtG?=
 =?utf-8?B?KzBBMUoxVEt4bDZYSGlJcGI4ZVJVaC8vUlhadXZpeUNIaUtDVllUdVJobG9W?=
 =?utf-8?B?dzRhQ0prK1lUNVFZWTBPcW5TbjA3VW9UOTNXbys4UTMxdE5ycVp3RXhIRUs2?=
 =?utf-8?B?QzMzV3RjWFp0SEViMjk1eHZNNUlReis3Rk00N0ZhSTVSOUJYejlUMXRaZnJu?=
 =?utf-8?B?TjE2SCtMN01VTk1BUGwzNU9Sd3hhY0tNeUR1VEtMdzJYdGo1RURIcWNvSGlO?=
 =?utf-8?B?V0RTWC9LSlVxaGpVbmR0dzd5UWNBczlKenBkejJQQWxCZDA4b1hkYk1zNnFr?=
 =?utf-8?B?QSt4RFJ5TFlWcVFmSXlCKzFvRzhlUm1tYjkvQldUeG5QTUplS2VkRXlVK1ZF?=
 =?utf-8?B?ZU9zTERUT2hGbU9nUGZDR3ZETTE3cTVIamlKOFJFeEpMYXEyRlJNWmJveklm?=
 =?utf-8?B?ZStPMXhZNHd4K1RuRnFnRGdKbU5ibW40aXJyMnc3NjFpUVE2WUx6TmExaFJ1?=
 =?utf-8?B?WFdNbzhkUlRoNTJyaHhIbzhGZG82NmMvbDFoT0FaY3NKS09rKzkvS0FkR0JV?=
 =?utf-8?B?aVBydXlxcE9MY1lvZmovUkhLR0Z1Q2ZseWdJR3lUazFCenZ4VWJLNEJBazdu?=
 =?utf-8?B?eDh6dGV2MkZBR01MWDZSZGpUejY3M0VrVXhZK1JTODN5b3kwYXFNcmVCaGgv?=
 =?utf-8?B?b3cyVmNkajVGdUNudENVdHFwWkpnMXpjM0tuOHNDby90YWNhZDZIKzV0dXRr?=
 =?utf-8?B?QS9zQ25RUE1rNWxwVTl1RUdpWThxYTFNai9zMzdOclozSmtLSnJOeEY1MFJs?=
 =?utf-8?B?c0NOTDVIM3ZicjJwNXRaWnBNZ3VhQlF3UThXTTZ6ZjNXSGZ0NC9LSkFVMlNL?=
 =?utf-8?B?NWc5M1I1NC81clBUYmE5R1FpUzl0Ylp4RzYxbWZBOEJjaHI1NERVTVgzd01O?=
 =?utf-8?B?UmsvOERaYTlFUllpeDdlOW5JL3NZRHpmQS81Tmp5L05ZREpmZWlVTXFWM2t5?=
 =?utf-8?B?OGRpdG4zYUQzRUN3RkdyV0NRMjNuRnNUSWhVdzMwamZwRExMY3NJWGdHUVdK?=
 =?utf-8?B?YTFlNFIzYnN2VngySVhuQ2RsWTBUWXlwWUQweEhpSi9IQ1Z4SGVuS3F4TEZT?=
 =?utf-8?B?RGZ2Q1ZUS2VScHdvQ1JodmlBZ2loc1dWcFhweVFKNmdqMWh0dmNUNVpQT0t0?=
 =?utf-8?B?L3RDVEJyUzZzOFA0bCtSRHNsL3VFQW5IU2VDSUZNRTRFeWNDT3U0ZEhSY3NP?=
 =?utf-8?B?em1VUlgrMWcrOUNIcytoTnBtd0Y1UlREZEMySm4wNERmNndPa3ZlZGx5V1VG?=
 =?utf-8?B?S2lSU3FvV1czWFZsTkRpWmxReGZMY2JISWJvb0IwK0hhWGlLcVZBckRJNnAw?=
 =?utf-8?B?OW1uUXZLYXVrd3FsVjNTSnhWVitrL1ZtUzVYZTlLeFEyVk5KTGRVWVVOTkFa?=
 =?utf-8?B?aWZrVmx6dmVaRytrODQ1Zm9lKzhtU2FLc0RVVjFrRGpZZ2tjZmx4MlN2cjhY?=
 =?utf-8?B?bHFKTitpclhpSjEvWmRFbjdGMi8ySk1KUnUzRk9ibnUwbWxOVFRJQnprbzhv?=
 =?utf-8?B?K2IvcXlaZGx4RndCSWU0MklMRDlFK25admV6djRtY2tQNGRvRG5ZL05aOWd4?=
 =?utf-8?B?K0JmZ2FLenhIR0Q4RzArOFNoRGNtb2dmUmI3aFlqdDc4bGhHa2wrNkptUmts?=
 =?utf-8?B?R2N1VytDQzJxWkZkV3l5b3BvQnBxS0kzQmZNSE8wdmVLRVN0STBNQkRPU3Az?=
 =?utf-8?B?YnRKRzBJMGp3UmlRVGdzSkFXL25KbkhPOHRUaWZtanRoOFdmS2ErS0ZGZVVG?=
 =?utf-8?B?MStWZkZ4L1VrdXlpY293T0dhNnF2RTh4N2l6MkFMQXBzNEw3QWt1UT09?=
X-Exchange-RoutingPolicyChecked: cKdlDM0NaDG84hVLrKfcuDKnukEOPvOFCauIavRalzaj7DvP+o2eTezmqZgAbLcwz5ksLz8u4uGtMnngGJDa+TD3uXvGycofVog2ggsDnYdogi7W4Rg7mD3oV1bbbMybN9NiDuR5cwN/SokzSC7CvDm4RT0smBiu8EO5c5DkdQIUq/U3BDzYI7/InwFEKFtVTeV44cyznswfVxVlRxdPGmgHogDBG6y1l6lplk6v8bolRmDiGiVoGF1T1IgFXER/I2qg2Wjf21zexM1HkK4aYULD8leK+PyRC1tE3oIg+PfMfUocvAhS5ke5QtL/vZE5fIBa+s05gqkIjpQt6CJInQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: de9f1dbf-1054-4f2c-68e6-08de9b77628b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:16:59.4086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC5JwdJFNPT9BsReRoTjgVaZ9LR1Y/n1esWViteaDocYoGM5RyhcUywrys6U3VYOkp7OOir79dWepbjPe53smQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

Hi Sumit,

Based on the review received on v2, it would be better to verify on 
headless configs first if these tests are running and if these checks 
are really required in the first place.

Thanks and Regards,
Karthik.B.S

On 4/15/2026 4:18 PM, sumit kishore wrote:
> From: Sumit Kishore <sumit.kishore@intel.com>
>
> Skip the sub-tests on headless display systems.
>
> v2: Use existing library function, instead of
>      defining new (karthik)
> v3: Add headless display check in,
>      colorop_properties function (Pranay)
> v4: Update the commit message (Pranay)
>
> Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_properties.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index f735839da..5164277b3 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -341,6 +341,8 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
>   
> +	igt_display_require_output(display);
> +
>   	/* colorops are only available with atomic */
>   	igt_skip_on(!display->is_atomic);
>   
> @@ -377,6 +379,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
>   
> +	igt_display_require_output(display);
> +
>   	for_each_crtc_with_single_output(display, crtc, output) {
>   		igt_display_reset(display);
>   
> @@ -400,6 +404,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
>   	igt_crtc_t *crtc;
>   	igt_output_t *output;
>   
> +	igt_display_require_output(display);
> +
>   	for_each_crtc_with_single_output(display, crtc, output) {
>   		igt_display_reset(display);
>   
