Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A2EC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7B89067;
	Tue, 25 Aug 2026 04:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POjJg+TI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650A389067
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 04:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787633464; x=1819169464;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LM0mcw9y5+qHOMi0WrjNW0sPoBhfkkHu9ySOfwvK5/4=;
 b=POjJg+TIQ6bz1BVyYKnW2BaAlCp0dG7gxELM9KKeL7fpWMcph1r2frOw
 y7r/qLCfQmt71KzV/PhnuTTU1FSqAv4PTB3ENQ3s9qr9cc0vxYtZUMGb9
 FTZSBteoEG9nVi+iB9YaYYw/jiJ3zx8Ee36h2GPsnDhrlEuGsJOukKo5o
 0jledbWsl+cuFS0nN9vqLS22fQUYBfjG5lp18nQsNO5C9ea4Ux03goDdO
 MeNlqOsSfgCkcm1wzaCgIKBpYkW9BVvM5s9XyecMM8Tf4BYVdjETk1pL+
 iO4LECGGdwZEoVm1oiyKCDYdJunHalwMF8TFzySOpUrc+G8H489AzKqjR w==;
X-CSE-ConnectionGUID: amzdVzQ2SimZIY1N5A+X7w==
X-CSE-MsgGUID: oCDU4dirRCCf4oXj72nQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98767608"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="98767608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:51:04 -0700
X-CSE-ConnectionGUID: U+gzwSBQR6C4AXe9MbWY0A==
X-CSE-MsgGUID: Pbgk13FLTY2dZuoFz452Pw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:51:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 21:51:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 21:51:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 21:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYyc2dAEDJO0NLGqdBcbmXjtuxvMpx/05uX3YrEkN0iDpg4iNaHY1t+Vv/KpwfmNihwONgFIcQ5gPw8uMbPsTZSWy+d8AHbUxN8i8rii1d0NxZeeTtAPKMQdZcso5aJU86bCNoAf09gIb1KZkIu5xihM3A1IAUIWG2ec3TXyrn2SuB3sWa/PYbpxRJHqROUSrhoK0aVIRXI4euttWL0BGiJ4seczwFdLh7esBS7ibtf31qtXioUflbpmeAgu2KG2uLyX5RuSMHNnjrFJQ09Ybh93gvgDx5nnhdPZhZPSZrmH3xF66Aeid/fjzUfVLomp40pehy585z08yDoNrpvmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb7aOfbFZh6xNJpvJi10VtIueIF2zTTr3mMysYgbHtU=;
 b=fyL/wMv5zJ552epEn9TBGz39mImma6ewMxHU23W0WoeceIvZfKguXhA4qildpGL1c0vZsqmbmY73kzVsE6hpHU5ISx7xLE9OyhH1I3lsPNp9oo2ndIBou4tw1qrPevrS/6K846NJfHbMcLeKAsEf7NeQPpMSS02N00XmZrKTXzH+VkIeQr4uEenbWiSmS4+mHkGf0ShjcndGQoQiByISZSyALj9yaqYlG/z6aWzkGXw1sAqCWXvS00wt72ciLMgttOG5N0dvVQIS35oRqLVNgalYmC6dsrnnb3xXc1BIFTBWivcD8Lfj2IOkLNbUcANPSgt1fAGQ0XxUt9qAZICuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:51:01 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:51:01 +0000
Message-ID: <20362f4b-dd10-443f-aa18-f83776079690@intel.com>
Date: Tue, 25 Aug 2026 10:20:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-2-ramanaidu.naladala@intel.com>
 <IA1PR11MB63484C2CD1A2927C2ED964FDB2A52@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <IA1PR11MB63484C2CD1A2927C2ED964FDB2A52@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0162.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::17) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7b177e-d9cf-4f85-3e51-08df0264763c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0X/ejLUu14s/kqtoYcA0FQMBZrg9DRAluuOHbhmfgNx8OM2ev2XxCZ8+/rjTjaw2NG3H7QKZ+lSG/BFnYuQ/wxdLz02U11JQDCzbLWAE7Go3o2qrrcMTedndSvCVX3qwDyONNdzlljzYinvcCOwZTMNTX1yEAlHj1weNDlj/wgBpozl9U5Qr7dRekgdf0DND+E5ti71SkGkzlhLMGUCp2hcO6LTxU/2rGKosxJSW8cjI7lLm4GBO5YFV6iqbtdHUVWnutuleAqJgPaG17iJ0ux7dOwlojjuGea7XwK1bjMpWT6B3/zKZvshPZArZV2CMbUon4XkXf0ZjqL/vP4grLkqkjwSnUVELS8LJ4DXjPhwycr4d1IRZw4uUw+A47zoPoUFcH3dPXbss/NDwIgJ9iJoqDQEUau7zPIPmYatveQwijwxvqA0lTlTzhc2K9C/ak+9G0saIh15rXv4fTg7gD0JUyuRUY0sX411sxiE+bhbyw0LDqd7ZrlJuYuIafCpNhJ+CRi3AeHRzMIOM8r8LVSjybAIicEkqwDHrPI89sa8JIzyrPjs/pZsSyk+Rf+kaWq3Zb1QkrMKW2p+GQlPYpeHGLeRTwTFHufluXyEAvJa99Y9rjn8uN4xHPgyFLXx8ajhCHn5TyNgXvaDc4uGzDxo1c6Wcqec3OBLiynBkoWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejhlbVB6ZnpIc0NETEE0MHdvMXlkQzFvSHk5bjMrYndBZzVNZVNrNDM2R1lX?=
 =?utf-8?B?YndTK3FRQjI1Y21YYjl1NktYYjlXdHJNeW9hWkxHTmM1QkdjWDB2bnlseThB?=
 =?utf-8?B?WUJwODNGaG5FdDNqME5JaGRLTThJQ2hieWIyM0hZUGZYVzl1TGJ0cHRONDNP?=
 =?utf-8?B?aWRsODVKMnlYL2hRN1lWM3orNmZiSCtNN1hOWkdUdFI1bTAwVVdwWnFENnZh?=
 =?utf-8?B?Wkk2aTZ5RDhtMW1LMlpGcTVnWExXcUdrcisvdWJKMVFxcmluZVFlZ0R4SzNw?=
 =?utf-8?B?NTFWT1NwQmpkdDMzbTdya0JwelA4KzFrVlF5b0tHMkx6WUVpQ3BGeVNTWExk?=
 =?utf-8?B?MEQwYm1Jdmxsb1dIVWYwYkQ2L3YwUm9qamQvbmsxYzBOYmp1eURrd2tRN3Uz?=
 =?utf-8?B?R2JXKy80aXNvR1JZNm9La2YyU0ZSWlB6TXl6aWVqMDlBZWVyTDZyZlI5QlB6?=
 =?utf-8?B?NnlNaWdQbFJtd0l0dWxYaVNVRlB5Qyt1VEh1NVI5UWl0TFBRV0VqdjNhSGdI?=
 =?utf-8?B?OHVlQXhwdE5mWGZUR1dhS0hEUnIydThCTGZLbEI0cTNIQ2pGbGw1SjdEZFcr?=
 =?utf-8?B?cERaaWhVVlZWUnBVaUg1Z3NBZjMzWWt3VkI1NUpEZ3psZDJHdFBsWWpRTkho?=
 =?utf-8?B?TW05eTZOUVBPN281MnZQREExWEpsNFhuT3RrMEtZeC8xY0VQa2wrRVNBVEw3?=
 =?utf-8?B?TmErbW42SjhIdzl0TEdvdmtxeDhoS1JlRGNHbVdhUklWN1RuVVpzbmxXeWxi?=
 =?utf-8?B?NnNGais2bEhZdnF5Wnh2ZHh1RkxCcXV0UjJ0aWF6Z3Z5UEJYdmdDWG1LZlB1?=
 =?utf-8?B?Qmh6ZXVicHoyd0FPNitrajY2NUZtNkd3UVg1cFN5eDdQeGhoNnJkREpYVVdZ?=
 =?utf-8?B?WXNsOUVDK0FKOE8wYldLV1hZNTgrQTR6bHA2akNZM1A1STA5R2hyR3RCTTJa?=
 =?utf-8?B?L2htVVVESEFEUFBLSFo3ZkRBK3owVEd0QkJlUkFIU0JEQ29SeVliYVZqazRW?=
 =?utf-8?B?QXA2OWNBTUN4NUlnS1Y3YitoYXh6YytjQ000a0lFRGZUdTlEdCtENzRmZksr?=
 =?utf-8?B?L2Uzc3NoRWJGTWhaR0F5dGdSbUI3UHNuQ2ZNRnVRdW5DU0xpU0NjM21tVCtl?=
 =?utf-8?B?SDMzeTNJdjJNZURBc3BReEtsV093TUFEdVFTbGkwVTNLdFZJVUt3QnNEeTln?=
 =?utf-8?B?Q2J5Qkk1V1JjQklDSjRLcWlWenZwa0hrMlJ4NGUwYWljWTJVNHZPbXBMcXhK?=
 =?utf-8?B?WXg1QU1WM3JXaU1BVTViREt5eHZsRVVXTTNUb3RYZnlBK0pkdkUrWGNDaDNl?=
 =?utf-8?B?UExqUGRIbXl1QnNSTzhBTzNUWEdSRGI1eUo4bURqeE80NVo4VWtGL1FRTHZz?=
 =?utf-8?B?cytDWWpqQkUzb3Q5TUh3cEswS0ZEdDlXd0pmQTB0c2J3U3dzdk15ZDVuZ29i?=
 =?utf-8?B?b3h0cWthREMrNi9zVGV3b0lkNUsyM3pnUUFHOHBTWjhVaUNLcEZsQUF0bU1R?=
 =?utf-8?B?VFJYNzJQMHVzbUNzTlZXM1N2NDBRTWNQVm1CeWJVNmlzRWJ1UEhJdHF3QjFk?=
 =?utf-8?B?c3pYU2hUZ1VvNnJoVVA3dDJmb0l2MmRGd3g5S3JSSXR4TWdpSzJHdVFiWWsy?=
 =?utf-8?B?UHJtQUR5LzVnVnI0RDAvNmFpV1hMMFFiTC9LeS96ZklJbHEyeTh6Y25FeDM0?=
 =?utf-8?B?YkhJNk1qTzZCbzFwa1IyeTc4MGRRaEdLMjNSNXNsMDlYY05Oem80WHJSSndw?=
 =?utf-8?B?SDhaTDdMK2dXSlJLUjBydjVUZkIvSkxSbDlLL1Y2eU92WXoyc3JVdndyaFRF?=
 =?utf-8?B?YjdWdFdCaUkwMzRKK2U0cHgwRG9ubmpuNGJNMk9XRU1Nb0JkcW9lUk9rcllo?=
 =?utf-8?B?Z3J5UEtSYWoyUFE4YnNwQnoyWGowb3Z5djZWeWdzZ1lnZWVzRklwaGdpaHdX?=
 =?utf-8?B?V0lsK1hIcVVRTks3M0RNZ0NXc0V5eGpCZ0crREdiUzVZWFlyeUhQT29hS09X?=
 =?utf-8?B?UENjem1OYVNxekh5LzdHMzExaFhmMUx6Tk4zalVoVlUvazErbzlkOTc5Um5P?=
 =?utf-8?B?QkZsVTRWc2NoWU1mQjIwVEVPZWs4YnpUYjZ0SldEcHRFZzVjYVN1YzF6V1V4?=
 =?utf-8?B?amQ4dEk2cDIwRlAycnAycXR2dWZFbW9aRzFZcnNqcXNDeDZaOTRQNHZoV2xn?=
 =?utf-8?B?ZmMrQjZIc05ZNVF3Sk04aTFGaXJ3OUxjVjVianBDaFJQY1dTV0E4NXJZK2J6?=
 =?utf-8?B?aE9rcXMrb1B5TFVuYnNONnpmOHFMUllBdDV3cEJNdkZ1c0V5WVA3L3I4anB5?=
 =?utf-8?B?dldiVldRK1Z1bnI0bGpic2VmWnBiSmQ4eE9Hcm11ckdRMTJWdVVXYTFpRFhT?=
 =?utf-8?Q?dEhO3cj0355/tj/M=3D?=
X-Exchange-RoutingPolicyChecked: I2gX164gC3+V7F7KpZgFt3BFozSO3Yq2s8QPHlvQ6APw9ntsFTrF2zNDj0qkizUrqmREzxrKyVgxuBkd6uuVhSqtk9eQ/O6Tawp+TY3nfAmlthneJZUN0oK7SwDHXtt8mzrHzgX31yjoAk48smXlRrwf8tMjbiSoR5TXBMfdzLXWXRPerDYGq5meXfTbukS0FS19RDfH6XxT9IsU+Z8AlzR+16bHEvemBviPpPv0pfMEk/w0ba8jg47WHhpmhfslLufC+x+iYazI6/WNot/H/HSQEGu2hgPNuuVSarp4msqRoVeMkBSDoZL0Yc1O7QltT21YvIG8I7ielXDnJML9Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7b177e-d9cf-4f85-3e51-08df0264763c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:51:01.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK1f0np9b9qnqCsmzbhEEZdYb8fnoi+U9RFOMQccu2dwwPUUcACrPBZhYdJIVadXmrU22Neg2b6hGOzLyrjLeuuwla63df8Q6BdjnFillHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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

Hi Mitul,

Thanks for the review.

On 8/19/2026 9:33 PM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: 12 August 2026 18:38
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Golani,
>> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; Naladala,
>> Ramanaidu <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v4 1/2] lib/igt_vrr:Add VRR helper library for display
>> refresh rate testing
>>
>> Introduce a new helper library for Variable Refresh Rate (VRR).
>>
>> Add helpers to validate targeted refresh-rate testing.
>>
>> v2: Modify debugfs with helpers.
>> v3: Add helper to check cmrr support.
>>      Address review comments. (Mitul)
>>
> Please update change log, this helps reader to track what new changes are coming as part of this revision.
Sure. i will update this from next revision.
>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_vrr.h   |  44 ++++++++++++++
>>   lib/meson.build |   1 +
>>   3 files changed, 199 insertions(+)
>>   create mode 100644 lib/igt_vrr.c
>>   create mode 100644 lib/igt_vrr.h
>>
>> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c new file mode 100644 index
>> 000000000..704eaa3a3
>> --- /dev/null
>> +++ b/lib/igt_vrr.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <inttypes.h>
>> +
>> +#include "igt_vrr.h"
>> +#include "igt_sysfs.h"
>> +
>> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
>> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
>> +};
>> +
>> +const size_t igt_vrr_standard_video_timing_fps_count =
>> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
>> +
>> +/**
>> + * igt_target_rr_debugfs_write:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @vrefresh: Target refresh rate to program.
>> + * @numerator: Numerator component of the target refresh rate fraction.
>> + * @denominator: Denominator component of the target refresh rate
>> fraction.
>> + *
>> + * Write the target refresh rate configuration to the per-CRTC
>> + * VRR debugfs interface.
>> + *
>> + * Returns: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +			    uint32_t vrefresh,
>> +			    uint32_t numerator,
>> +			    uint32_t denominator)
>> +{
>> +	char buf[32];
>> +	int ret, dir;
>> +	uint64_t val;
>> +
>> +	val = vrefresh * numerator;
> Use val = (uint64_t)vrefresh * numerator; for safety even though current ranges don't overflow.
sure. i will fix this in next revision.
>
>> +
>> +	snprintf(buf, sizeof(buf), "%" PRIu64 "/%u",
>> +		 val, denominator);
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	igt_require_fd(dir);
>> +
>> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate",
>> +			      buf, sizeof(buf) - 1);
> write the actual string length, not a fixed size. buf is uninitialized stack, so this sends garbage bytes after the terminating NUL
> to the kernel. Please write strlen(buf) and assert against that.
>
> "size_t n = strlen(buf);
> ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, n);
> igt_assert_f(ret == n, "debugfs write failed\n");"
sure. i will fix this in next revision.
>
>> +	 close(dir);
>> +	 igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed"); }
>> +
>> +/**
>> + * igt_cmrr_debugfs_read:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Read the configured refresh rate from the per-CRTC VRR debugfs node.
>> + *
>> + * Return: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index) {
> The above doc block says igt_cmrr_debugfs_read but the function is igt_target_rr_debugfs_read.
sure. i will fix this in next revision.
>
>> +	char buf[32];
>> +	int ret, dir;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	igt_require_fd(dir);
>> +
>> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
>> +			     buf,  sizeof(buf) - 1);
>> +	close(dir);
>> +	igt_assert_f(ret >= 0,
>> +		     "Failed to read intel_vrr_target_refresh_rate.\n");
> The close(dir) and igt_assert_f(...) lines in the write helper use spaces; IGT uses tabs.
sure. i will fix this in next revision.
>
>> +
>> +	buf[ret] = '\0';
>> +
>> +	igt_info("vrr target RR: %s\n", buf);
>> +}
>> +
>> +/**
>> + * igt_vrr_mode_line_refresh_hz:
>> + * @mode: DRM display mode used for the calculation
>> + *
>> + * Compute the refresh rate directly from the mode timing parameters.
>> + *
>> + * Returns: Refresh rate in Hz as a floating-point value.
>> + */
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode) {
>> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal *
>> +(double)mode->vtotal); }
>> +
>> +/**
>> + * igt_vrr_get_mode_with_video_timing:
>> + * @output: Display output containing connector mode list
>> + * @fps: Requested integer refresh rate in Hz
>> + * @matched_mode: Returned mode that matches @fps
>> + *
>> + * Find and return a connector mode that matches the requested
>> + * video timing refresh rate in Hz.
>> + *
>> + * Returns: true when a mode is found, false otherwise  */
>> +
>> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
>> +					uint32_t fps,
>> +					drmModeModeInfo
>> *matched_mode)
>> +{
>> +	drmModeConnectorPtr connector;
>> +
>> +	connector = output->config.connector;
>> +	if (!connector)
>> +		return false;
>> +
>> +	for (int i = 0; i < connector->count_modes; i++) {
>> +		if (connector->modes[i].vrefresh == fps) {
>> +			*matched_mode = connector->modes[i];
>> +			return true;
>> +		}
>> +	}
>> +	return false;
>> +}
>> +
>> +/**
>> + * cmrr_supported:
>> + * @fd: DRM device file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is
>> +present
>> + * for the specified CRTC, indicating CMRR support.
>> + *
>> + * Returns: true if CMRR is supported, false otherwise.
>> + */
>> +bool cmrr_supported(int fd, int crtc_index) {
> add the igt_ namespace prefix. cmrr_supported in a shared lib is inconsistent with every other exported symbol.
> Rename to igt_vrr_cmrr_supported() (update the header and callers).
sure. i will fix this in next revision.
>
>> +	int dir;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
>> +		close(dir);
>> +		return true;
>> +	}
>> +
>> +	close(dir);
>> +	return false;
>> +}
>> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h new file mode 100644 index
>> 000000000..a317d4684
>> --- /dev/null
>> +++ b/lib/igt_vrr.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_VRR_H
>> +#define IGT_VRR_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +#define CMRR_NUMERATOR 1000ULL
>> +#define CMRR_DENOMINATOR 1000ULL
>> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL #define
>> +TARGET_RR_SAMP_COUNT 100
>> +
>> +enum {
>> +	CMRR_VIDEO_MODE,
>> +	CMRR_NON_VIDEO_MODE,
>> +	CMRR_DISABLE,
>> +};
>> +
>> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
>> +extern const size_t igt_vrr_standard_video_timing_fps_count;
>> +
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +			    uint32_t vrefresh,
>> +			    uint32_t numerator,
>> +			    uint32_t denominator);
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index);
>> +
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
>> +
>> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
>> +					uint32_t fps,
>> +					drmModeModeInfo
>> *matched_mode);
>> +
>> +bool cmrr_supported(int fd, int crtc_index);
>> +
>> +#endif
>> diff --git a/lib/meson.build b/lib/meson.build index 3001b473e..8675bd4a6
>> 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -22,6 +22,7 @@ lib_sources = [
>>   	'igt_configfs.c',
>>   	'igt_facts.c',
>>   	'igt_crc.c',
>> +        'igt_vrr.c',
>>   	'igt_debugfs.c',
>>   	'igt_device.c',
>>   	'igt_device_scan.c',
>> --
>> 2.43.0
