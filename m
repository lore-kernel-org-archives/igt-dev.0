Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D7F99368
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1A10F035;
	Thu, 23 Apr 2026 10:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c75FTC1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07E010F035
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776939025; x=1808475025;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2HW71OsywIRM72iy4F0wg3zDaf2FJ7fJYWTzj1vov7s=;
 b=c75FTC1SQE6hmjesx6fstuy+iTNWq0OS9wiAXI4uin7T/2Iqyb+iF1S5
 1j7CBbnvpoPlJ+Xrw8Z1T+9UjsuWr9uUelY8+2vfsabswmtKvwDJPmBvv
 +PR9iU6NdE/1YMZkTkUSzKYlGCco9Ove2e1Kt1gZUdKLSZWidGBJOVkke
 tWsvxgwn8BxflYBHAAk7yweb8BEVk1qs7P1BHcaqiGKEQo/IbQrCpqvlz
 jL0KXfYBtJKHxg4o3LLI77h7m0Y8TElZZzAv3sRv0uWqjOOeqTfUZRLT8
 HG2Nci8LBMnwl5Xwiyf//C/Q5VpT7sTOJkLcNOUOLe/4LkSVYPQrvZneM w==;
X-CSE-ConnectionGUID: S22fLk7IRECoc2hcbFubSg==
X-CSE-MsgGUID: RNTJs1bgRreBEXsn1fWrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="80490703"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="80490703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:10:25 -0700
X-CSE-ConnectionGUID: Q3E1KFc/SFyyDZZNrFfVsg==
X-CSE-MsgGUID: 1xi0AWaERhKvvuZAv2xbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237670273"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:10:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:10:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 03:10:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chf2VxUP36OIfSL2D/NpnnE/8CGOcVqo5Z2akhMwSKe20TPuPkNI2QaQZtLi7YnX7m0pHovtpCkMWov+PFnjOwGtyIELKwn3EBLVOlI17nOelkOz+n32O0DlNxDwOZrUT/d/hqOWzWxP5K5nNmfTBov+XSF0zjAO1MZ/U8jvErifc3TvLuh86DNOehGR7etiAY4iH0GZpItCAAY8yqKF3HQtrRJ/V5qb8X6msoTATVydENsxnJM+FUuXOBD2w0e43fQ5Oyb7R7fZ505ifwZwsSnPRUzYR8ATB81BKc4hRXL81gIr7vfrSVlf8+oryXlcnyhPEBNbpxQuSQFo5qwndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBcAu/zlYVc/GPZnSCmAjI87AKla2EUOiTuesF/roOg=;
 b=Je76QbuAEb5u2pcxIpLeQUNN/pGAHLWkeYreelOtggnRJ9RW715iirejZtDORdMP3YgAY0syM4kokQgpXtlFQAkp8zq3sUsrw3P3CMUD3KfxZMS2i4V2vkP/k0Rw7hOwkNvaKdSKCIYtFs1xvPZXBefNrhUZD5n4XK06+RFJrBPd0Xk1hiuFEVALsaasjxPjwXJ6KT6vjo3QkrPSsEMyFxOgefq0+j7FsuhqEBw0so023X+5YDynItovu8o6ljUWAy+bvGOoQmzNtlZBbV9S66k4w4MI5/qJXAx/kmOVhPQdL89hhzB9LewYf046t0cInfnKcMOP3w5Ds3vvU0UY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 10:10:20 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 10:10:20 +0000
Date: Thu, 23 Apr 2026 10:10:10 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <matthew.brost@intel.com>, <jeevaka.badrappan@intel.com>,
 <karthik.b.s@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Message-ID: <ct77flhq73xronnb3ede5f3xosu66ixmmrtptonvge3tcjvr7f@p6mroacxpoqy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260423005118.2033963-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423005118.2033963-1-s.sebinraj@intel.com>
X-ClientProxiedBy: VI1PR09CA0177.eurprd09.prod.outlook.com
 (2603:10a6:800:120::31) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8cdc01-3b13-4804-18a6-08dea12086d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: mcwgrXePPyCW+gpmA+qFfZr4ebX/8TdbT0ziCMBUW2Gqbd5xf7fjRo6wqui/FmGtpxLB+dbRIswnPYtV30v1bDJpGUZJaIrMF+uxhBAwhKTak8rUKpyQllZ9baRPGSQU7kdIIOxmNe0pv+B5rUubI0hJevb+pUuOsg9Wc4jbpn6c5l8E17HltUCULroKW2NGqPGxa7pRFAhdWgmJ/c+Gyl8LCgItqkzLrERTh0euXoze0M8UmFLXy8RoNq+MOLkRKATdvUZjuWY8hZjSp0xEGdqNWO6iboQkrxcfuITxelOft20xcruqDeew1JI6hSRDyFMUPAiD57Jm4c+us2em1ZGGe2CdgfyBYfGlfYf2CVnsrdJghpNp5jU6ce+jweyf9APKcv9F4C4IrnlR9E/n/I4bfk4Hj3qJUOYlZh+wyGI6/KTRsZX5dNWZ1fQW8d5aAX7um3L72hakOmk9iGFFv+WT7Sgolns/7m/dJ8egeshvq/+cjE67XGTHdusNydsL6wgavJc47spxaEmAcLvuPkoSnd2/8PwUfvSqCdQ0J7hoHyQFqaqlD2ia7jEiHPCmJjbAGhcMQMxyeZqU2Kn9YTLcsStEC7T6K62zaD7gnMnY0CyHtbAToWYeA49tqXilHrbXcE0caK7LIEa4Fk0/Cn7VcMWZrg0lyL5TWLbP5s9uiXaH1jg0MhxOPQrQK2hB9S/gj7BfFRM+NqOhz9MzhkqgyFDj1KiKjkSeUR3EzGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lUYkEzZnF0ckFZRTE0b2VKM0lIMlFzQUxrc2NGcHlLaE50ck9sRUQvZzJi?=
 =?utf-8?B?ZnN6SW4yYlJHYWprNzhUdzlITlZPdGZOWE43Z3V4M01DcFNFaDVKMjYwM2VM?=
 =?utf-8?B?NjFwSGNqQkUrTHVpWWlqQ1A2aFZuOXhkVEVIc3RraVltQ1pibitPWUJhTFVs?=
 =?utf-8?B?dXFCRnVZS3YzbHladHZUR3JTSDdMOTdoTi9oeUdmSE9qcFdQSDlFNGk3VExM?=
 =?utf-8?B?dUdsVE9tcG16ejJTY05CQmVhbVFPNDRzNW9oTWVENlBpTTR0L3RlWjZRZ1NE?=
 =?utf-8?B?bHVqK1k5RUVWbWI0TmRkUFRvbk5VYnNwZjJFb1I4WC9VZUY1VVY1K3lnRVZU?=
 =?utf-8?B?L25VUXIyNHBJSHRMRy9pUTB4dlJQSHpWWTJBa2xLU1NMbTViN3hJbW5CaG1J?=
 =?utf-8?B?TWtROHpES1pkMm9TU081aENJd0wyTkdZMHF2T3BJQkVCQkdGWEZ1MHQ3bjNx?=
 =?utf-8?B?N2xMRXlwSVV2eG4vQzdtaW54M2V0ZWhsMjduN2h1NmxVZ0R1M0pOMVMycm1z?=
 =?utf-8?B?UWpBME9BSzNrdDAxeThhM2Q1UmZQampETlE5MUEyYlhjdWlSdDMzeUMzNG8v?=
 =?utf-8?B?Ym9HS05aOWZ5MkdDMzg0K2ZTaE0vNzl6NndXdmgzcmZjUFpkU0I3K205ZnNN?=
 =?utf-8?B?cS9XNHNkeElhNnZibnlmcFMxZHZGTHNNbk5FUGk3SzJ0UHFTeTc0VTRHcEVl?=
 =?utf-8?B?dC9LaFlQZVNRN3dHZm0vd2dGTzVNVjBGTlpiVHpxNitVM0VraXJJeWhkcytw?=
 =?utf-8?B?b1BQN0huOHRXRjBtMlRwQVhwSjZGdVErM3FHMTBpVmJmaGNTeGw3WWhQWG9y?=
 =?utf-8?B?OHUyWit6M2pkSVZ0SjVBcjE0OUMyem1xVk1NcEpKekdjaUNScnduVUpqRjJS?=
 =?utf-8?B?TmF0QmllTk1FL01vVTJaem0rbFI0cEFIV1RXRHl5QVB5MXAvbjZzRTFoK2xI?=
 =?utf-8?B?T3ZScW9qSEZaNjBLSS92UEsyMm15OW5wNnF0RnNUR3BxQW9JRC9lRTI1dkF5?=
 =?utf-8?B?eWhZZW5XZzVIMlp2OE1EMXR5LzJ4WGFqbU9Kd0ZER1pjSlhaQUpEZDZFRHgz?=
 =?utf-8?B?Z3FZbUFKalFRQUsrcXhXRzBPTWZoYnB3ZUtXMzhuR1VoVmRPbXNCT25kcEVE?=
 =?utf-8?B?YWJTMWJFT1ZHeXlzZWtLSmVYdGZieFNueXZGZlR3d2E1TFVOR1BBZFdmK1Bz?=
 =?utf-8?B?TWtCUVNzRkhuR1NiSGxpYlN0MEQxTG1hN0NJbUJyaXZhdnM2VSt5TjErc2Ja?=
 =?utf-8?B?bTJMUlR6c1I4QXNlTnMveFc1TGlLbjkyU2liTWkwbkllOExzTXh1QXVMd01q?=
 =?utf-8?B?QnFaTSsyS2l6ZGZXZlYwVWJJMFBGNGhtdTZ5SUdvUlkxd3hQZXd1cnk1Wk9N?=
 =?utf-8?B?NU90eTM2MHlISnhRZ05sL2cwT2RyNURnVDIwd2djOFJ6cFpPRnFhVWh3Z2hh?=
 =?utf-8?B?aGZaM2FSRHkxUjRqb3NUVmd3cmJhK2E5cHI1em9MaVRNeWtJUU1Cd3V0Qjh6?=
 =?utf-8?B?bXNwU0ZRb3RkQjdSbUR3bGtXR3RiWlg2VFFjSFZZNHo3OUx2aW9WU0d3SzlH?=
 =?utf-8?B?QU05T0ovTlZlQ0V4M1o4S2dRWVltNUJjS2JNTi96WU4wN05kRjUvUUpRVlMz?=
 =?utf-8?B?SEtLSGJWMml4R21QOGtCOUhYNGtoZjAxSTN2aFdaY3V0MlVzZEg0dW9FdklV?=
 =?utf-8?B?K05hbnZxM0tvNS93dEdUV2RCM3Zxdm1iaERkVWJYd3VTOFZsM1MxQlVZOFN2?=
 =?utf-8?B?WVRIdFU3WGNzdHdWTDNqdHVYajU0N3FIQ3gzNkRsYUFwbkgrZWQ2dXRZTWpZ?=
 =?utf-8?B?cnBzSjlraWs5b2hvSS9FbWRJK0FBcDBnSWhIbFUxS09ZMmFEak5vVURobnZI?=
 =?utf-8?B?b29Ed0U1ZklSRjFFMjcwWncyNHJjTkZUekJqMWxnbXFiell4UVRVL1NyL09m?=
 =?utf-8?B?NWNxL0c5Z24zaExyNjU1VFUyL1ZFNHo4ZHlyeDlNLzN5eDJrNnhEajE3Z2kv?=
 =?utf-8?B?RzNaYytsb0dwd0VvUVFIZHFFc1BaNmh5NStXaXk4TTJ6UG51WVZsZW5UTVVE?=
 =?utf-8?B?OXBVWGpNWkpPTGRzUmxMcTU1aTlRRDhqRjcyTUIxWHlkb01FYUlvQlFQL01G?=
 =?utf-8?B?TzJBNUQzQkpwTVZXbTdMd2ZxZzhUVjR1T3I4U3ZBeE5pZ1NtSDFFbkg3dE05?=
 =?utf-8?B?b2x1ZWJFZEJmenhwN3ByRUhiK05YRnpuRFJZN0dTUSt0Q2JmZEg2T1lxYk0v?=
 =?utf-8?B?ODVOV1Y1T2tFUk9qUGs5SmRvMVdFSVNKd056SEZXaldDNlYyeDc2ZFhIQWRm?=
 =?utf-8?B?M01rZitOTEtwa0RVYmd4RG1Lc1ROdVdJN3lzWUNzUHhGYUZ2L1FjeEkydlF2?=
 =?utf-8?Q?6vd7+u8vLMWZFI4g=3D?=
X-Exchange-RoutingPolicyChecked: BRYuFwMSUpqpblYAQjSdQ5HIY4iWvEP9vcguSsE3fKCPSopfZiGoz8xwMTG0mBAf4zsA0eetsgt0e1lB1AyCnXKFV4vVnIotrDF5WHDNG9qbhfsougCAZy0lwyVikuW1A3CkEeKHCbATXe3rG+M9gY3aZ94BptcsX9yTSRWNSohagcWnT9k7Wof0+hw6MyOgtnHToph5y+GFLXeCoHARNgPi3fHNP+ZB/5eY/PqEMOp7rX8yeCdysGRrTE40QGOxjEFV2+etvnLKlrSfnymzMBOPhAbDVqlKtyEatCT9oIN1z6u6/YWzjcbdaOWxH7JX/CbiF/eQyW4MET0J93cCKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8cdc01-3b13-4804-18a6-08dea12086d3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:10:20.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBU8vd3GYElKXnV1VTxfCK21KvqS3ggB0bLCoUH/wEQHFSKadFVU9tHyMb8qPtGrU49P6PLvlC2FWsWq0QSCnDRV22grmaid2LOsOdN+as0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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

Hi S Sebinraj,

[...]

I noticed some inconsistency in you commenting style in this
patch.

Here you used /* */ for multiline comment,
> +
> +/*
> + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
> + * fence takes longer than this to signal, the workqueue is considered stuck
> + * and the test fails — this is the direct symptom of the
> + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bug.
> + */

[...]

here you did not put dot at the end,
> +/* sysfs node that controls the unbound workqueue CPU affinity mask */
> +#define WQ_CPUMASK_PATH		"/sys/devices/virtual/workqueue/cpumask"
> +

[...]

here you used /** */ for multiline comment,
> +/**
> + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadline
> + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRESS.
> + */
> +static int64_t stress_fence_deadline(void)
> +{
> +	struct timespec ts;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &ts);
> +	return (int64_t)ts.tv_sec * NSEC_PER_SEC + (int64_t)ts.tv_nsec +
> +		WQ_FENCE_TIMEOUT_NS;
> +}
> +

[...]

here you did not include newline at the beginning,
> +		/* Start the cpumask stressor in the parent so that any unexpected
> +		 * write failure propagates through igt_stop_helper() and fails
> +		 * the test - running GPU stress without active cpumask cycling
> +		 * would make this test meaningless.
> +		 */
> +		cpumask_proc.use_SIGKILL = true;
> +		igt_fork_helper(&cpumask_proc)
> +			cpumask_stressor_loop();
> +

[...]

here you started the sentence without capitalization.
> +		/* restore cpumask from parent too */
> +		igt_stop_helper(&cpumask_proc);
> +		cfd = open(WQ_CPUMASK_PATH, O_WRONLY);

I know this is nitpicking, but if you would be sending another
version, then please stick with one comment style for multiline
and one for single line comments. However, this is a non blocker
and I like how explicit you are in your code:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
