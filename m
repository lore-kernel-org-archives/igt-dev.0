Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B244CCA470
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 03:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1428A10E1C0;
	Thu,  9 Oct 2025 03:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBMBMbZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD0D10E1C0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759982245; x=1791518245;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZCPaWPNhi5we159vdMlswaQy8yY1RMlzwWzg0YenV+4=;
 b=OBMBMbZxwK0H8xHay+xJNHMvVMezX1uPxpZ9e+ree2PAEv5HJsdWgZUQ
 FZ+G9RYumevZSd+ryMFLfaLd6NqCamu4dv/aq7ON/+3K1zcGJIcxwueh2
 P/GowamzhkWC4G7p6V/KWOWNOqpFHco409dtjOjNzwOSMDZ8+0elSiEcl
 Qay5NeW1f7T6x+NO9ShqcK5+H9ImSo160mELef8MDnsOSkkmsIeggc6h7
 s8ge97QniherPMmGL/JtrBj2ZnS7vZq8oyKKIg6FazNdH5FZMVjAn3qsZ
 RSzUBMlxJiNw59CSSS/8OcL9ByubltldZlG1ZDYM7Sit6b5TPlkPnPFUV w==;
X-CSE-ConnectionGUID: jOQRGLYcSXKgPyLFnityuw==
X-CSE-MsgGUID: Pix4vK/9TRi75Q1uOIb99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72863327"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="72863327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:57:25 -0700
X-CSE-ConnectionGUID: bisbWAGNQEC4+T1ako2hAA==
X-CSE-MsgGUID: g1sZpRSsT4uzVArGvP53JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="181370785"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:57:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:57:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 20:57:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSw37diqGLYRuuFtKoMjmN9yUox5YCLFYVXr+fNWi5DJQnZYBRbedEU0nftM5znFrxHf5rPHEZ5WWTykpleRrPjsez/YFq17eZ8RIr0PR5fr/u+jkMOqzNpl3rLAggqNlbjjO9a98UYDroQzyR6pzxAlqm6QBHyo3wu7J9VALisyS1c+C3Se53riuH58NPKXBQCw06afA0aytn+zxlEKWi0gRoIIM/3ao5K9FjKdtZS09fQkEQUu22ZfAScXVFg5/vecxhoGCCwMZHBjycvv+FOrvh6bJbQ2IYUdnrZSeHqW8zsttBfHiXqRgcDU5OuAcxOvIKklBIUecgZ4E+iYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHuevrlK85DIV1yuYwQaY8R5XMR0vZe1AI20JZj2W6M=;
 b=Io1+ORJUJfZsnd5XXrr2cOwBtguZMTMRzBJtswRnpD54GvRDwDcHBGNj6waKzlfMl6NtNQTxuO+bRXIuLqjXebo4+95b3rk/LGwFR/rB+HvvKFiNJut9gb3GNVDCmwpYC55QHFBZe3fxQfq+GerbDi/7Tp6ZrOAaeB6Sg9sZbTP30cFEOWM6XBc8UHflAYAd9lwebz8C7VILH7pfJp0C9QVztLpEL8BHOpiazFJXeEhc68QTMvoogV9QTtNiUmeUKw6D9exwt+BNuziLsGHBJdfpiuu+RTn+SxnBL8wLqxj7xLfzx84mk6OkD2wyW/yyPa6SqcWm7kL1Jvd1oiIZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 03:57:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 03:57:12 +0000
Message-ID: <12bfafd7-f17e-442b-9618-fdeb51e291e4@intel.com>
Date: Thu, 9 Oct 2025 09:27:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Check timing twice before
 asserting basic subtest
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250904034529.1264989-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250904034529.1264989-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f948e3b-a8b5-43e7-03a9-08de06e7ed4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdKYkFYQXBTT3hsMFBINUNTM09FV1NNSUJ4cUIvcVNDeEdBcE5zVHV4ZFFG?=
 =?utf-8?B?dzRHekVHSzJGMm0xbDZhMHBaS3c2M0tKOUFHU2EzaHVmMmRyUWRiVmFpL1FZ?=
 =?utf-8?B?ZG04TmNReEZPK2lpZ0Q1aytGVlNKcGliTEtTUGxXd0VSZmtEalRMaVJJc0FM?=
 =?utf-8?B?NXBwS3Y3T3hjSTRGOGtvUFc4bUtJTVh5WFRoVHZtQVZuOHRuZWloV3RGY1dS?=
 =?utf-8?B?TklIS2F3UWgzaHBtT2xQaXVzT3lxSHRwbEJhUitEUVpMTjEwZmFtc2FNWnFL?=
 =?utf-8?B?MGdNMkZIQTFVb29OZW5CL2RHd1BlcTZ2NG90cDl0aUZIYzh1WVFlYis5QytQ?=
 =?utf-8?B?U3JlWW9BSU1iVmFrcFQ4NGJEQ3JxV3pYVk9VRUo4em94SklDZWlsL0VsZ0U1?=
 =?utf-8?B?Zy9yTTZBRjlwdk4wcE54MEp5OWZhanFQMnRXTkpOV3pGUmlNQ1lGMkRzYytJ?=
 =?utf-8?B?ZXk4ejNLM3p2bWhNQk9oZDA3cHZkUmJpRHE1bTdKZjJ1TGwwcmUrKzQ2cVRy?=
 =?utf-8?B?ZU9Xc2NKNktKZksxTXc0cDdjVk8yVGRCRmVrU0dBNnV5SXFZNUJqYVRpWmw1?=
 =?utf-8?B?ZkNkaWgvZUNTZ2xrK01EaUZBcEJvaFcwQ0k0TTkwV3o3ZGs0VGRMNlR2ZnQ0?=
 =?utf-8?B?amcvRmlNdCtGQlRwU3FHZnVRdlJHVkJqNUlycmdOWFl2aVRSUDNzZEttQmN5?=
 =?utf-8?B?c2VxOFJrNXNpV1lieDd5Rk9ZblJFbFpWNkZVQU1pZi9ZZ0V3c2Q0SGpIcUhm?=
 =?utf-8?B?amhwTUpOVFIzc3R4aUJ0S2NyQ3ZXMjFiem0ya2I5MkNDVXJNMnkrbUN6Y01Q?=
 =?utf-8?B?QlVvRVZ2M0hWU2xSWWZnRkZCc052bzN3cko2Z3N5UDF2RlR2NDZYdE1yWGgy?=
 =?utf-8?B?Qi9lWmxZVit4Y2RRMG1QdnJiOWFKc1I4WDJLMllYY2xOYzhFSTZYQ3ZXODVF?=
 =?utf-8?B?WVpSZGcyTmZjTVAzY1hqWDNTUlo1L1hmTU1JeGFaUjJoVGxsL3NlZU53N2hF?=
 =?utf-8?B?ZGJVN0gzUlFUaGgvbERNVExYdlR1Z3B2bWFwcFJhcFAyMUJEeXNXYWFINTFK?=
 =?utf-8?B?RTJNeTNnN0J5b1hIakVvWHovWFp1enNiRmFEdjVwV0cvV2t4UTIvZ1k3d2Fz?=
 =?utf-8?B?WjdGUWE3ZTFiNm1XQTJFVEZuM1B0TjlpWWJBbnN2c1U1NG1WbWFDU0xHc0ha?=
 =?utf-8?B?TnlMdXNHSWhwL280RkVkZ0Z0TldDR0ppYXNPZHFnZU14Unk3YVk2RXhmY0dm?=
 =?utf-8?B?TVJjeE5VQ20xazFjd1B1U1A4TnVUWndtWFhEdTJDNmJ3bWlUNkJEeDgrQ0ZK?=
 =?utf-8?B?YjMxSkRKQ3NTUlFFd1V3ZE9HYkd0OGZOMUI5WUhGd0Y4ZitRKzRXSWdkemNS?=
 =?utf-8?B?MmNvRko4UlpIMktiMGcvNzIwZVkzbStUWkwyK3BKWm9WeWVybC90elE3ZW1h?=
 =?utf-8?B?NjFQY2RVUk4rMnNjS0V6L3RUNExJOS9QaTF4VHMrSUl2dEFiQXBpTEVlYVlS?=
 =?utf-8?B?OVIrVEozaDIxZnV2T1dta2l3VGkwbm95VGNTdWlzdE5yb1lzSlpMSndLTlJT?=
 =?utf-8?B?VjhxUXh3SVZDVnBQMzRGUjlpM3JnZXFOa25qZ0NtWm95N2NtWUhEbHlzL2J1?=
 =?utf-8?B?YkwwVm9ncUFPTnBJS3htdnJYOG1YWS9taVdOWUNkcWhNRkJxK0NRczgzeU4v?=
 =?utf-8?B?L21qZjY1MGhnbUpmL09SdXFwUmUzbC95d2JUaVozMzBZaElhM2ViL0tUUEtS?=
 =?utf-8?B?OUxrdlcwQ3lqY1BML0pQbGhXZW1vWE5IaE9xdWhybis1dUhWYXlhWHVJdjVw?=
 =?utf-8?B?bmRYVTVLZGs2cnZMc3o4S3p1cTBSMUZ0Rm5FNHpYd2hvdWxQNmFmRkgwa1FH?=
 =?utf-8?B?L0Y5RVNyM2pzQVNvbzRhWUdhRUUybjdLMXVjRzJ1SnJxOGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blAvL1BDZ1FpbndGMFljVHBkZGhJc25jSUFrcldKZFNvc09UYzVVaXViamVt?=
 =?utf-8?B?cHRmSFJrK2FOMG13aTg0RG1KdmlXanQyQW9ZLytWYVVPTUJLOEVVc2VxM1l6?=
 =?utf-8?B?dGlnZ0w3c0JxSWhQaDd1SEZuQUxEV2hVOE0vNjZ3WmhzUUI2TmJXaVE5bHRW?=
 =?utf-8?B?aUNyamFRMlJjT2hFdlU4M1Z4OGJpdC9YcFVZcEFXaWlONHJEMlVnVHRFRk9a?=
 =?utf-8?B?eHVpaEdHMGNuRUF2cXAwcDdTOHRMc0tmZElmM2Y0VGp5aEVVSERrRW9sUy9v?=
 =?utf-8?B?a2NoTHRLdzdaYXNnenl6dEovaGxsQ0xDajJ2Uk5jQkl3VG92U1c4Z251c01H?=
 =?utf-8?B?SnZJOUlndlB3QytVYUJ2d3M0WEs3ZmVmMHFnUzhrcWZCZEphZlZ3ZjRnQlFX?=
 =?utf-8?B?eVlwQlR0SnV2em9aY2s3Rzk0Vnk5UUtLc0NMUmhPSnRRbWdLckpoVkZadEZO?=
 =?utf-8?B?amJvaG5IRitJY0pZM0JtQ1JxaW1yMTNQamNNNU85ZUhOa09MT0dpcUNDdmpM?=
 =?utf-8?B?S29MSWV5alByckhPdU1aZ0JSUWkwS2VqNXJZZVl4OEdKVStURk5rNHJSNlZp?=
 =?utf-8?B?RWFRNUtnVHFQa2NTdTF1RFA3SlRSVWUvd3l2UUZ1bWNzNTEvalQ0RU02RkY5?=
 =?utf-8?B?aGwyREpiNTFIMW5oL1MvUTlrT0xHQzNNQlZMWVRhUG5yZDBicjY1a2J0b1VJ?=
 =?utf-8?B?cXRIVVdMKzB3SkdsdWNCbk5kckp0djRieHVIWVRDTTgwK1dtNmxrb0ZjWmU5?=
 =?utf-8?B?Z3JXU1FNNnFkUko2VWtvRmh4WW9KYWRhUjUvdmwzQk5yUG5tL0RmbGs0WWt4?=
 =?utf-8?B?RDIxTWdiNUJZeThyaWh1cVIvMmx6eWhLZUN1Tll3RUg0V3IyR0xOb1BzbTBh?=
 =?utf-8?B?T1VyTGg2d1ZZUytYSlRxVVROa0oybWlkeXc3azdXRk9LV29jdzIyaEUzdTJH?=
 =?utf-8?B?YSthSjBaYUZiOHI5SWJzbmRkdFpsMGhYazJyR3l3T21PdzNKTHpKMkk5Vmh6?=
 =?utf-8?B?QlY1YmNWSGd4YkFscG5GdWtBVVNkZVdrVGl3RjZPN01ocHQ3czd0Y0lacThU?=
 =?utf-8?B?S3RaSXlPRFhMZTQ2bnVYSEhTYy94eTlhbkI5TEQvdytneWxIQ3ZaVlI2WXFr?=
 =?utf-8?B?SkpiM3FrdHlCVjhUWW04aVNlYVk5aTcxTUlTcmptd0pyeGo0ZXdkemlKUWUr?=
 =?utf-8?B?NnV4SWNTUmdhRDlEajBVTStoK0V1ZnBxRTRHSTkwYkxZY3hocXFhcUJWYUpn?=
 =?utf-8?B?ajE5bi9IUVpSTXpwbWtnamJOMzFCN3QwK3JZbVkxVU54cndiMmI5dTNhUUlF?=
 =?utf-8?B?UFRHQ2RxUXNSL213M1pQUnpXMk9OY2hQZkl6N1VUV2Q4WXhTM2V1dW9Fb0pq?=
 =?utf-8?B?b2xSYjlVa3lsYUU4cDdRYTdtN05FbXhXclMxc3dzZ0MwcS9jaHowazRSV3Zl?=
 =?utf-8?B?eGJhMkZxd3Z1bit5Tzk5c29Ydy91d0dXL3dVeXltVHdZNE85cVc2RzR5Kzht?=
 =?utf-8?B?WGZ1T002Q0dtVWkzUDJ3MWQvK3F5Z3R2eEw0NU02akMvazJPN0VDRkN3VnNn?=
 =?utf-8?B?SHBuVmNrZm1qekJ5djJEOTR5RkJWb3BqakNQS1N3SEpyNDRHd2Y3czhSMEpi?=
 =?utf-8?B?bDQ0YmVDWUc2SHp1ZFU4aGJlRW9rcmNOWkZKbG5UbHFVcCsxd0NEMGFzc0Ey?=
 =?utf-8?B?VUliNXYreXp0TTU5WmJ0b3FCYjdseklwL1YyRGhXVFcvYjhZSC84Mi9lNDVp?=
 =?utf-8?B?cU8vWTlpWHAwS3hvbk5YWEZqdVp2ZEYvODBSZXBWRTRteGNQblpIY095c1cz?=
 =?utf-8?B?QjJpaVpLdEpFU0xBNmtoWjJFSXNxMWdZS0NlVlBNRGNKUkcrRzY5dHNTRmRl?=
 =?utf-8?B?OXhSVjRYUCtTbWpvaWxWSFVsRGpnLzFLNEZUcTdZdzAxVkk0THUrL1FDWENI?=
 =?utf-8?B?a09ndXRNeDRibHM2UXJSMFZmV3BoMUU2cWd1WHJkdHVFbGl4OWdLSG1PYWow?=
 =?utf-8?B?M3dFUGtyVFBwT0QwSEk4WTRiVEY0TWJpbzJ2MHBoN1k3TU5BL1JSWFNMZ0FR?=
 =?utf-8?B?eTJCeFVsNmpXcVk1VEFFV3dLU1djaWZkZTVPdlZ4aWtYMnVMKzZoZTNHbGRS?=
 =?utf-8?Q?Kk+51W2AqPwpaXiVK0ukARpft?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f948e3b-a8b5-43e7-03a9-08de06e7ed4e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 03:57:12.5163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT+hlQUuo0W4pWFwXX80s/pPjZAwP+HbaND9mMEVAIvYGEhSTuGqSjiA5R5zl7eKaMUZlrIelJfHTLxemNlplg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
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

Hi Jeevan,

On 9/4/2025 9:15 AM, Jeevan B wrote:
> The check_timings() function previously failed tests if vblank timing was
> slightly off. This was too strict in general and caused false failures due
> to small timing variations, especially on some displays.
Please update the commit message as we're not making changes in 
check_timings(), but just adding a retry. IMHO, the current message 
conveys that the existing check is too strict and with this patch we're 
making it more lenient, which is not the case.
>
> This change adjusts the accuracy check to allow retries and provides more
> flexibility for minor timing differences.
>
> v2: Fix commit message and add igt_info for retry.
> v3: Rebase.

Please add Closes tag.

With these updates, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 43 +++++++++++++++++++++++++++++++------------
>   1 file changed, 31 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..753c65ec0 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -461,7 +461,7 @@ static int test_stealing(int fd, struct crtc_config *crtc, uint32_t *ids)
>   #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
>   #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
>   
> -static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
> +static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   {
>   #define CALIBRATE_TS_STEPS 120 /* ~2s has to be less than 128! */
>   	drmVBlank wait;
> @@ -540,9 +540,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   		 100 * accuracy / mean, accuracy / line_time(kmode));
>   
>   	/* 99.7% samples within one scanline on each side of mean */
> -	igt_assert_f(accuracy < line_time(kmode),
> -		     "vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> -		     accuracy, 100 * accuracy / mean, line_time(kmode));
> +	if (accuracy >= line_time(kmode)) {
> +		igt_info("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> +			  accuracy, 100 * accuracy / mean, line_time(kmode));
> +
> +		return false;
> +	}
>   
>   	/* At least 90% of frame times fall within the one scanline on each
>   	 * side of expected mean.
> @@ -565,12 +568,18 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   	 * See:
>   	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
>   	 */
> -	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
> -		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> -		     expected, mean, stddev,
> -		     fabs(mean - expected),
> -		     fabs(mean - expected) / stddev,
> -		     fabs(mean - expected) / line_time(kmode));
> +	if (fabs(mean - expected) >= max(line_time(kmode), 1.718 * stddev)) {
> +		igt_info("vblank interval differs from modeline! expected %.1fus, "
> +			 "measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> +			  expected, mean, stddev,
> +			  fabs(mean - expected),
> +			  fabs(mean - expected) / stddev,
> +			  fabs(mean - expected) / line_time(kmode));
> +
> +		return false;
> +	}
> +
> +	return true;
>   }
>   
>   static void test_crtc_config(const struct test_config *tconf,
> @@ -654,8 +663,18 @@ retry:
>   
>   	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
>   
> -	if (ret == 0 && tconf->flags & TEST_TIMINGS)
> -		check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
> +	if (ret == 0 && tconf->flags & TEST_TIMINGS) {
> +		bool status = false;
> +
> +		for (int attempt = 1; attempt <= 2; attempt++) {
> +			status = check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
> +			if (status)
> +				break;
> +			igt_info("Timing check failed on attempt %d, retrying...\n", attempt);
> +		}
> +
> +		igt_assert_f(status, "VBlank timing test failed after 2 attempt(s)\n");
> +	}
>   
>   	return;
>   }
