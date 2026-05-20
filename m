Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A858CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B956E10EFD6;
	Wed, 20 May 2026 09:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRE2dpXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6110EFD1;
 Wed, 20 May 2026 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779269923; x=1810805923;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LZ01X/83GEhT7j9R4AcW4YSsWTAoj0qE9cl/VbButaE=;
 b=VRE2dpXqyNtwChTCiy/o21bOHM2noMCUgWYE7dyJ67iSXUAD2jvlsXp6
 Bg8zbRZYjUfIoP6YRhSe8otrN8SYmavHpxepmjots4ph+xyBowlpw2CA5
 xxxQYxITTysd+PvpzR46SVrLLCv5mZOhLeATUJlU/FRynsOVeilXSYl9D
 yWQwxDsTs/h7PvJFXrxnW0am2c0hiiQUzgZ2nUbNcqraiDUKlfub6h+rd
 y5eMIC2PKvQlxcPxVv1/8fyVecSjPUKFZByXTXEOBmiurFp86nR8xZVFp
 0kvGZxAIK07ocV+gtLR15cAauSdZRX5GgtZQnBhz6oB1wX7zJnPlmGmNV w==;
X-CSE-ConnectionGUID: 9twCzzU3T+el1PdymtgayQ==
X-CSE-MsgGUID: nBBTZo3JQMeevJGYfM1Aqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80014564"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80014564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:38:43 -0700
X-CSE-ConnectionGUID: o+dbWSf7TE6UTR0XatI31Q==
X-CSE-MsgGUID: CCxDui5TSkWS1KY0LgohvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245091019"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:38:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 02:38:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 02:38:42 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 02:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsvoquPEWB1Et0RMemfXsJp5CQh0QAV79ahrUMKTIFziy8KLI8z2X7vmE4I/MWMR7KAV3db1H12MtKlea9UqidgFnOhqKWaGJ0i3tujgj+gNHOCivls4UCLqYiYqCeA4TldmQnpIf/ng+9B4DhrZC9T4O6fQsQcelaCMyyLjisLas0Gc4LlxHQjUHBH3uDev57ECQzY1Sib7OZlXu5RfbzeyDmonJz+pC8IGeb9y3MGa3ktDe3owtrC+xUVvOJrR3x4UxNE8M8eS/lRAnsgJ3SPS4XNGTt4ObuI2gl/q6Pua5jo1pI2W1J9MsZ2YDGAL9WoPAWgeBLVq71cAZZnB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkiJk8cqZbHNGsKHfKL3+6V7XaLYcu5f3u5v0j6e5dk=;
 b=VtT6aYjJnIXnJ6xkRHVSkpbF61luvax/AI9PfeOkOfIYqCdRzBgGpLxLEBw7/7aJTA/VFYW3a4MFWRJbUOHRACdMlVN1xKhDDDBinVSB11nekGtiTltCiXerb2VEoVSuBVTG8Ow4+TOPGz5FyUleuumyoOZtMJVpYLD2GwJbz2H0Sceu3doVvpGRAqp/3tnU1+3kSgnp/mUQlkj5a1ljDTC4TyJBZnLmeE9eO9nvyliXVwNcouJXaz+xjUsp9jDi12Wg5JIF3MOubivG/wDpaA/wUIuprjRXcRG1LL0e/rRvoIpQLS7LskEWqCFdzTLcjW81lIB7f0PlgOZIQjrvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:38:34 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 09:38:34 +0000
Message-ID: <a85980e0-2307-4126-b47b-c76317e82d31@intel.com>
Date: Wed, 20 May 2026 15:08:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/intel_blt: Replace CANONICAL() with
 xe_canonical_va() for Xe driver
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20260518082113.1275002-1-dnyaneshwar.bhadane@intel.com>
 <177917172976.84041.10392873251829200017@5ab824fced77>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <177917172976.84041.10392873251829200017@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 287abc0c-0c65-4818-c871-08deb6538fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|22082099003|56012099003|4143699003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: OFjpMv/Y1nz7XteAIbVYLAzTa0zL3Tv/0NfqTPmPUzopjBBbv6cruWe5SemfB9MM1BN3zNiOEuFFltd+QqkPlmlr7kPNa0Dvy6DEvZPj6MOQ7vo+cqIc71+530VbY4UHZjBB1JMukmO6g7N+6ITKgpYhcyL/l6MjnLBKKEjNVQemSTcRHqaEZoYg1I4Eje1QOx6SHXs0hbjqrae1ePBdbTyZkucga0gfxBySaw5RbbgFmbWXbni/nImzAmVlh7U/kfRsIf345SI3IgDnOdt5Ekx5Sv/gaBvinFKvd8mLpwjPDNVVUR6ZKBY6wC9KfObLIdpRX8vmoZK1kqNc5py3srC62vovrmyTN0cGcC6DnQgbJb8LEGlSUrQ/c7G1Zdnr1RfT20BXlm1UTGUbnj1mv841aAUev6ojgyL9Z5JEZZzAkAMKlKdx+Gk9l1sECz6vegEFZGFVISfPRQMoR7siiIxkOeJXtlk2qFirg0OGokZS32KhkqOLm9ro98XH6Ki6i8PndSU1qc7pSQ6iOkomRP1TNbxY+K8r1Eti+WZQ7SBfWt/A+fu21ri26lyWt4VxuvhGZ7HYMJxM208QtTYf2fYGtLcq2zHg1YlzZrxlC8+Xj03zpYteNLKwJ8DLCKYr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(22082099003)(56012099003)(4143699003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wklod1d0MGNhcUVTeklUZnBCbVF1RnlCRFJ1RU1WS3lnMEJ2aVlOaW9BTnpE?=
 =?utf-8?B?SDEySm9iZUdNMkRZQUxzdUhuQWtXRE1WVU02dERjYjhRV25lRkd4RHRsVlRN?=
 =?utf-8?B?WmhuZzJTN2trYlZtSmJjNVpGNlN1S0VlWWhFMlNGVzR6dk1laG8xcDNjZFMy?=
 =?utf-8?B?aHNmNjdaN3RVeHhveGhVbjdndy9hcCtmcWhlNldIQmo1RUluUGFHOUUvSmxF?=
 =?utf-8?B?OCtGc2tLS0d3Ykh1dUFNRExkWG8xeHd4Y1NETGw4cHUrakVtcnZPTWUxMG9J?=
 =?utf-8?B?aDVoUDl6TjN5d0xadXkwcEVWRkRmSUxNVGQwZHpuSFE0TjhuUGZxQitRQWd3?=
 =?utf-8?B?eWgzOUs3aU1tZ2psdUYwK3dJenpDR2krelQxbkxNWWc0c1RIZDBCb0lTV2hx?=
 =?utf-8?B?d2pmVkZQWHRHbGwvbWVYUTBzZUZJdi93UXpRNTlOTlcxeWRwZTkzSVhJY0lw?=
 =?utf-8?B?RUdJTUJzaFNaU3dWV1l2ZTFPY0cxMkJHazFubkUzWVdyNGUrNHBEQmFVT1Fi?=
 =?utf-8?B?YTN4c2JSQkk4MUhVcVFyUWRsSkRMcmMrMnBYd2oxYWlpZCtmcTR3REU0MWRD?=
 =?utf-8?B?RTVMeEdjQTE3aUp6OGlVYWE4eWt4SUZyU29saFlmdU5vM1kwa1RkZERrekl3?=
 =?utf-8?B?MFhCd0I1MnNHZnBScXJ1WWdIeVZQWU5UcTFndWFuRjdmVzVpUGR2dmk3UGEr?=
 =?utf-8?B?eUc2T3NYT1d4aTR4aENvUitMd2xvbEREK3FBTndvRU1FdmdGTjllMDkyQXdi?=
 =?utf-8?B?Ny9TUW00b3hnTSsrVXhNdXo1UUxZaXUzT1pPNGZ3SlZLUmxnekxMTmxSclpE?=
 =?utf-8?B?ZlR1OUNkb1NHN3JlMjFuTHdHTmwvZmtYZnFFN0N5NUR4Z1d3dThNUFhXSyty?=
 =?utf-8?B?NDY0Qmh5d0JrbG04VFdyVkU0ZUU2aWx0bHkrOTR4eFRpekUrelpiVkY3SXF2?=
 =?utf-8?B?NG4wVHJreml5dVBUQ01BVWZVcitLeVExb3hrb0JVOFBmQUYvTFErTEppOENB?=
 =?utf-8?B?NVZ1YmVBQUZXenJ6MmxuSTEyU0RnekNPbHh2cVNaMThQV3dJOFZnQk9QNUs0?=
 =?utf-8?B?SVh1OHRWYVRBQWhteER4SnJQSU1Qd3V5Sk9HdjR0cmRXczg2dXVwUStIL0lD?=
 =?utf-8?B?eVAyaVV6YjlzeDRaWEdjRmhUUEZHcDRPQzFMblpqQkh4T2pMTkk3Zm10TkVj?=
 =?utf-8?B?WHprYmIrOE1PbzBzTG9CNHplY3RpMmZEa05JQUdGYVdSNW5FUTdKTDIvN0lz?=
 =?utf-8?B?WTdQWVZldUJDYlFnUGtEN2xMc1F0ZUx5RmtjNFFkVWlzdmpFZGJVVXJvOWVV?=
 =?utf-8?B?UklBVmxaZGRYOVZQell4VUtnMC9rdFpyWWNGVVFia3lMVFBNaUtGYXdrR1Ez?=
 =?utf-8?B?ZnlTUm1kbjFSYlFQVUFFWUVaaGdGSzJoeGV4aWFEMzFnWXloNHlqc1lWTUhD?=
 =?utf-8?B?STFBZmRoM3AxMnN4QjdBS1RqVk8xVWpQM2JneXhjYmkweDBvU29kdVkvRnBh?=
 =?utf-8?B?a3V6SWlnMFdyanRVWGVTSWNTbUFFYXVsenhJL0RmS20raVEzQ205ZlVDMlJT?=
 =?utf-8?B?SlBaZldaeTBDaGsyaGpMdC9sOW1ZRGRNcmdLZWVUUHFhOEhrdCtHR2l6NVlj?=
 =?utf-8?B?OTNpcnhacVBEYkFmbzk2eE45U01VV3JWR002VVJoVlRtYjVmZjhJaUdRZW9v?=
 =?utf-8?B?NXdzWEtHS0Rrc3ZSMVJPZkRzNmtLZ3IySm1jbGhZS0xpNlJnOHJSSGN6cWgy?=
 =?utf-8?B?OGVETmpFRHhTRHVsRVJoZzNWT0FWQ3hsUHdiVTd4K2JUSkZkV1RlbUpMNzVP?=
 =?utf-8?B?L2krZXhKZlc0N3paU1lUdjFUWU4yNUlyREZWWlVBOTVjOW9udlZUcU1CY0Rp?=
 =?utf-8?B?eFpId2h4bGpwNXZnMnIxMmJ4S0lGRitDVEdrcGU2VnlkVGJUZVV0TDBDV0hY?=
 =?utf-8?B?TnVGWW1BdVRRbTNmV2hVcUZva2VDSnUvOFNJNGx0TXVxTFZzZUpYSEF4ZEhT?=
 =?utf-8?B?cGVVaGYvb0JOSWFCK2llOUdVeEsxNERmbGRDZngwVngrdVBXaWs4R1NIM3ky?=
 =?utf-8?B?Z0dkSjRpUUZaV0pVNVJoN3ovWDVPdmgvNjZINUxoaUViLzFpb3NOS1ltQWxX?=
 =?utf-8?B?RjJFdEt3endKMzVGdnVLUWNsMGxIZjV4eTRvUWxHMnBCd2JTS3ZOY2dDZGRa?=
 =?utf-8?B?aEZSRVdiUDcybEtzcytsNVBGU0prY2ZEbjliY1RBeDZOb2tMMmowVlQraHVF?=
 =?utf-8?B?VlQrbHl5UDFRU1A0WkpudHFTMVNGbWZKVnB4TWNHZlQxN0x6aWdRQmx3NHhT?=
 =?utf-8?B?ekd2TTI5UEtlNjFpbWlsU1RWMC9BRDhxWXZMK3dPcmliWGNOTTNXWldsaVhX?=
 =?utf-8?Q?hYJ+uNyvznsBUk1k=3D?=
X-Exchange-RoutingPolicyChecked: mj6GlHKNHKMc+J36ButEqzvUo73sF26OcTg0wXJ00bTON6WTjr4PtVfrFTJJRwfk7wOa3Hz6rRy56W5YW0+OVtLel4R/ykYiqWwkw6wE9xQvebGrHeWwVKQ4YzOicDfsYU/0rAq0DmBcTeutmm4tQWtLQf3XEH7SKYandPjczgFxfB0AGtr3zi9ihQZhT9qWvDRiOnP0/k243cSN518VdmJSNlq4s2VFlh6OyLvx8vlxtROGL5yazYk2RZGyfCh8S3US27Li5RXa78gKq8t3xT6QofNAEfbM7flQAdoKqVGWLcB25WkvBi56YWwAfaW5Rmqcq5NUB40GQyuJMKX2ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 287abc0c-0c65-4818-c871-08deb6538fa0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:38:34.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V4ODLyYQeUXbjHZOFaE8tyAvqcocGUPEA8UlrVYtTZW8ArEAuCpUtzY0FFXpj+gxmmTSG8GkQioK2WAspjG98OEHBAooilOtM5rWfWqkh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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

Hello igt-dev,

On 19-May-26 11:52 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/intel_blt: Replace CANONICAL() with xe_canonical_va() for 
> Xe driver (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/166213/ <https:// 
> patchwork.freedesktop.org/series/166213/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8918_FULL -> XEIGTPW_15196_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_15196_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15196_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15196_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8918/shard-bmg-10/igt@xe_exec_threads@threads-wq-stress-
>         rebind-bindexecqueue.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_15196/shard-bmg-3/
>         igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html>
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8918/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_15196/shard-bmg-1/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
> 
> 
The above failures are unrelated to these changes.
>         Warnings
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8918/shard-lnl-4/igt@xe_exec_balancer@once-cm-parallel-
>         userptr-invalidate.html> (Intel XE#7482 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/shard-
>         lnl-3/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html>
> 
> 
The above warning is unrelated to these changes.
Dnyaneshwar,

>     Known issues
> 
> 


