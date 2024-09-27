Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D1ECEBF83
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 08:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152ED10EC53;
	Fri, 27 Sep 2024 08:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4ezal52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD0910E145
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727424925; x=1758960925;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VVwcodDxN1sM5mxgKhUtKhgd52jNs+uWmp8FpYXqjg0=;
 b=O4ezal52JGSmdCjPy8JCwKRHIB1hZ9pHvPx401QebxPHxHWNdKIahUUW
 R51NpBJqa86CC9KkZiC4+3rwJgJKwkRndpOP1U9BAMYcxn0Ht+ICiLfvJ
 +/+wN0JN7KetfBakPneZQsG3theArYwIkYLjXJZ7u8AUOBp0mQTNc4S7r
 WEZSwjL2mafH0mIdYd3yYA8ElJwamSD5CpYhKrYm6XmBWA2tj7wjR3X4E
 QmbDt/DXbFH1ocq2KBsiT4wvg3ZUXgBK6rXZXL16akFJ5Ath9TFbSTFNe
 RZTF7cU6aqM5WFZ53C+LUBYYrLrPSIBRN0ONCF1vBYqM/8FiW+/xY8UeN Q==;
X-CSE-ConnectionGUID: ocTYUdMoRnm9sb2XoO1d4Q==
X-CSE-MsgGUID: MGM/syAyS82IXObrhO6Ufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26433761"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26433761"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 01:15:24 -0700
X-CSE-ConnectionGUID: WOU0oU++SuegJaJDKslBkw==
X-CSE-MsgGUID: Ex4uXBNMS3mcgWYAVLY2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72634367"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 01:15:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 01:15:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 01:15:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 01:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JV0rrWqpKY720fsvXd3xI6bi89EPtmKxR1FDvV3K2X0XugyMzC6NNy0bu5wRnZU26gjcujywy5ymBFN3mABL0ro/KqR/DnPXFBV4xcgK+hmSy7uu0nJXtgww2z96CLrzeJpBY2jDmdnRId1OeZ7aJXDoOUaAQ5y7S0f/Ev0IGDWJr8zmM2Y/7j/gLYmmLlESXVWNNBLEeB2tl3qT/IreeRjOVG3fytpxUSYuTjXmFPnRLiwRA+YEpmGX13C47S26pn4N4UTZIEuG9lK29s3EEEfmFsH/CuNtOrn6XJQZE93C9j+pBZv/YLCQhKrnjxTXHQHZ20aGO81xQaoGdm5NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVwcodDxN1sM5mxgKhUtKhgd52jNs+uWmp8FpYXqjg0=;
 b=I3deM+gEVIN6xcAmJRntMZvO71E9PdoiHEJyE5oPPgdn4tQ8yGquYdtQWbzZiVCGv8hJ2mhFMKax4qa70zeHSgUcMDiiCUIfI1YhVtCJQoI1b0vL+YItvy/lxkjfuhb00LkR5LzZDTsBbej3smp5cpfYj8kvIRq5PrIFz3zSz6IdfONRATLHSNGt2KiJ1wJ0ETkrq8BZLvtKhhrFetOasSZDbOZBmJNQ5FAj4uG/XF2FJNuJq1XOLQ0mn2kGQi4mpMdprM/3DXPiY/YH+yRJOlLj6caZj9B2gtd0tXynlS8PTBh/lcnygH3gCbTz9G/m+67XYSibG9pc4aVX1BF1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 08:15:21 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 08:15:21 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Topic: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Index: AQHbEJqNSMwN/fvx2kqaWc9RnuvfKrJrJ/IAgAAhORA=
Date: Fri, 27 Sep 2024 08:15:20 +0000
Message-ID: <BL3PR11MB57479D1140F72EA8C881D097D06B2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240927051112.1801791-1-sai.gowtham.ch@intel.com>
 <MW3PR11MB4748740DACB001E747F82278AE6B2@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4748740DACB001E747F82278AE6B2@MW3PR11MB4748.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: 414b6eba-6921-4049-8e77-08dcdecc87a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U3FhWmE5WFZlWkpra1dBU084NVVFa2RVM0g2V3hyZ3BnUkN4aDlBMFhhVCtR?=
 =?utf-8?B?VEpudVlhRHhyMFBFWk5aS3lLUVBsYWZJVXltcXkwWmEwNWwzaDJEMlJnS2l3?=
 =?utf-8?B?TjE4YzdxUDJMZlplV2YzeFZncVp3VjJaZ1ZGYlpNYXhuYUlVcXhObTMremQ1?=
 =?utf-8?B?VkRWbytvN2lZYXkwMmV5UHJnRHdJTTZNTmxIbk1LYUphYk9ac1NjMld3NHRO?=
 =?utf-8?B?Yyswbi8xMEZJdlpZNllLMTZRbnBBYzVxb0U2T2g4c3FQTnlISk5sRUhyaGFJ?=
 =?utf-8?B?by8wZm9GNmhZTUNTV1BITUhxVVVWK3F4UXVqUTFWUU05T2FwUFIyM0E3Z2g0?=
 =?utf-8?B?QVJ1TmFnNzlxVGx4MzJTZk9CM0pSYS9BeEZjaUJXYkMyVCswQXZXWFFrZmc4?=
 =?utf-8?B?T3dlakx1ejgzdzltMVNuWEJSR3hZWUVtaUphM2dPR3pFRHgrNDU0ZW51SmZJ?=
 =?utf-8?B?RDg1TlFZQW1RQzBKNWhZVDB3eHVWUjZ1TGU4WjlMaEVFaTl5WDgyc2c3aW40?=
 =?utf-8?B?bmpJTlR4dDRxRzQzQXd1czFIbTlJOWl5NC9mcVA0UVN1aHBNTWtheEFpajc2?=
 =?utf-8?B?L3d5OTFPNlVXZ3Q0MXRYMkxxNWNGZ0JzRG93bndRQWZhS1h6YXg3TkExTE45?=
 =?utf-8?B?LzhOblcwd0JMNGVFbFlUWnhFZ21JaDRubHcvcmcxNmtGYmZKczdKbmdoNmhC?=
 =?utf-8?B?Rm8xU243YjdWLzk3ekxEZ0VKQmw5a0trMWZwTDg1c2gyR3djWHlPeHV0b2Yy?=
 =?utf-8?B?SnhKc2NIbVd4STZxWUJjZWNuVVl6VWE4M3F3d3FqZytmeXRiMFYyM0RFSnNK?=
 =?utf-8?B?V3lmSk5hSzZZRlFWUlQ3ZUJuV084bktOOHBLTnZIWFpTNWhYei85VFR1akho?=
 =?utf-8?B?amFsVkNYQ2dISmlMKzhTb0VvZW9oRTNkWkVNekd5VU9hUmNONFF6V1ltcXdH?=
 =?utf-8?B?WU1maVlTd21iSzVIUEROTjBqMWdmT1JEc3B3UUZscEdSTG9VbWJsdXZtK1p2?=
 =?utf-8?B?THArOU9iSWhpTjJaQk9BTjBRY05uQlBNc2JPUHEvVHhnNG9OTHpCOG1DZ3BD?=
 =?utf-8?B?ZjNVQ3dSbUtZeEJYRHQwaHczN1FkWnExVlF3KzZJUnJmUWZrUmZ6Y0RMYk5O?=
 =?utf-8?B?ZDFMZ3hPZXoyY3VZUHJ6a3RMaXZJYS9XdDdFV0xqUFpBZm81WWJycndNRHgv?=
 =?utf-8?B?Q1g2bzZ0bkhxNElCOFpId29DTU9HMklRaFZOOW93K3BLMjJzeDdoeXA5TW85?=
 =?utf-8?B?ckNRVkZLL3F5SlphaG53WG1wUTl1ZFJzVTBqcnE2eWpqdlRVVkQ1c2YrVXE0?=
 =?utf-8?B?N2YrbkN6RTJ1TzhJRnduVjVhZk40b0ozSUhnNC8zY25UNGxZVmQ1TE9kNTl0?=
 =?utf-8?B?YUU1bnJTVmM1bzRTeDZoNFRMdGtPSE1sVmFhdGF6QWxsTHRnbXpFamg5d2pr?=
 =?utf-8?B?b3Z1a1N0TjAvRkh4V2ZPMkZsOXphazE2czFyZlJKVURVZXVtT3hGeEQ2OVI0?=
 =?utf-8?B?UUV1bmtmWGFtckhXMlpiTkxoaUhGNml4b1JTRzlITmVKZ01Ga3ZZblprVTBS?=
 =?utf-8?B?TGpqNVVtS2ZFVTBqM2R4Nk4ycFJRTEdhWFY5dFYxVzhqc3d5a09LTUxuSEc0?=
 =?utf-8?B?bjBNdnk2aitJeHcvdUs1VmZoTzdJWVB4OVVRTlZjNHhzODVtM2dPeXZtNEZ1?=
 =?utf-8?B?NTc5THpPK1djVmI1Rmt6dWdtY04vUTRFaDQ4OEs5bkp1OTFRTVR1UVlOMW9I?=
 =?utf-8?B?MEhkNE1wWFg4VVNNVWZXeStwSWtlUlVtUFVOZC9valhkMTNpVU5IT05KUFND?=
 =?utf-8?B?Vy9wM2dZQmNsWjdqWXdsZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTlhSmRod3VKTHFuUXQ2NHA3YXlIMTZVUGxMaitCbmhjY2FuRVY5R3luMEl4?=
 =?utf-8?B?NTJJdHA4d3F2ckVkYXJaSGhCZzZ1dzF4WGNKdFBkbjN1cS8rSm80ZVVpRm5S?=
 =?utf-8?B?WTVmSEJTcSswZGYrNHRCQ2kvamY5cWFZdmN3QkhoMHdOMFVBL0Vwd3pTY0hC?=
 =?utf-8?B?NUptbVJTUE1QUXFPYUFKOFAzUm9jL2liT2c2RURaL0txaE5VNFpueEN6TUl2?=
 =?utf-8?B?bFZ2bk83REprTkZVWU1BWUVvQUNxWTRqbXlOb3JGNlpRRThTR1lja3czdkpt?=
 =?utf-8?B?eTVKQTJRZkhpcXZJZVNKQVlHWmNGS2xQcEtWT1EwNnh4a0JDcG10cGx5dXhJ?=
 =?utf-8?B?S21PSEdnOXJ6QVpFUXA5UExBM1FsU21FVSt6NG5zSzlZRWo3Q2VuRzFNc1NW?=
 =?utf-8?B?MzVrSFVGWncwWkE5d2dqc1pzbmg3VHI5N0pDaGJ4emt2YnRkMGdEa3huTm5q?=
 =?utf-8?B?ZElSbm0rbno5VE1oY1NNa2d1ZlhLenh3ZnJmd0x5d3lIeXZ3S0RRWm5FZmRz?=
 =?utf-8?B?V2dUTHc0ZlAzcnhRS0p2YWJBTFRkdW5ldjN3OWRRZlZYbFNWc3RFNnJVUUtj?=
 =?utf-8?B?U0ppYnNCZ01Za3hQcW85NHFaUmFDVEhCVXZjVnNhdXRCUWJya0hXNnc0MWgx?=
 =?utf-8?B?WDNrZGx4V2swdkVhVzQ2MDBLME44bWMxUVp6U0ZCZ21OZmhZN1NWS0p0QTZy?=
 =?utf-8?B?Q252RGhveDJyY0Z2UytoVVpaUzJBYmIzUnFSczNxV0NlaEcwS2RveHhGSTZX?=
 =?utf-8?B?R1R0bFI3em0rQ3QrQjFxbzNFSDc3ZlpubEZCVXNHaFl5RmIrSjRPODFyZzV1?=
 =?utf-8?B?QnAwRG12bENsdlUvZmtEY0tRVDFub1JPcjVrR0pjSmVxdTJKbmVSeVNvQ3cw?=
 =?utf-8?B?ZExBTjVPUEVISlRiVlBBallsRnlPOXZJM09DZVpVdW5SeThRRnJHR3BFNDVU?=
 =?utf-8?B?NWdLTjFHenBxM1VDbmt6MklNK3B6enFpQVN5YkJpMDhKZ3BsOFlvdlRDaFFi?=
 =?utf-8?B?azU2UEpYYlVxN2tVV285ekl0VUdjYXRVbzhNeGZUUkl2UDZsWXdGajJ0cWJU?=
 =?utf-8?B?aEdoRm9pS0hPdFN4andUOVp1QVlBYldvQVhwcjVNb0N4L3J4YmY0N0d6UENN?=
 =?utf-8?B?OXNlYm9YaStQdTE0WFAxZkZCd1ZUTHNTc1YzUE5Yak5CZ2htbVpIeUVqck1M?=
 =?utf-8?B?OVNqQW5rclpURHhoZVpVSm1kWWlvNnBkbWt5NGxNVmZvZzFlQjJvbEcxNlVZ?=
 =?utf-8?B?YjRxaHZFS2JvamMzRkRSNE9qSzc2cFVGUjJ1Nmx1T3kxQkNsYVpmQWw4N1oz?=
 =?utf-8?B?ZDFISWIxYmpiNEFlUEdXbmJOOG15MXZEMW5SdWxjWkpsQjh4UEIyK25KQkFO?=
 =?utf-8?B?MXdNc3ZXV0F1UGhDa1hkYjE5MVhycnZ1b29qWUhwc0ZQcUJFRGw2OFdpeHRZ?=
 =?utf-8?B?cG1jSUhWYWFHYmJQc2R6d2VaS1hObkpJVWVWL1JSWDBHck5EbFBZRk9uMkpV?=
 =?utf-8?B?RUZJa0J6VkxmVFBqaVpLeDk2NmJrRi9hWDRmQ0FIZDNQNENoTHBsaVpWSFN2?=
 =?utf-8?B?cnRKMVdyaGpmYVV4ZjVBREovS0w5c1hlc1h6Mm1SeWE5Ry92TWZhd2tiamhJ?=
 =?utf-8?B?T0hpK2NUaXljZThNck15amw0WGU0eGgvQ3N3bk1HRlJtVSs5VE4xVjFsTUQv?=
 =?utf-8?B?c2JmR3JqUCtuZWZwVjB0TDFrVERZM1c4L1M5ZDZxa0FxSkc3eS9kV05OZ2dR?=
 =?utf-8?B?ZjN4bVBuVnZpL1BTQU8wS3VCTFkyODVuTDBscng4bnNJSzBBRFE2b3RRcHcy?=
 =?utf-8?B?SzhZT0ZJMHRmSnY3SmdsbU1BQnphZGdhUWtmRVk2ZXE1K3kxVEYwTHAvcG9y?=
 =?utf-8?B?UFBYK001NE9vQkpZMjJtS2ZDejBaK2sxVndzdjJaQUxpblF1VkFvWFpyQjJZ?=
 =?utf-8?B?bzRkL3VBdmVNL2ZxUzBtcm1FVzNpK2ZVcmdTSlZqWnZ1RUhrZmJENmtpbEdJ?=
 =?utf-8?B?RlBJZ1lYQmcwZUM2SkZFVVRBc3BnUVlKMWtGOFdIUmF6Tm5hYTZST1dZemkw?=
 =?utf-8?B?WFpHNWk3aTI3NjM4L3B4TmRpNy9GRjVXVUxibjRxRUJZQVJzbjEyS1RSZHM0?=
 =?utf-8?Q?/YEGUe4spwFQ1TI9BUlTLlEPS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414b6eba-6921-4049-8e77-08dcdecc87a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 08:15:20.9845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbIJUpNGSQMy2Al+rNA058w9fbY4pwTbSG5QK4Zg60ObvXukmJYSZY46GKN3h9kPEkjVtimkkipCPzQVJFLNVGR8cFi6YHOAkvlg3MZbhIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEt1bWFyLCBKYW5nYSBSYWh1
bCA8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgU2VwdGVtYmVy
IDI3LCAyMDI0IDExOjQ1IEFNDQo+VG86IENoLCBTYWkgR293dGhhbSA8c2FpLmdvd3RoYW0uY2hA
aW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+Q2gsIFNhaSBHb3d0
aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+U3ViamVjdDogUkU6IFtQQVRDSF0gdGVz
dHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uOiBBZGQgdGVzdCB0byB2YWxpZGF0
ZQ0KPnRpbWVzbGljZSBkdXJhdGlvbg0KPg0KPg0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZg0KPj4gc2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tDQo+PiBTZW50
OiBGcmlkYXksIFNlcHRlbWJlciAyNywgMjAyNCAxMDo0MSBBTQ0KPj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBDaCwgU2FpIEdvd3RoYW0NCj4+IDxzYWkuZ293dGhhbS5jaEBp
bnRlbC5jb20+DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVz
bGljZV9kdXJhdGlvbjogQWRkIHRlc3QgdG8NCj4+IHZhbGlkYXRlIHRpbWVzbGljZSBkdXJhdGlv
bg0KPj4NCj4+IEZyb206IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+
DQo+Pg0KPj4gVGVzdCBjaGVja3MgaWYgdGhlIGV4ZWN1dGlvbiB0aW1lIG9mIGEgY3R4IGlzIHdp
dGhpbiB0aGUgZ2l2ZW4gdGltc2xpY2UgZHVyYXRpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
U2FpIEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIHRl
c3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jIHwgMTk0ICsrKysrKysrKysr
KysrKysrKysrKysNCj4+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxOTUgaW5zZXJ0aW9ucygrKQ0KPj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24u
Yw0KPj4NCj4+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVy
YXRpb24uYw0KPj4gYi90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMC4uMWE1ZGJmZTNjDQo+
PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2Vf
ZHVyYXRpb24uYw0KPj4gQEAgLTAsMCArMSwxOTQgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTUlUDQo+PiArLyoNCj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jw
b3JhdGlvbiAgKi8NCj4+ICsNCj4+ICsvKioNCj4+ICsgKiBURVNUOiBzeXNmcyB0aW1lc2xpY2Ug
ZHVyYXRpb24NCj4+ICsgKiBDYXRlZ29yeTogQ29yZQ0KPj4gKyAqIE1lZ2EgZmVhdHVyZTogU3lz
TWFuDQo+PiArICogU3ViLWNhdGVnb3J5OiBTeXNNYW4gdGVzdHMNCj4+ICsgKiBGdW5jdGlvbmFs
aXR5OiBzeXNmcyB0aW1zbGljZSBkdXJhdGlvbg0KPj4gKyAqIEZlYXR1cmU6IFNNSSwgY29udGV4
dA0KPj4gKyAqIFRlc3QgY2F0ZWdvcnk6IFN5c01hbg0KPj4gKyAqDQo+PiArICogU1VCVEVTVDog
dGltZXNsaWNlX2R1cmF0aW9uX3VzLXRpbWVvdXQNCj4+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCB0
byBjaGVjayBpZiB0aGUgZXhlY3V0aW9uIHRpbWUgb2YgYSBjdHggaXMNCj4+ICsgKiAJCXdpdGhp
biB0aGUgZ2l2ZW4gdGltc2xpY2UgZHVyYXRpb24uDQo+PiArICogVGVzdCBjYXRlZ29yeTogZnVu
Y3Rpb25hbGl0eSB0ZXN0DQo+PiArICoNCj4+ICsgKi8NCj4+ICsjaW5jbHVkZSA8ZmNudGwuaD4N
Cj4+ICsNCj4+ICsjaW5jbHVkZSAiaWd0LmgiDQo+PiArI2luY2x1ZGUgImlndF9zeW5jb2JqLmgi
DQo+PiArI2luY2x1ZGUgImlndF9zeXNmcy5oIg0KPj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5o
Ig0KPj4gKyNpbmNsdWRlICJ4ZS94ZV9zcGluLmgiDQo+PiArDQo+PiArI2RlZmluZSBBVFRSICJ0
aW1lc2xpY2VfZHVyYXRpb25fdXMiDQo+PiArDQo+PiArc3RhdGljIHZvaWQgc2V0X3RpbWVzbGlj
ZV9kdXJhdGlvbihpbnQgZW5naW5lLCB1bnNpZ25lZCBpbnQgdmFsdWUpIHsNCj4+ICsJdW5zaWdu
ZWQgaW50IGRlbGF5Ow0KPj4gKw0KPj4gKwlpZ3RfYXNzZXJ0X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJp
bnRmKGVuZ2luZSwgQVRUUiwgIiV1IiwgdmFsdWUpKTsNCj4+ICsJaWd0X3N5c2ZzX3NjYW5mKGVu
Z2luZSwgQVRUUiwgIiV1IiwgJmRlbGF5KTsNCj4+ICsJaWd0X2Fzc2VydF9lcShkZWxheSwgdmFs
dWUpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdWludDY0X3QgX190ZXN0X3RpbWVvdXQoaW50
IGZkLCBpbnQgZW5naW5lLCB1bnNpZ25lZCBpbnQNCj4+ICt0aW1lb3V0LCB1aW50MTZfdCBndCwg
aW50IGNsYXNzKSB7DQo+PiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0gew0KPj4gKwkJLmhh
bmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKSwNCj4+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNf
VFlQRV9TWU5DT0JKLA0KPj4gKwkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+
PiArCX07DQo+PiArDQo+PiArCXN0cnVjdCBkcm1feGVfZXhlYyBleGVjID0gew0KPj4gKwkJLm51
bV9iYXRjaF9idWZmZXIgPSAxLA0KPj4gKwkJLm51bV9zeW5jcyA9IDEsDQo+PiArCQkuc3luY3Mg
PSB0b191c2VyX3BvaW50ZXIoJnN5bmMpLA0KPj4gKwl9Ow0KPj4gKy8qIGhpZ2ggcHJpb3JpdHkg
cHJvcGVydHkgKi8NCj4+ICsJc3RydWN0IGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IGV4dCA9IHsN
Cj4+ICsJCS5iYXNlLm5leHRfZXh0ZW5zaW9uID0gMCwNCj4+ICsJCS5iYXNlLm5hbWUgPQ0KPj4g
RFJNX1hFX0VYRUNfUVVFVUVfRVhURU5TSU9OX1NFVF9QUk9QRVJUWSwNCj4+ICsJCS5wcm9wZXJ0
eSA9IERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9QUklPUklUWSwNCj4+ICsJCS52YWx1
ZSA9IDIsIC8qIEhpZ2ggcHJpb3JpdHkgKi8NCj4+ICsJfTsNCj5UbyBDaGVjayBzY2hlZHVsZXIg
Y29uZmlndXJhdGlvbiByZWxhdGVkIHRvIHRpbWVzbGljZS4gV2UgbmVlZCB0byBzdWJtaXQgdHdv
IGpvYnMNCj53aXRoIHNhbWUgcHJpb3JpdHkgYW5kIHNjaGVkdWxlciB3aWxsIHByZS1lbXB0IGN1
cnJlbnQgam9iIG9uY2UgdGltZXNsaWNlIGV4cGlyZXMuDQo+DQpNYWtlIHNlbnNlIHRvIG1lLCBX
aWxsIGZpeCB0aGF0IGFuZCBzZW5kIHBhdGNoIGZvciByZXZpZXcuIA0KDQpUaGFua3MsDQpHb3d0
aGFtDQo+VGhhbmtzLA0KPlJhaHVsDQo+PiArCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICpod2UgPSBOVUxMLCAqX2h3ZTsNCj4+ICsJdWludDMyX3QgZXhlY19xdWV1ZXNbMl07
DQo+PiArCXVpbnQzMl90IHZtWzJdOw0KPj4gKwl1aW50MzJfdCBib1syXTsNCj4+ICsJc2l6ZV90
IGJvX3NpemU7DQo+PiArCXN0cnVjdCB4ZV9zcGluICpzcGluWzJdOw0KPj4gKwlzdHJ1Y3QgdGlt
ZXNwZWMgdHMgPSB7fTsNCj4+ICsJdWludDY0X3QgZWxhcHNlZDsNCj4+ICsJdWludDY0X3QgYWRk
cjEgPSAweDFhMDAwMCwgYWRkcjIgPSAweDEwMDAwMDsNCj4+ICsNCj4+ICsJeGVfZm9yX2VhY2hf
ZW5naW5lKGZkLCBfaHdlKQ0KPj4gKwkJaWYgKF9od2UtPmVuZ2luZV9jbGFzcyA9PSBjbGFzcyAm
JiBfaHdlLT5ndF9pZCA9PSBndCkNCj4+ICsJCQlod2UgPSBfaHdlOw0KPj4gKwlpZiAoIWh3ZSkN
Cj4+ICsJCXJldHVybiAtMTsNCj4+ICsNCj4+ICsJLyogc2V0IHRpbWVzbGljZSBkdXJhdGlvbiov
DQo+PiArCXNldF90aW1lc2xpY2VfZHVyYXRpb24oZW5naW5lLCB0aW1lb3V0KTsNCj4+ICsJdm1b
MF0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPj4gKwl2bVsxXSA9IHhlX3ZtX2NyZWF0ZShm
ZCwgMCwgMCk7DQo+PiArCWV4ZWNfcXVldWVzWzBdID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQs
IHZtWzBdLCBod2UsIDApOw0KPj4gKwlleGVjX3F1ZXVlc1sxXSA9IHhlX2V4ZWNfcXVldWVfY3Jl
YXRlKGZkLCB2bVsxXSwgaHdlLA0KPj4gdG9fdXNlcl9wb2ludGVyKCZleHQpKTsNCj4+ICsJYm9f
c2l6ZSA9IHhlX2JiX3NpemUoZmQsIHNpemVvZigqc3BpbikpOw0KPj4gKwlib1swXSA9IHhlX2Jv
X2NyZWF0ZShmZCwgdm1bMF0sIGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsIDApLCAwKTsN
Cj4+ICsJc3BpblswXSA9IHhlX2JvX21hcChmZCwgYm9bMF0sIGJvX3NpemUpOw0KPj4gKwl4ZV92
bV9iaW5kX2FzeW5jKGZkLCB2bVswXSwgMCwgYm9bMF0sIDAsIGFkZHIxLCBib19zaXplLCAmc3lu
YywgMSk7DQo+PiArCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMF0sIC5hZGRyID0gYWRkcjEsIC5w
cmVlbXB0ID0gZmFsc2UpOw0KPj4gKwlleGVjLmFkZHJlc3MgPSBhZGRyMTsNCj4+ICsJZXhlYy5l
eGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZXNbMF07DQo+PiArCXhlX2V4ZWMoZmQsICZleGVjKTsN
Cj4+ICsJeGVfc3Bpbl93YWl0X3N0YXJ0ZWQoc3BpblswXSk7DQo+PiArDQo+PiArCWJvWzFdID0g
eGVfYm9fY3JlYXRlKGZkLCB2bVsxXSwgYm9fc2l6ZSwgdnJhbV9pZl9wb3NzaWJsZShmZCwgMCks
IDApOw0KPj4gKwlzcGluWzFdID0geGVfYm9fbWFwKGZkLCBib1sxXSwgYm9fc2l6ZSk7DQo+PiAr
CXhlX3ZtX2JpbmRfc3luYyhmZCwgdm1bMV0sIGJvWzFdLCAwLCBhZGRyMiwgYm9fc2l6ZSk7DQo+
PiArCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMV0sIC5hZGRyID0gYWRkcjIpOw0KPj4gKwlleGVj
LmFkZHJlc3MgPSBhZGRyMjsNCj4+ICsJZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZXNb
MV07DQo+PiArCWlndF9uc2VjX2VsYXBzZWQoJnRzKTsNCj4+ICsJeGVfZXhlYyhmZCwgJmV4ZWMp
Ow0KPj4gKwl4ZV9zcGluX3dhaXRfc3RhcnRlZChzcGluWzFdKTsNCj4+ICsJZWxhcHNlZCA9IGln
dF9uc2VjX2VsYXBzZWQoJnRzKTsNCj4+ICsJeGVfc3Bpbl9lbmQoc3BpblsxXSk7DQo+PiArDQo+
PiArCXhlX3ZtX3VuYmluZF9hc3luYyhmZCwgdm1bMF0sIDAsIDAsIGFkZHIxLCBib19zaXplLCAm
c3luYywgMSk7DQo+PiArCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luYy5oYW5kbGUs
IDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPj4gKw0KPj4gKwl4ZV9zcGluX2VuZChzcGluWzBd
KTsNCj4+ICsJeGVfdm1fdW5iaW5kX3N5bmMoZmQsIHZtWzFdLCAwLCBhZGRyMiwgYm9fc2l6ZSk7
DQo+PiArCXN5bmNvYmpfZGVzdHJveShmZCwgc3luYy5oYW5kbGUpOw0KPj4gKw0KPj4gKwl4ZV9l
eGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzWzBdKTsNCj4+ICsJeGVfdm1fZGVzdHJv
eShmZCwgdm1bMF0pOw0KPj4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVz
WzFdKTsNCj4+ICsJeGVfdm1fZGVzdHJveShmZCwgdm1bMV0pOw0KPj4gKw0KPj4gKwlyZXR1cm4g
ZWxhcHNlZDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgdGVzdF90aW1lb3V0KGludCBm
ZCwgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LA0KPj4gK3VpbnQxNl90IGNsYXNz
LCBpbnQgZ3QpIHsNCj4+ICsJdWludDY0X3QgZGVsYXlzW10gPSB7IDEwMDAsIDUwMDAwLCAxMDAw
MDAsIDUwMDAwMCB9Ow0KPj4gKwl1bnNpZ25lZCBpbnQgc2F2ZWQ7DQo+PiArCXVpbnQ2NF90IGVs
YXBzZWQ7DQo+PiArCXVpbnQ2NF90IGVwc2lsb247DQo+PiArDQo+PiArCWlndF9yZXF1aXJlKGln
dF9zeXNmc19wcmludGYoZW5naW5lLCAicHJlZW1wdF90aW1lb3V0X3VzIiwgIiV1IiwgMSkNCj4+
ICs9PQ0KPj4gMSk7DQo+PiArCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgcHJv
cGVydHlbMF0sICIldSIsICZzYXZlZCkgPT0gMSk7DQo+PiArCWlndF9kZWJ1ZygiSW5pdGlhbCAl
czoldVxuIiwgcHJvcGVydHlbMF0sIHNhdmVkKTsNCj4+ICsNCj4+ICsJZWxhcHNlZCA9IF9fdGVz
dF90aW1lb3V0KGZkLCBlbmdpbmUsIDEwMDAsIGd0LCBjbGFzcyk7DQo+PiArCWVwc2lsb24gPSAy
ICogZWxhcHNlZCAvIDEwMDA7DQo+PiArCWlmIChlcHNpbG9uIDwgNTAwMDApDQo+PiArCQllcHNp
bG9uID0gNTAwMDA7DQo+PiArCWlndF9pbmZvKCJNaW5pbXVtIHRpbWVvdXQgbWVhc3VyZWQgYXMg
JS4zZnVzOyBzZXR0aW5nIGVycm9yDQo+PiArdGhyZXNob2xkDQo+PiB0byAlIiBQUklkNjQgInVz
XG4iLA0KPj4gKw0KPj4gCWVsYXBzZWQgKiAxZS0zLCBlcHNpbG9uKTsNCj4+ICsJaWd0X3JlcXVp
cmUoZXBzaWxvbiA8IDEwMDAwMDAwKTsNCj4+ICsNCj4+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGRlbGF5cyk7IGkrKykgew0KPj4gKwkJZWxhcHNlZCA9IF9fdGVzdF90aW1lb3V0
KGZkLCBlbmdpbmUsIGRlbGF5c1tpXSwgZ3QsIGNsYXNzKTsNCj4+ICsJCWlndF9pbmZvKCIlczol
bGQsIGVsYXBzZWQ9JS4zZnVzXG4iLA0KPj4gKwkJCQlwcm9wZXJ0eVswXSwgZGVsYXlzW2ldLCBl
bGFwc2VkICogMWUtMyk7DQo+PiArCQlpZ3RfYXNzZXJ0X2YoZWxhcHNlZCAvIDEwMDAgIDwgZGVs
YXlzW2ldICsgZXBzaWxvbiwNCj4+ICsJCQkJIlRpbWVzbGljZSBleGNlZWRlZCByZXF1ZXN0ISFc
biIpOw0KPj4gKwl9DQo+PiArDQo+PiArCXNldF90aW1lc2xpY2VfZHVyYXRpb24oZW5naW5lLCBz
YXZlZCk7IH0NCj4+ICsNCj4+ICtpZ3RfbWFpbg0KPj4gK3sNCj4+ICsJc3RhdGljIGNvbnN0IHN0
cnVjdCB7DQo+PiArCQljb25zdCBjaGFyICpuYW1lOw0KPj4gKwkJdm9pZCAoKmZuKShpbnQsIGlu
dCwgY29uc3QgY2hhciAqKiwgdWludDE2X3QsIGludCk7DQo+PiArCX0gdGVzdHNbXSA9IHsNCj4+
ICsJCXsgInRpbWVvdXQiLCB0ZXN0X3RpbWVvdXQgfSwNCj4+ICsJCXsgfQ0KPj4gKwl9Ow0KPj4g
Kwljb25zdCBjaGFyICpwcm9wZXJ0eVtdWzNdID0geyB7InRpbWVzbGljZV9kdXJhdGlvbl91cyIs
DQo+PiArCQkJCSAgICAgICAidGltZXNsaWNlX2R1cmF0aW9uX21pbiIsDQo+PiArCQkJCSAgICAg
ICAidGltZXNsaWNlX2R1cmF0aW9uX21heCJ9LCB9Ow0KPj4gKwlpbnQgY291bnQgPSBzaXplb2Yo
cHJvcGVydHkpIC8gc2l6ZW9mKHByb3BlcnR5WzBdKTsNCj4+ICsJaW50IGZkID0gLTEsIHN5c19m
ZCwgZ3Q7DQo+PiArCWludCBlbmdpbmVzX2ZkID0gLTEsIGd0X2ZkID0gLTE7DQo+PiArDQo+PiAr
CWlndF9maXh0dXJlIHsNCj4+ICsJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+
PiArDQo+PiArCQlzeXNfZmQgPSBpZ3Rfc3lzZnNfb3BlbihmZCk7DQo+PiArCQlpZ3RfcmVxdWly
ZShzeXNfZmQgIT0gLTEpOw0KPj4gKwkJY2xvc2Uoc3lzX2ZkKTsNCj4+ICsJfQ0KPj4gKw0KPj4g
Kwlmb3IgKGludCBpID0gMDsgaSA8IGNvdW50OyBpKyspIHsNCj4+ICsJCWZvciAodHlwZW9mKCp0
ZXN0cykgKnQgPSB0ZXN0czsgdC0+bmFtZTsgdCsrKSB7DQo+PiArCQkJaWd0X3N1YnRlc3Rfd2l0
aF9keW5hbWljX2YoIiVzLSVzIiwgcHJvcGVydHlbaV1bMF0sIHQtDQo+PiA+bmFtZSkgew0KPj4g
KwkJCQl4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpIHsNCj4+ICsJCQkJCWd0X2ZkID0geGVfc3lzZnNf
Z3Rfb3BlbihmZCwgZ3QpOw0KPj4gKwkJCQkJaWd0X3JlcXVpcmUoZ3RfZmQgIT0gLTEpOw0KPj4g
KwkJCQkJZW5naW5lc19mZCA9IG9wZW5hdChndF9mZCwgImVuZ2luZXMiLA0KPj4gT19SRE9OTFkp
Ow0KPj4gKwkJCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZCAhPSAtMSk7DQo+PiArCQkJCQlpZ3Rf
c3lzZnNfZW5naW5lcyhmZCwgZW5naW5lc19mZCwgZ3QsIDEsDQo+PiBwcm9wZXJ0eVtpXSwNCj4+
ICsNCj4+IAkgdC0+Zm4pOw0KPj4gKwkJCQkJY2xvc2UoZW5naW5lc19mZCk7DQo+PiArCQkJCQlj
bG9zZShndF9mZCk7DQo+PiArCQkJCX0NCj4+ICsJCQl9DQo+PiArCQl9DQo+PiArCX0NCj4+ICsJ
aWd0X2ZpeHR1cmUgew0KPj4gKwkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+PiArCX0NCj4+ICt9
DQo+PiArDQo+PiArDQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9t
ZXNvbi5idWlsZCBpbmRleA0KPj4gZTVkODg1MmYzLi42MmJkZTM1M2INCj4+IDEwMDY0NA0KPj4g
LS0tIGEvdGVzdHMvbWVzb24uYnVpbGQNCj4+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+PiBA
QCAtMzE2LDYgKzMxNiw3IEBAIGludGVsX3hlX3Byb2dzID0gWw0KPj4gIAkneGVfc3lzZnNfZGVm
YXVsdHMnLA0KPj4gIAkneGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0JywNCj4+ICAJJ3hlX3N5c2Zz
X3NjaGVkdWxlcicsDQo+PiArICAgICAgICAneGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uJywN
Cj4+ICBdDQo+Pg0KPj4gIGludGVsX3hlX2V1ZGVidWdfcHJvZ3MgPSBbDQo+PiAtLQ0KPj4gMi4y
NS4xDQoNCg==
