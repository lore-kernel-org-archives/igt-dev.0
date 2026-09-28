Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319CCA5FA1
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216A010E864;
	Mon, 28 Sep 2026 08:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHX9bNX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140DC10E85B
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585884; x=1822121884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOkEEJsYi8cd647KYvbMcyljTt73qThXhYAVRSRzh5o=;
 b=dHX9bNX51PlnClia8HBvzAxQhenWUvSoLqWfKGz8n88XktEBHwvYZ/We
 b0MsdBie4W/klSJQu5DtdL49VGcxqe3p/RZFjOPeeaa4E0z1lKMqRF0W7
 bfpVsTCaymY3oSzdGE2odOBWW4/1wj6dM1cPPcdr51InMpxkH4Gd+qimU
 rNmwCFH7/pgsIrQsgVfCOqR6rz2uh5cY6scroKU+/m5QpnbuhygrRachr
 uzVS5+WSjcQGYKW7G6Nb/uHHVttxjrJcQJZF/a8wEmFyEM+pPD3CLAsnl
 pX8ei//ozVxgQZj1orb76t0tXN69mtl8O3Vyv2QOZIS6182U4r6BcwIUg A==;
X-CSE-ConnectionGUID: cFbg+JT2TS6UzidfFvVFFw==
X-CSE-MsgGUID: 2txlIQpaTNalLcVJOCZaVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113063426"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="113063426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:58:04 -0700
X-CSE-ConnectionGUID: dvgN7IcCTbeZGTQ4h/QsOA==
X-CSE-MsgGUID: VySPB4AWRNOsS+mvQOkwqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278348457"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:58:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:58:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:58:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:58:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsGnc+0HRP6XsZUHEjH/X+drwPW0jDLOrgOhVBhn0oddz43tPTW5LtFqm+JoManCcuZOkIdSBo5J60riiw3WI7xjnQW0ntSI2ONB8FlruKjGpgHSGs/+6uVwECfmyMkUwDYRbwo9jP0l04HGHUFQ5YUP7vmr69w3CmC5eoVz0AChjv0eXeVEEXG6AUXupPoCkw/ULSQgr73c2aIx3MjAiEMQzjE3RNAaqHK4ckYvNDEGYy9beI9U12Z5p3NbT6eOLPbjKq101s7B/qLPTpsUi9aSOBOYa0WD8gVwEKBmrCMDMRZsxb7Mm2rrPLYnGEU9rMtVENi5ViKqN1YYI9mp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4d2zR5mygX7z2TjEMrpgFBB8PExYx/9mrsliYkWrXU=;
 b=Nxell10YhvxyhrgZ76WW3Zge10cXTMOBMme6FFB1HJhw99sUBPSuzmBGal9ZnL6zFtJy5gFtruUUO0NYtO0YHWkL5pOaxBDGd5582jDj2dpUprpJ1gl3X9l0jAQbCxm6EQkpDsAqePHaMTZ4lWd3WgfrGoXpzhgM8KS0jkRCpR+YJCyGl7L4ZgrWAs+2gieee1lUmnLt6pg7iE5D8SytDgHKmAD82t39dGlVuP6z2xQTVUY9xNj1cuouN0dlvU/o6GaXLBsZTyp8QRwT9EZj21x1vpGNwY5VoCIAqBiC8bi3ZsMYM+F/6aTcd4eVgjkMRTCw0H3lUbBRxkAlZjYw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB480600.namprd11.prod.outlook.com (2603:10b6:408:40f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Mon, 28 Sep
 2026 08:57:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:57:55 +0000
Message-ID: <9bb4df75-12d7-454f-bf45-5d4c0fb87898@intel.com>
Date: Mon, 28 Sep 2026 14:27:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: "Purkait, Soham" <soham.purkait@intel.com>, Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Jadav Raag
 <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>, "Koujalagi
 Mallesh" <mallesh.koujalagi@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-5-ravi.kishore.koppuravuri@intel.com>
 <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB480600:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9fd589-c1d1-4e1a-25d3-08df1d3e9603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: LOXBQtjv/io6IeA32+U5HXhAxmWtQl0XZUO2bBmQRsX3FauOGfjKGPH5s2ilULahCR2TuC78XcgEWCpVhlQC+yp/y0/TjOL4xHy2qgALf93VC7QtGM4LHuotNfCGqeP0hl/Q+EA/Tjjag2PBwAQ93Sk3VHIZ+3w1DDALlp6WLC2/v1sai8deg11NgNqZMuhPTGV0OWOd2H6wyuCCURliJ9/kBXo/e01nIZTST3iKp1BhmtxMgOcjCWJhKQfLrNKn9GMdrCBr97WE78kkFeW+P+tg/aOcWFjYwNmZNpY8UgxOY5QCVlOLFE2O2trYrPS3bUyLLvud305/pIJ2B5lYEVBG8WmLt4TZogpvSXGlYlmIHhpZHXtGahMta08igEPN/Y+sXOYx6xJYuRc7MLS7v3E8izEHPyp5aFsBlnaB882oPFg8oG3A455dFuxzPxA4TQddPG/hm7XdBhZ4+NqP7DF9y6zGAYcSI8HKDiVVx7KUbMl3ZZixYg0lVwTAR2LA1Mo4YOJuBZHGg3dhjYHGBCbVt5umFT06uGP1Jf3A0jt7Vr6MAT0KYoCGy8Ryn/DaXXtI+PQyVrbGupx2wSe1r09gOpUOUIyrw2h/z0yu9+x1G1nE/MrZOmqnv1Ydx6jo+S1JpYjQ1X2HBhpWGEjn0O4/S0/fgzdyyhdZfzwdB8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVBdnVBS2d6bkd3dTB4YWVha1U4N0Myc2ZyV2UrbG93aGNFelhZVEtwNHZG?=
 =?utf-8?B?L0Z6SlhmUU1pczh4cnpScHN4bHMxMGtsTEtVd1JpR2FTWFlKb2N1QU85UmR0?=
 =?utf-8?B?aEVkZUhzUG1jV1RkamE0WTVZcmxiRjhYZHZNOGE3MnVMTEEyQXl6MnN1Rmpq?=
 =?utf-8?B?WUQyemtDQjJTNlVRM0I3UHUrZHRlT3EvbnBoMkpaUUFjSDI1SVdKeVk5bXhQ?=
 =?utf-8?B?WkF3VE1ZU1dabkNkZkc3SjJNakdZdzZtcEo4dHdnTGpYak8zZU9jalpST3ZX?=
 =?utf-8?B?UTZMdGRlUFRkeGFxSEFxSzl4WXRRU1U4VmEwVzlBbWg2WEJNYW82MUJHc0F6?=
 =?utf-8?B?TVFDUHRFdmkvTlZJaGdrTENkUU9Pa0NhNEdMS2hBSkhEWm41aWl6VXRXWm0v?=
 =?utf-8?B?YzZmNEpqYXN4Zy9OVW1RbngyeFkrRkV6cWJuSTZyQnB6Vmx2a0toMnR0eDFi?=
 =?utf-8?B?S2pPZFFZYWFFWmxGaEZ0SE1IeEJiMGdDdktUOVpkNHhrZUpqNHkxekJyTzRD?=
 =?utf-8?B?OXRIMUJIRGZhZTlUVmtUQ3hqMFd0TGkxYjZZSFRRamd3Z0dZcjVvUDkzYUdC?=
 =?utf-8?B?dVkwNnoxU2tRbkRpejZZdC9uT3pQNWY1ZlQxeE85ZUVRWHpKL3Q4QVo0NlV2?=
 =?utf-8?B?VUwzUERzTUd4S0NjSnFTamZFRWJTbzFlZVF0NHJtTnpkUkNobzM0NFNPbFht?=
 =?utf-8?B?cW5Kakl1NEw1NXlHTGhTU1FEL1NRcnpLMjlBLy9VK1YzQU1QSHREVDgrNWdi?=
 =?utf-8?B?MTJ1WDRlUityZzE4RlJ0b0I5c0NRS3FGbnhwKzg3bitST2NsL0pza1ZDa2VM?=
 =?utf-8?B?WmFpbHdqWmpFeW1vZGlhQkdDZlBtTW83WmZoTU1aeENjVk9aOXdGUTlyallS?=
 =?utf-8?B?WFZGT1ZoR0QzSEtKN0JHL0hRS1JIV1dVZnYwWmVkZVZqWlZvQm5oS2dsZUtN?=
 =?utf-8?B?WC9scTU5OFdaeWF4YmdBa3Bvd2FTdkJnNUxDb2oyem5YTFR6S01VSGk3N0dT?=
 =?utf-8?B?N2FyMVVSSFlKUWlObjJaaVpNM25vQkFBWFdGOGNSa3dkUDlXbVJXa09OMldZ?=
 =?utf-8?B?Qmpvbkxwb1RIS2JZNGZvaExsMzRvNW93ZTZwN0pINHFDeG1WWTlTSmhSNm8y?=
 =?utf-8?B?TEdXOU5XdmZ6dXRRNnplRjY0L3VuRS9mNU9KNzg2ZDVXd0Y3UFdPYWtXcjhB?=
 =?utf-8?B?aFZkTm8veTYxSmVYZWozdXpRZEFFT3hUSFY1OWRucHpicHY4VXN3RTlPN01r?=
 =?utf-8?B?TnIwL2gweXZFeGVTOUhPclRrVnpXVXpMT3FTbytZeG5TWk9Ga1VYbFBFbjRR?=
 =?utf-8?B?bnZjeEN3Rm1WL2NVMTRxdUlncXkvd1hkaTZTcHNadjVyV3BiSWk0a3N1R3dY?=
 =?utf-8?B?V1gvS0JLa1FxRnE0ZEo3VzhaQUdKbzRYMWxwR1A3UWlhL2NXZi9CZUZnS1RW?=
 =?utf-8?B?L1RwY29ZOHdqTTRGU1I2WTVWUVRiRitVYnkxTXRZbmFwL1hPNkNWOXVhNEhD?=
 =?utf-8?B?MStPdmFHeU05elBhbVFpSno0cTBOYkJ5MUpIT21kTjluUGZxaFQ5ZC9TL3U4?=
 =?utf-8?B?QVJxM3hnaW9YZWYxOWQ0VllyeU92bE1ISjgwczlLYWtmOVRDNzNUQVVIN0tP?=
 =?utf-8?B?bGVBN3Y0WEh2emQyQUlBdkxSWmFBWHNqMVU2Q1VrTXA0OGRVT0RPbHhnNGdX?=
 =?utf-8?B?c2p4eU5BNnRPWW83Tm1RZ05XWkVOK2J1c0JNWVhyN2J5bEJjMUJ3MUZSN0w5?=
 =?utf-8?B?Mk1iZzQ3WXNHOE54NkVibEhOWUQ1aHA1VE4vOUtDcDVJbWVCc2lTWTNWTjYv?=
 =?utf-8?B?M0dDRG5DNVVzMXFTRk40cW84MzZTRWt3a0MyNmZGN2lxdjBoU2RwM0xoOXJl?=
 =?utf-8?B?R0svcWpZZWNROHVFcEdyZ3pZa3FKMEdLTUcxN3kzZjBMYWt1d0RPdlQ4MjZD?=
 =?utf-8?B?UmFMTUVnc1hZdFFIbmFaUUNZS09uMFN0MktKWnFibStDaHFlM1FLVnpuejFx?=
 =?utf-8?B?bitGaGhFTzcwTEVyRm5RNTRFa3lXSHN4VmRucHhrM1FiakFzbDNFZTJMRWQr?=
 =?utf-8?B?NGl2b1ZRbithbThJQk1DL1JiMzE5L2pLVkloQzBZdGpGS0NycWgvbEMyL3c2?=
 =?utf-8?B?dlZiaEVhbUlrRjNKZU1RTURtbE1xL2Vyb0ZpSmdCdzVIK3lhUkliWFFNdW1t?=
 =?utf-8?B?NFVGSnRsVjJ5Y0VhK0RxMlpJQnMzQzlrcXpyektPUmFNTVlPS3IyMlMzOUF2?=
 =?utf-8?B?T3dZRHpJRnNYOXhWc25LVUxYcHgyRkM2WWNkWWwvM2RWRUlOMml6SVVQSmt0?=
 =?utf-8?B?ZG9CdVBhTVdNUThRd3h2VUJBTmlyTDBBUWJGZUl1cGZNY0tNaXhTZz09?=
X-Exchange-RoutingPolicyChecked: Lw7I+YL7B3ELBFFY31m+PFCcRTSczIA5zr3wPsBImFP0f2wdU0cVv/2a3+AhUd5F56SI4x2LPTHLl+bjH8cnTkPmFIPr4AvBBXUFSeSib/mvc+xiiX2m7yBfv1R3M0YLfiCb7w5M74y9DR7cq/o6NWxMwrG95JEwoI+E0Wu/lVDy+VVRYYKYGKnFxLrZeDhMyiG0QQCk3qHZMpikvkwYadBzxmlfABTxgl11LrQWKwhCbv77hBsjlHL6uPrYf7HkN5JtEQv3yHNy8jVczxH/zS+ndyP1HLHJZRI3F2V1aPx/DuP2Jq7aDXnlU0m7mn+srMHBruSKmuf5QTpyKyAViA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9fd589-c1d1-4e1a-25d3-08df1d3e9603
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:57:55.5431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPmOzB1noAdm4PmEp9pz6AtfjYgZDMIjHD1mJVx971NY6dezNiR245BzYLbyNBqrt9kqs1tj+xnGlOUiDdZUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB480600
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


On 10-09-2026 17:35, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>     Added a check whether error_value updated by valid callback or not
>>     Added a check whether response required for the command or not
>> v4:Added support to poll for incoming netlink messages with 10 
>> seconds timeout
>>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>>     other cosmetic changes (Nikula Jani & Kamil)
>> ---
>>   lib/igt_drm_netlink.c | 268 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |   9 ++
>>   2 files changed, 275 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 709c01987..b18e3eeb6 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   +#include <errno.h>
>> +#include <poll.h>
>>   #include <stdint.h>
>>     #include <netlink/genl/ctrl.h>
>> @@ -11,6 +13,229 @@
>>   #include "igt_core.h"
>>   #include "igt_drm_netlink.h"
>>   +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
>> +
>> +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +    struct nlmsghdr *nlh;
>> +    struct genlmsghdr *gnlh;
>> +    int ret;
>> +
>> +    nlh = nlmsg_hdr(msg);
>> +    gnlh = nlmsg_data(nlh);
>> +
>> +    switch (gnlh->cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +        break;
>> +    }
>> +    default:
>> +        return NL_SKIP;
>> +    }
>> +
>> +    ctx->reply_received = true;
>> +    if (ctx->ack_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_OK;
>> +}
>> +
>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->last_nl_error = err->error;
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->ack_received = true;
>> +    if (!ctx->response_required || ctx->reply_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int register_callbacks(struct nl_cb *cb, struct app_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;

Add some debug prints to differentiate errors.

>> +
>> +    return 0;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>> +                struct nl_cb *cb,
>> +                struct nl_msg *msg)
>> +{
>> +    struct pollfd pfd = {
>> +        .fd = nl_socket_get_fd(ctx->sock),
>> +        .events = POLLIN,
>> +    };
>> +    int ret;
>> +
>> +    ret = nl_send_auto(ctx->sock, msg);
>> +    nlmsg_free(msg);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    /* NL Reply and ACK arrive as separate responses */
>> +    while (!ctx->cmd_done) {
>> +        do {
>> +            /* poll for incoming netlink messages with 10 seconds 
>> timeout */
>> +            ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
>> +        } while (ret < 0 && errno == EINTR);
>> +
>> +        if (ret == 0) {
>> +            ret = -ETIMEDOUT;
>> +            break;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            ret = -errno;
>> +            break;
>> +        }
>> +
>> +        if (!(pfd.revents & POLLIN)) {
>> +            ret = -EIO;
>> +            break;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0)
>> +            break;
>> +    }
>> +    nl_cb_put(cb);
>> +
>> +    return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>> +{
>> +    struct nl_cb *cb;
>> +    struct nl_msg *msg;
>> +    void *msg_head;
>> +    int ret;
>> +
>> +    msg = nlmsg_alloc();
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +
>> +    msg_head = genlmsg_put(msg,
>> +                   NL_AUTO_PORT,
>> +                   NL_AUTO_SEQ,
>> +                   ctx->family_id,
>> +                   0,
>> +                   NLM_F_REQUEST | NLM_F_ACK,
>> +                   cmd,
>> +                   DRM_RAS_FAMILY_VERSION);
>> +    if (!msg_head) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +        ctx->response_required = true;
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +                  ctx->node_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +                  ctx->error_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +        break;
>> +    default:
>> +        nlmsg_free(msg);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    ret = register_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        nlmsg_free(msg);
>> +        return ret;
>> +    }
>> +
>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +static void reset_drm_ras_netlink_context(struct app_context *ctx)
>> +{
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;

use drm-ras max values. This should be allocated to 0. So assign only 
what is necessary.

>> +    ctx->error_value = 0;
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +    ctx->family_id = -1;
>> +}
>> +
>>   void igt_drm_netlink_cleanup(struct app_context *ctx)
>>   {
>>       if (!ctx || !ctx->sock)
>> @@ -18,14 +243,19 @@ void igt_drm_netlink_cleanup(struct app_context 
>> *ctx)
>>         nl_close(ctx->sock);
>>       nl_socket_free(ctx->sock);
>> -    ctx->sock = NULL;
>> -    ctx->family_id = -1;
>> +
>> +    reset_drm_ras_netlink_context(ctx);
>>         igt_debug("Cleaned up netlink socket.\n");
>>   }
>>     int igt_drm_netlink_init(struct app_context *ctx)
>>   {
>> +    if (!ctx)
>> +        return -EINVAL;
>> +
>> +    reset_drm_ras_netlink_context(ctx);
>> +
>>       ctx->sock = nl_socket_alloc();
>>       if (!ctx->sock)
>>           return -1;
>> @@ -52,3 +282,37 @@ int igt_drm_netlink_init(struct app_context *ctx)
>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>       return 0;
>>   }
>> +
>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>
> Aren't the return codes here mixing -errno and libnl -NLE_* values, 
> which overlap numerically and mean different things?
>
> Thanks,
> Soham
>> +{
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)

Add a error message

>> +        return -EINVAL;
>> +
>> +    if (ctx->node_id == UINT32_MAX ||
>> +        ctx->error_id == UINT32_MAX ||
>> +        ctx->error_id == 0) {

Use the uapi max constants here

>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>> +             ctx->node_id, ctx->error_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctx->error_value = UINT32_MAX;
>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_value == UINT32_MAX) {
>> +        igt_warn("No valid error counter reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +    }
>> +
>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index 0e563e55f..5db7f4ab5 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h

Add a line description for these.

>> @@ -10,11 +10,20 @@
>>     struct app_context {

very generic. use drm_ras_context?


>>       struct nl_sock *sock;
>> +    uint32_t node_id;
>> +    uint32_t error_id;
>> +    uint32_t error_value;

i think you should split the above to separate struct error_counter

>> +    int last_nl_error;

Why last?

>> +    bool cmd_done;
>> +    bool reply_received;
>> +    bool ack_received;
>>

Shorten names. Perhaps done, reply, ack.

Thanks
Riana


>> +    bool response_required;
>>       int family_id;
>>   };
>>     void igt_drm_netlink_cleanup(struct app_context *ctx);
>>   int igt_drm_netlink_init(struct app_context *ctx);
>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>>     #endif /* IGT_DRM_NETLINK_H */
