Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655EDFF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 03:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A272810E0A9;
	Mon, 27 Apr 2026 03:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHqlm3VN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3410E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 03:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777261413; x=1808797413;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ou7COhJINucK/2H8JdgvgDL4wU1Hk96F5xxHuYBuvJQ=;
 b=PHqlm3VNrrrrGwTWFPo5vakdPhsiJM5tiqMHIA2mkHX2l1F1XrM8Im0e
 jH2HL44K2X5dRRDD59kuGZrSdcqAaX6BEEJGGTXwfsO62/h9wgJABCmfT
 55wNrRarYLIV4EOvbmQvoN3eFnFNCE663UB8tdtet5h0E9jYc31hs1aIT
 G1ILhPMpfktaxATzqVs2jRdlcIaveSC9ZV08qgQ3VSX7XG6dQBEwR/7Xn
 YqRZ7BniehBKHB9yIMPXqLj49am+WKATFaloFSqPRsDm60czFy3hp2lYI
 CzRZm22xXMYecp9KgrF5yjY+gvLx8Y0PP7+oFfJQR0XhH4wHjetxicebS A==;
X-CSE-ConnectionGUID: rgz5cHeSSyKCCKv5ozkHTg==
X-CSE-MsgGUID: g6+aTD6OTxaV1V/4uBmaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="103604982"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="103604982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 20:43:33 -0700
X-CSE-ConnectionGUID: uKooNaZLTwqe0rTNmZhleA==
X-CSE-MsgGUID: vNGHhG9rTt6EghF25IOnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="237480875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 20:43:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 20:43:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 20:43:32 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 20:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LptvanP+t+hFgv9JvX5g26KUD1kobOflWdrzU/kdzxIBCgt3FlTiwgahcrupVxsClGZMORwskyVPZUj7bdp7achjHC612l4NN/kaQVKx4NdkzEsTHYTsve2gbCVYmAA645I6rzhVwz7xxPJHSFu8mBYxBfd1s0iV9/TD3CQi3iMLlSDld1/GgTOlSZF0GRhdgLDHjk7J1XxMsjQ+Te6Pv/WMEKuiNsFpC/QcT9ncFM6woE7RXgDUkZ65k3dCkqF0nR9hb115PMIlrR5724t16GGN5YtYZuNmP1K4dElZD998OESj7LGpdqN16F/hi4amcpsesismJdLFhSO467aQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yagcfvGZ9T8c5AisQ8vIarL//W+TCevVWldbSE7vbR4=;
 b=GrsRPUjA8pcAd8IrFV63tHdmyAe3Z+dP1qNT8pGa2Yqby34eFmhoVXVTP3Fs4zvNlvFl7HeuNuejtFZSzLeFMs23aUdWnU5R7Afim+FP5xR4CRtoosh+wJ6wFHxwKKR32EowVBrU/WGyz/H4lIf0QBnQD4LdGSczPySd7mxxRLyc0Vd6NHtMX3q/ZYnzQjqANv57WIpc9L+bUqZS1oZegVZ1iAA/w3afoBOnleSBtW95EKjR6eBmKK8cltcL5IBfqUDkicHS214uLBwvlUkqPbDdoV8nikrzOo3xwkFkaKQ5G7tKNaoJ6BMm/iPtPrib4TaqpUJfEPzAatrg8IiOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Mon, 27 Apr
 2026 03:43:29 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 03:43:28 +0000
Message-ID: <1ed711c4-02da-4917-a8f2-ed4b55b2841e@intel.com>
Date: Mon, 27 Apr 2026 09:13:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/5] tests/prime_udl: Rename into i915_prime_udl
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
 <20260422154423.141908-6-kamil.konieczny@linux.intel.com>
 <664a9c92-c7eb-4c9f-8bc9-774afae310b3@intel.com>
 <20260424124721.kvdk57tnuczrwpvt@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260424124721.kvdk57tnuczrwpvt@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: aca7754f-72c9-449e-91bc-08dea40f24d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Uaqnr85hF4pMRnUx8vn0w+jGsVYraxpTk8Ua2RiIpO2WLS+11H3hPYVjZUX2xAYi59OqcNRtvCBOweKde7ZtqzgKfOzOEKyE8Lt7JBUKNWr4fb0ohkE3IJIMsoTlyGu/nVYQqwKEjY89dfiIOuowWg/+raOyFOWgAl9yWnKiDBYpTHlytxpqjS6QgzsfLrDbkIFxaADTGQ9+2e5crddWantjMVFTQgM5g9Y9rYyEo/CzsByYPZqx53A9bn6bG3PYOFSkw0YlmL8J7vvG/SR0OywLFoEWLHbvGB3QN0ZggwGwFHNrNStWdpu4RhwenP0pnyKlfXDzjTEk8cnG5L1UiwRW6OsjHSV7ydpk8zzkFsI/cHTaiSzcOSGs4QLTKXCLfFt5WQvmN/lLdC+2Rko84IPW+sSHIMr8KtgcGfnWLFUFDRsPNmJLUdIjq9Gtvk59lOXTIO7AyHda00gaZP7K0bbf9ph1SVRh7f44Vl5Wh5VUQEFAi3z71CeyCiXOpPlgnlHCvBrcSXutmL0T1I/wvm6VOe17S5mVxA+Xf2Ah5ufSxTK70Rka+pkL6J+mrYS8toZ6AT+2rO1YhpfUTTKq08erL9nnvDkN4X+jU/LuvRSUst5H+SwTKtRVVlapumeA/lqAj/8kG7JX+JURpTBl/OkXeSHcJAVp4wSG+eisDvqPbmXzrdn1J0z8Usp8ahTI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFXRTFaeXhhbDBRSnB0VjNJVFZtTldWdDNmRTNXSFc3a1BqNUMrNGVGemp1?=
 =?utf-8?B?MjZJYkNLd2hoVmZZWlgwNThBM0kvVlNPbytyU3FseHFQdWZNd1dTMUR5RWpy?=
 =?utf-8?B?SmlFZ1g1T05YbTJqSkRXWVNaeDZmNkxuMXdqN1RyYkdMR1ZCTjdQelQ0a1dx?=
 =?utf-8?B?OS9KZGh1YXVOSytkM282VkRKQjhjTHlrMUY2MWk5dUtDWEw2dWhjZzM3b1hq?=
 =?utf-8?B?UUh6Q3VycktKM0U2amJoYVBFVE5BK0hYNkVodWp6VEJnS1k0bDlqbzEzV3hs?=
 =?utf-8?B?SXVIdm9VTVZyaVNPYTJLVk1BbHAwbGY1bXR6SWk1cXlJamhmNGV0eW81UEJo?=
 =?utf-8?B?OUFQdU1SWDFqQ0hQdzRVc28wVERSNXQ2Qnd6WWxQemdkaG5oWkxRZWVQS2FB?=
 =?utf-8?B?aGtjeGNvVTNvV3RxcFE0NUJPZkV5K3Y3V0I3RklQb0E0UmUvRzBXVEdEYXho?=
 =?utf-8?B?VmMzMTJGSC9oWml3cUJvNURvQnc5NlFPZndjUzlYcko4YkpWSTNjU0puNkF3?=
 =?utf-8?B?MXFEZ0J6bk1obG9xOWNreUVKelNObmxqSnZqeHN3NkhCR0t0NjN3MVROZWJ4?=
 =?utf-8?B?S0gxY2Z2a2pKTXhXYjBvU1ZiUXp4NnhkYkZLTFJoaXJjcFE1Y0NDczRMN1ls?=
 =?utf-8?B?RFQxeEtSaDVaSHFRTittcHl5Y0UzTmJwOFVHZ05oR1dHclRXN1hXM2Z5L1Zq?=
 =?utf-8?B?NExWNG9Ga0ZERUViYVRaMEdIZ0tXVGJsQkFyeWNjK1dreUlSajJEVnB1cnhX?=
 =?utf-8?B?akwvOTJ0Mm1Nb2JCZXNBbHlML0dDdnViQUJYQ2R6cGJDQk5nblFMbHBlczdk?=
 =?utf-8?B?ZStrMGQzeUU1OU9IQ2Z2RlgwNDdJWUVQd1I5T2FGYjJLMkdFWFdIUFNueFI1?=
 =?utf-8?B?R3ZTL2d1OVBKS3lYT3JubjkrYnd3Y1hPazJETWJra3NYSGNwQS9wRzI0NHFa?=
 =?utf-8?B?Q0R5T25IelVlNm15VWliUW1FRFBGNTJWdU45OUNXaURIbi9Ydm9xUnV1UXhr?=
 =?utf-8?B?eS9xaHp1bHJ2azhmSG90eWR0blV6eStBZmh5RzlESTJucjlCdUhGMGVpT0Vt?=
 =?utf-8?B?L0plVXl6SnIxbCsvQ2JKejZVZU1wN3pYektFUWZlKyszRDRtN0k0QWl0eE1h?=
 =?utf-8?B?TExuVFBwa3BlY1kvcU5oNEI4YmxDaGJhVmVnZktOY09JWmdYbk9TMWQzaWYx?=
 =?utf-8?B?Uzc0M3ZCSDVsYktxKy85T2Q3emwrYm93RE13bEMrdW1FQ2ZuNU95WjNockFN?=
 =?utf-8?B?MENQSUYwUW1CVlFFNThCSi9iTXQ3WEE0OHNmU0VzR2VYZEZYczlOd1V2dC9a?=
 =?utf-8?B?bXl3d0xsV3pXbEF2TXpwZ0t5NG9mWll0bHZadm1obFROcXFxU1gzUldsVzA2?=
 =?utf-8?B?MXd6blA0WEZ6TXI3VzhtUmpPV1FhQ21ScWttR0FpODNaM0xoMW9CRU1naElE?=
 =?utf-8?B?NVYwQWdmV040cHowUXpLTFh5Tkw3RlRXanByU3RvTDZpdDllbGZ3dWM0V01p?=
 =?utf-8?B?UkhBeEJOL005TjRqb3B2dDBPZEtjUnV3eUovdmsyTSsrdlp5K2FpRXVTRHBS?=
 =?utf-8?B?aVlMOVcwa0xSL0FULzJ1K0FHT2w3a0xzcFJoby9qZ1M4bS84SXNXTk15WDdu?=
 =?utf-8?B?b0Vwb3prYk9NUENDbmZiUFFIQ0NVTllTSE5PdU9vMy9yWEdxTzdkaFZGN3lM?=
 =?utf-8?B?UXgzc2llVmZRS0E3Wm01OW9NbVFUUXVCRTVCS056WTJocjZjZVh0Mk1TVXRH?=
 =?utf-8?B?WDBjK3NrSFlVOGJJZzJVSlY2VkxqcktDTldxTHM2ZU5QbmFVTkxXZVRUQWl6?=
 =?utf-8?B?YTUyV0g5bVZXZldJT1JBSHV5ek5pdGpNMGhLcHROMGtaMFlIQXIxc2xzRWdW?=
 =?utf-8?B?WGVxQ1ZVY2lreE1hZ2FFVmlqczZwOG5pUXdYeFRUSVM1cUgranQxQUUyOHdE?=
 =?utf-8?B?NjlyRFRsZkZnenNlZTY0bWhQb2pyRzhFUmdoV0tPYWNnSXdNVHVueU1nWU1o?=
 =?utf-8?B?NDhvOTZ3Tm9HQVB0MzhkdUZWUW5sVmNsWFNPcnVjbTZQeDE0R0dRNWsvMXlJ?=
 =?utf-8?B?NjNUYng0SVBic3BDbUNIWjVPM0lWdkVpTThKYWxzZkk4STBFRFlnQ3R5K3Jt?=
 =?utf-8?B?RWp5czJkVVFJTlpYVGJka0tEc2ZBQ25BQWNyaGpWeTl3N1lEV3paVnlLNXEx?=
 =?utf-8?B?S1pjYVAwWmlpV01FM0ZJdllWSmx1ejZGQlJoa0ZDcUhPTEVOcnFrVXdHamVy?=
 =?utf-8?B?bkFBbG9MVlZPUlFvdkRpa1p2TCtDMnJFSy9nbjYxUHp4MUptYy9ETTF6bmpW?=
 =?utf-8?B?RXJDUjZ5MmtZWEVSdmw4VGhPQXFIV0pVNVlycTdvUE41RVhsOHZsdz09?=
X-Exchange-RoutingPolicyChecked: b7tYwCaiXYd722qBMf/jkRsMM74YviheoFuWbYXrncz4VHrvUe1yD19TdMwQLrzyRU4UwhrKMRkR0bea3ExAz2jlGzzJzPX+3xP1wbgqxcoKKAU3vQAfBksObAsTw6q+N/SwBV0d3/ssgAykkzrQ9Ea4kk6IRyuuWPITjoNeKLK+VQKGujw3U5ljOSVs3M+PFShiGLRaBR5GgCpqNk7HlBF6Rm8BE6s2yhjJ+OIyqtS44LURm/2YEFhlNauo5r09CQTz+MjxAy3Rdi037ldcFYOOST2LCM0yuP9FMJuzn/gCD3HHSa7wTo8uOtgUvKf0o1QAH0q5TpIl6PD7PRf+BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aca7754f-72c9-449e-91bc-08dea40f24d6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 03:43:28.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4siduLiI9vJZ4ZNKWXh1Vr6QOuU8J32bmTfRZ2iN+YMYGELIc/rdFYLVCnz+A4o7u8BV/PSuBesNYOBNJXs2bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

Hi Kamil,

On 4/24/2026 6:17 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2026-04-23 at 15:59:02 +0530, Karthik B S wrote:
>> Hi Kamil,
>>
>> On 4/22/2026 9:14 PM, Kamil Konieczny wrote:
>>> This is an i915 test so rename it and move it to tests/intel/.
>>> Add documentation so build will not become broken.
>>>
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Suggested-by: Karthik B S <karthik.b.s@intel.com>
>>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> ---
>>>    tests/{prime_udl.c => intel/i915_prime_udl.c} | 17 +++++++++++++++++
>>>    tests/meson.build                             |  2 +-
>>>    2 files changed, 18 insertions(+), 1 deletion(-)
>>>    rename tests/{prime_udl.c => intel/i915_prime_udl.c} (88%)
>>>
>>> diff --git a/tests/prime_udl.c b/tests/intel/i915_prime_udl.c
>>> similarity index 88%
>>> rename from tests/prime_udl.c
>>> rename to tests/intel/i915_prime_udl.c
>>> index db83152fc..0f2dd50c0 100644
>>> --- a/tests/prime_udl.c
>>> +++ b/tests/intel/i915_prime_udl.c
>>> @@ -13,6 +13,23 @@
>>>    #include "i915/gem_create.h"
>>> +/**
>>> + * TEST: i915 prime udl
>>> + * Category: Display
>> Since this is display test, could it be name kms_*?
> Or should I just keep name intact? There is already
> a line in xe.blocklist for igt@prime_.*
> so no rename, only moveing it into tests/intel/
> should be enough. Also, there are no kms tests in meson i915
> progs, and this kms_* change will also require additional
> change in xe.blocklist. What you think?

This should be fine, as anyway we are calling it it out as display test 
in 'Mega feature' as well. Works for me.

Regards,
Karthik.B.S
>
>>> + * Description: Basic set of prime tests between Intel and DisplayLink.
>>> + * Driver requirement: i915
>>> + * Mega feature: General Display Features
>>> + * Sub-category: Memory management tests
>>> + * Functionality: prime import/export
>>> + * Test category: GEM_Legacy
>>> + * Feature: prime
>> And then we could only keep upto Mega feature as other fields aren't used
>> for display.
> Thank you, I will change it.
>
> Regards,
> Kamil
>
>> https://patchwork.freedesktop.org/patch/636176/?series=144584&rev=1
>>
>> Regards,
>> Karthik.B.S
>>> + *
>>> + * SUBTEST: share-import
>>> + *
>>> + * SUBTEST: share-import-addfb
>>> + *
>>> + */
>>> +
>>>    IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
>>>    int intel_fd = -1, udl_fd = -1;
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 4c1a39e9e..196fff8ca 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -72,7 +72,6 @@ test_progs = [
>>>    	'kms_vrr',
>>>    	'kms_writeback',
>>>    	'meta_test',
>>> -	'prime_udl',
>>>    	'prime_vgem',
>>>    	'sriov_basic',
>>>    	'syncobj_basic',
>>> @@ -231,6 +230,7 @@ intel_i915_progs = [
>>>    	'i915_pm_rps',
>>>    	'i915_pm_sseu',
>>>    	'i915_power',
>>> +	'i915_prime_udl',
>>>    	'i915_query',
>>>    	'i915_selftest',
>>>    	'i915_suspend',
