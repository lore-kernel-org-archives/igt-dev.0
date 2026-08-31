Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E493C624A4
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 14:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ED010E296;
	Mon, 31 Aug 2026 14:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+g+RMxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670E10E296
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788186119; x=1819722119;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AOq6ZhkwuN6QrZv+k66GzSNJ9Md2A9my5/NEzAojq4I=;
 b=S+g+RMxvfUC2Mu9afsonLp1pyzIPyW2SNyzScPQ2yuK8kFcQ5nuvtlkA
 gMeBZDEDfHQKzh3PrKo2KOZNgTAxIPdi4Ed3liy7J/d8DMLoWhhiWO6w9
 K1M9OBhDJfzYa4Ty0Y3B/zn7PnqqoUFij2X55VyXX+ZJwP7HCkZvkHg/k
 ySEq+xFnmcAXZaMQvNji8aiG2O76/HlwI1QgkRhIZpM5YM0j/sRFcg75p
 2RmGasES1bTbJEMqsZJNZ1zDJ1aZ/9oITw2SxA8qT+FYywB9CmXJqH7l/
 LaFTYAyl64onMLKicT0lJUJbSO/w8Q0BzJ1GAeapVI2TfR/BRbElfrWko A==;
X-CSE-ConnectionGUID: hqZlg1tLTYyMK4Bv1qKbZg==
X-CSE-MsgGUID: 4+qPTfm5QtaHF2JYw81CBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92461235"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92461235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:21:58 -0700
X-CSE-ConnectionGUID: xTwpeezOTVadYS3U246ugA==
X-CSE-MsgGUID: TYwYOqs6TqW+K/9PGGX1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265569549"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:21:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:21:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 07:21:57 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX1Ug/le11fuLsZSaA82HoP5ZvdxIy1/szCjSNa+KOiGN8wMcjSYga+KVa+Ekd+zz/ycg4pvRhb9sDOzE1MisQwYz3deP7TU6z50KEdyms43exmJDbtSzr3bq1mRVNOieIuZzLtzDgRnccZHTIBnTXSfDHew52IW25/xPbWdj8HY1bn2bh4wsd5QAG136SiL0+nUBJ4fn4ViYyUHNx7JGpy3/XlfDPhTh2LomJy8amMYHLjs94bUgFyveCu5ePTOOpmoiDzYiLQwTnmiW4OhhzmhxqwSbE+88y+vCC1uHsRSMdYanHVMQ/EXesZms0HDlDxdaKNZ3v3GZSlfGtHTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PobXeLqPHbcv7JbwK2A3PMaaSSDaKh38iMJfWDcDzqQ=;
 b=dD/1JzuQUR0Ya71fOD8022lIaimPNIu31WwDEQQ0pSF9KHkVJU84mT3qopsdZ0TxjMH52dmMDVcB5mOkU+MGh3nUwJoHZUNRaeT8nIR/dBxFKy/kwsGy2Kx/laWXG8m2MCVGoIaCTxVOE2Bt0DNG56vgzvn+axY/d92v3EWXjr87ZbPGdXiXmQNllvVG8hTzjDPdW/0jI73LDPdJ93BaedMqLSd/yhcMetBY7AQHB/Orxrzcmame8tMLK6MniH+axAJe25bEJm9xOMD8Jof7OUk7V/x/+tt8g0nfZ1SJP3D1a+eVYKoJgme577EmspEB4f9KPrk5KrapbJWOCUl6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by IA3PR11MB001166.namprd11.prod.outlook.com (2603:10b6:208:54b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:21:54 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:21:54 +0000
Message-ID: <88e775f2-9b7a-47ad-82eb-e01f985c9602@intel.com>
Date: Mon, 31 Aug 2026 19:51:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel-ci: blocklist xe_exec_threads multi-queue
 tests on NVL
To: <shivtej.eknath.patil@intel.com>, <igt-dev@lists.freedesktop.org>,
 <smitha.balasubramanyam@intel.com>
References: <20260831141921.18451-1-shivtej.eknath.patil@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260831141921.18451-1-shivtej.eknath.patil@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::7) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|IA3PR11MB001166:EE_
X-MS-Office365-Filtering-Correlation-Id: 726aaff4-c1d9-4542-9ede-08df076b351b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HcGsemKbLww0iLv1er/64tsDzZVsnDu5D2idQ0psAI1SQuSjMEWAuVjLcSaRfZB3rieH8umyu/1waMY7u3Dd7yan5/vmJIO1gjircPWIuw+4aXRg2Yu6GuwP32xmayvfY+4mMXHwzz1sWc5Tp2CepCAgJHItozQ4AvU8Aoz9XojfCMRqr0Ck5gGulngXo+ulS8I0KOuod5dfbeMmS0rR2JyPUMiSaRSdt1sGuF+rl2uGAasxOCJzbgwdPaV7PvmRCGMYpBgiMa59PDMLH4MUUUS8TwHM2UNpZ1RoJMQwFpq5lvV1j2uMx70i1HVg4zkH7qjquutEswuQB9pm7lMPS77YeqdqMzOA/LNhinwkvY6FJNwyu+MJx4X9z7/tcPlFEspMjR8Jup7nLqtXHbGHhbEFMLRc/ImtEzSCVhXz0TQYHYiRFR+LRf8wWcybz2kCDx/Hyp4ZFQnHNpGeNtsT9uCenUhPBZRW+H4f14+iCw4F0cwPrrLExuKbyBmZkaXvUzZ+hwzdvK81ZoNJ+VEVUwCNNivxJEC/zYXUxKsuwCtSO4GF//QvaLH4y576AYNvpzFO7gTgxIfj66s6/MVH76zjXxS+kE/FQHFkUnFXXqUcmOHx2vTz7ImsobzOgyyHPo90OOKDW1tbMUPz4KPwKhTzL6fzYOQYvTis6oEUbjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFybWpxSC9JbWtTTVN3U2xJempRNzByTEh6dFg4TkVwZ3pDY2xaa0ZNRjU1?=
 =?utf-8?B?ZzFHMFp2c0NqcjhYNk83bEI3ekpod05DNHoyeU5TN2F4aHAwamFwdHJ0Z3Uw?=
 =?utf-8?B?LzFnUEJBaml3MmRwR1hHUERmdHFsNzl0bmR5S1pJZExyZVpYeDRrL3JKZm1J?=
 =?utf-8?B?c25SVkZ0M2szN3N3WEd3M2pMYW5PckQ0RmJsdVJ4a1J0T2pGZitBVmFlbUQ2?=
 =?utf-8?B?VURSaFkzQUc4SzY3OGluR0xwQm1tZFhHM0xMbHZzNlRLWEI4dkdQcGNOajZZ?=
 =?utf-8?B?MDBKaXVoYi9GYmlUWm5IOEpyeDZ4a2NvRDdDQ0hmdEFWcDlxa1psaWZDTU9j?=
 =?utf-8?B?S01GR0t6OGFKdGhOWHNqcmNFYjJ6UTcrczB0a0hQd25aMHN5U0NYVCt1Um54?=
 =?utf-8?B?T0pvd2NTcURBMEwrRUFIdFdSK3ZyKzNLem1oV0pONlRVdnVyQ3RCVjNET21I?=
 =?utf-8?B?OW9XRnl2bGM2WkxkRlpESkZCRzB3SXUvbkFOTEdMM29qb2pCVUttSGZMYWxV?=
 =?utf-8?B?T1g1RTdpVEljcXBIYmtIZnRmU2NKbU1hcGVMTUhhb2I5MzFlVUU3NlduWUc2?=
 =?utf-8?B?ZXVYc2FIa0JwdC8vYjhHRTlzdm00RVFHaG1RR2ZNSDJxK0t0Q1pMWFJuRXFy?=
 =?utf-8?B?TXdESVVyaHZKUjJhWFRPaTF2QUxseVhUbW0rekt5dVJRSnhiVWVXOW9DWTVW?=
 =?utf-8?B?NDNGc0trRHdTWnRLVjM1Zm9WelVUSGNKWTBwQ0QzckJmeENOZk9yZEdEWW8z?=
 =?utf-8?B?WG4vdTF1U0pkaHBmaExyNXJkNWs3dTZPdENTSzdzWVRzZi8vZEN6Zk9xclQ1?=
 =?utf-8?B?OWV1RkRqNmd4WDQrYnplTlRQaFlBa0FSRUtLQUtCL0l4QUVaK3M3V2JxT3c5?=
 =?utf-8?B?MUZVSTlDb1Ztc2hyZWl4WUNGNUJWOHJDdmhsa3lkRWFlOTAzMCs0eTNONFhz?=
 =?utf-8?B?VnVvSFdhL0trVForcUNLWGJ1ZEFHWlRnOHNJWENXVExoVWdnRk9kV1ZSZlZZ?=
 =?utf-8?B?bWdWNDlEL0NvMlQvaThNQmY2MWNqUzNTUGRMNnJ1Q29YL2RRemIwNjR2SjZ0?=
 =?utf-8?B?RXdYam12NWduWDdkMW9nQkpicmxJenVaMkp5Q3FyQTBPcjMyNjE1QUVKNlM4?=
 =?utf-8?B?REFZKzBDa3hvOFdIQkxRTXlDcm80bHZRMXFWb2JDVXdGT1cwS21rYzA0ZldR?=
 =?utf-8?B?TGRKWVdGc0NDaHVENWRSLzhLL2dlM2Z5VnBVaS9NUkpZcmV6c3JIMlYzYkhG?=
 =?utf-8?B?V25LZm1MU2VkbHRwT2VTcVlKYURNcTdYRVRIM2dvWmZiSk9ocTg0OUd5UjZO?=
 =?utf-8?B?a01aOHl1QzJpNzhEMHV1d0U5K1dkb2FOTlNnUHBKVDZ4NkZWRFE1TVJFZkly?=
 =?utf-8?B?N09XejlCZlhnbmJCUzFpQnlKcHY0MHczbWNodTMvdUxaU3JrR1RlKzdCYVVF?=
 =?utf-8?B?cDJxb3IxaElFME1TSUZGNzhLd0twZlpLeWRFbHR3aVFZaW14bkJTMjBDRGhs?=
 =?utf-8?B?U3I0Tko3TkdCTGJ1Ni8xV0ZKaEtuck41STVINzd1ekFLSlpmbWV3bElHZjNT?=
 =?utf-8?B?WVkwa2h4bUs0dEN1Mlh3aDJoY1NuUVFaSWgwWmo1Sjdka1IzZzdESXYxbUlL?=
 =?utf-8?B?SUV3OHB6d0ZmK0M4bzk3dERQRWY4a3o4NnV0dGZmVDBpYzlpTjM2WjAzRHZx?=
 =?utf-8?B?QWI5Mk5ERjFCWmQvOHBuRkJuODZwbzIySStUU0dsc2hFOHBSTld5OXFHd3hB?=
 =?utf-8?B?Nkg3WlY3Qkhna05CQW9OcEQ2TDlDVk93M0J6NTl4RkpYR0hDUmgvTlNtdUMv?=
 =?utf-8?B?V0dQUDFUT3V0dmI0WHZXUWI3UVpqcEdmOUt5ZUFIQ2t4YnN1anFtZ3hBOEZH?=
 =?utf-8?B?cERDd3NWTUlhcGRpTTZlR3B1TEd0a1NxTmlaWDBMZTlWSUthVjlvYnBIL2xS?=
 =?utf-8?B?SHBEdk1lTXQ1MnRyRHlYUGxSRkoyQVF3QU1UcjJQMnAvckFGYW5mYlBadEUv?=
 =?utf-8?B?Wk5zTUxiRUVtRlpUQjg0clprTHVCWUlXVUlKMThNcFc5dm1BR1Bkd2JVSHNX?=
 =?utf-8?B?NnE4V2g3VWEzVXphd3AwYTZ1K1U1NW1nV0pxNEFzOU91Wi9hYVNLM05IQldQ?=
 =?utf-8?B?aE1xVVMwWnNHbUhYYnZBSUtZcEV2N2p2U3VQdU1ydVIvcWtOVFRTZ3ZIa2lU?=
 =?utf-8?B?YkcxWmFWcFJrMmQ0THp0cTJ2ZTFydDhEY0FScVVKc1V2WVY5M1hoaGZiMTM5?=
 =?utf-8?B?UklEMkdJYzVvcXJhWmdRY2xjckhxa2IxV0h2dmRYbks2SXFjY05vNFE2Q3lX?=
 =?utf-8?B?OW45L0ozZTRQU1BqcCt6bTVUNjcwRE85SUdSOWVoWlV6eGRDM2Nndz09?=
X-Exchange-RoutingPolicyChecked: fozAnXRonp/JhbdXOSkq+PrMWtyXSaQEsjXJ2DRUc7YLaFW3xxQjjWhEU1ZOxxZMG3gacYg1L1fr+x4mtsWSRHM6CPeQ36+Od3iRQGTF9dXVtEapHEVK9OfHRO9KSnYFBircy+gKD7D9y3ZrFDlVEyqPJgc3xClQbFfDwDuqJGVPl97GOByyguHQCuyxDgFP7+lystfyBR57eL10SR5fNqvnNRbXn96VP1+BTa0F7RfqE/D7xObW+xjCsRIcWEGXBvNRW6MWbEXuBbaOeAfuz+wXfNSzsxkMbJunyrHC8t0Sx71h9p+4YKLAhJ0sBe03q4t26LUDvYG4tSSQmd9tVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 726aaff4-c1d9-4542-9ede-08df076b351b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:21:54.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqR2MQAZBiTc3S9ygcRAF+EZU6xI44S19uksFVsMyg3bqgQc1YxOpnTiKUFNVgcnK1GPdxjLulnviS5pjAOjdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB001166
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


On 8/31/2026 7:49 PM, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>
> The xe_exec_threads multi-queue subtests require
> xe_has_multi_queue_engine(fd).
>   
> On NVL platforms these subtests are expected to skip because
> multi-queue engine support is not available.
>
> Add a blocklist entry to avoid reporting expected CI failures.
>
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..ef9249a6d 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,9 @@ igt@xe_exec_sip@.*
>   igt@xe_exec_sip_eudebug@.*
>   igt@xe_live_ktest@xe_eudebug
>   ##################################################################
> +# VLK-96753
If it's upstream don't mention VLK here, Add only related changes and 
send it to ML
> +# Expected skip on NVL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@xe_exec_threads@threads-multi-queue-.*
> +##################################################################
