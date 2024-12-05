Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DDFE77171
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1076710EE02;
	Thu,  5 Dec 2024 09:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2tMDvRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CA910EE02
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733389697; x=1764925697;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IBasJbAiJBQq0QtPq/pCVVNUUVCE5+Hg+RgGW6PLlik=;
 b=E2tMDvRWCWG8Z85Yrjn+n76BsY2VpjXHPh5E01L3/ZuKUz7lYkI62Isn
 BvwZSI4OmtfHVwOQV5JLSFmDAXXX6vxGvQjirRdVQ2tosgGLkMNf2iq6y
 6uhPDiBGdw6yEigt0JoUms05ug+uELu9XIwz2BT9MpC7B75K9f7wGFuAX
 VShrHFmgxw1FsNEIxww52+JUtexJIpFavNMb0jW7qe1tNzBOtL+SSaZm3
 +me0D7fvgacnhqlaPkhWvxx9pRmsOAYYKdLDq4gwtaHissStT9DuFXFj4
 N8mZ6dsYw4GkRNlf/3FdH/tFj9FaXyPTc/oLgR7NIDxZYvxya30J4CWOw g==;
X-CSE-ConnectionGUID: 0Fd5BoBoRbK9+F+cZMn3zA==
X-CSE-MsgGUID: lgvB1H1UTuu8PVx7gdhy3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33429400"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33429400"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:08:17 -0800
X-CSE-ConnectionGUID: M77NN8uoTmShDwtogbN8ew==
X-CSE-MsgGUID: gFY4eUciS/eYkRw/FPkh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="93898892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 01:08:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 01:08:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 01:08:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 01:08:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRd9VVu0G/vWRi9CpzHDno9CRjCO6KkR3Vm96grA+4NSWwQF+cPKOzht4ToTxSCoKNoUIw47U6ozuuA+aRC22rvkFLJL8OmH3/z3K3AJPuB6r8JrBER0xcW3QiSr7EoxttA5Ue1uCtOKhebFrQ5nVAylEaQ3tYRcbdFfPrIfiomBST3BciWMmUEZIWjPxFai6IZDUtjOv8fjuZtnHQSTW72TBI6XUvFa9S+YpfLSHcLKfFOeWAkXaXHopmt9P6fFw6q16XMRNoZZr+qr4g9dzpbY863CmbeHcgEVsXp6IiGJoJBbB6PmJ6xbo7LWeNBAGHrbetokc5Aj5/o5uyU1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZCvz9lAuWEmomUMxHuJG1TxJNPUxkZOvWMA9tXXPGQ=;
 b=IHk/3wZw+tkQf/T0sKhNCW+RXIm/muGaifEN4i6aZPutmncnSwAl4fmiVdLHmQlnBto61b1M29NNlMvMHvTXNCh+QITa8Cbeq/1vvfMwKPNj33772BslRFA9zXxcdVsZuNwxhWiupH+Gxmz8ywdGQIq84qShNhRgg9iwBOtTdr7zQzlJ0O72B63HDmw2/amNftrca7W+448rS2K6/5eXTVd8U2ADJKk4ZpEwa0d1RgMlSR/auogSQ0UY6ty62xA+adZFf2fEuEuTFpf5XhyYmZs9Rpvk0G1rfTN94HdKEtVZYDkEqWv4WHib9c97QVZ2ZaoLSmQY+XXPTXVVnbP7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 09:08:13 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 09:08:13 +0000
Message-ID: <9ff6ed6e-59ea-4956-8085-5478fa9c361d@intel.com>
Date: Thu, 5 Dec 2024 14:38:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
 <20241202085127.1785594-2-swati2.sharma@intel.com>
 <PH7PR11MB6053A9B428396F52FE88A90DE7352@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <PH7PR11MB6053A9B428396F52FE88A90DE7352@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 953c177c-9f56-45c1-de92-08dd150c5910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk1RQ2xFaGU0ZENWSGNGc1NtMHRaTjFaMFQzQzJZQnRPdy9xYU1ob2p3OGpx?=
 =?utf-8?B?ejdQb24wU08wZ3djbE0vWnBaOGlNNmcxdnhHNnJoU3YzbllWaHdJS0NkY01J?=
 =?utf-8?B?dzhHRDQxeVRUMlUvZGZXWDI2RTU5NUtySDB3MDQ1WU5qQ2lVWkE5aHRhUjJZ?=
 =?utf-8?B?d0NtVWN0bnp2VGZNZjJyN1hNaGEzaUlOL2NrVC9GZTNkUEdMa0F2U014ZG9P?=
 =?utf-8?B?Qm9YN0k3LzFuTUxJTnJsZmdaSUtQSVUvZ29YaGRvYnpHUk85d1QwSDF3Z2ND?=
 =?utf-8?B?VGdZYXU3eXR0SWJLUjV4bGRSSzJ1M1g0QWJRRGFRTCtpcHcrOUhZRnBBWG5C?=
 =?utf-8?B?NW1WN3dmVFZURUg3dk52WGlDREZoSWxYYkpKQ082Z2VqOGNYTkROalhjOHJq?=
 =?utf-8?B?T3Y5ZGorQ3NPN1dadlpxYmNQRkZCcm1LSXBMa09lVXhheGF5RW4yZ2JRb0RJ?=
 =?utf-8?B?K1VQR2tUTE1pb3p0bVhBUEVycDQ1V2N0UTQvMjB6QTJiZXhDdE5vTUhtTjUx?=
 =?utf-8?B?RlZaUEx3c0dmdDdvVkpOVFRXM2JkbTFkZ21zNEdQd3hDYlZhOGFBTi9CRVND?=
 =?utf-8?B?VFMwUGhOL2taaUF5V3NXZzNyL3VYcDRGa1dmVEM2ZjQvRDVRSFptV0U2RW5N?=
 =?utf-8?B?VkExSDZtYW5zUVVzeFhSZ0Q2VEdPd09SbUNTaHhJWHNnTTliT2FUT1NpK1o5?=
 =?utf-8?B?VTJ0b1BOSFZKN0lEYVR0cFA1bm4wZWFLcnZSb1N4YzFwUG5mL0lDRU9JUDNs?=
 =?utf-8?B?TldGMU9hb2tnSEhBQVFKbkVRTjE2Yzg0N3JOVk43ZGJTY3B0eWRNNTJtZU5Q?=
 =?utf-8?B?WS9GYkpEM1k0d2RacDg3ckpES09JNmtTQS9qQVhQdHZQVG1XQkNwVVBhcTU4?=
 =?utf-8?B?RkdMS1VPVEVpTUx5UXhXZERKb1pOM1VEV0RvMmthVld1alRzbXErQWowd3FU?=
 =?utf-8?B?dnJXRlB6SXY3N09mbmV2L3JKek9tUlF6YWdRS2NOR2JtOTQ4d3NwQ1RsNkJT?=
 =?utf-8?B?SnZVRnZCRUk0UGdrZ3RMWWswRklxV1JrM2lveVhsV3FBcW9kOWlsZDJtSTNt?=
 =?utf-8?B?Y1Jkc3kwbHJRZGtUTmpyNmZ3UzBOOE5xUEJJS29WWnFKNTdGVTVBVVVVMVNq?=
 =?utf-8?B?NVUvRDNkSlJaS2dFaTVzbndLN2tmSndVZEtaampXQVhsTElBUTd6ZTNxblZK?=
 =?utf-8?B?MTI4c2NuYzdDRkQxYlMzczJQU3pOc1Bka1IvQkk3aG5ROHNVUHkvQjdRakVt?=
 =?utf-8?B?eGg1MHRHV0JXeTZaR0xXMVVHc3dESWhZUTc4Z05jWER0NjdyemlNU1RCendU?=
 =?utf-8?B?RFJ0TDJ0WDd2TWg1bTZQSnlGTWUzdXFDQWxqVWpNRCtNaFZoTkNNWDdaRjl6?=
 =?utf-8?B?TWVkVzlnVjBXSHVnNm4yMkRvMG43cDJjcW9wb3YvMWpORDhoK0hTQUZtZVhq?=
 =?utf-8?B?aUxIN2FJS1crQUdDNGRzSDV1b2VHM2N5UmR1L3VOUG9ab0lXUDF6RXZzNHRD?=
 =?utf-8?B?NWtiMEVMKzZva0ltVXZxK3BNRGRWd0RDQnNCUTcrRHA0RE9mQlNueDBadTYx?=
 =?utf-8?B?eW9pL3hJWnlQODB0cWV3NHlneWVMcXQxVU0wbXE3V0JOdWhLZVFVM1I5d1FS?=
 =?utf-8?B?S1g4UEY5K2xtakxXQXZFTWV2L1Y0Q1VTZyt5cDc1V0pkcWVCc2thbjJQbndm?=
 =?utf-8?B?RGgvdC9hZkxBeVE2T0xJMHpVaUNuNGUyeDdyWm5HZUREVUVCTWo4c20zckN6?=
 =?utf-8?B?Ty9iVmpRUmpOYml0OFhJS1BFZWI0Z0p5WExhSTgzV25yVEhPRUtYNExMejB4?=
 =?utf-8?B?Yk03WWRJSU9NaDNzWDBDZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWJUelN6UjE5QS9WQmlSVm1YRE5iL3hJcnZaNHFhcnptTkdHa2lqNmwzS2tu?=
 =?utf-8?B?TElGTE9ZTTdYWU5XdjlzVEwxTDdkSzR6WDlWdXptOGxGMm94cFJsOFJKa1lW?=
 =?utf-8?B?V3ZqODQ3T1I4dUdkcXhNazJ0OXQ3SW0xaitUYWRRZllRYjdVWlV4M1ZSWVhq?=
 =?utf-8?B?a0MzcmZqNlZLSjJDZDlScGRPMG0zalFkb0FhNkhZKzJraktwd2JEOU81aUZT?=
 =?utf-8?B?cTdTU3JkR1lsSmpZS2ZYOWU2SVlPTFpZRmJLNHlsbW8za09TdnJnTUtXcXY4?=
 =?utf-8?B?OEw0TVNZYUU2c3Q1MFQyNCtYRnJvRUcrOGM4N0lJRHlpSU9EM1NnbE4wQURD?=
 =?utf-8?B?QVpLV1RMam5IWmdPSmxITk1FTFE2TGppQVFhNUhaQkRvL2dJbmc4YlhyTFlo?=
 =?utf-8?B?US9XU0pDWDAwNW50K1R0MTdGNE9JSlNRMnRtTlFrQjVGbnYrTW5SM3AzYzcx?=
 =?utf-8?B?SkZ5WnlpTUhEaUtmSFd5Yk1wR2gydFZOR2FJVkl2MzlmNzlXY3kvYXZLTkhJ?=
 =?utf-8?B?U3dYSUF1L3NNUVZIakRhQ0xVMEc2SjhjVnZJeTlRdmNuazRRN21YbUhhekxW?=
 =?utf-8?B?dktqS3ErTkYrUFRLTmcvRGo5eW43UnhrYkdybnF1czBFenAxSEdaRSs3REQ2?=
 =?utf-8?B?TTFUR2JKLzlDUG1ZbU4zZysyNnNhSWExOTFibjBwMEVZZWJNNFljT1FaWUpl?=
 =?utf-8?B?eUxFWTRKdFgyc3U5V0RsY08xKysweVhab1Y3a1JXWTE3VVVhL2hla0F5Vkda?=
 =?utf-8?B?L3VlaUZyUUdEVEE1b2RqTkxrekZsT1JTbGRzaHpYL3NKWnc0cGRUUmttejZD?=
 =?utf-8?B?ZG9NSU54Y3paRDE5RkE0QWNNOFFpWVV0YWxNRndiTzQrZU9pUGxxY0NyS001?=
 =?utf-8?B?dTNNc0U0aFB3SUZwVXRVU21rN2U2KzZmMjJobEtTdUpNZlRjOEJwN1dlUnlU?=
 =?utf-8?B?S1IxNGsvWEg3VHVyUEtuV1psY1VlRUpodWNvOUlBWHlmTzF5RHZidXB0NXFE?=
 =?utf-8?B?NUZnT1l4cThGaUdidDFpSG5wK0F2ZjgycDRIQnZORExIZ0ZsdGV2OG5QK2VQ?=
 =?utf-8?B?NGNIc3NZWFVpWVhVVk9Id3pLUks4Sk9ZNWtiT0hVYThoZThvRU9WazREcUl3?=
 =?utf-8?B?YjVRd1hvdysxT2VCMWU1ZDhWUjJyNmdVZ1g3N0dBRTJSd2dXcWFMQlhVOGRw?=
 =?utf-8?B?Sm1zZCtINERJVlN5UjZ4NGNBaG1BK3JvRFNod24ybXlhV05BUUEzdmQ4c1Jh?=
 =?utf-8?B?OGdnS1h0cW9ObmNlWUhOK2dtSHlNcWlqMWdZTVVpZU8wTXIraTN1SEJ1Y2JZ?=
 =?utf-8?B?V015UjkvYTBRZzllbnYrRjFGK3VqUmFIZCtIbUhETk5jUzFiUkhZMWp4ZjhK?=
 =?utf-8?B?Y2xtVXRQaDVBWTd2a3ZJN3dibDkzTU5xQTFURnNFWFdQTHJsc0lQWG9NMXZL?=
 =?utf-8?B?Z01Cc29KRUg1TXAyWE9hODBNaVQ5ZGVyZEJJU0RzbkdUeE8wano1ZmF6ZWNK?=
 =?utf-8?B?MFhmeEhmdm9kR28yeE15NCtRTjIxUU52R1hYeVBZNk9uUXNwQ1YvaVB3alBa?=
 =?utf-8?B?NFRuMC9IN3FrcUp2aElTZEMrNXhFc2RxYmhqMmE4d2Q3YkVzOFZBcjB4RXd3?=
 =?utf-8?B?UWR0SVVBVGlkRUx2dVFmTEQvZWlJNFNFQnlmcDNLU2M5RDBETDFQdDU4YS9O?=
 =?utf-8?B?UEY5UWFXTXNHUllmNmZxcytlait6dG9vR3NzNG1Hckd2UUYwUHVFQi9IWjVi?=
 =?utf-8?B?bnZuUE5qOS9EUkt5ZWowdklEamVHQ1hkUmt0alJJQ0hCbkl6dUlya2RjMlZv?=
 =?utf-8?B?YmE3ekdkOGloTEF2TU9ubU1LZVF6bW9JcmJjZ3hRSzBWQUdGMlg3TGlocTAr?=
 =?utf-8?B?NXhYVDRiQ2tUem93NmxKSDBsemh2SVQyN0Q2a09mTHhmQXNTZnpzRkVVY2pt?=
 =?utf-8?B?TjlsbmRvOEhndEd3YjEyeE9MRTBkdFpjVGlMK2dRVjRlVDBTQTdIUUxFVHhV?=
 =?utf-8?B?MFhBcFd3ZU1MVWpBMHlUTWduQVJ4VC9YaVdlVXNPU0lBcVFLUCtDNE8wUWZZ?=
 =?utf-8?B?akhFSHBtYVRQMWI5YTdxWURibHNCYjFiU2NpckF4VUZMV0Q0NlpseUxhNEhF?=
 =?utf-8?B?ZzdiMjZNbjIrNUxtMTFRNlFGOTJZSlozS21Bbm50aENURkVtcGkxVzlxMkJy?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 953c177c-9f56-45c1-de92-08dd150c5910
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:08:13.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbdbDV1wZkUYfUi1wYGjzHnNdpvIlqA0XJ+5c76mjrObVk6bqkAx5WdPft8K5eGdaddPFDCl2ym9btrXN/aeAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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

Hi Pranay,

On 02-12-2024 04:40 pm, Samala, Pranay wrote:
> Hi Swati,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
>> Sharma
>> Sent: Monday, December 2, 2024 2:21 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
>>
>> Split max_bpc constraint and add igt_info message.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_dsc.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c index
>> 9b48caf76..5508e7a9e 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -281,10 +281,14 @@ static void test_dsc(data_t *data, uint32_t test_type,
>> int bpc,
>>   		data->pipe = pipe;
>>
>>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>> -		    !check_gen11_dp_constraint(data->drm_fd, data->output,
>> data->pipe) ||
>> -		     igt_get_output_max_bpc(data->drm_fd, output->name) <
>> MIN_DSC_BPC)
>> +		    !check_gen11_dp_constraint(data->drm_fd, data->output,
>> +data->pipe))
>>   			continue;
>>
>> +		if (igt_get_output_max_bpc(data->drm_fd, output->name) <
>> MIN_DSC_BPC) {
>> +			igt_info("Output %s doesn't support min %d-bpc\n",
>> igt_output_name(data->output), MIN_DSC_BPC);
> line length is 119 columns, exceeding 100 columns.
This has been before, didn't make any change. May be we can have cleanup 
patch later.
>> +			continue;
>> +		}
>> +
>>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>>   		    (!is_dsc_output_format_supported(data->drm_fd, data-
>>> disp_ver,
>>   						     data->output, data-
>>> output_format)))
> Apart from this code looks good to me.
>
> Regards,
> Pranay Samala
>> --
>> 2.25.1
