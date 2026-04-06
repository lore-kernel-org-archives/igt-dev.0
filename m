Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214BAEF4EC9
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 09:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C741B10E250;
	Mon,  6 Apr 2026 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mllWMLsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37BD10E24D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775469250; x=1807005250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0vj4Rs5PojQGiwUubItq4MMF2vvQNKMQBH/znzcDTrE=;
 b=mllWMLsYd9eqw9hzYqRG5aL27NiUD6VBG9rZ1vI+gjDNeeJDNqsizuaA
 ReRq2oto/DtCiYsTDaiVJpFMR0etULFGfR6R7uYjrqr9Z/mp/tcc6G7lG
 ucH0hkjJnxR8Ev1MIpUEIMoFrF94SN8092k0lZBwgIsMmGvuSAVKFCqeJ
 iq1hGaKkQy6K6OooT4Fz6sLbsYF+a6THXATuwIjXF0Mz021MCbNpRbYy0
 fkVbD087DWMiBJgxk+ZCR5ufg/DjVQvKG3RBBW08EBJ3VZXoOSgfL2R9V
 gDPB/TCYPq5jb/5lQmnSPEQFpJjqzn7umLwNQQzppOS2Uw07UUXKCm0Tj A==;
X-CSE-ConnectionGUID: pvguK6oJRTKpsQa9ixhfmA==
X-CSE-MsgGUID: d/KTe6NDSJy7eMqYcb1Cqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76431749"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76431749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:09 -0700
X-CSE-ConnectionGUID: +R3Z7JYdTOKItqQCrzAV9Q==
X-CSE-MsgGUID: GcGPurDlSyKT0P5pdExX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="226844935"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 02:54:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 02:54:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 02:54:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qmfozu2oPVQ5xBwI456NCryIpHYUfRnw8skT07IwBCSIOCidMT1D9nxJOOnTyt+Gh20jYxfJxa57VS4POkOJLxxFY13FXFojfvaDmdotsKRBFv0FvW1xwHbBSn5twsZuowjT7wrAcr9uw7ujs+Ct9Ga3BR+6OWrK/u4AWrJuYPEBR2FYa9QPT3lmBtPlkWi1jhgDLVoZvl+tpMGTECcHO6ModcEtbDjbq1ym+L/cY9gmW7VYATVrTHXDSnvouxKZ6zobXpUq2wmm+aziIzhyZytLhzy5Zj9D3eTKwPJ1X/d1AKdv7RghEjWCzUG6D8bju2hQ6xguCeM+re5fmiqafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHBQ1YgWCNr5619TTBeOQP7Mz5ST8k5zvs25gjN6dR4=;
 b=dmZ11HRe56d6NeJheEI5DmvRiy3WIaVqHZ0qMY+K7L44ghre14dD1+VwPl1cZqG5bWy9a8eUyB7acycqFjtcozx2/iO6bcVeROuVk2ry2Rj2no8DEPZeWDDSvXJPuzqFMFZwDDnGuGQ6zvOP/DLxDXpK0sIkwtWywGKDjo9BujFlTG9j/1cy4uROLHbnNIBZeSM3PBIMmDyxu6GucqIhZSFqb1FSyQCpd5+HCASI1s4Eryu5GC4v3gOVwoj+O/4+TVlpVp0Zpz8A61KYXtsnuDjwAogfW9MfY2trB3Ki7Mb0/BIIlyAuk5pipgW1hEX/fN7x4VRSedUQLdr49QL1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH0PR11MB9726.namprd11.prod.outlook.com (2603:10b6:510:396::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 09:54:03 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 09:54:03 +0000
Message-ID: <1db6f1ca-4706-4ed3-9ad0-219a956e4cd3@intel.com>
Date: Mon, 6 Apr 2026 15:23:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/9] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-4-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH0PR11MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: d30e609d-feea-421e-f7a1-08de93c26f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 4OiJBBYwCeRpEvWVctULpbyptrikERMgWGK6bizUJVjcUP6RhIcCQfMLBIQiLNKzihHqJTdTD4x3TfZMZC4geNeu7Euzg0E4f2B6igU9zGNiNxbRGxqMPd72fYS5T9EYR32MNu+q/QmC0dJWHH6q0Tbi9kwOXeKyn18SQFnxA80C2GXdogBgeH6wddOmdQSCi10kwcVEB/n2Qivuk9v9PbB4bwO4QFALuxLkVhe6oBejkgvJVssUrKWbOFRbiOMMChBKWCADOFKZWrJH9N67E3lrZLdJTr7386BP6ZBfpENye0sxbl9W/vrNwBYr8yoRWFKLtICRChQ0IU/iN0oMxdtOvLtUk61MxdwfrOUMAqRwim48+JASwZ2gVSMpgM83d3ykxF/ho9zMH1Q6Rzsf8xpBVRR3oh4XnpeoBfN6LTTGPZScUnsU/YK+7qQexNB/qE4BYsVddLAgH8V4upG7vvQ+flOcNJg6wuRr8/GBE/To9Nciw6Z4oyKlMJagHNK1o67gkools+SKEoblO3+TprfTxFdaL+MKOjlu7hAilQj6E71APn1X4NkDSPUpils0Rk6soFipcUgEJbCTyl4dfDMdeihpfu75ZglH1R8Q2JH1qbH1AyMhaVR6/o6QinuV8IEGAnBisg8rmDCAwpj6OPGvCgQq7bM+mvLBuoG+doWSc3PQTKWiMK81IoeCKQ5Ac+40+yYC1dWwHMQ3vcYnlO3HAWA6HK5q1RGACdwVLlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBhR3VTamx0cWFyWTdiR3MrWmhBa2VKNlBFVkdVdzk0K3lQZUtLTUFLbE5t?=
 =?utf-8?B?Q0lybVdzQVlRS1VxVm9QOW1UaUVqYUlmTzRKT2xYNEN5UEtXck1seXpiMU50?=
 =?utf-8?B?UTV0T0ErSWFBQ3E3c3ZnakZ1dXVWRDZ3WDZ2NEZnYjRwMTJMYUhMYmYvMFRu?=
 =?utf-8?B?NWl2enNPTDhSVHc2am85QnlrWTJyQ3FBRTA2emFNOGVZdk80QUtUdlk5YWxR?=
 =?utf-8?B?SlhMZGVqZytXbENNTHMyRmIzMkFFclRLVlVTVHFWOFZmUE10TjhnUnlNZlBR?=
 =?utf-8?B?YWR6anNvWmRNQmduazU0ZGJBUmVCVkhnVlNVcVJwM3RKWUU5UklobXpybXM5?=
 =?utf-8?B?WHc3THR2UE05eEZNRUdWbzkzYlFUVDZKME9seFJBVmNFeVYwbWVqMzdjU2x0?=
 =?utf-8?B?emZaUC9xWFB0Y1BaaGU2M2ZyVU9iaVlsWXNKeHRnYjJiR3lhbk1IRkRHV0tv?=
 =?utf-8?B?VUpHTy9ia0VwbVVISTgwM0ExZTBLeTczTmpBMzk5VVNqSHpvOGM5UFlEelFR?=
 =?utf-8?B?ZjFGaVlSL1RndERPTE16K0FSRDFaUTNIKzZHZ0hYdi9LUlE0aTFiUlc0Z3I5?=
 =?utf-8?B?YXlwT3YxTXRVZWpObGEzZ09jK20rQ09HU2Y2U3ovUTMzZ29rRi95WTE5T3dJ?=
 =?utf-8?B?ZzR2alVYcml5THRncnBwL0Z1YWdIUDhxblFBTndUWk9XS1NaUkpucFBwT0l2?=
 =?utf-8?B?dzZmMmRmNWkwTlp1UjJjcVNlVStHSGtaQ1ZnckJYL3NxVnE3bDhVV0NFcksz?=
 =?utf-8?B?Qi9PTExPU3VHSkJIOWwvYy9hM1FkWlNlRWpLNDJiOUd2RFQ3cXpBbTVOemx1?=
 =?utf-8?B?VWgyZGMxc09vdjNCM0l0MW81bW40cWNRWUpja2VzRG5zdTVEUk84L3VsVUNz?=
 =?utf-8?B?TkRTSmRPaGRoWUZER3d6c0lla21ERjNDMkhFaEV4YnZpQXNXR2poWnNIMnU4?=
 =?utf-8?B?dWFETEgyMnVIY0x3MFB0YVRGZk5rZi9JSTE5dG9EM3FrcC8zdVlsUTNoZUNR?=
 =?utf-8?B?R0hIWVJvM1FMNjB3azhBZ2JnM212aWlRREhkc0RQQ2w3cjJTd2NLMWhIMGti?=
 =?utf-8?B?S3ovS3RTb1lxaWh1RmY4WTNwM0QzOURVRGYxdXhjdkViaUhFdXNuYlIzZExl?=
 =?utf-8?B?N0JlQWdRd0RmV3JWclhxUmFxWEdMWWRHeGc4SHV5TjNHN3FjeGJlM1lwNkFw?=
 =?utf-8?B?TmlES3NhWFlmN0hMbkJCT092dFdjZS82cERFMXB0Z0xuU2Jtc2Jaa0RTOElD?=
 =?utf-8?B?UkRNbFZSZ2NnSEpLMVJMRTFkVUhjRENZRnF4WEh0dlhBVVNVSzViVU9xNFRn?=
 =?utf-8?B?OHdmRitOcUs2VHQrUFNQR0dQb3hDNzRrQTJjbEhjaHhZaDRvbjZ6Z09iOEcy?=
 =?utf-8?B?NVByaENTNUNiR2Jvd2pPWXo3NFRFR1gzamNiNzU5dWZ6WkNjMEVKM1dBUm8x?=
 =?utf-8?B?QVdteUE2L1FnTk8zdVAvUGVoTFE0c2x6dFQ2bWdXWHI0THY0akNJeFhKZVFt?=
 =?utf-8?B?ZnkrOStKTVY4MTVabjhSbFU2TjRFaThXMjVKNjVIYTBMQTBzR3pSVE8va0Jy?=
 =?utf-8?B?SUx0K2k0Qzdzam02UzU5bzY3em11U3pENGtGU010MlhTRFZ2aWtHbk93cExS?=
 =?utf-8?B?V3RXU2ltbnY5dmZTT3NLdEdKRndidFdBVjcrU1Jkend1YXg5OHdPc1pDNzJo?=
 =?utf-8?B?MWdrVWNVNnlOb3IwdVlDc3hjTFpucURtOTBBeDRNTFdQNHRnaEpjVk9DYmk2?=
 =?utf-8?B?eC9hQnNibVFQZ0x2a25pYlRROWdZVlUxSUoxOWl2UTI4NDlkN1J1bmNFbVZw?=
 =?utf-8?B?eGowZGhxbUtubU5kRWpWcDFvQ3luYjRCck9VK21YNUhvamVhRTdXL1pta3Jp?=
 =?utf-8?B?clpVaURyZkwyMjVGYit4ZEdRa2FZenVqaXltOTAvOWRYYkR4SXVQQTFrM0hW?=
 =?utf-8?B?dHFTZWZRK0FWLzRaSVJ4VGlXbnNCMDZXdkh3U2pxN2xFMkxUSDJ2Y2lWMEVl?=
 =?utf-8?B?WjY4c3ZUTkQ1YWZyZUdzbGVQWVdqY0M5VEhkV0pONjJDMjRnSS8zQ1JveW9J?=
 =?utf-8?B?R0tTeWRsK2tOeVprUE43R3c1Q0VRTjVBcHhabi9tQkxoaytYV09abW1qR2My?=
 =?utf-8?B?c1doMTh0OURxYXpFVHZ6OE1PNGlWT0RGWGxBNjBUY3JLWkNuQmJINVQwenpH?=
 =?utf-8?B?WkJmZkRzaXhEakszaDR6NTZ3ZU16bXBlZktMUXVIS29oYndWdmtXYWI3Qkt2?=
 =?utf-8?B?WEVuV2l1di85REh1b3VJMkVuZ2dOM3NmaTZOVUhiRW4vS01MbXdaaTk5RkQr?=
 =?utf-8?B?dlB1NFRaR2hqWTBhdE5PV2E4ZStvdDBNVUxQZW9SUEhJRGtOM2xHbkF4NnRx?=
 =?utf-8?Q?mC6adGSQAJgKPzbk=3D?=
X-Exchange-RoutingPolicyChecked: eDy4aE5uVw1p6vA6bJQjnz9BOp79lJFopHHfpaNi1NGbsCT4oGQUCbj34OfvJzGY0x13IoPDEA6GYe2E40R8PaWM8TvktkKYpzZKmv9lBL4Ud+9W5knIqObt+xM1ggYOMdeLyQ4SYM9Hr/Y6MlydMO2pZZQxtGzKYQIVQWiKh9xPPI8xRmPzN7Sm/yz1vif1A2/hVBbZQWE6pWDM0ZLcCv5HXR1rgyxDo7AVlLD6EJ4a0G7WUHi2GsMDQCmRJrzAcXwcB+2rIxra+eeyp1ApmCaEgi+9xC+TK7DVzHG32BRrV2doeSszeXOF17s6qBAQ0XDK2jZ1a9Pha5mC3k/Dag==
X-MS-Exchange-CrossTenant-Network-Message-Id: d30e609d-feea-421e-f7a1-08de93c26f32
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 09:54:03.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+6j5JUYcN0tCSB48CVtteZ8Ojzpnfao7aTqDh7+y6qdNY2USkePjVHT3RnhDMdCsIHwgkMBhR3TizVUR8bbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9726
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> This test validates that mmap() fails with -EBUSY when attempting to
> map a BO marked DONTNEED. The mmap offset ioctl succeeds (it just
> returns the pre-allocated offset); the purgeable check happens in
> xe_gem_object_mmap() at mmap() time.
>
>    - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
>      has backing store but can be purged at any time)
>    - Purged BOs: return -EINVAL (permanent, backing store discarded)
>
> v4:
>    - Move unmap outside the block. (Pravalika)
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>    - Added assertion for xe_bo_map. (Nishit)
>
> v5:
>    - Add kernel capability check *_FLAG_HAS_PURGING_SUPPORT for
>      purgeable support. (Jose)
>    - Drop memory pressure trigger path; mark DONTNEED directly and
>      assert -EBUSY from mmap offset ioctl; restore WILLNEED before
>      cleanup.
>
> v6:
>    - Support iGPU by using total system RAM as the pressure baseline
>      instead of VRAM size (which is 0 on iGPU).
>    - Raise overpressure from 25% to 50% of the baseline to ensure the
>      kernel shrinker is forced to reclaim on systems with large free RAM.
>    - The DONTNEED enforcement point is mmap() itself, not the
>      DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl. Update the test to mark DONTNEED
>      first, then verify DRM_IOCTL_XE_GEM_MMAP_OFFSET still succeeds, and
>      finally verify that mmap() fails with -EBUSY
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 233 +++++++++++++++++++++++++++++++++++++++
>   tests/meson.build        |   1 +
>   2 files changed, 234 insertions(+)
>   create mode 100644 tests/intel/xe_madvise.c
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> new file mode 100644
> index 000000000..de4a6e34c
> --- /dev/null
> +++ b/tests/intel/xe_madvise.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Validate purgeable BO madvise functionality
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Memory management tests
> + * Functionality: madvise, purgeable
> + */
> +
> +#include "igt.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +static bool xe_has_purgeable_support(int fd)
> +{
> +	struct drm_xe_query_config *config = xe_config(fd);
> +
> +	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
> +}
> +
> +/* Purgeable test constants */
> +#define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_BO_SIZE	4096
> +
> +/**
> + * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable reclaim
> + * @fd: DRM file descriptor
> + * @vm: VM handle (unused, kept for API compatibility)
> + *
> + * Allocates BOs in a temporary VM until memory is overcommitted by 50%,
> + * forcing the kernel to purge DONTNEED-marked BOs.
> + */
> +static void trigger_memory_pressure(int fd, uint32_t vm)
> +{
> +	uint64_t vram_size, mem_size, overpressure;
> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
> +	int max_objs, n = 0;
> +	uint32_t *handles;
> +	uint64_t total;
> +	void *p;
> +	uint32_t handle, temp_vm;
> +
> +	/* Use a separate VM so pressure BOs don't affect the test VM */
> +	temp_vm = xe_vm_create(fd, 0, 0);
> +
> +	vram_size = xe_visible_vram_size(fd, 0);
> +	if (vram_size > 0) {
> +		/* dGPU: pressure VRAM to trigger purgeable reclaim */
> +		mem_size = vram_size;
> +	} else {
> +		/*
> +		 * iGPU: purgeable BOs reside in system memory. Use *total*
> +		 * RAM (not just available) as the baseline so that we always
> +		 * over-commit regardless of how much is already in use.
> +		 */
> +		mem_size = igt_get_total_ram_mb() << 20;
> +	}
> +
> +	/* Scale overpressure to 50% of memory, minimum 64MB */
> +	overpressure = mem_size / 2;
> +	if (overpressure < (64 << 20))
> +		overpressure = 64 << 20;
> +
> +	max_objs = (mem_size + overpressure) / chunk + 1;
> +	handles = malloc(max_objs * sizeof(*handles));
> +	igt_assert(handles);
> +
> +	total = 0;
> +	while (total < mem_size + overpressure && n < max_objs) {
> +		uint32_t err;
> +
> +		err = __xe_bo_create(fd, temp_vm, chunk,
> +				     vram_if_possible(fd, 0),
> +				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				     NULL, &handle);
> +		if (err) /* Out of memory — sufficient pressure achieved */
> +			break;
> +
> +		handles[n++] = handle;
> +		total += chunk;
> +
> +		p = xe_bo_map(fd, handle, chunk);
> +		igt_assert(p != MAP_FAILED);
> +
> +		/* Fault in all pages so they actually consume memory */
> +		memset(p, 0xCD, chunk);
> +		munmap(p, chunk);
> +	}
> +
> +	/* Allow shrinker time to process pressure */
> +	usleep(100000);
> +
> +	for (int i = 0; i < n; i++)
> +		gem_close(fd, handles[i]);
> +
> +	free(handles);
> +
> +	xe_vm_destroy(fd, temp_vm);
> +}
This function is called from below function which is not part of this 
Patch-3/9. This must be removed and introduced in Patch-4/9.
> +
> +static jmp_buf jmp;
> +
> +__noreturn static void sigtrap(int sig)
> +{
> +	siglongjmp(jmp, sig);
> +}
> +
> +/**
> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
> + * @fd: DRM file descriptor
> + * @vm: VM handle
> + * @addr: Virtual address of the BO
> + * @size: Size of the BO
> + *
> + * Returns true if the BO was purged under memory pressure.
> + */
> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
> +{
> +	uint32_t retained;
> +
> +	/* Mark as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	if (retained != 1)
> +		return false;
> +
> +	/* Trigger memory pressure */
> +	trigger_memory_pressure(fd, vm);
> +
> +	/* Verify purged */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	return retained == 0;
> +}
This function is introduced in test_dontneed_after_mmap() in Patch-4/9. 
Remove this and introduced in Patch-4/9.
> +
> +/**
> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
> + * @fd: DRM file descriptor
> + * @vm: Output VM handle
> + * @bo: Output BO handle
> + * @addr: Virtual address to bind at
> + * @size: Size of the BO
> + * @use_scratch: Whether to use scratch page flag
> + *
> + * Helper to create VM, BO, and bind it at the specified address.
> + */
> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
> +				      uint64_t addr, size_t size, bool use_scratch)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = 1,
> +	};
> +	uint64_t sync_val = 0;
> +
> +	*vm = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	sync.addr = to_user_pointer(&sync_val);
> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +}
> +
> +/**
> + * SUBTEST: dontneed-before-mmap
> + * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> + * Test category: functionality test
> + */
> +static void test_dontneed_before_mmap(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_gem_mmap_offset mmo = {};
> +	uint32_t retained;
> +	void *ptr;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
> +
> +	/* Mark BO as DONTNEED - new mmap operations must be blocked */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/* Ioctl succeeds even for DONTNEED BO; blocking happens at mmap() time. */
> +	mmo.handle = bo;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	/* mmap() on a DONTNEED BO must fail with EBUSY. */
> +	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq(errno, EBUSY);
> +
> +	/* Restore to WILLNEED before cleanup */
> +	xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
> +				DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +int igt_main()
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +		igt_require_f(xe_has_purgeable_support(fd),
> +			      "Kernel does not support purgeable buffer objects\n");
> +	}
> +
> +	igt_subtest("dontneed-before-mmap")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_before_mmap(fd);
> +			break;
> +		}
> +
> +	igt_fixture() {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae..a6370b685 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -314,6 +314,7 @@ intel_xe_progs = [
>   	'xe_huc_copy',
>   	'xe_intel_bb',
>   	'xe_live_ktest',
> +	'xe_madvise',
>   	'xe_media_fill',
>   	'xe_mmap',
>           'xe_module_load',
