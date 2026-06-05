Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F593CD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 05:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F39711A447;
	Fri,  5 Jun 2026 05:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaEgkiAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E6F11A445
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780638358; x=1812174358;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IL2hS3frDDVsaOyaJNrTUGY1774BXtc4pSm8r1Ss1xI=;
 b=HaEgkiAGJBsGDNUAmd87CIzsqeN8mIQSieGBo4k019nBUdcDzmOtBFlA
 9lx7Cj3fvrT+nEXldSKYtwrs+q82eXGnQc3MSvkE8mLrjX2ubauIc2Ikh
 i6/HHRsZRLcsXY1Lo0jliYslxjis3Cp1Z3+yu9FiRd/R9Yq+8Bg0780mr
 xnrH6iVHRPrL6V64Kgp5V//faRV3WOCXHv/j/MY5KKa4YEaAK4nPBpESQ
 ySSTzY79rg31LFpt/s6pTUbMSRZC6VHvCezbKW9xNGR5uuW/B77yPX20q
 G8BUBaOsABmqTLTXEHsBpAL7xVItwMvV65fjeu6rC2jMxyClhHGgVyikb w==;
X-CSE-ConnectionGUID: CGcaDup0Txu59qyvm6Tlwg==
X-CSE-MsgGUID: y2efRa1CRLellQf8r3eBEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92580388"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92580388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 22:45:57 -0700
X-CSE-ConnectionGUID: FiO5LtJ/S1a9ThOyAEm6ag==
X-CSE-MsgGUID: 6v9/V3w+Tc2Zb5xbRRKaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249858455"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 22:45:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 22:45:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 22:45:56 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 22:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/nd7v2sFFHieDpd/II6sUgf+4/Cvo9nGxTebJswgJGz7O0lcol+54GVE68iZuyudOasrYlA63aamiVc1JbBs6KwWbJhxkQXmUXqKAvbpO+my8ofTYnnadpdklJrp0DK7wEvCHqhmmc2a9/90LfXvRtI2wBui5wEwetP5kLds6tuiyEi3fRARSJ0SqQ8+BeK4RRW52XSNauDHQPw5qT/AetXQauYEew+PrT9aODXU/EHidCQd5S/D+/JJJa+AblbGm2dQb0CadDVmRnSzoLEzujID61MeEwNeoPtyyFBcE+zl7MWygS2CvByXpIuUT+28pKCbXZBdQ+aGhz9LkJ64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID1ZEt6BbeGUrChHWbLoURkaQN+jhwHLZo5fPq6N7Z4=;
 b=GBBsP5mYwMWpW5u6wC5DxLs1lU6aOLkG3L18xcA07x0Ree/rDjLNkMD2zBuxJs0YqX1X3zIjHXdjRfgb+FGkA8xgh1OT6ODJRcyXzknjqvCAaeb4drdoIss0z6qDXam1dGI1PZZ7DpWkg+Oz6qCj/YL+7vLY3Nq6SzyqLzSRZtPj+zlD4cRXhCPruHMhXIflSMhN2Jgtv78GK2QxW71e6mwPFMY6MtKkJBD3KdcQ/lYOgfFXIZvj6gca354/o7RM4lsU9mT7FmDGdrc1I+drReQWPna6jzOWCnn1w1vYmzf7cQzKGC5qheWuYVzJpe3uVoJiCTAymeMVePaQC5IZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 05:45:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 05:45:54 +0000
Message-ID: <9fab6a09-84b1-42f4-9db5-b34ba2c29275@intel.com>
Date: Fri, 5 Jun 2026 11:15:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2] tests/kms_chamelium_color_pipeline: Add plane
 color pipeline validation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260604123356.2573037-1-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260604123356.2573037-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: d26007b3-c7ea-4900-19a4-08dec2c5b484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|6133799003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9K+vSg9qis4OgAlA8GLbUOqnV5KlBlHlOcpdNnHm4iYaUrBbkwOKVkcP8sOi1Y+YhyLd7ewF83SH9ux3bdlpqcISnfTw8ulIGFj13DRyVJv38fbHdH0leWtphicKiCt3hnRx9BJ2H2L6UABo6ZKgnfAC4mk4zuqCvSXXIqUKo0NdpieF6fPGpP3IFIPqZqcziKrIljv9QS4lEmp5udpPFnvWtS/eWVTuZJhagFlQ6vg9N509nA3UBOJ/aYgILKCkMsEKblTuOTMyNgJHdXAu5AYWYKoB77XBV1q/ZFKZ0IhTDspq95v50q15L3ehq7Aodg3zqAYQFSvvcx2ydQTOd0H0wyRh7CY0HSKUISx72+JFnR45aZE3eCM9mZ3pvaXaDbu7GEl8jVjboAj/pj7b/9X0rLaWD3MenzLTvFaA6VzruiSdSHFgd1dcA6HYyOf5hvtpILCXzZGwBcTg3xLLKas3WcEACS5aY3TIwym88fz4Bki2WuQsfCsDoywf8Rw6ZD/GNFUCtl0RWnXeKXfcD1SBF/959ORbKhGVzutS086aBBLDgZHXz0OeNJQUueExWVIGgN9C6rZBlKe40LcIpS6WYb1HnD2EELWmc5HtH8bpHzSrZon+LnFS109Szgq+ebN9zzMCxFfhib4+jDljF1auFZJI5uGJhAEcN3ODOHBwd6105WHccy3TE6vcgPuI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME93M2RIcDgwbEtRNWEyTmtQYUhBNDQ5bTFwNStXZzRhS1ZwSlk2eGU2L2U1?=
 =?utf-8?B?aDVJbm9vNlhJT3pSOHl6UHdBbFViQUxRUVAvVnZ1TTl1WnI1YU10eDIxYXEy?=
 =?utf-8?B?dzJsOURMMnRnUHBWMzJ0M3JaSW9WL2hSZEJ2QmczMTlZV21ZUGlwSU9zbFd6?=
 =?utf-8?B?VmlhQUJmUkU0ekZVeld6SmxQc1JaRWpLaHRlZUZUZG5DUW5wZm83Q2NTSzA2?=
 =?utf-8?B?VGYyRVVxQUZScVRxNDJBMFpJV2pLd3dUYklHRHhYV3hUb1hCOWdFWEFpNCsr?=
 =?utf-8?B?VkR4QnFhOGJiSmZTZ3drSUNpQUtUQlZaS0kwUktUUEhCakRNSUNYOW51RzBD?=
 =?utf-8?B?WkpzWGZlc1IzZXpDZ0ZsVnNhVytXSUhybVY1M3llL09adzRHc3B6VjhKWW5v?=
 =?utf-8?B?S2lOQmx4ckJoS2F4cjVOUXNQMVZ6UnZNRHU2ajlkSWVNdkI4ZldHR1R1Z3Ri?=
 =?utf-8?B?QWhGcklNdVh0MCtqQ2YvcjdJY0M0aDVUL1M0STMxYU9HNHBjbC9tYVFXNE9v?=
 =?utf-8?B?OVpubHJOZENVeGVqSE0yOVNrZExkbUxpMldjNTZ1VEhabi8vZkNJUDJkUzgx?=
 =?utf-8?B?NEl4R1gyN256YUliL2RaTjA2aXdqdFJNejN4MmZINXR0Z3VBdlVZN0NHOHcy?=
 =?utf-8?B?Z0ExZGFLL0IwQS90M1ZIRFdJbkxSNkhmWmNNNVk2c2hpOFRCY0lTM2hlZm1v?=
 =?utf-8?B?RnRXOXdtSExCTkVvZTN5bjhZUHhSMlNpMnMzc2hxWXpIcWJOc2ZybVU4R3RJ?=
 =?utf-8?B?c21RdmtsOGNpd3dPYVE0cDkwelQ3d3JnTUs5SkJwSFZ1c2dWdkVLWW90L2tz?=
 =?utf-8?B?bUJDemNFTVBtMGxiQVpYRmQ0RVpSeDMrNzl2RmxRUVJNcXlQMWhtZzQ5MWU3?=
 =?utf-8?B?UERSTHl6VXNDQUZhZ2xyQlRPVGxvc1B1ZDQxejBydG5YeGpGTUZkSEg3cjU1?=
 =?utf-8?B?Q0E3OWlyWWVFRWVGazBYajRSVTNqM3RaZEMvblA2SHhjWG5PK25Gbi8yWnhH?=
 =?utf-8?B?ekJheXBDQ2UvemUyTm5MeDRCTWZLVDZQcG9UV2VSYkZsK0d1MURyTTZFQzNn?=
 =?utf-8?B?dXdPL3dha3I5anllaVVqODM2UmxwT3lKemxkenRIblJOUHdzejlvSU5rejF3?=
 =?utf-8?B?NVBQdDdKb2tOMVBwZERWbGIvNUZmR3dlcW1XRXpWY0RSOFJ6c3lVdWtrcURo?=
 =?utf-8?B?dk43emxxRzZmQ3RqOExEMWQraTB6ZHRuMG4wd3BvTUdUTlhSQU1rWGNKSHhV?=
 =?utf-8?B?aHJ6V0FQdG9GV0svMzN1T2xCU0JEZUNVSnNvZExjMWNZM3c2RVVjQzlBUkhQ?=
 =?utf-8?B?NE9tMStkVVJLbjZGV1FnUytvZHJzZVdmN3dCZE5YaWNsNWhtY1JLbWIrTWVi?=
 =?utf-8?B?R1B6TWd0bDIyZ09NTnBJYXVxTTFKalo3Y3A2VzZVbVVzRlJpWFB2T29PVDZM?=
 =?utf-8?B?cC9pQ0J4eWVqUmt3NmtZYytwcWU1ZzRKeU9zdFNWMWdhd2QxQUROejlDYlJL?=
 =?utf-8?B?MEFYU25velhGeTl6SGFrYUNGQTA0YU1ma09LMXZFQ1EyNUR0eFAzUU1XSk5l?=
 =?utf-8?B?akdlaTdCRVF5TndkN01KcVRPaHNTNDdtVHJSY1paWU9oajVRWHJSMC95OFdu?=
 =?utf-8?B?blZsUmxDcktMTHhUcEZhYzFRTnZBenBnZWlUb2FUSUU0LzQyOWlBWWE2TFR3?=
 =?utf-8?B?ZTNrTHBEY0k5NldOcUlEc3JYWHlFYkJHcVlVbE1BYnBwQlhoZ3VJTGVVb0NO?=
 =?utf-8?B?bFlSNFYvNnZWVE82WVRYcnFOdk5oTisrUm44WXZJR2tDaEh2ZHQ2a2RJMUty?=
 =?utf-8?B?MCtablYxK3dCYXNUOFQ0UDhIeVlOQkFvaDVTREtVbk5LeGN1SnZ4OW53ek5K?=
 =?utf-8?B?blVFSFUrT04rUW14WWtyNXRIWVdmYXpHTmNqbTRJSzhJUHBOTTVTMWFENTFm?=
 =?utf-8?B?enNRUXp0L3liaDd6NG1uc3BJMGxUWjBwVmFBUFNGb2dySlFVM245Ui9Pb2w4?=
 =?utf-8?B?dnpGZUNjZFFtTkJkczg2ZXFaL1lVdmRZd25Pa1UxYWhsTm5nU0kvTXFpbjAw?=
 =?utf-8?B?S2FjOWdlM3pxUk1mWDlhY1R6V3JuZUFKRWNvMzNHU3hrMi9xRVF2K2dqNjZa?=
 =?utf-8?B?RjI0c2luN3k4THRvM2VYQjVha2s3Qm5vU0tzWk9OOEkyeXBWNWREdDN2aSsz?=
 =?utf-8?B?aXZVUStEdVlPTzlkNXJSa2c4T2VvVTFlM2lwYk9pK1pvaU9nYSs5eEoweHdp?=
 =?utf-8?B?K0pOUkhpTW1JMU93Y2R6bjFiOUh0TkZCcWNCZWpUM2N3aTAxeXZzWWpoQ3dB?=
 =?utf-8?B?VXJHZWs4VDNLbDhHUFN3aUpzT1FRcFNPOTBIWUVZc25zMjRnVWRPTWRQSmlC?=
 =?utf-8?Q?Ngluw+aU1wOqqwXc=3D?=
X-Exchange-RoutingPolicyChecked: HxSQ/c4ve1TNKVoC6LvIJxn6N5yfM7r9IY4dakOZV44x7EEhba784bxsFiPXL2j+5d+/CI8VWidS2r7IP58TY7IvwYGx9kRiM9CZ0zLfE52e2QXQkPO9z0j6LPwLs+SGoaueRbKtyk+IhnLx37a42ObZAci45/oxqvz8Hh8c1PBWYF18/hGyb+353vVi3VK/DNYKZkRylL+JFeWKMKMhrvqFvR1pllpFbSdV1uc6lWHDtS5ikDXJ0QPmxTl2/kZI6N/XJdgTfX9UM/U//t3xl9HmAFwU/Q2M7/guQ5A09nzAg6b+Ep+vNZEcdr40QKnEBldj5AS7uYr39W6PcOVEfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d26007b3-c7ea-4900-19a4-08dec2c5b484
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 05:45:53.6502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOJ6vtPUuZfBbe6HquYDxPBPgamBrsx1scFVTaGpGoCMQzdSN57mQAvuUHia6iAdJ7oTeVUBs2SRsM87U6Ncrakg16PnTpOHr/pA87E9LTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
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



On 6/4/2026 6:03 PM, Swati Sharma wrote:
> Add a Chamelium-backed test to validate DRM plane colorops
> using frame capture instead of pipe CRC comparison.
> 
> The test generates a software reference framebuffer by
> applying the expected color transformation in bypass mode.
> It then enables the plane color pipeline in hardware,
> renders the input framebuffer, and captures the output
> signal using Chamelium.
> 
> The test passes if the captured frame matches the
> software reference framebuffer within the allowed tolerance.
> 
> The test fails if the captured frame differs from the
> reference, indicating incorrect color transformation,
> pipeline misconfiguration, or hardware output mismatch.
> 
> v2:
>   - Fix build error: pipe_output_combo_valid() -> crtc_output_combo_valid()
>   - Fix memory leak: add chamelium_destroy_frame_dump(frame) after use
>   - Replace igt_require(port_idx >= 0) with continue to avoid skipping
>     all crtc/output combos; add test_cleanup() before continue
>   - Fix misleading indentation in test_setup() port matching loop
>   - Remove unused data->primary assignment (planes iterated separately)
>   - Remove unnecessary data.display.is_atomic assignment
>     (igt_display_require() reinitializes it)
>   - Add igt_require(has_plane_color_pipeline) for early fail-fast
>   - Disable automatic FSM handling (igt_chamelium_allow_fsm_handling = false)
>   - Prefer HDMI over DP in test_setup() to avoid DP FSM failures
>     during chamelium capture; add chamelium_port_wait_video_input_stable()
>     before capture
>   - Fix test description
> 
> Co-developed-by: Claude Opus 4.6

Kernel seems to use "Assisted-by". What is the convention in IGT?

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../chamelium/kms_chamelium_color_pipeline.c  | 415 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 417 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_color_pipeline.c
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> new file mode 100644
> index 000000000..b2defa6c4
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium color pipeline
> + * Category: Display
> + * Description: Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC
> + * Driver requirement: i915, xe
> + * Mega feature: Color Management
> + */
> +
> +#include "kms_chamelium_helper.h"
> +#include "kms_color_helper.h"
> +#include "kms_colorop_helper.h"
> +
> +#define MAX_COLOROPS	5
> +
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:			1D LUT
> + * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
> + * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
> + * @ctm3x4:			3X4 CTM
> + * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:		1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
> + * @lut3d-green-only:		3D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
> +
> +static void test_cleanup(data_t *data)
> +{
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static int test_setup(data_t *data, igt_crtc_t *crtc)
> +{
> +	int i;
> +
> +	igt_require(crtc);
> +	igt_require(crtc->n_planes > 0);
> +
> +	igt_output_set_crtc(data->output, crtc);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_require(data->mode);
> +
> +	/* Disable pipe color props. */
> +	disable_ctm(crtc);
> +	disable_degamma(crtc);
> +	disable_gamma(crtc);
> +
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/*
> +	 * Prefer HDMI over DP to avoid DP FSM issues
> +	 * during chamelium capture.
> +	 */
> +	for (i = 0; i < data->port_count; i++) {
> +		if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +		     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +		    !strcmp(data->output->name,
> +			    chamelium_port_get_name(data->ports[i])))
> +			return i;
> +	}
> +
> +	/* Fall back to any matching port */
> +	for (i = 0; i < data->port_count; i++) {
> +		if (!strcmp(data->output->name,
> +			    chamelium_port_get_name(data->ports[i])))
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	if (!colorops[0])
> +		return false;
> +
> +	for (i = 0; colorops[i]; i++) {
> +		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void _test_plane_colorops(data_t *data,
> +				 igt_plane_t *plane,
> +				 const color_t *fb_colors,
> +				 const color_t *exp_colors,
> +				 kms_colorop_t *colorops[],
> +				 struct chamelium_port *port)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	struct igt_fb fb, fbref;
> +	struct chamelium_frame_dump *frame;
> +	bool ret;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	/* Create HW framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fb));
> +
> +	/* Create reference framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fbref));
> +
> +	/* ---- Software reference ---- */
> +	set_color_pipeline_bypass(plane);

As pointed out previously, it is a no-op so you can just drop it.

> +	paint_rectangles(data, mode, exp_colors, &fbref);
> +
> +	/* ---- Hardware path ---- */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	if (ctm_colorop_only(colorops))
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_port_wait_video_input_stable(data->chamelium, port, 5);
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +
> +	frame = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium,
> +					    port,
> +					    frame,
> +					    &fbref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +
> +	igt_assert(ret);
> +
> +	chamelium_destroy_frame_dump(frame);
> +
> +	/* Cleanup */
> +	set_color_pipeline_bypass(plane);
> +	reset_colorops(colorops);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_remove_fb(data->drm_fd, &fbref);
> +}
> +
> +static void
> +test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> +		    const color_t *fb_colors,
> +		    const color_t *exp_colors,
> +		    kms_colorop_t *colorops[],
> +		    int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     exp_colors, colorops,
> +					     data->ports[port_idx]);
> +	}
> +}
> +
> +static void
> +run_tests_for_plane(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +	int port_idx = 0;
> +	static const color_t colors_rgb[] = {
> +	        { 1.0, 0.0, 0.0 },
> +	        { 0.0, 1.0, 0.0 },
> +	        { 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_to_blue[] = {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_and_green[] = {
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 }
> +	};
> +	static const color_t colors_only_green[] = {
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 }
> +	};
> +	const igt_matrix_3x4_t ctm_red_to_blue = { {
> +		0.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		1.0, 0.0, 1.0, 0.0,
> +	} };
> +	const igt_matrix_3x4_t ctm_linear = { {
> +		1.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		0.0, 0.0, 1.0, 0.0,
> +	} };
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "Pre/Post CSC GAMMA (linear LUT)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t lut1d_max = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.lut1d = &igt_1dlut_max,
> +		.name = "Pre/Post CSC GAMMA (max LUT)",
> +		.transform = &igt_color_max,
> +	};
> +	kms_colorop_t lut3d = {
> +		.type = KMS_COLOROP_LUT3D,
> +		.lut3d = &igt_3dlut_17_green_only,
> +		.lut3d_info = {
> +			.size = 17,
> +			.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +		},
> +		.name = "3dlut passing only green channel (RGB order)",
> +		.transform = NULL,
> +	};
> +	kms_colorop_t ctm_3x4 = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (red to blue)",
> +		.matrix_3x4 = &ctm_red_to_blue,
> +	};
> +	kms_colorop_t ctm_3x4_linear = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (linear)",
> +		.matrix_3x4 = &ctm_linear,
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		const color_t *exp_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} plane_colorops_tests[] = {
> +		{ .name = "lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-pre-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
> +		},
> +		{ .name = "lut1d-post-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +		},
> +		{ .name = "ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut3d-green-only",
> +		  .fb_colors = colors_red_and_green,
> +		  .exp_colors = colors_only_green,
> +		  .colorops = { &lut3d, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				port_idx = test_setup(data, crtc);
> +				if (port_idx < 0) {
> +					test_cleanup(data);
> +					continue;
> +				}
> +
> +				data->color_depth = 8;
> +				data->drm_format = DRM_FORMAT_XRGB8888;

Never used?

> +
> +				test_plane_colorops(data, crtc,
> +						    plane_colorops_tests[i].fb_colors,
> +						    plane_colorops_tests[i].exp_colors,
> +						    plane_colorops_tests[i].colorops,
> +						    port_idx);
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int i;
> +	int has_plane_color_pipeline = 0;
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
> +
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
> +		igt_require(data.display.is_atomic);
> +		igt_require(has_plane_color_pipeline);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* Chamelium init */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +
> +		/*
> +		 * The behavior differs based on the availability of port mappings:
> +		 * - When using port mappings (chamelium_read_port_mappings),
> +		 *   ports are not plugged
> +		 * - During autodiscovery, all ports are plugged at the end.
> +		 *
> +		 * This quick workaround (unplug, plug, and re-probe the connectors)
> +		 * prevents any ports from being unintentionally skipped in test_setup.
> +		 */
> +		for (i = 0; i < data.port_count; i++) {
> +			chamelium_unplug(data.chamelium, data.ports[i]);
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +			chamelium_wait_for_conn_status_change(&data.display,
> +							      data.chamelium,
> +							      data.ports[i],
> +							      DRM_MODE_CONNECTED);
> +			igt_assert_f(chamelium_reprobe_connector(&data.display,
> +								 data.chamelium,
> +								 data.ports[i]) == DRM_MODE_CONNECTED,
> +								 "Output not connected\n");
> +		}
> +	}
> +
> +	igt_subtest_group()
> +		run_tests_for_plane(&data);
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 811a36748..dceb5ff62 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ endif
>   chamelium_progs = [
>   	'kms_chamelium_audio',
>   	'kms_chamelium_color',
> +	'kms_chamelium_color_pipeline',
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> @@ -395,6 +396,7 @@ extra_sources = {
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_color_pipeline': [ 'kms_color_helper.c', 'kms_colorop_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],

