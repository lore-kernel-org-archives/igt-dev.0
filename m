Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D7CFB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FB810E2E2;
	Mon,  6 Apr 2026 22:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9SI2KEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F2810E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514920; x=1807050920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+NprTjAOS8KgTHfBPibkqBJ+OHQK3QhV86svLK8Ue6U=;
 b=j9SI2KEWq5EhrCKRUDOip8lybOMiM5iPuV/VjymPYWcsiIu4+VwTFtTt
 nX6gKkXkATy3f39PAQCV9d+QADLAwYoHGIzqK+iqDiRQglDD/8utBLWkR
 pI3JOrj4kWY1k1TrQIfiFg61WBxEK68y7v4DS5dMTr6IcBHppxleZ2Y+d
 3jXm19IOHL+4LNJ8tD8JVZzADvIUx0Lmofw9ZZ4NQSXuVBIOgeVQVQUls
 AZrdhPTVtZEaXQoe4Vq/H4+JpK/nNHhE+xdYLQtf4Wo/YQfOTDAci/XEo
 smPjHEim13IC1FHD1ITQ5FaR+XdSEqLv9HeavVO4wNtRnB7Vlrn/iqZs+ g==;
X-CSE-ConnectionGUID: R4DVmbJaQfGQxSFVwj5Oeg==
X-CSE-MsgGUID: 8E8FK7zcTcSXYD+wQO7CgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76349720"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76349720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:35:19 -0700
X-CSE-ConnectionGUID: 7eRV+Iz/T4ikzZwiPhe7rw==
X-CSE-MsgGUID: ahhWSEUtSf6qQzSwkcL3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="226983785"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:35:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:35:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 15:35:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:35:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ko8QZo8Zv3HZQ2iWJ2mhzXTm2LnLpo9uPP1fozoZV7SmMxkfRosA5kvB12bXtXS2sbeesUnN2pom1b4eR+gt4Eup81N2aEIybDxUdnE6l4v9nH4yHlLsJeSVolE3TRACFxy7Cr036iF63v65dJycRvd4v7D7LOw8dFptcIMVXOKFj8qqiluA5MJ6CzzBcvCYM+lK2RlZbAxO9dR49p6AbKg9EOaoIbARNsp9XE9tlgyiCl+ID1P2oloifuw5EYhbq9IBZm+mwIit5tDscSc2tfWItfrIX1ri+NEv2QPKodQKZB6jM2pwu+D3jdkQxfhEaqEcYK+aau3PCDR7CQcBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00t4eL2SvNIULvtF9Hzxnvem2G4Biy1GqKiS3x5vrmo=;
 b=CO+djJ3YeDJUTSdWG77eLVkZQlbC0Br9Dm7SOh+Vjm+aIABhUsyTMa6FXL2XHQu8V7vgsQiuFwIcNvxksBAoe3Tw96+iv39XNegfTw2/xglqw0kmGyFW7WyPDGpFPLCMN/RDFISqJzQHAvLg+cKF+m3mJ3htbk23BGscT1GJgVbzDL5Y3vx25Z92SkiQ6a4hQDD3ZmP12+FhcxSlnc4xjQrBgGzz33pIEhXSq/h0aqeWT0zLOWAzPtYee01yWLUTY8ufeAYWoFzCupZixEBZozGzQ7u7/KtaQ4Y69ky5KwR/IdBy9BdwUzuaZn7+/aSH+RU7pUSOgeDVXwvELqBTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 22:35:16 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 22:35:15 +0000
Message-ID: <7cb15d68-2893-44b3-9785-215b9b4fbd61@intel.com>
Date: Mon, 6 Apr 2026 15:35:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,4/4] tests/intel: skip or adjust tests for non-multi-LRC
 engine classes
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
References: <20260403071322.366766-5-x.wang@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260403071322.366766-5-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0263.namprd04.prod.outlook.com
 (2603:10b6:303:88::28) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|DM4PR11MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 30450fb7-91af-48c4-f031-08de942cc632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: oIfqDWx5zqVSa0w+4jszW8dlm/kQK+SofUkF5VKojcemkz9vU2bt3cNalGQl/MAkgp+oPcXStXsdrEWlWmIC0IGFDC8RNtoXp1G2y+YV65q5beeLNCmEUbvRw0xNCw8MEvhBwfqg8FNtvB/u8WV7iQWDZriQw5ijkZDsaNzqxx8ywJiHU8KJU6olybQl0vJ/VMF/nmGWVyaqJq/UhV5xBIkkOCEUBA4e5rXBBR2791R/tBPz9Ocn/x6JRgueCIdGrKAnbtwC1M1+jzumEFt7g8qCn/CJ4dXQ3LxWX5NQJWtmeaqXwOexFx3aUbcZGPxoJ9DHFaqzH66CSfrKRl07w7bczlcA/v0q2TkWIzvu1nAtjCBDhw3tloE+Oi1W7XTYSbF5WF+0I7ZO/COINGP/NXdq0ajuhsHmGOU8eipUmMWgcgJRFb4EBbAYR7a82gKDuaAFypOCwUainh4xvePZUAQhI5bOZ8X89lYILkUzIr/lct2+FaP3jTxEe9TwQ2MFAMqciFSbAUdTMTyTOIB6+EG8LWJ7WTxpFbWMXKDtXh83WARq5iynuJZkAbLWRCAsgGMf05rADb/JAWU1Wv+IUnUJeklSoW61iYt9HnBp/jbhziVuf3xBL7Jtm0Y/3TGCBf8kca7VCfTmhdixjJEyPdFzZCBgEVkh9p9dXAiBCgZD1tCRSxIT67+w2qfVvUeSgeq2VmZlcWovMxBB/wBEKFFupClRko2j1LTJBpuwfAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWs5T1FqWWRJK3hMckFQdWMzdEQrdEQ4d2ZmbTFVeTdPS0piZFpManRnOUNu?=
 =?utf-8?B?MDFhRTZmam9tWWcvRXVEWWpzamhKcXZmVytHbzhMRHcrQmtia25SY0ROUWJa?=
 =?utf-8?B?dkxIaGFPS2NiZUZrVVZKODNqZmtJTEVYRHNzZ3hheTA2NWw3d2h6WDVYTzlC?=
 =?utf-8?B?aFF1aDhDcXpXYkE5bkJkZ1E2b1JDZjdlSjdBQVVReTV1MFpCVEVoZWx2QWc2?=
 =?utf-8?B?TVlZZXJkL1FKbmxFOGVjd2lzcXN2SGQzamFKcFhDMUIwOTZhZ0U4TEY4VlpS?=
 =?utf-8?B?bEJUUHBlL3BKWUJjcDNac3RiSm1yT3V2d1l0Rmc3eS9nN0UxcFdMSWZLRDlJ?=
 =?utf-8?B?ejNNR0R2enBDSEFqaElrOWpheEd5dGZWUktucHhRUTVtZUFlY2ZBODl2WUty?=
 =?utf-8?B?VEhxYkZ1T0FPQnFNeGZhT0FGNTJlZDBNZ28wKzcxRUQ5YjlSZVdjY3BSOFhL?=
 =?utf-8?B?NmFtdnkxMU1pRlZqaHl3Zy80TDJsS1lYVE1ldU84a2VRMmJZeFNwczV2OXBX?=
 =?utf-8?B?MUEwNTNON2d0VFNzVW1IRGhhUEJxU2FsRHFKS0xsZHkrOExFOVFYOWFFYVN4?=
 =?utf-8?B?MGJ0M3p0czVZRGxxdEF1bHRLVm5vVlpCOGJjUzk4WWtqOWNGMFBxN0lYUlJK?=
 =?utf-8?B?Z2xXMVV3djd1M1FRQXUzNTVHLzJqUGJLSjVSU0tycFdFa1NQRG50VjhSWXZF?=
 =?utf-8?B?dzVwSWRWeEJnNDcvaXNuOXlzaSttbXh3VytZSE9rdytNcklMU1MvSmhhNHVG?=
 =?utf-8?B?bm1mbE0yVWRhSlpEUERFQmhzSHBCTTl4NnJnVXo1RzE4T0EzTzFsWTd1Q255?=
 =?utf-8?B?dUQ2RzBXWWtMZjVpOVY5dnorOXNWRUV6RVZwT2xFZERQL2hHU2tVN1RzMk5t?=
 =?utf-8?B?UkE1bnQwclhvSmNpMGx3eVNPNEU2ZHRoSmJvV3U3YXczRUlKWGEvb2NLcUNV?=
 =?utf-8?B?M1NyeTg1ejRyZXJUVW4zcmJFNjFNd0F0UlZJWmZ0YVhYWDJpb2Y4K3JnMXRI?=
 =?utf-8?B?UUVIUUl1aC9YSlRKb29icys1ZGVGSkJ0UGtDOHN4TlkyLzNvV3JVcHpGdEFo?=
 =?utf-8?B?V1hreCtNQVUzdzJYSWVzaTlWWk5acGhTa2RpWmdRY0FxSXV4NGJ3ZGZ1dzJ4?=
 =?utf-8?B?V2lrbjJIWmRQSVB6VTd1V0piT2hQcGR3UXBkR2hxRHl5SVo4UE9nUkZ6aUpq?=
 =?utf-8?B?U0NmRDFDRnpDeWxZNVdUejducVVhQmpzeWRLdXJhcFBPUVlONGJkSVBRaFJM?=
 =?utf-8?B?R1c2bTBHUjBOZ1Y5cXBBQVkvVndqYlpuR2hneEF3RjVhUHpTak5kYTlNSTdj?=
 =?utf-8?B?S2FvUDJDbmdpSFlBQlB0a0JzSGZ3bHNPaUpmZ1dVNVladFJCallsOXpQQlZW?=
 =?utf-8?B?NlZiRTJjWjdQZm40dks2MHR5L2dQZ3Jidnd5eCtxWkt2bkJjV1ZmUHBRQTdM?=
 =?utf-8?B?dVlDakZOSGt4MVFCSi96WWtCek9aYUVFcTFiMS8xbDF6VlduaUhCSmJEYVhh?=
 =?utf-8?B?NWVjeGNpZ1lkcmc2SkJYaGg2ZDVjUVlLL1VyR3RUTktxM3U1RkRpczJtZkpu?=
 =?utf-8?B?UlpMeHBDdnBlbWU5VmtSOFQ2ajZPdENIdWEwUSs0aXJtS1BZd0kwTWxaU0Ir?=
 =?utf-8?B?eHlETDlCeUJEVmRxL0Q3MmlYMFhoZUR3UUEvLzJIUm1SSEQzOGhDR2NDai9R?=
 =?utf-8?B?ZlFTYmU4NDMxa3VKVDR1NHZLOGNnWmpYK2kweTFjMzVLVDE5dmVMMmRCQnNY?=
 =?utf-8?B?OXl4STZ4OWtRd2FVdE9hM0ZndmdNSkhQR2RwVllBOWZGYXJSSFIxblNpNXpY?=
 =?utf-8?B?eEUvNTdCMmN4WVlyTzN4OFRqbU1sdXJsVDV4R0Z5cEpjZURzSEJZTEU1QWhj?=
 =?utf-8?B?UU5SR1doZ1JydHhyVlB3VnVzT0RJT1dlNlJ5eVBRdS9GNis0RXZ4WWJqUlN3?=
 =?utf-8?B?MFpnU1kySThId2VlbisyU1RSdktSK0tBYUJaUU5TTGYvV3FhNGJrWm5VVVh4?=
 =?utf-8?B?SGJ6Q3lrbmZiK1M3MHBZeHcwNEFITnpmTk1MOUtPR0lNdTdDMmRtUHR1SitU?=
 =?utf-8?B?QW4vY3VqNkhYN2R1cHJ2YTFCbFdDcklvMzJsSXdEUWlXS2Ixd295ZXkrL05p?=
 =?utf-8?B?MkR0R2xaKzVTaGdqdzRBL3pnTmhQMSt4bEVIWmQva1lKUXdDT1JKUytJeXNR?=
 =?utf-8?B?RVhSbDBtak0rbGdva0dncU5TcnBvSnRZeENWTEdJNnJLNnY1Q3JqWW81TzN3?=
 =?utf-8?B?aUV1Wk1vZXZSVi9BS3ZOVVEvckt6MTRwZVNYNTNjdFZTOFFLeG4xeXFlaHIx?=
 =?utf-8?B?d1l0bkZETG9GMWhrTGo2SEVEcC9FUUtzTWdiU21QSndQTktLZGpLb3FnNTR1?=
 =?utf-8?Q?F25NyRGz+WsZq62g=3D?=
X-Exchange-RoutingPolicyChecked: PLK3Iy9R9LSXCZhkpEpVEo1NJ/Zz4W+ucHJQz4h+0tIRGUYUyRRsGB7HfsztcIbgJHSNvQBzManK8fkiXHC64QOfOXOjPWX293D5/vrTUsIG5UAyhLUxZbFNJRrGVVLZ0/kGDJ2IUARSFKDigYfpoHg1tzug+k7sIIIUJsCYiUHdQqNUHyPn/CfenV+4cI1gW6AmvBCh7m77vJp0xRu5ppEdw5XQyVBmlH6QpC/vyqVLndHycx5JO7HqBoSo6jcpyw0JUp5nyTXutxP1GhENEE4wg1PBrM9PWLNYV3ByZg70kt7ZRiOs1u+z2p8o+/Bd0XvkDElwOe7Kie3BIE7+ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30450fb7-91af-48c4-f031-08de942cc632
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:35:15.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yISm8+64JKxsQC0RcSrQ6bv/x1VEbuQ57SGiYweuK/pZoCWBwPJAcgdjSKYjGmEhnSSOR9GJntGNwYFFhmloIp2NJoDX7E3o58WrqU2qVCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
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


On 4/3/2026 12:13 AM, Xin Wang wrote:
> Use xe_engine_class_supports_multi_lrc() to guard multi-LRC test paths:
>
> - xe_exec_balancer: skip tests requiring multi-LRC if the engine class
>    does not support it
> - xe_exec_reset: same guard for the balancer subtest
> - xe_drm_fdinfo: skip utilization_multi() for non-multi-LRC classes
> - xe_exec_threads: assert multi-LRC support before test_balancer()
> - xe_exec_multi_queue: only validate parallel-queue rejection (-EINVAL)
>    for engine classes that support multi-LRC; non-multi-LRC classes do
>    not accept the MULTI_GROUP flag at all so the check is irrelevant
>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c       | 2 +-
>   tests/intel/xe_exec_balancer.c    | 6 +++---
>   tests/intel/xe_exec_multi_queue.c | 2 +-
>   tests/intel/xe_exec_reset.c       | 2 +-
>   tests/intel/xe_exec_threads.c     | 1 +
>   5 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 411ca6ec4..3c113ed5d 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -673,7 +673,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>   	igt_assert(virtual ^ parallel);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return;
>   
>   	igt_debug("Target class: %s\n", engine_map[class]);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 9cd641b4e..3c6ec45f1 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -57,7 +57,7 @@ static bool test_all_active(int fd, int gt, int class)
>   	int i, num_placements;
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -187,7 +187,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -402,7 +402,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index b5ded0633..ca96099d3 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -112,7 +112,7 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
>   
>   	/* Multi-Queue can't be a parallel queue */
>   	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
> -	if (n > 1)
> +	if (n > 1 && xe_engine_class_supports_multi_lrc(fd, class))
>   		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
>   
>   	/* Specifying multiple MULTI_GROUP property is invalid */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 7aaee31dd..95191139d 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -184,7 +184,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   		fd = drm_open_driver(DRIVER_XE);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index ab9565beb..7b8100c5b 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -85,6 +85,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>   	igt_assert_lt(1, num_placements);
> +	igt_assert(xe_engine_class_supports_multi_lrc(fd, class));
>   
>   	bo_size = sizeof(*data) * n_execs;
>   	bo_size = xe_bb_size(fd, bo_size);
Reviewed-by:Daniel Charles <daniel.charles@intel.com>
