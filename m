Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB9C021A6
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4010E39C;
	Mon, 17 Feb 2025 08:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PI/f1YPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61E310E39C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739781863; x=1771317863;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+8UBDf5F7kL8hZZMuHn9MhUJRs6nCeQyCZLURdYRIsU=;
 b=PI/f1YPxCieI6uKN2+6KpAvTsM9qsrQYg8IwLMqNfTrOpY1XdHqPMys/
 x4+t+KGCaeIzZHMnaeAGGiXFxEbPW5P7eAP+jJTBgG6MYPSQOQrFT3wK7
 v/n2LKL+nQxb35UxDwAGHlr7dPcOhdTKXIKyCKiGElze6wok+QgqXxVpR
 1KNwJPMYRsHJ5ksa2GI6bm1U8Fs7oWM9yZqONc0q+YESmmkMMgdHVJOh1
 5CPT7BPevVIXlL5ltR7p4DQ8BH9nQ2i3E7Vk8nCmFf2GAZ4ATVMKzE3mu
 nPCS1b7ouC6tBNPZqS8SYjHTss+Flzj3GwhHo1Oya8J79od8deO6AHzeH g==;
X-CSE-ConnectionGUID: RgVX4ziuT0ilb8xnxL1bog==
X-CSE-MsgGUID: ghYVKkW0RXiitpmbfVcQmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51101528"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="51101528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:44:23 -0800
X-CSE-ConnectionGUID: WdjBlCHsQeOpbeDBUjgLIg==
X-CSE-MsgGUID: v2qfvRwwQ1KDjFX1r6SLKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119271683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:44:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 00:44:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:44:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:44:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I894ptjzVUJC2YMnqsK+5Vo8i3hsz/hWHBJFEUV7lX7GIxzgnH0gZbJ2lgWgwZIUPZE/et8lBuZhK2Z9eL1hE0uzFl5Ni8PSwYfoCX9mH4i7HicgFQlU9Hx0UO7LY47pMQz3FS+VrLkjqJR/+icuQgJ1UO95tz/9tJOrVduurIqjfMBSme0HTLeMD6QyUxZ4DhDOmRqjSqoTqWNgR3Rg3cYtwjRX4gCfbZoJC52aPsGWSbePMQGkDOpthEAzum1o8d4jqGPJ6fpwgVikftY67SslRunVerQCgeWPa+YMkjbU681rkTRsVZpSYN3Wf7LkRkJcQuUZhxmL7OaxR4hmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8UBDf5F7kL8hZZMuHn9MhUJRs6nCeQyCZLURdYRIsU=;
 b=s7oM6LfJLVXv+6Odn6Z2kKaiyxaX8GoVDnR/qdy2DMcB2uYMYxrURRBhHbX09912KABY/4zcFwV45DUetWn+NAclQ4N0Oqpn6hdoyLyCbEvIao5p0NuIpXUmq+NOpiMjNrZMX6KHr0/dyEXrHp2yAD9golbW8AmMoP/8aye2FfglK8eow/N+LEaEdVT79u1NJCaUbJnff0ZJKxTGfQOAMvO+R7b7KG8AwU+PZvHtw+HeUyOoDyAyWDYvUI4cAfM6R63UUK3CHaVCKr5/WbgJVZ94haoFq1TnV0HHGMEzGGfVnigtx811FoZZAcl0BsGIsOF9Nk5EMi3mWpHCBD5o7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:43:50 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 08:43:50 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test category'
 from documentation
Thread-Topic: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test
 category' from documentation
Thread-Index: AQHbe6nlRH1hDhqauUWDDOxnCAEG/7NB0pUAgASceACAAC6v4IAEl7cAgAADKNA=
Date: Mon, 17 Feb 2025 08:43:50 +0000
Message-ID: <IA1PR11MB6097A3F3D23F41AC85632E8486FB2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
 <47345d63-1927-4871-85ec-5083ca601ba1@intel.com>
 <IA1PR11MB60971275D3EBF5AE5C8A5EB886FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
 <DM8PR11MB5686BA1359E67AB8FEE9ED4098FB2@DM8PR11MB5686.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5686BA1359E67AB8FEE9ED4098FB2@DM8PR11MB5686.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CYXPR11MB8663:EE_
x-ms-office365-filtering-correlation-id: 17aa311d-5e2b-40c7-8d01-08dd4f2f33d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDdsVUdEYVY0Z0taZEJCbnBqNEpJK0NtYldNVUp6N2tXdDA4cU5MUk02ZVRJ?=
 =?utf-8?B?alU5MGd6VEZnZDNmOE04UnF6ZkxwQ1pqcnlYbVRvMGw3YnhRT1I2RnJiOXU0?=
 =?utf-8?B?bjB5a0dXcjZsNnBUY2NXTDZ6R2J0akc0VUl2c1cvMk9OVWVUU25POVcwd0tO?=
 =?utf-8?B?dkMwdUhKZXdBZGF4Vk1HNWJrMEg5K0ZmOVpjVFQ2ajB5NWV5eXYxOTI1Zk9V?=
 =?utf-8?B?NjR1Z0hjRUk4M3huN3RUKzJ4U1JkN1R0OVJMbFV5cVlsd3A2R0llaXp5UFRn?=
 =?utf-8?B?Zm5JQ2J0WjRPZ085ZUo4UnlpSUhXd3ZiWGd1NGtsNHdOL1Z1ODdxNzk1YnFx?=
 =?utf-8?B?SmQ0eDB6QW5VZUVmS0VTMHJiOXYrRm9tTHliRDlMS0YwcmF2Vms5a0RJNmJ2?=
 =?utf-8?B?WXBlYWJNLy8zQXNPN3NpbGZrU3h5MXlMUzVnb290OFd2RWtjWG1jT200TDVr?=
 =?utf-8?B?S0l3OUpyRHdyb2xOU2ozUkd6alV2VkxlaTRKOUV0T0g4bzFiRVp2L3B2TXQx?=
 =?utf-8?B?NWJNcXNxZmxtWFA0L3RsK0FrN0ZQdTQ2b1FOVnF2RVBmNkorRHNsWnY0MGtz?=
 =?utf-8?B?anlKcDZ4L0F2TGdPZUlxTTh3YXA0cVZpMmhxS1VhbUNsNlc3d2d4ZUdOWDBG?=
 =?utf-8?B?WTNZWVhyb2cvdVREZkt3YWxhSWFZdHBUdnE1cUdqeEEwT1BmZ2doWnNodHVB?=
 =?utf-8?B?aEQzN3BmeEJyQXM4ajhzaHJoQk03d2Y2Q04yOTU0WTNVWFc2aWI0WHNTZUZu?=
 =?utf-8?B?UmxMRmZBcVNOUW43VHdKc2JKNHdyUnhEZW9PY1Z3c1dtbWs0R1ZrTlVJQ0Yx?=
 =?utf-8?B?aUk0cy83QjFCMmxWQ0FLYXliUkRPd1E1STViVWlrNGJ5TllqVEQ0TXdXcTBH?=
 =?utf-8?B?dDhYU3lxcVJ3RFArUStvTlovVHcwTVNuZDExR3RvWENjc1ZBdHI2RDNXREhP?=
 =?utf-8?B?SEJZekp6VE5WUFRiNktma1BYSFN0WlFabi9aazhXa2l0L0ZTSHp0bEUxcTN5?=
 =?utf-8?B?K1drTjV6S2taNnN6YVh2RHJHMW9wdWFjRWUzZFR5dkUzOG45NmMrSEFuZkp1?=
 =?utf-8?B?SFJmVTBqZjl1a1J1ZTNRT1J2SjNKOU9qMVVtK3d2RC9ldnA5MHFMZ3ZHTk02?=
 =?utf-8?B?d1p4RlY3MmNBOUVvOXlJSWdjTGpwa2puajZxZW0vNDhSNU03THc0Z05DV3JR?=
 =?utf-8?B?U1o4MlJyOEJWZkErME12aGVZRHlQWUFpMGVPeGFjdWdZa3ZjMzExR3FGdE02?=
 =?utf-8?B?M2FBZUd1MEJCRUQ2OWV2ekd5YzBHMnk2eEp2UVBKaVB6UHU2VDc2d1ZUUW02?=
 =?utf-8?B?TUl1MnB6MnorVUYyMmpVbjEyaDZvYTRPK2c3T244VGg4Q1A2WmxFQXpQdWpT?=
 =?utf-8?B?WS9wUkNXUlFHRERtaHdNRk5SK01uODJLUU5JSElIZjBVY0pJamhidkI2bWFu?=
 =?utf-8?B?UHZMa2pUM2VBMW5HOC9pNllnTHJGL25OcDZPUDU2MW1qL0VWcnVFczljMXdr?=
 =?utf-8?B?VHE5Z2YyU1lzbnlINldCeS9wQlBqLzRUVWduQVEybnRuMkdTUzdMZk8zaWdW?=
 =?utf-8?B?bkdyOHFBdlhVRTk4NGFFNlFzVVBBd2RJKzNndnNUMDhWQnZ3NElXanMwK1hV?=
 =?utf-8?B?UUlvYm82clRyK1pxRWZHVm1wZVlGeGVSdW4xWWwvdHBUVkJJNzVwaUhVRjYv?=
 =?utf-8?B?WG9jQmN6ZEdQKzRnSUV6N3gzSFQzcVFmVlBQNCtQb3MveDVDVUxqaTFnT04x?=
 =?utf-8?B?VDdFck1mdkY3bDg1NndLL2ZrSzIxVFlKazNka2RiWURkOW1OY0hWcG93RXVW?=
 =?utf-8?B?MXN3dDV3Qy9OQXhWM21ZamJFVmx2T2c3Y1R2cmxVcjIzS0FTUHhJNmp4d05J?=
 =?utf-8?B?OVZlb1lCMkNIUHNGQVVtUk5zVnR0RDVWSGhteHdhZ2xtYXNyRHdRekp3R3Bt?=
 =?utf-8?Q?5cQu17ak8czX4wAFDYvtLWi9UFDgB6KO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enlwN1owQzZFSG5PT0t2Z205R2RvcHNiY3JPNWp4dlFrZEZjNG1tYVN5cHlR?=
 =?utf-8?B?OHFPNlpOTmV1bDNrWXVjNHI2MnlKWUcxTWI2eUI4WFIrKzdQTmtoR2pEdGhk?=
 =?utf-8?B?cHcrQVdyN0ZGY0R5a1dvZVVCcnp6aWNlc3pnOW5xNnZxckQwL1QxeTFITGVV?=
 =?utf-8?B?TktJM0lXUVdWZzhuRlNlSDBSckw2b2NKR0VwanhEZGtlalN1bitrTkplVlBM?=
 =?utf-8?B?K1hzR2g2Tjc1VjZCNmZDNmdCc20yaUxBeWRXbFgzWmlqYVVnQkRNWDEyeUk1?=
 =?utf-8?B?QWNvSi9TbUtDY1IvU2dGTUhveU9FNjQ4NlpDc3VCdVo3VGgrUy93cGwzT1o4?=
 =?utf-8?B?RXZqV3BGUkxtVTZCaklPZHhCWVRYd21zekxicis5ZlZVc254MVl2Z3dFRHdG?=
 =?utf-8?B?cE9lRGQ4ZkZYQitKWkRBbzFTT05VMDZ4RTZZWDBlbHlyVVFIQ08raGZhVWEw?=
 =?utf-8?B?ZjErTUNXUWxFd1ZEV1pqRG9UeGUwM3VqZHUzb09qdmV1cEorT1N0L2ZPRHdP?=
 =?utf-8?B?NG43bkZqRkVrdnNFYWZsSlBzYXR3Z1pYUUx4NnVjSzMwSTVuVWpsZ25CdmMx?=
 =?utf-8?B?aU9KOGJ2bGRwNHlPV2ZUWExYNHFNbFlqbjcwTjJURUs5bGt4Ym5rcnBGNmJ1?=
 =?utf-8?B?Zy9uMTA3c2ptUWxhb0tPYkJwOUFPQzFwODJQOUpuc2gycHJFM1QzOXZsQmho?=
 =?utf-8?B?Vi9QSlF3OUFOV2ZNMkNpSVh1eUJIOHZKUTR2NE00aGgrOWFMYzdpTjFndHFq?=
 =?utf-8?B?bkJ4bUZZdmlEMXNaeDV0NS9CazNZZzRtVVNmTUFISE9WaUpzdkJiQ2loeFBJ?=
 =?utf-8?B?ZWlHTzMyY0ZuVDhuZklkZVQ4d2hvVkhHUXdwNXFVYjdkUW1tUGpNdlVObFF3?=
 =?utf-8?B?Wktub1RQTDhnb21vTWoxYlNLVTVLOFhOS1JTQmtNSnc2akpDbGZvOGxIK2RN?=
 =?utf-8?B?L0tPTkpUaVNNRklROUZ1OEV4U0x2NHFwT1JCTExkTnZOZFlSSGR0OGhUNm03?=
 =?utf-8?B?cXZrbXR3Q2VXdFNaZDdGUURIMzljclhyKzlIdWFkR21peEQ0Vjl5YjdJUHpP?=
 =?utf-8?B?VFg4Y28yQ2ZrSzlybG1aRWZqUjlaNmZTd0Q0bmpuL2NpdzNBVEZORk8vS05n?=
 =?utf-8?B?YWZNRUlzMW5oTlhKSyt2bDVtSTlkQVdZdDNhT0ZQb2Z2cy9xNW9RVjF0WWt3?=
 =?utf-8?B?cTJlc05vU2JjdjdXM240MlU4VVdQQjFIY1FSZTlrMXdFbURXKzlOZTU1bHIv?=
 =?utf-8?B?anhuYm9qbW4zOGMvNml2S1pOUjVXbnc4QjQrVDRwazlTNmE3OW9qSmtUbXFq?=
 =?utf-8?B?TXUwTFFWdHgzaWcvWEQwWXhmYjVNWkJwSk52d3lGQk1GUVZFNnJneE51VGY3?=
 =?utf-8?B?aHpaSFhtOUY2UDJUaGN4eHJ4M1J6TkZoV21zanJIZlEyMUtBTWFEcVl6ODhV?=
 =?utf-8?B?N0xJWVpOSlpJMkNXN1BDcUROM05rVllacUM2ZTR0Nk4vSGF5bnhSQ05BQUZP?=
 =?utf-8?B?Ulprd2YxUXdidjl5ejMzRjEycWt5UWh0VEE3UFVmM0xZTjhMMkJuTlRsbG00?=
 =?utf-8?B?Nm1DcG1YbTJ2YWY5dHpnR0Y2QjJ2VzJFcGZNNWh5UDVIelluL1NIMW83WnZh?=
 =?utf-8?B?NGZVTXlPd0NCOTZHNHo0WktQYVI5cTQwUjNHMUpNbVh2bVIzVWp0aHh1ejlM?=
 =?utf-8?B?NHUrenRCVTZSZ3VSbWJJQUh1Vlp3eGR6ZExrRkZVK2xsakt6STlYbUNyNDVo?=
 =?utf-8?B?cHVmbWxMRFA3eHpUUFNiMlJWazJjdG12bjR4Z2g2OXRsbmdsSmVrRzlDVEZy?=
 =?utf-8?B?WjZ3VWJPWlZoYnRaWkxNeDM3TStXN09oaTA3UDdkTENlVm9Wc1RFVm5vQncx?=
 =?utf-8?B?WlpDOXFKVUsrZnVxSXdaQ042L3FjQ0JiSFRxeXQ5dUQ2ZHZubUdIUU5lTTRC?=
 =?utf-8?B?MUpHRFBHRnhuZFlobVVDMGZmd09pN1FabGlhQVkwK29xQWx4aFVPN2wySlM5?=
 =?utf-8?B?QjlkTklvejl1VnlmQnBmNEFONGFaSXRYTVROWGU1bGZRVG1GTm92eG9Wa0h6?=
 =?utf-8?B?VDdiYkwyTGxSaU5LaEtDdFQ1WUFrQ3BsbnRQZHNZMHVlWjhZMXVSUTYzbVlu?=
 =?utf-8?B?QzYza3k5WVEzY01URXNaR2c5blJoYXBZZFVvSzNzL1lBcU04NmN4NWZqU243?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17aa311d-5e2b-40c7-8d01-08dd4f2f33d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 08:43:50.7780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IpPt67MsMnAosVAdnXdAuBJyaJivostII/RZ8bl7JCgUB8/AXpz8sgXdQRxyAOFnWvuFIVGRQ6Ld8Ki3eEad+HPkRuXi98KzZwAacwd3BYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUYWh2YW5haW5lbiwgSmFyaSA8
amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBGZWJydWFyeSAxNywg
MjAyNSA5OjMyIEFNDQpUbzogUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxrYXRhcnp5bmEucGllY2ll
bHNrYUBpbnRlbC5jb20+OyBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+
OyBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCBpLWctdF0gdGVz
dHMva21zOiBEcm9wICdGdW5jdGlvbmFsaXR5JyBhbmQgJ1Rlc3QgY2F0ZWdvcnknIGZyb20gZG9j
dW1lbnRhdGlvbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZWNp
ZWxza2EsIEthdGFyenluYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KPiBTZW50
OiBGcmlkYXksIEZlYnJ1YXJ5IDE0LCAyMDI1IDEyOjI2IFBNDQo+IFRvOiBTaGFybWEsIFN3YXRp
MiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+OyBLYW1pbCBLb25pZWN6bnkgDQo+IDxrYW1pbC5r
b25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IA0KPiBUYWh2YW5haW5lbiwgSmFyaSA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ttczogRHJvcCAnRnVuY3Rpb25hbGl0eScg
YW5kICdUZXN0IGNhdGVnb3J5Jw0KPiBmcm9tIGRvY3VtZW50YXRpb24NCj4gDQo+IA0KPiANCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBTd2F0aTIgPHN3YXRp
Mi5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDE0LCAyMDI1IDg6
MzcgQU0NCj4gVG86IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVs
LmNvbT47IGlndC0gDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRhaHZhbmFpbmVuLCBK
YXJpIA0KPiA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+OyBQaWVjaWVsc2thLCBLYXRhcnp5
bmEgDQo+IDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaS1nLXRdIHRlc3RzL2ttczogRHJvcCAnRnVuY3Rpb25hbGl0eScgYW5kICdUZXN0IGNh
dGVnb3J5Jw0KPiBmcm9tIGRvY3VtZW50YXRpb24NCj4gDQo+IEhpIEthbWlsDQo+IA0KPiBPbiAx
MS0wMi0yMDI1IDAyOjQxIHBtLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+ID4gSGkgU3dhdGks
DQo+ID4gT24gMjAyNS0wMi0xMCBhdCAxNjoyNjo0NiArMDUzMCwgU3dhdGkgU2hhcm1hIHdyb3Rl
Og0KPiA+PiAnRnVuY3Rpb25hbGl0eScgc29sZWx5IGRlcGVuZHMgdXBvbiBkZXZlbG9wZXIncyBp
bnRlcnByZXRhdGlvbiBhbmQgDQo+ID4+ICdUZXN0IGNhdGVnb3J5JyBpcyBub3QgdXNlZC4gTGV0
J3MgcmVtb3ZlIHRoZW0gZnJvbSB0aGUga21zIHRlc3RzIA0KPiA+PiBkb2N1bWVudGF0aW9uIHNv
IHRoYXQgZG9jdW1lbnRhdGlvbiBjYW4gYmUgbWFkZSBwcmVjaXNlIHdoaWNoIGlzIA0KPiA+PiBl
YXN5IHRvIG1haW50YWluLg0KPiA+Pg0KPiA+ICtjYyBKYXJpIGFuZCBLYXRhcnp5bmENCj4gPiBD
YzogSmFyaSBUYWh2YW5haW5lbiA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+DQo+ID4gQ2M6
IEthdGFyenluYSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+
ID4NCj4gPiBPbmUgbW9yZSB0aGluZyBpcyB0aGF0IHN1Y2ggY2hhbmdlIHNob3VsZCBhbHNvIHVw
ZGF0ZSAqanNvbiBmb3INCj4gPiBleGFtcGxlOg0KPiA+DQo+ID4gZ3JlcCBGdW5jdGlvbmFsaXR5
IHRlc3RzL2ludGVsLypqc29uDQo+ID4NCj4gPiB0ZXN0cy9pbnRlbC9pOTE1X3Rlc3RfY29uZmln
Lmpzb246ICJGdW5jdGlvbmFsaXR5Ijogew0KPiBDaGFuZ2UgaGFzIGJlZW4gZG9uZSBvbmx5IGZv
ciBLTVMgZG9jdW1lbnRhdGlvbi4NCj4gPiB0ZXN0cy9pbnRlbC9rbXNfdGVzdF9jb25maWcuanNv
bjogICJGdW5jdGlvbmFsaXR5Ijogew0KPiBGb3IgS01TLCB0aGlzIGZpZWxkIGlzIG5vdCAibWFu
ZGF0b3J5Ii4gU28sIG5vIGNoYW5nZSByZXF1aXJlZCB0aGVyZS4NCj4gSWYgbmVlZGVkLCBJIGNh
biByZW1vdmUuDQo+IA0KPiAoS2FzaWEpIEkgcmVtZW1iZXIgdGhhdCAnRnVuY3Rpb25hbGl0eScg
ZmllbGQgaXMgbm90IG5lZWRlZC4gTWF5YmUgaXQgDQo+IHdvdWxkIGJlIGdvb2QgdG8gcmVtb3Zl
IGl0IGZyb20ga21zIGpzb24gZmlsZS4NCj4gSG93ZXZlciwgSSBhbSBub3Qgc3VyZSBpZiB0aGlz
IHdpbGwgbm90IGFmZmVjdCBidWlsZGluZyBhbGwgDQo+IGRvY3VtZW50YXRpb24uIEphcmkgLSBj
b3VsZCBZb3UgbG9vayBhdCB0aGlzIHByb3Bvc2FsPw0KDQpBY2sgZm9yIHRoZSBjaGFuZ2UsIHN0
aWxsIGhhdmluZyBhbiBvcGluaW9uIHRoYXQgd2UgYXJlIGxvc2luZyBzb21lIGdyYW51bGFyaXR5
IHRoYXQgd2UgbWlnaHQgd291bGQgbGlrZSB0byBoYXZlIGF0IHNvbWUgcG9pbnQuIEJ1dCBJIGNh
biBsaXZlIHdpdGggdGhpcywgYW5kIHBlciBteSB1bmRlcnN0YW5kaW5nIGRvY3VtZW50YXRpb24g
YW5kIG90aGVyIGFyZWFzIHVzaW5nIHRoZXNlIGRvY3VtZW50YXRpb24gdGFncyB3aWxsIG5vdCBi
ZSBicm9rZW4gYnkgdGhpcyBjaGFuZ2UuIA0KUGVyc29uYWxseSwgSSB3b3VsZCBrZWVwIEZ1bmN0
aW9uYWxpdHkgYXMgcGFydCBvZiB0aGUganNvbiBmb3Igbm93IGJlaW5nIG9wdGlvbmFsLiBJZiBz
byBkZWNpZGVkIG9uZSBjYW4gY2xlYW4ga21zIGpzb24sIGFuZCBJIGNhbiBsaXZlIHdpdGggdGhp
cyB0b28uDQoNCkJyLCBKYXJpDQoNCkhhdmluZyBKYXJpJ3MgcmVzcG9uc2UsIGxldCdzIGtlZXAg
RnVuY3Rpb25hbGl0eSBpbiBqc29uIGZpbGUuDQoNClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgUGll
Y2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KDQpLYXNpYQ0KDQo+IA0K
PiBLYXNpYQ0KPiANCj4gPiB0ZXN0cy9pbnRlbC94ZV90ZXN0X2NvbmZpZy5qc29uOiAgICJGdW5j
dGlvbmFsaXR5Ijogew0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBLYW1pbA0KPiA+DQo+ID4+IFNp
Z25lZC1vZmYtYnk6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+ID4+
IC0tLQ0KPiA+PiAgIHRlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2F1ZGlvLmMgICB8ICAg
NSAtDQo+ID4+ICAgdGVzdHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fY29sb3IuYyAgIHwgICAy
IC0NCj4gPj4gICB0ZXN0cy9jaGFtZWxpdW0va21zX2NoYW1lbGl1bV9lZGlkLmMgICAgfCAgMTEg
LS0NCj4gPj4gICB0ZXN0cy9jaGFtZWxpdW0va21zX2NoYW1lbGl1bV9mcmFtZXMuYyAgfCAgMTEg
LS0NCj4gPj4gICB0ZXN0cy9jaGFtZWxpdW0va21zX2NoYW1lbGl1bV9ocGQuYyAgICAgfCAgMjYg
LS0tLS0NCj4gPj4gICB0ZXN0cy9mYmRldi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2k5MTVfcGlwZV9zdHJlc3MuYyAgICAgICAgICB8ICAg
MyAtDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX2JpZ19mYi5jICAgICAgICAgICAgICAgIHwgIDEx
IC0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX2J1c3kuYyAgICAgICAgICAgICAgICAgIHwgICAz
IC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfY2NzLmMgICAgICAgICAgICAgICAgICAgfCAgIDQg
LQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19jZGNsay5jICAgICAgICAgICAgICAgICB8ICAgMiAt
DQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX2RpcnR5ZmIuYyAgICAgICAgICAgICAgIHwgICAzIC0N
Cj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfZHBfbGlua3RyYWluX2ZhbGxiYWNrLmMgfCAgIDIgLQ0K
PiA+PiAgIHRlc3RzL2ludGVsL2ttc19kcmF3X2NyYy5jICAgICAgICAgICAgICB8ICAgMiAtDQo+
ID4+ICAgdGVzdHMvaW50ZWwva21zX2RzYy5jICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4g
Pj4gICB0ZXN0cy9pbnRlbC9rbXNfZmJfY29oZXJlbmN5LmMgICAgICAgICAgfCAgIDIgLQ0KPiA+
PiAgIHRlc3RzL2ludGVsL2ttc19mYmNvbl9mYnQuYyAgICAgICAgICAgICB8ICAgNSAtDQo+ID4+
ICAgdGVzdHMvaW50ZWwva21zX2ZlbmNlX3Bpbl9sZWFrLmMgICAgICAgIHwgICAyIC0NCj4gPj4g
ICB0ZXN0cy9pbnRlbC9rbXNfZmxpcF9zY2FsZWRfY3JjLmMgICAgICAgfCAgMTIgLS0NCj4gPj4g
ICB0ZXN0cy9pbnRlbC9rbXNfZmxpcF90aWxpbmcuYyAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAg
IHRlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jICB8IDE0NyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfam9pbmVyLmMgICAgICAgICAg
ICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19sZWdhY3lfY29sb3JrZXkuYyAg
ICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX21tYXBfd3JpdGVfY3JjLmMgICAg
ICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcGlwZV9iX2NfaXZiLmMgICAgICAg
ICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19wbV9iYWNrbGlnaHQuYyAgICAgICAg
ICB8ICAgNSAtDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3BtX2RjLmMgICAgICAgICAgICAgICAg
IHwgICA4IC0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3BtX2xwc3AuYyAgICAgICAgICAgICAg
IHwgICAyIC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fcnBtLmMgICAgICAgICAgICAgICAg
fCAgMTUgLS0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3Bzci5jICAgICAgICAgICAgICAgICAg
IHwgIDMzIC0tLS0tLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMgICAgICAgICAg
ICAgICB8ICAyNSAtLS0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3Bzcl9zdHJlc3NfdGVzdC5j
ICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcHdyaXRlX2NyYy5jICAgICAg
ICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ttc18zZC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zX2FkZGZiX2Jhc2ljLmMgICAgICAgICAgICAg
ICAgIHwgIDE3IC0tLQ0KPiA+PiAgIHRlc3RzL2ttc19hc3luY19mbGlwcy5jICAgICAgICAgICAg
ICAgICB8ICAgNCAtDQo+ID4+ICAgdGVzdHMva21zX2F0b21pYy5jICAgICAgICAgICAgICAgICAg
ICAgIHwgICA0IC0NCj4gPj4gICB0ZXN0cy9rbXNfYXRvbWljX2ludGVycnVwdGlibGUuYyAgICAg
ICAgfCAgIDYgLQ0KPiA+PiAgIHRlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5jICAgICAgICAg
ICB8ICAgNCAtDQo+ID4+ICAgdGVzdHMva21zX2J3LmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNfY29sb3IuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ttc19jb25jdXJyZW50LmMgICAgICAgICAgICAgICAgICB8
ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jICAgICAgICAgIHwg
ICA3IC0tDQo+ID4+ICAgdGVzdHMva21zX2N1cnNvcl9jcmMuYyAgICAgICAgICAgICAgICAgIHwg
ICA1IC0NCj4gPj4gICB0ZXN0cy9rbXNfY3Vyc29yX2VkZ2Vfd2Fsay5jICAgICAgICAgICAgfCAg
IDIgLQ0KPiA+PiAgIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5LmMgICAgICAgICAgICAgICB8ICAg
MiAtDQo+ID4+ICAgdGVzdHMva21zX2Rpc3BsYXlfbW9kZXMuYyAgICAgICAgICAgICAgIHwgICAz
IC0NCj4gPj4gICB0ZXN0cy9rbXNfZGl0aGVyLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
LQ0KPiA+PiAgIHRlc3RzL2ttc19kcF9hdXhfZGV2LmMgICAgICAgICAgICAgICAgICB8ICAgMiAt
DQo+ID4+ICAgdGVzdHMva21zX2ZlYXR1cmVfZGlzY292ZXJ5LmMgICAgICAgICAgIHwgICA3IC0t
DQo+ID4+ICAgdGVzdHMva21zX2ZsaXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0IC0t
LQ0KPiA+PiAgIHRlc3RzL2ttc19mbGlwX2V2ZW50X2xlYWsuYyAgICAgICAgICAgICB8ICAgMiAt
DQo+ID4+ICAgdGVzdHMva21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpYy5jICAgICAgIHwgICAzIC0N
Cj4gPj4gICB0ZXN0cy9rbXNfZ2V0ZmIuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgLQ0K
PiA+PiAgIHRlc3RzL2ttc19oZG1pX2luamVjdC5jICAgICAgICAgICAgICAgICB8ICAgMyAtDQo+
ID4+ICAgdGVzdHMva21zX2hkci5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwIC0tDQo+
ID4+ICAgdGVzdHMva21zX2ludmFsaWRfbW9kZS5jICAgICAgICAgICAgICAgIHwgICAyIC0NCj4g
Pj4gICB0ZXN0cy9rbXNfbGVhc2UuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+
PiAgIHRlc3RzL2ttc19tdWx0aXBpcGVfbW9kZXNldC5jICAgICAgICAgICB8ICAgMiAtDQo+ID4+
ICAgdGVzdHMva21zX3BhbmVsX2ZpdHRpbmcuYyAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4g
ICB0ZXN0cy9rbXNfcGlwZV9jcmNfYmFzaWMuYyAgICAgICAgICAgICAgfCAgIDUgLQ0KPiA+PiAg
IHRlc3RzL2ttc19wbGFuZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyAtLQ0KPiA+PiAg
IHRlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAg
dGVzdHMva21zX3BsYW5lX2N1cnNvci5jICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0
ZXN0cy9rbXNfcGxhbmVfbG93cmVzLmMgICAgICAgICAgICAgICAgfCAgIDMgLQ0KPiA+PiAgIHRl
c3RzL2ttc19wbGFuZV9tdWx0aXBsZS5jICAgICAgICAgICAgICB8ICAgMyAtDQo+ID4+ICAgdGVz
dHMva21zX3BsYW5lX3NjYWxpbmcuYyAgICAgICAgICAgICAgIHwgICA2IC0NCj4gPj4gICB0ZXN0
cy9rbXNfcHJvcF9ibG9iLmMgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3Rz
L2ttc19wcm9wZXJ0aWVzLmMgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMv
a21zX3JvdGF0aW9uX2NyYy5jICAgICAgICAgICAgICAgIHwgICA1IC0NCj4gPj4gICB0ZXN0cy9r
bXNfc2NhbGluZ19tb2Rlcy5jICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2tt
c19zZWxmdGVzdC5jICAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21z
X3NlcXVlbmNlLmMgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNf
c2V0bW9kZS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDMgLQ0KPiA+PiAgIHRlc3RzL2ttc19z
eXNmc19lZGlkX3RpbWluZy5jICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zX3Rp
bGVkX2Rpc3BsYXkuYyAgICAgICAgICAgICAgIHwgICAzIC0NCj4gPj4gICB0ZXN0cy9rbXNfdHZf
bG9hZF9kZXRlY3QuYyAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ttc192Ymxh
bmsuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxMCAtLQ0KPiA+PiAgIHRlc3RzL2ttc192cnIu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSAtLQ0KPiA+PiAgIHRlc3RzL2ttc193cml0
ZWJhY2suYyAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMvdGVzdGRpc3Bs
YXkuYyAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICA4MSBmaWxlcyBjaGFuZ2Vk
LCA1NTIgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4gLi4uY3V0Li4uDQo+ID4NCg0K
