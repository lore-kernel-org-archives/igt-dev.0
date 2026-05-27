Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E3FCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 17:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469910E66E;
	Wed, 27 May 2026 17:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw1hGl4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6539910E292
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779902008; x=1811438008;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6T8eNZQQzH+KFZScGJ8CT690jEih+lIsxXQptPNVO/g=;
 b=Pw1hGl4Pb0MDYkNBkr9V0peXYe7Aup2Wn43kWKd57RL+6q6EpSDTfqov
 LdUd9MyidvlWMjf49g83y2sRKCXqdnh4CpaczOOuFCRGscpgceEpccVXC
 RMjO0DpWBIL87/zjnP/c2vEVVBDOIFtTP1btcG0UU460iMk9AMRcyC3N1
 Gw/MSE6gazJ7vCSyMjZ/2qmZInOBXSdVASyPL8ouSmJaxY7iOWEpXSGfN
 0Vwolm5gLBoJHW4np+NldviP81gnFvoF0fe52tFyrj+xMDZ+Nu9J765kt
 7GHg3+p30ndjEhK5TRK2XiCzJfFaXI26Vlh/qXGcyY3CceNWRbtOui5rg w==;
X-CSE-ConnectionGUID: 31q1JJy8SYag5XJgn78C2A==
X-CSE-MsgGUID: CcmxZp96Qxehk165bfE8IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98317236"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="98317236"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:13:28 -0700
X-CSE-ConnectionGUID: c5RAALhbSNWnlxpUozfUIg==
X-CSE-MsgGUID: 7XYM0QQGQBGZFUO7ccR0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241258446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:13:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 10:13:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 10:13:27 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 10:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT9vrgM58udWk4V2j6XquatxJCZkeX4m34KhIFLFdWCl7KA4pCFMAvDY/xtMDM8Ci76ubaVjF+YT4bSpZlKr7YTm7BYmi1LZeKE7sABeL+me40tj5ovJcupiPusxbzS1psyHURGCBETnA5acLWL0DYQvi43b282PO8XVmHPFvtWo4cOIq/E57qvpoCkGSlBAZYFXAdhrgHuwJ/lhSDYoBerON7xiTzcNxc9g0e5Q8G2lJ5+dF2CgC5oDZmVp9wYpjZbm/VpBRt2USBibvZ6HRbHsn6Wc/QxUe2zdzJI/NrbRBSrOZPH1RJ+Q/2RNhP5g2TaDUwuxS/nLiS5GO0v3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaMHHEF/rBXzBKfx6lksIJ6VkaBH1XbqfPXK1wo76ws=;
 b=QKwzXJhkoceRiwwPIHqjKZtkCIpHXit6IcAHqcGXDifF9eFwd3a19GZW7hVmsU0tpPllSrLEoh3OAbZtILUlMRaBOIH21xXTi9m39NouyOsMnFVAYjW+MV8bHyOnn6mknSsdNmu9iLMmNFPYupkgzj3pFgZdMKMvbwC3IsSuU9xVh23vZ1QsU9gxie11FGlBT9Xru+R63S6bfTA1kOa8Ub/wBWXZIE5dlhW5JmqUfrqJfDJvnfb+O4lQoLP+LT1SMHv8TzrrLhq2+HQ4DCk+cPiyGjUaGonlNP+YxkNtaTWNqckWujP3k+b93wCEvY3WcJfcYoog2vxr3UTow15jsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:13:22 +0000
Received: from SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99]) by SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:13:22 +0000
Message-ID: <1785d264-494c-4478-a816-2c4f23c75f11@intel.com>
Date: Wed, 27 May 2026 10:13:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tests/intel/xe_pat: drop redundant manual srand
 initialization
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jia.yao@intel.com>, <x.wang@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260526223655.81924-1-zongyao.bai@intel.com>
 <20260526223655.81924-3-zongyao.bai@intel.com>
 <20260527160842.6zufwalycxi5avn5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260527160842.6zufwalycxi5avn5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To SN7PR11MB6678.namprd11.prod.outlook.com
 (2603:10b6:806:26a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6678:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: ee03f796-e0d6-4d3d-8105-08debc134171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Ov8U9MvzmvfMC5+XB+x+K8xzXRMFbCnoVbY/7v1o1Ao0SXorJqu9oGsx7h7OUgKOQ23D6bZIm4/o58qTs9O89K4nCgcYwfGJdxOqD5FVhxUtiC0ahDeFqgaDAObuav9ksBMKI2QDWogMj0OG6W+nW7lkULDe9LH6dWGkB2IccM7vdg/m6ZLGqsVgYy7RZVBGqzUIbAC8JfQ7xqWYatdLxo/Zl2dCSujlyNYpdKOzxNcNL0OoJlcKtTz/IIoYuq7dWaVu/u7TWdJmhQlWB7zdUGMRjzNejIKIfeIqoJ9508TNNHE2MxauYaGrkNWPTrkTqvQnPVDnzG3FqLmDOxP8vJFTPlZup+oXdrT1fucxgJbTbL/RfhGjs+WNFllSgcR5sFjNyWduCAiylURQrqFEMoophQTcu55XgvIGN6LY++dSUEWU1wxcgjCFIP7EZyymT7BbHQnq4tipJkB3aA/mRsxrQvZf4uYZxCkzLeMBlB1heiCHk6xWO360xUIcb/ZqY0zQsP4nqQxGSK17h3ZUScUm2rEdAR9LbuHoZQHwhEpZhSxfMILDNRX6Ef3OTJLPUnh7gKMaPcOBAco6eVHqQW6+q+B50p/q2ukNC8GO2e5oDgjvRa64YXf2QmcI494VUJUx60dPgOTFWPtaXOQAH0gFtumwOil+X+P5Ke8tCWHFEX0fKLg6XnnHyDMEFIP+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6678.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlSM0MxMVQ1RGt3U2dLeHUyWW5ycUZCM2tPWmdJdVUvWTI0dUJmbEx2N0VG?=
 =?utf-8?B?cUNPVndVV3l3ZWZocGY0MGFhcnd2ck56YW9aUXZ3TUFxMUhMTm9DSmN0R080?=
 =?utf-8?B?M21ZeFhpcTUwdjMxN0hNOTBHcHg2cUVrcUNzUUJhbkRQZUUxL0tvRWNSKzFY?=
 =?utf-8?B?b1FjOXdJRXpEZWxac0VKNzZNMWhwU05MMUFQU1Uwcmh3Z3UvMzc1REZQQmYx?=
 =?utf-8?B?TlJHOFdIaE1LaS9lTlVrRlYxb3E3citBNm5sZFp4R1IwOGZTQVBJcUI4QjFn?=
 =?utf-8?B?VHBIa012Q0Q0aU5XVWJwU2FnNlluVkFFWUR0WWRaSkN1L2JaZmdoZ2lVMGt2?=
 =?utf-8?B?bXJoZzhWYmlpRkl6Q1ppTlRqTlg2QnhtUTdySjFjMkhQRjd4Q21UaEZYMDJI?=
 =?utf-8?B?QU5HZThIRk5rZnJHR0ppMmsrajhGQ2ZtcHI4R2VNSG94aVBsRVZ6d1VuckVX?=
 =?utf-8?B?L005RkhnT09XSnp4Z09DRXE3aTVCMTIvN0VYdmlRZDNDckN3c1FkWGE2OGVp?=
 =?utf-8?B?UGUvZjZwcEJ5RWo3WVZkcVk0TUhKMm9vbGliTkNUYTE5RmNMZllaZnBDcWJZ?=
 =?utf-8?B?elZqWGhqaHUzTHd3VjlnUGJqVjUxZWcvM09qbzdtNmlUUEpITWtoYTZaZzEr?=
 =?utf-8?B?WFozc3FyU0JGbko4cVIrT2FpOGlZbmVabFJEb0F1Sk5Kbk9TMmVReVNBTEhT?=
 =?utf-8?B?V3VOcFZDRHRYeTlsbjFRb3k3cEVrZVY5VXFtM0p0MmFsZWM4bFE4dHVtckhn?=
 =?utf-8?B?YllHU1lXKy9Ta24vNDJjdldSZTRiQ242VVBQdTJ5RTcwbDhUWllFWGFyRURB?=
 =?utf-8?B?bmhwWUl2YnErVmtYWTRQcmlFM2RTa0FRcEkyWW02bW1hS2F0ZXI5UnQ4UjRn?=
 =?utf-8?B?UHBVMUx4cXlrZmgxVlp4U2pqSGxkd0V6YTc3cG4za08xc1QxVHN0azN5Ujhv?=
 =?utf-8?B?blFFMlJHN3lsY2F4WXF5T253bDFjc3d5L014d0EveE55RFJWTStBRjFZNjFR?=
 =?utf-8?B?Q2NvbFR3ejczSkk4WXphaUQ4WEJ0TWg5eDhObWF3VytjRkpoQ24vVGRVaUJ1?=
 =?utf-8?B?STNVTjcrb0dXOGYxN01zd3VreUk1VU82eHkwc1dPNC82ZE1haktJckVoR1E1?=
 =?utf-8?B?UDNadDYrVENlbDcxc2tueFpYamtmVnN4bitlT0hjdWYxRGdheXpTWDM2UlBt?=
 =?utf-8?B?QkVSaHBwYmZoN0JFcGVGTm5ndFNxeFdCVTlBa0c0Y3JIVk1VbzNMWldrTUVu?=
 =?utf-8?B?QlVHcHQrVVpud1BXM2VsbUhETGpyQ0VyNEVxT1FRYVZ5TG4yWjNBKzRxN0NX?=
 =?utf-8?B?ajQvMzh5TzZrTDZVOFUxaFdiOEFtVk94UmxCa0RUcU5VRUdocjBJNTk5QlRF?=
 =?utf-8?B?a2xWYVVYNTFxbnNEckFNVXBCT090eG5HRTBWTkx3YUN3L2Q3TGM2TEs1QmFS?=
 =?utf-8?B?K01qd0JNait5ZFB5N1B0QzNZZU40bnNIdy9mbEh5UlhJSjVBUDVQam1KNUlF?=
 =?utf-8?B?SkFNSlR5WXRqeEFmS0M4SmJCakJpeXBSVW16d3VaRVNNSSsrWkxaVFk1NFFl?=
 =?utf-8?B?b2diNkhiQ3NYNGhzSmNhNkoxMkJ0U2s5eksyNkhaNjZKREppdHlzNFJCUkF4?=
 =?utf-8?B?NUwxNnVKOGF2d1dueGl5WDNoNk9pMFRESDN0V1czakJZSEhpamFIc0xDYXVr?=
 =?utf-8?B?Y1RoVDVHdWZUWU04MUgrMmdUUEFiUGdoSHJ2YzliT0ZFcDJvTW5xVjlvdEov?=
 =?utf-8?B?UFgvL0VqTlFGVFFwR1FtZzNtaXJhaTNxL24za3c2SmFMNkpYa28vY0pycW9Z?=
 =?utf-8?B?ZHBCVTdSdUtyY0N4bkU0cU5VNis5RElFbTlHb1ZXUzBvQkVLNjBLU1NiTWZ0?=
 =?utf-8?B?K2ZYTHhocWN3NnQ3Y2RPY25vYzBONFFwc2hzLzBWK3kxYk1VeEZrTDBDazRH?=
 =?utf-8?B?TnFING53U3dueUxNeEhseXVZbWljUU9qMEU0dWk3R0xaZnBDL1B0NUdjMXhy?=
 =?utf-8?B?TFNyUnFqVytRYmVnc3QvNkt2a2VueG55UXFXOVNSOVJZbU1EVGVJb1ZXZ0lI?=
 =?utf-8?B?S1kzWUcydFN5d3JaaDFmOGYzK2thZENsN2JPcWlTOHBlYS9vUlA5S05HVndw?=
 =?utf-8?B?Zm1RcVlRM3kxMHVTR1VIRkRxdE5jdXBLUVRFWEhxS1VUcTFDcW9nTDFSc3gv?=
 =?utf-8?B?dlFEVHpxQy9qa3NmZitDSG9IemQ1NDcySm05dmgwUjYrOVZCczdwU1JhdHJE?=
 =?utf-8?B?Q1pDTlF2OUhqNFpHT21tWVpsVXliQTlIbHAzZzBVVmdpLzJFMlFjZTRRSSsr?=
 =?utf-8?B?bU92aXBmTndpMGw2aVFBMWFLUXRZY2J0UGhjWVIyWFJOQTc0SFVwUT09?=
X-Exchange-RoutingPolicyChecked: N8gEih5p5BAflNkSCHbTL8UMKfc6/KvbCzkxcNJ27iOnUaAfU6u9kbSCibP1myiIDe7zfO+3tEkX7MGqD/4JZHcdqu3eVEPUjEx9DEVVjJm6Puh6S12TKKWudX+bF/pgYxWLnUSuX0TsbOoak3n66A+g9lCP5SYkkxqt0i/w9CJ/dEZD3aGlEsZRQcg6YgjbZwQzfVsgWNsa9CxZruKjRdmmEIT2YPZ8Ma88ZT7yvcU5F3CDFXWsSRrZCMLSZbTLstLA5UcJWTgDCVFJZH9G4j9pYFBHurBXNdtXgE1sf4Q9hX8jWPDoELMOVX1uX1MQ8G2L++aAB9trwiWOKhagKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee03f796-e0d6-4d3d-8105-08debc134171
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:13:22.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD/UVcCnD1RVv2f1FOwdNx4kdaBo425W2cYAD4YMSCU3h7v+p+686Bo1AV4GIkyEiHth+vGV4JrVHmZMfOzmmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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


On 5/27/2026 9:08 AM, Kamil Konieczny wrote:
> Hi Zongyao,
> On 2026-05-26 at 22:36:53 +0000, Zongyao Bai wrote:
>> Remove manual seed initialization and srand() call from igt_fixture().
>> The IGT framework already handles random seed initialization via igt_srandom()
>>
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> This and 1/3 patch was already merged by me,
> could you drop them and resend only 3/3?
>
> Regards,
> Kamil

Got it, thank you Kamil.


>
>> ---
>>   tests/intel/xe_pat.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index e53e08877..79f9a87aa 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -2213,15 +2213,8 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>>   	int fd;
>>   
>>   	igt_fixture() {
>> -		uint32_t seed;
>> -
>>   		fd = drm_open_driver(DRIVER_XE);
>>   		dev_id = intel_get_drm_devid(fd);
>> -
>> -		seed = time(NULL);
>> -		srand(seed);
>> -		igt_debug("seed: %d\n", seed);
>> -
>>   		xe_device_get(fd);
>>   	}
>>   
>> -- 
>> 2.43.0
>>
