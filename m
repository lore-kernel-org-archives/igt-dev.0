Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C35CA5FCE
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 02:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5135110E0A0;
	Fri,  2 Oct 2026 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dPlhZkVS";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013002.outbound.protection.outlook.com
 [40.93.196.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C38010E0A0
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 02:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIKaXovd3yp67oHtfXrVqEWVvh4yAYl/7gWWKF8Txol97oGnp142aC6UaVTB8HbmMO24RJ0wJ6QmdrN7wmlzjFGmoDco5lv3caKtvhLRfV/Wtp3AD233Nd2rF9vSVi9JJ3k3t3oh9LBlWs6Gr4u7g4WnoSFRSWcsmv4F9KSxTWktAK+LU8HCfYYSIOIqlUYwBvILwKMfvsRAPurijOSptvA3F0D1jcYoOIcyo991jdkk6F6h02bjFOOe5FabxaF1P9iZSYfs8+x1jyr5dAxR/lcfY6WK7JjCHGYc9S9nvbbbWpO8aXJ+FQ1bffPHGit+WS248R6g4mDhJ3m61/Ossw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o6p6pNQwoOIGhidOSn9+OW3EyHPzEnaRMeInewBeCE=;
 b=W3DsV/3KSqIDGHSAkcf7lMrRm3rqgd+g8jPw31/8t8jm1ZakJafVIZLG/xkYyvZUayVszm9OWpsQnGa14Axs6OgxM8g+DdBjfb4cFtdBTaSRp/tp8i0Cstelw2QG04JPEv1ZLQGQcZ5tL/L5QrMndI9LSJXNAy2ty1SlMCWF9/WQw0fB/bb6TCKy4qw6+ugPku6vWHsoDTijtmfVel1+DxVpxLqrbROvoOMd/JXY/0OQCGXWU9AapgQX4iT1juRYss2s0HQ/MEGxVJ+vYsmd9XujhgsU8meJZeG2weGkSOiPONMauggBPRxxWbMsRhdEKuTt1/HuC7oVyY96JibkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o6p6pNQwoOIGhidOSn9+OW3EyHPzEnaRMeInewBeCE=;
 b=dPlhZkVSQPmLgzz+m3dxVWWOw4/nMbg+PaXW1KGUvKCOYo9mBHeOJC1LZejqtsTm+/lg1EXSBqIqShKMmkfQ+Xqf9okxQ/vccEBbXRSOEczsLTeJ8etrjG/XXyjjvwbZQaYLS5OCHP61YFCdejWo/QjT6jLLXFKZRoyrw+I2aa4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 02:29:20 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 02:29:19 +0000
Message-ID: <7e95f516-89b8-4098-9a3a-eb8547aceed7@amd.com>
Date: Thu, 1 Oct 2026 22:29:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, igt-dev@lists.freedesktop.org,
 krzysztof.niemiec@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
 <2wlmpoiinqrdba6skfdwswlvce7fh64zawqfb4cx7kp7dfjjfp@mrocbsbiys5e>
 <DLSLPB47KBCX.3B4RTMBTWH25L@intel.com>
 <20260930143949.yutrf4jbana7adcc@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260930143949.yutrf4jbana7adcc@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0044.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::26) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a9d47d-2df2-46a7-9b65-08df202cf680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|3023799007|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ah62VGlYiOC3M+zAa+JPqvSLOAKSXaqcfto0KkvjnNv6Q2xUNZ8tF0tRFTQN8DQzLU3fl2Vn0TnQzcUFxX35LanQKTguxqCxBuml9EYzU8xzycaSH62bP0UFB/yjHdmWg7Swlw5vDAtjyfTfCWjdu5DxRwdgNUtV58iZDCH+mKPDEc8HNC5MDQ/WNv56epYQT89bebLAF9BCdx/JI0FgOkCZyc8sNgGwa8AELgseOIGZ1UoAwgm4R5nPRfmrfBQN8lfNra4JctbhvPruzB0wHC1qGrZ+rWJ6mZ++DJf1xVtGaECUa0kPdtJH1jsMPCCsMa1Ntc2O/VuTn/9jDsAn0Hr6p+o+MrX/lvUi5iRapIFz32nVrqZsiIWRur8mOB7dVLIS9nQklxFLddTckkTEDb7lFz/UiS+/hCAba2Ik6FNLMQ/hw6j3tR4x71xKG2df97LUc1oF+TtNkvLuUDZQwJ5Z4lAGu2wVGK0xu3vkZ8S55PKlBT+zjXWvf/SihAxyPIOs1bYE4NP3fxoG2of7D7nUQ3x8ARDOUr5LdZoswhZVZbpR1WzmSj81u0caWmwR2IEexjsay2WWdVaEMgz7Jsqnbm6lD+WsPRgYlpYXYEYe1iDhfXrIU8KC+qfX/CYp7B2DYVFOotlSx8yqamCDX8cNolsjvwINY7gWleg9+NA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNTMGZjTFlGa0E2V1dhYnBRSW9hNFpvbFNpelB0cXNOWCs0YWtoT1ltanhm?=
 =?utf-8?B?MzAwVUZIVUNEbkpjY0dOcmlPMTd0NnRXYzd4TnZLaEdXS2ZKVzJFTmorcHdC?=
 =?utf-8?B?am5YQ213VTU4T0pqY1hqT3pvUUxsUWNzUTE3NGMzVE1uUmNQK1RLazUxblRr?=
 =?utf-8?B?cEtadENOb2tKTXBQVmFkVXFVSnB0LzU0MWJpVU9aa01tTkVDWUZBMDM4TUp3?=
 =?utf-8?B?dmNvVEFXZmpodERxdGdlcHVhQU1DZm5tN3pvQVFBYldVdnZEY0YrUXUwcWRz?=
 =?utf-8?B?SzZIdXNKdlhFVTV6dmM3UENVcWhldnEzM0RkVUZhdGV2S2FrWnJhbjBZckxw?=
 =?utf-8?B?Q0JudkdSY1FrazNJdEpVSHhRQjBhRFlsNEFYQ1k0cVpZT2RPNWZlb2duNWZ2?=
 =?utf-8?B?QktOU2VaRnNFdEFPM0ZFWFZRUE9kZjRlSHlwYnNvRGI0UXRxd21qN1dISURl?=
 =?utf-8?B?RVJLQk5xNHNZQ1BhRlNDZm43R1plQzNFdC80Zm5ucUZ3RDVyaGxHekFaQ2Jo?=
 =?utf-8?B?Z21ENmRSNjczZEdOSGNHOGZNbDIxcXBDeUNWeWVZbzhtVGs5YnZMQmd6dEcy?=
 =?utf-8?B?M2FHVG1qUnFPR0tlcFJHejVkaFVPWlE3Zis0ZjdWWG52bjRZY0hOZXBhVFJh?=
 =?utf-8?B?bTZjRktWWDBrNmwvU1lqcDNoWnlmVHFPSllqeTZtSUtEMUQxTC9iQ3BBRVAz?=
 =?utf-8?B?ekU0ZEZLaU43QThCWFJUQmVCSWU4S0xCVmM5aXUyTDBKeUpoK21hcjBubWpa?=
 =?utf-8?B?ajRCbElJV1ZFQVNLbFZOcUF4WjBYaCtmUUFNSGQzZzRaSDlyeUtuTlFxSVpS?=
 =?utf-8?B?T0I2aGtXc2N4NW9HcE5rcUh3SHE3SHBuWWlDbE14cnprR3ZBdklUeXR4RGo3?=
 =?utf-8?B?Y3NMb3pnSHdnNDNYTXdGZmdMZ0lsRWZyU3UxVjVGWTcwYk44L1NGZWg2Wk14?=
 =?utf-8?B?WEZaWVIvT09ZVVJhNk9IVVh4WVhGTURJQnBHM2NDYkdYT045S1Z6VmFTNkd6?=
 =?utf-8?B?S3JoTVhIQ3FLY3ZlSW1pNTJTU1BDUy93SDJOWE45RmVuL0JCTllpRG5kUTJr?=
 =?utf-8?B?OHAzREVoS1hQN01mbnFUNytvS3RKT25HUm9XOVBacml6QlF1Z2FoSm9MQlMw?=
 =?utf-8?B?N2hiMWNnczIveVdORHhOeC9jVU1pYU1rT3Y2NFQ3TUtrdVoyZVBEOVBFUUNF?=
 =?utf-8?B?SjZSZW9SajRqMkMxYlhRQVRwL2NaaTZ0UTdwVVBhcnZNcW9ZcktpK1VGVmhz?=
 =?utf-8?B?cWRaVVNlbE5SSjUwcUNxU1gzQ0wxUXR0RjZZM09jT1NmWkdPemdPQnhlS2Rs?=
 =?utf-8?B?bEtlQmtpdVphTmprY2Zub0tRelhJQWE3aFVlbUoyWEUwTlNFclRVUlZRVWpB?=
 =?utf-8?B?QW1peWdaSVhLY3owV1ZYdVM0Zys3ZVp2aFRmL0oySmppdEJETkZMMktBYXlJ?=
 =?utf-8?B?NVo4UnpDOGlqKzVuRDRTRDdhWjZLdFhRREl0T3lDWmw0RG5lWlV2US9VNXBh?=
 =?utf-8?B?VE5OUjUzdzY3eUZOa08vOC9mNVYzTUdJcEtFbmFlbVlsbW1SWVZLdjRmY2xI?=
 =?utf-8?B?aWNFcDZUaER5N1ZtTDB5Wnl1ZWVtT1cvcEhrMkxxN0QrOE9JRWNKUTc0QnlR?=
 =?utf-8?B?MW53c21ZU0M2Y0JPWW9ENnROVkEydlNmbU83V0FTcitMOEZTS0xPQ2ozRFFy?=
 =?utf-8?B?SlpnaFpxdGNvUG9uOHV4N0JyQW1NK01maWprTis0ZDZENmlMMFZOaHkvaCs0?=
 =?utf-8?B?ZEdaRUUrT0svRnhWczAvVGRiSVVZVkJ0ZFZNcDE0NHRBSVNrVDU4aGo5UVh5?=
 =?utf-8?B?a1ZnTFpQeW1yQ1dJMUQ3QmhqcTdCVmZ1UStYNXlmelZORXNQRW8xcGd4YzNq?=
 =?utf-8?B?dDNZVTdWcG9CTWFldVhXa2s2TUdoQUpZZ3E2cWRWZ3FnM3F2WTJsQ1Z4TXd3?=
 =?utf-8?B?MmovY093TllsNEdTZjdBWk9nb3IvRWtUTlF6M0l3a0ZxcHU1OThsZFI1cTRn?=
 =?utf-8?B?RkxnK24wN09LR2RMNjNyWHFwVWgvRzRKU2dzTE1leGlrTEFkQWxDenlpNzZC?=
 =?utf-8?B?RjNxVHFKYkp6MnJhK2RTSTdOSUd4SU1DazJOOGhxOTNneDI1UzdQZXA2ZThX?=
 =?utf-8?B?OWFLa3pFcUExZ1pMUEpqVEpRVlJpTkFaamIrelY2YnE0SlNoTTh3UmY2MWZp?=
 =?utf-8?B?RWF6OXpTMWhVeWwzeWUyaW5HWEFVNFI4SGJPNlI0VVgyUEd5cS9JMjFxLzla?=
 =?utf-8?B?MWV2bit2VDBLZi82RFNzNjZOYkxNT3MzU1dEckZFNGE1dWphQnFrZXlaRWhO?=
 =?utf-8?B?ekpxK0M5SCtGTDA2TjFiZDV4VlZ0dWpNczYydE93ejZJeTF1bUV1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a9d47d-2df2-46a7-9b65-08df202cf680
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:29:19.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMVOWYdjHo+mY1VQMzGDgO28NGeI2WwYJaOXyMWoOUZ/KXX48oNBfgccG5CbEouU09Q10COdrRWBIobUjseTPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662
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


On 2026-09-30 10:39, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2026-09-30 at 13:06:22 +0200, Sebastian Brzezinka wrote:
>> Hi, Krzysztof,
>> thanks for review.
>>
>> On Mon Sep 28, 2026 at 1:01 PM CEST, Krzysztof Karas wrote:
>>> Hi Sebastian,
>>>
>>> The implementaion looks OK, I am wondering about the duplicated
>>> bits and whether it is worth it to make funcitons forcibly stand
>>> out from the Xe implementation, e.g. sometimes you have tiny bit
>>> of difference in formatting, or there is one more helper
>>> variable in one implementation, but not the other, etc.
>>>
>>> I'd say it would be worth considering extracting common parts
>>> into a shared file, but not necessarily in this patch series.
>> Agreed on not doing it in this series, and honestly, I'd lean towards
>> not doing it at all unless we actually get more backend. Each vendor
>> backend implements the same interface on its own terms, by design, so
>> each one can do things however makes sense for that hardware. Merging
>> the common bits now, with only two backends to generalize from, risks
>> guessing wrong about what's actually shared, and we'd
>> end up with an abstraction that doesn't fit either one cleanly.
> We could ask AMD GPUs devs took into this,
> +cc Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Vitaly, could you ask other AMD GPUs devs if there are some
> features which could be added to gputop? In other words, if this
> extension could also be used by AMD GPU to extend gputop output?
Hi Kamil,

Thanks for including me. I will run gputop with an AMD GPU and check what it already shows. 

I will also ask the AMD developers whether there are useful AMD-specific counters or other information we should add, then report back next week.


Regards,
Vitaly
>
> Regards,
> Kamil
>
>> It also helps that gputop is a small standalone tool, not core library
>> code, so a bit of duplication here is cheap. If another backend shows
>> up we can revisit this.
>>
>>
>> -- 
>> Best regards,
>> Sebastian
>>
