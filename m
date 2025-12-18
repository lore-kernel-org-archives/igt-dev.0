Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B6D6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05010E44E;
	Thu, 18 Dec 2025 19:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qj/4Oe8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EE710E44E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086458; x=1797622458;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/2LTrpbjttYmkNScz/he/6DzLzxXlocQPmH11JSO3I8=;
 b=Qj/4Oe8uB7Sd5kzx8Tnv57P+2Ucn68Hr87l0LBmekM4zR/T6a8dXOn/b
 AEtXrMmDKOVaReSLBryN4rvYojDlPtc2amWD7feSvrvj9U3TRytkkfr1E
 m2jhS2aqr21JqdRCgagsvrOF9pqFG3pYIe5TK/OvrznlRSnGWuMg9Vv9H
 0gMmp9DUMXvQ018JHmvUET0BZQpbg1SbtygK2nOznCnc4Z3F1muY1yT1r
 GfC2mfc7b3eHmPufvWu3VgsHUo/e9G/r6JsquYD+F45zSu8bSf+Im8FEw
 LMWzs4G3UFcnEMUyR0sM8oE5N5MAuhXi42K2vQIptc2fx5i0lXdhnBNir A==;
X-CSE-ConnectionGUID: ysN5+oFtTdmAGRj8YAAZ2Q==
X-CSE-MsgGUID: nl4FRYErRSOy3WHrlVOxOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78685732"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78685732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:34:18 -0800
X-CSE-ConnectionGUID: opLkTLdcQbSiDzjdHYtwiQ==
X-CSE-MsgGUID: KhwNeSDRRwOydOBbQTPfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229341022"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:34:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:34:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 11:34:17 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:34:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYw4bNXFjgL47K5+4pmEvA3iSvPC08nEeYeBI3OwyfCTiWcC4AZ8bkoeFdXexr5wVWHQKQh4cFf4fR20x2seZ5MEacPPSStiFffSqlOOgtfifVtSlp6e226eQRrBRD/69nwtIDYxZk68vOKQSSh1QcseRWayhp6WETeiKK4DaRH0GPSoB9LSxkYah28KD5ttLNtUF8NRFJVKLk/lGPiBvukFKsRPG7zt6F8pJrUep09tLQmMXNQqH5KvY9lg2NxnXqJO0vH0AkwLylZDgLIj9J+Q2D+kTLS0/NsxZ9Et8SSj/G51UBscziROA8yLs48IWGPkYU68wIOXr9tisNfzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvBbqQMpORUWGiNKccnUvO4b97bbTiqzK6hNQh5AqWU=;
 b=eZK0c+3OKAQ25kmBhBLmevDG2br0Z7Qqk70E58JJgVfywJMrn/uaapUxgz7OcexfAbVKnuobGx2TGYz5iYf9xVy/jreQkXRXOC+ZIDzS7LJx/XWUAtcU7PH3L4TFcZFHWHiGi+EFgM/NtqmBZVTJAukWZ4p8f4QKBh/vhGYBLlSA0wBrPh+bQ4+U6+ETVqLuFA4eBCSlhpdC0MeTjlRuBwJicH8AGtKPS/3/uhjJTDcJvDcU5dVK8Cv3wxmHpNTlHFpPP3jXvJWbh7whneQHDqnvw0PdbEWDYzWXnd4j6DY4Xt8pp1kJpX98hQ9YRyL6Xu7W13gFfGiInwvNEGLYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 19:34:10 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:34:10 +0000
Date: Thu, 18 Dec 2025 20:34:02 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v4 3/3] tests/intel/xe_exec_system_allocator: Add
 new SVM compute tests
Message-ID: <aURXKp45mFK15TgO@fdugast-desk>
References: <20251218125906.124925-1-francois.dugast@intel.com>
 <20251218125906.124925-4-francois.dugast@intel.com>
 <garzty6xbbx7z5datytfvqnhh6iycy7ccy56qa6xbsocgmlhxz@rgvz7lhuvytw>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <garzty6xbbx7z5datytfvqnhh6iycy7ccy56qa6xbsocgmlhxz@rgvz7lhuvytw>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e85beb-affb-4473-94d3-08de3e6c6a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjFoTm9RNUd6c3AzSHVJdCtNQlBzTDJSWTdLYm04MHZyK1JTWWxFRzlsSTBY?=
 =?utf-8?B?UW5qVXFLWVJrSUcvYmFEQWo5ZC9HdTRIQUJlbi9sM21WQUdmQWtJZ1V0Zm41?=
 =?utf-8?B?cTZCK0pXRjdXbE5MQ00zN0U1SHVNdmxDaHNNa3l2WmRXSU5ySHBUR1pCNjJu?=
 =?utf-8?B?NmRWdkM5VVdlNXhpRzhaWXRHQngrY1NMM29EZ3BMRzlQVnI3dXd2T2c2ejdZ?=
 =?utf-8?B?M1Z3U3M1bGRNMEhwRWt2UitqcnJ5YTIwSXRuUFVVL3M5OGt0WTJmWHNSc2xG?=
 =?utf-8?B?UEhNQW1EZjFsL0tvNjlYL05tcWZqZXIxWFlMYzJvM1gwaEEwb3AydjJBQkJT?=
 =?utf-8?B?ckpqeXpjWlFaRjBwRGxaMjlRL3BGcm9BaGgzb0w4eHNnRHNSVkdGUFN6RzdG?=
 =?utf-8?B?U0lhRGJ5Zzl6dURqcG9EN1dXZncxenM1TEpYKzIrdks2aDFtdk9yNWF5Wkdl?=
 =?utf-8?B?UExKZGpNUmhUSzM3S3praUlsM1A5VG0xbXpmYlk5VkZnanFtTkUwY202SXp0?=
 =?utf-8?B?bXErRWxoWStBVDNKM2FOd0cyc2p1TzhLOE01YTFobnJOTzFCRHJpeXl5ZzhK?=
 =?utf-8?B?VEtEbnB3Y3RpdEJMeDlkay9RbmdjdTRRT203KzBXZ0FsbEtmMU9xT3lMaW9D?=
 =?utf-8?B?REJqaWpBclJmN2FXaEp4Vm5uREpPcm0wbVA4SzEwMy9uSzZyNytjM0tlUGhv?=
 =?utf-8?B?VVhPS2c5NVlXcmhSVDVTWmdkdUIxRWJNMS9tRmU4TjdDTis4WXBrMTNUTjRv?=
 =?utf-8?B?S3lFY2hyTXVvVDBhSnNjKy9QMHJrU1JLMWt5RnVIckh5WXg5bHlsMlRFTzRX?=
 =?utf-8?B?VDdnMzVuQ1lGVFEvdVpmMVJxR01RTFFXNm5hRWFYMFRPTm9rdnF1UkpoZERR?=
 =?utf-8?B?QkJIaWdyWVc4VExmR2IrckNCcENLVWR1ZWNtK3F5K29MbmlrRElxMVE0U2VK?=
 =?utf-8?B?bU1aSzY2VUp0bnBTMmpZMW9CQ3pDRVpyQmtFUGo0NWlTaSsyRzZ3L3lUUHlK?=
 =?utf-8?B?OXpRMithUmMrb2xjRnNoMUhsQWdmTXFtZ0UwRW96RFZGRFZtbkRzbkNWb2NT?=
 =?utf-8?B?TSs2bnVadno4YXVGU29oZjJnb0h4NGJXZmtNUDIyVWtMaU1VV3dWVEJoeVg4?=
 =?utf-8?B?b3R6V2FCRTB5U1BSb2lnMk94N1VPaHRWU1o1ZHhoZG9yVExlMzl2YjJKb2VO?=
 =?utf-8?B?TFMxRzRJNForZFJ1c1ZtVUh5Y05qZDZpZ2RrUjJkdjhoMlhmcGdWMkNHSmpQ?=
 =?utf-8?B?VlNmV3p1c0FBYXZZZzNrM3RYS25ZNFp4Uk01RnJnNkVWNEJrRUNuTjdxbzZm?=
 =?utf-8?B?M1o0ZWs2dVA0WGNSakQwb1k1YUV6TXpienhhRGdBcS9wTHVVTDJmOEhIVUNv?=
 =?utf-8?B?SWlBTlRGemh1c0hrZG05SzVkdWNNWGZkZmpFNWUxeFhiY0FkOXd5bjg4MWNn?=
 =?utf-8?B?RU1SRWtUeElsQmFqVTQ0ZlVrbTdudWc4QUdkb21XVWZYNFpjelM0YlNuMnBK?=
 =?utf-8?B?ek9rR1ZURDViNmFHWU1rQ0o2UHRCSWRqV25RMzlENGhvWnJmeHVyZmd6SmxQ?=
 =?utf-8?B?bUxYeHlmYXdWT0l4eXRlUWxzc3V6NEtQcDZFVjlucXdLSlNoeWl5M0R0NkhW?=
 =?utf-8?B?OHcxK1R1a2pRamZDS0tSMzZMWGZ6M2hJMkRjVDlJSkNmd29YU2hldC9ndDhz?=
 =?utf-8?B?Q1RpV0NEMjIxNkh5eWRiM1RMNEZ1RzJyMkVzOFpicDFmOU04Q01UdmhxNzR5?=
 =?utf-8?B?dnRRUlp3c3BWVkp5MWU5N0RkWmY0N3JnTG5wMzJQT2pJSndsR1FrTU9Zeis3?=
 =?utf-8?B?YjVJVnpHU3FSSTZGTlUrT2dCRDcxUzZPNk1MMDU1LytpODBUTktkQVJkcjZR?=
 =?utf-8?B?MGNwUVNHdktSRldyQTg4ak9tV1BEcGZJYVVtUVFSQjFHdXJzeEVxRGZ3TWRU?=
 =?utf-8?Q?J1NyUMXs78JagI0KW0oj3dfJJp62LgJh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZSdG9qZmVkQVc1SFhPTWZFSWVOU1VMYlZjZEFoZTc4NXRNcEpYNTRJRnVE?=
 =?utf-8?B?UlErMDdOL1oxOER2c0p1M1UzbDlvTE5Iblh6bWh2OE1IVExFYWs0UXUwNVdO?=
 =?utf-8?B?SXg2V2ZzRlJUdjJwQmZRZ2xUM2dhakVsQ09lZW1qYmRQdTJFZlJxZDR6MDJr?=
 =?utf-8?B?cDhTWThObDNPeENqVDJuUG5Na2hqbW5jN3h5azFXRU4yZDY4SG5zM0M4YWNG?=
 =?utf-8?B?cm4zNnFwRWJQR0xLOTE4dVRxUWZodVA3VmxpVVpzS0JwNkFGVFFLcTBMM0Za?=
 =?utf-8?B?aHFtM1JkSThLZkxsQk0ySVZQMThSQXZSY2dXS0VmWHY3NDB3SXBBWnh2cDBy?=
 =?utf-8?B?L1lQZG9Ea003aTREdG5qZklPVzZDNjA4dDZEakt3UTN3V3duQWFGSDRkWCtB?=
 =?utf-8?B?eHVsM3RST05yemZDamlPaURoLzhtOGE1cGNNblc3RFZHT1VJS2hIVXhUL05F?=
 =?utf-8?B?VkhTSXJQU0EwZWh4SzZyWllWVUxwL2NYWmtnc08zVnJLNGY3T3JoYWFiNllj?=
 =?utf-8?B?d0cyTS9YL2FudVA1UnBYalZ4d0g1VUlTRndEMm9PSEpHbnlZUFE0SG1Wa3pm?=
 =?utf-8?B?cmRTL0VWY294dW1EcFNPSno5WGRqN3lzUTEybzhCNmRhbHlKdko0RU16Wmxy?=
 =?utf-8?B?M3ZQNDVIcVB4TjJBRHJXSCtBenpldVdabWtsaE5iMGlvMWtRZXZSdTFZM2VM?=
 =?utf-8?B?VFdUbWRVSlF5ZXBoUWFERk1tdTc5QS84K09YVWV2OTNRNS9nYzVtaW9hT2RZ?=
 =?utf-8?B?MCtZbXdYK09WQjE4S245QzdreTd2Z0hiemppMUlQalk5VURSam9iQTBMZmIr?=
 =?utf-8?B?cTVmaVM5THVGTGd2N2k4dm0xUjNVcUxvcGpsWGV3MmNNVkVQOHFFUS8yaXFO?=
 =?utf-8?B?ajIyMEVSakc3dG93U0dtYnM3NVdIbjFROFZUUHdPWEh5NkZ1NDMvazJOM3U2?=
 =?utf-8?B?aVNqS3dqNUYyOUxTNGROcHRHZGZFQW1OdUVTNHlMczlNV0lZaHQ3ekVBQnIx?=
 =?utf-8?B?TXlYNlh5Yk1Lb0tqa0UzV2RNeEMzcXdObjdackhISk1MRnJ1R29WQXZpRjBo?=
 =?utf-8?B?dmxUdGJnWUorUGliRjllaWxtZHJJN1JoWlVNMmV4QU1OS2cyN2Y3emdvNldQ?=
 =?utf-8?B?eUUrOEVHdmlMcHpFbitqdW9XaGM0TkphOFdhY28xMmIrRjN5THBlM2RXRXJK?=
 =?utf-8?B?cWYvYWg0WHRxZUVCSmpxZS9TTXowcExnRmFyeVhYV21Ma2doay9TV3c1S3la?=
 =?utf-8?B?SHdreGxYdFlkenhzSTZIN3lxM05kWWJxU25QTU5nS253cU1ZVnF0VkVkVlh5?=
 =?utf-8?B?WUFaTzdHSkR2L1UvV2huaUpPUFdJYUZqVTNKL0QvalZ3czhVNU84R2NZTGIr?=
 =?utf-8?B?RG5GbGkyUGVJNi9rL3FvZnZPMVh5TjMvK0grVzNGaXdua0x5WWI0VXA4ZVY2?=
 =?utf-8?B?YytOd3RsL1pycmIvQ2o3cngxNURneG5uaEkvUkJPcDN0MU1uYStiOEp3azcv?=
 =?utf-8?B?UG5tVDg2K2hKdE5OZ3lpcmZRTTBnTkJXdzFSczJJWHVDenduYUhqdkFpNDc1?=
 =?utf-8?B?cFNFM29VNCtMemQ1dW1URGpMRHNnTHBheUVIcVVLcFQ0ZjZJOGxTQklNb2VS?=
 =?utf-8?B?WHJIWHlpb3VhdFoveVJnNVZYRkFwT2tWNkgzTG1JRzIwT2dwY0I3aHFoWnJF?=
 =?utf-8?B?dmtSOW56bHZoMzBGSjlnMWg4NW9IRzdIUzhINjNhZlFuNC8ycGZ6U255WmU3?=
 =?utf-8?B?OXdjYk9PTTREeWs3M3JreUtOVUw3eDF6SGJET2RULzc3NHhQME1SRjR4a2dX?=
 =?utf-8?B?VWJOR3dTSE5KeDlIVTlmSVFDTE9SSkR4R0NIeE5BV3RtZlExSmJWTFZpdjVE?=
 =?utf-8?B?Q3cyMlZuSkhKY0Fab3ZyUnNBQVdMd1BHU0hkNlJHeFRMZWFwOUIrbi9LSlBD?=
 =?utf-8?B?SGFuRlpnWGdwTkpnUXlOMi9Od3N5VWxZcHZaSllyWDVRa1JybUs5YVMxdHpR?=
 =?utf-8?B?ZStnb1BqS3Y5QW1jS2lKa3FPQmo4N1J1QkNQbGY3YkZrbnhBOVd3aGpaSDRo?=
 =?utf-8?B?Um01WnFHTDRzM01PSjBKdkFFWmpIWlk0czFTY2M3Q3VwRzd3b0tNamQ2eTZW?=
 =?utf-8?B?WldlNEQ4aXVpS3ZlMHlaVmtlS2V5elZaTXRpMzAyM1ZIS0YzWFpLSEdRZ2pV?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e85beb-affb-4473-94d3-08de3e6c6a8b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:34:10.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIGe+LFcF6n6Seg1qHaiLrOxhYaf6vcnQTKMr5DActVfvVFtvGRRBA/D7D9A1l7Qlz9T2lmjXylb/f5zOWSTt/c9FA98E0fdwIRIkYQMuOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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

On Thu, Dec 18, 2025 at 07:43:57PM +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 18, 2025 at 01:56:07PM +0100, Francois Dugast wrote:
> > These new tests allow triggering GPU page faults from the context of
> > execution units. They can be used to create single page faults or page
> > fault floods, of various sizes. This is helpful for debugging and for
> > performance profiling.
> 
> On the beginning I thought this code should be benchmark because from
> functional point of view doesn't matter number of pagefaults (aggregated
> or flood). But there's one strong argument we can accept it as a test
> - if pagefault aggregation won't work properly we likely would see
> invalid data in output buffer and the test with ACCESS_DEVICE_HOST will fail.
> So from me:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks for the review!

> --
> Zbigniew
> 
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 52 +++++++++++++++++++++++---
> >  1 file changed, 47 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index b1555afbe..66d68f054 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2172,13 +2172,36 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> >  	munmap(pdata, sizeof(*pdata));
> >  }
> >  
> > +/* compute flags */
> > +#define TOUCH_ONCE		(0x1 << 0)
> > +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +
> >  /**
> >   * SUBTEST: compute
> >   * Description: Run a simple compute kernel with the system allocator
> >   * Test category: functionality test
> > + *
> > + * SUBTEST: eu-fault-4k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * arg[1]:
> > + *
> > + * @once-device:				touch the buffer only once, from the device
> > + * @once-device-host:				touch the buffer only once, from the device then from the host
> > + * @range-device:				touch the whole buffer, from the device
> > + * @range-device-host:				touch the whole buffer, from the device then from the host
> >   */
> >  static void
> > -test_compute(int fd, size_t size)
> > +test_compute(int fd, size_t size, unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync = {
> >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > @@ -2207,11 +2230,14 @@ test_compute(int fd, size_t size)
> >  	compute_input = aligned_alloc(SZ_2M, size);
> >  	igt_assert(compute_input);
> >  
> > -	for (i = 0; i < env.array_size; i++)
> > -		compute_input[i] = rand() / (float)RAND_MAX;
> > -
> > +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> >  	env.input_addr = to_user_pointer(compute_input);
> >  	env.vm = vm;
> > +
> > +	for (i = 0; i < env.loop_count; i++)
> > +		compute_input[i] = rand() / (float)RAND_MAX;
> > +
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> >  	free(compute_input);
> > @@ -2363,6 +2389,13 @@ int igt_main()
> >  		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> >  		{ NULL },
> >  	};
> > +	const struct section csections[] = {
> > +		{ "once-device", TOUCH_ONCE },
> > +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> > +		{ "range-device", 0 },
> > +		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ NULL },
> > +	};
> >  
> >  	const struct section intel_get_pat_idx_functions[] = {
> >  		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> > @@ -2605,7 +2638,16 @@ int igt_main()
> >  	}
> >  
> >  	igt_subtest("compute")
> > -		test_compute(fd, SZ_2M);
> > +		test_compute(fd, SZ_2M, 0);
> > +
> > +	for (const struct section *s = csections; s->name; s++) {
> > +		igt_subtest_f("eu-fault-4k-%s", s->name)
> > +			test_compute(fd, SZ_4K, s->flags);
> > +		igt_subtest_f("eu-fault-64k-%s", s->name)
> > +			test_compute(fd, SZ_64K, s->flags);
> > +		igt_subtest_f("eu-fault-2m-%s", s->name)
> > +			test_compute(fd, SZ_2M, s->flags);
> > +	}
> >  
> >  	igt_fixture() {
> >  		xe_device_put(fd);
> > -- 
> > 2.43.0
> > 
