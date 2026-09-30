Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0096CA5FBE
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 09:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11110E25E;
	Wed, 30 Sep 2026 09:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXo5ChV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661D10E25E
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790762043; x=1822298043;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjNEmr+vItsPMreN+QQr1BV/cvyZaeSg9oA1n8BGD2U=;
 b=IXo5ChV5zqxWxGGhBOeu4KNvtDo5BY0XlDcoXso54ABMJI6GTFXBI3A4
 c6nAV7scKPaeoW9Eidl7b2QwbNHT0eEbM3dp0qzakCXOdGRzkrjHsTe7F
 +Zc7xTQMX+vLu67KlauneZQ3KtfcJNk+JVDhB4RJ+PA/VhWlgrWlBTrLe
 MFfoVXcpHOsH09nKw+WP38vyo6BONHp0A/acf+3T7Lomc3/jadsmYqfep
 5bkKBVN3QESXVWTqKsoTqNokexfAi57DXSir0PC+7ihqk2rY3YQLC8lIk
 HzyFodQ+/ZYIgTdcy7vQkV6ZJ/KZozxRQWXFL28hHLLoUEvTDoQxZKb26 g==;
X-CSE-ConnectionGUID: s03OErZRSbu9akYcjgzMBA==
X-CSE-MsgGUID: tbcTEegtSd6Kr8oMf/DxMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90395506"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90395506"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:54:02 -0700
X-CSE-ConnectionGUID: ajnCTYzhT2KuPMC0ZfqRAQ==
X-CSE-MsgGUID: EAIxXoGARaa87492tTq3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="313581851"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:54:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 02:54:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 02:54:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 02:54:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHA8megIP3Zi/1g/HI2gHfi+N6H5QaxUBijxuxfUwRICfe6Z+d2qSIjI7/XAgAMoPcNX47S0wmBjq/tRtgj2q3rH78CI51dNVJdM9tgpoNcUqNqxqIyg+yaoU0gZiZR/Q9B99SIgsNrOiIIlIS0eeSoiscL7vHncdFmZYl1mvI2+D7tox5KdTXHW5x5vsZ02Z6JJsMvODjtKxMiGGI3qzZqAR4TtuRj14b5MR3FxGiy29iM9JQSNf4Lnx7XraZ75zDxhiHC498VLjkUJnQUuhBqNASDJy5115wmsxnBg82NoxYfnuFZJ92UEsmj+G74glnCAMlV+iw+nM3wF6UEFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGalN9DLRTK4UKYq+R0dIeo0daOgENX5z8O/jMR0MdA=;
 b=YpGIQ2QXDZ7vTvc7Vk42vi5uRUSldTpQnFwGcB9Q7p7jEh7EQrr6F0p95JiwOHItLxr527a4cdE3FI12XUl5nA4d3BtUJdJ3Ly/R8ZllAGHdAX/blaYIgDbBVg+jPER4PfX1bkhpwOoJxQ955tEiXmtoW/20rPiPThZoPndONBEJ/xE0G8D5kaniXBD68R6kOh5W4U8XNx2SzQIWOhE/C1cxdS4r56dsgBB7tQJkSMIV+SN1Z6ryLfh8RFHwHpjVYsyE2TK/uwzGeuYdK8bKBpYMQ0E5hySYUrUtu9TZmShYOj8GYXhzTQxTUgCnD2eE5Tl8+rlMRz4uLdInhvfxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5371.namprd11.prod.outlook.com (2603:10b6:408:11c::11)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 09:54:00 +0000
Received: from BN9PR11MB5371.namprd11.prod.outlook.com
 ([fe80::e540:b48d:cece:be4e]) by BN9PR11MB5371.namprd11.prod.outlook.com
 ([fe80::e540:b48d:cece:be4e%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 09:54:00 +0000
Message-ID: <6458d372-bdfd-4f67-a80d-1bc38a5f58f7@intel.com>
Date: Wed, 30 Sep 2026 15:23:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Drop blanket skip when system
 memory < VRAM
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>, <thomas.hellstrom@intel.com>
References: <20260929173928.3098760-2-varun.gupta@intel.com>
 <94ab51b5-d08a-46cc-807a-5a9f1cf281e4@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <94ab51b5-d08a-46cc-807a-5a9f1cf281e4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To BN9PR11MB5371.namprd11.prod.outlook.com
 (2603:10b6:408:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5371:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 48cfc09e-0d7d-4e79-1d98-08df1ed8c031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UzWN5sBdCfMhn2Ceu26VWg1q+x3iAfftbrj5H9bTf4Dj54l2F3zTcivk2Ilp61JMiRbFOZlOrTM217HOhT37R3uyOcqxH/RlqaY5jemxpcTMQRGHoRgPy6Cg9Q0HLDEIOCW++6jU/RuL7FGSwPOFxpK2cc4WmUWfvFn8F4igne0oIkeCvuewPF2u4mJBJUdvIC45PPuZYOhFEE6wsHnQvBBGy3N845/mzSVS3a6TiJJNqGGpL5gV2VKDkNQ8J3Z+cwGnU7HkMkxaYD2+05k9BH8NZZ4e/uzKRo15zaz0sGpugXo8NRxHP9xu6i8kI2DUhGBj6LNl6SY/SggkfgmE3U+9OCdosxHeQWZePMCtIFl/4JESTJc9aqfVpAHfZsv7x4qn0FYRqa9b6AxauEYd85la5nkTkngU8sqzWWr9w1BI7qIg3VQg2n/QbCbtlHL4XQqnWvD1zQyI4tGIO7r9K8fDlF6eeG8wXRSvo5O0l5quzWn7IfCv+ypI7Lgqkr9KZJjr9dJqfbU1h7hRie1mCXnb7225g/td3mGM+/SnYSzjHUxyByV4JUx+OqRg78oec89+xCYD7ZHr3ZJCNAdb3xLhGK9b4zpV8mogd5/D79wi4hhA6x3UQatF9PNyWksUI8Ku9efx23EVxmKI7l6zFzDfabSO+n7CWgqrsZRDm7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5371.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWU0a1hmcStiZFI0dGxibTVNWUtERGNtZ1UyZzc5TzI5ZEdEL3FJdmxxTitI?=
 =?utf-8?B?N2I3b3QwMEwvT1lJQkVVaUxrbE5xcGxnOHJLT2h6aXU2Q1RMMnNudU5vdDIw?=
 =?utf-8?B?alZ2Tm5lOW5hb3NHR1F6dk5nZkhsUUZQdmpqNVJ3NHVSV1dpbWc4VGc4T0NJ?=
 =?utf-8?B?Yll0ZTZ6dWRqT3NBT1h2RGhNOFpxOWg0NkFCSlpNNzZySWk2WkVFTXk0Rmhv?=
 =?utf-8?B?cy9VR1B2UitweHEwWXRURkdoUzUrT3RXK0RNLzlsMEYrbWpNUDNaQkRGdXlM?=
 =?utf-8?B?Vnp3cE5OemgyT0xhOFpNWTlGMWJXaHBIUGp1OEJqVEtTVTdoc0hKa2NnUHlK?=
 =?utf-8?B?dVNoRjFDcTFTcWRVRmE5L3E0SUpBc05Ia1ZIY20xWkhQNElFcUgzN3phWEtB?=
 =?utf-8?B?WEw5UVp6QU1Qc3Y0cENjYlEwaHFWMkxkWGJkeGlnd0Q1ODl0ZE40OWRRa3FI?=
 =?utf-8?B?bEFSdVhKM01JTS9pODduRmh2dXoySkF3aGVQWCtmczcwRFd3ZHlVYVJOc044?=
 =?utf-8?B?VzN3TUhzNWhqZmtKczd5dEIyZEZIZ2ZvMGZXTGs2RHZGSVEwYTRRV1M3WmhW?=
 =?utf-8?B?WGQ3N1Y4NTZnbmdldEZYY25aYitvTXpnaU9nMFZwZVdiRnhLMkRneDlNb2Qw?=
 =?utf-8?B?UzVSMXNabHRiUVFHOVlnQUJKN3h3NC9kRU9BbzdWbTQ1dS9Dck80TWIrMStZ?=
 =?utf-8?B?aFNCSlRvMTkzY2xuOExNa0lkR0ZscVdFczhMLzlqL2djWVJiR0Znc3NpcWdL?=
 =?utf-8?B?dXRpNXUwdW9ma2I4ZXJpL0NCQ3FnQTNFV0IxelVCQW8weVg3VWo1MnVVc0hO?=
 =?utf-8?B?ajFkMlYyU0thMm9KZzdDbWJwUVJoaFhRb0x6YzNlaFEramR0VE1BaXJsM3RB?=
 =?utf-8?B?L0RzMjdEV0NFSklFSWlRaEtON3laVmRRc1lxbXVpTVFkdUFKeFFVWnd6TGdX?=
 =?utf-8?B?bGVFa1BOaU11aCtMRGtqRXFOY2l5RDNpbGJFekRXbjZIODFlTVFmdElZaGdE?=
 =?utf-8?B?aEJDZnJPeGxxeG1SdG5TdXFOZnNqOCtaeWdjRThhaEFTbXQwQVVYRGxtSFZp?=
 =?utf-8?B?RVBTbWJ4NW13U01BQVVpUlVuNGZGUWZrNVM4cFNKYzZHeFlIVVZwU01KWEpv?=
 =?utf-8?B?Q0ZXY1p3M0EyUWF5dFZaK2FyQVFCRFJtcjd3TksvdnF0MVpEZTVCbldBQ2w4?=
 =?utf-8?B?MElpRGlIUzVDcGpueXVkcXA0ZDVSNklpSW1PWmVXMEVvaVZlZHRtWXRydE1w?=
 =?utf-8?B?UDcwREEwZWNxZTgyQmJRcGVsWFBTWXBjMlM4STJDUWI2NFVUZ20xSThXSTFE?=
 =?utf-8?B?bFkzdVcxMkROaHdaSUxSUUZLcWJNMFBxd1RvOG1jWVJEVnphK01sZ25INjlw?=
 =?utf-8?B?Z3VLc1FaTnNWN01xTlBNTlhhNkRjUEdremZzc0xodkRVZzFPVkVCNnAxYnhh?=
 =?utf-8?B?WFpIWGF6T1FFYTk4T0ZWL3crMmJTVllRUVh3ZnJTUDBjallIRnFKWVZRVzda?=
 =?utf-8?B?blRqVVk1ZE5yU3NodnBNQ05Ybk93UTdNNjd5eE9MeUk1SnVYaUVoaERPd0JL?=
 =?utf-8?B?aUtQLzFVQmRhTVNOcHJHaVkrWmhkUGNVZjhkeFpLRVRsYW9UWGpTRVdvOUJB?=
 =?utf-8?B?SCtCRkZWWFpza0dqZWZPbHZXYXBrRmFxbm5ndU1NeGdyWi9qMkNYYTBvalZR?=
 =?utf-8?B?T2hiNGt3b1dNWWdtZDFjK0hONU1FeTdkSDZUbThXcThmd0t1L2JkVnFRQUZx?=
 =?utf-8?B?a212dS9SSGxHdlZjY1lEM1plckNsTWZkTE9lMi9lY3JRdVpUcE9RVHFGRDJu?=
 =?utf-8?B?WGRMOUh1anRwOXNGa3NzUndYRTAvODZZaHd2UjRLRTNML0NQWGlVTHNXbzl3?=
 =?utf-8?B?RnRuZFY0d2FucjIxdmFLWWEyRnRkQmNTa0RXVzhWNDdaSzFrTklXUzVmNkdh?=
 =?utf-8?B?UmZRbHZ1TzlnelJkUGRzMm5hSXBWWERWUXVZL3h5Nm1CYUY0ZGQvNXFkallV?=
 =?utf-8?B?YzNPN2dkMkk2VmdlcFMzSzF5U3AxTEUzRndpWnRraDA3SkJNUXh1OXJ6b0xD?=
 =?utf-8?B?alA0dEsrY29oay9laEphOGVuNzJiQW55TlFURDlXdzM4andnS0tzcnVDd2ZT?=
 =?utf-8?B?dGNhUWdNWm9ic0lvSEdiNlcvc0hNZlEwSzJPZ0kzNWRkMHJyMlFUS3EyNUJR?=
 =?utf-8?B?bEtJQXNoSUNnZC9nVmZCVTBERzlZaHhLZFhZVnkxeUJINS9OVFZSdStDREE0?=
 =?utf-8?B?WExhZGRiUDNoVXdZTVFTV3krWk82QnJ4dk9VWU9ValIxNXM0V2NUTE9NQ0ty?=
 =?utf-8?B?RkU4ZW42U2svTE95c2ZjUjdobWRCMjV5VnhsbkVmTUdyMjVjYXFNUT09?=
X-Exchange-RoutingPolicyChecked: twuziV5FeA6VQpYsWjZvKRxykNDdTRBSIpbZoaK35xCVZXYFUzCnlaFVc/ASjo6onXBsigJnafy5hhclK7KwHn7zRivV5tbuSRdMm5e7BrZy5maapcfHysdERmD4F3rUhJehGCbdko88xHsDkrrwmbM840u+4Ae1BWzjd18KwPHNIKkbwxjwoBFMglI0K/Thn6uOvHgg6QRBnU58+ltxtVcYXNPB4snY9W8T2DWjBZvso6zo7Os+9usJZp9IaRyhcZyRyye3NdpVUZyM7KZVwCmDznftRIOJI9QOMd9JUWogOEfZj4Qr9pzRf3YOWNT3Ff6O9yCC6c0MLYJ+faqudw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cfc09e-0d7d-4e79-1d98-08df1ed8c031
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5371.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:53:59.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQBAuq8sB8YA8IYp6VVtGw3RQacvPnaSEc79BseXQQ/tN+znj2y17/ApkH182FgE1+4vorjSViYZ8nMeJaBmtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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


On 30-Sep-26 9:19 AM, Sharma, Nishit wrote:
> Hi Varun
>
> On 9/29/2026 11:09 PM, Varun Gupta wrote:
>> Since working_set() already clamps each subtest's allocation to what
>> fits in VRAM plus 4/5 of available system memory, and every subtest
>> loop has its own igt_skip_on_f(!ws) for cases that end up too small
>> to run. The fixture-level skip is therefore redundant and skips the
>> entire eviction suite.
>> Remove the skip and rely on the per-subtest working_set() sizing.
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   tests/intel/xe_evict.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>> index 5a7298db0..230357419 100644
>> --- a/tests/intel/xe_evict.c
>> +++ b/tests/intel/xe_evict.c
>> @@ -911,15 +911,6 @@ int igt_main()
>>           igt_assert(vram_size);
>>           system_size = igt_get_avail_ram_mb() << 20;
>>   -        /* Test requires SRAM to about as big as VRAM. For 
>> example, small-cm creates
>> -         * (448 / 2) BOs with a size (1 / 128) of the total VRAM 
>> size. For
>> -         * simplicity ensure the SRAM size >= VRAM before running 
>> this test.
>> -         */
>> -        igt_skip_on_f(system_size < vram_size,
>> -                  "System memory %llu MiB is less than local memory 
>> %llu MiB\n",
>> -                  (unsigned long long)system_size >> 20,
>> -                  (unsigned long long)vram_size >> 20);
>> -
>
> Can we put some message here why skip was removed, Something like:
>
> No System vs VRAM size check needed as working_set() below limits each 
> subtest to what fits in VRAM/SRAM
>
> and a subtest skips on its own when nothing fits i.e. igt_skip(!ws, ...)
>
Thanks for the review Nishit, I believe the commit message indicates why 
this was removed and it would be
redundant to add same thing as a comment. If you still  believe its not 
clear in commit and we should add a
comment I would gladly add.

Thanks, Varun

>>           xe_for_each_engine(fd, hwe)
>>               if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
>>                   break;
>
> Rest LGTM:
>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
