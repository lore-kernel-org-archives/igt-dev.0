Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315BBC5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 19:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C909110EEC4;
	Wed, 19 Aug 2026 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkYLQZpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058EA10E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787168272; x=1818704272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=D/lkqj+UclGHcYI7q3MAfC3dpIn30/yBY0GGEmxggo0=;
 b=UkYLQZpytmlpqlJH//OaD8eCUTg1hUkAKL57LJNhqEzrOqeUs0nyC27O
 zKDG1EHch3gskYOaPK/YzHlB/BQ88PHuJtTs73S4M9B1Oh4b0BgH/1S4I
 ACYp0du8T7Uf78SOiZTtYjoLqzXodqCnHNqlO8ipHn5PK4ru3yObqg+Jx
 MRwqptYvjggWXmOxI+EXN4BCYnHmp+RfNrfPjT+BlRYPh1x2SneoeZvuM
 WKJobqgmnvW8iaBey8Cu23I6OxrKER7mZjHOJSgOGUqzXqVO3guQ/NtDT
 MF5AJiIwhc8k1iPEwzy48x7/iP4XNKNBX9q7HX/3i2m7tgUm2pjsUp3kx g==;
X-CSE-ConnectionGUID: ZikHyJdkSamgiOLGafHhpQ==
X-CSE-MsgGUID: O2EEcS1XQCW9I957wWYS6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87814637"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208,217";a="87814637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:37:51 -0700
X-CSE-ConnectionGUID: ZtGZgxF0RRyXn7sr4RvZzQ==
X-CSE-MsgGUID: GZuc7v8MSu6tJo5W4+QoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
 d="scan'208,217";a="269501298"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:37:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:37:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 12:37:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:37:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD8bfxzXTQzPd4Fm2cChLfBPnhgdr6wDSvLbAF5LbnPUQdgyijF2mGG2XH3jypvhWsEy2j84akXDZVHwevICiUkXKIAWsE6NBLe5tPnWnKi8VGRx+2VBydr6AMcGrDYPlcQZ0PMH0OQxTcVgxkYkK8KrDXzAwue9WPeG3InZcatpWJPJ9BIRjrXq5k8jQgVvrVvnt44jvvvfLm3GtUOTCLM9zlU/QiYefJEgUIXh2RyZBEqjgH0gEXqXxt8I4K57Z2Bk3vrgFe9HROAKqdR1kbc79fmFcyU3c+aQ6hE03mQHj42MPHIu3WSJhaAAKjtZhpfBbUFFE76FqSfEWF2g5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y5cuHDwFHbGY7/Xw0Jbew5WF3fr0I8mey99goYNJ5o=;
 b=ukXRJsLodAixyS7bFSEATsDr5R7zC5EYCGqS4vbaGf8LVq6qY1IIIxVMwK4YZFsCrG11IGBRn03AVruCJ0BiZZg1Ch60lLUFPm1pllUK571Zr1xHOacD3A8WUoWfst5SztHj7ds2NLTkW7eExb9eF4FI+ph7EWD6ywPYw1RKXPFFsXpyzewM7MmFBk97ZdEtfHca7CepVzHug7gOf8M3uwsSIGdAmPVmz7Xa5Xt8S+P3kTO6N8iQiUif3tKd8yksffcLtda48e0dPaonT9mk0d8JCNlXLXc/et1kAKcWs5lEi50YwoZcYrby2V7bLWa2FqIqicYp1RAixxzIE1MsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by LVUPR11MB9589.namprd11.prod.outlook.com (2603:10b6:408:3a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:37:46 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:37:46 +0000
Content-Type: multipart/alternative;
 boundary="------------hrGf0XxaeTLzEmIWVWmSLb6e"
Message-ID: <f9a31c9b-89d1-401d-8169-8a7e52236ae0@intel.com>
Date: Wed, 19 Aug 2026 12:37:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_exec_mix_modes: Add multi-queue LR spinner
 switch subtest
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260817200029.16006-1-jagmeet.randhawa@intel.com>
 <aoUL-8TzCIdTWFn0@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <aoUL-8TzCIdTWFn0@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|LVUPR11MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: c2333841-179b-4ae2-9e2a-08defe295858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aMJ6ECFGdrd5yQJPSgptZm8U4mjFI+5vdZdVrgIiSQXAHjJS+cy71m6V/zC/7ypaKG7ABt2M0paryoRUufZs0sC8xyUhLekNUAtmnWdH/CiqBhjJU6h+vWrmZ/aIl8Ej/TZ/AWB3Q9A9vHNIdg0bg0Zlgbx2FT+OujSOXjdRc3tR2ZqABEzwt6A5hPtQ4bodpOGdZnmUB+KK/o9gNbwKR6QQWq3rtkZfZS1WB/N9hf8+sjrYKFyFzWL3TE9w2rQ3ystPP89/pKQlTf53rFKBAASymr6E2hvTgYr4DoO7Tekc5f+ej22eMk+oy4mRplvlQHFGggz93Uz+fyIPtW+XLL5Xxdn8vP+9PlqAgO4spHTg03Bz10j2c/yQw3hO62DIEOpReEIDinkYYkNG58g8nSo5jvK1rephcueHM7u+r2C9vSib2rWTxvfko5yEieriu30Qa3hxAlQ2kLtFkafBEKNqghyjvb8h7PsDCeXDzkKTKuW7F1WXJ6SGGNeEa/FvYLnl+zn/bBw3KiZdqtHoM9GGMFnoUKgW8iNEe37vsmaeZ1c0eEaWHdje1ASx1x1Abm3xtvIEIYPkEQIDsrbjw/8E2J7uKvSOfYDjexfch1vV+0MbIljoxrteEkz01zOfkM8RrObgHKn359h3WirPp6tvy3/8YQAxErJkKbMSRWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHE4L3V2Q0VZeWd2dk93eC9DbzAxRzZuZmVFenBObzlDYXBhdkdwSHBSdm02?=
 =?utf-8?B?R2UvQ2tTR1JRRmJMQmVuVHhpdTFNT3d5NFErZDl0S0dqVEQ2MXpBQUpPa2hh?=
 =?utf-8?B?UFErR24zSGNHdXdXZkw1SzlDazBmTlRuVjF5L2UyNllHTUF5RVRqTzRUQ1lJ?=
 =?utf-8?B?cHl2UkhBNWhieWxOTmdhSlBSSmtBWTNMMnhKVmFUcWxuWFlFUG5jTFowbTJq?=
 =?utf-8?B?WTRxTUpKVjZTVXlhelJTQ29hanZzbGt3OUxaQVNzV09KU0J2SVRVM2NPS2dx?=
 =?utf-8?B?WmFNdnRuY3VWRTB1UXM3eEhoRXFrQ3J4QitPWUp5RzE2UThQVUUxQ1drQmxy?=
 =?utf-8?B?SFA1WStPR25OMENWeXkzZEN6RzhZdXc2enBMRWFiUFBZbWdvYUJFaVJpc0NH?=
 =?utf-8?B?bTkxbkc4ek0rYnlUdXNhQm9PNzhWZGY0L3didjZyMTYraUQ4bkxBbE44REVh?=
 =?utf-8?B?MWY3OHpqSXo0VThab2xsVktDUlNKaWROQVQ1ZEQrZm56aEh1MDFKcThncUpV?=
 =?utf-8?B?OEt5bXVjRStxSUxhd1RsK2FrZEM3OFNubHZzaFJ2aDByb0tsVzY1ZkdPWm9i?=
 =?utf-8?B?c1NFaDlnc1p1QjJNbTd0VDFkVWdzZDA1dTJhYzdxUjE5U1dndjd3RnFHSWlU?=
 =?utf-8?B?TFhEM1lXWnhFZFkvemRYbkZqWUx1bWJsY3B4TXB6Y3JsUERqRldVeDJheCtU?=
 =?utf-8?B?WXdaSjJxTk55d3B3MmpKSGdIb1pSY3ROOEJNN0R6ZHhtNjB1YVVvaTF3T2lY?=
 =?utf-8?B?cXo4YTJFamh5cnQ5ZFR0K1BzeUM5TTMydlpqd1YwVzBwVHRWL1lnMWIzZWhu?=
 =?utf-8?B?SUxCekRQSHhjSzI0M2ZrVlZsaVpyR0hSQXByb3FReFVha0xGeE11MXlDUC9t?=
 =?utf-8?B?R3FIVkdraHBBUjhCcUlqWHVHN2FaeVk4d3RjbU1DZWtqRzlhbC9yVHhsVVRT?=
 =?utf-8?B?NnZVdnFRTUtUSkR1MDNwRHVzcjZuZkVsMWlYQm5FK3RiLzhqL2lReTdyVFQv?=
 =?utf-8?B?d0hsaVlkN3hBSDRsQURMNnI4UnFFUi9PTXFlOFRoa3MvdUswZ01ubmV5MGs4?=
 =?utf-8?B?U1JoZWNJMXF1NUttdnR4NWpLTXZleDBrWnA5ZDhqdnd4ckV4bS8wLzc4Q2Nw?=
 =?utf-8?B?RE8wWnNGdWdNWlR6Yms2dkdMRGJYQ2NHTDlDZG5yN2dmS0NTblBXK2xJR2xj?=
 =?utf-8?B?QkpuQitlbzNQbGRudUlzNWJTenBDM1ZCOGkyNjlrV2l6c2swMGZYay9aYUpw?=
 =?utf-8?B?UmcxWGNNY2ZtQTAzNHJQbythb3AxV1MyNlJKZFpVZDVyVTN3enBNOGhzRnJo?=
 =?utf-8?B?MENCQkdIM0NQa3NTcE05Z2tQbkprUFV2REFjU0xMcE9rSWFvL2NZc0dxMTFC?=
 =?utf-8?B?eUVPN0pudjcyYUlsYWZFNDdIMW1Ya3BPcEFxZDl3dGphMXN6ZUZOd3pXckVX?=
 =?utf-8?B?UHpVNGtsbDQvNS9jSHBlL25WWE9ndnJyUDJ5TEh0cEZOSUFCbXlHM09nZG5z?=
 =?utf-8?B?eER4bjEwNkEwQm9EYzM3S00vWTBQYXNtNXJ6U1EvK0VMQ01NL3BTMlVkK2Zi?=
 =?utf-8?B?b2ZPM3l2S0JxczdlanBYanBCODhrVjVCczh1dnNBdW92UWdyQTErY2xVOHhl?=
 =?utf-8?B?ZithOWRDYXVGSUkrTS8zcExqVkNtTXBUODhNMnE3Ulo2Y2xHVXQ4NFZSV2ZM?=
 =?utf-8?B?UE45OEN4bUJyaGF2RmNneWlzbFVZUFFvaDhsSGRtVHZqZUZza2dlRDBXVXNO?=
 =?utf-8?B?NXg1TkxiZmZHSVk4M3VDUlNWSG9EdTZ6SFV2dzhSSUlEU0pqMWNjS0owREVp?=
 =?utf-8?B?Yjk2VWJ1OHhydFhRZ0FWejlhUXZkSTRVK2UwYlJlVUFzVDcrT2FvL1dZZUN5?=
 =?utf-8?B?Vm9hZVBBNENjem9BRVllcEt6VkluR0JnSjBCQnNvNFQrT0tnNHFBUjVKZWR4?=
 =?utf-8?B?bEhkbmRydi9jTkNhRjZ1OWlIcmp1K3FYSThmRGJhT1pwUUsxakZvcGREYjdU?=
 =?utf-8?B?emZ0TVBhdjJEUUg4N2IwaGc2OU1oSHRSSlNLdUFPMDNGdGpDaXd5M3BoN2dw?=
 =?utf-8?B?ei9VNUVaV3BvWi9pVTJrWHZLWVR0UWhKbUJWdjVJaDN4cFNoUTRGcXNseWFk?=
 =?utf-8?B?SDloRHZLZ1NxOU9Ra25odkpIQ1FWS2xFa1NOVXM2Q01hQ25sQ2dmalNIWU9U?=
 =?utf-8?B?cVlCVjBQZ3VoVmJTVXJGejFlMDdKQ1k0cW5QeVlOeTdreXFWQ0RReG1ZVllv?=
 =?utf-8?B?TEx3RFBhSXBuQ01CMVZzWFUxU1FFMmhxRHpnUTBmVHFhS0dGa1lQTlBpQVhO?=
 =?utf-8?B?UlZTZmZibzFIczdsQ01ONGVpZ2MyTTZVaFZIQmkyalMyT1pIZUp4NTd2N3Bs?=
 =?utf-8?Q?CWS/kvCU0Oc80cy8=3D?=
X-Exchange-RoutingPolicyChecked: Wry3FYMeHTRAdZXQ0ZnN2ME/x/I5ZnzG9HKer7STUP/whdHyk56fwWewQSnW2BUkR8bgOYH719wp2r4s0oAXorDs5BlEBW3HrV31l/1ceiZNut6bafFisN/IqnZTuxQW33/KoE7ZeDwRnes71x37oL7GPDBJ9hJClaPJnm+SYmLLYesyH5XAZe7o1QrXO+r3PT5jbzMqXcIiaKSK+ZCfhIDu4LzZXxqBxjXFdS0hngPmoz711NKqxEflomvaxDEAPzpud+QFn68/3tFirYTlHzlJnofp/venIx2w7ar7HOk26GBHTIyedJmX1jO7LfMC/IeoL6qN4FimZn3gQtlhtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2333841-179b-4ae2-9e2a-08defe295858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:37:46.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRj5N3YW92M9mQ2jvRY03HSrXPgla7+L/PvcDAx+eq+gcsC3Os+P+v6wRu6EobD0ZHBwFACtRca6Z0BPYAZoGb7ZcCvCAnddQudWCicJ2ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9589
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

--------------hrGf0XxaeTLzEmIWVWmSLb6e
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/18/2026 6:50 PM, Niranjana Vishwanathapura wrote:
> On Mon, Aug 17, 2026 at 08:00:28PM +0000, Jagmeet Randhawa wrote:
>> Add exec-multi-queue-spinner-interrupted-lr, which runs preemptible
>> spinners on every queue in a multi-queue exec queue group in long
>> running mode, then submits a dma-fence job on the same engine to force
>> the group from FAULT into DMA_FENCE mode.
>>
>> Each spinner is armed with a queue-switch semaphore
>> (multi_queue_switch_on_wait + xe_spin_preempt_wait) so it yields the
>> shared engine to its sibling once scheduled, instead of busy-looping
>> and starving the rest of the group. This lets every queue in the group
>> be genuinely resident when the interrupting job forces the mode
>> switch, exercising suspend/resume of the secondary queues rather than
>> just the primary.
>>
>> The dma-fence and LR (preempt) multi-queue suspend/resume paths are
>> already covered by the userptr-invalidation tests; this adds the
>> missing FAULT-mode coverage.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_mix_modes.c | 111 ++++++++++++++++++++++++++++++++
>> 1 file changed, 111 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_mix_modes.c 
>> b/tests/intel/xe_exec_mix_modes.c
>> index 209825f58..d9ebb8283 100644
>> --- a/tests/intel/xe_exec_mix_modes.c
>> +++ b/tests/intel/xe_exec_mix_modes.c
>> @@ -27,6 +27,7 @@
>>
>> #define FLAG_EXEC_MODE_LR    (0x1 << 0)
>> #define FLAG_JOB_TYPE_SIMPLE    (0x1 << 1)
>> +#define FLAG_MULTI_QUEUE    (0x1 << 2)
>>
>> #define NUM_INTERRUPTING_JOBS    1
>> #define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
>> @@ -34,6 +35,7 @@
>> #define SPIN_DATA        1
>> #define EXEC_DATA        2
>> #define DATA_COUNT        3
>> +#define N_GROUP_QUEUES        2
>>
>> struct data {
>>     struct xe_spin spin;
>> @@ -221,6 +223,104 @@ run_job(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>>     xe_vm_destroy(fd, vm);
>> }
>>
>> +static void
>> +run_job_multi_queue(int fd, struct drm_xe_engine_class_instance *hwe)
>> +{
>> +    struct drm_xe_sync sync = {
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .timeline_value = USER_FENCE_VALUE,
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(&sync),
>> +    };
>> +    uint32_t exec_queues[N_GROUP_QUEUES];
>> +    struct xe_spin *spin[N_GROUP_QUEUES];
>> +    uint64_t addr[N_GROUP_QUEUES];
>> +    uint64_t base_addr = 0x1a0000;
>> +    int64_t fence_timeout = NSEC_PER_SEC;
>> +    int64_t timeout_short = 1;
>> +    uint64_t vm_sync = 0;
>> +    size_t bo_size, spin_size;
>> +    uint32_t vm, bo;
>> +    void *map;
>> +    int i;
>> +
>> +    igt_require(xe_has_multi_queue_engine(fd));
>> +
>> +    vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +                  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +
>> +    /* exec_queues[0] is the primary, the rest join its group. */
>> +    for (i = 0; i < N_GROUP_QUEUES; i++) {
>> +        struct drm_xe_ext_set_property multi_queue = {
>> +            .base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +            .property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +        };
>> +        uint64_t ext = to_user_pointer(&multi_queue);
>> +
>> +        multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> +        exec_queues[i] = xe_exec_queue_create(fd, vm, hwe, ext);
>> +    }
>> +
>> +    spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
>> +    bo_size = spin_size * N_GROUP_QUEUES;
>> +    bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 
>> hwe->gt_id),
>> +              DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +    map = xe_bo_map(fd, bo, bo_size);
>> +    for (i = 0; i < N_GROUP_QUEUES; i++) {
>> +        spin[i] = (struct xe_spin *)((char *)map + i * spin_size);
>> +        addr[i] = base_addr + i * spin_size;
>> +    }
>> +
>> +    sync.addr = to_user_pointer(&vm_sync);
>> +    xe_vm_bind_async(fd, vm, 0, bo, 0, base_addr, bo_size, &sync, 1);
>> +    xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>> +    vm_sync = 0;
>> +
>> +    for (i = 0; i < N_GROUP_QUEUES; i++) {
>> +        /* Yield the shared engine at a switch point instead of 
>> busy-spinning. */
>> +        xe_spin_init_opts(spin[i], .addr = addr[i], .preempt = true,
>> +                  .multi_queue_switch_on_wait = true);
>
> I think here 'multi_queue_switch = true' is enough probably (as we 
> have 'preempt = true')
> instead of 'multi_queue_switch_on_wait = true'. With that, we also 
> don't need the
> xe_spin_preempt_wait/nowait() calls below as well. Can you check?
You're right. Switched to .multi_queue_switch = true, since it's an 
unconditional switch point, each spinner yields to its sibling on its 
own, so the xe_spin_preempt_wait()/xe_spin_preempt_nowait() calls are no 
longer needed and are removed. Verified on hardware (NVL-P): the subtest 
passes. Done in v2.
>
>> +        xe_spin_preempt_wait(spin[i]);
>> +        sync.addr = addr[i] + (char *)&spin[i]->exec_sync - (char 
>> *)spin[i];
>> +        exec.exec_queue_id = exec_queues[i];
>> +        exec.address = addr[i];
>> +        xe_exec(fd, &exec);
>> +        xe_spin_wait_started(spin[i]);
>> +    }
>> +
>> +    /* Force the group from FAULT into DMA_FENCE mode. */
>> +    run_job(fd, hwe, EXEC_MODE_DMA_FENCE, SIMPLE_BATCH_STORE, false, 
>> NULL);
>> +
>> +    /* Spinners must have been suspended, not completed, during the 
>> switch. */
>> +    for (i = 0; i < N_GROUP_QUEUES; i++)
>> +        igt_assert_neq(0, __xe_wait_ufence(fd, &spin[i]->exec_sync,
>> +                           USER_FENCE_VALUE, exec_queues[i],
>> +                           &timeout_short));
>> +
>
> This check doesn't mean much as we are ending the spinner below. ie., 
> job is known
> to be not complete as we have not ended the spinner. But I see you 
> want to keep it
> similar to other existing tests. Perhaps we can remove it as are sure 
> that spinner
> job won't be complete unless we end it.
|Agreed, it doesn't add value since the spinner can't complete until we 
end it. Removed the check (and the now-unused timeout_short) in v2.|
>
>> +    for (i = 0; i < N_GROUP_QUEUES; i++) {
>> +        xe_spin_end(spin[i]);
>> +        xe_spin_preempt_nowait(spin[i]);
>> +    }
>> +
>> +    for (i = 0; i < N_GROUP_QUEUES; i++)
>> +        xe_wait_ufence(fd, &spin[i]->exec_sync, USER_FENCE_VALUE,
>> +                   exec_queues[i], fence_timeout);
>> +
>> +    sync.addr = to_user_pointer(&vm_sync);
>> +    xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size, &sync, 1);
>> +    xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>> +
>> +    for (i = 0; i < N_GROUP_QUEUES; i++)
>> +        xe_exec_queue_destroy(fd, exec_queues[i]);
>> +    munmap(map, bo_size);
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>> /**
>>  * SUBTEST: exec-simple-batch-store-lr
>>  * Description: Execute a simple batch store job in long running mode
>> @@ -235,6 +335,11 @@ run_job(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>>  * SUBTEST: exec-spinner-interrupted-dma-fence
>>  * Description: Spin in dma fence mode then get interrupted by a simple
>>  *              batch store job in long running mode
>> + *
>> + * SUBTEST: exec-multi-queue-spinner-interrupted-lr
>> + * Description: Run preemptible spinners on a multi-queue exec queue 
>> group
>> + *              in long running mode, then get interrupted by a simple
>> + *              batch store job in dma fence mode
>>  */
>> static void
>> test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
>> @@ -243,6 +348,11 @@ test_exec(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>>     enum engine_execution_mode engine_execution_mode;
>>     enum job_type job_type;
>>
>> +    if (flags & FLAG_MULTI_QUEUE) {
>> +        run_job_multi_queue(fd, hwe);
>> +        return;
>> +    }
>> +
>
> Actually, we should call
> igt_require(xe_engine_class_supports_multi_queue(fd, hwe->engine_class));
> here instead of calling 'igt_require(xe_has_multi_queue_engine(fd));' in
> run_job_multi_queue. Earlier in the call chain we do it, it is better.
>
> Also, add an assert here that FLAG_EXEC_MODE_LR is set as that is the
> only test MULTI_QUEUE case supports currently.
>
> Niranjana

Done. Moved the capability check into test_exec() using 
xe_engine_class_supports_multi_queue(fd, hwe->engine_class) (dropped the 
xe_has_multi_queue_engine() call in run_job_multi_queue), and added 
igt_assert(flags & FLAG_EXEC_MODE_LR) in v2.

Thanks for the review, all three addressed in v2, will send it up shortly.

Jagmeet


>
>>     if (flags & FLAG_EXEC_MODE_LR)
>>         engine_execution_mode = EXEC_MODE_LR;
>>     else
>> @@ -267,6 +377,7 @@ int igt_main()
>>         { "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
>>         { "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
>>         { "spinner-interrupted-dma-fence", 0 },
>> +        { "multi-queue-spinner-interrupted-lr", FLAG_EXEC_MODE_LR | 
>> FLAG_MULTI_QUEUE },
>>         { NULL },
>>     };
>>     int fd;
>> -- 
>> 2.43.0
>>
--------------hrGf0XxaeTLzEmIWVWmSLb6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/2026 6:50 PM, Niranjana
      Vishwanathapura wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aoUL-8TzCIdTWFn0@nvishwa1-desk">On
      Mon, Aug 17, 2026 at 08:00:28PM +0000, Jagmeet Randhawa wrote:
      <br>
      <blockquote type="cite">Add
        exec-multi-queue-spinner-interrupted-lr, which runs preemptible
        <br>
        spinners on every queue in a multi-queue exec queue group in
        long
        <br>
        running mode, then submits a dma-fence job on the same engine to
        force
        <br>
        the group from FAULT into DMA_FENCE mode.
        <br>
        <br>
        Each spinner is armed with a queue-switch semaphore
        <br>
        (multi_queue_switch_on_wait + xe_spin_preempt_wait) so it yields
        the
        <br>
        shared engine to its sibling once scheduled, instead of
        busy-looping
        <br>
        and starving the rest of the group. This lets every queue in the
        group
        <br>
        be genuinely resident when the interrupting job forces the mode
        <br>
        switch, exercising suspend/resume of the secondary queues rather
        than
        <br>
        just the primary.
        <br>
        <br>
        The dma-fence and LR (preempt) multi-queue suspend/resume paths
        are
        <br>
        already covered by the userptr-invalidation tests; this adds the
        <br>
        missing FAULT-mode coverage.
        <br>
        <br>
        Signed-off-by: Jagmeet Randhawa
        <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
        <br>
        ---
        <br>
        tests/intel/xe_exec_mix_modes.c | 111
        ++++++++++++++++++++++++++++++++
        <br>
        1 file changed, 111 insertions(+)
        <br>
        <br>
        diff --git a/tests/intel/xe_exec_mix_modes.c
        b/tests/intel/xe_exec_mix_modes.c
        <br>
        index 209825f58..d9ebb8283 100644
        <br>
        --- a/tests/intel/xe_exec_mix_modes.c
        <br>
        +++ b/tests/intel/xe_exec_mix_modes.c
        <br>
        @@ -27,6 +27,7 @@
        <br>
        <br>
        #define FLAG_EXEC_MODE_LR&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 0)
        <br>
        #define FLAG_JOB_TYPE_SIMPLE&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 1)
        <br>
        +#define FLAG_MULTI_QUEUE&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 2)
        <br>
        <br>
        #define NUM_INTERRUPTING_JOBS&nbsp;&nbsp;&nbsp; 1
        <br>
        #define USER_FENCE_VALUE&nbsp;&nbsp;&nbsp; 0xdeadbeefdeadbeefull
        <br>
        @@ -34,6 +35,7 @@
        <br>
        #define SPIN_DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1
        <br>
        #define EXEC_DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2
        <br>
        #define DATA_COUNT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3
        <br>
        +#define N_GROUP_QUEUES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2
        <br>
        <br>
        struct data {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;struct xe_spin spin;
        <br>
        @@ -221,6 +223,104 @@ run_job(int fd, struct
        drm_xe_engine_class_instance *hwe,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_vm_destroy(fd, vm);
        <br>
        }
        <br>
        <br>
        +static void
        <br>
        +run_job_multi_queue(int fd, struct drm_xe_engine_class_instance
        *hwe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_sync sync = {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags = DRM_XE_SYNC_FLAG_SIGNAL,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type = DRM_XE_SYNC_TYPE_USER_FENCE,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .timeline_value = USER_FENCE_VALUE,
        <br>
        +&nbsp;&nbsp;&nbsp; };
        <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_exec exec = {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_batch_buffer = 1,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_syncs = 1,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .syncs = to_user_pointer(&amp;sync),
        <br>
        +&nbsp;&nbsp;&nbsp; };
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t exec_queues[N_GROUP_QUEUES];
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_spin *spin[N_GROUP_QUEUES];
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t addr[N_GROUP_QUEUES];
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t base_addr = 0x1a0000;
        <br>
        +&nbsp;&nbsp;&nbsp; int64_t fence_timeout = NSEC_PER_SEC;
        <br>
        +&nbsp;&nbsp;&nbsp; int64_t timeout_short = 1;
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t vm_sync = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; size_t bo_size, spin_size;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t vm, bo;
        <br>
        +&nbsp;&nbsp;&nbsp; void *map;
        <br>
        +&nbsp;&nbsp;&nbsp; int i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(xe_has_multi_queue_engine(fd));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* exec_queues[0] is the primary, the rest join its group.
        */
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_ext_set_property multi_queue = {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .base.name =
        DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .property =
        DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ext = to_user_pointer(&amp;multi_queue);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multi_queue.value = i ? exec_queues[0] :
        DRM_XE_MULTI_GROUP_CREATE;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exec_queues[i] = xe_exec_queue_create(fd, vm, hwe,
        ext);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
        <br>
        +&nbsp;&nbsp;&nbsp; bo_size = spin_size * N_GROUP_QUEUES;
        <br>
        +&nbsp;&nbsp;&nbsp; bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
        hwe-&gt;gt_id),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
        <br>
        +&nbsp;&nbsp;&nbsp; map = xe_bo_map(fd, bo, bo_size);
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin[i] = (struct xe_spin *)((char *)map + i *
        spin_size);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr[i] = base_addr + i * spin_size;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; sync.addr = to_user_pointer(&amp;vm_sync);
        <br>
        +&nbsp;&nbsp;&nbsp; xe_vm_bind_async(fd, vm, 0, bo, 0, base_addr, bo_size,
        &amp;sync, 1);
        <br>
        +&nbsp;&nbsp;&nbsp; xe_wait_ufence(fd, &amp;vm_sync, USER_FENCE_VALUE, 0,
        fence_timeout);
        <br>
        +&nbsp;&nbsp;&nbsp; vm_sync = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Yield the shared engine at a switch point instead of
        busy-spinning. */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_init_opts(spin[i], .addr = addr[i], .preempt =
        true,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .multi_queue_switch_on_wait = true);
        <br>
      </blockquote>
      <br>
      I think here 'multi_queue_switch = true' is enough probably (as we
      have 'preempt = true')
      <br>
      instead of 'multi_queue_switch_on_wait = true'. With that, we also
      don't need the
      <br>
      xe_spin_preempt_wait/nowait() calls below as well. Can you check?&nbsp;<br>
    </blockquote>
    You're right. Switched to .multi_queue_switch = true, since it's an
    unconditional switch point, each spinner yields to its sibling on
    its own, so the xe_spin_preempt_wait()/xe_spin_preempt_nowait()
    calls are no longer needed and are removed. Verified on hardware
    (NVL-P): the subtest passes. Done in v2.
    <blockquote type="cite" cite="mid:aoUL-8TzCIdTWFn0@nvishwa1-desk"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_preempt_wait(spin[i]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sync.addr = addr[i] + (char
        *)&amp;spin[i]-&gt;exec_sync - (char *)spin[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exec.exec_queue_id = exec_queues[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exec.address = addr[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec(fd, &amp;exec);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_wait_started(spin[i]);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Force the group from FAULT into DMA_FENCE mode. */
        <br>
        +&nbsp;&nbsp;&nbsp; run_job(fd, hwe, EXEC_MODE_DMA_FENCE, SIMPLE_BATCH_STORE,
        false, NULL);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Spinners must have been suspended, not completed, during
        the switch. */
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_neq(0, __xe_wait_ufence(fd,
        &amp;spin[i]-&gt;exec_sync,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USER_FENCE_VALUE, exec_queues[i],
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;timeout_short));
        <br>
        +
        <br>
      </blockquote>
      <br>
      This check doesn't mean much as we are ending the spinner below.
      ie., job is known
      <br>
      to be not complete as we have not ended the spinner. But I see you
      want to keep it
      <br>
      similar to other existing tests. Perhaps we can remove it as are
      sure that spinner
      <br>
      job won't be complete unless we end it.
      <br>
    </blockquote>
    <code>Agreed, it doesn't add value since the spinner can't complete
      until we end it. Removed the check (and the now-unused
      timeout_short) in v2.</code>
    <blockquote type="cite" cite="mid:aoUL-8TzCIdTWFn0@nvishwa1-desk"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES;
        i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_end(spin[i]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_preempt_nowait(spin[i]);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_wait_ufence(fd, &amp;spin[i]-&gt;exec_sync,
        USER_FENCE_VALUE,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exec_queues[i], fence_timeout);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; sync.addr = to_user_pointer(&amp;vm_sync);
        <br>
        +&nbsp;&nbsp;&nbsp; xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size,
        &amp;sync, 1);
        <br>
        +&nbsp;&nbsp;&nbsp; xe_wait_ufence(fd, &amp;vm_sync, USER_FENCE_VALUE, 0,
        fence_timeout);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; N_GROUP_QUEUES; i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec_queue_destroy(fd, exec_queues[i]);
        <br>
        +&nbsp;&nbsp;&nbsp; munmap(map, bo_size);
        <br>
        +&nbsp;&nbsp;&nbsp; gem_close(fd, bo);
        <br>
        +&nbsp;&nbsp;&nbsp; xe_vm_destroy(fd, vm);
        <br>
        +}
        <br>
        +
        <br>
        /**
        <br>
        &nbsp;* SUBTEST: exec-simple-batch-store-lr
        <br>
        &nbsp;* Description: Execute a simple batch store job in long running
        mode
        <br>
        @@ -235,6 +335,11 @@ run_job(int fd, struct
        drm_xe_engine_class_instance *hwe,
        <br>
        &nbsp;* SUBTEST: exec-spinner-interrupted-dma-fence
        <br>
        &nbsp;* Description: Spin in dma fence mode then get interrupted by a
        simple
        <br>
        &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch store job in long running mode
        <br>
        + *
        <br>
        + * SUBTEST: exec-multi-queue-spinner-interrupted-lr
        <br>
        + * Description: Run preemptible spinners on a multi-queue exec
        queue group
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in long running mode, then get interrupted by a
        simple
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch store job in dma fence mode
        <br>
        &nbsp;*/
        <br>
        static void
        <br>
        test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
        <br>
        @@ -243,6 +348,11 @@ test_exec(int fd, struct
        drm_xe_engine_class_instance *hwe,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;enum engine_execution_mode engine_execution_mode;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;enum job_type job_type;
        <br>
        <br>
        +&nbsp;&nbsp;&nbsp; if (flags &amp; FLAG_MULTI_QUEUE) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_job_multi_queue(fd, hwe);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
      </blockquote>
      <br>
      Actually, we should call
      <br>
      igt_require(xe_engine_class_supports_multi_queue(fd,
      hwe-&gt;engine_class));
      <br>
      here instead of calling
      'igt_require(xe_has_multi_queue_engine(fd));' in
      <br>
      run_job_multi_queue. Earlier in the call chain we do it, it is
      better.
      <br>
      <br>
      Also, add an assert here that FLAG_EXEC_MODE_LR is set as that is
      the
      <br>
      only test MULTI_QUEUE case supports currently.
      <br>
      <br>
      Niranjana
      <br>
    </blockquote>
    <p>Done. Moved the capability check into test_exec() using
      xe_engine_class_supports_multi_queue(fd, hwe-&gt;engine_class)
      (dropped the xe_has_multi_queue_engine() call in
      run_job_multi_queue), and added igt_assert(flags &amp;
      FLAG_EXEC_MODE_LR) in v2.</p>
    <p>Thanks for the review, all three addressed in v2, will send it up
      shortly.</p>
    <p>Jagmeet</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aoUL-8TzCIdTWFn0@nvishwa1-desk"><br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;if (flags &amp; FLAG_EXEC_MODE_LR)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; engine_execution_mode = EXEC_MODE_LR;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;else
        <br>
        @@ -267,6 +377,7 @@ int igt_main()
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;simple-batch-store-dma-fence&quot;, FLAG_JOB_TYPE_SIMPLE
        },
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;spinner-interrupted-lr&quot;, FLAG_EXEC_MODE_LR },
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;spinner-interrupted-dma-fence&quot;, 0 },
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;multi-queue-spinner-interrupted-lr&quot;,
        FLAG_EXEC_MODE_LR | FLAG_MULTI_QUEUE },
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL },
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;};
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;int fd;
        <br>
        --&nbsp;<br>
        2.43.0
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------hrGf0XxaeTLzEmIWVWmSLb6e--
