Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F2CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 05:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCE310E35B;
	Thu, 14 May 2026 05:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fC9GP0wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F7010E35B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 04:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778734798; x=1810270798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M9dCbOJeJO6Tmf42O7cksXOlP+W8Mge86CGBbFySQi4=;
 b=fC9GP0wlSacDFgFGSBkvhz/+FuXV8gdblZv93b8QPnsmEEAUIWe4E+x/
 HljxSjzghf3VVjQa8VO3h534NhKYmUMfHXDRq6BKHZPh0BSFWlcg2LwKA
 /zpbA5atJFE+9LzqBSVFlRjCNc20/iwSyRJZVPAUOaNwBEhqnLBGGMIUM
 OqEmqyAW1s0d3ylmZppJ0tShtr93l6tF1l6yAnNBBH+ayRnilgtSfqPza
 QGMcm5kfOd/xh0ju6+bpugyPmErVTulpWTU8NdUmHsiY4yIT9zJM4yZU9
 QF2YoWkr0WJsyoK+qUnf5kyHRh98/qXAbTzbllTi2NmAd8tScGBzFxepE w==;
X-CSE-ConnectionGUID: Fskc0wUhToG1XZ2RrtHR9g==
X-CSE-MsgGUID: y1T+IMR1Sc275QlxNrgLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79567684"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79567684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:59:58 -0700
X-CSE-ConnectionGUID: 2/gJtk18TrmjJDUkijVEZg==
X-CSE-MsgGUID: Z5PKfUnoRxO95uq8D4V5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="276369995"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:59:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:59:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 21:59:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjZARJK0JKJH0qFkRSxT4en0kdqSo2yXLbLK2apNZxTREVmTeeTwXpLnDIHlPLJbhIbbu8ZeHeaCRgneJweWfbyzVqfdf6vF8S/Thmsa3OjACuF4YQoTXBhYtC92u6utAytyqovYYmPOsCBSR1JIHPLsg2jmeRfb/OPue0NypH3jZkoEhdGsVO/IVibPWNVzWJu5E7jYcJaQokE77dfh5x0SG5t+4H4hIK+od7zdyR+DT3DI+jtkRdFFIyIsDis9LY1Ixb5MSetwGExLFbOqp0vsBwvIedAYrlQQR7bcaDwfnM/s9cHPlicT2e0g8SPrXLqzHDcBuw/cWWscw8bf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3LOrq46f4wnEaGyrVp1vBVNe/TZAod35HtwTViTfBM=;
 b=Hm6d1C5BKFbUwBpYmN6OMAYokvk3lkSdeAGFIpc+0qQ3DSqiuBMxOE9BORIKm+f9FOXLqZ3ZgVE3vwcdfyOuvCWZGYLFgAqXsuTqP1zyVEKYk8ENaK6a+GHDxSHdXN/4KPIXZFtS5MfixAFMC40XpDHSZMHwxxNNRTVDj52kjeiGathv9dkQRN1ILoxljR5H3op+JaENaPTKj4RZxnTXpJdU1ZkybmN6J86AXHJyObnVMgfqy6O2h939sY+EW5YiizYTBM06jbWru/COdPYE1B5wxqEMO/SK4Dy/AjeJ/J5+kmfA7EuogkANm7OwcSa38SGdJiFd4CrWRmOjbnlAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Thu, 14 May
 2026 04:59:54 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 04:59:53 +0000
Message-ID: <ce2feb4b-1227-40bb-a2b9-959aa8fbe178@intel.com>
Date: Thu, 14 May 2026 10:29:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 14/25] lib/kms: Fill plane->format_mods_async for
 planes without IN_FORMATS
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-15-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260512122143.11013-15-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 221e720e-13da-427a-6ca6-08deb175a2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|4143699003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ef5kKMv0HmIjcIrkIm6AoP6m2wv9ZErzPN4pk2oW79cGBHSUKCdz8rd7Z3CepwPYxyUJNPDSCK/LytvmnnaFNEKTa44ru7FjjbsyyFL/Jl3CJVE04QFVQu7YJ/wrw2NXy3SmBfDCamE4gNaJH2jKGb6d/FkOnZeD6HC/SY9r9k6cuncMPGlr+ba7doJ1z7x1Rg5L5ucSq5gL/nAOS3DdUNRWzoqCa1MQgxrq9Mqns8q+/eebFh1trqlhPMe/SqClTt5MNSCgty9y0guRzxcQtuQ0e4iFOZvWn3cXRwC5sNixCYA004uEDeM5OmKQCeZZAUrMLN/XNR2AZe0u3BidTwTj2h0BuzSPXbS7WR3R3nGXKzPXEXw2Pgbfr2DkxZbxcRrj2Tjqvp7oE/GnGr26auiC6eLC1zgkrHUYBeomCB4VSiBePMJTGk84uEbb7WEU29QNm2izFg0O2MKmqJsRyGvkflJN/Ma6BgdHUtn7ASyBHsp0bltsySldaN6PybTNgVPBQXJlbJ0YSHwC29lRg5EMowdZN8VDNYnByRZESm85I6/1ZEsZkyCQL0iVHDoKn/TRTclSfNAZc1zgFDgunv53WqE5Idq/+hbjC7hVXuhQlKF++HKO7AXKnawXFBEaNucdmBc+UBANSPdI/+T7o0j/0BCRK2+s/m2DQaM7Nu4yjcufQJRqeuKB67ya3YS2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(4143699003)(11063799003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXM4RkdMSW1RUEllWk5vdVhVaUpBQ0gySkJXNzFJbUNUek56VUgzV1VBUjdM?=
 =?utf-8?B?OElVejQ4Nk1iK291VVBoblhteEVtV3ZJME03V2xzMGsySjVraW9Iam9jN1BE?=
 =?utf-8?B?cHlkblNpZzBGNzY1eHNhMjROaGRXVisxcE9lR1did3hNSDIzMlB4ODZFbVhX?=
 =?utf-8?B?ZE45Ykl3VmtmTFJBTWhnU0EyTUpOK2FkR0ZkQU5URlFnaHhPN2kvWEVxS0tx?=
 =?utf-8?B?TERSc3Qwd09wS1BwYzcwNkJPc3NNdU9sUE8wZWtleWtqd1QyTmtmZkpEVHNv?=
 =?utf-8?B?OWtYY0lKZ3pJY1R4OGJTNitrNi83YjRLM05tUGJxMURGR05UVUdJY2QxREFV?=
 =?utf-8?B?OTBYakpwTzIyU3o3bjJCM0ZoSEhqYlYwa3hIZ1VPRlhSa2lKOG43L3JGbGxY?=
 =?utf-8?B?YllLOG9za29POGt4WTZod2h5RTZXVXJrbmt4L1BuZUF3Sjlzc1NrdytSUER4?=
 =?utf-8?B?b016WHgrNGUreXNobWZycXNGL3VJcGllOWo1Y1Z1S3ovWkpZUGt0Qm9Ba3lZ?=
 =?utf-8?B?eDFxcHRnQmhFV2lvUlVZRWJFRnlJcUQxaDhXNG4rYlNBeStMQU1LdTJEUkYy?=
 =?utf-8?B?U3VwbXErVm44NWtOUklESjh1d25RSHh2ZEh6N1pGd1h2VFdjRHpaN0tBbW1B?=
 =?utf-8?B?MGZYRjYwbHBrTFM5TkZvVVN4aTNCTGROMnBwUEhPdFB6cW9VRDhnV2M2U3pn?=
 =?utf-8?B?cU1aZWh6R0ZjNHZxSkkzaU45ODVaMjN0eHFnVGd1eUNWT2p6MzBCL3g3eEls?=
 =?utf-8?B?Mlg1eExHM1gzOGV6MUFHQkhleTVGTFhoN1pXUWU0cW83WTJRbk5yZ1g5OG1G?=
 =?utf-8?B?eENRMnVhOTJYdVJoQ2hlbnZzU3JodTBIK2tTelRXUmZ2VUMzZThqMFJ4aVBP?=
 =?utf-8?B?TzZiSmdlZnFmeHc5QUJqTEhlRXY0TEloM1BvRG9SaFZRdzlVS1ZWOFdmUXRM?=
 =?utf-8?B?Yk13Sm4zT2dwOUY4UDFOTW1PaGdMa2hoRU4vQ2tUczFEcWFUWE80TlBWaVN4?=
 =?utf-8?B?VFlKL3oxejRCaGN5MmZYTUZzU0o0eXZ0ZUJqQy9lSzNZVDBybDBRckFyM0gz?=
 =?utf-8?B?dllUNXh4OWRIWHNkYVlBcTZLZElycjJ1RVZhT3hPWHNKc2NuclYwa2FCWFZR?=
 =?utf-8?B?TCttVzJzRmxDMmdmUml2L2tRQXV4SFBSczdzd1BoSzBJTHduWFFKYjM0TmVM?=
 =?utf-8?B?M083UFpPSGl6eHBLTUFMd2pxbmo3OC9CQXVpS2dNdm11U2VlNmdDL0FUZVlh?=
 =?utf-8?B?V2tYUFdyRmVacjhOc1owS0U2VWVuQmJFcjU0Q2IyU3BZVCtnMVNsM1V2Q1Ew?=
 =?utf-8?B?WU9OTmxrRlZKZ1VLNk9ieWpoY0lNd09DbHdFUWJYa2pET1V6cWdsclZvVHZU?=
 =?utf-8?B?VGtVbFpycGxhcXZVMFpJYTErQkxrZmJ2MWNvdy9HaUVNU2hHQ3dtMFNMNDl2?=
 =?utf-8?B?WTZZcUNmSU53bG9NUmtJV1BNSWc0Q1Qxc0RQSjRqSVZBWENaMk5WWnlVQmtT?=
 =?utf-8?B?NW1MZkJCZU80RCtNUll1N2JqVnQ5NTc1ZHVxRlQyb2VoVTRpRzlCdytOVTF6?=
 =?utf-8?B?SWo2NFZBazVGdUhUVVZQdkZndzFZb2d5MGhkUm9HM3dPMTFRblNlRHpqK3Z4?=
 =?utf-8?B?Yk9aaHoxRWJNbXZCSlRYTE1vY1dqTnp1WFdUZFp2WlVnb3RpREcyQTYwUHF2?=
 =?utf-8?B?RElZVlZDS2pVRm5QNmg2SFBZQklncitmNGQyRVV5K0J1cy9VT1lSZHJnQnd5?=
 =?utf-8?B?Yk1XVldyTjBhL1ROL1BxQ1lRWnlnRzJyNXJZRW84UnlPUlRzRWhUaVpqd1RX?=
 =?utf-8?B?ZXJ2Z0NRbklUeXMrb2pUYjdaTTBNN2Q5Z0ZVZjFDSjkrNytwZWtqdlVKeVEz?=
 =?utf-8?B?L0lOcWxROVpQTHBRVWl3bUdmVmhlZm12NzZ5MTA5U0FDVityd2tXL2ROSE1X?=
 =?utf-8?B?a1dvTUFlQmkrL0YrSWtjVkJ0RWY5cy9LRTYwdVIxODZIQXdpRGdaMUpXM3Rh?=
 =?utf-8?B?MEFETGptV3ZnemJtSEpQQWhrRTVlTmF5N0tWOFIvWjczaFVQemt0QWN2MHg2?=
 =?utf-8?B?Nm1NL2R1c2hndXVQVFp4K3ZlcGRvaEV5VEhRdTFkTTNyQ1pLYlQ2RmVoQjYx?=
 =?utf-8?B?MkN3L3MxT3FxVTBFM1RWYnF2OC9qc2VOQVJoSmtaSUFvWC9sVmV3bDlMaTF2?=
 =?utf-8?B?UEs5NjJHTHJJT0FhV0p1U3l5UU4zVzlLcVMrbEpRTVllSU5qa0toSnpMV3Mx?=
 =?utf-8?B?SWJyVzgwOWdSelpBTFgyM0N4MWZwV1dBRmdSTlh4YmRjZUFoazlZVTE5ZDU2?=
 =?utf-8?B?bWNzbHFjRXcrUUNQSGVoNXNlRFp5YVZyenF0SWtFRHh2YVU1VTlBaVVoUEU1?=
 =?utf-8?Q?axKrs2Kh594Z4wgtGskp9qJCuL/7CY1OkJyuw?=
X-Exchange-RoutingPolicyChecked: DNyvF1xqyCRvfvNMyruLQwPavG+9vu7x2Z9nF15vOkPPQow6UhtHEU0YVNfhUjcXJqvSULqQoBUcpzJbQnvF7nJh8QUWizgSVY+H07v7Ob31hsyqmuKSgpzpDpNnLeM55mEZTZ5wyL973uErjhgDpGNT2F8IxTcGk3PBCHEj+g9rJSvKddI9orLf2fKL0dCvdHZKWJV+kWdUnYiiQzetz8YEYvJB5YZD1DVJD8OoKQnj1334/9GglVfCDDDVFJkj8noK/Lp2M5gux48HxitrFLr1GNB4wt8NQ7BzZT4WG+smo+hIelDBBYW5QnNbxjJZSvpnhwCAZKyaVVnNX9YoHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 221e720e-13da-427a-6ca6-08deb175a2d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 04:59:53.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /n7qFVgysfhqyj4Ae1Ot3mGzOL+S7+l00pu47pCobjUnoIxmbTEhxtha/yb2URhcM4lvxlOrOeQ+Ju37NohtDKv54VG7M4dc1qJUPytQoTOODhJKHINkoSvjutMILw5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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



On 12-05-2026 17:51, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Fill plane->format_mods_async for drivers that don't provide
> the IN_FORMATS blob. Since we don't know any better we simply
> make the assumption that all formats are async flip capable.
> 
> This should make it possible for tests to rely on
> plane->format_mods_async without having to do additonal async
> flip capability checks.
> 
> And if some driver can't deal with this then the proper solution
> is to have it expose IN_FORMATS and IN_FORMATS_ASYNC.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   lib/igt_kms.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ebc13063dfb0..b81be73978a1 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6246,6 +6246,9 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>   		fill_plane_default_format_mods(plane, &plane->format_mods);
>   
> +		if (igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP))
> +			fill_plane_default_format_mods(plane, &plane->format_mods_async);
> +
>   		return;
>   	}
>   

