Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D87C83F09
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 13:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9289358;
	Wed,  9 Jul 2025 13:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUy8c9/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DAA89358
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752066021; x=1783602021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yEuaDxsb1wJy0uEAp/NEfkXpwb5H14LKMlytAamT+ZQ=;
 b=MUy8c9/YAUp1c8GTS+hgA8YMJ5wuuCzTYaTTjZon/7wqcPFdwoQSh1n8
 GQe3RlrMlCXlC1QVP8hVSKV3jpm1jJDdfMiFotngNy5vypyfOlHc5bdhF
 tx4H1Prdx/c9Qm/4cQCaJfB/t8BXv65CMAIzZrZ/iZVjCJC1ii0VwWEDZ
 qhtoY0vcif8LBrVPaCV2uHejhQSqW6VHhcJUZvBtWgCOT9jtJ2vYgEEPt
 x828Qxg1WJmrouYqcLNmlXvPUSz8N+li8anPPYCf4sBnSJeNH8nejdRuh
 Tv8kcbdqOhTnFPYTXYHvkQrm5EqCNhGjtwQPmLE4kWrFkVVMBkPzvJrrA g==;
X-CSE-ConnectionGUID: ehJCVHw3QuKf64v/QZfcJA==
X-CSE-MsgGUID: gKoY2K8DSpeCnYHgSXQ4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58089409"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58089409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:20 -0700
X-CSE-ConnectionGUID: OAhN93jGSiGC8aGqq+Dj8w==
X-CSE-MsgGUID: HLZ5Q9LGSHeY11fK7aVQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="179452698"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:00:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJUxykg/5/bq7Lju2mwqiosL7WVSESQm2A0PXKK1uSh4LCACZVsge6s5hBIdkKWQ4vzq/Z+1ihFpCIZZ0z3UZXoGHoSK2QTd5PazGKLI8sfIls7WLFTbpxUSG7fL2wKgiNvqVmKC+rnPY0el47z49VsA3jslwX8NlMrwiAms0JlI28NqZSU/cXN3FPZGQ2Pbw3xdYYEQlqAv2sXF+igctXyfjHy0vwDu60gIHMIJYrVwsNfHqoZbz6EvEE7xQcdKo6ffoig/CMSW1oVBAbKxfKyt28e6K2HarLVvCVe21uf3ziI5g5GmKzawwkda8CIHqW9aEWuV+8kYCtXG5IbBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEuaDxsb1wJy0uEAp/NEfkXpwb5H14LKMlytAamT+ZQ=;
 b=PHmW9D+iory44iCAn0hZ7PeHL/sSJhsNR5YlRuOl8QVBvdKpxXfmg2r8FnCsgptz5nf4P2Vwb5bVCunqfkcK3wHvgib0+RFDjJsDXlI2a9jWnoJxA6/AMtWQv7yLJxL2OUzZm7HHHH/9XHWx5qwMarkMbkzxJL/JlzxmqwfXss3qSJ+BZ2lU7V+od4EeFWIQyYcbZfxmFhaOlqpIyFWkm8MgoQMRqt1hKSkJQU8GO59kfY8yTSTSlKC4D9uV92npiNwhl5g8As/wXsccz6DisPyhS+a5CglN9zmC1MrYlfIHu+X0Hb5+kYpCRzrA6GBvM7g7gSMNQofF3rbOIPBoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 13:00:15 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:00:15 +0000
Message-ID: <5f7245d9-79fa-451a-8d8c-8b1fa8b79c8f@intel.com>
Date: Wed, 9 Jul 2025 15:00:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/5] intel-ci: rename i915 blocklists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
 <20250708152808.59977-2-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250708152808.59977-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 02749a56-4a08-4a96-586b-08ddbee88c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE40b282T3dOams0bDM2cDlOMmVsQ3RpVzR6bmY2SHhzMC91bzZFQzNHejJi?=
 =?utf-8?B?MTNiTFdjQ1IzSExFTnI3MHFBQVRGK1JaY2RBNklZb0NCM09CZFM1cVRsT3Iz?=
 =?utf-8?B?VkcrSDBrVmNnVVNNejU0Qm9PdTZWUmg5VVRWbjZyaHViQVFUNE1DdDI1NFBx?=
 =?utf-8?B?eERqVDRvR1hnUHVHd21BZEtvQU0zNVYydlljNjhwZkR1eXZmZjNBbExXNFdK?=
 =?utf-8?B?RFVCQTcxQy85d2g4Q2pwUE90N0swbExzM2tTQWl0MzZCZm5wMFdibm44QVlt?=
 =?utf-8?B?K2NCOTloUWlwR1FzODNQQUI2SEhjNjJJK2FRN3BjRDJDb1duekdpOElaMUxl?=
 =?utf-8?B?Rm5xdXNEc0JUcEFuK1lNdUxxOGYwdUx2dzNBbFU2bXg2N2RKUTFGb0VpUEg4?=
 =?utf-8?B?RkhYTVYwemg1WWxyL2xmbXBwanhFRFI0MStTd05laXlzak8ra05KdmVWZ1F2?=
 =?utf-8?B?WTJHQVBNYVZXWHkrQlJGVmk2T1lwbExNVXhabU9NbWJsQjNkOTI5NlJERGxj?=
 =?utf-8?B?WFJDa0tpZVZVeXQwNmRBVHdxRW9jalFiVmY1OS9rbU1oaVl6QzdXK010ZnlF?=
 =?utf-8?B?enN4RnFpRFhxT2RGWStoUVdGUnVKQmVJbTIxbTRySDNIUDRDMUNibG5QRUN5?=
 =?utf-8?B?cy96dTRQdmZ1NW9ZRGxwREhBcGJsTzhCbmp6Q3JGSmlEc1MvTmp5VUJmNGQ1?=
 =?utf-8?B?REt3bHhjYWhHZHdwZFp0a3Evd0E0UkNuZWJEOEtsazM5YUhwblo1eHk5UFF6?=
 =?utf-8?B?SFhweXI5NTAvMW1vQTBHMUY3eDlHaEhENStzbmRkSkJLMEoyaGt3SzRTOEYr?=
 =?utf-8?B?TWtMaXF6K1BQbkpZV2ZCaTdIQmhFNkJMZVVjbFJjcFlKd01yOW0rQ2RONnph?=
 =?utf-8?B?dTdyLytjZW9pSGhRVitVaHBncUJ5MEc1MXFIbThFWWNET1hmSGg0aHZGVW80?=
 =?utf-8?B?RkVOY1I2QVJlL0o1VisxT1pxK0h1RDNHL09pYVZRT2ZEYlBNemxyRmRsNUJm?=
 =?utf-8?B?dmNqdGxmeW5XVXhGNzRxVlNaZXU0SXB4Nm5hVks3U0FFdm5CdjdiTW9UdWIw?=
 =?utf-8?B?b3IrQTR5RlpsY3NTckh4ZjU2WUFxV29tREpySk9VTFlscnFURSt1NW9OVTNI?=
 =?utf-8?B?ZFJqWDFtN2NJOWppL1hOVWQvTUlyTHlyNGRUakh4L0hxbTJHRCt2czVTb0sr?=
 =?utf-8?B?VmtZcm80UklrUk5ocTUvaUZtUmxEOG1yK2VvUS9PYUorOFUxa1lONHBWdmp1?=
 =?utf-8?B?UWtQQ082UDI3ZEo1aUpyYmpYeDYzUWticjJlb3pLdUYzcWl6aFdjblNuMUlG?=
 =?utf-8?B?WjBHR2ExK2UrMEdUNHVvWkYxVndyZDJ4M2JKdng2anRjSWVJbjQ4WWEvVStN?=
 =?utf-8?B?SENDM2FOTHA4ekRXT0JFLzJFUXQ5MkNoNWxhNzNtUjBhUGtnd3I0WmVkNTBs?=
 =?utf-8?B?eE5obWR4amtFdmd4cDlFMjB3Kzlucm1mMURJNDFSa3AzT29KVDUxVU1Tamx1?=
 =?utf-8?B?Z3c4cUJtaFNyUHlXUSs1bUpPNlBvUUVLUkM4U3gyY1pyYncxajMxdGNTTUhW?=
 =?utf-8?B?c3JqKzFsOFdCWWZaNVZVMG82SG1sWCtsLy91cm5KclhpUE9URlFZMm5GSUV0?=
 =?utf-8?B?cC9wczE2UkMzdGE3eGhzZ0lPeVFwTXU0aXRsdXBJL0RiZ1Q4UllkcEVHRlRJ?=
 =?utf-8?B?N1UwQUlJaUhWZTJoOWVmZGRqR0RURTRoZC9WenpvYzRrMjlQcWpEUkcyVHU5?=
 =?utf-8?B?cDRFdUt3V09KMm1ZOThUK3VHbmRsMlluR1FKbzdxM1NpZXRFTHZNd0thYjZk?=
 =?utf-8?B?eHMzTjFhT25BRW5DaTNnYlQwSXBwTCtmZml2SmVvNmgvUmhGOGw4eitYMC9L?=
 =?utf-8?B?V2wvZHRwUlZJdlVpV2dYQUlYdXpQdmZ0NnBiUW16ZHhJMCtMTWorRUdXYlEv?=
 =?utf-8?Q?lTHtILOfgA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekN2L2E3dWZiMkdZRHN0dlJhMkRKSVpTUnhrMmVhN2JHbGlaakxuZUkrWXBI?=
 =?utf-8?B?NHNNa3RYYjNOQzBDRzZ1S0tVVzJ2ZnFzSENsdTlwN2lyY09ERXd2dXFIRncx?=
 =?utf-8?B?R1dIOTVLc2FOZDBpV1IvUmVUMWxpNERDMURrZTZRQVRDYXpoZHhsSmxPSEcy?=
 =?utf-8?B?U1ViNlVLazl2MXdQeEM3b09nOWdXY2oveW5IYTlNeEcweVI2N0RISHZqOTlS?=
 =?utf-8?B?anpPVEVDSytVU2JiWmc0ZDJ1R0xDMlZDdWd0MFFuU21qMnhieGxnUyt0S3dX?=
 =?utf-8?B?eTBkK3IxRDhsenZtT3hTSDh0MWdsWXlDMnlZT3VTR0o4SllrcVhIa1ZNb2ZU?=
 =?utf-8?B?NjNTMkYyTE1DbzFYTUorV2JPZWVheXVIWWlmVFJTeGtJNEtkWFJQWnVHd2Y3?=
 =?utf-8?B?NEhHOTNLNUhjZUdMdjFGV1JuZGowNGdrUWpsdk1ZajdEY1kvVDQ5K1NUV3dx?=
 =?utf-8?B?MHBuZ1VjdlM0bkd3OUsrdGNweU9jTWd6dEdwVWxJb2JNckZSVldKM2ZNVVdP?=
 =?utf-8?B?QzNKSUdGQkhCMFNjODdKVHBOZlRzVjBVdGs4RW8yMmZZcE5PY2ZvZ0Mvdi9u?=
 =?utf-8?B?bUROWVN3VU03U0FiL0ppeS94RDVhNlZEc3JZZVNHSmpkOFZPOWM4ZmluNWto?=
 =?utf-8?B?MlYyYUh6Z3pVOXJXT3hmQkd4bnU5SnIxeVpESVU3N241ak85OTY1cllBelEz?=
 =?utf-8?B?M2lPalFVSXFSVTJMcnpaN0llRk1EOWlzcERyZXNzb0hvc21xN0RPVDZJWU1L?=
 =?utf-8?B?TmtDb0xuLzBLNG93bFVhMGdtYmtUamhqcnNkaVIyZDFsNVdINDRXZE5ydW8x?=
 =?utf-8?B?eHJWMWFKOFU5SFBCdnYzZWxSVFNWc0JLOWEwOCswMzVnUXlISExtM1RxQnoz?=
 =?utf-8?B?dkxXU1MvRDBkUkF1UkFNSWRZMy9qNWk3UDl3RkFHOGRJUDRYN1pRMFlRVFZN?=
 =?utf-8?B?QjV5QitPNFRuTUNCQ0d4YjQyWGZYdGNWbGRxNWtpMnpHM3NhMHRhMU12Sk5U?=
 =?utf-8?B?ZXRQdGFSbmxPQlpXUDVHK2drcXJNVGR4MjVxZjZZRnNlQUx6cDdhNDlJWFR1?=
 =?utf-8?B?TUwyWnhDTXh4UHNNMVhpK1YvVXN6YkJrWmJ4WFdXZG03TVROSDZsdGF2NGZT?=
 =?utf-8?B?UFRjOVczcVQzN2VVWFkxTnFxQUh4VGxmelE2bXIzTlJQTS9CRm85OHB4LzV2?=
 =?utf-8?B?WnBlenFQRzdhWjAreGx2UFk3aUowbm5tb3UrZEJmRUdVTHAwOWdtOWNXQVd5?=
 =?utf-8?B?ZjVXcEtqUHhxWTB3RFpaR2x6QldLbzVXWjlHMHI1N1gwbDFtNEIwd3pidDlC?=
 =?utf-8?B?TWJWNnQvYmJMa1FZcW90b1lMR1pQYlhMTjBZYkx1Z2hWWTZWK1ZqVnFsT2pY?=
 =?utf-8?B?WHpaS1lqbllFeU1rOGpqMEgxUnNHMWJ0Y1VsbzhYeWpxbDhnZmdydTYzZCsw?=
 =?utf-8?B?WlhEY29oSlRScU9CT1JJcDh3ZDVkcG1mL2MwRFlKcjgrYWp5MjZHZm5JZXFZ?=
 =?utf-8?B?S0lFSjNNdis3bDl4VlI3Rjk4L0YvQmRuR1JSTy9kaFVIZWdFM3dRdlo4a3h4?=
 =?utf-8?B?WGd1QUR5Tkx6cGJyNS9ic1lGcldEMmFGVFE1Q29BSWJ5T1FldHJnaGpVUjhD?=
 =?utf-8?B?NUl1bGV4OTdQVUlQMXZMOFRnVWVBUlVVS2NVK3F1NEZpejB5ZWg3QU10MVRt?=
 =?utf-8?B?dnEzdWkvOGVZTzJiYVN4bXhDOHl1RTF0aHVIQ2NocDcvSkZqTTU3MDkzUDkw?=
 =?utf-8?B?Sm9iaWplMk0wVGE1eFNub0J3WFlXZUNQN29GWWtsUHFLMDNOUHBRQzFWNmp0?=
 =?utf-8?B?WEc4VHQwcEZMVmo3SmM5YzRyZ0NucHo2bWpaWkQ3NzV6RzI0SFV5TE1GSnQx?=
 =?utf-8?B?TWdyTFNya25jekNsR0J4QkpxTTd1NzRMdFh6UU9lYzBhRncweTdGcFhVdXMx?=
 =?utf-8?B?RnZteUhrNzlrN0tpN0k2aENLUm4yczNnTUtpaXAwbkpHWEp0YW1SV0VFUFpm?=
 =?utf-8?B?YWxIa2EwR3ZSS0krckpLMHRkalphdWY5c1BweXl5M0thQ09QZXNNZlVEL2Zm?=
 =?utf-8?B?ZXBIN0hMcW51SlRGRUs0ejllNlJsaldYVnFwWFI4YTkxSVNhZVZRZFZLR1VH?=
 =?utf-8?Q?PxbbvPR42+aA5HJKxsD45GH77?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02749a56-4a08-4a96-586b-08ddbee88c0e
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:00:15.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XTCurFs8W4v5wjl7b+5U7IQYLHPAEkO9q3lwywzp6iMxV1PpWzul/eyvAYKX7HLucsNuwYrE7yQkElbrOIcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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


W dniu 08.07.2025 o 17:28, Kamil Konieczny pisze:
> Unify naming with Xe blocklists so blocklists for i915 will have
> i915 prefix in names.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej

