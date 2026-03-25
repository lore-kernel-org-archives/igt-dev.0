Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103A2FEA808
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 10:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ACB10E1F0;
	Wed, 25 Mar 2026 10:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/nZqCzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A8410E1F0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774434603; x=1805970603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mrYq2SrNaUSZHnqfDrIAz+RSdmoW9CEftkLLgOLzPIY=;
 b=T/nZqCzjBSNxmoaav57VSRcVdlh97/uFK5f+xdWiAiAWXh+oIPJIb6JP
 8st4ccFn3Z1acznQ7LSU9x7JVdCTZVNPHqboL7hEvR0fjodWYkAEOJyMk
 8MjajtrWOIHfj0r7Qrj152pcuntK2M3S5mLBH0vx/JSJN1PknXO0vHWrE
 c0g+77wW0ecdrXRfdCMjnuPUwTWRmRAesBKgsLBckrf+sdOAeIzZzPlbz
 M/cp47HO2R4bzXT13l0Y3oJ7yCYAZMiLKdgmkJJdDRmC6d8d+AvUxpF/G
 yuxQ6+WG3MpQgIB/KvT38iTBqwdlDwkKgkd8K6gf87JW7Cs2hRW8t4fIU g==;
X-CSE-ConnectionGUID: R4F8tMdkRn2iP+RcpmckZA==
X-CSE-MsgGUID: LTBkFhxHQ1enHRspfd2gDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85778580"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="85778580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:30:03 -0700
X-CSE-ConnectionGUID: gkCXFmKGQXaAdlQlbY39Sg==
X-CSE-MsgGUID: fizC9stwRIek+2CpemKD1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="229566958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:30:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:30:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 03:30:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL4bpfuLcaBMQVPIX2LmRSQ4i5QBn6TaRx8cHzOYoi9dvL1hjUnxgd0DOqTVo6JjBMD4hscKBnOYd10KOkjtvSd510qybwVyIxpxuj367vA1m3aE7QNKoXuUouJFTmDdVWdlaCP30mzYx8uBbS7Tlnc26ED7PfAqBsaH+vlbnOownWeoZFlYaWmjCFd8cMtBeJUsjwT+OWb3DZ18BlThCj5CEfqobc/coLCVKl4OakZG2NjT8nWtOSnUXUUDcoeg3CR44PJoPtsp5l3hKRehxebYC4CtmbiLruTjtJ667fBcHGm4tON0UPL+U0yhiZtKf9hUaKnzO839OylUrGbL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBTEnLXkZ4V73z5l8NOjJXrx2hGBJ75b4cA8Om7FziU=;
 b=cI+p533H5pCdQwyWZHb2mGhdebymUL52QsClPHvLeS+KBzkKchOkZoqFeEw+LkgPsVYPpeyBOQ0Sa/aNGoVOZzHPcklD3xWnkuBh1fqwvkRavT3DCylip3MJUgpXhKKyC387LPvgChlczjsWBQikKqsfEGNVCV00YGU6mnBrg9KAZFbl46ihKlvezESNGAioxI9Rt4rLa6wBnrsQw2ZKh2zJjbfX5CTPtLOTYfBh+mQGlPW70WFEwiO+zofVqQ3VQdVy6dz/sYGZ2QdPt60CMqlHGJoMVJrd/P5znhUrvyaFU07DMo8YvX9Z+Eut3JTgSMpIFAlnd/O5Y5MRXAEz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 10:29:59 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:29:58 +0000
Message-ID: <4f64f6c8-d3b0-4de1-8db7-16a37dbc6267@intel.com>
Date: Wed, 25 Mar 2026 15:59:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Print reason for test
 skips
To: Sumit Kishore <sumit.kishore@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20260325095952.316174-1-sumit.kishore@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260325095952.316174-1-sumit.kishore@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfe2775-e7df-489a-5d12-08de8a5976b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: AdcwTSNvK361fFpH6SslmPS5FT5JCtZrVd1fYXJ90wD1tOuLPZAi1oLQPqH3pLixIEz9lKd1dusQWaB6Vhx8XG2tEOGmVOpq6o8SVVXbaPh6QnAuhJMh1ViGZiW6rVA5FngKThO4ZPI7M53DX0YDLce5hYU/3jEVU6rv5FTNfV1QcOigIXcCXwen8vKKleyZ2xxWqW7mRURmYcSnysXoVzu9dny+bH4IbijORK3pDJ+++icki68vc32z/4jKwmI4MHo9/OhPevVDqjI7ScXYS1V6aD8I2Gmu80ilvWEYdbSz7ISqJKeHvHmhCyO/x5yIp0dA4B8slnQ161nYY5JlVL/UEh8lZuw6/D16FQb5WvLsOKShVlzZMUSAznSFmEoLewIUCfQtVJK7QLamvX0Qb1q4s6Ut/Ov7KUQR1roAkuDKY/PMPncwkdYTG5LKE51nElQgxsOpPxNPc+nUCkXHk4KAr1Gj1WN3iqNbkqZ8Sm+pmDSfZOlEIbgyYDMMle8kbg2u/x4nAHM2PrLjmfN14gjBuxmxTZxdoUgUPoMXmyrHSypgCgRfUkQCmwYXvMRfF/B39SHEpgDUIT2c2Ofio1tmxo7CoY0t/9zMnuP63VWL4zh043Y56UpvSbrB3PZZaHtp6eBstoDggViTm72qRlbO0fG6MMHbflkfEAVk24/arMe0NiIP2zWvQpFXDJ8dQ/dzWuXuX5W2uNR3VPkIBOlgMqHbcfUnVE5ye2No1cM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzgvSlpueGNrS20wQjNlUXNva2ZwZUM3cWRPY203L0VQNTF5NHVuaG5TZmpP?=
 =?utf-8?B?L2hzYWU4VHYvaXNUemRGaVRSWjEzMG9tTXc3UnB6RFh0TWZlNGIxV2oyeitW?=
 =?utf-8?B?dDJSQmswa05SMXA5bm94M25HczQ4Y2pnN3RpNzhkMVhkaSttcWlxNXVHdjZX?=
 =?utf-8?B?b0lmQ0dBK1F5RGNVUnREN2dLZU1KRXBQTDgxc2hQdk8xeHo4U2ZIN3NUTHBz?=
 =?utf-8?B?RUpHdGt5akhUKzJqUUw3Sjg5emg1cmZVaDA3Y3lid04zUWxyMmJHY1NNaEZM?=
 =?utf-8?B?WU45K2NwR2pLYkc5dUQ4VEljL3ZtbWU1cTZCaDZsZ2F2WnQrelg3b2dHeERi?=
 =?utf-8?B?TldUdHRvWDBwaFFadEk0ZXVHckRNR3NyMlYrdW52U204ZTJUQTV2YzFTSlBp?=
 =?utf-8?B?dnFLTi9pV2dHRzlkU1hFL1lqSWVXeWs3SFRUOFZZVFFLM09pbmRYbjNmVXVM?=
 =?utf-8?B?b3JzZjlxNThUNFZpUmFMUi9xUVpRekZvdm4yTjVXRG1uN3ZXc3dIYitZUCtl?=
 =?utf-8?B?RUVlTGYwR0ZyaHU4a2RYQzl2amI2L2JwSENIeWpFN2MxK1J1eVlheVlOeE1h?=
 =?utf-8?B?Mk9ZcHNtN2tueEhGZ3B5dXcyQ2N5NllyUE0wNXpkZ3dnZlQzRmQ3L1ZJVFVR?=
 =?utf-8?B?NlAzTzMvZC83Y09PRWpJN3dHN2JDaElaT0JUL1R3aVVLMGs0Y3cvT0tRZzc0?=
 =?utf-8?B?OGR1N0xIdXBEb0lmUXBIOUFPQ3ZDVVhKWWwrUHBva0FxME5wN1FsOUN4d2Nw?=
 =?utf-8?B?UXdKemtVNEpJRHZud1N2c2hSNExFdjRJSXNrcjdxY3lnUURVZmFrWWUzRXlU?=
 =?utf-8?B?VTRZNFhvNFhoN2lpbmNBUU96bEd1bFNhcmpMT1JyVi9DZ3BlSGRxMURrcWhR?=
 =?utf-8?B?bGY4ZFdMYUpxK0ZlcGtxQjBDL0R1ZndPUU9EQnFCOFg0MzU4SFp1WWNaV1Zm?=
 =?utf-8?B?WkhoZ3E2dGdSNHlKTGxPYk52YUNTU3ZQcGNTK3dSMm9RbHBKc3dmNHRTTnZC?=
 =?utf-8?B?cTF2T0dldlNHV2lmWkJFcFlUWG8wdU9OMFYyNHBib2tnWTFsem5qWFJNVXRX?=
 =?utf-8?B?L2E1WHVYUWxWL1YzUGVsS0pZcVoyZWRnNisvbUkvSVF0V3dUWVRveXBzOW4z?=
 =?utf-8?B?YWtEVzVHTGtVemo0SDJVZll6YjJHM0NPTGc1bUttUVhLOEM1WlRnUnRLMTM4?=
 =?utf-8?B?bnNEeSs4TllsS1I0aFZTczYzNXM0VjkwSWVnT3ZXN3BacE1DRDZUZHVxUTBv?=
 =?utf-8?B?K1lqUElZL0QvUGZlNmZ5WVJDcThkN0dWblFBdGQzVC9QSHk3aW0zQitRazR6?=
 =?utf-8?B?M0paZ3hxdmZXSnR2VHBLMVAwdGRvYk9KTTBram9kTDBIWm9MWFNGY0ZFWUxt?=
 =?utf-8?B?NE16cDVvNUN5UVU3Rm94MHZ6K2paNzdsZ3ByTFJtcy9xbUJuazBQQmQwQkh2?=
 =?utf-8?B?VzFqMUhOZzRKNWs1TmdrbTlmcWRaMVZBQ29GVUVGaDJGcVE1bldIQTBQR2xO?=
 =?utf-8?B?cWkraVQxbnVZeEFzU1FtOEtUczVqeVArcExzNGQ5amdKOTFXMGJVblhub041?=
 =?utf-8?B?UVovbTNmRi9hZzV0V2dWSWhxYzk5UXBRWCtydTFFUTBRTmpJcWx5bzB3NUdO?=
 =?utf-8?B?bDF5VUt6VjEyS3Rkc2ZYTEtXbUZVOHZtaVdPK0xLODV6aTkvSzVyR0tRMTFa?=
 =?utf-8?B?SWhBcGZseGF4UzI4VmMvd3ZVaTJzczU4VEJvL2tvQ29lUDhvcUhuMklnRzVy?=
 =?utf-8?B?TnZEcHlPdTNFYnFzb3dES2ZWMmNiOWNwOGhOaUhVTGdkcTg2anhDT1hnTFpC?=
 =?utf-8?B?OU1FN2htdVA5dUNadmM3MWFtK2MxbWk1UURWSWVJUkhad094SCsyMW9Lc2NV?=
 =?utf-8?B?a0hXVmFBV1JNU3RtYkE0LzZTQXk2SXlKbTVXeTRaZ1kxbzZhZXA5NDRxWUx1?=
 =?utf-8?B?a1ZqaUxhTjNraUdualZ0cmV0MTh3ZCtuMXhFZDZYaVg1Zld3eSt6VCs0bjA2?=
 =?utf-8?B?cXBIMUdDMXkxV085cnNxMDlESlRub3phcnBUUlJ0bjZBNXdocWhDdkxXOU9w?=
 =?utf-8?B?RldYSURaZ3JNS05RcXRBMWo2aUtRYUVaNitBMDJtYkd6WFR0MVkybWhKZ1Yz?=
 =?utf-8?B?OSt3MEM0RHV1cWxXbkZLK2ptc00rUkQyT0dkaTF3OGV3SEExSG5ZRVNKNGRh?=
 =?utf-8?B?QjRjV0RtUzE1U2QwR0hHbjlQejJDNXpGWElmUng2ZFNjSEZBRHlaZ0xRb0dS?=
 =?utf-8?B?c2dNSmhnNnZZbFFqdytqN21Yc29OL04wMW1VZHBuM2Z0QjN3S0hXYWVQWXZS?=
 =?utf-8?B?OXY3M1lsRmt3NlFyV0xLOUxkMkZVemo3Uy9VeURVQytvRnlmZWRrQnRrcXBZ?=
 =?utf-8?Q?OhorASMMYz2UvJu8=3D?=
X-Exchange-RoutingPolicyChecked: GPDIX4QXStcgShqcujBWTgWpJ4ymdxFaZcRSMvOgwuS3KF1V6CzarLGisroce4wTtBlB3kFV3UWoBGdzmTPgEAIc4hIyLw1o55ASsN9axjr2v58C8N8ARw3Cl9mwRNx3UgJDqTnvrVgoP1jH/8Wxh3ddu5d9T2YlWvZ12khwmMerkYZeeGogA6rFejCv0qOlXiQazfW/NRcu14uvW0/pjPiW2YMS297qas6c3DTPf5gppQig+PmkXpuu9VZ07CQzoRMM8F6NryuqQHhv5FuQfhDwPnt2tft89V0AxxO+tR58zUhDna8hCHdavz3zh2XWL+3cbkYzocXxXkBgWl6NEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfe2775-e7df-489a-5d12-08de8a5976b4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:29:58.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oidjSG2PTWK+C4ua0K9G70mKmf15IxBHchc3ICO328Pljshdfq0Q6k8Vk3wgVQ7GXP8dyAjergb6IJ+e84bztg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
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

On 25-03-2026 03:29 pm, Sumit Kishore wrote:
> From: sumit kishore <sumit.kishore@intel.com>
>
> Print debug message when tests are skipping on headless display systems.
Update subj and commit message. No debug message is being added in the 
patch.
>
> v2: Add igt_display_require_output. [Karthik]
>
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 3a67dd8cd..3a2649833 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		igt_display_require(&data.display, data.gfx_fd);
>   		igt_require(data.display.is_atomic);
>   
> +		/* Check if at least one active display connected */
> +		igt_display_require_output(&data.display);
> +
>   		/* Get active pipes. */
>   		for_each_crtc(&data.display, crtc)
>   			active_crtcs[last_crtc_index++] = crtc->crtc_index;
