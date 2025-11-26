Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4DD1038C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 08:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCF610E540;
	Wed, 26 Nov 2025 08:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8EAY84A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6147A10E540
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764147172; x=1795683172;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BdRBvZJk4uQKcv22usWnjTpkzS6viAJMsmtq52rTGPw=;
 b=P8EAY84A6XhlryHTQKEFrJMkOrkZ4wmjp63zamh40lMbjD7A4EnHU5ca
 x4h/2RViVpzdsJg3lhZnQzvDuHBAlN8O7Cj1D3KePtdfLnVfUla5sfd2B
 zR6FoO+cGOPY+FYAItsaSxoa4pUMpEbqC/P1kS579a47e2UG5iZV2i02s
 y8tmxpwEYPbN7G19YiR5F/TvmTEwrgME6n20lCPQRNduvsiCqsVWX+tNr
 bb6pezUrFEmggJkYI19NLpMLN4nYhyzahLuPzCSQjAMcisCM3HNy0PlR8
 2L0IJI7BPDzMPIlfai1L6cKAqjqEDGxD/cruk0f1eVNIUYzCjWmzMMSfS w==;
X-CSE-ConnectionGUID: FofHnvXxRXGY+3fcd19aGA==
X-CSE-MsgGUID: Ig4Bh6E9T5mz7roBuNDMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88824814"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="88824814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 00:52:52 -0800
X-CSE-ConnectionGUID: 6e/IhwdvRSCxQ6G2A3gA6A==
X-CSE-MsgGUID: fVsm37pFTYqiedfly1o9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="223845831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 00:52:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 00:52:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 00:52:51 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 00:52:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSQhGUYVNB+mt1hArQUajCB49bZCBmRIrB2aqV/GvXkbzi5BZ0QU576+Vd1mPaFP/bykYO3Abmnvh6DgzpY0AJvmBYDGoMA1Ks+IdUxedK7kohoB/aohXedBDQ6vCPeZa9i+m1d04ZmRpdHtcNAS7/PkK4PEdYkDMRuBVPf0vGcpCDRGGJvNjdB6cG0SoUd9Zd6L8g/hAWLBxutjcC2yPZY1Hfw5SwCzEeA76mUxxmwnY8SRu9O4tAMQ4StGrl34NjH5KV7C2HAToeFSCcT2KXx9vPIHTjHI2Yal2lGc7VJLRL6lTdg36uEAWERhq82AYfuY+CWj2DnT1aHsyxGHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdRBvZJk4uQKcv22usWnjTpkzS6viAJMsmtq52rTGPw=;
 b=lk09lwSNtTxvQ/EI9HZKJvmhuUK7iIf8zWMx0hR2EWvm0qpiUaGbSR+2Dfh3nUrZ0Xxct/hKL/HoCc5bWp5424rrjKjueiupTWEAXBlREcuGiomH/o7brluPddEnWq4I7QBMM0KwDZekJcPsJm7PCZbHPvANkjYvHqJ3ghcT72KuoiQm8bRkd/cXou8SSjuuJVSHTcN9g9WgxVVsRXpE6cwzysXn4lrOFtfQVl5ZTap6a4pqcNTwVXxEXKItE18d/EMGmnewaE5mJE9u4RGRKTiAnG7C8ohQpoq5hd1kv5AytmEmAH4bQhhtj9aA5lbzvBcVvbF7lYuuZx6MZksA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Wed, 26 Nov 2025 08:52:49 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:52:48 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v8 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Topic: [PATCH i-g-t v8 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Index: AQHcWwN/JCyTh8BBuU6UzFaLYTAiJrUErguA
Date: Wed, 26 Nov 2025 08:52:48 +0000
Message-ID: <92e6fc8a1fa843c36eb3432c3611c32339d204ad.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-2-nishit.sharma@intel.com>
In-Reply-To: <20251121162537.77551-2-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH0PR11MB4887:EE_
x-ms-office365-filtering-correlation-id: 0481541d-3785-4a45-3ee1-08de2cc92cef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QXlKa0FYNWw0MEJQQWpwRGRIMVFDT2dsbTg0TlVoalRWcHE2WGNxQXVOaWZB?=
 =?utf-8?B?b0lZRUFVTHVCRjIyc1pObUNRTXRtcnpQK213YlBRMTlQOXZvSzRiS0laM1Uy?=
 =?utf-8?B?aEdLeDEzcXpPVTJlajFsTDk5ZkNNYmxTWDkwdkRjS2VxYkgvUkxjQ3ViY01V?=
 =?utf-8?B?QkxCQ3lyK1BYeTZRM0RJbHBQYlZKbmowWG1tbitNNTFTU0kyUmxmeFhLWFI3?=
 =?utf-8?B?WFVOekE3WUN3VFlXYStzeU9GM1h1OGlremFnZDdKMjBjZU9IV3ZSelRWakNp?=
 =?utf-8?B?cy95bkFteDVhNW9wRHRTVkVlU2o1MDkyQXFMVElCVmp4WVpqemxodUxvMEF3?=
 =?utf-8?B?VWlnL1krWEhEYVh5VHFRTVo0c0hrdHZPWEl2dG1XVUZxcThEZUpPbGlEZmVK?=
 =?utf-8?B?RUx0TS9tNlR0MVhCU05tbUFOZVN5VEpQYUFnbkF2c1hFZVIydFlTdjh2TTRS?=
 =?utf-8?B?RndOZWswMUtyclVRU1hoVFBlU2lnYW1aVmQzU1dEbVRkUlhoTG5PQ1V5dWpO?=
 =?utf-8?B?S3UxVDUvSU5hOHkySUUyYVJWVkRERUIxQ3MzVzVidnhvc2lJc0Z3RG4zczZm?=
 =?utf-8?B?RjFGQ0N5RStvT1BnT2lUbHdHSWRIcFdoai8yanFlYWIzS2JreXdmY1B3OXhL?=
 =?utf-8?B?RXViR2o2SUJ5SEdBdTBSWlFkcFB6V3oxWmxHWHB3dzlyR3pIV0xKdTEzZDdz?=
 =?utf-8?B?L1VpMmd6cWxxNjl6MFVRUVhIOWRmUmdxZ0tLYUVWeTRrandzbXJsbUdSSVEv?=
 =?utf-8?B?QjZkZktlM04ydk9pUk5oQkVqT3pNQTdqOXArZVlRZ2xGb3FoNWdNakIrSXZT?=
 =?utf-8?B?Q1lzZzZwRk1FQUhTRlM2MXJuREY4WG9GWkUrRndURUV6L3J4K25BN0l0SVQv?=
 =?utf-8?B?QVBYblorUlRBbmg1VU9xOFpzdG9sNE5oVkdKU01lL2dCVWhWaVVUTXVFNTRR?=
 =?utf-8?B?Y2xHTWlpd0xrWGdacVhyTUdVWDJCYkhvbVBCYkRKazR6dnRHenBKWUNWa2VK?=
 =?utf-8?B?Unh6T1lEVEx4Y3pheldwQWVMUFcvRXVxNGVNY1RkUXdUei9OTEpZejVZRkxI?=
 =?utf-8?B?S3p3VTh6NkNJTEgzN2pWUWhVd20yZW1lSmMwOTBUVmgybE9FelpSZUd3SXZ2?=
 =?utf-8?B?bEdUeHdqKzZnSTF2azJ5dmVYdUx6RUVicG9DUU5XSkNucnN6L0lqWDdadkVP?=
 =?utf-8?B?cXlJcmJUUG9PMkV6cUp0eFpCVG00TWY1WDVia2hERnoyN2dYMmpZMkJQSW1j?=
 =?utf-8?B?MlFvUUxadjhPVVIyYUR4aDJCYTJRWlBrUGxYVUx4aUZzTkhLazFzWFloMzRa?=
 =?utf-8?B?ZFRkTUNGWmZiMWxZRGxoTko3Yk5ZTnVIT0trTEFBN2VkUzFZUUxBdnNGYlI5?=
 =?utf-8?B?UHFRTW5VeVRINnQrUHgvbFJIRVYxRklpUjYyVnRrTW9neTF1NXlJRDhIL0lO?=
 =?utf-8?B?TFduV3Z3L3hEYkZYbDB5WEF2MEt4U1FKRGloaXNQOE1VckJVdThYVFRZcFVz?=
 =?utf-8?B?a0p1ekdXSzZwbkhZckIyVzl2YzVjZ2JNNDUxOStwc1ZJOUxmUXlaY1o5WCtk?=
 =?utf-8?B?MFJmamFYZXp6aW1XU0tuOGMwVFh1RlR3bFAwaFdxVzdCNlVkWkI1anZwUWxN?=
 =?utf-8?B?TE81NWRSZGdIY0JvZ0V4WVVWZUg1RHFGRDcvN0ZPSmJnbmFtNzE5SGRVd2Jh?=
 =?utf-8?B?S09weU1xQ3VNa1ZNbERWbGVSMHJVdzErZlNkRGpOd0JFOVpHOWlxTVN4bG5n?=
 =?utf-8?B?dmtHQ2hMeU4zbjdaQXltOTlPVThVSkhUUWdJb0poMmxHR3Y4NVlTa2wydlZI?=
 =?utf-8?B?YkhHeDRibEdSaysrekJYanQ5WTFmcUk3Ukh1REp0WjR3b2FEaEswYVUyVnVE?=
 =?utf-8?B?akNsbk84R2V6Ymh2Q1BHOURMcmhDeFZSYUNCMFdGUjQvNmg2Uk9wSnVxQUQ4?=
 =?utf-8?B?SjdPaWFMdFVQNkhQVWRQRTBRMmp2eUdacEo0Z1NUVTJTV3laTWd3Q2dzNXEy?=
 =?utf-8?B?VCtLYkRyTUsrQ2FzcWh1WGxaejdpWkd4STdRdWIza1N6aEZVN1NqbEF3VHBU?=
 =?utf-8?Q?o3OHBq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzE3QkZ0MGlSOGxKNk1Kc3lYSG5RQlYzYnhqSktXblA1SXIyODBuUWtBQi9h?=
 =?utf-8?B?QXp4V2tZTlpCZkZ5RlBvZWZwc2owWEJJdkRDeTVab21ZU1E1aUhvQnNJZTdh?=
 =?utf-8?B?aHJzYUpSVG8rVEUyWlI2UGd4WnFwa2F5Vkc5MFduaFkzektYK2JmMldwRVhN?=
 =?utf-8?B?ck5Wajc4MXB6K0p6R2JxUHAyUUl6OFlhdVZJZytvcFFXa2N1K3JTK1J2S3lI?=
 =?utf-8?B?dkI2MnoxdzRBWHhwZTI0TTdINFhoeEhHK0JEQllZa25jNlBJalM4ckVMVU5B?=
 =?utf-8?B?VGhmMEN6WGtpcjBzUjhoM1ZrRnR6aUIrOWZuUHBRVDRPc0hlaVIyY1VTQ2l4?=
 =?utf-8?B?K2NoYjN4R0cvMHJGQnhkRWtpWTNvWmtjeFRMM1J3SW5uU3lSZVlrOWc2N0g0?=
 =?utf-8?B?bkg5cUJpZ2oxbCthU0N5TnFTUlBlYjEvNHpROFlGWEdjUmJjMW5lTjFTcnoy?=
 =?utf-8?B?VklXaHFNbm0vWUlVQzdBOUplejlpb09xYmFSOENPRVNibFRJbUx2VVlWempG?=
 =?utf-8?B?NkU0SkhxaHM2MTNhUi9kRnlidDIvZndZNldPMkJXS1ViL3gwbEMrZGU4U0dD?=
 =?utf-8?B?LzNUOVkvV2ZaYVlQS3kxQkJxL0F2T1dpYk9Bamw2UUprakFpUGdQeWh5Q2xu?=
 =?utf-8?B?Q1NlVFdkNW5BUm1pSHFDQWlIdkYzUHhha0pnQytvcHJQOWJVOFQ4eHBMRVZt?=
 =?utf-8?B?Z2tFSG1XQ2Z3QVlZNEp1Y2V2K2pxcDJIMnFvako1QzZLNkNPT2RTZDJ2ZGtw?=
 =?utf-8?B?WHorTllXRnV5OTk0M3p6Kzh5ZGpiRi9DeXlqMVZaYzN6UjQxelBGRmJFMVNQ?=
 =?utf-8?B?c1NWYmQzWXF6MW0rMk90QVVNOVBEWUpRa0czWW1MWUZYdG90Z28wTDZ5Z0NS?=
 =?utf-8?B?WGRGMkU2T3BnbWxJTGVEa1NoaEdXWVB3cWZnNHFUVVQxVXdBUWovREJ2bTJG?=
 =?utf-8?B?T3NmazJPbldxZjU1d3NqTDQrQlpDUVBIdER2eUt2YkpEMWdCbGd2Y05aUGJx?=
 =?utf-8?B?eGxuazZDd0pyTWlpbDNZa2lvR21sazVWSmNXKzA0NEJldmhsV0MwVnV3aHlM?=
 =?utf-8?B?ZnBzd1ZEdllpS1h6QnpUR2JmWlFFMjVjSWNhZWFwbUJodC9ON0Q3V3V0NXp3?=
 =?utf-8?B?OG1GVFRSOHFWNFBxN21ETUJNWCtWS2VmMVNhY1Q5NU5SNWpPeVp2Unp3clhj?=
 =?utf-8?B?WGw1N3g2aUUvK2FEK0NTWEhCaENaRTY0OUcrZW43RFNoYWxiYVR0LzQyVmhq?=
 =?utf-8?B?a1p6ck8wRWlEQythQkI0Z3RXTFhqTFUrTFlTQ00rRU53dngvTEhZRVMrZTlx?=
 =?utf-8?B?b2ErWFlIMGR0UzcrNm5aNUxXM0drUHVxdE43VVlEQ2wwTjRGa2ZXUWpOdlYy?=
 =?utf-8?B?aFZqT2JLdTJoNVFlYVR1amRJNDBFVzYxemxNaXdFcWJjTFd1TTVDdDMyRVlP?=
 =?utf-8?B?RUxjUVhKOHp2WWJ5NHRhOThFOTJnR2lGTzR5dDlDM2l1TXJzTUZOa0l2ZXp5?=
 =?utf-8?B?MlpCVFFOcVp1SHJnYzdDWHFUTDZDVjljN3lOVDJPRHlPR01ZbGRNTitBMzR4?=
 =?utf-8?B?RU16ZVFRL3I4L29nNW9Wd3Ruc2JOZm9NZ2NYK0c3ZjRKaTlpdnlsSWhmbEJt?=
 =?utf-8?B?dWh2cEcxQU5DUkdPWVcrMWQ1RkRKUUx3V3QwakRzdENPdXRXaEl3a1FwMWU1?=
 =?utf-8?B?TkNPYXdRclRPV29naWFjcFJHakNvOHlCOU1PaFR4OVl6cGFEYURPd0k2R1Zl?=
 =?utf-8?B?OFkrL3p3RHlsSTY5V2xuUitJenZYTTlqQWo5US9uN3F0T3ZXK1F4WWllNlpv?=
 =?utf-8?B?RlNZbC9Lb3ZIMGpZL0E4Mm5WQmZnVHZLY0RwM1RRYmZhUUJvSjV3MnZVb084?=
 =?utf-8?B?MGNhT01OME1wbFdyMmEvdkhySkJpcEo2bGo4ajA0MmlWNG8vSms1VmNmbHVI?=
 =?utf-8?B?WFhGWEdQZXNnditTR3Fla0haVXJKVTVaK0NSaVBneXZncC9Qc0RmbXRKRHJo?=
 =?utf-8?B?YWVkUHhEMlEwL1g5K3lkMWt2M1pLTm4rRjRjeWxaa2dxR3NNZGRvN2djYlJG?=
 =?utf-8?B?dXB6Z2hHenVnOEUrVWt4RSs0SDFCdDBWUERMUVFOQTVTYWRKQk9rczNubWlD?=
 =?utf-8?B?cmZGTy9zSFI5VGkrVkhUa3ZsbWwrTDE4UGJ2UHZrZFY0Rkd2aVFGWlJvZUZC?=
 =?utf-8?Q?z+/Ln+i4oPs5ZE91QIRYiDbOaVvo6GbpSsJwmFdoQGbx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <119FA8D67DE2D448A043A08334C1A8C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0481541d-3785-4a45-3ee1-08de2cc92cef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 08:52:48.6682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4P4KFGMBxTfgjosYkJe0fyXVE/6LKoH3jYqumx78IZSLaDRjZgiC6bD8PSnKzBeQWZYp5tPz0sD5AbM6UBU7VHtMtcyo+OFxHoaWK19rbS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

SGksIE5pc2hpdCwNCg0KT24gRnJpLCAyMDI1LTExLTIxIGF0IDE2OjI1ICswMDAwLCBuaXNoaXQu
c2hhcm1hQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNo
YXJtYUBpbnRlbC5jb20+DQo+IA0KPiB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0
b3I6IEFkZCBwYXJhbWV0ZXIgaW4gbWFkdmlzZSBjYWxsDQo+IA0KPiBBZGQgYW4gJ2luc3RhbmNl
JyBwYXJhbWV0ZXIgdG8gX194ZV92bV9tYWR2aXNlKCkgYW5kIHhlX3ZtX21hZHZpc2UoKQ0KPiB0
bw0KPiBzcGVjaWZ5IHdoaWNoIFZSQU0gaW5zdGFuY2Ugc2hvdWxkIGJlIHRhcmdldGVkIGZvciBt
ZW1vcnkgYWR2aXNlDQo+IG9wZXJhdGlvbnMuDQo+IEdldHRpbmcgY29tcGlsYXRpb24gaXNzdWVz
IGluIHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvciB0ZXN0IGFmdGVyDQo+IGFkZGluZw0KPiAnaW5z
dGFuY2UnIHBhcmFtZXRlcnMgaW4geGVfdm1fbWFkdmlzZSgpLiBBcyBhIGZpeCAwIGFzIGluc3Rh
bmNlDQo+IHBhcmFtZXRlcg0KPiBwYXNzZWQgaW4geGVfdm1fbWFkdmlzZSgpIGNhbGxzIGF2YWls
YWJsZSBpbiB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3INCj4gdGVzdC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4g
wqBpbmNsdWRlL2RybS11YXBpL3hlX2RybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDQgKystLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKysrLS0tLS0NCj4gwqBsaWIveGUveGVfaW9jdGwu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysrKysr
LS0tDQo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMgfMKgIDggKysr
Ky0tLS0NCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggYi9pbmNs
dWRlL2RybS11YXBpL3hlX2RybS5oDQo+IGluZGV4IDg5YWI1NDkzNS4uMzQ3MmVmYTU4IDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJt
LXVhcGkveGVfZHJtLmgNCj4gQEAgLTIwNjAsOCArMjA2MCw4IEBAIHN0cnVjdCBkcm1feGVfbWFk
dmlzZSB7DQo+IMKgCQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xvYy5taWdyYXRpb25fcG9saWN5Og0K
PiBQYWdlIG1pZ3JhdGlvbiBwb2xpY3kgKi8NCj4gwqAJCQlfX3UxNiBtaWdyYXRpb25fcG9saWN5
Ow0KPiDCoA0KPiAtCQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xvYy5wYWQgOiBNQlogKi8NCj4gLQkJ
CV9fdTE2IHBhZDsNCj4gKwkJCS8qKiBAcHJlZmVycmVkX21lbV9sb2MucmVnaW9uX2luc3RhbmNl
Og0KPiBSZWdpb24gaW5zdGFuY2UgKi8NCj4gKwkJCV9fdTE2IHJlZ2lvbl9pbnN0YW5jZTsNCj4g
wqANCj4gwqAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLnJlc2VydmVkIDogUmVzZXJ2ZWQNCj4g
Ki8NCj4gwqAJCQlfX3U2NCByZXNlcnZlZDsNCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0
bC5jIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gaW5kZXggMzljNDY2N2ExLi5lYTE3ZWZkZDkgMTAw
NjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9pb2N0bC5jDQo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5j
DQo+IEBAIC02ODcsNyArNjg3LDggQEAgaW50NjRfdCB4ZV93YWl0X3VmZW5jZShpbnQgZmQsIHVp
bnQ2NF90ICphZGRyLA0KPiB1aW50NjRfdCB2YWx1ZSwNCj4gwqB9DQo+IMKgDQo+IMKgaW50IF9f
eGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBhZGRyLCB1aW50NjRf
dA0KPiByYW5nZSwNCj4gLQkJwqDCoMKgIHVpbnQ2NF90IGV4dCwgdWludDMyX3QgdHlwZSwgdWlu
dDMyX3Qgb3BfdmFsLA0KPiB1aW50MTZfdCBwb2xpY3kpDQo+ICsJCcKgwqDCoCB1aW50NjRfdCBl
eHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5LA0K
PiArCQnCoMKgwqAgdWludDE2X3QgaW5zdGFuY2UpDQo+IMKgew0KPiDCoAlzdHJ1Y3QgZHJtX3hl
X21hZHZpc2UgbWFkdmlzZSA9IHsNCj4gwqAJCS50eXBlID0gdHlwZSwNCj4gQEAgLTcwNCw2ICs3
MDUsNyBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90
DQo+IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoAljYXNlIERSTV9YRV9NRU1fUkFOR0VfQVRU
Ul9QUkVGRVJSRURfTE9DOg0KPiDCoAkJbWFkdmlzZS5wcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1f
ZmQgPSBvcF92YWw7DQo+IMKgCQltYWR2aXNlLnByZWZlcnJlZF9tZW1fbG9jLm1pZ3JhdGlvbl9w
b2xpY3kgPSBwb2xpY3k7DQo+ICsJCW1hZHZpc2UucHJlZmVycmVkX21lbV9sb2MucmVnaW9uX2lu
c3RhbmNlID0NCj4gaW5zdGFuY2U7DQo+IMKgCQlpZ3RfZGVidWcoIm1hZHZpc2UucHJlZmVycmVk
X21lbV9sb2MuZGV2bWVtX2ZkID0NCj4gJWRcbiIsDQo+IMKgCQkJwqAgbWFkdmlzZS5wcmVmZXJy
ZWRfbWVtX2xvYy5kZXZtZW1fZmQpOw0KPiDCoAkJYnJlYWs7DQo+IEBAIC03MzEsMTQgKzczMywx
NiBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90
IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoCAqIEB0eXBlOiB0eXBlIG9mIGF0dHJpYnV0ZQ0K
PiDCoCAqIEBvcF92YWw6IGZkL2F0b21pYyB2YWx1ZS9wYXQgaW5kZXgsIGRlcGVuZGluZyB1cG9u
IHR5cGUgb2YNCj4gb3BlcmF0aW9uDQo+IMKgICogQHBvbGljeTogUGFnZSBtaWdyYXRpb24gcG9s
aWN5DQo+ICsgKiBAaW5zdGFuY2U6IHZyYW0gaW5zdGFuY2UNCj4gwqAgKg0KPiDCoCAqIEZ1bmN0
aW9uIGluaXRpYWxpemVzIGRpZmZlcmVudCBtZW1iZXJzIG9mIHN0cnVjdCBkcm1feGVfbWFkdmlz
ZQ0KPiBhbmQgY2FsbHMNCj4gwqAgKiBNQURWSVNFIElPQ1RMIC4NCj4gwqAgKg0KPiAtICogQXNz
ZXJ0cyBpbiBjYXNlIG9mIGVycm9yIHJldHVybmVkIGJ5IERSTV9JT0NUTF9YRV9NQURWSVNFLg0K
PiArICogUmV0dXJucyBlcnJvciBudW1iZXIgaW4gZmFpbHVyZSBhbmQgMCBpZiBwYXNzLg0KPiDC
oCAqLw0KPiAtdm9pZCB4ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90
IGFkZHIsIHVpbnQ2NF90DQo+IHJhbmdlLA0KPiAtCQnCoMKgIHVpbnQ2NF90IGV4dCwgdWludDMy
X3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLA0KPiB1aW50MTZfdCBwb2xpY3kpDQo+ICtpbnQgeGVf
dm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdA0K
PiByYW5nZSwNCj4gKwkJwqDCoCB1aW50NjRfdCBleHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90
IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5LA0KPiArCQnCoMKgIHVpbnQxNl90IGluc3RhbmNl
KQ0KPiDCoHsNCj4gLQlpZ3RfYXNzZXJ0X2VxKF9feGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIs
IHJhbmdlLCBleHQsDQo+IHR5cGUsIG9wX3ZhbCwgcG9saWN5KSwgMCk7DQo+ICsJcmV0dXJuIF9f
eGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdlLCBleHQsIHR5cGUsDQo+IG9wX3ZhbCwg
cG9saWN5LCBpbnN0YW5jZSk7DQoNCldoeSBhcmUgeW91IHJlbW92aW5nIHRoZSBhc3NlcnQgZnJv
bSB0aGlzIGZ1bmN0aW9uLiBJc24ndCB0aGUNCmNvbnZlbnRpb24gdGhhdCB5b3Ugc2hvdWxkIGJl
IHVzaW5nIF9feGVfdm1fbWFkdmlzZSgpIGlmIHlvdSdyZQ0KaW50ZXJlc3RlZCBpbiB0aGUgcmV0
dXJuIHZhbHVlLCBidXQgeGVfdm1fbWFkdmlzZSgpIGlmIHlvdSB3YW50IHRoZQ0KZnVuY3Rpb24g
dG8gYWJvcnQgb24gZmFpbHVyZT8NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQoNCj4gwqB9DQo+
IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuaCBiL2xpYi94ZS94ZV9pb2N0bC5oDQo+IGlu
ZGV4IGFlOGEyM2E1NC4uMWFlMzgwMjlkIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfaW9jdGwu
aA0KPiArKysgYi9saWIveGUveGVfaW9jdGwuaA0KPiBAQCAtMTAwLDEzICsxMDAsMTggQEAgaW50
IF9feGVfd2FpdF91ZmVuY2UoaW50IGZkLCB1aW50NjRfdCAqYWRkciwNCj4gdWludDY0X3QgdmFs
dWUsDQo+IMKgaW50NjRfdCB4ZV93YWl0X3VmZW5jZShpbnQgZmQsIHVpbnQ2NF90ICphZGRyLCB1
aW50NjRfdCB2YWx1ZSwNCj4gwqAJCcKgwqDCoMKgwqDCoCB1aW50MzJfdCBleGVjX3F1ZXVlLCBp
bnQ2NF90IHRpbWVvdXQpOw0KPiDCoGludCBfX3hlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJf
dCB2bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QNCj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4g
LQkJwqDCoMKgIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QNCj4gcG9s
aWN5KTsNCj4gLXZvaWQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRf
dCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwgdWludDY0X3QgZXh0LA0KPiAtCQnCoMKgIHVpbnQz
Ml90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QgcG9saWN5KTsNCj4gKwkJwqDCoMKg
IHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QgcG9saWN5LA0KPiB1aW50
MTZfdCBpbnN0YW5jZSk7DQo+ICtpbnQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZt
LCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwgdWludDY0X3QgZXh0LA0KPiArCQnC
oCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsIHVpbnQxNl90IHBvbGljeSwNCj4gdWlu
dDE2X3QgaW5zdGFuY2UpOw0KPiDCoGludCB4ZV92bV9udW1iZXJfdm1hc19pbl9yYW5nZShpbnQg
ZmQsIHN0cnVjdA0KPiBkcm1feGVfdm1fcXVlcnlfbWVtX3JhbmdlX2F0dHIgKnZtYXNfYXR0cik7
DQo+IMKgaW50IHhlX3ZtX3ZtYV9hdHRycyhpbnQgZmQsIHN0cnVjdCBkcm1feGVfdm1fcXVlcnlf
bWVtX3JhbmdlX2F0dHINCj4gKnZtYXNfYXR0ciwNCj4gwqAJCcKgwqDCoCBzdHJ1Y3QgZHJtX3hl
X21lbV9yYW5nZV9hdHRyICptZW1fYXR0cik7DQo+IMKgc3RydWN0IGRybV94ZV9tZW1fcmFuZ2Vf
YXR0cg0KPiDCoCp4ZV92bV9nZXRfbWVtX2F0dHJfdmFsdWVzX2luX3JhbmdlKGludCBmZCwgdWlu
dDMyX3Qgdm0sIHVpbnQ2NF90DQo+IHN0YXJ0LA0KPiDCoAkJCQnCoMKgwqAgdWludDY0X3QgcmFu
Z2UsIHVpbnQzMl90DQo+ICpudW1fcmFuZ2VzKTsNCj4gK3ZvaWQgeGVfdm1fYmluZF9scl9zeW5j
KGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLA0KPiArCQkJdWludDY0X3Qgb2Zmc2V0
LCB1aW50NjRfdCBhZGRyLA0KPiArCQkJdWludDY0X3Qgc2l6ZSwgdWludDMyX3QgZmxhZ3MpOw0K
PiArdm9pZCB4ZV92bV91bmJpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRf
dCBvZmZzZXQsDQo+ICsJCQnCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplKTsNCj4gwqAj
ZW5kaWYgLyogWEVfSU9DVExfSCAqLw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhl
Y19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxv
Y2F0b3IuYw0KPiBpbmRleCBiODg5NjdlNTguLjFlNzE3NTA2MSAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
eGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gQEAgLTExNjQsNyArMTE2NCw3IEBAIG1hZHZp
c2Vfc3dpenpsZV9vcF9leGVjKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHN0cnVjdCB0ZXN0X2V4
ZWNfZGF0YSAqZGF0YSwNCj4gwqAJeGVfdm1fbWFkdmlzZShmZCwgdm0sIHRvX3VzZXJfcG9pbnRl
cihkYXRhKSwgYm9fc2l6ZSwgMCwNCj4gwqAJCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9B
VFRSX1BSRUZFUlJFRF9MT0MsDQo+IMKgCQnCoMKgwqDCoMKgIHByZWZlcnJlZF9sb2MsDQo+IC0J
CcKgwqDCoMKgwqAgMCk7DQo+ICsJCcKgwqDCoMKgwqAgMCwgMCk7DQo+IMKgfQ0KPiDCoA0KPiDC
oHN0YXRpYyB2b2lkDQo+IEBAIC0xMTcyLDcgKzExNzIsNyBAQCB4ZV92bV9tYWR2aXhlX3BhdF9h
dHRyKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHJhbmdl
LA0KPiDCoAkJwqDCoMKgwqDCoMKgIGludCBwYXRfaW5kZXgpDQo+IMKgew0KPiDCoAl4ZV92bV9t
YWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIDAsDQo+IC0JCcKgwqDCoMKgwqAgRFJNX1hFX01F
TV9SQU5HRV9BVFRSX1BBVCwgcGF0X2luZGV4LCAwKTsNCj4gKwkJwqDCoMKgwqDCoCBEUk1fWEVf
TUVNX1JBTkdFX0FUVFJfUEFULCBwYXRfaW5kZXgsIDAsIDApOw0KPiDCoH0NCj4gwqANCj4gwqBz
dGF0aWMgdm9pZA0KPiBAQCAtMTE4MSw3ICsxMTgxLDcgQEAgeGVfdm1fbWFkdmlzZV9hdG9taWNf
YXR0cihpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCByYW5n
ZSwNCj4gwqB7DQo+IMKgCXhlX3ZtX21hZHZpc2UoZmQsIHZtLCBhZGRyLCByYW5nZSwgMCwNCj4g
wqAJCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX0FUT01JQywNCj4gLQkJwqDCoMKg
wqDCoCBtZW1fYXR0ciwgMCk7DQo+ICsJCcKgwqDCoMKgwqAgbWVtX2F0dHIsIDAsIDApOw0KPiDC
oH0NCj4gwqANCj4gwqBzdGF0aWMgdm9pZA0KPiBAQCAtMTE5MCw3ICsxMTkwLDcgQEAgeGVfdm1f
bWFkdmlzZV9taWdyYXRlX3BhZ2VzKGludCBmZCwgdWludDMyX3QNCj4gdm0sIHVpbnQ2NF90IGFk
ZHIsIHVpbnQ2NF90IHJhbmdlKQ0KPiDCoAl4ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFu
Z2UsIDAsDQo+IMKgCQnCoMKgwqDCoMKgIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURf
TE9DLA0KPiDCoAkJwqDCoMKgwqDCoCBEUk1fWEVfUFJFRkVSUkVEX0xPQ19ERUZBVUxUX1NZU1RF
TSwNCj4gLQkJwqDCoMKgwqDCoCBEUk1fWEVfTUlHUkFURV9BTExfUEFHRVMpOw0KPiArCQnCoMKg
wqDCoMKgIERSTV9YRV9NSUdSQVRFX0FMTF9QQUdFUywgMCk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0
YXRpYyB2b2lkDQoNCg==
