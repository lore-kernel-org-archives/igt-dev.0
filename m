Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125AECD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 16:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DE510E1F2;
	Tue,  5 May 2026 16:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnKPGatf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4904C10E1F2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777996950; x=1809532950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D1edMLGyGljTOOOxfKgXRe/w5qnV4iyWGPo1559A1Wk=;
 b=lnKPGatfEoiUPfcYAs85w4Iw3EwgEURkkBWpVpGMisGvpn1pshfEilV2
 Bzc/rNZI/dPRliqHJv6pV7HIkJrAdTLn/7Tlln3dHnSisHOJ+wbYLCACF
 h08LjvHmbcJcS1q3r1fFzXXSXs0ZIuKq6pDraIPPWv/meFSky4yLotwaC
 WPyw7/gWngmzs3apy63WgrlJsf4TSwZmQxC9F9KibP1YAoJZyt+nCP074
 H6TC4rGSeRNj2NcKDEHDB07klN7XBlnn3gYDU3uEZQeItG4DktedAR4ds
 yecukiDN+nB5xz2jcLEe0kuFDE2MLCotWDLc5PE0eT0C++godF8ARSxin w==;
X-CSE-ConnectionGUID: N7hQ1XF7QZi/IYY6j370qw==
X-CSE-MsgGUID: 2maTiYWGT/SjIR2cAzBqwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79065207"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79065207"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 09:02:29 -0700
X-CSE-ConnectionGUID: 2wkIVrQqQfaxAaEjEWMzFA==
X-CSE-MsgGUID: DXcOXS9EScaReucFa/M3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="266190137"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 09:02:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 09:02:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 09:02:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 09:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+13EDRcJJpBbdtUOnriIRk2+EYwhxsJ4jmhCjI1RlfXYfEkGA2olAICAIYx0liVNdMu3houvJQNhgiFmfwQVCQtSIKOGcPH024YpZeanp0EbWaekpBxM5tub60oeap5adhND1lMPZGuhQn6bvS4nquF1EogRqojPxK2rXPmyKPGmIEjAXG9quFIjd2NyS8fWcdyhZ6brnIX/nSg+cvrfcY0sN8KO/DHEfCguVEp8+dL3531QLJs0FgHp7qXZWfuLRxfpY1jJLyLETq3eD+eOpiedxRP3lI1lWYipIawygS8pSKHxaPIFLGo+dr/OK4Cfy3Dwf4+vze+fN8Nl8+AFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sddstSEp37sSshxRNqYM4D/UI40XURNSvUMuOubE+i8=;
 b=kt4hBnbxStIMCXY4IwYCTlUYXiUrJERk/r/L7jHM7Pqd/MfoBssdeszCpudHBCAJ71CKTbHBhJBIvArkoQmn1xMC+B6BVUwNHW+L+Qq1hkd9mVHv6Mh0YNB1ml2YWkmUPw+Glj/fMhdRBLEQFwlqvW/QUfwNv3KlaqpXz1imueJtiqWUMRL0kJa0zNtXHhXi5RHg4ehZf3IGhue4fA49qmTN0h10H8OYMCvpnhRk1BQ2F+2K9DzBzsF7F60lokqU75AWY/M9aOFosD7JGhStEtmrMLHx3PtrweZNgirNj3wz7YwS9zGsR/lbhvsOG8XsAwt6DXNUB6N+64+4X2qASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 5 May
 2026 16:02:23 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:02:23 +0000
Message-ID: <389b5c8f-e0aa-4143-b02e-c2383c43ba07@intel.com>
Date: Tue, 5 May 2026 21:32:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/perf_pmu: Ignore SLPC efficient freq during
 test
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20260409090750.546999-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260409090750.546999-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: e995f84b-65ab-4029-3fa8-08deaabfb204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 04lLdq+A4CNfLLIxU1jbqiYDQ0qRJMkwuBN+Mb6p63fc4QvgnNGuXGEcr091obS8/XNwFuwvjVvEyTBkb6Jj7ORZ3YnNricVKJt03eDTINWBywFIgyAyHnYwYzJm9jqQCrzBPdPjYSunrcoqkP96x23YAp3ou8ks4mNfL54MUNtRzcrfV2pQ0GeqIfBihEoLG0FAfBZxK5S4GT3wSPcV1MhHlaswxS5I3Spgwd5zfEOuAEt9Txk/C3e7k+XTa2ovZDvApOXFJ6wERLyP7Qmw0cyqPKrfeE4bvy2f/2yw21ZiegdgfuQj7NLbf8hcAWFQ6MNI33fIsucHRTGzgeTObUVe8QrBsQyy48TjrGvbS2mdpWADLcrYFzJTmQkLdqC91WZml9t/S5lP+9wLMYWqcd4n0E7PQOqx3gT5lAq1vdjV8vTQ421H4Ne7yLeZlwSUX3s3BSs8b59UxFr+lY55N1Z7ZfHvvbibfVYkWwwCPsflEZwD+0QkkEwCsOVPbYez7Agiu4z8HwSXZDuPrvFqeXJhJ1Eg8/JOpNuNkzyhkvYXfLleutY9QWIMA06/O0JDlWkyvylS7DLXvGyfBKeIZx4iKJVyCEblwL01UhHmjgGgU0EZpzAQUtYZIr7QKtE+rge3P7DW1CZVWHxxz8838A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJYejVqaE11bkxVb3VTYk00ZE1Uck4vZW5BUjVkbVJ5R2FrWDZtWUJPVHFp?=
 =?utf-8?B?ZXFlQlR3UitJZGczVmdVOWlnSnNyd3JjVnRQbUxidkQ3Z3cxcXFNMmwzSHZy?=
 =?utf-8?B?VUJ4YjhHMThyY1k5UVZacjczazRtdkUwR0FhdmFuMUs0NFoxSHRhb2hJYVVn?=
 =?utf-8?B?dUdqRVI4Z3Z0cUhrUHFQS2xhWHFiV0hVT0hpQXFQQVBnQzZqTnNka1hicGlY?=
 =?utf-8?B?WHVMUmNhQ0VKcFNVSFdzRnVNTE56Zys4WmhIR0tVVXpQWHpzYkRXWkxBLytW?=
 =?utf-8?B?S1Y2WnlxWTZhenMvU1FEanRlU251NTFRQ3VCR1JYNW1VS3V6dUc3T01LZEFN?=
 =?utf-8?B?cGxyY3hoNU4rTWQwdmxRd3lDRjRKQmFOU0I0OXg0cTBVVWxsZWtUUlFpUWov?=
 =?utf-8?B?NVVkOUtqQitSRFFpbFpxWVRwR1pqSDN2K3pGZWt0c1c0azAyUWRqaGo1ZGt6?=
 =?utf-8?B?cVBNZ1ZBTDc4Zi9NOUpDWVBoZHFoSmtzN0t2YXJzNWlrVlZYd3VkMU9CM29s?=
 =?utf-8?B?dnZsQ1VubmY0TGdlRkU3NjNZWGdibkppcU84dUJrRjdWK055S3Z3eGM2NGlI?=
 =?utf-8?B?b0Q2SXRHK3BScFNZSlczdU5TUXNOWWozNmw0c2tINnRqd1BlSmdnUTh3WEJS?=
 =?utf-8?B?SDl0T1NWUmZMemwrUFhDcERNSzQyeVp5WjViS2hwaU9BdXBORDY4TGErV1Vs?=
 =?utf-8?B?QUR1UEJQQlRSNmJWZkFTTm9aVTNkeGllZFlZU25keEw0MnlaTW9GSURpUW1n?=
 =?utf-8?B?WlZYYldSOUQ1M1BUS3hNUStKNzhKRURyZHRFWHkwUVZPa2JCQTdpYjUwcUVo?=
 =?utf-8?B?d1NzeHd1ckxSdUU1WHVoYzRzM2xBTWJ3UzVnMVc4U3RycmNzYjNERDJtMk1R?=
 =?utf-8?B?VjArQmk2T2tMWXhtd0ZnYVhsOUpKdUVKcVlVVWRaTzhyVyt6c3NRd292Q0R2?=
 =?utf-8?B?cEQydGk3QUV5bFFjaEsrTGI2ZExTMERsWE9hWXIwWnpXWERiYXJUVjViYWZK?=
 =?utf-8?B?UHNNdWU3REJ2cVFMSkFVU053aWtYakllVmttYmVkNDYyanlWY0h2MTM4eUtn?=
 =?utf-8?B?Y2diSTdLcU9oMmxVZllLUWJDcTVHdS9qSGxWalp4dk5mcFhLcXZ0Ri96TVFD?=
 =?utf-8?B?YVJkRVBnVnU3emhiZVBNWFgyTGhBZ2M2U1VNMGlOL0c5RGFFYUthOVhPSUYx?=
 =?utf-8?B?SmxueGRDNXllS0p2bkJOdVVLUHE1NzZNajJtS3JpRkltak81bzZxWE5mb09F?=
 =?utf-8?B?ZmNldEduUmp4QXlJWEpjcWtjeXJzQlZ6cnpwbEtuT2RmL2VOcU9lY0dhdWU0?=
 =?utf-8?B?U1l0ZHpzb3JyUmdwYjZBMEVzY21QdnRCVjhRUXVIeTRGcWsvbStDTVFIdzhk?=
 =?utf-8?B?Q0pDQ2Y0WHBiYmgvWTBnWW8yem9kdEpxcktISjVGbEFqWERBMTY3Y01EZDh4?=
 =?utf-8?B?SkRFYmtDZW4zUDFRMGhlT3VON3dUS1RCMmZacHIrM0s0QSt6SlgxVld6Tngr?=
 =?utf-8?B?Z2xQbnhxay9GM0ZCcTVPbkdPUDVUdU5yam45cGZzdGRlUkRjUnRkWjdLdk04?=
 =?utf-8?B?NzVOOTJKZGtURVpPN3FZZ25HOExaWGRzZEdNNGpJQ3ZmcHp3RjFGVVJ1dHEx?=
 =?utf-8?B?QjRkVTRqbVhnMGMrUWNBY1ZUVWJBdHNaOEw4ZEk3MGRDK2gwa21neG8zTjBP?=
 =?utf-8?B?ZUFUVnh2NnRDdXhmZ1k3Q1dkeGlyclQzcXNNY3BGVDRMM05TTldaTmI1VitY?=
 =?utf-8?B?eHJZa2hrSUdlZDVJanJ6RzBPN0lZenYvZVZCK0lZVzlqenZRdUFjYmQrTlVv?=
 =?utf-8?B?dW1aditxMkdZazdDREFlWDJLOEhxWXFJbFd2ZEVSbnE1bytuL3J2UkJTa2VN?=
 =?utf-8?B?QUZxMmg0cnpDcW52bXZYZlpyeWJ0eTlCSThvWGo2NzZZckJZdkhReitUc2Uv?=
 =?utf-8?B?dWE0OFN5WnFwNmdWOGZqQSthQWxXK09ibExrN1htNGFOR1lvNzBHL05EUDhC?=
 =?utf-8?B?TjRzaUZWOW9Wa1FHdVZsdFNyTWxYVjdmT1lWcmVJSkZScXpjT0lVVHJEVDJO?=
 =?utf-8?B?akNQbHF6OGcwKzRPUjFMY3FMeSsydGhCd0l3WEY0UUtmOGMxVUcvYjlqSWk1?=
 =?utf-8?B?ZFJhTG4yc0NvejlGekpuZlB3QlEyM2pBdGxDdGdwRWhFRFIzMVVNUllNUG5D?=
 =?utf-8?B?cmV2T1dvY0xLU015ZUpEenRGYVY1aFVJRytXb1crTGN0YzBhWklGbTJTZjNr?=
 =?utf-8?B?NFcxcXVhWUgrNGkrcXpqVzFLWmVTVXNEb0FQRzZETGQwSFU3eFA1cUdqMEhP?=
 =?utf-8?B?MExCNXpERHZ4UjRFUmdmZlNQZWVwaGtjSXExZXF3ZXJycjdsVGo1dz09?=
X-Exchange-RoutingPolicyChecked: eHlmjFebLV8FMEomumxNRVVHB7bax437tT4kxlPltaGVg4vh66dJJVaTiXj5qe50nPtwdB4szh1mQ/g3gxiFPuW1UxGnojXHTlAlcadcvu2SiXgjYXcn3ZB+3QEV24SP6i6deAcNfEaAb8RPssLV267Y23JcuHUGniuj9hBH5xUlbrbMJuzH0NQJgdGwRt6qfdkw41mL7Icf7yayDSXVvHEl2ZXbBK/R8vDApgj0XmhEMgAgHUjdYE7cvvg5IS/gQvRFBkdAcyik8F+gXFPC+RH2hgm7hPCHWPqnkVMCxCKSIeFcczZMf9pPJSy/to2mPurA6HPaD5zE24E6Q0HzJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e995f84b-65ab-4029-3fa8-08deaabfb204
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:02:23.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11rDi+zZr/TDIWY8nChx3UL6gGpdefcKqhov2Rhn3H8t8b1oc0/0Bqpy4TalCulsMwcEPk+h/44JFHI+ccM7QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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


On 09-04-2026 14:37, Sk Anirban wrote:
> Disable SLPC efficient frequency before pinning the GPU to min/max
> frequency ranges. This ensures the driver-requested frequency stays
> within the desired range during measurement.
> Without this, SLPC may override the pinned frequency, causing the
> test to report values outside the expected min/max bounds.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/perf_pmu.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 661ead32d..1e389958f 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1521,6 +1521,8 @@ test_frequency(int gem_fd, unsigned int gt)
>   	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
>   	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
>   
> +	igt_pm_ignore_slpc_efficient_freq(gem_fd, sysfs, true);
> +
>   	/*
>   	 * Set GPU to min frequency and read PMU counters.
>   	 */
> @@ -1586,8 +1588,11 @@ test_frequency(int gem_fd, unsigned int gt)
>   	igt_warn_on_f(read_value != min_freq,
>   		      "Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
>   		      min_freq, read_value);
> +	igt_pm_ignore_slpc_efficient_freq(gem_fd, sysfs, false);
> +
>   	close(fd[0]);
>   	close(fd[1]);
> +	close(sysfs);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   	put_ahnd(ahnd);
>   
>   	igt_info("Min frequency: requested %.1f, actual %.1f\n",
