Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3FAC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 10:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1A10E498;
	Mon,  7 Sep 2026 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzGmM7J9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF3910E498
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788777194; x=1820313194;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nS47YZOyL31NYEZEPSWlZDqHqqsfdgX2n30akv5SCV0=;
 b=EzGmM7J9oYqkow24D1xgX/+hp6stRQnUuK7V8VJgl7n5YMvnP0pRVn/C
 fG6LmUaVPzTdxJG9RfrwhSvA+RP5TVANox1lDiU1UBUmKRDCCVtUuL8Q6
 QttzGjGsM0fvTTDw+MNoCsdSmC4qiUIxWbrk9uaaB3pJS+qfZw9qP3kOh
 Lxc7lSnBbugDe3hJSAadl8WCK3Tzm3xx9XBnI7G9skaStko1n9B/Lkwgv
 aM11Rc4xqq+QaptEhUun1VMSU5bpLf+hs9m60A4lTLFz0yEgzD10xMKhz
 yBTZdCSJaxn+CRLK9cBzfi90nPYjI7WrXtT3aS00fur8yAxnRzFTJc5Be w==;
X-CSE-ConnectionGUID: Y4tbndSARUexLS/Yu3jY8w==
X-CSE-MsgGUID: FOMPkUYoS2uX+jRVvtVhyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89228509"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89228509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:33:13 -0700
X-CSE-ConnectionGUID: 23k8u81GTPauZ3CL/4asvw==
X-CSE-MsgGUID: //8za5XXQ7Ga4BgwoYhlJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294147446"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:33:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 03:33:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 03:33:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 03:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9J0HsGvJM1dfP0+gtyl2Jy6iSX/GvoGGBBka+EMGl1qGDAZa2M14x/eDBVM3oTdJ0ykkVFNwiwUQe6QC45WSecJfh7faYKL2m7QwfPbjCv9xlGBQsbOD92nUwicfRwEMG7yot2SJXipvpJjupn1sQTZuw9CjH3TIyGZzRERTUm8th0CqdU/olwoW3LA5VFqbs3bgwNVRe5JLcOqxb0w4WAxXPgG+XXS+nw/eoxsU8KRpjgNOo2BtDit8ZC33Kz4Q9Dfv9rK71jIrOEOSkliLnj6YLTzdcyH4maXMJGzJ8/4z1WJxn3BiNw2n2cd3SGIhFlwU3OqGwxnS9J8KcAoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X96/5dPl2MTEAEcnNB8IC8SrWIHZh1dMqZTHGabsdb0=;
 b=rzsNoMfcSHOzhSIz7xxB/jHkmwVcxig3QJ3+W8z93F38Fwcgsa/XJbnkmaf9j3dBT82L3yLW+46KXzHhJNh35mdVPokhCQKDqNcq+SHb7qnfw2+Xdy9qLRbmC8wqRmREG/dVFnWmkAgInZM4aHAdqJSIracKUVWACwsfjoHwACBAlNkW9DhnUIbQ/eLeTES7vw7AJkMfw+DfhhCod7JY9F+D62qcuj3lHLZhFvN8QmiwuPo4LPfHS6Eqy1m8aBBuzKlaF3yx4XwxeBL11PGLn5AiIU5CYyRM3P9QRR/Kbjt+khHhRSFchlRrvaxW/uRKFfufMcRkKL39mWQrdXHZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:33:08 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:33:08 +0000
Message-ID: <225ce655-d8c1-499e-a92d-525932b2c50c@intel.com>
Date: Mon, 7 Sep 2026 16:03:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel: Avoid stale errno
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <kamil.konieczny@intel.com>
References: <20260904100042.583658-2-sk.anirban@intel.com>
 <20260907094210.cagn5wrow57p3q4w@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260907094210.cagn5wrow57p3q4w@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH3PPF957B3B2A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 5321b7d6-3abf-46e0-b130-08df0ccb687c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V3CTzGIGqa7VEuqerDDeFTtrfZb4EuZy2F3vKfwSwBs1q4IjKwxuQRBMW9jZbvHVK+1ah7LMhsu+9ER7f6ziGo5N+VL/kjvjqQaaRXOZVyh9FsSlecTAxcyQv6JBoQA8/iMT5xtohl884bpcffh07AndPTwCCEH80c3/CXGKLrryQnBpGZo10/SsHwKUosfm9BQv81z3BLrGJapXp1y/jC3C2zELJTYKo5NmAObWZE2r0mTbk53iJThk5IHa3eSKGUr8bd0bAnRQSL/YctYOFnuCwTzgWVwwr6A5CxeudKKgFC2/tyUuGiWAkeZ7bKnBCd0kTqPi39yyM10pae585vLGulz1qIqiq/hxuDaHCxLeXzQJO7VMQeiy3RIvlcjoIkzbcJXcNoKxht0WdEEYv6pGKyIIziu5m92/RJese6rmxiUOcyOh+LTLUvBA2QILcyDAZOWs44BgdZevLoTZ8rNX4n0qkZJcULROThNl9kdbGwjMRx/xeoD3muFb/auFYLCtkO1jtP3hXlVp8FTI87cSWM4uK6oCvTMfvcPRqinrXH4RQGQaVdWXL2B+8ECukzw/rsSIroAvwM25SlFaooEtX77Ou1zB5hNRKMAhPUF7Sc5fktRfB2CKlJufS2dyhhNIQPB1Yw58NQQUR6chQ/+ft6GHU5og2AYLfPPgcZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFvcjlnbUR2eXQ2cWtIRGZSOGZ1U0JuakxybXZvWHU5cGEyaVlMR1lWSW92?=
 =?utf-8?B?M3d4UmNNTCtpMitnWGhMV0lvUVVJV3p1NEdVVG9oQm5RMDQzTmdEc1lDdDRQ?=
 =?utf-8?B?SytIZ0krbkRXMm1rNkgvMDhicXV4TFRUcnZxWTNzRktsWmFoTExENEliZXR4?=
 =?utf-8?B?a1BBcDFJUGJ6YU1hdythYkR1TVBuRktSNVRkREk2dm1VQ0FudzRNWk5LUXdo?=
 =?utf-8?B?RlN4V05jeC94UVBWeHdNNlB6WFJYdUlpdmJORERDUlE5MkZRaklxd1RWbDZI?=
 =?utf-8?B?b3RqaGl0TTI1ayt3QmtkU3hWblExeGlnQXU1NFFhRlNRUE1YTE5YTUxBMFYy?=
 =?utf-8?B?RTJHdjZibVUrWm0xcTZuUVlOZmoreUdVdStPLzExNkc0dlVtdExSRjVkUkk3?=
 =?utf-8?B?ZnZKN2ZkMUVneUpaK2E2UWhIRXVQN01BRWhFbzZqTUtlWFIwdHZpR2w3ZGtk?=
 =?utf-8?B?Rk1MdThEdzA4dUJNSkhyTkw1VE5GT1h4eWQ5WnhmU0lQN3FoMzBkY2FIZ3or?=
 =?utf-8?B?eWNpeW5ZQkt2Mmxnb0ZPajNUVDJpQ1lJT0F0RW5QYXl0TEVnSDZ5YVFTczJD?=
 =?utf-8?B?aXhPSGxyaEhJT2lWci93K0hyVS92ZW9BV3grSEtYRmhmWEFEeEVmaE56TVhK?=
 =?utf-8?B?dGxDS1JUd1FEUW9TWEZmeVdYRTBpYlluVlgzT1RhTHk3ZkplSXorVU8wUFZ4?=
 =?utf-8?B?RDNaUWFTdllRQkpYV3lJU014eFNGNlArYkRQd3F4S0xkbEc4VXVueVg1NWVK?=
 =?utf-8?B?cmdGdGNGdmZBbi9OY1FPWGxHeGlsSE5EVTZKYWVGRWN0M1UvTUprR2JXQlov?=
 =?utf-8?B?ZmFlbXpiLy90WEtEOWVMZktpTjRPRDdzSzR6VE1PTUkxVk15T3lJNU1LWG51?=
 =?utf-8?B?RVc0RDc0Rm9vZlY3RGduTk1VVFNaWEJ0QlViMnA4b0NrcFlZaTk3N2VWLzNo?=
 =?utf-8?B?SVhMMFNpczF1VXRqZTh0REhmWjlYRVFhclBqNlRLdS9SdlF6WEZVWjJ2cCts?=
 =?utf-8?B?NThOVWtLK29GaDZDYnc4dy9oWGtoL01iTWV5L1NsZ1R3M0FadzVXQXViRVJ5?=
 =?utf-8?B?cStmbTlUeU1NeVJTTiszZm1CaUxXTDRTUUdpcXhyUVNUTGplejE4NnRFTTRJ?=
 =?utf-8?B?RnVBNXBHRTRsdURER2FTTGJkTzlnOFZNbm8yY0RpTi9tdmcydE9LOHdrbmRI?=
 =?utf-8?B?M3ZKM1ZXNEMyVnJsTGVtSmtmVklxS3YxV3JOT1pNUlJKTWdCTFJMbWdaek84?=
 =?utf-8?B?K1dSc1prQUh5WmtLZ29tWUNEdndxRUl2NUQ2dDJWRzQ3bzRmYVFCZlNJZkI5?=
 =?utf-8?B?cmtpUmM5K3VITy9EWDl3ZjMxeHFQNUtJM29VL3o2ckxyc2NYeG5xS1pPbjRt?=
 =?utf-8?B?aTEyb0c0UytOYjgrQSs5b2JRYkc0ZjJ3VWRxQWQ2bUVBaVp5dkNOcXh3RDEw?=
 =?utf-8?B?eGYrSXJYbE9USzlHTTVCc29KaW9oSnRHR1dZUWw4ZmVYRlpFdjdpVWhzbjlG?=
 =?utf-8?B?SDZwMGRyVDVpTitmV2hNZVo3RlV6WGtZYVpHbm9WNHRVY0FtaGx2VEdiUlVO?=
 =?utf-8?B?MWdEU2RhVDgrS2tZMk1uZGo0cWFKUC9yS2JyK2J6bVFqUHYveGk4d3E3ZEtH?=
 =?utf-8?B?S2VlUUJya04xeENOSjh5amZDS3BVVHBtbnZJMnVnMW9EeXN1MkpIWGg5a3BH?=
 =?utf-8?B?Yk5IblJaRW9PNDVyMGVLTzgwWGlEMjZWOGZZZC9aMk9LckpaWFJFYXg4S3Qz?=
 =?utf-8?B?WWtjR3h2WWtHMFlVMm1ZMEN3R3pPYzlKeUQxZy9oZk5rS2gwanVmZURGeDJk?=
 =?utf-8?B?UzJ0NGhYQy9vV2FwNEVmbERHSno2RWltUTBDOUl3aDRWL09WcmlaOFVWV3hW?=
 =?utf-8?B?b3JRSmE0UGhmSHpMeXIza0lTdU5HVXc1T093WkRnajRZTU1MdkdXVGVGU2Jw?=
 =?utf-8?B?MDJYN2dYc0pQdWk4eXR3c3F1NVVZNHZPNjc0NDkyU3Rua2lZbmNKTDdLOEdz?=
 =?utf-8?B?MXJSV28wOVFqemczV1RwU0pQbFB5T2VveFRoYU9JUVlGYkE4MXE5U3daSlVB?=
 =?utf-8?B?YjQwZWdxWWQxQ2QxMmNaQitsYlRETmloN0lzbGlpQ1pwb1QxT0g3ZHdJV1Vu?=
 =?utf-8?B?blBqL1F3L1N0SmVwamFJTWVmN01ldkhmckVCR2lLYXppT1BrQ2EzZW1ib2Fo?=
 =?utf-8?B?UXE5KzZBeTYwQUlSc3Z0QVBHMkVBN1pUTGFxRExTYzhtNkZncFlsRHNoQ3hG?=
 =?utf-8?B?YzY4Rm9lWHFneXBnZUtFQm5WR2hZVnZ5bDhYUHhtSzNsdTN3cGpaVFoxOUhL?=
 =?utf-8?B?MUlzT09wcm9obitVMU5xTTMrU3RvWnVvMFg5SkJhRGxXeE5oMEtTZz09?=
X-Exchange-RoutingPolicyChecked: jd6mp49/D2BV2wtb0VT+YVUHdUS8Cm1s+Bcr6WBvkiV7qRjIb9psnQSfKaq8BXvzBWcdfovBuB3VNgJg/MPced9MjnWOcbvAdStheAIDfDrozQwUHclAO1qsp5DD9R8jqi/CspkAfI+ce7/lOYMi1aqc38b+o0qi6BWkpiXkM/4x9zPAQMsetzCGrG6X40vgf/H+VAIii/FRf7LMsTDqx6tx0gtKnRXbHwG8imXCpy3+Y7D4UN2iypvTK+lD8Vk6BRrxZ2epQ2aQwLnQE5JWltS2SHa6n1qX9XNiu7mJstFxmYngXNWPkK6le4VIIWLwFaiCrSZAybUnWhZbEVJXdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5321b7d6-3abf-46e0-b130-08df0ccb687c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:33:08.3260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TZdEmeVmo6bgyjAqiKDd1eish4GRRlFhamQhYv0HJh68lIyGBXzZ9hFKO7aIvUwTUYXHWxoRtcefpbuzLh8BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
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

Hi,

On 07-09-2026 03:12 pm, Kamil Konieczny wrote:
> Hi Sk,
> On 2026-09-04 at 15:30:43 +0530, Sk Anirban wrote:
>> Commit <e311ed2c7> ("lib/igt_core: do not reset errno in igt_gettime")
>> removed an incidental errno reset that used to mask stale errno at
>> subtest entry. Now a stale errno from an earlier, unrelated probe can
>> survive into a later assertion failure and gets printed as a
>> misleading "Last errno" hint, e.g. in xe_gt_freq's throttle_basic_api:
>>
>>    CRITICAL: Failed assertion: !strcmp(throttle_reasons, "none")
>>    CRITICAL: Last errno: 2, No such file or directory
>>    CRITICAL: GT 0 is throttled due to: pl4
>>
>> The real cause is the GT being throttled; "Last errno: 2" is stale
>> and unrelated, making triage confusing.
>>
>> Fix this by clearing errno right where it is known to go stale.
>>
>> v2: Update fix path (Kamil)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil

Thanks for the review. Could you please merge the patch? I have already 
responded to the xe-ci-full failures.

Thanks,
Anirban

>> ---
>>   lib/xe/xe_gt.c                | 1 +
>>   tests/intel/xe_gt_freq.c      | 1 +
>>   tests/intel/xe_pm.c           | 1 +
>>   tests/intel/xe_pm_residency.c | 1 +
>>   tests/intel/xe_pmu.c          | 1 +
>>   5 files changed, 5 insertions(+)
>>
>> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
>> index 8f54b6e25..3d8b4f68a 100644
>> --- a/lib/xe/xe_gt.c
>> +++ b/lib/xe/xe_gt.c
>> @@ -224,6 +224,7 @@ bool xe_gt_is_in_c6(int fd, int gt)
>>   		return true;
>>   
>>   	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
>> +	errno = 0;
>>   
>>   	return false;
>>   }
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index 19306dc41..886537862 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -397,6 +397,7 @@ int igt_main()
>>   			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
>>   			stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
>>   		}
>> +		errno = 0;
>>   	}
>>   
>>   	igt_subtest("throttle_basic_api") {
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 7faba7c2b..543f46f5b 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -990,6 +990,7 @@ int igt_main()
>>   
>>   		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>>   		update_debug_mask_if_ci(DRM_UT_KMS);
>> +		errno = 0;
>>   	}
>>   
>>   	for (const struct s_state *s = s_states; s->name; s++) {
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index bfae1f844..e976048a9 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -574,6 +574,7 @@ int igt_main()
>>   
>>   		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>>   		igt_require(xe_sysfs_gt_has_node(fd, 0, "gtidle"));
>> +		errno = 0;
>>   	}
>>   
>>   	igt_describe("Validate GT C6 on idle");
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index a8ceac46c..5b098c45c 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -1076,6 +1076,7 @@ int igt_main()
>>   		xe_perf_device(fd, xe_device, sizeof(xe_device));
>>   		num_engines = xe_number_engines(fd);
>>   		has_engine_active_ticks = has_event(xe_device, "engine-active-ticks");
>> +		errno = 0;
>>   	}
>>   
>>   	igt_describe("Validate PMU gt-c6 residency counters when idle");
>> -- 
>> 2.43.0
>>
