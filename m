Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92524EDEC12
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 06:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A910E94F;
	Wed,  4 Mar 2026 06:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKGi9up7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9F10E94F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772604399; x=1804140399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TEMoOn1MtGJz+oU/UomZyRNW7q50lWgBCH9Tsey8LH8=;
 b=eKGi9up7jSXxQe3loG+L5qWs7H7FRbWgBXU2lnObO1B0+rzsg/eMvZLB
 L3pe8XMMYwVOay3AwavaF6AIoF4n7PSNEMRkKZAWY3Vv9yUISfrfEwLIi
 Tp9u7WN2hDBRaROQg5A1DoZKC9OfTvXPEzQNMcQIoq7dSi2JVOVGAoDH/
 3JWOqOIxb0ni5uIAAqjter2nLoyURPn9e+y4SqZoL7WMvgx0IK/mrFDDB
 77tWLSmnsNCIVGH/l5xfNJWVyZfxIxCHupId1DvsURxYX2rat0IgtgtZq
 y/0dcIZMQ6VW0oVMK7ZPAmie3dvdObyF5HlGZDHKQxtF7sLkcjzVFSvep g==;
X-CSE-ConnectionGUID: J6xYJDbcQkaRd3q9ybXLTQ==
X-CSE-MsgGUID: f0bQu82zSNGPbU4o6xtcCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96269092"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96269092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 22:06:38 -0800
X-CSE-ConnectionGUID: n+f7RsAoQkaWVvvOW+nuLA==
X-CSE-MsgGUID: 39GOiVUbTd6Vvly/QHDENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215647711"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 22:06:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 22:06:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 22:06:37 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 22:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5ys6MMLqh3eD3WVdSbdzKv3w6tvo/gsxDXFaUNkZEKJdac8YUHVZcZSdcJv8WwJhhgqnUSMYnvhx36KWDoqsqMz0qb9OLPNyxeABjy22NlLMIpLJ77cnkq8lHO2//jdDgbqV0o3ubtI+OkSxzCuQkSXBNGziCWQFPCfdi8Rxx9DtHvi8xYove3Wi1VXIqpyOMx1YN8hIXt33pjfuu4gCV1/WMzV6EKbyhbQwC+hbbslaTNU/9Ubll8ejrvvm5Wpfwym05YS/cSXOoOPA4JripH13C2e3hq8oewmt8vhOfBjzVQvysE+4CKD2537O+2R34ZYBJnZPmN2WLe9nRC2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e31r0UR/gmj0OvS8P1RZkXE74fm6UOLXPfYFXCDwlA=;
 b=gCJBOqoNi6oqUXih5AkTmdykWM2Q7MfyupWJeNoRX0jVIY1bi4TwMmFparVKSDWc8OZh7D2DYmSotkhlt6jWgcsd2Nf9ikVqEWYhswiArCPqeS4VpD8LnJHdJEaAWl/hNMImXecP1qE1YEq+GX+EjRq2/W8mWwPMX1T8LifhVospPvGIWPo70EMEyAZxAE2ue7ajiEA8ci++u17KPz0HuTO45xWe8BP41iWFC+KHofA17XJnHAYw5U0DdxnQsaC6bX2XpZutyLaEyL60HPU1nSJ0ZjLhlHCMNkX1JT/0Vf6yDn7B7vVD+Actb2QLVXoBziKc4D++fD5HmMhuA9cKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:06:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 06:06:35 +0000
Message-ID: <a188379a-d5cd-42d1-9084-88147da592ef@intel.com>
Date: Wed, 4 Mar 2026 11:36:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test for Explicit
 Fencing
To: S Sebinraj <s.sebinraj@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <carlos.santa@intel.com>, <krzysztof.karas@intel.com>,
 <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>
References: <20260226093127.2882485-1-s.sebinraj@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260226093127.2882485-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 700c1559-6821-44a2-2c63-08de79b43085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: GZMR2Wl2Shq3nBt1qjFPZNm/20o4Vscy3EI+gGOVAZ4Ywog5BbE0/eCdoUNS5iIiFaLgXT12+ILXhwxkVQg3k4az2Nm7g6tEz7KXNGLG6svbsXHrwguTyCfMAaS9tgnoHkjGLEqU3mfacs1uw6wq1O12CcgsA5ToCavm+Tx5j5BrOrIJfsELwPZyXJ9jn4ybr9BIdfJNIJvZROUlN3Azo0pc5SGnjEZd2XAIRRnmLz6p6FS9LdhpsoH8qwFLg7Q5RgnHfXrby9LE9o+XI3I+1bkLAe6lT6xWQqmxp9C+F1wGZTOgarqFXyWgAH4/vMrz4Q1tqbJES/f3l8vFPoDaXwktZkfEkropxl14LFIvwgmcE0xiAscQ4ZDHsECpDfIvrL8RxSYcTe3Mz4v2+vo695NlbfvLqR0i1Kt8NIzQIePUegIhSUeq45OAkfu34Y9tfwG2SWEcm0mINg9Mjmy5O+tCXCRbDyS/NiJU2yovVy2nJ+UXu/ADelF5Ist0TmC4Pn7ZRuvt8gd3U3jkN6N/jex5ctqr02U6cs3OVT2j+tFLF3ZBT1sc1+0A713Q0Y6HxZV3zM+F3C7oiRA+D7EEDw6V+StmETyNuV59l95ZL4fdDn1xh4GWPN97p9u8YxX5uwdi5fvQE7GAoXm3IydxnIuhWb8VnRvMqj/wVbuCWCl/3nvuwRqao+gBpY2DUfw/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE1DSnBic0xDcndGQUpJNnJPSURnMmkvZXl4dnNwbSs0dW03YlRMNDBmWEZx?=
 =?utf-8?B?R2czKythT2d6ODNWaFdiVDZZSGc0bS9HKzdJcGZoU1hVUC8zVDdsdUJyUjlr?=
 =?utf-8?B?Q3l3Y1Rpa1h3LzhJcVEwSElSRjIvME0xMlo5WlFNWUJjQ003Z3I0MkhhTlM1?=
 =?utf-8?B?OUUxRWwzTG81aUp0dlJudG5xTEdZSEQxdUlSSjlTZEZKVlRDZ1RxUjVMaEJY?=
 =?utf-8?B?SS95cGxNWXNWWlZsamg5R3JVbzNNMnBVbldtVytsS2xRcU85RkNNM00wbU1z?=
 =?utf-8?B?NzdwL1dtVFdTZTJPSDgxK3h1M1BCR1dHMTNwaE1UM0N0VVJXQTZ3b1NLT1hY?=
 =?utf-8?B?TWhia2k0TjR3K2dwMFdzbG81SmNHVUZnMHZxUCtNM2RLM3Fsb3hwMzdwYVhn?=
 =?utf-8?B?cDlHNUFWZ1ZySWZ1aTNsMkMzb3F1Skp0Sm5raGVrQWFMTG5RaDVydThSem5x?=
 =?utf-8?B?d1c3T1NCTXBWTkdYZi9wcFZrUG16TFBYNTBzWlJXUS9oQmRWNFYrY0xadnlr?=
 =?utf-8?B?VkRrSFVvU2E0SlpPb0ZTVktSOUl4N1lOQVFBZjJjSGQxQW9qZTl6MjJjZGpU?=
 =?utf-8?B?cUdRYUVqZG1MWTBiaXZlWm1FTTIvYlhWODBVQ1V0bndGdjlad2lrKzE1L21T?=
 =?utf-8?B?Q1FLcXBGYjV3YVlnc2x3Z1NNZnpRRmticEtxTDVpMVVLQmZSVGZiamxTQkcv?=
 =?utf-8?B?V2RLN25Za1NFNjVrZUFLOTg5MzdiWUl5T0RONGJrM2hSSHFiRWtOTXM5NlpO?=
 =?utf-8?B?TlhmSisxY3JueURVc01iR0JuVDJoMjliL3hhdTFiaDV0YllSdUQyYmp2anRa?=
 =?utf-8?B?OXlXLzl6MmtnSmd6c1hPdXBSaVAyMjE1TFcvbDAxemtUT3JZbUpLZUQvSWRE?=
 =?utf-8?B?UE8zbm1QNEQrMlBYcXlaK0RtMHo0bHRGZDhjK1M3bTBNQWxraytLQ2hIWUhB?=
 =?utf-8?B?aktjNmhPaEVaSVdramxGV1dZRXkvd2VYYTNoRHA3Skc4YmJoTEg4MG5Sdjdi?=
 =?utf-8?B?aWljT05rMkdXTmxwVW1ycUhmekY2RGJvTHB3ODF4UlkzV2JXcGQ5dDBiS004?=
 =?utf-8?B?TWhyYjZMWTZUZmFqMVUrbVhybUV1TUJ3VnVJZ3B0cUlTMzN5NnBSVkdsR1lM?=
 =?utf-8?B?dzc2YitnVmlsUEY4dm9KaWRPeEgwRDF4ZWF4SXdPY1cyUFNCVnRpRjE2N3Jz?=
 =?utf-8?B?cWUvSmpSczdSY25tRWZMWGZwUzNtL25YeWlxVnR5Zm05UkQ3RHdablAwNkQv?=
 =?utf-8?B?YlZnQkk2VUNpRndYSDBBRnI0UXE3dU45VmhjclFlUjFsVVNIVWxOSEt5bWV1?=
 =?utf-8?B?dTU1ajRVUUhZODNpRG1XemdVWEQ0SkI4NEEwZUZQUWVpbmRWUzdITTlWcHZh?=
 =?utf-8?B?eGg4bDVRaEx6d2FKVEVSV0x1OWUyQ2J4RWxSOVBjOE5UVFQxTk9XT1lHWCtx?=
 =?utf-8?B?VDkvN3dxTmFNRWpTLzZ2aVJDY2RxSVZsZmc2RHE2NHdKankxRVdXSUZ3RUd1?=
 =?utf-8?B?SFd0cmpoU2NHUk1WRDdTaFpucko3djRia05Ia2d4UVJrZkNwU2hqcWlxMmdI?=
 =?utf-8?B?Q3FGMW5oK3doeTdjektZdmRsN1hLT09QVS9xc2VDR3hLY2tXdGRaOFIveVpo?=
 =?utf-8?B?N3dHMHBGWGE5Zk00RU9Fd1czMkQyTWVkZnltVEpTUHZ6eDdyd1RRMFQ5V2g0?=
 =?utf-8?B?MTJ6M2N1R0FZSTNieGpKdWlBcU5nNW5ia2tsRFdRN3ZOUVVlUVpweURUWWQr?=
 =?utf-8?B?ZzVhYU9VWGZhRCtqUTV3YTdmY01YTmhqa1dXaVo4NnMzM2tsNE1iT0NzWVVE?=
 =?utf-8?B?dC91eHNscDFTckFTbnFWN2N0M2ZQcklBeUl3NEZiK010RHJORFErK0xWVTkv?=
 =?utf-8?B?MkdLWE9lRFo0YzhBTVZnSXhDMTNxQUtqdFh4SHN3RjhFZjc1UVJ2eTVvSDN3?=
 =?utf-8?B?WnA5emJSSVJ2UXJOaFA4VTRHYW5MN0RGYUcyT0NSS09YbFNyejNGZ0J3U1pi?=
 =?utf-8?B?OG05ekZmKzVPeHZIWGhicmJONkxBV3BaT0NqMFh0My9ZR3grVUxsZjJNNkJO?=
 =?utf-8?B?Z0hqUXQwQ3dzOGY2bFUzUmVsVnZJODc1WHNDdXNrSXBYRVhlNTBWOWdSWWpi?=
 =?utf-8?B?R3NUL29SVWE2QjZNTHBwKzFDTVBCT1gwVFg0TlNTRnJKcHNkSnpYd0JaaytG?=
 =?utf-8?B?SWg4aDdUaHRDaTlueEl5SXNTWGF1Nmw1ajYwclhMMlZJb3VnOGJ2M0M1bFho?=
 =?utf-8?B?ejRhbUh1M0p2VVUya2U2UmF4VVh1QythT2wrK0pFK3VkL3hQK2hSVzY5ZE44?=
 =?utf-8?B?YU03Mm5NMHVLSk9iN0FHQTYzb3NMRjl5V09WSnoyaWRZSWxVVVlLdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 700c1559-6821-44a2-2c63-08de79b43085
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:06:35.1931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4RU7c575IfmC0qwUCB3juG0ClXT9L6CLsgK11zsijj15Fjx4BtT+ycS3H2SgsSit8Noi58uLgv1l06JaMCYRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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

Hi Sebinraj,

On 2/26/2026 3:01 PM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Changes:
> -v5
>    - Make overlay plane validation scalable with
>      overlay count.
>    - Modify commit message.
> -v4
>    - Fix build errors as per latest API name
> -v3
>    - Add crc check on display update
>    - Adding proper License entry
>    - Reduce test description
> -v2
>    - Add crc check instead of visual inspection
>    - Reduce debug logging which are not needed
>    - Add a function for initial modset
>    - Make test not specific to Intel drivers alone
>    - Sort the included libs in alphabetical order
>    - Modify set_output func as we want only one
>      output per pipe
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 348 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 349 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..3d96e0de5
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fence states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple planes
> + * are updated in a single atomic commit with different fence states. This is
> + * critical for catching fence synchronization bugs where the driver might:
> + * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitches
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
> + *              2 planes with signaled fences and 1 plane with unsignaled fence.
> + *              Validates that display waits for all fences before updating any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT (NUM_PLANES - 1)
> +
> +#define FENCE_TIMEOUT_MS 2000
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_plane_t *primary;
> +	igt_plane_t *overlay1;
> +	igt_plane_t *overlay2;
> +	struct igt_fb primary_fb;
> +	struct igt_fb overlay1_fb;
> +	struct igt_fb overlay2_fb;
> +	drmModeModeInfo *mode;
> +	int width, height;
> +	igt_pipe_crc_t *pipe_crc;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +
> +	for_each_crtc_with_single_output(display, crtc, output) {
> +		int overlay_count = 0;
> +
> +		data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> +
> +		/* Count available overlays - we need at least OVERLAY_COUNT */
> +		for (int i = 0; i < OVERLAY_COUNT; i++) {
> +			if (igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, i))
> +				overlay_count++;
> +		}
> +
> +		if (overlay_count >= OVERLAY_COUNT) {
> +			data->overlay1 = igt_crtc_get_plane_type_index(crtc,
> +									DRM_PLANE_TYPE_OVERLAY,
> +									0);
> +			data->overlay2 = igt_crtc_get_plane_type_index(crtc,
> +									DRM_PLANE_TYPE_OVERLAY,
> +									1);
Please fix the alignment here.
> +			data->output = output;
> +			data->pipe = crtc->pipe;
> +			data->mode = igt_output_get_mode(output);
> +			data->width = data->mode->hdisplay;
> +			data->height = data->mode->vdisplay;
> +			return;
> +		}
> +	}
> +
> +	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	igt_remove_fb(data->drm_fd, &data->primary_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +	int overlay_width = data->width / OVERLAY_SIZE_DIVISOR;
> +	int overlay_height = data->height / OVERLAY_SIZE_DIVISOR;
> +
> +	/* Primary plane - Blue background */
> +	igt_create_color_fb(data->drm_fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, /* Blue */
> +			    &data->primary_fb);
> +
> +	/* Overlay 1 - Red square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 0.0, 0.0, /* Red */
> +			    &data->overlay1_fb);
> +
> +	/* Overlay 2 - Green square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 1.0, 0.0, /* Green */
> +			    &data->overlay2_fb);
> +}
> +
> +static void setup_initial_modeset(data_t *data)
> +{
> +	/* Initial modeset to establish baseline (no fences) */
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
> +	igt_plane_set_fb(data->primary, &data->primary_fb);
> +	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay2_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence states
> + *
> + * This test reproduces the critical scenario where multiple planes are updated
> + * in a single atomic commit with different fence states. The key validation is
> + * that the display does NOT update any plane until ALL fences are signaled.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running operation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +	int timelines[NUM_PLANES];
> +	int fences[NUM_PLANES];
> +	int ret;
> +	int out_fence;
> +	igt_plane_t *planes[NUM_PLANES];
> +	bool should_signal[NUM_PLANES] = { true, true, false };
> +	igt_crc_t crc_before, crc_after, crc_final;
> +
> +	igt_require_sw_sync();
> +
> +	setup_initial_modeset(data);
> +
> +	/* Setup arrays for loop-based processing */
> +	planes[PLANE_PRIMARY_IDX] = data->primary;
> +	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
> +	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
> +
> +	/* Start CRC capture to verify no premature display updates */
> +	igt_pipe_crc_start(data->pipe_crc);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before);
> +
> +	/* Create timelines and fences for all planes */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		/* Create timeline */
> +		timelines[i] = sw_sync_timeline_create();
> +		igt_assert(timelines[i] >= 0);
> +
> +		/* Create fence at sequence 1 */
> +		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
> +		igt_assert(fences[i] >= 0);
> +
> +		/* Signal fence (first 2 planes) */
> +		if (should_signal[i]) {
> +			sw_sync_timeline_inc(timelines[i], 1);
> +			igt_assert_eq(sync_fence_status(fences[i]), 1);
> +		} else {
> +			/* Do not signal this fence yet, 3rd plane */
> +			igt_assert_eq(sync_fence_status(fences[i]), 0);
> +		}
> +
> +		/* Attach IN_FENCE_FD to plane */
> +		igt_plane_set_fence_fd(planes[i], fences[i]);
> +	}
> +
> +	/* Swap overlay colors to detect scanout changes via CRC */
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +	/* Request OUT_FENCE to track when display update completes */
> +	igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
> +
> +	/*
> +	 * The atomic commit should succeed immediately (NONBLOCK mode),
> +	 * but the display should NOT update any plane until ALL fences
> +	 * (including the unsignaled overlay2 fence) are signaled.
> +	 *
> +	 * A buggy driver might:
> +	 * - Show primary and overlay1 immediately
> +	 * - Cause visual corruption
> +	 * - Fail the commit
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_NONBLOCK,
> +					    NULL);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Get the out fence to monitor completion */
> +	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
> +	igt_assert(out_fence >= 0);
> +
> +	/* Verify overlay2 fence (last one) is still unsignaled */
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +
> +	/* Verify out fence is also unsignaled (display hasn't updated yet) */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE already signaled while overlay2 fence is unsignaled - "
> +		     "driver did not wait for all IN_FENCEs!");
> +
> +	/*
> +	 * Wait briefly and verify display hasn't updated via CRC check.
> +	 * In a buggy implementation, the display might update prematurely.
> +	 */
> +	usleep(100000); /* 100ms */
> +
> +	/* Check if out fence signaled prematurely */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE signaled before overlay2 fence - "
> +		     "driver updated display without waiting for all fences");
> +
> +	/* CRC verify - check if display has not updated prematurely */
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
> +	igt_assert_crc_equal(&crc_before, &crc_after);
> +
> +	/* Now signal the blocking fence (overlay2) */
> +	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +	/* Wait for overlay2 fence to be signaled */
> +	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +
> +	/* Now wait for the display update to complete (out fence signals) */
> +	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(out_fence), 1);
> +
> +	/* Verify display has now updated (CRC should differ from baseline) */
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
> +	igt_assert_f(!igt_check_crc_equal(&crc_before, &crc_final),
> +		     "Display did not update after all fences signaled");

This does confirm that the CRC changed after fence is signaled, but IMHO 
it would be better to do a positive check with the reference CRC of the 
expected frame after signaling, to ensure that we don't have any 
corruptions?

Thanks and Regards,
Karthik.B.S
> +
> +	igt_pipe_crc_stop(data->pipe_crc);
> +
> +	/* Cleanup */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		close(fences[i]);
> +		close(timelines[i]);
> +		igt_plane_set_fence_fd(planes[i], -1);
> +	}
> +	close(out_fence);
> +	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
> +}
> +
> +static void reset_display_state(data_t *data)
> +{
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_plane_set_fb(data->overlay1, NULL);
> +	igt_plane_set_fb(data->overlay2, NULL);
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
> +		setup_output(&data);
> +		create_fbs(&data);
> +
> +		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
> +						 IGT_PIPE_CRC_SOURCE_AUTO);
> +	}
> +
> +	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
> +		     "where 2 planes have signaled fences and 1 plane has an "
> +		     "unsignaled fence. Validates that display does not update "
> +		     "any plane until all fences are signaled");
> +	igt_subtest("multiplane-atomic-fence-wait")
> +		multiplane_atomic_fence_wait(&data);
> +
> +	igt_fixture() {
> +		reset_display_state(&data);
> +		igt_pipe_crc_free(data.pipe_crc);
> +		cleanup_crtc(&data);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..eb7c8b13b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -36,6 +36,7 @@ test_progs = [
>   	'kms_dither',
>   	'kms_display_modes',
>   	'kms_dp_aux_dev',
> +	'kms_explicit_fence',
>   	'kms_feature_discovery',
>   	'kms_flip',
>   	'kms_flip_event_leak',
