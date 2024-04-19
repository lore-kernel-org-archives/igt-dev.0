Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C53C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2410E4C6;
	Fri, 19 Apr 2024 06:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOINm+qK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E7D10E4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508060; x=1745044060;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgRf8xTvCmO0sYbq/9MOkzn82B3voI7CKNUgBOgkKD0=;
 b=HOINm+qKK3V7IGMoGS9M54Dw/Bqr5UB9r5ps+zm1BduBvByPVyT1fcPX
 HkM0XIrYI1moi5Rmr5DsLdexzVkyeNH2fmhQz7tZhJTqPOPWWYPE+EBqp
 NpMs5gxljLsnXRFnESQEQ9evPky0XiutJnQ9jDtj5v+3QT8m3tDd1xxrv
 Bogmg9wrb84XgBURtVrGQBNQ8Ej72Q0VhS43V+qQPo8W9vn0/+vHXWknl
 AZgBpu9kfvx7SllUIVA7UnAvpt/l2OtC+62Sw3wSZZtDb6S0TsjEmHkq/
 oTPJZ3xsgkapXl77Wnx3xmtXjhoi3p/2Kzu6Zste5DTpXBnJwe3tbmNIk g==;
X-CSE-ConnectionGUID: ZXy/aVGwRbukyn+EmkKt2A==
X-CSE-MsgGUID: By8tywagTymg9P5SpfDQ6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12038267"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12038267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:27:39 -0700
X-CSE-ConnectionGUID: Jqs3f7jbQySHyXLyayy41w==
X-CSE-MsgGUID: hrpxi3P1QqCAwqhmU2Qd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="28065030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 23:27:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 23:27:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 23:27:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 23:27:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 23:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h80TWC0rvdb1peFNkN8mKTl6kRHGgYZSWtFv4eXLomLE6/Ns05KPmD0k7rWj4uAAwifeavt5ezxxXOWPrycRtpcAFCFGlQesxdmxfDRQPopDBy0ph9vntzJRnZG8HQdl+BxV4/gPc3JCvr7c1noLG02PKrbtQ7YEEQKlKsGSWu0EdPlPPUe2/7Hoao8cqw06D11gcBzf5JlmX3ovcqf6KndGbuoCWNn0i7uMW2seijxr6bCLMaZ1X52fXlbE27bZFE0482oxKBVo9xlBZ4nlgOUot9HmsC3QIHDQq+VVFA1SqyBWQFEftqWkAhwWU1cLrGJbPFY1sIugfCGyokVbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxyRwXhTIGWebUPxXJWaOuf3e+Hbp8NJR8GDjPVVBQc=;
 b=J7JLSE4y2ZtiFEc19BRWNw+LebH511gNaq2xT9DRslSED0Vgz6EfObwXCKXPNyfPtaG2HjX8lO3qW16ADpv4GFV2HC8zDiY0aAf2eIYNhlpij+Fm+9pQMMABiWyQt1L7eVVFkiNuSySVBKZxLdLSkACJD5vwSs+yHwUETpbuXMa322vaIEIecYf+yVdJZah9KgKs1BV/L9zTDZwBTJPSzB0vTQjOLyenamuVv000cUQd+NEAXJP1Flg9Z2UvMMpNsFlxU2hY97dVmTVY6Rsnf9Ct03NmPy49arvN6dJ70o91mjPb3OoZDAKzupODrl5zXx9oFn36+ANAp2pb0bJ+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 06:27:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7519.014; Fri, 19 Apr 2024
 06:27:33 +0000
Message-ID: <ed84d4c0-e4fe-421e-90a8-d3f98935dd08@intel.com>
Date: Fri, 19 Apr 2024 11:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
 <20240418152817.2352850-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240418152817.2352850-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::24) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e6d28e-bdcd-431e-e487-08dc6039cbf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcISaIulUckiXVrbzmjtvzkPZuFiSec60ZLMQt65wzuHWBaq2x4FyrgQUXkGWv0b49r8jctbYPF7XGY4Oa4wPh6yPnka4y98cNPl6y0wGfMMViHasbCHkKwuA96AlGk2qzN2Q1cbZx5dl4cHhHj12DSEeZbAnnFeUTVs2WtpceCewtT36lvfx3hDl7Wvf/lmwLrr4uVsmccZ4MicsYW6rIoeYDV2MoeX49ZK/MkdYfAid6a70HYd5kPoSX09LSDXbSUDUvxYrM6L4SddwTHjpNcIS+0D2f8asXhZwOttbstKvVh2Boo8JdDhh8sj8oVedR0PfuxlF8ABLAolA/ZfnKhWt3tEGwXr0etNCmqdCJtYYf05cZhb98KBVRMw7pRQGNlkAI4lNWkFBDNIGyJFB0DHHAj5MLX2wySCOxTC4gksBZZ6XMRIdexJSMfKb+ID1DJ6S2FCvUOwXJa74oNq7SpeWi4rvOE1tObGHOEyI1p5GyvXH2MrZAh4syVo+1kd5v9yK52LV/qYLMAs4cTkvLmcIGMSGWd6k0q7BwG3JGuOWAgoKFIcTjb4OMW+svHMWThpusDwJChR5xKVGkaD1FQRID4afXFHuWfxQA5iTfBcC9aG7IT3Mmvj2jSmjXo0ebQSGW2jBWwBnLI3VQcgKet1AVjJsCXqFpnwl+0WkIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0xHVUZjOEowUll0bHZtd0hodnZpcmw4YTZ2SnJFWHJmWkwrZFdaQ1Z0TktB?=
 =?utf-8?B?K1ozeVNtQ2dEbDZCMit0MmovdGRKVWhta1JWc0p4aHVXOUg5REtHdmRicnhj?=
 =?utf-8?B?b2RwcG44V0d2dUdGSG9ZcWNrYUJObkxnaXRDMmZXbzBOUzZkem51MTBkQUNQ?=
 =?utf-8?B?TytqbDBtNHdXWkxHeGxnOUlmbVJORlUxOTIzajRhOXZkeEFkQW9SK2V2OXk5?=
 =?utf-8?B?SHRoWVc0YWdPMEx0S1kwbVZtSVhSdk11T2VaRmtUQlZmbDRCdmowMG5aTGRE?=
 =?utf-8?B?cXR0emp4Uzd1R2dZanNtSDk3SE1SRUFiQVh5SmloMzRRVWZJM3lMZEI0Y1RH?=
 =?utf-8?B?TXFxcmI1R2NqUG10K0dPeHMrY0tTaDBZM3pocmNrVmhNNEhHdTRLSkhvWFpB?=
 =?utf-8?B?YXpvU094WEw5Ri9KcEhMbjgwUFlxaWNwT0hRVm1iVjJEL1lyNTRjdDJDZmJ3?=
 =?utf-8?B?Z01lR3ZUa2dKc1VIdkZJYTdEQmt1NXRSN2NNUnUwSWRBL2FzZnhLYUl1T0pp?=
 =?utf-8?B?Z09NUWNzYmJpVHQyMFhKZVppR1dtQlhMMDlYK1VtZ3N4YzBBKysrU00wU3A3?=
 =?utf-8?B?VTUwT2hvMk9JY0dRbmRZUjVLWkZDM0dQejhEZjVmSVJhOTBQYUc4Q1htdTFl?=
 =?utf-8?B?aS82aWUycjlZRXVjdXNtU0l1VFBBMm1XT1IyOFFYa2d3NktXSU1Eb0F6SUJR?=
 =?utf-8?B?UHQ1alJyclA5WFp1Ynp6YzBNUU92d2dGaURCWk5SaGFVZTh4NHUvN0VPem5I?=
 =?utf-8?B?TldFRGl6ekVjaU05OUV0V3RxWkRTQ2RQeEFPQWJHN25OZkZWKzhQeExXQi9a?=
 =?utf-8?B?ZE10YzU4L09WTHBlK1VkU2NRUWNKZVJBbllMdWc0TytUMitlNndLT2JONkRR?=
 =?utf-8?B?M1E2VGVpZUgra2k1U3BMc0pHWUVzWEJMbWxXTzI2SG1ncjZ3dVAzVjEvejN3?=
 =?utf-8?B?TGltelphbVZtb3lQUVdzcHdLUUQyYm1leTZtOGlodlFseldTaVZhMUM3VG9X?=
 =?utf-8?B?bllyWUpjc3pJT2syVkNxcDZnckI1b3hjTFoxK1dOSEtCVXV5NTY2ZGRlMS85?=
 =?utf-8?B?UXpVNllxUldySkNHeTIxRzh3YkdhMytiVnlTVDFUbzYzVGJ3RGZhZFpKUkNy?=
 =?utf-8?B?dUxIcDVZYks0d2g1L2k1OElJQ1Fua1pFUTRPY2tKTU1LaUVpYVliQkFWS0Fv?=
 =?utf-8?B?Q2hzd0dNMlJpdTRsMm90RWFnVmNVVHQwYTlidVhzRjVVbW8wTWlaZUFzaVM0?=
 =?utf-8?B?VXloWEZHY3JISWgzMGViYTV3ZDQrYloxMGRiS3BIYXlnTjFodXV4bDVyZEho?=
 =?utf-8?B?Zng1bmYwdVBFWG42MFA5YURNNDViNXhuTnhWSVlSUlU4UXhiamc2SzZHcUNE?=
 =?utf-8?B?VG9DbkI1MzM5TTUrR2tzdS9aUTVSSHhIZ3c5NDJCQzlMT051a0FpOEYrYUFB?=
 =?utf-8?B?bVVBOE9DeGlwWFdTNXBMbHg2U0t3SEZ0amY2bmlsL1pIeHJIUkgyUTVqeXF3?=
 =?utf-8?B?VDVXWXplS2V2cnVJMzhqbC9nNTRpZEY0U1VpOTVoQno4Y2p0bEcyTWJEM3lq?=
 =?utf-8?B?VmNNeFNzTW05aGF4ZkJOdy8zWlhHaC9QRTNDdDZQWmMxQ2h3eGJZLzZpcjM3?=
 =?utf-8?B?ZTFrdW8xc0hkbWVWcE9vT1l6dXpPOXVTK3Y0NXc3QXF4V0kvMFFZdWI0d0VD?=
 =?utf-8?B?N3dNUUVZUzhRQ2NTMVhwdlMwUVB0SmxycVo1ODhWNnZIa1llUk81cjZ0KzlT?=
 =?utf-8?B?N3Bwdzg4bXZPMFB4dzB2RlljdURQczl1MVJVbk52VWZLYXd4Znl5WFV6bmhq?=
 =?utf-8?B?K0lFdG9XNFBEN2FxeVZnZ0xVQlVKdVpyeitLYkljY1JnMjZkSTlaMGRBbmdQ?=
 =?utf-8?B?OWhLckpvU0c1Ym9LMERxVjJWOVJ2Y1YwMWJwc2l5OVZhQ3FRcHVySk51RkRB?=
 =?utf-8?B?eUY1ejN4T2pCWFV2cGNWa0J0V2cxTDdibDVKaHVRa3hFMURGeTkyQ3N4djlr?=
 =?utf-8?B?OUw1cGlQT0xTNWdVbDdEeGsxc3AraGxwLzc0RS9KdVlDY0dwRmgzRlk4SnNz?=
 =?utf-8?B?ZDVpVlFkZWhDVE9QSEs0QVpoS0xpRGNzc0EveUhYQkR6TDFDZm1qVHpobDZ5?=
 =?utf-8?B?YWl3UnBveUpxWGxwZ2tzcWErWW83QmpXWjVJZ2F5WExwTVp2ZHpDRHNXRU5K?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e6d28e-bdcd-431e-e487-08dc6039cbf5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 06:27:33.2631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9fccP9Mf3pI2rWyUb1uCv1yDZjqT55LlnCTF5zkC1DBMuOLv/cGP8fPoMmxPYlOLgGgd7oBg1HipE4zlE4oi0lDkLq2GALErUqlVx7W5ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
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


On 4/18/2024 8:58 PM, Kunal Joshi wrote:
> kmd exposes debugfs for all the platforms, so add
> a check in igt
>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   lib/igt_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3216fe7e4..6f093fed7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
>   	char buf[512];
>   	int debugfs_fd, ret;
>   
> +	/*
> +	 * bigjoiner is supported on display>= 12 and only on
> +	 * Pipe A for Display 11
> +	 * For simplicity avoid Display 11 and check for >= 12

For display 12 joiner needs DSC also. Due to this we cannot force 
bigjoiner on machines that are not connected to DSC sinks.

So perhaps I guess it would be better to test for 13 and above, as we 
will not require DSC for that.


Regards,

Ankit


> +	 */
> +	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 12)
> +		return false;
> +
>   	igt_assert_f(output->name, "Connector name cannot be NULL\n");
>   	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
>   	if (debugfs_fd < 0)
