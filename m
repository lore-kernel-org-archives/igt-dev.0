Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C5BC4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 17:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CB210E391;
	Tue, 21 Jul 2026 17:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSECmUsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A917310E35C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784654779; x=1816190779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6WugSn8WmYsE++XiDNlCqkuBj3Z7sRsaGqnVCCBzZzs=;
 b=fSECmUsE6kpTHwAbK4E56tZda5uZGJ44sYcp6teO9svv6AWsKs7PvZ9k
 VPfx2OrfSbk7+8AP076PgAnBESSDgg/wptCoRW4RC7YWbP+pBl5lNw8Xt
 SCkO5qu7ZLjqHQoP80+U5gFPm7PKGR/KhPraGe+rEbmMUWxzHeE34MKBC
 LwktAFxJCwb92FeTY2aj9dqpuCIm8YRir27mgPgg54X93fUNaHXr4XMOt
 BGzQrNkDFtxp/BoR8KmvAfzzF1p+1iwAtAz49QhRt+hD965pdABrhibKG
 T1rdC2s7QuR1zo1kkyhCeKFBgwQ4ndVYWlPSjwtzF8aGDi4TcK32DmVJs A==;
X-CSE-ConnectionGUID: UimlTJp+QPeLVN3DEjDxjg==
X-CSE-MsgGUID: V0iei31pTJOWlhiYrSK3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96781023"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="96781023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:26:18 -0700
X-CSE-ConnectionGUID: Zlj5+QCNQSO2xqDvu5kHqw==
X-CSE-MsgGUID: pAXf3DrGTcCqaXn1dd8TGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258483003"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:26:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:26:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 10:26:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI7rRhgEYaD9jaM7j2Im5Cd/Fw9JTcJwDdQppcMeLSqiHpsF5AIKLTcjc67XmUDtDPSAO4j13w6FiRkjiAvDq04IbK4qS903uiCrBIMilbJg9Z82Op+WLDidIwRddsdQMNtEbORl0AnfYqtSXU84dGLBbmBDu6WOAQxcB/P3/AZBgTERyCR5IqsUtnNxjDNlZTqQvVf1y774AE8s643zw1CA2cdTR+CbnRJJ0wzdMkNzYAGDdk5nLEPmPnfy1bRw45hLUX94zV2AK0Z47oR6cDXAyZ3rzYqw2Tk9xOxkGZLTzGacNm256eGjsLq6jXx96AbJ+mhgNtI5615duUlj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBNIejy9aLUQ+kzOcW+JrFlEfabGIaHE69mNqD5mhm0=;
 b=qR11NqJg5ZcC7TLvf0bW93QgM2HRRslsIGlThYxsTi8JF5O4X3zK1x0H6cxZGiC4uDrxizJpHahQC0Iponkc3j3LLzex0jsP1Dx26i3zvWwU9R5hUpNZIZrgM61biKhjQNiANrmU+xBNpYylvqaKsgrCVjLj3i7iMxFAtgjMmrMH4JevwRQ4fLyoPs5sNnsMSZ7/U5aLLTrl8Q5GQLyv0rXcgI6RPH1SbHRU6ZQbzOvOTqf2gikKufl+QOYTIt8t2cxxwYIFP0r32zc216xGkRfZ/2BijWZmulCa4+svEv/+K//LW2mbV0+4OQNu4EWmMCfPS3We9fEEO/fC1V1DMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 17:26:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 17:26:13 +0000
Date: Tue, 21 Jul 2026 10:26:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] tests/intel/xe_oa: Cleanup blocking and polling tests
Message-ID: <al+rsvm8Kx+un3Az@soc-5CG1426VCC.clients.intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
 <20260717210027.2008255-10-umesh.nerlige.ramappa@intel.com>
 <87ecgxxtc4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecgxxtc4.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: da0269ba-7c63-457b-c34c-08dee74d2968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 4RhW0ORbKBELoXTaqqxW8/rXZ5Ih66M3mXVX3TsnNdr9BlhyUx4kEYxpXjQDcusGNga7sm+/hXX/EvoTTkuRBNlILoE6io3LFNKExDRW28+C8d3ZGRi6AbipzP7+ePaYNmSIGKTLtziNZmcJUBpDm2FhiSULQ8/gpZ37mP9Runfcv6bIXgm0ARi8yuYhjJjuAEu7x/n0OoDQm4CEsJMMwYameXZB8k6E7wmae4OAj1UvAahYgEmrhwzQRUHqnhoIX6KRJg0Dz16apgJflmqNp7rtqfhU536Nuv0jVR227W98qbtVpWgOJdy+UZDpPyAqPHRwk7ybSJuEsy7RpeyhEzpjoZQHphqNtlnkPpP4N2pD5SH7amMUg+S/KK90aUYf7Z7NfWJDA/keUs6CfFvcvLG4syB4nkqgEdQghh6ZZvg6j2j6vGvwR2Ok6K9T5nhyqy5exqTaTgPQ9tXAuMuT4z7ZBnP1Vpt3vE9WyToqPmsgHEUDIOhBIrCB+F+baYBqYZfIk3IpROi+gRCeLHGkyq7rUUcUYqms/f6RToqyfmBQKyLAMC0BMWrgneAxE9MVBVnYS+oY4xVEK/ushfvynIHxpkar7+e+XX/obLjQrRytRfoCp7s5HIfwyb47DYZUxCWum97F78w8+Gv+PefuGcqU8ec0NwA27edQeJfh7yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bERQcDFtd2FtUFRNNERmd1hHeVpZaSttVlVJTUhlak5WQVRkZElrcjY0UzU1?=
 =?utf-8?B?UTN6eWZUV2lnL1VzbHY4MGdkSTd5MHJRdWRCSlk0dE8zZGtPN2tWQ1JEdjdr?=
 =?utf-8?B?cGQ4T1V6MlMySXhYUDZQcEZjVXBkYk42UzVRTUtDcTdhMUtVdklqcmhwNXFB?=
 =?utf-8?B?Q3ZiVVBjNTZ4aUN5U3d6clJsa3NEWVNmNElvTEFlUzlzRkJKbWRJTTluRFpM?=
 =?utf-8?B?V3I4ZnYyZkpNZlltbEdOQzQxNU1NQTZYZHQ0dUVQWU5vbHI1TEFKNnBzKzFl?=
 =?utf-8?B?L0dNOFJBYVdFeXRIOG16dHBQczFzTi9oY3N4emMzVGg2MSsyNkVKQnlxbHpp?=
 =?utf-8?B?bVlGZ29CYXRzZW01OGNLekZuRVh6Q1k3Y1pXYzBuUFVwQ2NFN29JRURsZTBk?=
 =?utf-8?B?YzBTY2NUWnFFT2xYREJqV3VmMHNzWEpoemt1Y25Ra2w0YU9obXF4d2ZuS2dB?=
 =?utf-8?B?blBxQWFFaFlFTXNocTRWQm1ZNUt4Qjh5dEZmYjM2bjhHU0tsTVdSMS9mdjRv?=
 =?utf-8?B?TG9FVDR6cTZXczRPcG9CazQ4YXFRb0xyZE9tK1Nnb3dxUldGeDNYVmJ1a3JQ?=
 =?utf-8?B?S1V3ejA4QjdLUmdzQm5jNDdZaG1DYlQrNjNUTFpqSFlPNTNJeTg1K0x0aSt3?=
 =?utf-8?B?TjdGbWVJdzg4Z2hpYkY0eGR0cWhIWTVKQU9LTTQvNnR1RHcvRGpnVlNwZFNG?=
 =?utf-8?B?UitIL3FibmFoWkR4MDRMVk9JUVRSbDhjVURyb1NVWjF3TkxtWnE5WWdMUk1H?=
 =?utf-8?B?NDdESERDQmxJcXpVWlhhemNZVnpXNzI1aTQwM21WMUtVNFhEWjdQUnJTbmR3?=
 =?utf-8?B?TEhudkxxbG5mWDQ1Z3phQlUraU8yb24yNEdtOU5xQy81ZnMxVm1nbXlzVEJY?=
 =?utf-8?B?SVNqcSticDZhK2N2NDl2U1lCTnhGWEdnTFRWYXJnY2JkcGRxRnpuYjRGNTR3?=
 =?utf-8?B?d3VMNXAxTkdnWFd6cEVHSXdOSFNLMTNoNVlxYmZoNFR4eHEyaS9xZmxvemFk?=
 =?utf-8?B?ZHI1d1RmVjdDTi9BL2ZoWWlObFF0aVltVENaRlNDZ1VPV2xLdVVoQ0NISXhC?=
 =?utf-8?B?RDdMK1hrbURSR0RjNXpZRW1vTGRJS1hVNGp1dzFwQ1NMWUJsMG5pbGZKQzhB?=
 =?utf-8?B?SW56ZkUxcEpEbFBNR3VGbGxRK2J3bGhJeUZaL2pvMEEvamFBL2o0OWtQSC85?=
 =?utf-8?B?N25obDF4OXBTM0UxQ2RQT3RBdE1IZlpMQnpKUkp0WFV5SStmYkVyMWlqTXJT?=
 =?utf-8?B?dHc4MEo2MitZNDF1bkJiSmw2b3FTREFaM09aYThRZUh4dDJQT1IzcnBjd2xQ?=
 =?utf-8?B?U1RVRkdGZC9SZmVVaW5BMWtiSTFkOWhGbUtpYk4xcUtQM3g4Z0VINUN4Qzlv?=
 =?utf-8?B?am94a1BhUVEwZWQvRXpCeWtWeVBhVlA2aXpzampJRmFsYXBJcjdXT3F4Zngy?=
 =?utf-8?B?eDBJbWh5bmd6MEgzOTBlL2RjQjZXQ2lXYTRWMUY4TlBIY1FVZzV0bk95QUFO?=
 =?utf-8?B?SVNsdktMMHArbWpZYW9YM1BiQzBSS1Uyazd3cmVzUUh0YmVNTWEzM2tkUUgy?=
 =?utf-8?B?d1QwK0c1M1VJQzNrQ0xtYkVRSHltZm9RNGZBTEF4anBaNmVodmFheVB5RW1B?=
 =?utf-8?B?WDlyZkJQb2tLWVU0WE1NYmFweXRSQWJta0g1QnNscmpzUjRXaUN4VTEzMzZy?=
 =?utf-8?B?Zi9HR3Z2Z1NCbFpwWjk0TE1CaWgzVVdwV0g3RTRoYnVhZzJvTjZlK0lLQnZp?=
 =?utf-8?B?MEdWRlVEaWtBaDhmM3BqeHEzTU9icm13L0RuaFpMK1N4bXFHcWxEZmptb0FV?=
 =?utf-8?B?bVlrUWJFcWxKRUNLMUx0S0d6TGdDenBLc2N5K0VueG4zc3FTdGh3eGJXZklq?=
 =?utf-8?B?ZDJiWUtUNUdRUmdtMlVOUnVBeENTSDhFZ3IrMThpbm50Yis1N0hpWnlSUmI0?=
 =?utf-8?B?V2NUWWVqSW5wTHN4eU55S1FZZDVkSFVUcmt4dEdiNnBIak1HdzY3VWhZeEF0?=
 =?utf-8?B?dEExMnowTklRQVFzTWhodGVtbzRxUWVxdmo5ZWJ6UHJqSXdpSG9CSzluSklK?=
 =?utf-8?B?aW5IR1dwcWpvWnVTSitTZjZ2Ri9HOWFLcTFXMVBSNXlRY1NMczlPeXlucFA5?=
 =?utf-8?B?NEJVazlVT1RwaXJsTWJPeXFBc3NMU0hQSkhEV21leFF0NzZmRWtVaUQ2KzZz?=
 =?utf-8?B?T3RYcmVRRjFMYjFQL0l4d2RVS2dsYzJMeXVHMzZOSFg5SUtJa3dPSncwbVNT?=
 =?utf-8?B?bEdEWnpWK3FsYU16a252M3pWNkV4VEtLMUZkOW9XbkFuY1FNQ2RtNmlTU0Zv?=
 =?utf-8?B?SVlFSDJDWnFCeHNwSFhJQWFCRWloclRDc1IzWmZTRUdUZ0Z1a0hMWkJSVTQz?=
 =?utf-8?Q?8kQGX8d6UR47VZtQ=3D?=
X-Exchange-RoutingPolicyChecked: Y1S4pq9zuxO6wEMquce2FJckhGKKxydRB73F/pMUE4DCBcnBXDEsT2gxbEgVX+MHw7g/AgLiRMNDKwOL7BYttJaPF2nX6sORk/k1f8QNP6uT4impdK53EOQ47cw818HUdB74q6Rza70RTI8Vl6Z9I9GcSsLxRamI6BvI+N/pimn4oxqQoUtzM2gS9GCgOTFf3138RUMNmmRidesucw9vgcSGVy1s7U6j5iu9eDxPdW27RD93cq5u9mT/IcfTrgMrFF+l1igtttSGrc5tlPY1DNdCWZZk74SF4S6agzT/t7o9otfYtCO6RpB12QCOLRrA34ZtUAFYpyEfOThkU+E5PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da0269ba-7c63-457b-c34c-08dee74d2968
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:26:12.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUMGwgWL1Ggt4Vm2omN4iYbsAOE9dtNdcrXTYpo9buMxXRAvQulyEoToSccosmWjmL/2XJMF0JvI/rlb9Ft/Us+sAm3RiC3mPeMjvxHe9Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
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

On Mon, Jul 20, 2026 at 02:08:11PM -0700, Dixit, Ashutosh wrote:
>On Fri, 17 Jul 2026 14:00:32 -0700, Umesh Nerlige Ramappa wrote:
>>
>> 1) Drop set_kernel_timer since we don't support it anymore.
>> 2) When running all tests, a failure in blocking/polling tests breaks
>>    all subsequent tests. Move __perf_close before the asserts.
>
>Hmm, this should, in the future, be handled by having some sort of an
>exit/assert handler, which will close the stream in the event of an
>assert. Yeah this is annoying.

I think this issue only affects the blocking/polling test since they use 
a local perf_fd to open the stream. stream_fd is closed inside perf_open 
for each new test, so other tests using stream_fd can assert before 
closing the stream.

>
>> 3) We cannot guarantee latency when reading OA reports as there are no
>>    guarantees how long it takes for reports to land in memory w.r.t
>>    any running workloads. Since OA reports are mostly used for
>>    post-processing, drop the latency checks in these tests.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 153 +++++---------------------------------------
>>  1 file changed, 17 insertions(+), 136 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 4f652b187bae..9ebb18690ec7 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2127,8 +2127,6 @@ get_time(void)
>>   * kernelspace.
>>   */
>>  static void test_blocking(uint64_t requested_oa_period,
>> -			  bool set_kernel_hrtimer,
>> -			  uint64_t kernel_hrtimer,
>>			  const struct drm_xe_oa_unit *oau)
>>  {
>>	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
>> @@ -2142,24 +2140,9 @@ static void test_blocking(uint64_t requested_oa_period,
>>	int64_t user_ns, kernel_ns;
>>	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
>>	int64_t test_duration_ns = tick_ns * 100;
>> -	int max_iterations = (test_duration_ns / oa_period) + 2;
>> -	int n_extra_iterations = 0;
>>	int perf_fd;
>> -
>> -	/* It's a bit tricky to put a lower limit here, but we expect a
>> -	 * relatively low latency for seeing reports, while we don't currently
>> -	 * give any control over this in the api.
>> -	 *
>> -	 * We assume a maximum latency of 6 millisecond to deliver a POLLIN and
>> -	 * read() after a new sample is written (46ms per iteration) considering
>> -	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
>> -	 * to check for data and giving some time to read().
>> -	 */
>> -	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
>>	int64_t start, end;
>> -	int n = 0;
>>	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>> -	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>>
>>	ADD_PROPS(props, idx, SAMPLE_OA, true);
>>	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
>> @@ -2174,13 +2157,8 @@ static void test_blocking(uint64_t requested_oa_period,
>>	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>          set_fd_flags(perf_fd, O_CLOEXEC);
>>
>> -	times(&start_times);
>> -
>> -	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d,"
>> -		  " estimated max iter. = %d, oa_period = %s\n",
>> -		  (int)tick_ns, test_duration_ns,
>> -		  min_iterations, max_iterations,
>> -		  pretty_print_oa_period(oa_period));
>> +	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, oa_period = %s\n",
>> +		  (int)tick_ns, test_duration_ns, pretty_print_oa_period(oa_period));
>>
>>	/* In the loop we perform blocking polls while the HW is sampling at
>>	 * ~25Hz, with the expectation that we spend most of our time blocked
>> @@ -2204,44 +2182,26 @@ static void test_blocking(uint64_t requested_oa_period,
>>	 * the error delta.
>>	 */
>>	start = get_time();
>> +	times(&start_times);
>>	do_ioctl(perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> -	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
>> -		bool timer_report_read = false;
>> -		bool non_timer_report_read = false;
>> +	while (((end = get_time()) - start) < test_duration_ns) {
>>		int ret;
>>
>>		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
>>		       (errno == EINTR || errno == EIO))
>>			;
>>		igt_assert_lt(0, ret);
>> -
>> -		for (int offset = 0; offset < ret; offset += format_size) {
>> -			uint32_t *report = (void *)(buf + offset);
>> -
>> -			if (oa_report_is_periodic(report))
>> -				timer_report_read = true;
>> -			else
>> -				non_timer_report_read = true;
>> -		}
>> -
>> -		if (non_timer_report_read && !timer_report_read)
>> -			n_extra_iterations++;
>> -
>> -		n++;
>>	}
>> -
>>	times(&end_times);
>>
>> +	__perf_close(perf_fd);
>> +
>>	/* Using nanosecond units is fairly silly here, given the tick in-
>>	 * precision - ah well, it's consistent with the get_time() units.
>>	 */
>>	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
>>	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
>>
>> -	igt_debug("%d blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
>> -		  n, NSEC_PER_SEC / oa_period, max_iterations);
>> -	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
>> -		  n_extra_iterations);
>>	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
>>		  user_ns, (int)tick_ns,
>>		  (int)start_times.tms_utime, (int)end_times.tms_utime);
>> @@ -2249,20 +2209,7 @@ static void test_blocking(uint64_t requested_oa_period,
>>		  kernel_ns, (int)tick_ns,
>>		  (int)start_times.tms_stime, (int)end_times.tms_stime);
>>
>> -	/* With completely broken blocking (but also not returning an error) we
>> -	 * could end up with an open loop,
>> -	 */
>> -	igt_assert_lte(n, (max_iterations + n_extra_iterations));
>> -
>> -	/* Make sure the driver is reporting new samples with a reasonably
>> -	 * low latency...
>> -	 */
>> -	igt_assert_lt((min_iterations + n_extra_iterations), n);
>> -
>> -	if (!set_kernel_hrtimer)
>> -		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>> -
>> -	__perf_close(perf_fd);
>> +	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>
>This check (and the identical check in the polling test) is also sort of
>arbitrary. Should we remove even this? Anyway, it's ok to leave if it is
>passing everywhere. Therefore lgtm:

I wanted to leave it since it still checks that CPU is minimally used in 
these cases. Good to catch any regressions in OA implementation if we do 
something CPU heavy.

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
