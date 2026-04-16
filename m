Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC6F433DD
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15FC10E7D0;
	Thu, 16 Apr 2026 03:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyT4M4xd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154910E7D0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776309885; x=1807845885;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=n4/kT4DdOMcZT1Uu++zTkUktZ4k1nkEex9aB7xBIVQk=;
 b=eyT4M4xdnlYxL/hp/vHDM/YOqdES28M0IVfgW7ehfNJnV7VePGbOxwb+
 uFLKCbDNyy/5ZurCFo/W1eDzL36QFcD79YwvUKbs1fAECzdqMrVQL2rr/
 HiEQMCuyRpYfTTjMz+1doFGg51vTLw/59cRZoaFK6GfGNbtWN+XaR3JC9
 j1kMNcqzVBTEtbiJ/tzX8BDB1sKrBsarnEHWaaAhx+MKJ16B7JFC/XPD0
 /A/ykfBb/ljoBzqK8yQle5ZgdJbF8wcRNw4EqFX4ge7CvW0ZG8+xW4LP7
 wySb1VKHFL7MUC6MrAvDnchletOzV1gLCufNHLZJz6Mk7r90bVQvq4SWi g==;
X-CSE-ConnectionGUID: 29IO0GPaSU+ed6r+CP2Emg==
X-CSE-MsgGUID: aQb3eEifR421ZM78FRwWeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76999506"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208,217";a="76999506"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:24:45 -0700
X-CSE-ConnectionGUID: tMf4T0lQROe7tXBbsOyZug==
X-CSE-MsgGUID: Y+JI+l2bQ2e/YU213xZkQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
 d="scan'208,217";a="234983473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:24:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 20:24:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 20:24:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 20:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhxLsgYl+W12OtQgT7RDNpiJ5ll4VQpW0U9qChq7uqsoOSefDO5jtTjP8+j6fLzjYZamc5fQfdrj5ceGcqT/HFAgwwrFPy0VtyOhXs2uS1bCtVC8ge7G3IeYD3WwkKChD9nlwF6LwcfffBwmG8rzVS1eiV8bqnmQyevOyQNx11QT8vNoFLwPDovtRrWkNQYtuVEXlZFIWzEM/AmvI78H3g7xBQv9SPRqbarGeDnzIzhOksly0/J9ONPXmHX4ZQhUVhneNcxzLG5cEetC0DSlwhhtDAWaAr/QhyQ1TU3TwmHbLqGfPGW28yDjle1Yy3xncjmWOI8XD7HVu8Ulg3Uisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBqrt625ufbTNSpzoY7pwQLV+yw8/hmNNQYnc3Mbrx8=;
 b=YyPZRzXBKx5XBjpXTpxRZqxTDIDDVia52bGyACRZle6/68D5oabjY9nJv35dzQ7SF4Yv2mhfGJ7S1aQ5tTcTh02CZn1qmWoY8in6eobboQUPIC9ugCCA9WH+s+hrmsBn+pip4gqO4lRFOJkuLkLIxlM/FW9rbShe584CSOA4ButHAHHq6SZvSPToY5oknVK0yVMmwqjpAKfv0TkD8GZBJG9UMUX/lzhnh7TgQPfHuXHV1YwnYUJAFGUX1zENelfBXTKP19IX2LkOWyVChvznozUpuEi2BDcE+Vu11WkbndDg/MYf+MHl6CHudHgJ7Ivy9BC12dCoXWlYuOgHs49BdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 03:24:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Thu, 16 Apr 2026
 03:24:35 +0000
Content-Type: multipart/alternative;
 boundary="------------Cm0ZF9Uq7ayV13TEUI3aE04W"
Message-ID: <079b3f19-c245-4af1-ad91-167142d731c2@intel.com>
Date: Thu, 16 Apr 2026 08:54:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
 <cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com>
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b6a50d-8ae0-4981-1f03-08de9b67aec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: dJw6x5dCZQOtMNoxIpEFHlGQrcLlAYZG/ZVz9/ZKLMytKm91SdFIPKuD2PtT0WnPPlECgBfLN7+nzB9boHmhgnPi2L4Weo6srd4U1Tf4+i+Rp9zp2Z0Ypen+79+Yn6NYgLR5rjoICoWivYk57UKir7JYOUA+k2ZYzkA8KvWcn6Ng9KTmu0mEkCADWXeRmGS5TEBCQffaAk1vGBXHjJOt10b6U1shCzO0lougisDjd5Zibmkxte7+gsr+h8HmdqdqE7OpijQCrRl7es9KZpJxtmp5g7hLflVwsUA9ZDYP1fgl0gdNB8EDRDSCjuKKM1tDs8Dhk96GlgZgy3OWv69T305emK4VgobhOrlCCqBuwRsWyp2RYJHIoynD6PZh5uDiLvcXASZ46nN4mBwztVrxxjncHYeuGMerTYd4kwHk8oCoB6Qxf0vvhklNfhdZOFkUX6WHV4MnXAzI+xGs3yr8EeZvlYr6UFAqj2Gjxbl1zsXDswVC349+1pJX35BF4cpUUfqebpB4Nr7AiSu7+lBbfY1Mt5jrp0M9VoxzCl3Rf6sSktYliJSc7QoVlCETdiA7W6lPrH0n3DFJmTbJ8Xhy0iblNHnjLBp8jm3OlEDYl9HPmETwU7UZ19FABOwAkR28RXz1R5Ykw5DMxgnC5CRCZyNsb9aPVNAdCXAnlPGIYK4qEPnAc1fkNyevpdVBhDYz28r3Jvd7/zTx3gLgRItfFO3vZa7zOZM/uNoS9oKTG5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkcxYzg1MWlyYkE2VVZOREwrUitlVGVmblZ1QS9FdnFoUUlxbTZqNkxNZVR1?=
 =?utf-8?B?eVhsRjVneDEzZVFKa0NwdE5KcWFDd0g1SW1TcWpydzBVTGlWOFNmUENPSWxZ?=
 =?utf-8?B?Wm5LcFBYUkdtRjdZQjI1RmJ1MGhVTGVrOGU3N01kaERsTGh0dmxoblUxSnoz?=
 =?utf-8?B?YnZja3ZiZWFObEZLaFpac3dyOWpUU0g1ak9lZ2x5STBiM3JZQmFXYTU5enk4?=
 =?utf-8?B?emFRcXd3YWpJMHJkT1dZTVdPWkppVDFLZDRQV3FCenRpTnFBT1llQyt3bHl3?=
 =?utf-8?B?SWhHcG5ZTVRPakllNmRlWE5PU080QVIzZHBKSUxjQXA1Rlh0d3VBWlQzS3pw?=
 =?utf-8?B?bE9RcEUxK2FOYThwQlBKeFV3ejVjTkg2cytXT0xhYmJ2M1E4UHk2Q2RDZDhR?=
 =?utf-8?B?eDk1RGY0Uy9LcUEyQThMOXdKOFNhZjJ3Qko3MXIxYzFsdXNXM1NJMnQzcDZm?=
 =?utf-8?B?Q3NZMVpZMTVYNG0vYk9QQXBtYWhhY1FpOXlPSEFYd2NVdS9WK0RZRHFkV1RC?=
 =?utf-8?B?ejlVaDIvWFlXSXdBV2Q2cnpRS1FLMXhZSDh2cVZpUXladEV6YXcxN2dYalI0?=
 =?utf-8?B?VWJkNUkraTcybTZjMzhJTFRLb2locGpyaTBBQWtWdEhzSjVldXZEaEJCWm9t?=
 =?utf-8?B?MkZTWkFPbU1vWFRUWUova1E3VVBEMXdEcU9BeFNrdnN5dnNHMW15b0lxVDFN?=
 =?utf-8?B?eXZ6ajNLejVubHNqc25laHhKYjVQV09LamtjODhZcTVnYWRkZmY5dXJXTGNk?=
 =?utf-8?B?UGRRZ1dtSDRlb01uakhMME83aWtnZXRYNFJQSytuTUV6bnNJZnRWUitpMlE1?=
 =?utf-8?B?K21NdU4vK2JxOTN3bE4yK0R3OHdOOG1mLzlzTTdQMGFUTXpKZXVGZkRpUjJs?=
 =?utf-8?B?ZUhBbWVIMzZuc1NGMnVFMlpabDJUanMvOVI2cldQUDdzTGFRQTZIUHBDZ3Ry?=
 =?utf-8?B?dTdQZTlrVGl4cE8vb0NLTnNOMWg1aFA0ejFTSGd5dTBVaVRES0w3R0lQejdU?=
 =?utf-8?B?SG5veCs1c1cwK0g2ak15RjlvY3FwcXRwNGZrZVFqdGcxQWt1VnJuNXQwbzdP?=
 =?utf-8?B?S3JpdTJIcGJLaUdDdWNob3NyYTZ3NURVa3dEc3VHQkp3ZDVtMmQ0TitTMXZr?=
 =?utf-8?B?MnhVbTN3a0wwd0lOYlhKblpsR2dZVGgyQlUyVHY0UXFlNU95Zk84UVlHbERE?=
 =?utf-8?B?UVdVQURHZmNUeUZsNkNzWTZyVHA1a1p0V0VxSzhOSm1vbytxRDFnOXBFU2NE?=
 =?utf-8?B?L3VveWtQZGlTUkw5TDNtV0J3VGUyd0pIdWtGbGRlTHlSeXBGVXF5bDRVMm1X?=
 =?utf-8?B?VlRoc2VYTThUakpJMENxUURKTWlvK3k0b0xqZkVMYW9ocTRadUVIWTFqai9n?=
 =?utf-8?B?R2pudWxDOWhNYmY5UzUrTThiOXNCaVd2VFhBZExRZm9vek5US2g1WnI3RVFi?=
 =?utf-8?B?cXB2dkM2Wi9ZRjNzbVV5UVRWQ1pYWG1RRmlveUdLSkFXWFdjWExqTEhsL2FE?=
 =?utf-8?B?eUV4ZEwyQWRmNVFvTGVTdjkzc3haSkFSN0hRNGo3R3huMmxBWEhUNzhZc3Uw?=
 =?utf-8?B?ZzU4WU0yMjJpVWMrcVd1eXE5akM3RlEvZ1BlL2l3Z1I4WUdSc3gzaFQxL3BT?=
 =?utf-8?B?Sjk0S0NLVFp1RGRTQ1B1dnNTTytUclZVaUt5eGRSZHp5YmcxRm9MVW1Kdng0?=
 =?utf-8?B?c2pDSGZZU0pFeUVNM1o5a3EveTBhRVoxVzBUOS9Kd1R5aU9IblB2cDZucnlj?=
 =?utf-8?B?UGdBV0pzU3BDZGhoMkFRR0hRRU1wdmc4bitQM0tabUl5K0lvZ1JuRTY5RDBu?=
 =?utf-8?B?RkNIQjhHUnV3MUJ5WUwzK1ptaDY1am96dFNuNmtrRjBhOExvOU1VQU1IYnZR?=
 =?utf-8?B?TlNVM0pxV0lrZzdPczZGNjEyZXJWM1pmTVk3RUhnK21keWNsZld5QkpLNjln?=
 =?utf-8?B?YWdad1RkTEVFTHFXSVhFRU9ad3ltMFZSVVlFY3BlSUlFVVdNTE1RWmpwRDF0?=
 =?utf-8?B?N3ZSdUMrYngwZlpHWmJYWGlydVNEOGlBc2VmVWdlVHdnOTBtOG53SFY2MUdz?=
 =?utf-8?B?MkJZQUxhV0VLb0RKM1pwZzdtaG9zd3l0OTlqT2hrdDJsUisrNCtiTjZyTjBi?=
 =?utf-8?B?VCtGeTBSd2h4YnNxeVE1MkI5dEhJMzFvZ0RPUUNLYnlja0NwZ1NTNkpQSEEy?=
 =?utf-8?B?Vmh4dUc0bEVKazRjRm1GZXJnTFpRaGRwNVl2KzdvKzFCTlBwWm1NYWhkLzV2?=
 =?utf-8?B?WVVhbUI4T0g3TjdYNDlISUxYRWgrRWlyY2tiR1UrSExsdE5GM2pZZVduNGYz?=
 =?utf-8?B?QkRvTXVwUHNrazFiOXNWSDlYdUtBajRzNXJGdkE1RmVTYis5TEJ5QT09?=
X-Exchange-RoutingPolicyChecked: iQLPcIcQqzWMqlIb1pPrJJc3DZ5TQPtPUZQFHS54dA9vuGpF79DnTr2Rx62BOYINtTFnMRvcyToX/jbTq+Yw9cn/zGV/K+jLA+T55m3KJwVXcVaL/GU90Bh/ju1plPmjc13pKErr9xhM2zw/oMCt9AX49FlV9aaSW5YWHWh/N3HVjWuf0tlRh7PuQpKYYyONHRjOETj5oeLm9G1QsGel/RyeucQFfdDI/5SeiHBX9HBR/wnKEEYiRtnDN6QQdIGtIBCIkumOvATX4mt0rNc/y/Ni6HjJ5xRYQ73oGsFku9twE9cGknvvcoN9YboM05/B+jUjdc0+50j6n9eAE2IvyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b6a50d-8ae0-4981-1f03-08de9b67aec4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 03:24:35.0607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHOoz+NyMCDY6ispDlw+RcTYojNbAYkZ7u6oUb8UElyuIGMGtQ92f0jGkHeH/oUayRgJXacSx7n/oVkFUw2Cjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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

--------------Cm0ZF9Uq7ayV13TEUI3aE04W
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kunal,

On 4/14/2026 6:14 PM, Joshi, Kunal1 wrote:
>
> Hello Karthik,
>
> On 07-04-2026 15:22, Karthik B S wrote:
>> Currently the test is rejecting all the outputs where the mode is not
>> matching. This is leading to excessive skips on configs wherer the tests
>> were passing previouly.
>>
>> Instead of this, use default mode for fixed mode panels if the required
>> custom mode is not found. And use custom mode for external panels as
>> these are allowed and have also been passing previously.
>>
>> Cc: Jason-JH Lin<jason-jh.lin@mediatek.com>
>> Cc: Kunal Joshi<kunal1.joshi@intel.com>
>> Signed-off-by: Karthik B S<karthik.b.s@intel.com>
>> ---
>>   tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 37 insertions(+), 20 deletions(-)
>>
>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
>> index 4df5c2cee..4a32ec811 100644
>> --- a/tests/kms_bw.c
>> +++ b/tests/kms_bw.c
>> @@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
>>   	igt_output_override_mode(output, mode);
>>   }
>>   
>> -static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
>> +/* Check if output has a matching mode and call it out if mode is being forced */
>> +static void output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
> Since the function is now void and purely informational, the name
> output_mode_supported no longer reflects what it does. Consider renaming

Thank you for the review.

Sure will update this.

>>   {
>>   	drmModeConnector *connector = output->config.connector;
>> +	drmModeModeInfo *default_mode;
>>   	int i;
>>   
>>   	/* Virtual/forced sinks support all modes */
>>   	if (!igt_output_is_connected(output))
>> -		return true;
>> +		return;
>>   
>>   	for (i = 0; i < connector->count_modes; i++) {
>>   		drmModeModeInfo *conn_mode = &connector->modes[i];
>> @@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
>>   			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
>>   				  mode->hdisplay, mode->vdisplay, mode->vrefresh,
>>   				  igt_output_name(output));
>> -			return true;
>>   		}
>>   	}
>>   
>> -	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
>> -		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> -		 igt_output_name(output), connector->count_modes);
>> -
>> -	return false;
>> +	if (output_is_internal_panel(output)) {
>> +		default_mode = igt_output_get_mode(output);
>> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes).\n"
>> +			 "%s Default mode: %dx%d@%dHz\n",
>> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +			 igt_output_name(output), connector->count_modes, igt_output_name(output),
>> +			 default_mode->hdisplay, default_mode->vdisplay, default_mode->vrefresh);
>> +	} else {
>> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes). Forcing mode.\n",
>> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +			 igt_output_name(output), connector->count_modes);
>> +	}
> Previously the matching case returned immediately from inside the loop.
> If that early return is removed without adding equivalent control flow,
> then when a matching mode /is/found the function will still fall through
> and print the "not supported" message afterward. In that case we would end
> up logging both "Found matching mode" and "not supported" for the same
> connector/mode pair.
Will fix this.
>>   }
>>   
>>   static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
>>   	igt_display_t *display = &data->display;
>>   	igt_output_t *output;
>> +	drmModeModeInfo fb_mode;
>>   	struct igt_fb buffer[IGT_MAX_PIPES];
>>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
>>   	int i = 0, num_pipes = 0;
>>   	igt_crtc_t *crtc;
>>   	int ret;
>> -	bool has_supported_mode = false;
>>   
>>   	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
>>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
>> @@ -242,14 +250,26 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>   		crtc = data->crtc[i];
>>   
>>   		output = physical ? data->connected_output[i] : data->output[i];
>> -		if (!output || !output_mode_supported(output, mode)) {
>> +		if (!output)
>>   			continue;
>> -		}
>>   
>> -		force_output_mode(data, output, mode);
>> +		output_mode_supported(output, mode);
>> +
>> +		/*
>> +		 * On fixed mode panels trying to force a custom mode can lead to failures or
>> +		 * implicit handling where the default mode is used even though custom mode is requested.
>> +		 * To avoid this use default mode on fixed mode panels and
>> +		 * use custom modes only on external panels.
>> +		 */
>> +		if (output_is_internal_panel(output)) {
>> +			fb_mode = *igt_output_get_mode(output);
>> +		} else {
>> +			force_output_mode(data, output, mode);
>> +			fb_mode = *mode;
>> +		}
> For internal panels, the subtest will always run at the panel's native 
> mode
> regardless of what mode the subtest requested. So a subtest meant to 
> stress
> e.g. 4K@60 bandwidth will actually run at whatever the native eDP 
> resolution
> is. The test will pass but it won't be validating the bandwidth 
> scenario the
> subtest name implies.
>
> For internal panels where the requested custom mode is not natively 
> supported,
> instead of silently falling back to the default mode, skip that output 
> for that
> specific subtest (also prefer external panel first to reduce skip's),
> since the bandwidth scenario cannot actually be exercised on that panel.
>
> I know we are doing this so we eventually have less skip's, but 
> someone who won't
> know this fact may have false sense of coverage (i.e we tested 4x4k).
>
> Other alternative would be changing test description to state test 
> exercise's standard
> modes on external panel with default mode internal if present. This 
> scenario is more likely as user will
> have internal panel running along with some external display's connected.

This is something even I was contemplating on which direction to take. 
But I leaned on using the fixed mode panel finally, as without that 
we'll completely leave out one of the displays.

I will update the test description and also see if the test name can 
also be updated to call this out more clearly.

Thanks and Regards,
Karthik.B.S
>
> Thanks and Regards
> Kunal Joshi
>>   
>> -		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>> -				    mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +		igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
>> +				    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
>>   				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>>   				    &buffer[i]);
>>   
>> @@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
>>   		igt_info("Assigning pipe %s to output %s with mode %s\n",
>>   			 igt_crtc_name(crtc), igt_output_name(output),
>> -			 mode->name);
>> -		has_supported_mode = true;
>> +			 fb_mode.name);
>>   	}
>> -	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
>>   
>>   	ret = igt_display_try_commit_atomic(display,
>>   					    DRM_MODE_ATOMIC_ALLOW_MODESET |
>> @@ -273,9 +291,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>   
>>   	for (i = 0; i < n_crtcs; i++) {
>>   		output = physical ? data->connected_output[i] : data->output[i];
>> -		if (!output || !output_mode_supported(output, mode)) {
>> +		if (!output)
>>   			continue;
>> -		}
>>   
>>   		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
>>   		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
>> @@ -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>   
>>   	for (i = n_crtcs - 1; i >= 0; i--) {
>>   		output = physical ? data->connected_output[i] : data->output[i];
>> -		if (!output || !output_mode_supported(output, mode))
>> +		if (!output)
>>   			continue;
>>   
>>   		igt_remove_fb(display->drm_fd, &buffer[i]);
--------------Cm0ZF9Uq7ayV13TEUI3aE04W
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kunal,</p>
    <div class="moz-cite-prefix">On 4/14/2026 6:14 PM, Joshi, Kunal1
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com">
      
      <p>Hello Karthik,<br>
        <br>
      </p>
      <div class="moz-cite-prefix">On 07-04-2026 15:22, Karthik B S
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
        <pre wrap="" class="moz-quote-pre">Currently the test is rejecting all the outputs where the mode is not
matching. This is leading to excessive skips on configs wherer the tests
were passing previouly.

Instead of this, use default mode for fixed mode panels if the required
custom mode is not found. And use custom mode for external panels as
these are allowed and have also been passing previously.

Cc: Jason-JH Lin <a class="moz-txt-link-rfc2396E" href="mailto:jason-jh.lin@mediatek.com" moz-do-not-send="true">&lt;jason-jh.lin@mediatek.com&gt;</a>
Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com" moz-do-not-send="true">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com" moz-do-not-send="true">&lt;karthik.b.s@intel.com&gt;</a>
---
 tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4df5c2cee..4a32ec811 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
+/* Check if output has a matching mode and call it out if mode is being forced */
+static void output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)</pre>
      </blockquote>
      Since the function is now void and purely informational, the name<br>
      output_mode_supported no longer reflects what it does. Consider
      renaming</blockquote>
    <p>Thank you for the review.</p>
    <p>Sure will update this.</p>
    <blockquote type="cite" cite="mid:cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com">
      <blockquote type="cite" cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
        <pre wrap="" class="moz-quote-pre"> {
 	drmModeConnector *connector = output-&gt;config.connector;
+	drmModeModeInfo *default_mode;
 	int i;
 
 	/* Virtual/forced sinks support all modes */
 	if (!igt_output_is_connected(output))
-		return true;
+		return;
 
 	for (i = 0; i &lt; connector-&gt;count_modes; i++) {
 		drmModeModeInfo *conn_mode = &amp;connector-&gt;modes[i];
@@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
 			igt_debug(&quot;Found matching mode for %dx%d@%dHz on %s\n&quot;,
 				  mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
 				  igt_output_name(output));
-			return true;
 		}
 	}
 
-	igt_info(&quot;Mode %dx%d@%dHz not supported by %s (has %d modes)\n&quot;,
-		 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
-		 igt_output_name(output), connector-&gt;count_modes);
-
-	return false;
+	if (output_is_internal_panel(output)) {
+		default_mode = igt_output_get_mode(output);
+		igt_info(<a class="moz-txt-link-rfc2396E" href="mailto:Mode%dx%d@%dHznotsupportedby%s(has%dmodes).\n" moz-do-not-send="true">&quot;Mode %dx%d@%dHz not supported by %s (has %d modes).\n&quot;</a>
+			 &quot;%s Default mode: %dx%d@%dHz\n&quot;,
+			 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
+			 igt_output_name(output), connector-&gt;count_modes, igt_output_name(output),
+			 default_mode-&gt;hdisplay, default_mode-&gt;vdisplay, default_mode-&gt;vrefresh);
+	} else {
+		igt_info(<a class="moz-txt-link-rfc2396E" href="mailto:Mode%dx%d@%dHznotsupportedby%s(has%dmodes).Forcingmode.\n" moz-do-not-send="true">&quot;Mode %dx%d@%dHz not supported by %s (has %d modes). Forcing mode.\n&quot;</a>,
+			 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
+			 igt_output_name(output), connector-&gt;count_modes);
+	}</pre>
      </blockquote>
      <span>Previously the matching case returned immediately from
        inside the loop.<br>
        If that early return is removed without adding equivalent
        control flow,<br>
        then when a matching mode </span><em><span>is</span></em><span>
        found the function will still fall through<br>
        and print the &quot;not supported&quot; message afterward. In that case we
        would end<br>
        up logging both &quot;Found matching mode&quot; and &quot;not supported&quot; for
        the same<br>
        connector/mode pair.</span></blockquote>
    Will fix this.
    <blockquote type="cite" cite="mid:cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com">
      <blockquote type="cite" cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
        <pre wrap="" class="moz-quote-pre"> }
 
 static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &amp;data-&gt;display;
 	igt_output_t *output;
+	drmModeModeInfo fb_mode;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
 	int i = 0, num_pipes = 0;
 	igt_crtc_t *crtc;
 	int ret;
-	bool has_supported_mode = false;
 
 	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -242,14 +250,26 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		crtc = data-&gt;crtc[i];
 
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
-		force_output_mode(data, output, mode);
+		output_mode_supported(output, mode);
+
+		/*
+		 * On fixed mode panels trying to force a custom mode can lead to failures or
+		 * implicit handling where the default mode is used even though custom mode is requested.
+		 * To avoid this use default mode on fixed mode panels and
+		 * use custom modes only on external panels.
+		 */
+		if (output_is_internal_panel(output)) {
+			fb_mode = *igt_output_get_mode(output);
+		} else {
+			force_output_mode(data, output, mode);
+			fb_mode = *mode;
+		}</pre>
      </blockquote>
      For internal panels, the subtest will always run at the panel's
      native mode<br>
      regardless of what mode the subtest requested. So a subtest meant
      to stress<br>
      e.g. 4K@60 bandwidth will actually run at whatever the native eDP
      resolution<br>
      is. The test will pass but it won't be validating the bandwidth
      scenario the<br>
      subtest name implies.<br>
      <br>
      For internal panels where the requested custom mode is not
      natively supported,<br>
      instead of silently falling back to the default mode, skip that
      output for that<br>
      specific subtest (also prefer external panel first to reduce
      skip's),<br>
      since the bandwidth scenario cannot actually be exercised on that
      panel.<br>
      <br>
      I know we are doing this so we eventually have less skip's, but
      someone who won't<br>
      know this fact may have false sense of coverage (i.e we tested
      4x4k).<br>
      <br>
      Other alternative would be changing test description to state test
      exercise's standard<br>
      modes on external panel with default mode internal if present.
      This scenario is more likely as user will<br>
      have internal panel running along with some external display's
      connected.<br>
    </blockquote>
    <p>This is something even I was contemplating on which direction to
      take. But I leaned on using the fixed mode panel finally, as
      without that we'll completely leave out one of the displays.</p>
    <p>I will update the test description and also see if the test name
      can also be updated to call this out more clearly.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com"><br>
      Thanks and Regards<br>
      Kunal Joshi
      <blockquote type="cite" cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
        <pre wrap="" class="moz-quote-pre"> 
-		igt_create_color_fb(display-&gt;drm_fd, mode-&gt;hdisplay,
-				    mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+		igt_create_color_fb(display-&gt;drm_fd, fb_mode.hdisplay,
+				    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
 				    &amp;buffer[i]);
 
@@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		igt_plane_set_fb(data-&gt;primary[i], &amp;buffer[i]);
 		igt_info(&quot;Assigning pipe %s to output %s with mode %s\n&quot;,
 			 igt_crtc_name(crtc), igt_output_name(output),
-			 mode-&gt;name);
-		has_supported_mode = true;
+			 fb_mode.name);
 	}
-	igt_skip_on_f(!has_supported_mode, &quot;Unsupported mode for all pipes\n&quot;);
 
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET |
@@ -273,9 +291,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = 0; i &lt; n_crtcs; i++) {
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc[i], &amp;captured[i]);
 		igt_assert_f(!igt_check_crc_equal(&amp;zero, &amp;captured[i]),
@@ -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = n_crtcs - 1; i &gt;= 0; i--) {
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode))
+		if (!output)
 			continue;
 
 		igt_remove_fb(display-&gt;drm_fd, &amp;buffer[i]);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Cm0ZF9Uq7ayV13TEUI3aE04W--
