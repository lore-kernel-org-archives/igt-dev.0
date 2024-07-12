Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4EC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 09:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19BD10EC6A;
	Fri, 12 Jul 2024 09:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9gHZrE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F72E10EC6A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720775744; x=1752311744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=73qWBZZaUG20HnOdh3YItEPCFa5olaiKgO2EBhhCMDY=;
 b=K9gHZrE7t8j9yCxHGubavkuJUB6pxl+C8pvRVoHLfwJaRTiOt+zrqKx8
 GxKE+20gGO9uLGhlRbgj6u8YOjxqLs4lBGk9tYGr9r8ECF6CAhFlcwXSe
 K3xbDJCHAR5+1RsJg10n0OaZcnqhuvE5J30Rt4GoLPrQNxCNULyZiEiu0
 mSYFnNiFUSvPr0YOp5odjOquDt5oY0SkZKxlO/SSblM3DTiEqYROJQwu1
 +iMzkqw/YOQBaMfGnbt3TvvbcjYsLb+gjWlIiw89EbeH8XKwOdEsqbFCu
 qG1oAMoq3QfA+kDJdRyk1oawEQiX7KwVVrmPmV5AoKMZExlThTCKVebeh A==;
X-CSE-ConnectionGUID: nPlv3+9KQOKLnMK44Gtymg==
X-CSE-MsgGUID: yah54OlOT5ae5b0d810fkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28798138"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="28798138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:15:44 -0700
X-CSE-ConnectionGUID: GWDKhyjAQviC1crOfeP79g==
X-CSE-MsgGUID: nEjQGKA7TxCr8cd7+HmMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48741829"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 02:15:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:15:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:15:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 02:15:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 02:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RImO0Wwm7rfI0xWdx4VquJjXw4INSEXqj/6xaBAsgEtd0p8b+iU1XoHTFIc7ZtQvQqxIf7iAq6uK8wlOYSdDzZF1X/K7dHrR1ZRXJdRFuAiuap/a0YF4Df1QNx9m93bgmM1khuUP2tYLpcpITc9/UBpA8/1zWZHpm2DlKyVt1YlIhkjqQOqyDcjxwfTubvbOF5ZR5ShVhDttC+vwy/vzCxfJwpaNugHDimyQfBdeOPiDtT7YAuaULL3KeLbaD6394YmHzyO4hZq2o6+00LjD443bNheQKKxhf0YXw808DNZNLmRGDrZe35DLUHGfxIpT27eXUkW8g4vxjdoM/8aVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/apL/p9lQtakrZSAB+sa2piNxODU2yVPEGR5DlZX+Q=;
 b=cmgCuArrmWnCzKACNhfvkFk6ENK3X3M7MbQtfaUIaYly+7Q2NfcqtPlh1kZWDgwpDW+/kwAqMCY89gNfAlRELvMlIrb1NdLMRMk7Q4cffzPZTgJczgrguRkAIgdffTCTmvDM1KeCiL0uwCyMGcvz5bZD4+DGQ5MUg+r2++vQ+dlWGMbzxS+UAmKlKdl16GdOLwvPNVQxBPyTsma98+JnMboVAaIqVCJpKNnYcwMkqHrl3qVYYWyGY6XGVHnJ//sH+F9GQSjmTvhICsNnpOaFe9Tw5FTWMCAJRHajomI20mwvsOKgH05JbqOaAVl3/lLlWpP2VhqaagohzG9P9Lb7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:15:40 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:15:40 +0000
Message-ID: <b1b4df7f-5747-4086-89a0-e10afa1251ad@intel.com>
Date: Fri, 12 Jul 2024 14:45:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240712082928.762514-1-pranay.samala@intel.com>
 <20240712082928.762514-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240712082928.762514-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: f97f6482-cf96-40e8-c593-08dca2533312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJKYUNDQ2RlMklKeUlJdGhBMGV5NG16MHU1QzdoeUc2b0pIeFpYVkdRelJD?=
 =?utf-8?B?aFZsVEVRdzhybjlVL2pyelk5QkVmSEM1aEovMFg5cUpmN2JMTzNLQWl1ait5?=
 =?utf-8?B?U1p4U0lLemdOTXBNS3I5cmlSZEdsb1Jrb0s0OWpqWlVqZytxR3U1L2dVVXV3?=
 =?utf-8?B?WWlacnlMdlN6aVB5WXFIWi9GRFZzeUtEcGd3am15R1I5NUZNQ3BneEFHV1ZQ?=
 =?utf-8?B?azIyN2NmVUVFRDQ2bGt1MmdHdGxOQXBpVTJaRktGQURSdksya0hDdFlVUFdY?=
 =?utf-8?B?SktvSGRXclkyZE5NSHFvMlpieTB4cVd5aExUK090Q1Q5cWpIeFZ4Q1p6QVFw?=
 =?utf-8?B?dFM2VCt3VGhyczJYWlpubmEzeHduR3g0RWdaeDNvL3B5OGFyR1QzUThCYmFy?=
 =?utf-8?B?Y2FPVXZGQk4xSE5OQWlQekxtamUwOEpGYnRJRzhCK1JZN2NqS2VvNHh5Rlhq?=
 =?utf-8?B?UlJnUUh2Zm84VFRYQjlhL1pCWVVDdlhjRmZxYWkyK3QvU0MzWUtpVUNYakp2?=
 =?utf-8?B?QUR0TmxuK3ZvQUY2OWw4S2dBZjk4eHhKZUF0aHpUbHIxSU01U254KzI5YnRn?=
 =?utf-8?B?REVGZy9KQzZTRjk0TXRPdGQzeGF2Q2JXd1JuTVVqSjVjVEdzdkdjamJ5TDFx?=
 =?utf-8?B?cWhQWlBrMW9oZGtoSXhqbE1vSExNR1MzQW04dXhlWmdmcXFud0tSWGd6and1?=
 =?utf-8?B?WkZTcll2ZHVkbG40MDZHUTErb3VyVVM0RmswcThiWEtOdmd2OXFQRGpIZC9E?=
 =?utf-8?B?cmtsMUE1VFhpRWNnVWwzZ09iTlY1NWl5WEw4N09HV3Y3d2ZXbkVxMnZEQkNs?=
 =?utf-8?B?YkZBRk51RGlJWk81SDJlQXNNSHBkZWl3MzVoV2VGN09pRm5QNWxLaGlkbkVJ?=
 =?utf-8?B?blRqVkUwTDNreEwxNHZqdWdBQmRnTER5d2pkalRlcklpN3BBVVZ2ZmdMNERS?=
 =?utf-8?B?a3l4RTJVczhkc1NIRENJY1FHSHdMUXUyV0RSbHE5N0ZEWS91aFZ0bGM3VW1X?=
 =?utf-8?B?alZ6MzRiQWh6ZlNCTDBNeEVGMjR2ZTl4ZFp2ak5TSzBraGFORkpMOStRM0xG?=
 =?utf-8?B?K2ZPdFVBa1VBTkNvdTFDajd0RFhFQkg2eFFEQzhmT3Y4YzFUYS9YdHJjQ3Rp?=
 =?utf-8?B?eUdrd1ZCTGZMQnJCWmhQUHdad2wxRmxkNmRsYzFmQU1EZmVkTDZmYXhSZVZ4?=
 =?utf-8?B?eUNNMG5nT1VqN2M3cWRCVjh1QWtZTzBoUU9aM2dsZzBwVTFGcVhrUlRHWEhu?=
 =?utf-8?B?QnZhVlplbEc3cnBXWGJnY2pQaW51RUp6UUdrSVRJYXQ1WXpyUE1aVEQ2TmNU?=
 =?utf-8?B?WHhvWTlKbitSRGpQVUhFWFd3cCtZOXppZHM0Y0Mvb3pwY0pEYUswS1pJdHU1?=
 =?utf-8?B?VEUyNzAyOVJaWlJQTVB2bS9tck4yK0krejBKeEszaTBOV1k2bWwxNG5iZHBH?=
 =?utf-8?B?czY3dU5vWEw4N0N3QU9OVzV2aHRzZWZOTVZ1anBNRzBtS0JNRWp3eGtQdlZa?=
 =?utf-8?B?TUN5dUY2eTk4RUZ1UXVJUkMzK0ovU2hxb3FwZzFITXJKK2NnWERKNk42N2Rt?=
 =?utf-8?B?VldvU0txTEZkUTROcnpzNjErRUI3K2phWmh5UXN2R1h3RWp0Z2hCbFVwRkRN?=
 =?utf-8?B?ZnBhcVcxRGNiWUozRlAxZ1RyS1lpTXpDNjc5MWdDeUVyL2ZQaVRIR1RETXpW?=
 =?utf-8?B?ekhjSTR2dzhPRmU4QXVURzVFR09sOTlBNHROOW4wTVBMWWgxZ0lXZDlVc1N4?=
 =?utf-8?B?Ymh5Tkh4dEVPZ0tWSnVSWWIvSzFXaDJVSXRSa3dOVFVhc2FsMXN5RUUvNmI1?=
 =?utf-8?B?NFVOWnhSY0JBRVR2UlR4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXRib2JZNzlDaUxjQ2FNTW5JUHh2dkR1bUZNRTlza1NBbUw0UmFrVjVCMGRL?=
 =?utf-8?B?NGZ4T2JqYkZKQldIYmRQVzF3cUdSUnkzcjVOMlRrN20zZU1oMTdWQ0lEVmhi?=
 =?utf-8?B?Qjd4VWRPbXBmZlBEb1UvVE9mMUgwK0pDUTlybEs3NjJPemV0ZDdJdlNIVlhr?=
 =?utf-8?B?bmFsUGdGeTRQN2U3UTlLdGtOVkpJZTI3b25xYms0ajRqSDNLWDgwZ05YcU9q?=
 =?utf-8?B?ZCt0c0JMLy9GRXIwa002aUdEZGl4a1FUSnlRWHJFZlRPM2s2ckEvMlBlTS9W?=
 =?utf-8?B?SUVMeVVuRXZHZnVWV0lYS0lpMjdGWUxvdjVleHB0SEY1dklnM1lXejFMZUF5?=
 =?utf-8?B?cXRCaktBcXhFeHFFVzFQRzVXRjA5clBRZ3hHSDJIblFuQXQ3QnErbGE2dmd1?=
 =?utf-8?B?U2N2VVRVS1l6SkdpcG1mRHZHMHdDZUhqUDNPRjIvcmxYZ1NHeFZaOHpFNklS?=
 =?utf-8?B?U25GUDJuR3EwYXo0NllwZjFoZS9DQXlzVms5WVZaWVlyK0I4dU9BOU9kSkZP?=
 =?utf-8?B?UmVnTDJpUFhvWkdYYUVlTThWTlBzaE5FSVpoNVkyc0piYWtKQzg0U0ZYOUFV?=
 =?utf-8?B?T21hWVFoVVBSY25CMVF1dHNRbytyNy9oV3pEbmpQMHNIbXA1VStodFkvR1R6?=
 =?utf-8?B?Zyt3T3VVMmhGb3VlRUJObFVDKy9sb0hCT1Q2NG0yanl2UHRoc09QV1VsZUZh?=
 =?utf-8?B?RGZnUUY4NGxkN01OdC9wS09yeW90ZDdCQ05YdDBVNXpYR2FYSFZSQmhwa0dn?=
 =?utf-8?B?d3N1QUJNVjZoWXhMdFhmWUdjTFU4VE4wRW1HaU1UdjhjdXdjWkFiWmRFVDRj?=
 =?utf-8?B?bmdkNUZKQmFhaHJweHpoaGs4bUM3TDFUbjJmV3N2MmNoaDkxZzhhek1uSEN2?=
 =?utf-8?B?SktjVnlhZWgyV29DL0NOZG8xSG1GVTRjYkVtSFB5dHBlbWNKM3dHZWloMGhy?=
 =?utf-8?B?QmpEQ0lFSXFaeSs0VnUzSHB2SWRldVNwaytTRVA2azFuT1NkSExiYVJsZndq?=
 =?utf-8?B?aUtQbmRsbmFUNytZZm1Ddlhqd0JzUldiZEN5dllwbXFRODMvc2tXQmFDYWxI?=
 =?utf-8?B?TXlicTRqMVFGZjJ2bmZIZk5pdlYwSnJXZlhhMGNnWm9vMTd2Qnd3SG9ZT1do?=
 =?utf-8?B?WmZSSjJKNFlydmc2WjlYb1dpOTJuem9sSHVxZGxTaDNudTJIMWhLR1pjczd2?=
 =?utf-8?B?Q21lY244Y1BVdGU3TnFMRjArOGVkdElFT1E3c3RzbHJobUhRbmNHdm4xc0dP?=
 =?utf-8?B?eFhqRGs1dU9pRDFxeVh2VUhJdFM0bk1jM1FvaFNjMU5rRjdUT2tnQUoxcFVR?=
 =?utf-8?B?Wk5tQzAybFk2Wjd4NFI1cG5NWFgxaHlSM09QOFhjWkltMTdLY2RGMEowM01V?=
 =?utf-8?B?ZzQ5bFdFYjhJNVJuTlZmZHY4K1ZPWnA5ZkFVcG5SQXJBTVlnS2ZyczJodHhD?=
 =?utf-8?B?NHZ4WlFyc1d1QnFjN2JUc0JJVDJrRFd3OVVlVXdwQ3ZrQzZTckhYa1VycVNE?=
 =?utf-8?B?SUc1aGQ3S3FPM1hCQkprTmJTakdyQ3pBRWg3MG5zdHBsbUxra043OTdFZzVh?=
 =?utf-8?B?VjVueGwzQU1ZYmVvdzVTV0VleWZCUmNMb0gvY2NGNFIxZHo5QTZrNk05WVRw?=
 =?utf-8?B?OURPV2Q0WkdEU3FOb3JWeVVpSEhWUEJtL054Qm1NN3c5QzVBdVM3NUpOSHBM?=
 =?utf-8?B?bzhXdmZMaVRBeXhlYlc5cHd3N0V5ZzFHRTJkNG9BaFFZcEtpY0x5YlFLVDF4?=
 =?utf-8?B?MEVyM3ZCbHhjYVd4N2tZSjMzTDc3bnkrUHBVYUFXL24rTzZiaXZDb3ROZGdn?=
 =?utf-8?B?V3dNdGllR3NkNXVKQVliUk5LSUFpVWYwdmtNY3pGdXBqN1dZd1Zla0ZaSHNW?=
 =?utf-8?B?ZHcwOVR3NGVCbmp1NDB5elBuSGhQUEI4dDgvRzJ5empJd2diWWJlbGVQSHI5?=
 =?utf-8?B?eEJQb1VJM2lXWFdvd29saDJCdkFIZmJ6QTlyV2Q5alljYWoxUGpHS1lKeFpj?=
 =?utf-8?B?b0dlSStGcVZ4TUFxY2VhWHh0RCtUWnFWai8yMHJ0RFB1eUozYmhHQ003eUR5?=
 =?utf-8?B?RlFRVmJOMUplb2VWdlNyaTVnam1oWnd3UmZsT0hLUGJneU52cGt0MUJ5a2xX?=
 =?utf-8?B?NzJIMEJRNVF6bG12WENSVUJ2dG04NElUaWl5OTYxbnBMdXc5YXVFbTNadnE3?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f97f6482-cf96-40e8-c593-08dca2533312
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:15:40.3320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl6aWZARScAmjWklwsrp5AORF/hrwd072V7xAm4oy5a2VmTi40qLZoQdTchCU/FnyW/fBfF/hLLrbRg/x15MJKjG9HFVQHZHqs8x53cUC1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
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


On 12-07-2024 01:59 pm, Pranay Samala wrote:
> This test is debug logs are too much and was killed
> due to exceeding disk usage limit on the less disk
> space machines.
> 
> So dynamically reducing the debug log level to 13.
-------------------------------------------------^
Please fix this while merging the patch.

> 
> v2:
> - Using "" for the defined header file (Bhanu)
> - Not using exit handler in this file (Bhanu)
> - Not using any magic number (Bhanu)
> 
> v3:
> - Calling loglevel init functionality in lib file (Bhanu)
> - Here 2 means the log level will be reduced by 2 (Bhanu)
> 
> v4:
> - Send the required debuglevel to directly to api only if debug
>    log level is greater than 10 (Bhanu)
> 
> v5:
> - Add a check to open_params function as it may return -1
>    on failure (Bhanu)
> 
> v6:
> - Editing the check added in v5 (Bhanu)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_atomic_transition.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 29dd8ac4e..89348f435 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -34,6 +34,7 @@
>   #include "igt_rand.h"
>   #include "drmtest.h"
>   #include "sw_sync.h"
> +#include "igt_sysfs.h"
>   #include <errno.h>
>   #include <pthread.h>
>   #include <stdbool.h>
> @@ -1174,6 +1175,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int pipe_count = 0;
>   
>   	igt_fixture {
> +		int dir, current_log_level;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		kmstest_set_vt_graphics_mode();
> @@ -1185,6 +1188,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		for_each_connected_output(&data.display, output)
>   			count++;
> +
> +		dir = igt_sysfs_drm_module_params_open();
> +		if (dir >= 0) {
> +			current_log_level = igt_drm_debug_level_get(dir);
> +			close(dir);
> +
> +			if (current_log_level > 10)
> +				igt_drm_debug_level_update(10);
> +		}
>   	}
>   
>   	igt_describe("Check toggling of primary plane with vblank");
