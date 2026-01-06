Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D27CD0431
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 03:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C132A10E2EA;
	Tue,  6 Jan 2026 03:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgHjBTH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB7F10E2EA
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 03:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767669094; x=1799205094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4TWRaa4eth2iaFydLpCdL4RnpQVv8ukVnJylF7uYoC0=;
 b=fgHjBTH3E3eTp59hTileMmyQUS4g7YImxEfICkaoY9IvBukE2Iw+hUQu
 AKNfplxzH7ISvP3eAv75Swu6H4Kr2EF6WuPzrgjcefZXfeN4WaAGe/f3Y
 XiVGj0L+dvxB3WywdGXbYOugKGuJoURXkORadKnu6rfE1e2WxWTk9PY4/
 eYByY+7crjHoiwPl6FjnWDUVo6TA0zKQMMG0XFDv9+ZnxSqgYvfhIe8xe
 7z5we7akVZftr3Kji8oAPlMVeOz31n1fdk2T3UwY7fkRmI0wIpf7ai7DR
 S15di8/3WjXTERQOYYm2BIDirfI3xoCvcM4R4/0c5P3+IP+kx0UHp+uN2 g==;
X-CSE-ConnectionGUID: YQiqZ6bGTrC9R3D2MJetcQ==
X-CSE-MsgGUID: UFBL1yvKQAWpdDm+ahAkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79671860"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="79671860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 19:11:33 -0800
X-CSE-ConnectionGUID: aSqywrUxQsKjT2SHHSoftQ==
X-CSE-MsgGUID: WNud+Lm7R4G4qmcyKoB2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202790480"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 19:11:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:11:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 19:11:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:11:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oO9gVU3Z/fqGSALST+I4HWIl3Z5vy0lwbHZPpR/JA8HCp8SzyRisCBJOFxyKb6pIf5aPnrlhB7NPg6EobQOUbbn/VHHEc94F9b5LmcwCpXntdalxM9HldCbGGtakHbnD3suIdspwuw0bPBGZ+w7j0zlgUVHQQDgYAs23sCqGG5IsIzbf2xfq6LNd+ULwfIivhuET80G1p5Wk69LBkJKigHqyjmzzBw63WS2/KuTOfycFmPoY7g7VUSeHhpnZ8da5mYY3fq7/IIWxB8oXlyQeNsniJXRlWJNCw+u5m5UkjF3TnSYgLG75MzqlAPIN6Nz5JifEtrRbKVW6VxJRTpPYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T+XJjqMHqmbAW/F9X36z30qe+gvUSEh3fPJhibRtq4=;
 b=WSPecsye7H03ZJG9xEoM2kJCdJdUiF1gmRKrUh+Op4vHZAHTtgHc1iIHICj5VuTsS0mWOACsIEHD+xU/fCQtx++oWfo2HyyoXoI0r3VYuFh4ItZ1bKkPEyKgX89Gd2NT+9yeha+C9YpTfK6HU6UWeXvNulye2WGsoIqTs8lG6ocCyniXZWzZleki5AgHfB3vurs4aW+xyij2991YOLptYHLDbcwdvCrm4wPOPIBPLLJYKlECghmTvnMh/Pm0HtNoms39mawjHrdDAeCO+uKtVEZLVzJ0tRxM+JDX277vmUmSWC8bB1zd6L8nN/UaxcPOacIc1jZ6b2ufRCFbrwY4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 03:11:26 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:11:25 +0000
Message-ID: <dd311df3-b758-4881-820b-7e7ea1166510@intel.com>
Date: Tue, 6 Jan 2026 08:41:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update LNL/PTL display blocklist
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20260105084103.27898-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260105084103.27898-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::9) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: db25ede4-be64-4227-c3ab-08de4cd14680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlFydEVhbW5kZnRFK1hpWXpIS0ZCcGlpTUIrMmkwci9kOHNnTThuOTg4d0Q1?=
 =?utf-8?B?S2Q4MUF1Q21yMVZoUUF2Skp5R3RldHdJZkVFMm5qSFU3MHlsUUljVWgzT1da?=
 =?utf-8?B?ZFJXc3NOdDZrbXZIRXNSYXhuZFdQRzkwa05EZFZ1SmIzMlpaU09oVkxsL3M5?=
 =?utf-8?B?K09sQytFdTVidXJMdmorTnEzVWltK25YWnNici95a1VFblVKUEdHWlljdU5H?=
 =?utf-8?B?VjJQTG0wWkhPaXVCaERZejNKTkgyckxwdk5DaTRQSVJLSC90WStoT0pqaFFD?=
 =?utf-8?B?c3FNdnNYTmI4T0dxWXFhVHJrWSsxYzhJM1VGVXZhQWNvdzBZVkNxcE9tZHFM?=
 =?utf-8?B?TWpxYlh1OFBaZGRsTmVTdkd4bG4wN2hMYkwwWkJrczhuSlZTV3JsUFJlM3hC?=
 =?utf-8?B?QzVlK1NqaU53dE1XWDBOSVJjV0JFLy9WS05nMTRDWXVkZzlMZExoZlBEejdN?=
 =?utf-8?B?aGtJZGJTQS9SalZmWUNhbXg0dEFvcUZ1ZGRjVE5URjA5dERrN2xjR21kTzZ2?=
 =?utf-8?B?cllkZU9LNytHSXFiTjE2UVd0Q0htQXdEb3h6aUhyVHhWU2RVZWlPWHp6S0Zh?=
 =?utf-8?B?Wm0ybklYWHB5RVp3eUhaOEJaSTk2ei9PK3BnS3VYeTRmWnVOaHQyODg5R2pO?=
 =?utf-8?B?S011ZUVCTlhVTkUxUXBGUVVBR1phdW1Rd3o0OW9RT0lOakJoM3ZsK0t5RlNI?=
 =?utf-8?B?ZkZSdHZGYzBYbE1pR2ZHTlVKVGN4K3ViT3IrL1AxS0hrVlBMMXV2ZTUxQVFx?=
 =?utf-8?B?S21kc25IZVY2UFZEdmxOUVZNdVlMTFYzanArYWpacGFxWFZIOWtULzZWcEhx?=
 =?utf-8?B?MFpEQWtBeUhnUHVXUzFzRXNzSmsxenVkUncxOG4xMVF1U0ttV1EzMEF6anRX?=
 =?utf-8?B?S2pSZ0FEWVVKREFaY1h2Uld1RjBQZCtianhoM2VEazJWRkhKNmQ3NkFqOWh4?=
 =?utf-8?B?ZnZ3ZnBrUXZMc0dXWDEvNlZCMDhkWWg4anpoSW4zY0ZMY3hiem5zNmd2dURN?=
 =?utf-8?B?SGlaNUJLM3VaRmw4MUtDWUUxSHgzMHhhTkx1NGxraFN5Mmx4b0N6ZU05QWhi?=
 =?utf-8?B?bWdEcTJBNnY1VXR2RUt0UGZWWTN1T0VlK05nek52c2YzcHZTMENBRUJUbE5z?=
 =?utf-8?B?OXdRVCtSYkNSY2xCSFMyRktKalNYQjR6RHV1RU1MMitHSzYwckcvSFdQMk1Y?=
 =?utf-8?B?UmN0Q09qWHhkc3k5UlRLWnJBOXJYVmc0T1dYYk0xZDRsOGR0V1NrVXJDMUx0?=
 =?utf-8?B?MmNSdmR4RjRLOFlIR2EvejU3aE12QUhWR2RodHhPd2Y1VGNGWTRqekRuekZk?=
 =?utf-8?B?STEraFNYenBubGVVZ3lLWVFTVkFubXpWMUxiZWVQZjQxRXQybXB6TW9xVmIy?=
 =?utf-8?B?M3BxQnVnUFVjdzE5UUMxVStWOFdSZzNVbmF5ZnY4REFOa2FKaHN5SWw0bjNV?=
 =?utf-8?B?MXdUYVhtL0VtbTR1U3oyWkNNZldkb0srbWgzR0IvbExzdGRXUDJScFU1TVkz?=
 =?utf-8?B?ZTk0b0p4NGptOExxeW1IdFY3dTMvaktRN1hnU2tQVmhTYjZ1clkzQW5EWThp?=
 =?utf-8?B?bm0reWt3T3c0WURyLy9VaWhUQndRcU4zRW9WTjBFUTFtR3RXNDQ2bmlJV3BF?=
 =?utf-8?B?b01KL2dHb1R3SnBzMjdlZ09ES3dPSTJLZTRleVZPaVpNSGpleEZPYjFwU2kv?=
 =?utf-8?B?dzFlYlM4OHZTbFJXb1d6WGRzS2txdDVkOHREMGtQeXZGcmltc2dnRUJzOW5r?=
 =?utf-8?B?elpxRHRZM25aNUNXNVRYWWdrMVZKb3E2bmhRbXRqYVhyRkoxZlFsNDBlaXRM?=
 =?utf-8?B?ZEgxekhuZkY4M2hTckN5RlJmei84WFdmamRwS3RZYXoxMHdGcGg3b3VwQ05z?=
 =?utf-8?B?bmVndU9INC8yckgveWQwemlMazlXdi9KTk9KaHprbE5MYnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1AzR3NJVXRnYndzU0hBLy9RMHIyanZDOGhXdTcxV0x1NWdtZytDb2ZkSU9i?=
 =?utf-8?B?YWhKRVp5cmc5dzI0RWc3dkVYM2NSWDZLT1B3am8rS2h1blBqSUNGRFZWMGR3?=
 =?utf-8?B?ckRacTRmQmNiRjVYUUlhUjZMWVVaV0h1ZGJKL1RjUzBoWEdMZHNtN0R3SFI1?=
 =?utf-8?B?T3lqZDFSYjNxdjJmSWdEbTNoS2FobzIzZlJDbU9qSDBzMlh3Y3RlSGNvZWxB?=
 =?utf-8?B?UlpNZitvWWJYcmVHcGg4OFIraU1QaXErb290VThLdWR6OFM5ZHhNaGNmM3p1?=
 =?utf-8?B?ek03UnU3VXBDQXd4UERJc3d0bVpITytxRWxnRUo1N1dRYVZNQ09OZjBIQm1M?=
 =?utf-8?B?QmROY1doUzIyalR2TTR1K3JubUt2UWtnVTQrYnVTMHFPdUljMnpISThGWXlQ?=
 =?utf-8?B?TUhRTDZTeGNaYnRBc3huZG5QWjBPd2ozZEIzWjBDTW41L1J5L0k3ZFFrMTQy?=
 =?utf-8?B?VENWSXJXcGp1YUVONXhuckx0L2Z0TzNRT2FxRHdVZXo0bzQydDNBVDlQZ0tv?=
 =?utf-8?B?MThnQW43aUJpbEdndGZKNWxRWUxXU241djZWTWd6RSthU2xrUDk3WEZ6WVFG?=
 =?utf-8?B?SHphRy9vYk54VzhvVUdRcDZmWGFMOE5iT2xKN28wTVkvNGFEOGJjTlVkelE0?=
 =?utf-8?B?cjIrTnp4c01KODBaK3NLTUphMFhPMWNidjF1ZmFJR01UdnRERE53MEdGN0pC?=
 =?utf-8?B?bmlmVmE5R2VXME42VkJMN0dEV3ZBVEYrd2RTc3dCc2E1VjJGd3FkK1JkZ05t?=
 =?utf-8?B?MGJTcHVPaEx3SDg1L2lWMzFTSHk5Nk9pZThkeVNyVS9MYXI2VDRzMEhmTXlN?=
 =?utf-8?B?SDc5NU0zTy9rNUhLeDBZdlJyRUJUTkxBWlFXSitmVGhHbCtzbzh3UllFSzMy?=
 =?utf-8?B?azdjMGs2K0dnTWk2ZlFFMWtPakdRdVRKUmdXK1VocHdDRHExbTZHS0ZjNUlV?=
 =?utf-8?B?Mm1qSjJaUFVpTDBTWUJZQUUyQ2F0dVVvSk5BQ1Z4S2hrN0hYR29tUXpHK2tM?=
 =?utf-8?B?TSt3VCtYdk5pMTdSY0RXQ2xJckhFT1I1NzVCeGVzeVRmeHdlMU1LNGszZERj?=
 =?utf-8?B?SW90R0pOQjR1VGFQT3pFYVpUdW1Iclh0Q1p5ZVdYekZvMVlLQ1o0MDZRb2xt?=
 =?utf-8?B?ZHlPNTYxcnQ1T2tiRVBHa0pDbi9MdWkxTjdncUpjOVlCVVdGVVVOdGU3UWFZ?=
 =?utf-8?B?NkxhWlVsc1pkNGlJQ0dFTmVFUE9CVDBDNWRCZXErTE0yWTJUSUdUeHBOcHcv?=
 =?utf-8?B?bnk1TW9qZ0g1ZUtlaVZEckJXWDdrRHFETThCSUlLK3dqQytHdXJhaVJva0V5?=
 =?utf-8?B?NHFPem9USWdobXFHVmNHQ04ydHROTTl5VHdjcjhQMEZ2VlVxOGJRRjJBMFM3?=
 =?utf-8?B?WDJranl3N2NaR0xta1dkMUlzREtFMzVpT0xJOS9ROWJMa2RWbThYRll1WWhT?=
 =?utf-8?B?T0xUelc4WTR6UCt6d3dZR29kOFhxOTN0bkZicG92emFROFlKYnFMY1NYeGNr?=
 =?utf-8?B?bkpFNDNvSWlPb3ZRcGpVMmFha1ZNSjNaQjMvQ25uQ1FXNldiN1VwUHZCd1R2?=
 =?utf-8?B?UlE3MzBSdklSQVRvZjc5TmYrRmFaaWlNSnpPdHRNSlVNYWI5Wk9pa3hCTWpD?=
 =?utf-8?B?NVVvOGt0SWdPdzBCaHRpVFlodG9EbXpiOHoyaWJOSXJoNnUyKzZ1MDIvc2dN?=
 =?utf-8?B?VThiVk5QRlNIOVVZYzhHNCtuOFdwVjdOYUpvcFVRZE56SkhnaVI0Q2FIVm1J?=
 =?utf-8?B?QUxKT3VybXBwaVFTVUVDTUR4bkMzMVorQm5SMW4wUUMvN2lsRUQ0bFJoZ1BJ?=
 =?utf-8?B?clAzZGIvaEo2UnhiQkF4YXRQMlgyK1FpYjBzckY2OU5iaWM1RExwZUVSOWcx?=
 =?utf-8?B?eERaeTlocW1TTEVMTWRHRitjQnRabzRINnZ2VUJmZlB4RThFK3RQV25mZUMx?=
 =?utf-8?B?ZS9PeFlDSmM0aFYvV1pQdUpFblU5ZVpFRW1lZ1V6Zk5UdTN1bUFCVUlmSGdp?=
 =?utf-8?B?QTQ2d0wzeW45S1c2b2tnaE9SQWNHOXMwbnNlNVJNMWM0aGQ1SnlCL0d2N21v?=
 =?utf-8?B?QU5NUkhSMnoxS3FXbW5qT2YvWEVPMXdiTHRVUGwwbzQzQlZDQUZEWllQVkpw?=
 =?utf-8?B?UkVHbzJQYmlXMTVxTkwxMDZaeVhvYTdhMzY0THF0c1VUcUdtc2k4YUJOc1Vk?=
 =?utf-8?B?N1VGQ1JPTjQvS1NDc1lXcjRPWktYVVUvd2tJNTZSR2NSbitRSk00NXRGK0w3?=
 =?utf-8?B?NURvclVDMHU2RHFwblBBbzBqM1A2dHpaMVFCMEpZZ3RKS3VBSFZmZnhjbTNo?=
 =?utf-8?B?ekZTTXBGYkErdEdqT1IrQ0JZdEtoTXVsNjFIeGJIbVN6eWQ5RGZxUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db25ede4-be64-4227-c3ab-08de4cd14680
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:11:25.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbmNQyFYVPJGDQ5dLrV1EW2h720jlqSqEkSaaL63WBmNM1SzPkCy7D9G6HMllBr1HJM/JHPc54m8dLROC9xnNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

Could you please squash this patch with the existing blocklist update 
patch(https://patchwork.freedesktop.org/series/159623/) which we've 
rb'ed and waiting for merge. Changes itself LGTM, so you keep my rb on 
the squashed patch and we can get that one merged.

Thanks and Regards,
Karthik.B.S

On 1/5/2026 2:11 PM, Jeevan B wrote:
> Add kms_pm_rpm@package-g7 subtest as it's not supported on igfx.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 5 +++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 5 +++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index cd1e6d19c..830fec241 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -173,3 +173,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
>   igt@kms_vrr@seamless-rr-switch-vrr
>   igt@kms_dirtyfb@drrs-dirtyfb-ioctl
>   igt@kms_frontbuffer_tracking@.*drrs.*
> +#########################################
> +# Valid Skip : Not supported on igfx
> +#########################################
> +igt@kms_pm_rpm@package-g7
> +#########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 27261fa00..ba784140e 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -172,3 +172,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
>   igt@kms_vrr@seamless-rr-switch-vrr
>   igt@kms_dirtyfb@drrs-dirtyfb-ioctl
>   igt@kms_frontbuffer_tracking@.*drrs.*
> +#########################################
> +# Valid Skip : Not supported on igfx
> +#########################################
> +igt@kms_pm_rpm@package-g7
> +#########################################
