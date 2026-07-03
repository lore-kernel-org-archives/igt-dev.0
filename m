Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDFEC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055E10F934;
	Fri,  3 Jul 2026 21:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlyxPnuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360F10F929
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112656; x=1814648656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F1S2VMdN2X/S7E1+pGEcpOzuh4RhoqoZj4PE5VAOObM=;
 b=ZlyxPnuyV39B8opJaWNA92d6P+8lTyBxatldVBN7zuRzCufUs0zxSNOp
 yKyQYoEjfAKBTRRKN+vTWOBurRSfcrDfjOo0Qq237n8JLWSP14niPppuP
 n97fnqJt9MSdOW4pa4WHIgyfVdMLIuekpxpkQPtNaQjQeBUNzg8upturZ
 qj8xYiMjvq1xR5JJH76wojT+g4IvzXIsiFxfwUrw06IEIDn8kz0bMGHTy
 c9oiDOXQVLPrbCeQy3fLyyT7LDT+EPtVWvcR+gA9jfGQdNgUjRd8DsYOt
 513BvS2poSoghqu8bUYdNLqH9aK59CKznvUN1ImqhPfm1/9uGudLgvhHb g==;
X-CSE-ConnectionGUID: n9IX4hWLRS64ylGeE8cOkQ==
X-CSE-MsgGUID: LQeH8QSdTIieKfRSC1TbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894269"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:15 -0700
X-CSE-ConnectionGUID: JJz+KNG6SL2z6V/iv8FFJg==
X-CSE-MsgGUID: JTqEbemmRDCaGUIapgX1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253328303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:04:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viww9H1idvIiwb73cK+Tn1bZNg3DwdeROxHqPt65JUadPPMb/g4ZCQSqDOXQ4XSOCPll1RWrIgbte1oqTjfttfkO9IyfY60HqhydYWCOC++yoZClicR6y+J+E1UNhckPAwgfh0GL/NTyCDfgI/ci5MZWDNcgv0ZNxNq2lYyZg6JBB8YvF/reNchY08T96ekVEOG/yYiX1Xf5EzfFz7Q6Gbknn6v2fcbNkL5zLiUV1eZ76dzJMLoYkT3HZ376gBZAWPZMaCPXQKtXaiARB9PpFOnVp73uEdkjQ3DDCPySiRdvNAcdTsc+ejNAVS8xopl81NtH2RknBIODUgdpkhKzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyhPhPLdn5k0k+ggGj2NKvYD4GGulbGF2q6xTHkTPGc=;
 b=O+MSbWw2utC8EvWTdMkTFcvg22dS3LCjBZH86JG1GBcTUOPshVgOfW9ptPdPwGFoMQAklEx19xE/z3y18Cv/rHT8iqmp2qdHkjWxYzRUm9JfdSdESDowzZWlGckNSvkzlsD20ZwQqSQNkg2NB7k/T5RcKMA+kg3IJ1yy3ZH0V7L/PIhOnIU0BACdKztsmw5Z4kzA4pWF6D6KxaXeVRbAPjyDAGZCH67MdwUQ7xuTbVJtDuwHuU2o+zoJ/pPgjph5QIQq4BvGuF2JzHXnIDg1N1NIXqLB6q9fCjAwKnGI0RQKfHtGibOG5DI1t3hs+vydIKmXYunmX/rOJdYagNdxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:04:12 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:04:12 +0000
Date: Fri, 3 Jul 2026 23:04:06 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 15/31] tools/intel_gtt: link with minimal
 sub-libraries
Message-ID: <apjio2bt3t3apzqy7csjxxr75dibh5rdublq5tlzkohofki4bu@up23ogeonb2l>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <00b19508050764d5aebe64bceb7272868967e106.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <00b19508050764d5aebe64bceb7272868967e106.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 695b9656-a875-4452-2326-08ded946a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: GLbvKRru3vXb+y6Qd2sFZOodfG2ZGdDxNXnYRietsuZc18syzh8JW+ee6OLxx4/y0cRuB4bat7A9yahQpuENqmtCF2yJ+WVmtSZjbehTKUxfWu0iCD2Z8pz6gsLAMp+VOeXM6jdhTs/d2y+zr7SIfxyD8gz1N/YJmFd82EJTLnSybEXHb2sqC7aEIXYpZqKOt3wYwcfPpfvkKubMMya2Q3/F/zaWQdRvSfh9rQykCLux5Y3UWFcljN2u/i97E4VG7vRycXvgSpTuPiIHbXF3FPeoTtf7lGd3TxVvaGR2ffgjIU9w83GRRU6ZaHuTHoV/0X5COS8isHKj7RQ1YmCuSJq4RxiyfDGzDbLnoDQx7VW5Gonp9iQVOxfsHA5cGQFfebATq3O0j8nRQt+2C3Zxq7lsdGyVZ72E18OY6iuGEPZ30pOmiGMQNIgbI3hElpj0LVF3g663Mo6BCrQ/0GAczMZwVhGc9P9DR9hUM3L+in5XT1LJ16UmPwBv2UScmieRtYie/MtyI9rw8zOHkULTHLjJ65xiQ1lUi3xLvByjRE2EcxR7oh7cAxXR0ASyXZBnRp6q3N/RBqZ4xSp3AfVMqDpnvK7hfYZMemoqLh4ecU8K2j5m4W+9uWmxntHxLL4oEgJ4pW0GCLjYMWX9Wu06jhfsuMvhX1kXqZP4MBFUaOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZIeXI2L2c1Z2R0M1FaQ3BLdFQ5cDRMeE1vQ0FVdTlaUXhTcCtLdWYvQ0Rh?=
 =?utf-8?B?T01pNXNwdVR3L09qNlRnTGdyQ2ZGYVJrTXNjeitjU0dFV2RpSjhnZ1dyNm1n?=
 =?utf-8?B?S3VEaTJnZ3ViVnRTRngrby9lTXZLN3p0MkRvRDR1RTlLYm96Sk9CcnVSTmFP?=
 =?utf-8?B?WkFKa1J1VERGY05jcUoydWlVcmgwTForZUJLWUlSZ2pNY3dHekYwVkJBd3Jk?=
 =?utf-8?B?NEhaQmIvdGhBZ3pFekRVTUgyZkM5UkpNMWEwekpxVGcvQW13ckd0OWxmV3Az?=
 =?utf-8?B?Slp3L2kyY2NhSU4rMWgzTmhxWWtFNWlTMDg5aTNnMDJZclZzZjlHVHE4TlAr?=
 =?utf-8?B?eEdzV2NMY2hjb2ZIOW8rK1AxOCsrQS9JZDVoeENXbWtLb3k0V0dwRGo2bFBM?=
 =?utf-8?B?anVIcU1peVhEQ1dnTTRPQnJieXVpL1BhYmdLWUxSWklLeU81d012R2twS05u?=
 =?utf-8?B?RDZpS2JRQmsyeEN1ZVRHKzBvc3BXcVkyVXFTYXhMdERVSDJYNm40M3YwNklK?=
 =?utf-8?B?VU5kWlA2VGZLRWFnZUdJdk1TTmQrRU9XNzhISU1xVFdxZVZRL0FNWnRQYlFW?=
 =?utf-8?B?VjdPNmJlTjhTVFVqYXZZUnFaK2hGU0I5czBiOFNQVldSUHpWNStkaWJJZi9j?=
 =?utf-8?B?Z1R6TW5RaEkyTE1Ua09GMUkxMjNUU204NDFEeVJYOGJ2T0Yva05kdVRJa1Vk?=
 =?utf-8?B?WFNwMmNGWnR6ci9TTUU5YXZXY1BRNHkyUjFObE5qb28xTE5XbjZ4ZVU4bjBo?=
 =?utf-8?B?cmFyK240Ty8zSzJQWGJVZHoya09CQ3FSRUZRckx1N1ByQ1BjcDVkZHF2OWFM?=
 =?utf-8?B?SnZuWFA1ckx3b3FUKzF3ZE1WYXdoUjIrOHI1Yi9jV2lHalZkN3lpdVhScEVM?=
 =?utf-8?B?clZSVThuRnM3TE4xckxxVzlPT0lDa3hHbk1DUjk5eW1RZE43NW5UbDJRNkN1?=
 =?utf-8?B?b09vbXo0K25xM1dGMVc3Kzd3eUpPRm80TlFzZjRWVXJSdThrckhHbkl3VEZI?=
 =?utf-8?B?amQ0YUo3cFZkRWQ5RVJmZUh3MEt1aGl0TVo2VGYvMndTRC9aWDZZZFBtSzBj?=
 =?utf-8?B?SEFmMitEczFUT0NiYUVXdFFsVytGczJ0c3I1UkU3azlXcnZ1VVluaFdPR2Zp?=
 =?utf-8?B?Y3J0THpSQmlwOCsyL0dBODNESlZoNDgzb0FGbFQ0cFJxaVhkQnBBZU1UT1V6?=
 =?utf-8?B?clRHN01qWitPTXo1OWEyMTVZYTIyQUZHMGVDUTZNbTRVeGZ6a0tNclgvRVhY?=
 =?utf-8?B?RVFuYWR1Ny92M2IzeDJNL1BlL3krWUJDMXFqYUhab1pjL1hvcnBtVTU2LzFt?=
 =?utf-8?B?Z1JNM0VsMmwvK3dxMXBiZ0R4QXpNMU5pVWRocUFxa0Q0ekZObDNKeTFKRWNi?=
 =?utf-8?B?RHBUVzNadExSQVJTSlpMTEYzd1JLQ3A5QmFzVlp0YjNqT0JTQXRzWUFvQXdK?=
 =?utf-8?B?T0RheHJPc1BrUGRXTEs1YnVUNW1MVEJMMGw4VW5yMEdnYUxKbEZ4b2ZHYjVS?=
 =?utf-8?B?MmVQbk1EbE5LV2VFTStTNE1Ob3ZTY3pOdExXQjV6Q3BCelluVW0va25yT08z?=
 =?utf-8?B?TVNCOHVudGNZWUlBNWNmMFQrdVd1bkdQWlhDR0V4ZFo2bGdXa1BZWTFwelVU?=
 =?utf-8?B?ZGNOZmtjMkwvbTA1U3BxODF2N0ozaTNSUGh4Z1FKcHg3dXBKWmVtdkMzMWR4?=
 =?utf-8?B?TzMraGhQSktGTHBFeWF4cXd6NTQrWjFkQjFoTHhnY3Y5UXBTWHA4R2laY0tU?=
 =?utf-8?B?VWJPZ3FiVEttemlNUnhLNWFIZklvYmo3OFFMTmd1bWh6MzNUSmxUanZ3U1VU?=
 =?utf-8?B?V3RBMTZ5dkxVc1ZIaVU5ZHBqQzRLRC9tcmxQSFdPMy95SWJiYmtnU21CV2dy?=
 =?utf-8?B?NFU0a0pldllPaWRxNXBVVmNhckVJYmwwYXlCU0ZoaVhMZEo5cUR6OUVJRTFt?=
 =?utf-8?B?UFhFYUx2MUVOczBnU3BnSDNyZmJmSkxkQm85bFVEVXBDaXlCdjF0WjZITTNn?=
 =?utf-8?B?cmtHUnpSMlFXT3I4dVByNDZzTWtYN09WT1ZWOFJqMnhKRU9ZdStQRDlVMHQv?=
 =?utf-8?B?TDFIYnJ5aTlSalpMWUthRGNtNGdUKzcyc3oySkY2UDZseFV1QXBFSElyL2JY?=
 =?utf-8?B?SW50eEY1MHhBSEJWbEpITHFFa3c4eG9TS1IvdDRpOVQwNXJaejdsNE5kcXQ5?=
 =?utf-8?B?TE1wc1dwUERzMFVSdEEwTGFpWUpNYUJsWU5EMHJ2NTg0dm1LT0hzRU9xM0dB?=
 =?utf-8?B?bGhJR25hVTJsdDhDb001bGN5Y1BMWkhhK0E0cEUzTlR2RDA1MnhZcmZlbFJV?=
 =?utf-8?B?MmQwM1dCYzVGVXRVWXE4SFI2ODZ0Mk5kUnJ3OWFsdnlWOGkwNmN4WlgvYkky?=
 =?utf-8?Q?LKPRGOiXs+gmFoB/HJ2eZdnc88ecAIDrQh4LkUlAS7Ima?=
X-MS-Exchange-AntiSpam-MessageData-1: /D92S9wgcl8i631e8CVF7ZjAxBr6HrzGJE8=
X-Exchange-RoutingPolicyChecked: ih2bVB6K/2xKo382LgZeIvT9U9V7yU8tGdJSd39iM1z58tSnoLJUWJZD+wtZbY7bKUyI2rDdc982etEXRq1UUfIjAWHqtwxw57gGoKc4O8Zcc9LuCLhGN4BJVeYBcwiKfzwZMYY5uZ9JKM6sbBNpDCG0zbUWnzw3eIdcfVUNzEyLevWkVDdYSQ69AHdrO1/pNOIey7kn50V/GUFdnNXJ9Lt2eqps5+7ikg+PMBu6gGnUB0ICwEpgryfrHL6QSMLMsdjlS05QMW/6Ukhex/2VoQz6bta6QK6qxL+vyMGTQav58SiahdEf/eRUEg4u5vn+vqY5JM9o7xkEaw5i8PvoTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 695b9656-a875-4452-2326-08ded946a21b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:04:12.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtPxDk5A598nv2TuJdvV9FAwa7WuEO3PAxK3z5mxSFSGHh+k50R5xUO1gGIBV6KyJq4ASFO28pWQymKe4bucMizYVgkYJPqM2DI9umuD1eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:49 GMT, Sebastian Brzezinka wrote:
> intel_gtt only needs the chipset helpers plus the small tool stubs they
> rely on. The full libigt.so dependency chain is unnecessary.
> 
> Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
> lib_igt_drm_stub, pciaccess and libdrm.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8eb346321..a3fef87a9 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -25,7 +25,6 @@ tools_progs = [
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
> -	'intel_gtt',
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> @@ -75,6 +74,12 @@ executable('intel_stepping', 'intel_stepping.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gtt', 'intel_gtt.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
> +	                    pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
