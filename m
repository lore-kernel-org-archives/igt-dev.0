Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63651C8303F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 00:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237810E036;
	Tue, 26 Aug 2025 00:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEDx1Pkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FAF10E036
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 00:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756169913; x=1787705913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SoEn2P3e7H1hKOjbX0zfrwuzadmIZoLZzURPpvXwMD8=;
 b=cEDx1Pkw6kQm2OHMcVUw4gfIb2c+qCspnC7ASMdBZ6BXcDBdijNbmM/z
 wtv9Fxm8vdP48QTt52BB+Cp3I1Z2rqiC6IzkBZ5MdCAcbrU6aM0hc+W03
 8mUEsm8pYM9lHEe5VEHStRGUmOlMBRU6Z/MzthcJk/ecKTUop/TbJqw3B
 FU0oG8FNOW2aCZuXm3OXB4JY33ZQyb7zalZsK+HksHJZu6kwlCkMx06YM
 +zV41jW8tngs1WZ4UwcagJSriJ11os7h3cKaLbr7nKGpwNowv+1zrCk53
 Zxr6xU8jdFSnjztC3/cXZYGQpx27yxgkGBhn8j80cA+G51+sApjbCGNa4 w==;
X-CSE-ConnectionGUID: 0CDrEibjTVGNnvcjQ1p+AA==
X-CSE-MsgGUID: ++qNwwhPSZqWmERkzuR1kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62210209"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62210209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:58:32 -0700
X-CSE-ConnectionGUID: MYAHtsFtRUucXH80GAb3SA==
X-CSE-MsgGUID: YWF/FRv9Qpulh3OycNLzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174709250"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:58:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:58:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 17:58:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkU2IL+/tZdOTwU4QYtI3WAx4qjKCQgA99Ml2nKaElyXgVaQ4W2ZBmNFckuQhnTQitGv8XM4Fi1Cj2pT2Btn0sQHUBgOiowo2P3nBXjYtYklMpCCr1N9qJaYWI4H3OgiuhVKLz02vTZ6Htfcowvio0bcSHQRJRxp3Xwrs56RY/BGs+e9JqrdtI+hwSaONfN5VZy1I28gXcEJk4a4C5j4X/BzNcH0Gj6P84XFrsOqjHcLG5b/+zBqTU/btcHXnwJ8HC4M/kwsOTO0aE+hybvBoNB4u03lv29C8CVrlt6QBGf4f0oNH2qJQeTA2UFSj9cOqvsCdnAYrsRCTmyCGzZ0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNcKZy680Fam/ta7ryY/V+AQbE/9TwHKY2jnPDohnMU=;
 b=nsNeLOev6ovspdaW+dNjg+AVW8BJJhYBttTfeRaz7MqscbAtBHe3k71xatE1T8Ljud85ETSxJwpPJwqV+rL0XlaF8dVcawZDgcq1EcYbCtufmkyDAP5v3hLcNWaz37yIMpGP+nvlvwk3AUtwDBouKHNS7c+D7NG6h/Al4GLj3T4lgAE0lFJgCMDpdUJo0J+V9CC02ySAsmTjHwQ+qDXkWOkTnJoxEQwp04yhb6eMsXuczr1abeQ2RG5AzrA7gnwww93F4yUa3t2Y4fUg8fxJneZvQ1JMp+Ha6f7ZewnaP652QxVk6Oob2ZBByzNzRAZ80F2rkVebgkDQkJoBTgP2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ5PPF0D43D62C4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 00:58:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 00:58:28 +0000
Date: Mon, 25 Aug 2025 17:58:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_oa: Add a test for tail address
 wrap
Message-ID: <aK0Gn6KESmBM0iKi@unerlige-desk.amr.corp.intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
 <20250823003401.109978-9-umesh.nerlige.ramappa@intel.com>
 <87jz2rmg7a.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87jz2rmg7a.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ5PPF0D43D62C4:EE_
X-MS-Office365-Filtering-Correlation-Id: 460c6d75-ddc5-4ec8-c560-08dde43bab73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azhHVENpelRMdm42OUcyemdlbWc4Titld3Z5ZzcrWUJQZHVDQVUrTWtWSkRu?=
 =?utf-8?B?V3AwYlJBL0RrT1hRS0RZY0p3eTF0Zmo3K29PWmxnT3o1WktmbnIvQUtlb3M2?=
 =?utf-8?B?VzVkRERHSS9aS2tBc1pDVTZ4WmxEcGl2cEttSmt3M2o4RFpUUUw3aE9rendC?=
 =?utf-8?B?RGZub3JSQm4xZVBoZXNOOFlTc2pOZ0RNQnJiTWl6ZjdXTzdqKzJpcHJNdVJV?=
 =?utf-8?B?SzYwSmtQTFhJajRQdWpqcEQvN2lKVmRKTU1CVm15eFFnNGR0Q2w0SWZ5UnVO?=
 =?utf-8?B?aXFxSW1pR2JUSW1saDBqZlM1aDFjOEx0c3dXNDM2Q1JhVU12emZ1eS84ckEw?=
 =?utf-8?B?NzBSMm9zYjlVT2VFTmlQZGxxdWVwVXd5QUZtbGtaWXR5ZW5aWDB6eVlveEpk?=
 =?utf-8?B?aW54REJva0F6STNWU0FOMHV4SnFta3l5c0pPQWZLZzljdncyWFIzaHdRZDND?=
 =?utf-8?B?Q2dpMVdYNnIzNTZTdnZDaG1tZVl2QWZVQS9IZFRZTkYxRXBTVTU2M2lvTDBr?=
 =?utf-8?B?RVVFckNRSWZ1Ukd2TU1FWlJsQW9TT1pTOWRLTTlLaFpObU9DNUdPTk53dkxJ?=
 =?utf-8?B?N0RTL0lJL1NNME5VeTRONDZHVzExU056ZXJnSGFZZW1wVVdJYlNUQ3RXelEr?=
 =?utf-8?B?QTJVeTZOaUJCZE9nTXBCRWpIVDNzSnJPTTVhalpQT3VLZ0g5djIxWXZhN0h4?=
 =?utf-8?B?UW14Q3l5akJzQ0JIVHFxTDdDTlpOSVNrSVhSa25ORDZlYjdWem9lcTlsKzJh?=
 =?utf-8?B?Wk9ENTNhWWg3b1NHQ0dKQmtYR0JDdC9NT0F0cFgyT0ZtVXJkeWpyK2I4YjF5?=
 =?utf-8?B?cE5sQmZWeCtuZDhDN0FMcmxFZHVHU1dJVjJLTUNwVm1zL2hvNFprUk9oSkZU?=
 =?utf-8?B?MUpBM3ZTODRUZHI3VDhabVkyYzZ6Q2RwbG0wUFhLcll0ejVJWER4K2c5NFA2?=
 =?utf-8?B?TXRJOFhUMC9Rc2UzejR3Q0dlazZhczdKUnVHNDJQSGJhZWU5UzBPam95UEh3?=
 =?utf-8?B?N1BqOVg2NHpFdlQ1YmphYTZzU1l1dHFtdHFOb2hFMlEyRE8vK2k2MFEyL3dW?=
 =?utf-8?B?ZG9BdjNkc0d5QU4vMWdHYWNGUjdBK1dBZlJWa21JVldmVEl3dXh5SktXMUFk?=
 =?utf-8?B?dXBpSlVYVzJsRGduWnZPM3hGNklEOHU5UDVFc3F6QkxtREd3SE9wMFBPcnJN?=
 =?utf-8?B?bkQ1Q2VuRC9NOEZHcmFNSldETVdhOENmL0FXKzhJb3lldmRNQW51RUl1Nmg1?=
 =?utf-8?B?Z0Z2bFZUY2JBZ1I4cVM5dXplblEvL3BheHZLeWtPV09XZ3hzVXdPbXVLYlly?=
 =?utf-8?B?UzlxSHNWWW11a0FxTlJKMWNJOUFuL3VsOW4zN2NBa0ludjE2MnNZdVB4Sjg0?=
 =?utf-8?B?S1RCS2c1WWtpVk44blNHdWNQMExzditpNGUyYkd4RHhtK1l5MzhnNWFuRzF2?=
 =?utf-8?B?enhsMEdabVBOVitMRXl6NGlVR0FhNWdOVlFnSEFTY0ZmS01lbXdOUWtNbUpN?=
 =?utf-8?B?dzI5cXk5Ylk3UXllVmlDb09GMEZ4c2wreHAveVFDRnZuZ1Zsb2h6MlVxdjh1?=
 =?utf-8?B?bnplSlg0WElteEYwMnV3akNHMlo4YUpwT0dIbEF3UTlERkNLT3RXNFBRUWFT?=
 =?utf-8?B?ZG5tejB6ODlseERIay9JU0M1WWc0b0hWcmRORDBPTTlTUlVCb0xLQXM3dTNQ?=
 =?utf-8?B?UThPL0pPaDZ4bWJDeHVGRzFHd0k3cUY5RUlMNVlTaEtJZUw0SzgxaG1wSTQx?=
 =?utf-8?B?ZFpzLzJHSVdJeUdaVjB0RGpWb2FNemplSXNsN1lzMnk4eEUwVUtnNi9nRHVS?=
 =?utf-8?B?KzlmVzdNVFlhL1pobDkxMUJKTE1Pam1zVFRoSFBnR2o5UTROeUF3WEJ1N0Yx?=
 =?utf-8?B?UmV1S1A5ajFOWTBoQWNYNThyS1BQcHlvbEE5V0dCa3N3N29XYnRrSGx5Rk9z?=
 =?utf-8?Q?P5TyTzrl5Sg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFGcmNvbHRKMEkxdFZaY0dkV0VIWk92SHNJYi9ENnNXb2ZISE01aVU1QWdP?=
 =?utf-8?B?SWszdTE4OWxseEZ2Z2YzM3A0NHBQMzlFYjUwTEVuVHFybG1xbkdGdGhIc0VC?=
 =?utf-8?B?NUZnU0cwR1hxNUxnUzJLTFpqcnk2eCt2WFRGNjBmU2lLeE9sRmNPRUg1eTNk?=
 =?utf-8?B?blFRc1Y0Z1VaYkV4aHMxbnJHMFdMdTVtSFZmeVNmTXQ5WlN0VlAreFIvS0Q1?=
 =?utf-8?B?eVI1R0ZXRHB3T3ZqRDJ5OWM2VC9xOU5Va29VNXVQZlQrVnV5ekU1azBOblFv?=
 =?utf-8?B?ckZCK3ErcUxsampZRDVSYUcycmI3U2YwN3BqU0tvZ3RTN3U5cGpiQ0NCRWk3?=
 =?utf-8?B?TDMxQ2Mwa3lLQVBTZlJJN3pzY0d4bmk0dnM0VzhBZllrSGl1NHMraG5RMmhX?=
 =?utf-8?B?K0FSc1dGM2JQa0dWOEJGZTh1WEhkWUZwMUxTQXRMbjNUaVo3U0ltalBFR3p6?=
 =?utf-8?B?ZE5aVEFSWGdUUGpyWktrcUNlNUlkam1JN21HTGd1a3owcXVBRFlqVmZRNEYw?=
 =?utf-8?B?UG8zeGJURkgrdHBBeUVMWWRNRE5NV2Q2SkE0VUZMSGI1QXBNV3FaZE1NR1Bs?=
 =?utf-8?B?dkJqUnVrNXp0MlhyMFluOHhhdXRQMW80WnhOOVNIRnkzbDJKck1PNGQxV0RX?=
 =?utf-8?B?ZXYxNTJkeUNYRGNTMGdKMk1qTGZPTFpLQk5SMFRlVDVoM2thYXlrNUFoS2xF?=
 =?utf-8?B?ZGJZMCtSbDROcnRVK2xSZHg1aVpUaGJSVkpWQ25LQXJsRkNWM2V4WnZoeWNl?=
 =?utf-8?B?eHBsZEJaNndDRUZaTVlLTTlpaXYrUUlFN0hMa0pFYW1SOUIyVkdGL3ptTThV?=
 =?utf-8?B?VE5xbjNjL2lGeDZHbUtpZWhaaVltOUtCL3hyTCtWSHZuS3ZPdHQ2SHdZUU1s?=
 =?utf-8?B?SU1hTnplci9jRjgzbGNsMno2QlRaL0FZcE5IT28xbWNXYWhYaHlkVjBYMDdj?=
 =?utf-8?B?dGh5eFFQa2x2ZWwrUXFnSUVKUEFIcmc4Ym1PMHdMRDJkSy9lZXZqby9VS1Y5?=
 =?utf-8?B?eG1IS0tHQ0NwTXdGL1UrdWVYV2d2SzA5VG5TK1AvZ1prczUrd1BPdU92d0I0?=
 =?utf-8?B?WjVOM2M0bW9MMk1xbHRxMXhkNW5oS0JXV01ZekxRendub0RVZ21PQTlFdjlD?=
 =?utf-8?B?ZHpVellNMXN0VUFYVXpoR1VFN3NsV0FIMzdSbEloekVYU1B6UzNYVzRrM0RM?=
 =?utf-8?B?c1dlTmtUaTBZd0hjWUVmVEVzcFB6R3YxaHJHdXovZGQ5VWNRS2o2MWp0OFZs?=
 =?utf-8?B?L0dORE9sSGw5bUpTNVgvaHhqa3BQVGM2Tk5WZ0lTelZBU3RWMkFQNFMwS25T?=
 =?utf-8?B?cEFqYmRMT1pFaDBxbzgyMVlFc2xacXhZMzcrNFRPV0JYcGFoTUdLNjRkMnoz?=
 =?utf-8?B?M2pWVjVnK3gwY0YyVnBib3pzTnUyRWZZd0tQWElnVmpmcFk3UXRBUGRqZ0JO?=
 =?utf-8?B?aXhvdFRhUmJjTUNOK2ZBYUozMnBNZ1BZenEwTk9xWXgrMGR1M2VOOHdOZ01y?=
 =?utf-8?B?eVY2V2drcWVZLzhycURnWG1tc1REU0FHTVVKdHllVmZOTFFLYkU3NytPVlFB?=
 =?utf-8?B?QVpzbVUzRVFJeEkydkdibGVqSStOczdDdmUvUTFtN2RFRk5CM05QT3Z0V25r?=
 =?utf-8?B?QWF3RkZuWUYzQ01lS1IwMmIwM0J6Z1FlektucE96N2VCbFRlTmg4cUF2VERQ?=
 =?utf-8?B?aG5KalgrZlBDeDRVeGtHanJ3bEdVUE14U3gxS3Yzb1ZlTG5EM0dkT1UxQUdw?=
 =?utf-8?B?Y21qNERhTE1ZVU5jWWFnSFVpY0ZTWHBFZndDNDFreXJpZGt3ZnRJalgycVdz?=
 =?utf-8?B?TEtCQ2xBdmVqWmhhNmZ3b0tReGcwQzFZNWg2T2FFNmdVWndkZWlPNGh4WmIr?=
 =?utf-8?B?VXA0SUtXZEM4b1ROcDhXMlpzTEhrOTNsTjJwajc2RGZNRWhtTXM5R0RheWp1?=
 =?utf-8?B?MkRWbndSTG9tZnpIZGQzOGhXY2NNWm4vOXB3SDJxSmpMTVhibXJ3L1BOZmNV?=
 =?utf-8?B?dHRrYkkxbjMrK2pDdmFFRHF2TmQrNUk1NjhBRlg2TEJGTU1lZlN4NlRYVFhD?=
 =?utf-8?B?c2JDWm1CNDRiaUdZaEI4UTVBV2ZEWk5zb29sTWkrNllsSGppRnBvSjZKeGRG?=
 =?utf-8?B?T1Z2clo0QkZsVTJxbUd6RzljeC80OUE4NnlOTGhmbVdQWnBsOW1QK2FPUFh3?=
 =?utf-8?Q?w5vUYiKvmYiynjoF8s/h8os=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460c6d75-ddc5-4ec8-c560-08dde43bab73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:58:28.8910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8vhTlvRmfYMc9OJe06NCHM2fdrsdVIbUUhZ7nyjMgM14Hx3+HuKL8xj8PKvRWHVsFndOOMWhz0fju1OXYrJg4XhbEBe3W15HtMpId+mwPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D43D62C4
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

On Mon, Aug 25, 2025 at 11:03:37AM -0700, Dixit, Ashutosh wrote:
>On Fri, 22 Aug 2025 17:34:05 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>OK good to add such as test, previously tail address wrap was only tested
>indirectly, e.g. by report headers being incorrect. But with multiple
>problems such as report sizes being wrong for different formats, a specific
>test for tail address wrap is good to have.
>
>> Add a test to verify that the HW wraps to start of the OA buffer when a
>> report does not fit in the remaining space in the buffer.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 745f364e52e9..7381e7b9bd44 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4535,6 +4535,76 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
>>	try_invalid_access(vaddr);
>>  }
>>
>> +/**
>> + * SUBTEST: tail-address-wrap
>> + * Description: Test tail address wrap on odd format sizes. Ensure that the
>> + * format size is not a power of 2. This means that the last report will not be
>> + * broken down across the OA buffer end. Instead it will be written to the
>> + * beginning of the OA buffer. We will check the end of the buffer to ensure it
>> + * has zeroes in it.
>> + */
>> +static void
>> +test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe)
>> +{
>> +#define TIMER_PERIOD_US 20
>
>Let's not call this "TIMER_PERIOD", something like ADDR_WRAP_US etc.
>

It's actually OA EXPONENT PERIOD, so I called it timer period. Reports 
are being generated at 20us intervals.

>> +	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>> +	uint64_t exponent = max_oa_exponent_for_period_lte(TIMER_PERIOD_US * 1000);
>> +	uint64_t fmt = test_set->perf_oa_format;
>> +	uint64_t properties[] = {
>> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>> +		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>> +		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_fill_size,
>> +	};
>> +	struct intel_xe_oa_open_prop param = {
>> +		.num_properties = ARRAY_SIZE(properties) / 2,
>> +		.properties_ptr = to_user_pointer(properties),
>> +	};
>> +	uint32_t fmt_size = get_oa_format(fmt).size;
>> +	uint32_t fit_reports = buffer_fill_size / fmt_size;
>> +	uint32_t wrap_offset = (fit_reports * fmt_size) >> 2;
>> +	uint32_t end_offset = buffer_fill_size >> 2;
>> +	uint32_t *report, *zero_area, *buffer_end;
>> +	void *buffer_start;
>> +	int i, tolerance = 10;
>> +
>> +	igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>> +
>> +	/* Ensure report does not fit */
>> +	igt_require(wrap_offset < end_offset);
>> +
>> +	/* mmap the buffer */
>> +	stream_fd = __perf_open(drm_fd, &param, false);
>> +	buffer_start = mmap(0, buffer_fill_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>> +	igt_assert(buffer_start);
>> +
>> +	/* Wait for reports to fill the buffer with some tolerance */
>> +	report = buffer_start;
>> +	for (i = 0; fit_reports && i < fit_reports + tolerance; i++) {
>
>Since fit_reports is decreasing below and i is increasing, looks like this
>loop will exit when OA buffer is half full? Maybe that is why the test is
>always passing? Tolerance is not making much sense either since it will
>make the report pointer go over the OA buffer? So we need to simplify the
>loop.

Yikes, bad programming... Cannot use fit_reports that is decrementing in 
the loop check.

Tolerance is intentional. I want the reports to go over the fit_report 
value so that I can ensure that the HW did not write to the region in 
the end of the buffer where the report does not fit. Technically, a 
tolerance of 1 is good enough.

>
>Maybe we can add an argument to mmap_wait_for_periodic_reports() to also
>count all reports, so make the function work for both periodic and
>non-periodic reports and use it here?

Yeah, a possibility.

>
>So wait for the buffer to first fill once and once that happens wait for it
>to completely fill again (maybe even more than once). Something like
>that. But maybe will need to zero out the buffer for
>mmap_wait_for_periodic_reports() which probably is not allowed by the
>kernel.

No, I am just wanting to fill the buffer once and then wait for at least 
one additional report to land in the buffer. However, like you said, 
mmap mode will not clear the buffer header, so we don't know if a new 
report landed. So I am just using a 10 * TIMER_PERIOD_US delay to let 
that happen.

>So anyway, need some way to figure out if the buffer is filled
>again, like read the tail pointer. Or go back to verifying OA packet
>headers...


Maybe this:

We could stop the OA capture, read out the entire buffer + a tolreance 
amount of reports. Ensure all reports are valid, Then we check this 
region to make sure it's all zeroes.

>
>> +		usleep(TIMER_PERIOD_US);
>> +		if (*report && oa_timestamp(report, fmt)) {
>> +			fit_reports--;
>> +			report += (fmt_size >> 2);
>> +		}
>> +	}
>> +
>> +	/* Let some reports land in the start of the buffer */
>> +	usleep(tolerance * TIMER_PERIOD_US);
>
>My preference is to not use direct usleep's since it breaks in different
>environments (sim etc.), see comments above. We've eliminated several such
>things in Xe OA IGT's previously iirc.
>
>Maybe separate out this patch so that the other patches can get merged
>first?

Will post others first, but anyways wanted to get your feedback on this 
and looks like it has a glaring bug.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
>
>> +
>> +	zero_area = (uint32_t *)buffer_start + wrap_offset;
>> +	buffer_end = (uint32_t *)buffer_start + end_offset;
>> +
>> +	/* Ensure HW did not write to this area */
>> +	while (zero_area < buffer_end)
>> +		igt_assert_eq(*zero_area++, 0);
>> +
>> +	munmap(buffer_start, buffer_fill_size);
>> +	__perf_close(stream_fd);
>> +}
>> +
>>  /**
>>   * SUBTEST: map-oa-buffer
>>   * Description: Verify mapping of oa buffer
>> @@ -5091,6 +5161,10 @@ igt_main
>>		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
>>			__for_one_hwe_in_oag(hwe)
>>				closed_fd_and_unmapped_access(hwe);
>> +
>> +		igt_subtest_with_dynamic("tail-address-wrap")
>> +			__for_one_hwe_in_oag(hwe)
>> +				test_tail_address_wrap(hwe);
>>	}
>>
>>	igt_subtest_group {
>> --
>> 2.43.0
>>
