Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D99EC982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 05:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8E610E1CC;
	Mon, 21 Sep 2026 05:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIGWUOve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082310E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 05:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789967374; x=1821503374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UtrFWAeS54JpHCR/7Fah78ROftF6HuNLd1gIto5N5dc=;
 b=RIGWUOvewI6quTS591yDBU2m5tNge0XFjw5mV/t7dajgktQyc/3WmIcx
 7JolW4ukbtJQAZaGuaQ+99hVt/2Qbu/CM00wPlsMRhN15e962hL7LlEig
 q3UjSbzJfkJXH8RUdQq8e8AUSVjA+m6lByZhNvfi7Ml5+IcbULVikc9EO
 D++oDs1v9g53vE/6k8kCUdBpa0+HpPNUVnr5n+JSB2EwMoTAP7qiI+ZOt
 r+waCO8qgfuVLqgG1FADonEm7CHNTTCCJCI13wNVbtwm69Cwjx8KivdUo
 FFGMaZ4UJY3adkUDYQpQ5ioTak4VAQqZNZa34Ikz0/2BapfXv5llKR7DZ w==;
X-CSE-ConnectionGUID: mr7Rs34fSruq6ESeWCIZUA==
X-CSE-MsgGUID: +hK1KZQDRdG5z8MWqLA2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101805884"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101805884"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:09:33 -0700
X-CSE-ConnectionGUID: NGcaOp/CQmm/k1a2d85rFg==
X-CSE-MsgGUID: Fx0b2bgtSnymjEFbCXnURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3805058"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:09:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:09:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 22:09:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7FFwEJFWL9bSuvYMjRCLPaEfAEUugHVEzazuN2pfsLAEVAIxawya+wGH8T/VyMbbioScs3taTqK2dWMPbq6wUQ4PbRNjS4Q1JBO05EJuNju9HVhAA2/V86At65NUqSse9lRt1SF2pS9s55MSBeDUap0hNmnWJKsUOVnkNEhtXaaFVsAQeb94v+caDuosNZWaEGzSlX0ZkJig0oU74VuxomL0/NvXGQOZOH+qIxqTce5faxYMHZKY9lLYQ2mAJp16iH/bl+LymA4JA7YIOI1fXEKQgdCqb17khdmYh3ECvcHMH5+Ocy7e7e2gh9Qecwe65Bec3y1hv0ZRlR1TIh2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9L0RUjHjcoBjfQ3urIz7K/dWzm5fWhJtkk+it0mbyU=;
 b=QPgqV4p1oO/JDT9bzRShBKZB9xDQeiKaCCR0vsmd4PMNgX1KCfCyJ+CDBll6/Y0eQtAGq1J5J+xJRgdPycYu3iaHAfPywlnrWj198BaaDYxARrFFLPRTua/pIsMOKiqa/MKDSBZlc1nzI/ztHjRE+xsvBUAov4/kSP1Qsa9IpsPIV2xfqanDXFgFEzUMA5loNTvzLKEcSQ2pvqF2RvKvtJhKoLnFN7pUknKS79UKn1UeBYDCcUkwjVSrR2vb79AqoplxjWHwYGO+5Rs8CM7zIZpsgm6P8Y61GAUsVctb4eyMAii4lwmi+LraF9Lnx0IL6Ruj5QIGcIUUwQ5PEPY8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Mon, 21 Sep 2026 05:09:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:09:30 +0000
Message-ID: <c3988e7c-9d95-40e8-afc7-d524bed046e3@intel.com>
Date: Mon, 21 Sep 2026 10:39:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Purkait Soham <soham.purkait@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0206.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1b066f-59c2-4d7d-c255-08df179e83f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|6133799003|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8NeT+SXAXGY9sBGYr60fT0hb55WXJdlOg+du0LqePhqX0eBEn++Saxw0LdG41z4rzGNq10b+Rv1R9Ic/6mUlAJ93wXD8SwoOz/wSbiDR0A20fsfUKzuHL1xPeQdliuMXzojxzITPmoaT/dPqGQHiiFhgLU3MBT1DVJkHjbQ8waAHxCzOFD4gFiXK4LxSoKEStGdwR/QkcYnSTyUNb32xWAdrAmgYdIiAj/ZnS268mFtya272G4G8dUSZnbwcclcksH42HIZnsJ3cFCmUu7vDQHCtpVMSIx6pnbrGhPdRsvk0d69TRUm4s7PFLFU516BDIX6///5xOrQlJBC74+VRf2N8M7KzvGieP7pbXziOZLGbJX0MK0OxmFL4NXskitEqUD/QhxLGYJcmHFztVz6DUSS87Fhzu0522ssDBcrEEw7Hwopp5unfRomTF9iGQGzoaDx8MZg28TqgpabTbnCK9GiHh4+boINbI6FNUZd0UNXSEFXqazCq6MCWhBdAcbQjXyYPiDMxQwCDGSOgymnrwQRFxQsn71e7UtEF5MEfQ7BLroXUrBTdlalJgeRW6ahYDiMsgCDMnIERlF4/EoM4t/KRs5GkhZGxDVmjwTOFQRAn7olHBv5yvfqRL72UHKIjHEdesvbZye3djbQPjZ1XbU3BwQl9cf6r0iyGRlC0n0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(6133799003)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajlTdjB5V2wvSzVnWVF5UFJNK3hCRGF0OW1qK0JzUHZPYlNtb25IYldvb2Ur?=
 =?utf-8?B?NnRnOENSaE1zVFhhcnU2UXRRL3JuSlhsdGUzMXFqcHlVVTJsbnk0QzhvdXJI?=
 =?utf-8?B?VVdGSE9OTU9FNmhMVHh4bmJqZmk1bjVhUVlDazRCWHVLMTgzVWUzUnVMaEd0?=
 =?utf-8?B?aXRDZnByeG5pOEp0Qlo5ZFp6eE1HMi8zWUxGM3ZxYVhqZDcrT0VyQVhEZDNr?=
 =?utf-8?B?SEh5SWRlcGtlMU5uV1BYbGhLVGJzR3RSbWZNZkdNSGVtNFBST2g4VVIzNGYx?=
 =?utf-8?B?dGw1bmFtVDlGcVlSYmxvODBadGFpM2FQKzRhVjJoVU5RdFBMcEtJbXNQc3o3?=
 =?utf-8?B?cHNjaEJxVkZoMVJQQ2UwaXdHekNCMTB5bDV6aVlnRGNIRlhOMU1GYzc2bTNm?=
 =?utf-8?B?bXI0M3Q4N0Ywc2s1TGJkZ0hTZ0tVMk9heVR2ekIvcFBYbDJsYUpXZHY1S2dC?=
 =?utf-8?B?QkdTLzBtQjFwK0J5Q0lTcUhHc2RsZW44NzROc3NWdmFqazNiTklRdGRWR1kv?=
 =?utf-8?B?aGgwdUlMSTFOOHBEaDJRS2YxSHJaaFpwVVZuY1VHWmU1MzJYc1pnNW5icVU5?=
 =?utf-8?B?UFI0Um9sYzJudFpqN2dZVk0zWWFFU21maHBzTGZqRmVSVDNNTTFKaTJQak5r?=
 =?utf-8?B?WkM3enVBTDJhZlJkeDlQQ2JQUDVGbTFmMnQxdlJmS1lMNWRmYWxjaTRIcGVS?=
 =?utf-8?B?eVZTUk5OcFd2MXphQ1ZNUGZsZG50cmtRT2FlZzE5WnQ2RWxRYmRydVh5RzVB?=
 =?utf-8?B?ZmpBS1k0cWFzZ1Z3NXl2UTF6NDB5YVMzUTZUdzIxUFlrUUtwL2pYWkNzWmtR?=
 =?utf-8?B?WmhrNysrejY4eDZKMEhybHZuZFh1K2FvcFIwUFUyRnZaQWdoK2lpOWc1MUw1?=
 =?utf-8?B?QSs0Z29RRDJjMEYxUjRrczRxT01TRDJmZ3M5ejErbHNSUnVOaXNmVFhhTkJ3?=
 =?utf-8?B?Tm1jbzhhQXNiQU9BZlFmUDlOV1l4Ky9BeEM4Nm5MRlZmcUNDNVN2THNhVmRi?=
 =?utf-8?B?dWhORkhwQVlLRWFCRXMxVmZyeTdhV29RejRGL3NoTUU4NWpLeHRHMzQ4MHg1?=
 =?utf-8?B?amtyeXBzWXE3d0pYSUZiRU40czZlTG51UU5MV0dlUkNMdk9yNXRXYmtTY25p?=
 =?utf-8?B?TndTUHNqeFVlakJKUmIrelJCWHpkUkJ5OWNKSy9vTmVMcjIvRDQyZ2V6T2h6?=
 =?utf-8?B?bllYcUdrV2s0MnY5RkdtUkh2bFkxaUtpNi9TeDBDSVpOTWNpZzZTTHkwckc3?=
 =?utf-8?B?YnJhNXhmN0VBV3VOellHWURNZ0IxdEMrbWc4enY3Z2tnS0NUdGpoQWROcTNv?=
 =?utf-8?B?MmRtMFNHcURNWWJyemJNWkdvV09WajRTUngxbnIxalFtL0FoSmFDTnloM1VT?=
 =?utf-8?B?MVNUcWozTGxpbTdkRmlnVU9DVk5ueVRwSHlubW03bXB6cVJmYnRwa0pvN3la?=
 =?utf-8?B?UFNvclpJWGNPd1NXQjBad1VqbmYrQkRUTmRqa3k2cksxRS9nNXdxRU16a0dZ?=
 =?utf-8?B?NUQxckxMaVB0ZXN2SG1OS3V4TEtJYjBlbnNWZjQ1a1dvRE5wV3RVaWI0MFh1?=
 =?utf-8?B?aGNydUdDYnEzYnZ2VlNpeFJEanBFYXgvYTk4UWdIT3VuOXA2eEhTU0l4TzJq?=
 =?utf-8?B?RlE1Q2JHZVlUQVhJaDlrejhFa29vQWZ5RXlVWDJVMmdINUtqZzlSZHBOTFRP?=
 =?utf-8?B?M0ZKT2xMeUdzaTRjeGkyTUMxR0xvNWgyQWw5LzhFSTBPZHVtb3BHUHdKMmFj?=
 =?utf-8?B?ZVhBVTBnOUg1ZmkvVFplSUJVM2Y2ZFZ1NU5yWGhSWlgwSEtjSGZrb3p4eE9N?=
 =?utf-8?B?cnkvUVFYOXNjNGNFNlVoVFhwcGtuWUdKeVRyNW8zMVNYVVFZcGdzRGJ6bTJl?=
 =?utf-8?B?amdycEdMeEtVTys4eHBCL1NJWUNSR1V1ZkN0U0JjTEs0Y2tacHAzTHY0cVJx?=
 =?utf-8?B?S2F4YkZOdmlMYmhiQU9sQ091U3Zsem11d2dEcndSdHJaTHkyOVo4VFA1TnM0?=
 =?utf-8?B?bHp2NlJqSVJUK2g1TEY0YTdRNmlIQTA4azFMRTk5VWZPZDh2SGplc2dOSE5l?=
 =?utf-8?B?NXZ6YlVvMTQ5MGpvK1A1NGI4bFVuYWhWMkRzUlRHaC9ZaHhneVRrU1Bhd0U1?=
 =?utf-8?B?ZXUzcnFNM1NrLzI0b2pOY2ZGdk1VOHpoY0QvQkEyNGNQdFFIa3hCOG5TRGx6?=
 =?utf-8?B?eWM5d3BNV0JJOGkyZDNmak1aUVBlRUdITXlIbVhwaDR5ZDhxME12cSs5TndK?=
 =?utf-8?B?YWlTZHREY1N2K3BGb04rNG9sYS9DcEZ2Z2RnTUs4WkRwZWEwN1JhcjN3akhM?=
 =?utf-8?B?ZnYvTktRRGNiaER1dTd1WDlSV0pkWjNqZTJsN0plUlJadVpjOWwxZz09?=
X-Exchange-RoutingPolicyChecked: BAa7wF0Rs1tQ0RFaZB5rQrSK0q9zxgPuN0b2NdXMHohD/BszscJ+8rK6kVolcQJTe9fszryWmo6v/wHgoW+bGOd5lmwf+7l5ej0BKW0hO5530krcSKV5CmFrQAst82eTEfGGvaqFXfCumWi/0yOH4evIQ6c0ntfJTsD16t6c8R92ro5+/1LoWPwiaf/D9C13Umq0H1b6fT5XIl4c/yapN7it+oZ7Z+jZ66PdY1PvAB1GNeXcpU/WaYk8hhSRNb33qqXqwlCyk69aMLG4nczs2qXnWalLlv3scSqUHRylQGJuAfBk5Jq8LDjwruKoYnSsNYWkgJhMHRaBC19HzAVVFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1b066f-59c2-4d7d-c255-08df179e83f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:09:29.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JfAAhL+XuXX/MSJcALKMruYhiL1G9UIerK4geIqa7R0Fl/zxA1B8D2DLXzgxsRYdW32qP8Fly4+rqbUlXYrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
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


On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  31 +++
>   tests/meson.build              |   1 +
>   3 files changed, 374 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>   create mode 100644 tests/intel/xe_err_injection.h
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..683994d1c
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
Single message should be sufficient. Won't the other info messages 
indicate if recovery is done or is it during injection?
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
Unnecessary wrapper
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +
> +	while (true) {
> +		regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
> +			xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
> +			return;
> +		}
> +	}


Are we expecting the single write not to work? Why a while loop?


> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
> +			STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_drm_netlink_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_netlink_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const recovery_messages[] = {
> +		"AER: device recovery successful",
> +		"AER: device recovery failed",
> +	};
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
> +			if (!strstr(buff, recovery_messages[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  recovery_messages[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS + i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 secs */
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);

Why kmsg?

> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)

Let's not rely on dmesg. use uevent.

> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection: %s Success\n", err_name);
> +	else
> +		igt_info("Injection: %s Failed\n", err_name);

Use ternary operator instead of new  function.

> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;

Use shorter names.

> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;

This will fail on multi-gpu.  This has to be dynamic. I don't think TODO 
will work

> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	acquire_steering_semaphore(mmio);
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);

why not use mmio_write directly?

> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);

If there is an assert or skip in the above function. All forcewakes and 
registers need to be restored.
Add a exit handler.

> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
Add all descriptions at start of the file if we don't have a function 
per test
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));

Add the reason for skip. use igt_require_f

> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));

Same

> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);

Use enums instead of string comparison.

> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");

shouldn't every test be independent.  If there is a dependency make it a 
dynamic subtest

> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..a70e6af22
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000

Start names with XE_. Also are we expecting other files to use this?
If not, move it to .c

Thanks
Riana


> +
> +/* GT Uncorrectable worker command parity error injection */
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +#endif /* XE_ERR_INJECTION_H */
> +
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
