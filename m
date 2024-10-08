Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53DDCED26B
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 05:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592B010E45A;
	Tue,  8 Oct 2024 05:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyFKznS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76AC10E45A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728365156; x=1759901156;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mmj7v0kfnYL+w5NbPLoWtP7SO6a7VqJH8KyMJCq89z4=;
 b=RyFKznS9wJ+XZrybl1CZqsXWYPWw1H3z9DCY7Z7jFCxU8MWyQP6OEYdR
 gEYqK2iAsTC8QgAxgfcRAuePnb6xag7M7/3yDg2mWJ+QPnnYLqqifuauq
 Ys65F4dI3KMPXmEsc/7rLBZ4KvFlSdH/PJofsIz5qb833AZZaDB01x0AZ
 fduLnevoBFEF7MOPHAnGMvgASvoSLTmJbJj3NWmicVouryILlUioJRzvM
 PIWpvrukxqQQTEGMrXONU0S/FZE3e/CGTHAMYTFPTkJlDj5bPS13ePMcF
 AqyNWyknO9u+e1prN7U0FtbJeRbGqMdcZQpppJKLgmsgo2QIHQbw9gQC9 A==;
X-CSE-ConnectionGUID: NHl/6FtZQW+PPqvLT8Z2oQ==
X-CSE-MsgGUID: d789nAiGRiq8TDKWJTR+lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="30420249"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="30420249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 22:25:56 -0700
X-CSE-ConnectionGUID: XkI43KjRQRKv6mB6YQaTGQ==
X-CSE-MsgGUID: YbwZjkKAQEmq++89YV2yKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="113166908"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 22:25:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:25:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:25:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 22:25:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 22:25:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY7UaBz9KtWSo2ILsZM+GZPPOwMYwBTWQX7Ll0QKVyTQC86kaULFmoF4u4VCZVTtS+B7MZPeqPQgQY/+39NIAjdA4aNuujV5gVCipc4f1vZyEy+JkiS6nMXIddCZnZu6PnsEPj/lkGGgs0ZCJLNNSUawTeF1d/bxG57RGbetQXU2OK9POW3gUAian/36uDCm2cC5INpyy+E9IuoJrLwBZdD49BFEHGAxkbKEcUpKjajD4H0ow867Ai4+T9vzWuxqls7b6A/JqNtciFFbGJsvuPCOxepTELNLhX46CTw+0tknJtW7I8r8AmvMXSWH9FuVxvrvBGOOECC8rX0rUy+yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/Umeop7BJr5jan/wXjlHf6+qW/d1I40pBeY7S30hA8=;
 b=XheFk1jqfLnLwGFbR6Z1ZueXIgCdGCYriBlfEujFa/9AT25VarPCm+OOrmM84X8ZpgZLUijZZWuSivdzEbRSVRc8Q2HtO5qYkdKdXan6jngq2NaCode4GA/oHhKud1Wnei7kNK3SNaWuz+J3Fq1Ox6hHQuJfvKUma6suOZOBL8DnBOrYBfJ2I7cfaRS9po1n8kfg/bAYvgF8ATdW1zQbVozRbF0ZIgYGDh8t/yDdXeDgW6vpIpMSZm639FCIA+VlUjRtKFMgjCSx914VQPtvAvpb+hTg7qpKBk6L3JvkfQnSA4YvwbXd+Z6X6VV5+IzPfwrj++nckDl/A6HtNyxbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 05:25:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 05:25:53 +0000
Message-ID: <0e7c4c4c-185c-4f54-a02e-27cf019f575b@intel.com>
Date: Tue, 8 Oct 2024 10:55:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_oa: Preventing test failures by
 omitting rc6 disable test if 'gtidle' node is missing
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>
References: <20241007190541.141470-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241007190541.141470-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b602668-64c4-4e9b-31c1-08dce759ad61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNBS1BYNG41RXBBd2J2cGQ0YmhHZUZHSVIxOGYyVXhZV3poZVpPSkU0aEFT?=
 =?utf-8?B?SmF3L0hneXdPVWVscEJHQ2t6Y2tpK0tFY1RJbjVtV0ZnZEZ5alVXSUNTR25Q?=
 =?utf-8?B?Zm1ZMmwwY2dTbzQvWXVmajVUVWRrMUYwUExGZkpXbDFDWWRrZjBhSGpjNlRx?=
 =?utf-8?B?cjYyRmhnNHdzakZ3VjAvNThvL2lzRDNmZnVEakpBYmRnMFVsM1U5NEZTdUdB?=
 =?utf-8?B?aFV4SmJPMnozSU1IYWRFM2IyckNaclNXMXZvaXNyK3liSWwrTkxCMU9DTnJh?=
 =?utf-8?B?MUJtd3dIemFEQklSYlZaQW9aM1k0VGVIMHQ0dUpPUmRtT1l2QjA0d05QaDlG?=
 =?utf-8?B?UzFNY0N6VDY0RXljVmd1SHBxRnMxVnhWczFEa3JpSGRQTzNOWWdFWGZDOHFm?=
 =?utf-8?B?Rm1GZnBvbUlKMDlOTmVId2R3K3BUYTZOcVNrbmFnWVkyNzZqZDBpZ25mZ0VJ?=
 =?utf-8?B?MnpxN1JKMmp3ZlI2cGJOQWt5SkJTYW82Szk3R1JNVlpZc1ZKWWRLUDF1c0Zs?=
 =?utf-8?B?Yy94NzI0eGk3TmFJWTRhZUhEYmJUYVAzS20zVmJRQTM2UmUyZmdlZ3JPTVJJ?=
 =?utf-8?B?cnJ6UUQ0anhwbUd4dDBSZ1RaOU9XZ0tSbHgwenFZaHZEMDZnUUNEOUdwMitz?=
 =?utf-8?B?M25HbjY1a2xSaEVGKzFtRzVZbUJnbkpMVFRaUjFicEkzOXUvSlk3L0Uyd0xN?=
 =?utf-8?B?bDUyS3FOdktXS08raVlLVW1lUXRTNnl2d2ovNjhsSzBRRjZjWjM1b1h4RE1l?=
 =?utf-8?B?MnJHdFU1amZobENRTGZJRHdyR09IN210U0tLWCszVEpVMEU5YTRRZjhySTUw?=
 =?utf-8?B?YTdHVkFORkxjbFhtdWZQYy9yMEdRSjZkNy9YZnJla1dEK1Noa2k3V2VVREky?=
 =?utf-8?B?b2FGaUwyMjJBQXUxd0xpekVRUmRNVFNSdlZGbmQ4dUhMK21Sc2V3SzhabFlm?=
 =?utf-8?B?TmFibmJaYTduM1FoZUlWcjFORFg1Yk8rU3JILzZkQXF2UmJuQllNdTFZSGV6?=
 =?utf-8?B?dWVFdTJRbVE4VHVYQkI2dDJwQzlCUDNIM3hkbmZNc3pNeVd5S1BWNUxIbXJ5?=
 =?utf-8?B?bTM5Q1FmdkZKb1Y5RTEwWXZCTmRYSUxrMjZ5TVZ3MkJzK1hyQS9EaEtCVUhp?=
 =?utf-8?B?cEpnb211OUJLKzVjSkFDMlYzRWdWYkRQVGRaejM0dWVTNWhUMGl5eTZwSmFp?=
 =?utf-8?B?c2pKSFkyVmVraHV1aHNoM2E3bTZOWnJUQldaSUsvQWdRakg0cVBlaktIakhX?=
 =?utf-8?B?Ny9iRXJkbjk3ZDFCZ1pWdmUrMms3UDdvdTRja1JYUUZOMkM4WFVMTTgrWkpw?=
 =?utf-8?B?UGxaYk1odlBwMDIxak1SdWtLMUlOV3hONFY0Y25CWU4zREtRTDVkNHNockJV?=
 =?utf-8?B?S3lJQk1FeURWNE80ME9BWDAzSWMwdXlzRzdQeWY0aHR2WDgxSWZjU1dqOHlv?=
 =?utf-8?B?a2UwVjl6aG1tT1pnVWdhT0tTNXZjY1dQeTUxc2xlWnZmcWpYVWtibUl4dUEz?=
 =?utf-8?B?NmtTcWtUUWVqL3B4eHBkaVJ0R0FBb2lBL1h5Nkl5UmpDYUptTkQ1M2JxbkMx?=
 =?utf-8?B?YmNuVTJBOFRmenZCeEJ5alBZRkI2b3RCelBnVWp0WkhzWWdUVktEYnVmNjdH?=
 =?utf-8?B?MXJBNlhEQ3RRK2R1QjJscWpNS0NYN0hMVitOSHZqL0c2NXQ1dnRLRlN0bHpz?=
 =?utf-8?B?MzFsUDJJd1VtYjJwSjlmNkJZSkNVaVNVcFA3ZzRia0l6c3czRUVjc0pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDF1b3F0dUNLbGVsZ2NVUXhDaWprTXAyZDA3bktnTkxJRy9lcGYxSVZFeG9C?=
 =?utf-8?B?cFhtZnFqV1ZUZ1A0OVc4ZzdTSHM3YW1lNElXUDFXMkNJcG5sMlUzMFdZNUtv?=
 =?utf-8?B?andMdjRRT0oxVkR1cFBGcE52WVZFMXV0ZXdPdVNFYytBOUFtYUUrT3VXenpN?=
 =?utf-8?B?eEtHbVd0NmdXdlJ2YmlHalBkT1B4OWRXb2VtYzRVZnU0bzNpK1lhcnZ0WUlF?=
 =?utf-8?B?ZHFMMUVteVJRUUFJaHFGUDlXV3JEYm8rUk9Ca2NVcXF2QUdvcTdMQXF6VEtu?=
 =?utf-8?B?eXFQSHhGbmhkUVJGN3IwRHE2QkhmY2JzMlB1YTcxSHhRMGNHWjFQbTk4cDd6?=
 =?utf-8?B?bHE2a0t2ZW0wMi9USWszbmp4ejQvc0xPbmxwMk5YeXFUWXAzZFJuVGJpR1Nk?=
 =?utf-8?B?Tm5ySEErYkhYYmRNRWNjMVZXTnpBMG5kMXJ1ZXJoWUpKckZuQk9BTzZJd3lP?=
 =?utf-8?B?QVpXWDMrbDlVcUlFMlFSdEVnUkM0RHdUVlo1Z2dyZEhPSU4xRTJZUjlaaU1J?=
 =?utf-8?B?Q0FQRElRM3NNM091eEFuVVV6ZzNSenF6S3RZNXExNDI4RkRWWHE2RStienkr?=
 =?utf-8?B?dTFuaGpoZ1ovRUw0MXFINEI2YlYzZzlaWnVJckNtRVRMdlA3R09uMHpjQk5P?=
 =?utf-8?B?WFBDOFNUaGwrYk9CVjhucitTdzdkdWRHby9qcm4zU3oxeTczZ1dQTkhDaDVr?=
 =?utf-8?B?VDJJVURVaWhYbzMvUklTQkFjODEvaEJXbDNubE5GL0pCN3hNNEQ2aVl2T0c3?=
 =?utf-8?B?MFpPS0UwVFZNRVVXVjFvZGRYUXFvdTVjU20rNS9SY1N1WUpidWxLRGkwVmlH?=
 =?utf-8?B?anFhNVh3TWl5dWNGZnh4cHByaDRwMXptNXRnNURTQWlwS1dMSHRNSjREMGJq?=
 =?utf-8?B?andydm9IaVZkUmUrRUZYVzB6WjhFVVlMcjhmMWtjM2lkbCtwclJXbzhlNFRy?=
 =?utf-8?B?dUVFZTYyNWRLN3htREZrRUFlYWlVVjFyc3l6QjhtMHNZSlFSQjQ4UytXNEdm?=
 =?utf-8?B?Y0Q3eitaTWg5NUtHeC9oVlZMWW9sZ2lhaThUdElIcnBidjBqUjhGbnJVYUUr?=
 =?utf-8?B?MFNjMkMyNU84ci9hT2REdEhUNHlodVlSaHpwQk1yMC9tM0UwTmgvVzNWdlNh?=
 =?utf-8?B?WTh5RVd3T1pncG4wVGprTTVUc2JidnRVT1dRZmNDcEtFYXY4ZFBIVy8xaVFp?=
 =?utf-8?B?UE9ka3I2SGtYMDkzOEZVVERFT1RESXdrVUhBaitqTk82S0puMGFTdkVyNCtn?=
 =?utf-8?B?TXZWYUNjNVFlZWxSMHNUbDRIVUorYlgxbk01K05Qd2R2SUM4bmtvRkpoUXJ6?=
 =?utf-8?B?MlJMaDJHTUtjM0pYQ1haeWlPN2Nqa1RwWk04VFFwNjFXSEFKNXRaMzM3L2Rj?=
 =?utf-8?B?WXR2M0pUMmJmVUNxQlU4ejBGUTBmVzBMYkgwVlRiVEZ0ZFphU0NLRWdYWTVj?=
 =?utf-8?B?YWZNOTRrWlVodDFIN1FvdDFrQ1ZZWDd6ck5QdktmZkVFd1Y2NE5oRVdwM1Ir?=
 =?utf-8?B?WVdBYitlL2ZpZEFabjNFNjlNWWlMSUJPbVc4STkxT0NpcEJCWWpnMzVwSGY1?=
 =?utf-8?B?T2hneGNGYnBJZWxhQkNPTjhZMTlML2FnNlV2b05PeTVWUEF3dit5NXk5WmtI?=
 =?utf-8?B?VjRXVkQ3clFsVTR3Z25yNkpHTVZDckF4MmJ1czhYMWdHaXlHSHdHRDhxTWNV?=
 =?utf-8?B?MXV5YTk3Nkt1U3FhNzIzWW1JWXdoZjN5WDcxcUI3MzR0UlVSUys0b0xxOGJY?=
 =?utf-8?B?Qmw0V1R3dU1pS3ZlNkozZDFBenlQZWlxVTk1WERHLzUxUmlFNmRTVmF5dE9a?=
 =?utf-8?B?Q1NCUWJoa3hmeCtkR0xaeHY2NHMwTVpMaXdPcG9lYTR2THRoc0x5NHh2OW1k?=
 =?utf-8?B?ZUNNb0JqY1lVU21sVHpjaUFJTWNFUElrM2Q3aEI3T21aUUlXR0ZKWWNMdmxP?=
 =?utf-8?B?Vy82d3dJTG1EU2cveHFQSzRUbTJLTkVxYWJTNTdnT1dKQ2x3WW45Y1RyNnJl?=
 =?utf-8?B?dVA5M2JzNjd4ZEFtWm84TXE0L2JMeVprd2Z4czJEcjdkUlVLYUwxdUlsem9I?=
 =?utf-8?B?Y2NjQnR3THF6bTBEc1B3RmpoYkNOajhDc3ZBclRnSU5IenFhdG04Lyt6U0lx?=
 =?utf-8?Q?xFJxxfh4w0dWt2Zs4eFgZCaKY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b602668-64c4-4e9b-31c1-08dce759ad61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 05:25:53.0297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp6hGnj75p3yggizuPRdImA+4FcWBvpj6Sjkwt7baYb6x3YnbiaYOPgj1ygVnzU0KKBCrmnZu5PDHmymvhqzxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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

Hi Soham

Re-word subject

skip rc6 idle test if gtidle node is missing

With the above review comment fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

On 10/8/2024 12:35 AM, Soham Purkait wrote:
> Rc6 disable test has been modified in order to check for 'gtidle'
> node to skip residency tests on VF devices where this node is not
> present, preventing test failure.
> 
> v3: Commit message fixed (Ashutosh)
>      Space added before curly braces (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_oa.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index b4dfcced7..92f5828c7 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4649,8 +4649,10 @@ igt_main
>   			test_oa_unit_concurrent_oa_buffer_read();
>   	}
>   
> -	igt_subtest("rc6-disable")
> +	igt_subtest("rc6-disable") {
> +		igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle"));
>   		test_rc6_disable();
> +	}
>   
>   	igt_subtest_with_dynamic("stress-open-close") {
>   		__for_one_hwe_in_oag(hwe)
