Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C03C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 13:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91F10E314;
	Mon,  6 Jul 2026 13:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lb9tBuIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D296510E314
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783345936; x=1814881936;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q+NM5t3tKuUeSmghHu7E4K9JNSGDeGAKC6Pz0pvbh+4=;
 b=lb9tBuIsepNeQiokoFo2mXvXlb0vhmPOTt7/CBf7oNI2WEYh/AMSWMYV
 kZiOstoW3hSAfGuNN2co6qpxOFgv9zvMTc3MokSBL1F4jn4h8CgKJiR0e
 5sR4QVhd+czdWGE7Be95kksOdS422BS1aMhBXbwERva4kGhtA8fvDWvcF
 IlQBSFuGIaRHeDP1l50gu6rQSbi/aDkMkGXcMME2SLh1nDbx3ABgWtDNB
 CYb0/KbCtMvjz9ciMT2+Lfg2uOGlw1+N63mHqrl7nPuFfDRVH836YSfkA
 ve4XbU7oBQmbBZzGYjBAMNMQPBU7XDR2iK2W5zjjdLM8R7QI5Z+0rPIiP w==;
X-CSE-ConnectionGUID: Czd7jqnIRW2f+kB08Rn0Fw==
X-CSE-MsgGUID: lZOWYxRwR7KWY4unH8BxXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84169274"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="84169274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:52:16 -0700
X-CSE-ConnectionGUID: TFxtxemrSnKEo2IqtUjDFA==
X-CSE-MsgGUID: WNezbAMhSv67rqTwT2bysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="278069920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:52:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:52:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 06:52:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXim9dqBN976r+vHcRAZqkFDi7HExQYRgBIAJexlhyHZcQltLL5NNIP4gD+u69BGFD6ALabCEMlGaOHCMZvybFP62q69Gij+0HsmuyFyscGVRluBL/UyVMvL+e5C+EyROgm/ERKzkMWOCnKUHuipGVDzuwIl0sSu3wVLr6I8iv9+Zt13vXVPHUsVwfLSuPkootnp2tfJIHY74Nz6motW39QIQIpeVxcfefTsdedNJ6wOy1v3JWo8d+ghTj3O7a4VixXxeFmzsNvn/53JhDQrOC4NfBZaoPTQjUCVuTjTs8LliMI3mOpqOby7OQqgRcBioC+YqjnP3jl7rVaBFpv1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEiBF98NdXweaXpq1Ss+te/UzsKHwllG/aaBnIHvc8c=;
 b=WiUPpVbc8goKgVxqd8K/8dgQBYQTumBhAsdHL8vzE9xwBEHcAkMOljFHmb4JkD2QLxGYcjG9iBs3pJgo0UAy3F8PsGezP0Uc6VQ45HlGR1I1A9No7o58/PhLkHIvU5/dHx7lTVKsE25SALNM3n2QiCiPu05x2h/GSPh4eBXvi5p3iggFd5Abcc1CXAEvWgK7CWN6yfsPhzuFfb3u8AhpYQ4ZbQ29S4oClaOsqshUp785iZG1Toy+TOb0tKPfI61hsGdit6+jTSualDS3zv62WLvIKB2MFtw4nSM/+s2JEggWR9LgZF9JP7yY7Fo6HceEEgwirxk5gHVd4g+W14y+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SA7PR11MB9596.namprd11.prod.outlook.com (2603:10b6:806:4d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 13:52:13 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0159.012; Mon, 6 Jul 2026
 13:52:13 +0000
Message-ID: <de8daaa5-f294-4a6c-b75c-39b976aa719a@intel.com>
Date: Mon, 6 Jul 2026 19:22:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Skip mirrored pipe
 combinations
To: <igt-dev@lists.freedesktop.org>
References: <20260706050837.3897774-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260706050837.3897774-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0355.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::15) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SA7PR11MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: be434b4c-98df-44c1-ede3-08dedb65c7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: X8istmtsRUzwbszMgxU+nQe6Gh+5owX+oIW7lAxSG+0oZ//H2484BJSunCQmuSy/QfzDmAcxZfSHXe0bsmWhMNFfUUk7+eaMb1ftFdU5StS4gO90f9Uhkd/HaeaJ5FiSRL2wo1r9jg4yVfqbKe3vTcYZuJR2y6B36aMgyxe4v9IZ176lyoy6qltUM/fOcblv/o3IB72bHQSe6pWPN8H1ATj8GhbXMEk+YdmZuSi/HSUt/ZM7OkxjJQcvIWtIuG0GG3Ff52X9DRGrLaJUxxGd2J/DTYUpZD2VGv2PCcPLj7bxucJxpV3y/7PCcin4agdcZiVUpVwayG7rmROycHS7upYcu0yuwSl3W3xtdlxzE7rxrksGg12etn0qX8HFrjxysG6V2lU0RzV2S3YztRp/EBeQk0ac7n4sib7zp8EfsiolKSY1T/kkC7barguhlII2E9GZlj8qmgK2vdb7qhd68gVCNSfmWQQqiod6HsYmiWl4QPHdHByJwN1PuZ0Fu2YMsnyt42s7vuu5nh8z9DVeqg7II7Jvfb6QIGqVM+tXyhjfe8rj3ju43vWRlxJQfwbAyyfESu43zv5BykpujlMcOgw+Oifu7sbP245oLZMzD6efizXsUGv997jmzD0/YW/6Jdu9gx/XDOnW5h3o0ZZgEHykUOuGwrykO6LskAuuE50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxTb1hnMWZhZHpZK1dHZFc3UTlPcGlxUmsweks0VkgxeHYrK0FteVR6bVhk?=
 =?utf-8?B?eXdLV2FPTTJreE8vSytlcVNpSlhwZ21qd3NtbTUybTF4RFRtMDltRWdSUXRi?=
 =?utf-8?B?RVZkcDhlVzBjVXgxcTUrWTRVL2VZQWloNmg0eHhRZGJ4MVVvOHVoRVRaZVNn?=
 =?utf-8?B?bEVYcHlKanVtUC9MV2ZBczRtOEVPN3p3OEtVS29OSUZEdDdWY200Yk51ZUdQ?=
 =?utf-8?B?Qm0wRDJ2dzVJUGF0dFpPbWVNR0x2QTloVkNpaGlzazQza2g4ZHNBUjFjZHBD?=
 =?utf-8?B?bFAyaXliVzBjTTZmYnIyNDVoOW1Xb1d3bW9QdWRaMEtRSDlDK1YwM0NKcGwr?=
 =?utf-8?B?VzkxbTR1OGN3K25OQi9nM0ZwUmlJaXlzOWhQb2dEVmhDSk0yUEJ1NDFpNEl6?=
 =?utf-8?B?dkVuQVRDdVZWdTBoelJlQTBYYmY3MGV6WmpINTZnVWtoZWl1UThVVlBTZUE4?=
 =?utf-8?B?TURhdnNXczY0OURQWGdOdXgrU3E1Z3lWdk5IRXE1Ky9rU0tjVmtMWGkxVGNa?=
 =?utf-8?B?QXJLdnJlcllVY2dDbEdXSmZQT2h2ZzJIRlhuNGpoa0k5QTZoalg0K0RHVDVF?=
 =?utf-8?B?TE5pTnB5QVd3VCsxZDRCVTlqT0ZhakxIM1FvSFhYOFlKMDQ1MzdFdEZwa3Fn?=
 =?utf-8?B?aUFQejZSam9wNVBjbmQ4cy95dWx5TTZ1ZEFXTktYVCt2NmJhS2tUREFYTkhs?=
 =?utf-8?B?eFRKdEd4OXpPL0FPN1lDbTR4a1hGY3VTUnN3ZU8xbGlvSHZjcUYrWHF4ZlRs?=
 =?utf-8?B?eDBWOWRGUjBqL1cvQnkwMlFLb2R3UkdrSFdtSmhMRGRqTzU4Z0RZSlp5TFFQ?=
 =?utf-8?B?bGpDYjZWTWsyejhELzIwT29RU2FOZGNoelVnYkhmM2U4ZmhtMzdoNEEvQlRk?=
 =?utf-8?B?Z0dNaXlyeWtDNmE0ZG5DZnZ5bUcxU1dUaE1rL2xxNms5eGZ3bUd2dTNXMGtI?=
 =?utf-8?B?eTllN3RzdTBFWEovWiszU0IyODh4VjBUVWJ0ZGZySjZ6N2EydC90NFVsVGpH?=
 =?utf-8?B?c3lkanVZME5vWHNxbUIyVGZKNkdzaDBEdkc0M3hsVmlmZHdVY0M2cDlqM1NV?=
 =?utf-8?B?Um9zMTJZazMzYWx4N2Z4NnI2VWxldVNkWlZmSm5UZkZOQjRyTVdLTVBLbmRp?=
 =?utf-8?B?NXV3TU5hc3ErNWlaQUF5dThqaVVmTlFFRHFCRzlSU0lJVnpvMmdOTDFWZ1VQ?=
 =?utf-8?B?azQyeUg2Z0lXa3o5V1VBYnBWTHNzelBPSEQ5Y0JMcUtTRHVhSG9FakQ3VC81?=
 =?utf-8?B?SHB4bEk5R253akl0VTZHR0VWdXU1K2FKMlZvM0JVRzhvZ0VxTy8zK25iUGtO?=
 =?utf-8?B?RUNaeGN2L2srVngzR05pYkZJMkxPN21HLytZV0RjcFZMTU45RkRJZ1FmbEpv?=
 =?utf-8?B?eTlBd2o4Vzdvb1ZpTnNjRWVSUk5iZjQ4K3hmNVF1cXM1U1Z4SWt3ZTdaVTB1?=
 =?utf-8?B?SnJMRzRnSXJPcHB3ZGZEellMUUU0cFpEV3pYbS9wcVpJcWVjSlQwWm5LcW9H?=
 =?utf-8?B?Q2ZkWDhxV1M3U0VBVzRsRGkyMmV4WnJBd2g1UzNXZEszdTZCKzdQaHNPRmhR?=
 =?utf-8?B?Sm5neWpMdkM2eEdyVTk4c0dIMW1qYlpZdURrcW5iaGVyQm1GaXpLM2ptWnAx?=
 =?utf-8?B?UFZSYUU2bHRZa3JxbHB3dFZrR3ZpMkorcko1eEFIL3RabEdLS0dTc000dmtI?=
 =?utf-8?B?UzdTN2JIbDNzK2UyT2U4TnZtdnh1WWhBT3N4cDc5T0ZTOGl3UU9uVFlBb1FJ?=
 =?utf-8?B?ZWxpUUJvL1FwdHlweUlhNmNSU2drMTJGaTMzMUd1aUpNYVp5Z1prZHJOSGcy?=
 =?utf-8?B?dlRVOVRHRjhFeThRS3NBa2dIL29QdVEvamdtNFRDVmpjRjBhOWwyaWNsZDlp?=
 =?utf-8?B?VFppdWp2RXEzbkxWdU5DbDBMMkxVc05tWHFwQlY4TXROc0RucG9CRWc0QXBu?=
 =?utf-8?B?K0pOZEVJNTN6SVBIQm9tUnRkdk9KRDlYZm5TeThwbVp2NkxoVnNCa0NLakJo?=
 =?utf-8?B?SGtVdHZ2bnNRT1N2eGMwY2kreGNiVTdjZWs4ZzNiTXdQM1ZHRmJqQ2pHcnB3?=
 =?utf-8?B?K0UrUTV6bW0vMkFYRXNQWHZQcTFFdWNLaXlHTkQ3TjZUVWhaTWFVcEx0Y0Nx?=
 =?utf-8?B?ODJxSW9kMTBQUlpEcTlWdWNYYUpjWEZndkwvWlBkWi9ZaUJTOVNLTUJ0VUtw?=
 =?utf-8?B?d2k1Z0IwVkE4MlgxZmJVYzFEVUJOcDhTSTNPZk9LRW42YlpTY1R3NGZwRnhz?=
 =?utf-8?B?Rmlrd2dZb3hUZzV6UXROcWxUZ2xXckRPd1U3M2JndFRxY2tiMUxwQVhwMWpL?=
 =?utf-8?B?OWNOSzY5ODQyV3pRdkFRNWtVQmtZWVY1OFRYWTFnQkhKMTNJR3IrSDkvRlpa?=
 =?utf-8?Q?f0bTOhkXPfP0j+AQ=3D?=
X-Exchange-RoutingPolicyChecked: lk+jhk8x3o8GXgd7OT3VkYoZk6yFO1tPgDheajWv7Wou7DGCry0ZPKilh20RoxjTOpa/UvmaP9HCn85qo7kn3pZ1DQ4StsXkmM2rYCQX3Mv3Nl5/JHvWuIA4Z119zj+JKUbDmfxp5KAJNRtmScmFAbO+Rsf2RCi2A4ALMk0Bc/lj0XO/hjcKnNYwgIS389YoVJuESOn4WYYyiJ0Pbvjodjrl0p5YFVnJf3AeQMWKAQ5GW+Ed/GnqIjQ8Gd5ZoqsUelqAfwt0sZrY5CcVTI9vvyVMBlXxQEYA2BrdX3z0GrME5doLvaLrVC85nFG4yADpiL0DpDBcrUOc/Vg+MtHkHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: be434b4c-98df-44c1-ede3-08dedb65c7ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:52:12.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XakvW76x4SPERo05OunZCv+lVDAs0S9RVw9/aGEwZGaENQXyEwgrD3r6IBLjdOU6KFs21Bpm4Ka3u1/XJ7Dv2kdoqXG2lndnP9bZQ1dj3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9596
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

Hi Jeevan,

On 7/6/2026 10:38 AM, Jeevan B wrote:
> Use a canonical pipe ordering in extended-mode-basic so each pipe pair
> is tested only once. This removes mirrored combinations (A-B and B-A)
> that provide duplicate coverage.
>
> Reducing these redundant combinations lowers the total number of dynamic
> subtests, helping prevent incomplete test execution in CI while
> preserving coverage of all pipe and output pairings.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index d8aae4256..983733b9b 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -190,6 +190,9 @@ static void run_extendedmode_test(data_t *data) {
>   			if (crtc1 == crtc2)
>   				continue;
>   
> +			if (crtc1->pipe > crtc2->pipe)
> +				continue;

Reducing duplicate test coverage is a worth while goal from a 
maintenance and efficiency standpoint. However, this restriction may 
inadvertently hide certain bugs by reducing permutation coverage.

Consider a mixed scenario where one monitor is SST and the other is MST: 
the test currently exercises the SST → MST transition, but with the 
crtc1->pipe <= crtc2->pipe ordering restriction in place, the reverse 
MST → SST transition is no longer covered.

This could be problematic, since SST and MST configurations are not 
always symmetric in behavior.

To ensure comprehensive coverage, it may be worth explicitly testing 
both directions for heterogeneous pairs (SST ↔ MST), or selectively 
relaxing this restriction for cases where asymmetry is expected.


> +
>   			if (output1 == output2)
>   				continue;
>   
Regards,
Ramanaidu N
