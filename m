Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF574C36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 08:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A0710E03B;
	Tue,  1 Apr 2025 08:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iatZG89b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E541710E03B
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743495281; x=1775031281;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T/32/qMt36zjTtYhVILIbminIoy1BbZNhq54qlY72WY=;
 b=iatZG89bocT4aDIaMi+CE2O1tuOMzx7ZZxCkEtgPfa+caOvcJB8KOzmB
 Xmjln237nHFdhbQbqYwR7gzTF4lO3Y4/4iGXmDHFsKmhf+/nFiHdI1zn/
 j2QOmk5DPiVqU6oF5FQ4URsdkpKbKOP+/ZIimjfAXJozMZAXjFu1VMgwF
 iAjP+mElGV9O/uTFOTfH881xq7nRIXiMeYGCYc0Y+F8qYhg9KlrLGR98d
 Zzw9U7t7YKia1Hz08ktDUhhvFy1bfv6YugPmCRuUf9sZu+IH8lcKeLVeF
 0ei+OEs6StmcgbBmh3cGHQYc+KwZ1T/oRsOlhxZt6RDac4mDoUIr7L6FT g==;
X-CSE-ConnectionGUID: QFQTumHvRP6lsBObiUoUjw==
X-CSE-MsgGUID: MPReVQpFSAmZ/J0EydiWxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44519479"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44519479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:14:41 -0700
X-CSE-ConnectionGUID: WdTRUhN1QQWnwWeXZCyT1w==
X-CSE-MsgGUID: 93Scax1HRLyzcopXgdUUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="157244319"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:14:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 01:14:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 01:14:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 01:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmAPxJRp3K4NYHvFY9rLhfo1WLEzJBPPSEmH5g2vQi6VyMRkuBMcKb7thH6LSX3gGUMQCCjapRzeu/lYu4Fb/I8JiPaxeLYfQt1j1Fx6c18l4jGkOHTMV1/xXdDC3X6AmS3b+Wurd/GTx+jrh9W3qvYLWwC/fazNurstUchoHzu6q2zXENfUvlF1wX0j4gMdZ6q/wk2aI1hkpJJjWU5nULIjYI1r2cJrw0uFXUNrT3sEmt3Q0QqHjj5kl8ghDQ2B+FDK87HN4oipDbavZdVQTvpE+2/MrB+tBjsWZEJahYD6vTUwxxOwyx3En94BKsafJ0U4qaCWwMBIEtTciFO+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39MlNUXKXenAtLoFYaFBXbV3TS5QKwmxCpJ0g27gphQ=;
 b=rXrMDZLrU7M0nPznDhIlXrjNze4y7qM5HifLaCm/ihb2GHaZpK4AGu3j9B24XYF70/fMJzX2LozRmv2Z0e2qBghJuNV0oY1pPAYeyIFZf2NyFGxMr37v8Rho4tZYeTdJ9aZgC0j6xPRJMkR4zCDk1eXkiT2FVjrwU0elZdFV9xdzoAyt3xAgBA9nOzTdn2uwWwBA68BHQI3bosHj5Xa85quDNKpLlq39WnE1VAqtZ6N65mRlJxpRxf0w8FNdP2OnSJsycw8q8mzTKTTQmhzthBiL16uMChNmEk2ZexjOjEPTRivq7tqc3o/isELY6Wj0p/PKfk9SNSO1Q3AOBTud5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 08:14:23 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 08:14:23 +0000
Message-ID: <79f7f21b-cbc4-46c4-ab61-c214a6169f95@intel.com>
Date: Tue, 1 Apr 2025 13:44:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_flip: Add flip-vs-dpms-on-nop subtest
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: e9507410-6e6b-4c96-68f6-08dd70f535ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTAybnp0QmJzeUlaNCtRYjdXYmd0NGlaNnNycmZIWElTM29CTmE5aEtNM29C?=
 =?utf-8?B?d21CNVM0azB3MGxoaEN4cGYwbmZkeE5IRUFsQlN4bXhIaUcyUk42ZXRuZm1s?=
 =?utf-8?B?OTBBb214K1FlZTZ1bFJaRHYzWkRUMXBRNGVnaUFUV1hUTWxzREZXano2TFBq?=
 =?utf-8?B?WlpGWFVIcVYzMk1qVzlvMW1NR3JkM3BkLzBoMUxLV2VnS3RuZkU3VlNpS29K?=
 =?utf-8?B?NVJSaWF1YjBDdEVMK3RxQWNYS0lWbHVyUkF4cDNxa1A1QTBjRngzd1ZYZGsx?=
 =?utf-8?B?KzFEZTZma2ZobmhGbzBpZkNYaHM4VG4zNk5NYll3MTNoWEpNWGdxQlYrZmpF?=
 =?utf-8?B?Z0lMQy9QR3R6RVE0NFFqcjA4RnArYkd4RDBEeU5RTUx6THJyT0RZc1VRaXQ0?=
 =?utf-8?B?L21uYk9qZGhjZmdpR0tmRGtOYTQ4TkdXL2Vuc29SV2VBNHJhNDJ1TUE3M2Iv?=
 =?utf-8?B?ZTNpY0E3bEEwZkZhZHlWYVY3aUh3NC9neVlHL3lTMmYzSVBnOVBJbzFyRG9w?=
 =?utf-8?B?SThNMVNTQU9aM2FGZGYxcWtvMTErT2RKODcyd3VReU9paVJXU2NKeDBIWTcz?=
 =?utf-8?B?Q0FvZy8xd1JvbXA0WmhqQzB3WXd6SE5YODloRXgxeVFiMkt5RTFsdTBvMVhD?=
 =?utf-8?B?b0lXU1QrUThFbmNabGpUbDJHMnlyVDlNMjBURWlHMVlYc3gxUGN1Y2FQV3Nw?=
 =?utf-8?B?aXRyNVlWZ3pEUHgzUFpUa3FHSWN2V21QbE9vdGtHV1R5eFYwaG9YVTBVY2pk?=
 =?utf-8?B?VTJtTDBWNk9sQzAwazRHTGxWa3JtanptUzFORllRalV5WmN4VzFoQS9TWFFh?=
 =?utf-8?B?NHhOVS9VMUVid3c4SXdsRmtZTE01VDVIMFpCOXByQk03aDk3U21Id2lsZDBC?=
 =?utf-8?B?a2s5UnBzcG50RVdpME0zWndpZmFzaUdhVlgrS2JDS0ZWYVBJWTRFTWhiZ0g1?=
 =?utf-8?B?dGc3SmNocE5mdGFqeUVBY3NZVTZjZnYxSTRJYUVJczBzQ1FrcDZnRC9lYW1j?=
 =?utf-8?B?QUdjUWVsanUyMnhuZThtV3AwcnZVNGJjbjB5dkp3UW0rUm94b3IrQkR0WVlx?=
 =?utf-8?B?aUd2YVpxaEI1SlU2WnpUNnlUODF0V05JOGlpUDYyeU1OZkZUYkxSSHM5bHZK?=
 =?utf-8?B?blFablM4NnVBOFZUUVJpc2pVVGJJSXpNcFpOZGZmaDJQa3Z3ajhxQVJDaEtk?=
 =?utf-8?B?aC82RHdlWENUR01DaXhGMGJNOFV2aGZncmlRaGhtZ1dsV1k2NndmODROQTdI?=
 =?utf-8?B?UE1VWE40QStNc2lyKzJRc0tVaVE0eGNMLzZ1d2M2MlZCa3loM0NTUGFCVzVK?=
 =?utf-8?B?dDhsVzBUeWFZaFE2VFFPTHlXcVNrM2owVVcwRG94REhyMGkveU91T3R3Sk52?=
 =?utf-8?B?b3VKckxYbHo3NXYrZkVUbERjQ3Bhek4zVytyVDBqWmpCNkpuV2szeGwweTJ5?=
 =?utf-8?B?ZnZ3VUdzd3dkeGpCVFQ1czRBYlRsRTdUMXRaSEMzYXE1b2JObVVHR2p3NHE1?=
 =?utf-8?B?M0ZqcEkzNEhYT0Z6Sjlkc2F0ajlvM1BvMGhBTFQ3OEFheGNhNG1SallQTFBU?=
 =?utf-8?B?b2JVY1UyaDdVYnV2Z09ubTRKT28vUUZwTXVITXRGSjVDbjdqanVpZjRjakQz?=
 =?utf-8?B?R0Jpd0ZxTmNaV3pjeDRKeU9JN05YV2x4UWR5RVAwMG1yOUxsK3hUQXdjd0tS?=
 =?utf-8?B?WXQrUitKY0xQNno3ejBsQUNPdkZzZXdjeWM3RVpXNkx3eXlickFUdUdLUFRJ?=
 =?utf-8?B?NTV0cEoxZllISlZnQWhEUW8raEhTNVgxYzl0UlJEeC94OG5sTmxvRk9NYWhC?=
 =?utf-8?B?a2VCVnZxVXp6SlIxQW81Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFF2YVU2OHA5ZXVoUytoMUFmckxsWUU2K1FsRnZtSEtCZzlhdDE2NnRFV2Nj?=
 =?utf-8?B?ZC9pYXltdTh2N0s5bTR2YzRUd2F6VEpiQVl1OTlOWk45OGJ5RC80Qk13bHM3?=
 =?utf-8?B?VHY2QnhDZDc0WlY3RmJsYjljeUZxV3hRTVBzRjY0Wm5kSEdlTDEzanVNMlU4?=
 =?utf-8?B?WnNYY2U1Zjc5eWNCWkQzVFlOWEtCK2hWMlBwU21JUGxSR0NSeHd3UGJZQnp2?=
 =?utf-8?B?RzhmRllUenFVS2kycHFIS29XZXRjaXZaTUF0WEQ4eGVlYUxZampiTENtbFhC?=
 =?utf-8?B?L0lPSmFweVhoTnM3SG16SUxjWUFvVFByRWhSdkptRWFocDk1Y1lhUHdaY1hR?=
 =?utf-8?B?a0VRYlJyTEV4YWgwWmNPZVdLUTJ3QWtzM3pWc2IyY0ZnOTBUQnRUd3ZUckJl?=
 =?utf-8?B?NTY2ZUVWTUJodlhOc3FscnBiK2F5anhqUHliYTU2VER6cU92Um1WTXBuME5C?=
 =?utf-8?B?SWdhWDBDODZoKzV2dy9QMXEwTVhFdEdNZE55ODJnMzhhYm9HRXFiNEpWQ0tt?=
 =?utf-8?B?L3lnWUZJNldvNlVYV3ZUUTdUbHd4bDhVZm41WlpPVHZlRU5IVDJwSm1rTVM0?=
 =?utf-8?B?aWwwOXhzT2dtQ1V4WC9YUzNQMjJCczNTeHJ6dDBHaEUzTEpFMWQreEd5N0Z3?=
 =?utf-8?B?a0ZoTlF2QndHcEltZ3hiZXRhTWVvRldkK2hOdDkxMzVldmt0OUJkQngza2dU?=
 =?utf-8?B?eFJBOVBYeTR5U1FIZ3JzQjUvMDROVDhpWUQ1NUNMRjZMbjJYSnpzRWJ5K3JO?=
 =?utf-8?B?VktzamRIWnFvVmRtdk93WjhndnR2cXlKcW5jc2EzOG9ab0x6VDlrZVVFL0tI?=
 =?utf-8?B?S2NrbjM5cENjNUh2UjlVbjJCazl3YzVleWxpK2ErNDdZVWkxdFd5dWRYcW5E?=
 =?utf-8?B?Wkpqc3JwcHlFRkc3MHh2MVRYRkpSZFI5ZDVCKzNtSnpqMkluQlRhUEVYdFVs?=
 =?utf-8?B?L0VhVmR5UHRaN3ZLK3JTM2FWVzJOYlh0NjhOWU9XZ2wyemxMNkdxQS8zK3lM?=
 =?utf-8?B?QndjM0RzY0ZhRkdZQU5EaldmeU5EK2Ntcmt0UDhCR3VBeUZJKzQzRUdFVmhq?=
 =?utf-8?B?QVlJMmVQRnFNcnE4Y2xRYmhQMDNMOGUrV2E1L0lXVkJualVnMURIMXdnaWc4?=
 =?utf-8?B?V3BYSG5jVzErWE5PY05wc1FLS3FxUnJDN1FHTkZSMXlEZ3Z2VXhiTHl5Ujlj?=
 =?utf-8?B?Y29laVVLenJUQy9TVjYxVnJSK0pTNUZkcW10TU1oSEhhVUxPZDJRUlBFRWtW?=
 =?utf-8?B?aXB4bW91TmdHZTN0TkpnaFV3Q1lnbjN2b1czcE0yem9lUjRUYkFtQWZXRWNT?=
 =?utf-8?B?cC9INjVPZlQ0d2RzU2F6SVZnSHRzUmp3d2JDVFpqVTQyNVJtaW9zV1hoZHBh?=
 =?utf-8?B?UVhGMHIzVGZNNi8vNnVzeitGU3VldTRtUWI0THY4UXE3aFU5ejdadmVpaFk5?=
 =?utf-8?B?QlRLY3BSMFR5b3hDOGgxdWtHZUxiZ2tIQUZwUkRVTEJtN3RhZ1hrclR2WWVJ?=
 =?utf-8?B?SU01Qm1PNEV6SmZhcFNaRFcwRnZaTVhRQU1Qb1gza0EwU2FRUGkvSWw0Z1pz?=
 =?utf-8?B?WXFDbkxQQWxLRlZkT1FFS2JCbU43K2JseVZNbWNqckN5bk82cTZ2bkdldDdG?=
 =?utf-8?B?ektIL0JGeCtqYzdqekRBUEF5Rng4c1dZZEwvSVpDYk9aMXpmclY3OFgzQTZK?=
 =?utf-8?B?aXlSbExkZTAyVys5QmNGTlJkeU5ESU1LNm84UXRsS21ucHBtZlphaU83NGRi?=
 =?utf-8?B?TXhLM0JiQVkyUnBPYTdtWDRzMkhKWTRtZXlZbnY5dU03TGhTV1YvYktLdWRh?=
 =?utf-8?B?TzJNL1hmSWhPd0kzZnBEd21KUXZxM2ZVUTBNSWdQSEVYSlpuMEs1TW1sZzUy?=
 =?utf-8?B?bUFzT3VkSkZEV05HRVVMa3BNSVI4dVpDcXdZbjRZWHpqNVV1RHp1UE16S3l1?=
 =?utf-8?B?bS9LeWo4QjZ4RHFoS3FyS1VRcHRnM3hQTHNOL3l5ZG53Qkl5eGFoc3JJU25H?=
 =?utf-8?B?Y0JMUVpPNE83Q1VFMC85TE1RbE1nUnROS0l6Z1BFS08xVXlBdHFpRDY1VWRU?=
 =?utf-8?B?MStDb3IyVVVqc09vWnJMc3luSDVhM3lNNnJZRWh6SnNHV2xvSU15aUhtaXpy?=
 =?utf-8?B?QzJhRjgvdkJzaG1SQnVLUTlqTWxsY0EwSVlCZ0FnZHE3bmJGUFE4RHJudEZr?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9507410-6e6b-4c96-68f6-08dd70f535ae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 08:14:22.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWOpewKaxeoGCCqBgD7ic0ZBRsFOQFCeLnhfxohfP9UqSEPbwwEhoVjn9MhlXEDf9Ltfhw1xAbSezADJFOw1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

Hi Ville,

Since this test is failing across all platforms.
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12687/shards-all.html?testfilter=lip-vs-dpms-on-nop
If this is expected beh, do we need to modify IGT to handle this 
negative scenario.

On 01-03-2025 01:12 am, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Verify that redundant DPMS ON requests don't result in
> actual commits (and thus frame drops). This behaviour
> is guaranteed by the kernel for atomic drivers.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_flip.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 3ad4d0afb1f6..59740aca25bd 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -176,6 +176,7 @@
>    * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same buffer along with
>    *                                             the modeset and dpms off
>    * @dpms-vs-vblank-race:                       vblank along with the dpms & modeset
> + * @flip-vs-dpms-on-nop:                       pageflip and issue nop DPMS ON
>    */
>   
>   /**
> @@ -240,6 +241,7 @@
>    */
>   
>   #define TEST_DPMS		(1 << 0)
> +#define TEST_DPMS_ON_NOP	(1 << 1)
>   
>   #define TEST_PAN		(1 << 3)
>   #define TEST_MODESET		(1 << 4)
> @@ -957,7 +959,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>   	if (o->flags & TEST_MODESET)
>   		igt_assert(set_mode(o, o->fb_ids[o->current_fb_id], 0, 0) == 0);
>   
> -	if (o->flags & TEST_DPMS)
> +	if (o->flags & (TEST_DPMS | TEST_DPMS_ON_NOP))
>   		set_dpms(o, DRM_MODE_DPMS_ON);
>   
>   	if (o->flags & TEST_VBLANK_RACE) {
> @@ -2020,6 +2022,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   			"plain-flip-fb-recreate" },
>   		{ 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , "flip-vs-rmfb" },
>   		{ 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
> +		{ 2, TEST_FLIP | TEST_DPMS_ON_NOP | TEST_CHECK_TS, "flip-vs-dpms-on-nop" },
>   		{ 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
>   		{ 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
>   		{ 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,

