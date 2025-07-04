Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168AAC83030
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 05:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE0510E929;
	Fri,  4 Jul 2025 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BE5TlMrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323F310E929
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 05:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751605495; x=1783141495;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cp/E7DKdO/dNL3OdeQHhnzbbnTG8Ak4n9siMvHsfrZs=;
 b=BE5TlMrW0n3Kb7Ilovx4u78Pex7tGm0mqw1cQ/v8acOrK0KAlJb1kYdu
 6OThqirIY4A6A6RJhaKcsaqg8ez5tpJHbwpHspic0h5wdVVmYXyaa2BRd
 WGK6OPWbOFG5RfOURq8m6UkcNNMyYQuo0B4ZLgDBeo0UCstiaz7cu5IkO
 bLldKAo+nZqJQBoR1nSWFgV7njinTsDjLZMq7L68H4p0w+XKz+O0HBHOI
 S/iZnbXai/1qhfN3+XjJILLEE1WypJ1lHyD3/bt2TDhZrSawbRkBHLGrl
 +NV5HaYHocvzgGnU+rJRUBgoXw2TH23oHhe6W+EJUMtS++VK9Uq9TStkA Q==;
X-CSE-ConnectionGUID: 4Ia3w2tPRoOYslpcVbVaQA==
X-CSE-MsgGUID: X+5baeX/S8KuXERqwOWPvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53069199"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53069199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:04:55 -0700
X-CSE-ConnectionGUID: axxFgY8XTnacALKi02IKmQ==
X-CSE-MsgGUID: EhOXKPc0TWmHjkGfseWygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="153966725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:04:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:04:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 22:04:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c//wN3Gt6r0gMDf107IwCTJmsgDwszBI3+4Pdj5z6upRIXUsv6tsEwLFLQkS/nqpXbljjJbogRVYNdYRxU+avr41Aqy82ILNRO0gLHf/HrLCApCIgTBB7M31JjT6O0iMVBqk/ltXfZoYZsPGAGHUAhPUXLXG3rNnmNDsIRnRLkRkfMKxVJ7yd5mHMQqITOz06624QAv514lBkOdc//mn4R3q8nnvp6n6xMkc7HstVFefcLVvyrIjgjRYcj9NT0kF0jTY5xoBjcDdP4tfInkHucA7in7VE7YreWyN+OdSRO0gueGA/5UKHSPxenRa8rXch4+wpPWL2oJzn8VRyVIpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgh4iynEIkPCIJ4PtLxhAcmLnSWdJefK+hOEU5onfwk=;
 b=EThvbEHTbhlGDQcqY713z9k1AKObT3+PEPFUjko0wTKMhmH3SfocMhmRu5t0I8F6kPuFGC6kZxqjf5AY8FU3lKqqxoA5FwLCFDvwhCpwXy11blirFSjEN4OpoE17yQ7TjRitqzE8TnspgfoEyAXEF5MAstbUDH7fH9x9g5zWouNgONQyOMpGkGPmZCZj6Oy7BXwLb5Ch/sXtF10rZi/FNPdGxj/G4LN7b+Awj5OI1sNnjc9v356Ixhqo49rQc8AIcqHqxCChEszc2odMnbDZKMmJbAyfBpyUkPXPVboZFXv0fbic8h0DjftGrJ6RJwsAwFszvrgHtbU17aiFs2J85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 05:04:52 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:04:51 +0000
Message-ID: <c87c8d0d-52b5-4939-a44c-95562dd9757c@intel.com>
Date: Fri, 4 Jul 2025 10:34:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] intel-ci: rename i915 testlists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250703140158.136166-1-kamil.konieczny@linux.intel.com>
 <20250703140158.136166-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250703140158.136166-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: eebe0c5f-5d52-4f5e-88b8-08ddbab84ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rmg2dEwwUzl0NWg5Q1lnc0RYVUdGWjZuZVV4cHlSUHl5MFNLcTFFNzdPTXBS?=
 =?utf-8?B?RHZScDlLNThoTStQaVVTbm9zdm95YmVvVDNHNkdiRUJTazVaa1lic1FIaG40?=
 =?utf-8?B?RFExOG45S3NFbU5sRmFsQjNPcnR0UlJCMjRoU1prU1JzWXNUT1lNdWhlMTlT?=
 =?utf-8?B?VjB1dGh6QVNIVThlMlE4YXJxK3F1T3hlVlZKbi9JMnlaSFlwVjAwdEFDMDR3?=
 =?utf-8?B?cmNRbytGU1hFMFRYcWxIUnl1OWw1UHJQMkZ3TXZVZE51UU1UbzZHQXNQR0h3?=
 =?utf-8?B?ZHg5K2JvSkxxenRoTDZyaXU2SWNYc0k3TFlDLzdhcXRFd01SeU1xc2QzemhF?=
 =?utf-8?B?RU9BT2psRlFqUUNtbjVYeXRKbnJPRnhtTWhyRzArenpzNlpqblBtSjlVNWx6?=
 =?utf-8?B?Skl4aVd1STBjWnR5eURaaXUzUXM0WkFMaTA5d3BPelBiTzgvUlludWk2WUNF?=
 =?utf-8?B?dVdNcnRFb0FKYTZqYW45SmZtZUc3bGlUdGUzRFo2NGkwQzhjMVVobzRWcG9q?=
 =?utf-8?B?ZW1SNlB3RGtwbVdIT2x3alBscXBLckY0cFVlUTg1NG5zRjNwUzF1NXFiVVBQ?=
 =?utf-8?B?QjdIc0E5V1dMMzVTV29xVHgrVUh0Z2FKeVhFNFJnNTE5a28zejFuWUZBK1gv?=
 =?utf-8?B?Rm41WXJVRDY3TmJHOUlUUG9FMHl3dW9IRDZvOW40azRiUGlIcXpWVkEvd21n?=
 =?utf-8?B?ZVpva2syRS9RaXZLRVZlSU41MmJhcTBNTVN1Z0N0RE1CR1Qyc2I5RUdMK1VN?=
 =?utf-8?B?Q0NsM2ZWMXR5OXdnTzZUQXBvdktrWi9EYUhscEswRzIyazZKbUtyeGJiTzhU?=
 =?utf-8?B?cnZJSFd1ZXE3YXliUHBwWnluNmgvYWRsS2ZBbllibWgzZ081NkJ2Q1IyYk8w?=
 =?utf-8?B?UHpzc21BWFNCaWFwbDd5dnRzWUtEdDdKOGh6VEhndDF6RXB5c05RbUtyYU83?=
 =?utf-8?B?RHVxY2lEVDNaSTNyQTcyZk11T0k5UWl6dFgvdUduRk53Q3dGUWJvbk42L2Zx?=
 =?utf-8?B?TUpMUm1EWFU1ajZCNGs1NFdiYmZHeUM4Y2c1bTdlZzRnVDYvWHpJdDVMZXhi?=
 =?utf-8?B?bXB4Q094dk80eVdjQURldVhoYkpSczBPaXFlZTJFbUdzOTl4TGQ4a29USFVS?=
 =?utf-8?B?aHNvVy9YZUJBK0RSVWFnUzhIbUdrSFZVbUplaTNSVkNuckVYTjVhZ3FJaWpZ?=
 =?utf-8?B?dDIzZ2MxMVUvTFh0ZlV0dFNOSjRXVk02OTIxQnI4clcrazB3QkVOU3FTK1p6?=
 =?utf-8?B?UVpndWh1L2hOK3VjNHg2UFBId2NyaGozRE5wVERuMGgrdWp0ckhRK2RnMmNa?=
 =?utf-8?B?VGZtS1Fkb3E4SnZ1UWdhcFJZTjZYd0YzSDE0d0lnSkNJN2w5N1V2RmlQLzlz?=
 =?utf-8?B?UlBxdE9QdlhSd3lIVGVVYTY1bm1Ta2NkYjZ4QU9VdU90a0JheG5sVm0wYVNR?=
 =?utf-8?B?aGlHUUM3QkNCenpWOGZKUjFHaW1xNVdIQUdhY1V1d3NjclcySlBBclN2YlVn?=
 =?utf-8?B?bFZ0UkkyaW1wbTFYclMyNGdYaE52MXpQdEJhWFJ6Z2owOThBajd3aEQ5M1Bu?=
 =?utf-8?B?OU5YSFpoL0VxdkhrTGcrT0JGWlhyNUtxU0ZybytuSUhCMmtNQk9uZEhsbUtX?=
 =?utf-8?B?Yk1COTVmYmlWTjdIT2VSZEl2K3ExSk5HYXlRcFZtL3hGa2tONjdjSTJXaElN?=
 =?utf-8?B?SlMya0s3ZDkxeWVCbG5RYllDT1VBZkVsWCt3bDVrd1B2cEE0dk9OZWt3VE9a?=
 =?utf-8?B?S0dvSG5hNDd6cXhGeUxIRldBaUVFRGUxSUVGRmpJZ0JoWlNLZkFBTTQ4YUVU?=
 =?utf-8?B?cklSblR0azU3bUt4MW0wRCt2cndzUzZ3V0tnMnQ0ZDZBb20yYVNNZU83bTd3?=
 =?utf-8?B?L2VsTWpVc2FLZjdlWFJNL0c4VSs2aDU5bnJKb3FYV1RuSEVQak1RUVVlZVFL?=
 =?utf-8?Q?rXt+qf75deE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVdYUi9KWUdtYmdRMFFKcUFlTU9qYTJXeFZURmZNV0lOUVNWcjRWYWtvV2pR?=
 =?utf-8?B?RlVSbW4yenBDUEc3RWcrdzFyZ2dFcVdrUTQ4RVFrVUJ3cmMyY2hFZkQ1L0ZT?=
 =?utf-8?B?ZERwOHhadXdveklsWW1kSlo3MFNEK1Z6cTFTYkJqV3VhNjBVV3ZMNlJtQThM?=
 =?utf-8?B?SGR0WmdUK09senFRVFJLSGdKMFZwbTNVdWxIZmI3by84TXJ1MlpmV0crN3l6?=
 =?utf-8?B?NXpSOG5MRllIQmM2SnRWQU5OV0FtalJTUUtwS0cxMTZ2MDFIVTlDOHRyWXoy?=
 =?utf-8?B?QnJNbk5icjZuV0tXeXhYeGJYa0tUL28rREZxbnFkc2xHeHBqU2xPSWZGTGRM?=
 =?utf-8?B?Vmc3M3BLaUlmUlJucm5jdjA4K3JYN2J3VENFYmhkN1lPRlRzN2F0VkJQOXZw?=
 =?utf-8?B?TlZVZWRSQWROMmNpbjZEdkRVQ0huQ3RmSUVOUEFMRTBrWThQVjh6NFZBZksx?=
 =?utf-8?B?NU5PZmxyV1VkOENvRStCaDZWWGI2cENUTTI4cVVUTGdXZkNYeGRzbGlnYXEv?=
 =?utf-8?B?VVhVZjU5TXpQVXhMSVBjaFVVcHRSUVEyTHIxbjY0eEVIeVY4bUpTdENnUTJM?=
 =?utf-8?B?bDIxSHlVTWU1VlhCakpnOU5ndEh5T1FGY0YwRTFLSmdjdjZuOUFHay8xTkNX?=
 =?utf-8?B?YkVyc2VQbzhNOXhBbnpvQStidUh5c3pLVUhRR1pTNEdEMXFZdCtOWCtQSS95?=
 =?utf-8?B?d2pIUTkrZ0NHbndIcys1Z2tTWGVFbTZPcVlZM3JmcGVnS2VZME9CNERUQzEz?=
 =?utf-8?B?V24yTisyNFpBem0wZGVGdWtCR0sxVnpzTXloeGRVTk13cXAwb2ticDQydEJI?=
 =?utf-8?B?eW0ra2FDbDhUZThmYzhtV01kdkxPNE5tWk5hRXhWSW5tcmdSTGdaemVOVnR5?=
 =?utf-8?B?bSt0MytuaUxrTTdmRUJSUGZXTk50L05SMXpDTDRJRU5lSXc4MmpLdzNUc1Jp?=
 =?utf-8?B?VjYwMm12aFJQeHppeHFGRFRMbkROWG80SlFRdCs0WnhvKzhrbDdhc2ZpQVhO?=
 =?utf-8?B?SjY5aTNCMG9rSnhaOW41OXowWE5yaExjaWt6ekk0clRyWjgvV21BVjQreENX?=
 =?utf-8?B?WmdZUG5UQnN1VDNUd0pseXBRVWJaNnoycmpoVzNPVmM5QS9Udlp5a1hrUm1Q?=
 =?utf-8?B?cVlmSVVEd1JPVm1wQkp3MStuellEcnhYeEl5YXU3SHplQmxvYThSM2tSRGNK?=
 =?utf-8?B?Ty9hYllZYVNMa3c4dDczSFc0KzNncDRqWmxiNUZXaVpleXMxcER6VEh1ZGNa?=
 =?utf-8?B?ZEx1VlVNczVRQ0NKdG4zOXJxR2Z5U1RRTy9UMm92ZUNIS1lydW5Cd2laTzcr?=
 =?utf-8?B?SDRGQ0RyRkJTeW9qTjgzbzA4Q1B5ajh6ZnBlczdCK0tmY2JjUWtPYm4vTVpO?=
 =?utf-8?B?STZWRU1aaTJ5UUU2Nmp3WFhNaVlGWnhXZ2U5N2RHMkx3Q0FjTFFwQjJOUUNV?=
 =?utf-8?B?SkZkeDl5NDVOeWhEZnliV2lDdCt1NmFEWmNuYzRNdzdwRjA4b2hpTlZCb2wz?=
 =?utf-8?B?Ylkya3Y0bE8wOStzWjduSTh3SjhsVHA4TFhNYm1WMkR6SndpMWxvL2xrZWNX?=
 =?utf-8?B?QkwrTDYvdnRKN2JPRVFVRjJZMzBwVncwVEZsMmYxVzVRdlc3RVlWSGtNNEEx?=
 =?utf-8?B?Q1dweHdFMWFKSWlPYzVHbGVFa2pyeWFFOTl0RWRTRTk1Q1AzdVNEdW1WQnZz?=
 =?utf-8?B?dlJiNEhNWm1pby9IQlpkcXVlcXRBZmtMRW1iSjBRdkoyaldpaFd6dTIzV0Vq?=
 =?utf-8?B?UDFmekp3R2RYcy9WZ1pDeWwxQWhNL1NJMXR6L1YvTDRpNFFGb294cGo1K3Nt?=
 =?utf-8?B?QlphMnorY0FIWVd0UFdXZFNMNi9PQ1JvemtReTlTT0JQSW1iUzZhWHNON29i?=
 =?utf-8?B?MmFYbU5idUFVd285ZG9yLzh4QmxYU1FIUndUVk80aTRXV2FERXkxaG5McjFB?=
 =?utf-8?B?bkl0enlTUy9DUk9yR01KVGdITzZDcHBTMFJCUlloVU9Ja25yR0hZcml5Yi9U?=
 =?utf-8?B?Z3puRW1TSU92V29hYStJa2cyTG14UlZDa001NHdPdkd2dy8rMDBHbDdWbWVG?=
 =?utf-8?B?MUJXVzVBdkM3cStGMlpkTkdvM25ncVpPNEZaU3RLQzZvTFZWbXRKazVzZi9o?=
 =?utf-8?Q?LIVuFRvEpUAk/dq+6wuy+91Sh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eebe0c5f-5d52-4f5e-88b8-08ddbab84ec8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:04:51.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPIw0xo+VgXyJTh9VKfxoGyLhUserdG6ApHPVsE6pOdIoQjp/ijn4Zzz3huS3QIQWrPK50FbrOT86UU4HFJUFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
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


On 7/3/2025 7:31 PM, Kamil Konieczny wrote:
> Follow Xe nameing and add i915 prefix to its testlists. In
> fast-feedback use 'i915-' and in normal testlist 'i915.'.

Nit Typo: 'nameing' -> 'naming'.

With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel-ci/README                                       | 6 +++---
>   ....testlist => i915-fast-feedback-chamelium-only.testlist} | 0
>   .../{fast-feedback.testlist => i915-fast-feedback.testlist} | 0
>   ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
>   tests/intel-ci/meson.build                                  | 6 +++---
>   tests/intel/i915_test_config.json                           | 2 +-
>   tests/intel/kms_test_config.json                            | 6 +++---
>   7 files changed, 10 insertions(+), 10 deletions(-)
>   rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915-fast-feedback-chamelium-only.testlist} (100%)
>   rename tests/intel-ci/{fast-feedback.testlist => i915-fast-feedback.testlist} (100%)
>   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
>
> diff --git a/tests/intel-ci/README b/tests/intel-ci/README
> index 5ef2ee2d1..102cdb1fa 100644
> --- a/tests/intel-ci/README
> +++ b/tests/intel-ci/README
> @@ -17,9 +17,9 @@ Changing the test lists should only happen with approval from the CI
>   people. If you make a new test that should be tested by CI regularly,
>   ask a maintainer (see MAINTAINERS).
>   
> -======================
> -fast-feedback.testlist
> -======================
> +===========================
> +i915.fast-feedback.testlist
> +===========================
>   
>   Fast-feedback contains tests that roughly tests a wide coverage of
>   features in a short time. If the tests in fast-feedback report no
> diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
> rename to tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915-fast-feedback.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback.testlist
> rename to tests/intel-ci/i915-fast-feedback.testlist
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/chamelium-only.testlist
> rename to tests/intel-ci/i915.chamelium-only.testlist
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index d18170402..17d3102bd 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -4,9 +4,9 @@ intelci_files = [
>     'README',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> -  'chamelium-only.testlist',
> -  'fast-feedback.testlist',
> -  'fast-feedback-chamelium-only.testlist',
> +  'i915.chamelium-only.testlist',
> +  'i915-fast-feedback.testlist',
> +  'i915-fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
>     'xe.blocklist.txt',
>     'xe.bmg.core.blocklist.txt',
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index f77a4d46b..007b374c5 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -25,7 +25,7 @@
>                       "exclude-type": "regex-ignorecase",
>                       "append-value-if-not-excluded": "i915 FULL",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" }
>                       ],
>                       "exclude": [
>                           { "all": "../intel-ci/i915.blocklist.txt" }
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index c13a5e0d3..d6b5ee21f 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -13,9 +13,9 @@
>                       "append-value-if-not-excluded": "Xe FULL, i915 FULL",
>                       "exclude-type": "regex-ignorecase",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> -                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" },
> +                        { "i915 BAT chamelium": "../intel-ci/i915-fast-feedback-chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
>                           { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
