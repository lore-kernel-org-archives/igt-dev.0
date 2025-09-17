Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF15FCAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 08:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2C10E43C;
	Wed, 17 Sep 2025 08:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qf5Slj/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407A10E437
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758096555; x=1789632555;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KVGP8SG+O3ZjI5I64Kq2cfYr8x26eUqlBaEyeknXhH0=;
 b=Qf5Slj/dkAHWwZ93ZJRBgGDsyHxxOF2VhSoGoaRDEJ3g69TP/hMv4nKe
 dhhDmRFysnO/Gz8hj+l4qIPhtZ9LNNKkk3En2xem4VtjuLoJxnuTK/MUw
 VbkI8hxnt4JXlMZu55zRGPZC9xCaHU3+QmkYjZy/7AjqAlrNWSvTLF5u/
 G1M4Ka2b6N3sEX3HdOVWTJ1CX1agOOn05j3gk+BrVUA5QmZKV+U6rw/Gt
 hKLqnFFm7m+BpPXCFWUc53Di6Ao5R21vTUQuxdi11/+i+vwZMquE0ukht
 iZwqyrsb87TBNFAqtnSJxzEVWbTSV3lZEtLUArD1QyrRMIMQrN9W1f4DR A==;
X-CSE-ConnectionGUID: jVNYrOvQSPeb3rYO0x7oZw==
X-CSE-MsgGUID: 3Vv48gwHSayRdS2EYYcKiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60538636"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="60538636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:09:14 -0700
X-CSE-ConnectionGUID: Yr+sc1SwQBi8bE7Nfk7gjg==
X-CSE-MsgGUID: dSD1J7rVSgKyKBPjeH41RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174285090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:09:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 01:09:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 01:09:13 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 01:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuQjfgxhVVo+XXjaaayDgIfFcRBMsO6E1Zx+HEM3wVk7n7vWTpoHULaTlGICusxTTkB9s9imNC/0EzQ4lJI+nGdIMU0TCcA9a6SrzGt2QYK+PUHO3Tuvh0+cuF4DgtmJAK35FXvNrjlve73XioJi+5PdveT4Bjcs15w53mB9DmCwGWVfpfq2UkwaWQ/m9l6KyRww2MYO9qhwiU2hVAT6RGJQUL6KADrbZb9ksjF8Swt7h6q0DD06ROa5bEieD5bed8/j28UCV/ohnZX6bI6cm9kSunWrvgCeFB6W7oMKyeRco3Rm01Fw+RAURREaNXDLmhynbPz7uIaQVl69e5dXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tlu9esorxu3HJj04VDswtpgPdKlVp/TRfFs6z5wmMKs=;
 b=EppfO5/PFivr/YYa1IgdvZ2n92h59HLEveh7b8voe3JGaYRRn5IcbRcifpujAH5+blPFtqn0Jq8B2m7OtUELqzuRHibpHokhjJXv79fZhJJigZl2L+StFGvkdIvV1X4vvmapjgEnh8zc+9myRHNuoamag+rUa3T0SWckVwpFfbFOg+q3b90UlXICeHxT4sFxFaz53ZsmpGzRWKSvciWVrvOXmxzZMGAAABkCBwdI1v14L4UqQFLzpHM0h/CKukBdUprAdKKOJIBtzJ6xC5xuotSQYaATHJ/HTdB3kHQIw8e+rzloHuQd/7HApCevXRkmoTAOLHBElePJbGh7MZevAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB8543.namprd11.prod.outlook.com (2603:10b6:806:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 08:08:11 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 08:08:11 +0000
Message-ID: <6cf1828e-7d44-4ce6-aabd-dc986c26504d@intel.com>
Date: Wed, 17 Sep 2025 13:38:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: reduce exec. time for sim
 env
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250904034312.1264838-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250904034312.1264838-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb1745b-da8b-4a9a-090c-08ddf5c15808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTBoWDZld0VSTkJaL1BnWEMxUE0yZWdtbHU2eXUydDU4ZWdDZEpSbWt5OUx6?=
 =?utf-8?B?WnYvR25jYjBSWWVNOUNsL0MrT0dIM250NCtiMG16UkhnV0ZHQzI0VDdVdDZG?=
 =?utf-8?B?ZFpoaldFalJpcHBydkJwcjFyN0ZubzVndXpVNWlOOUdkSlY3bXByd2VkWGZ2?=
 =?utf-8?B?QmlmK0JMNk9zZXFJdW91T01GRElhbm84OFVESmZKNjVodWZGNCt0YmFrcmZx?=
 =?utf-8?B?aXIzNmQxZXhCWjNUMXVTdG9hM2RRd1gvM3NNME0wMVovK3N3cXJwOThoSlUv?=
 =?utf-8?B?T0ZaM21xTy9DZmV2WjRqVVQybU93TlJodGVFWFcvbWFUTTB1S2o1b0w0TU45?=
 =?utf-8?B?VHFIYlZmR3F2YXc5em1VK0ozOEZUNkNBNkgyK2JjMUhueksrUU0xSU4wTzBO?=
 =?utf-8?B?WjIzRVUxcnpQRW9FaVNyNXVJdUc0ay83eGZwSlYyb2xranVyd1E4dUFEYmdm?=
 =?utf-8?B?TXdsc24xb3VNV2hhU2ltZG9lUC9PQkJ6NU44QUtpWmpldTNLdFM2UkNwanY4?=
 =?utf-8?B?S2N2N1poQlRSYm1SQTl5cGptcEk2eUtjelFURmYzcDJBdGprYkg4UWlueHNK?=
 =?utf-8?B?Vi9rQ3NEV2Q4bHB5KzZHdWx3VEczOW0vYVhIbjd6ZG5GbUtIMUFYTW1TK1FJ?=
 =?utf-8?B?WmFFSnJDQWFGSTlRMFU5QkJ0cFBod05QeVBVSDd6ZWwvSEtUYTIwK2s1MnYz?=
 =?utf-8?B?bEl0QTVteVdBRWpoRFlqT2tncXdMT2YremZaREIzaFoxNy9qNnlMMGl3blc2?=
 =?utf-8?B?ZWVKWDlUVysvU2RuVDh0aGZ5dk9oNmEzQ0FZR2I2cVMrblU3RzVyYnZhL0c1?=
 =?utf-8?B?bjFwSnIzSXo0TWYvN044U2ZyQnMwUHE3WjZyWGhHRzAyVW1WdnJuOTBqYXNW?=
 =?utf-8?B?Z2JKcEYyYjBXWnVEUStFREJ2LzNOQm9ubU9aTDIveUpnU0R6OGFJMDNXaVZy?=
 =?utf-8?B?c0RTZTNtRUJMS09wdXhwZ08rSXVBVU8vVTdDeW1aQVE3eVd4QkJicjgrYUNr?=
 =?utf-8?B?dzM4U2d0K0NqVThaelFPVEE2NkdaeC9BSUhKc3B0c2VyUWYzcDZ2WDRHbW04?=
 =?utf-8?B?NzgwenRZeWlmWFEyTXBWbGwwZGhvRWY5UjBNNUtUVEsyRTVIc3Y0T2ZjQTdF?=
 =?utf-8?B?aUZFK25YZHdsczk4TW02SzVEVVBsUHFkWk96SzRtOEsvVXV2RmJmV0FLdnF5?=
 =?utf-8?B?LzFKTGVnV21OZWR6Q0xCV3I3ZEJ0M2pRU0gyOFFZaDZWSzJOTlNqaGZ0bVFW?=
 =?utf-8?B?WUNQSTRkYTRkZ2lLS2ZhNVNUUStiaWhrOHRkbWdVc29mNDZTQ00rUWxyd01h?=
 =?utf-8?B?VmJETFBPd1ZtR2l3OERtK2tEaW9nN0hWM2VWQ09reUZ6T2hNQldqc2loMkFl?=
 =?utf-8?B?MVZPTzBONjZEdDBYbHBrUzlDUFJQMW9mUm9NT2N2emJGL21VZERjR2tvdXRu?=
 =?utf-8?B?NlhxbHVrYm94QVdvWTh6TTIzNFcwenpXYmNBL2FNTEVCZVQ1bnE2WmpwejM0?=
 =?utf-8?B?UzlObGlGY1lRNFNReGo5ZEpYNzIrRnFCS0xVWE40SDc1VWJwZHYwTEd0RUhL?=
 =?utf-8?B?bXVHekhsRGtveUdXNUw3NkxSK21BUnZqSmZNMDI3VVI3T2M2bTR0K0NXRXNZ?=
 =?utf-8?B?NjBUNFE0UlV6WnlMRWxIeEcvcFJ5djdrOEl1alhMVW9RZzJhTzNDWHVUWFhz?=
 =?utf-8?B?a2NHOWk1dFpkdWkvQlYvVEE5U1I5Vkd1NFdVMHBtaWhKQXkzRTBOaE1pWnlp?=
 =?utf-8?B?cysraW5VODFFNEVWRUYyUVZBUnFZWUg5cnJuREx3bC8xdEVDZFBLR3B1dkFt?=
 =?utf-8?B?aTBGNzYzSm54NTJqRnJHL1pZWnF4a1cxYW56aC9ZZkZhc3MzR04xYmVsVGtW?=
 =?utf-8?B?TEdRL2pwcTNyM3VOekhNKy9tOEdFQzBtUzJjTUZQRW1mekhnVEpiMkY3bit5?=
 =?utf-8?Q?jAQ277ddci4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVE5OXdmSDhZSHNGelEwM3hLUk1ScUd4TTF2VERrWGl5QlVWRk0vZ0Qrek1u?=
 =?utf-8?B?WmlOQWFwdzV5Ums5WkgvdmdZSFYwVVdZSTR4REt3emJRVSsxNGVrUmJlQ3Bq?=
 =?utf-8?B?aUtWUmtuWTdLZkVLK3A3N2gwS2hLeHZ1N2lzc0p0RTZwUVd6TGh2Z0ZnUEpI?=
 =?utf-8?B?eDc1cTlBSEFNeEd4SnJHS2lsN1Y2cGlLaWJpNjBIQkp4eDdDbUJPdnRPTmY4?=
 =?utf-8?B?aUFJb1hDM2xEdzZ5cjRvTzVEWEd0Ym9HTy9LcXhCVXR0MUNISlFqdEF4MnRX?=
 =?utf-8?B?SnFBQUZQbytnMURicERrQ1hocHRRTGtyN1JFb3N5YmgwQ1F1V3FZTmZjeEQ3?=
 =?utf-8?B?cTJVMTRNUjlrZjdQd2Fvb0xlMUJsYk1CMVcwU0ZMQ2Q2RzlYNDJianpNa0VM?=
 =?utf-8?B?SW9PYUdNaGNhQkxZdEVSVUhRUGxuM3VKTFRSREpGQ0MxYVdKN0xOaUQ5ajg4?=
 =?utf-8?B?cG5QQ0FhdXlMZTJCbVUwcmtnYVo2c0dnUmlFNDZmdThXaGtZL1g2U3dRcysy?=
 =?utf-8?B?S1pEcElhUCtPVDBjeFE2SEtRM0pJRTNRM2h0ZHM1UmhHcVVsS2ZKaisyUStm?=
 =?utf-8?B?TmhPUGRYTjhpN1kxWjc3OWlvOE1XTkg3ZEtCUzMvdUFPZlZnUnpWVXRGNkt3?=
 =?utf-8?B?clFDc1FnVVpQQTFxbmVlZXdmcitIOUh0bVBvM3JDMXROU0hBVUNIdGhlZFpZ?=
 =?utf-8?B?L21zb2paSHJHOFFHYnovUFo4dEFhZmJxdUV4Q21henJjUXVyMi9XVWsra05o?=
 =?utf-8?B?aVVPbzVPcVYweENkZnJpbFpkZ1RUNGd4SzVUQ1o0c1Q2YkIxR0FOdUk5U3dN?=
 =?utf-8?B?UmlDdkg2cjFqb1RkMjRrTnBBMVRjd0FhTlBJQy9wRS9Mbm5kQnRiWTc2WW8z?=
 =?utf-8?B?K2lOVDZkcU1LeDQwZlBKVlNQWVBrZ1Z5NVpwR3d2NjFhL1VkWkJxZUpyMEFW?=
 =?utf-8?B?QkpIUGVMVmRxamg2bUFsUFV6VkJBWlFrVFVZUk5RbzBDbG1wSEw5Mm5xREgv?=
 =?utf-8?B?OUwyQjEvLzEwNW5QS3FLb2s5ZTM2RmtKU0ZidXhkRFJHdFpqQWlsNjVJSXpm?=
 =?utf-8?B?MUVJVU0zU3RSUFYrekdGeTcrZHBYSStMTUcwUzJmTDY3Q1B0dG5UOWtCQUhu?=
 =?utf-8?B?STdlL3FjOWZ2OFBmQmFRSTl5VXg1TmhXQ0YzZ2Izd3hDQitURFo0bWsrUHky?=
 =?utf-8?B?blA0TzFjM1JsUmF4OGxwOFR6azJqY0d5SW8vL0FrMGJKWlp3NnNHSTMxQ3Nm?=
 =?utf-8?B?R0FTUnRlZm1vd1dxaXJkcTJwT04yZndjR0JaajZ6Z3lhL082R2Zpc3V0MW9s?=
 =?utf-8?B?amFmNUdyV0twU3Z3VHJVVnhWRS9Kc0hJa29Zc2t2TVZiUXpyREkxd3Rmd05o?=
 =?utf-8?B?TDRCalUvZGNTUTUvRE5oZ1FkZi9aQzRzcDB6bllueTZ5UStVL2xmWVR4cFFT?=
 =?utf-8?B?ODBZQkNpYnJVYlgveGRNOXplL0pTcUp4OFl0aWd3OEVJdFN5L3JXQzBwd2x1?=
 =?utf-8?B?anJ4TlZZa3hDQ1lXNzMyRXcyaEZoU0NPVWlVMUhnRnNSMVRrczh1Uzd6VHli?=
 =?utf-8?B?bVhad1FQdGtTbUdFY2xsWi9GaVcveituQ3JKeFloRVVtbnkzaFRnSUtJalJu?=
 =?utf-8?B?dXVIZlFCdGw3cEE5eGpCMm1YNDVnbnY1VkI4cC9OSVpVZUxHODlqdG5NMzJn?=
 =?utf-8?B?RVdBN3VmT2xWUUFDRDVoZWZxUnRpMm1kVFoxN040V2xoS2FwSTl3WFJxT1FI?=
 =?utf-8?B?a2RVd0RJcVpGaHJ5bDk5UXo2eGdhODEwci81eDI2Zm9qYVRieUk5N0JLcStZ?=
 =?utf-8?B?Y0NMdjQveEdtVmxsdktwbFJOSWNEVGp3T1kzUWR6eXVIaCtLVW1sdERLSEM2?=
 =?utf-8?B?dFQyeHNIenNNMDNMY1dRK0o1RGFBcGR2SFZnaUt4V1dBemFsYnRMd2tiSU50?=
 =?utf-8?B?RUFlTTVjT2JyTTM3SjZ4L2c1VTVPTUdYeFAyUkhUTlowd3NlcTd2UEVWemFX?=
 =?utf-8?B?WDJoN3hub0pSSklaOTU5NUxldi85MkZKYk51UmwvSmFucHZkK0NYamVYWDl0?=
 =?utf-8?B?YkIrYWpDRkNHSzNZQjZPYkZwc25nQmhtVDBNWE1OQXZVeElBcmFpWGdSbm9D?=
 =?utf-8?B?VHhUZ1pVeEgzVTBodE9aMWh2QmZhZmF6VHFqZ3BEd0psV3BWdWFjWjJsTkFB?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb1745b-da8b-4a9a-090c-08ddf5c15808
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:08:11.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIk1XSRPYo5NLkN13RkMmQUVUOOS/yjiwmCX9c8wZ4Etun0izLiPptmkmszGKh3k9PsvtXQ7EiXESuGHQJoWOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
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

On 04-09-2025 09:13 am, Jeevan B wrote:
> For simulation environment, we can reduce execution time
> by running test only with one combination.
>
> v2: Remove redundant simulation check by using flag
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index c93195b3c..e95e334d2 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -180,6 +180,7 @@ static void run_extendedmode_basic(data_t *data,
>   
>   static void run_extendedmode_test(data_t *data) {
>   	enum pipe pipe1, pipe2;
> +	bool sim_flag = igt_run_in_simulation();
>   	igt_output_t *output1, *output2;
>   	igt_display_t *display = &data->display;
>   
> @@ -218,9 +219,11 @@ static void run_extendedmode_test(data_t *data) {
>   			 * For simulation env, no need to run
>   			 * test with each valid output on pipe.
>   			 */

Can you fix this comment?
/*
  * In simulation env, only run the test once with a
  * single valid pipe/output pair instead of all combos.
  */

Otherwise patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> -			if (igt_run_in_simulation())
> +			if (sim_flag)
>   				break;
>   		}
> +		if (sim_flag)
> +			break;
>   	}
>   }
>   

