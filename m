Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D32CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0810E525;
	Wed,  6 May 2026 08:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuPByrAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56010E522
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778056987; x=1809592987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jGGHYHQ/AagJqKtN7kSqg5QicacE/sy0ksppZe2CScg=;
 b=HuPByrAzUfYIs6HFBpuKXSoWvSmuSNAuBziJN+FuxuKToBdKGM9B3Wut
 bgL1CCSchlOlrPB3uz4kheVmIm99+IvKfig7lIB+Kw8dEtLqY1ubuXKtE
 g8ZQ48tBaXnGa+xtQFQdJW5d3P9ecX6SEUjaKmEZJOhNSzzJV8+4jvIDO
 4g/RHJJsR1WUcDndwsKBfT0U5RU1TVoapVxwRc538yXn4XzYNCgkyOp6h
 NSBYuRkOGaeRSd+WM48bm1cLxf1PZUbGqMbaHmGiTJi4StM7Izwd+O3Yr
 rsy6cS6TmURDyjllqvMhJ73SH5DrCHvuE/X50Z8UAknRD6+XCyxYFAVtl w==;
X-CSE-ConnectionGUID: mBvTKJymQO6ErGsLdARpJg==
X-CSE-MsgGUID: sPNHPq1XQkyzIvnquAtT7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78830072"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78830072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:43:06 -0700
X-CSE-ConnectionGUID: OmqlKFqYSuiXgdxfLBzqzA==
X-CSE-MsgGUID: 8QcWB6AQS5KL3zxe4ETbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235970137"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:43:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:43:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:43:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8l1W+/VGKmCPixPrvF02m0xOOtQl4LjJmJF6Q3lATzK8ql0vNL/EcXWFGPbBWz5X5VX3BKkiEbLKHvj5AeBWhbaHnF6fIO1ARVBiI0j4eZnU4sTfxABzLaZaUKtlLEI8Z1L6CF5sh7f1qc0mpMMLhfGp7Mg5sh5dLNgikOqwkhoSwFyYZIrpOxANg050cb6y7r12K8YYP3sDf8ZAOlBhzLOi9f95HNULZM1zyuV71jPGMN6lC/wY3l8GUkcbbeMj64Z5OkkSQUobWV3yk7cFjh/5clWN6PD71JCKb99slM33R1Y5iwHPbsMrbiQzD0JV1UR88/dIvLFq3qGAIXCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzh0nFl8vjyuF/v6A6kAxJKqtj3DyvlmH0j4fe8BQ38=;
 b=Q7AM54t5pKW6q/d4EGtKTePivrXAptAWej/iTq5dngNvhTZTZpG4S/26P5v3rAKEgEapu5ecl6MRvfJFEzDCj/QNlamTBoFBuavmGltStgaDca4N3wiyBf4QYJNOFwcOD2VET2Z+k6BsCtjayfHF2bFSVWrEmIk1lxOQnm1okusqSEk9iunqYLmiyF5ny3+VWxDqc6SVDEUBoYG3SBfzrxcSd3lGr2oh9lB4Q5PGrgPn21Jek6FWY0mwLDCj+8bs3vkGcI12WZsAQ6Al7fnakVC1zy596hRlv0syC6vEcfg3qIH8p2hu+UNzW+/u7WUHlMwrxSN4NcNOTzU3DoI/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:42:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:42:53 +0000
Message-ID: <d3c9675c-fd8d-4e10-99a3-65ce4b1a57a8@intel.com>
Date: Wed, 6 May 2026 14:12:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sebinraj, S" <s.sebinraj@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
 <PH7PR11MB60536B8BEC7BF3E2556A3E30E73F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <PH7PR11MB60536B8BEC7BF3E2556A3E30E73F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e3c449-3c44-42d9-a383-08deab4b7687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: X9chrUHQbMREf3fNWIzujTHoxM5jasJk59zSkIcHHln0P5N2+cVVN9dQE8BgaMAAySJ7lQy1hbbZ2/khBBalzWLuHCA9kozA+YSwpRICfsV11hHrs9sRFFuI0UnMGiqc8uqd827w0f74LDECdSG9fS9ccWN9LDYL3Z0RnGfT0Ksv/NCz+dVYJXsv4vcuMEWlor1hYzWg3RUL3cdF9UlQlO0zfBpr0bqtYdo0OyeROLrxqe6GKXl6WLgO9CfM4IWQfAiSH6KbYTcbAvjpF/9WgDVj0zXim7iCiEpRwadUkZ3GhnQ2PLWm1n0iLRCV+kJOeYUluvRfGTGPLe8LNHYPo4lg4rU2nsZpzbfciOClbaMgSV5PV1v3uHvWi0syhlSpI+aCn+YrIlrkGVCNU4UKp7Yt/ITrKYxlW0OcCWJhvc+uuOjsmQr8YksJiNSmLJ8ubgFf/Vv9dqnDehVQ+tTlqMApayiSXj9Dt4do0tz5uzd1ZxvYyaSy/95ihXHOiyGQH/3dN1DcnlwE47mLI6h8lNgUA2qblJpfRgLtS9qZtTB9JKRqIPDMv7+XVW9w0yAOSQmKdlpjNtHQobXcfhzav7m72crHnl7XpNQlJ88zTaaMG5RA2RMnSXjr4zLB33AfjOas2Tz+tPVEbCoT1FIrDeUL6G2qP36tIEhOIn/nQvNwBJS2B1DhCSI9phEzmLhx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjJUb1JzajBFSmhvSW9nUHlmQkF4dWh4YTZuVUhabFVZU3pTd3lOaGIraXM2?=
 =?utf-8?B?SVp6QlJnbnBycFBrbS9jN0tQZHJBYktnM3pnWDQ0Wk5ieWIzWEJud2R1NXFF?=
 =?utf-8?B?UjFzQm1BUGxwcW10MVZUYUZxRFVGREVMNEJGa1BTZlczSFNWZzBsRWwrSUUy?=
 =?utf-8?B?NDBxRFRCMWdxSXlCWk14MG12cTNXSHFYLyt6SktibGs2djhoK2dkc0hxdXc0?=
 =?utf-8?B?QlZqM1NWVzBhWFJjMy9oTXdsMFJCUnZtWmd5aGNqRTVXSFAwek42OG5USDdH?=
 =?utf-8?B?Y2RYUFdCZU5FRnFydkg2UzZPRlNSTUpGaGFNVnFSNmsyeVF6V2FvbjUycXh4?=
 =?utf-8?B?VmJtZC81MGM1Z3VObllkaXZUbS9oTFE1bWFub3NqTDhLb25Denk0WmsyV2xp?=
 =?utf-8?B?bzdlVkpUOTB3QjFKRlkzY2xKUWlQTHZJQTNieVlYaGtjVTZhZGpzNGhEaTJU?=
 =?utf-8?B?SDBYVmxYQTNoSnQzME5Qd1ZwSjlmZzlJVFowUXprRG0rNUVLa09VYXV0TWx4?=
 =?utf-8?B?eFB0VHhTZFYrZHdiSVlrSXdrZGRob1B0S0ZtZVlEbXYxemttUjBrOUlyRzA1?=
 =?utf-8?B?ejF6M3Eyd2hNUXkyTWRqWDdKandRY05ZMW5vMENqOTA4bms1OEdUcUZveVM3?=
 =?utf-8?B?VE5vTmV1ZHVRd2RJMFF0cmwwS1JEa21PbFRlSk02UkRmTG9iOHVxUHpzaVFO?=
 =?utf-8?B?R212Q0d5YzVQcGR4bE5rdjB5K0lWU1RaVHN5N3VITE5QdTBDY1p6N3lCeHFB?=
 =?utf-8?B?VitYYmNDWHRpay82OWhPRjhsdDlpUTBtSDhqcFdtUTJ3TkVUTzJJRlBQallr?=
 =?utf-8?B?MEY2U2RKV2IzaUczcmFMRDZJYmZVakJRWXdRdWdxR0JDekVKMWg5ME5rQWVB?=
 =?utf-8?B?VU5GWTlTMWs1ajN0aytlWko4UnI4MExSWlNzTHdWUjAxTVZMYjZkOExBQWhW?=
 =?utf-8?B?aVhHUjFvNkZvbDB6c3hHQk9LSkFYNlFNQ3ZIZjdpRW1NaHNJaEl1b2tYWUxD?=
 =?utf-8?B?Q1JDMDNNVmIyMVMwaVZvYyt3dC9KSDc5NTg1L3JnRkJDZFFtTFIrUzM2SElv?=
 =?utf-8?B?NHZYNTcySjhjcUMzbHVpSjBnK1hwK1pwbHVTSGV6alFNYm1EWkxOQ2N1Ymtr?=
 =?utf-8?B?L2Zxb0k4a3pSMmJONHYzaTduMHE4QmVJM1ZPMTk5VnJxaEtoS2E3amg5cmp0?=
 =?utf-8?B?Vjd6RXIwQlRXOUtOZmRnVGJGakdaUkZMNXpOZTNxUHJXQURsSjNrTEkvWVU2?=
 =?utf-8?B?YTBtclZmWkJvMGl2SkJEVUdIVEVYRUNncmkva0VzMHpTQUpMS1RCSVhsWU1Y?=
 =?utf-8?B?YWcvbjg5djhGV1U3bmVlbG4rUkFvNktjWFVaMzgzazdOYkRnR2oyb3BZbTI3?=
 =?utf-8?B?R08rNjNQTU9mYjZiQnRKaHJnaWI5dW91RS8yWEtGb3JzZkxUOU5lM0Q5cVpG?=
 =?utf-8?B?WklsK1g4K210bVNNTnlIYVFMWXVzZFRGS2tvaXN3WlEyY1pvWThYQzIzamo2?=
 =?utf-8?B?RG1vYWxRYzNSWnhDZnBXUGk1ZXhyMzduZUJpdlNtL1hOMWZoY3UwT3BOdjFG?=
 =?utf-8?B?bXN4ZitIK1FOTEZERjF1aEhZS2w4bDNmTEtKTXdtakF4WWlxYkI3NjBDaW1h?=
 =?utf-8?B?dk1qRjh1ZWtCMGFZbW82a056b1FmaTQxbDhLWkUxcVZtL25mYlQySTM4QVNw?=
 =?utf-8?B?MnBoVkZBa2kxSHVSb3Q0cnNwZnFWWExmdUhyVWtaMDFZS0ZoNFpMamk5eGxy?=
 =?utf-8?B?ZWNaOG9XWktsa0R5QUZYa2ZkR0h5M2k2UTVQQ1d4WnBmVzVDUnMyNk5TQ2ll?=
 =?utf-8?B?dzVYSEhKRm9kSmxuanY2K1Rhc0JITUVLNTNlT1dya2NjcW9veGgyUW0vN3pH?=
 =?utf-8?B?bSsra0FPa2RzNFhBU0xvcXdTSmRNY0ZaRjhPUW5rN3dpM2hLcG5LdFQwanJz?=
 =?utf-8?B?TWU4SGVnaHVsTksxN1FxSS9aRGdIZFc0WmY0Sllha2d4b0ZrUXN3N0IyVm0z?=
 =?utf-8?B?M2FHaTM2WmNVd2ZndFRyU2ZOekNKUzBBbUgyQStrMmRlSU9Rd3VEbzNRQXdP?=
 =?utf-8?B?a0FiUkVzSDFIQytqZ0pHaEMvbVZSUTBIWXZRZ0dUZzBmeGxldWtqWHMxZnNI?=
 =?utf-8?B?RmZCaDZSQ05NMnpIV215S01vNU1Xc0NvZzVIdVBzWGl6bWZBcUlTZzRZUTAr?=
 =?utf-8?B?MFdFVlV3cGx2ZThkUU0zMFFkcHh0T1hTbXRYejc0UlVIOVl4S0VQelNxTjZw?=
 =?utf-8?B?QVZvWGtFcEhWQnd6M2Q0RHRsbVV1UFg2ZVlCaXR5N0h0a1dKVVJtS1IrQ3cz?=
 =?utf-8?B?bE1rNE9IZ3JEczhuRmcwYWtVS3JJOGt4bEVBcUdQU0d4Lzd5emVrUT09?=
X-Exchange-RoutingPolicyChecked: YD0k8o+f/JaSDqssTAOHNCPrIeKbpxFWSs27aFhiPXJJ+lnuTBEn8r425/iW72Mu4UktC0FFzdREUptwgjAtXkL+PX4mjuX8nIbl3RZ6A6Shsm1rH26ClQi6kZuGl+UuIi50EFO8Yq6Gp/25NYlX4pB080m0USh+1y1HmFrDar2Sym0P4sJGv7weo/2MfpiCRQWpo9NRhWcOfvgTOpZEXrlOJvMuN4gk6JjDW6s+tuUjoS1zOvJVBhGuussfr9RudMw95kQdkXFom0LYM1E7IGDcwdEAJKAxrNzzGQqj4m769URPpWArVcqNUYxDfn2DHp8QDpzGNwGXlrD2M/IEMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e3c449-3c44-42d9-a383-08deab4b7687
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:42:53.3917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLibH9uAhAHwg1fEb1hNSovBKoBOm1r8A++rktcK5yQnGoeN6ATKfPCKkK9V/XOolQghJ3ZQ+HTEkVJYuPx3jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

Hi Pranay,

On 5/6/2026 10:08 AM, Samala, Pranay wrote:
> Hi Karthik,
>
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Monday, May 4, 2026 11:15 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik
>> <karthik.b.s@intel.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, Krzysztof
>> <krzysztof.karas@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
>> waits on test failures
>>
>> Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
>> commit and install an exit handler to signal any still-unsignaled fences.
>> This prevents cleanup hangs when an assertion fires after commit submission
>> but before the test signals the blocking fence.
>>
>> Cc: S Sebinraj <s.sebinraj@intel.com>
>> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_explicit_fence.c | 58
>> ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c index
>> 2ec9bf39d..7ffdcb285 100644
>> --- a/tests/kms_explicit_fence.c
>> +++ b/tests/kms_explicit_fence.c
>> @@ -68,6 +68,42 @@ typedef struct {
>>   	igt_pipe_crc_t *pipe_crc;
>>   } data_t;
>>
>> +/*
>> + * State tracked across the lifetime of an in-flight atomic commit that
>> +has
>> + * IN_FENCEs attached. The exit handler uses this to unblock any
>> +pending
>> + * commit if an assert hits between the commit and the point where
>> + * the test would otherwise signal the unsignaled fence(s).
>> + */
>> +static struct {
>> +	int timelines[NUM_PLANES];
>> +	bool needs_signal[NUM_PLANES];
>> +	bool active;
>> +} pending_fence_state = {
>> +	.timelines = { -1, -1, -1 },
>> +};
>> +
>> +static void signal_pending_fences(int sig) {
>> +	if (!pending_fence_state.active)
>> +		return;
>> +
>> +	for (int i = 0; i < NUM_PLANES; i++) {
>> +		if (pending_fence_state.timelines[i] < 0)
>> +			continue;
>> +
>> +		if (pending_fence_state.needs_signal[i]) {
>> +			/*
>> +			 * Best-effort: advance the timeline so the kernel
>> +			 * stops waiting on this IN_FENCE.
>> +			 */
>> +
>> 	sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
>> +			pending_fence_state.needs_signal[i] = false;
>> +		}
>> +	}
>> +
>> +	pending_fence_state.active = false;
>> +}
>> +
>>   static void setup_output(data_t *data)
>>   {
>>   	igt_display_t *display = &data->display; @@ -242,8 +278,14 @@
>> static void multiplane_atomic_fence_wait(data_t *data)
>>
>>   		/* Attach IN_FENCE_FD to plane */
>>   		igt_plane_set_fence_fd(planes[i], fences[i]);
>> +
>> +		pending_fence_state.timelines[i] = timelines[i];
>> +		pending_fence_state.needs_signal[i] = !should_signal[i];
>>   	}
>>
>> +	/* Arm the exit handler before the NONBLOCK commit goes out. */
>> +	pending_fence_state.active = true;
>> +
>>   	/* Swap overlay colors to detect scanout changes via CRC */
>>   	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
>>   	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X,
>> OVERLAY1_POS_Y); @@ -299,6 +341,7 @@ static void
>> multiplane_atomic_fence_wait(data_t *data)
>>   	igt_assert_crc_equal(&crc_before, &crc_after);
>>
>>   	/* Now signal the blocking fence (overlay2) */
>> +	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
>>   	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>>
>>   	/* Wait for overlay2 fence to be signaled */ @@ -311,6 +354,12 @@
>> static void multiplane_atomic_fence_wait(data_t *data)
>>   	igt_assert_eq(ret, 0);
>>   	igt_assert_eq(sync_fence_status(out_fence), 1);
>>
>> +	/*
>> +	 * The pending atomic commit has now completed, so the exit
>> handler
>> +	 * no longer needs to rescue it.
>> +	 */
>> +	pending_fence_state.active = false;
>> +
> pending_fence_state.timelines[] retains stale fds after use. Consider resetting them to -1 in signal_pending_fences() after signaling, to avoid accidentally operating on a reused fd in edge cases.

Thank you for the review.

Agreed, will add this in v2.

Thanks and Regards,
Karthik.B.S
>
> Regards,
> Pranay
>
>>   	/* Verify display has now updated (CRC should differ from baseline)
>> */
>>   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
>>
>> @@ -353,6 +402,13 @@ int igt_main()
>>
>>   		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc-
>>> crtc_index,
>> IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +		/*
>> +		 * Make sure that on any failure mid-test, any unsignaled
>> +		 * IN_FENCE that the kernel is still waiting on gets
>> +		 * signaled so cleanup can complete instead of hanging.
>> +		 */
>> +		igt_install_exit_handler(signal_pending_fences);
>>   	}
>>
>>   	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay)
>> "
>> @@ -363,6 +419,8 @@ int igt_main()
>>   		multiplane_atomic_fence_wait(&data);
>>
>>   	igt_fixture() {
>> +		signal_pending_fences(0);
>> +
>>   		reset_display_state(&data);
>>   		igt_pipe_crc_free(data.pipe_crc);
>>   		cleanup_crtc(&data);
>> --
>> 2.43.0
