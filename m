Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B82C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 12:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1654510E099;
	Thu, 17 Jul 2025 12:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiPYOtK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C142610E099
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752756794; x=1784292794;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=g96I+eYIg/8gngUeoovP8J9YORmBkFFj7ZoEw8oQ2yQ=;
 b=NiPYOtK5xzPE2liMPW/4iqI5c8GRZafAcBy+PVoKYypxuqxK9NYtYImx
 cR1Ewjh0qGT0hR/+DYQ3yFby+PKE/RK+Sp7m6m3/cTDe52qxJ0iNzEFCD
 QCgkbFBasOlhiwTERjlX902ubEGBJwOkARsb9+t2lUReauGw+UBHTBfP0
 5vXWUY3bAAoQHKdk7R5qoLu1JV4hB4YfumnQxY3Jfj8wlLjVExaMN8yBE
 hUmIAfzKRFita8vu6xsIBV/5A0bZpTt3fx1U0unJgCMrwimeuVVqVGx3p
 3AMcpOBECnkgu99Wr5xDbaAMySrc4TVX0dGl4pLb9lucN7P+x6PbuDiXQ A==;
X-CSE-ConnectionGUID: OwhCV8q0QwekTGc5zR5sRg==
X-CSE-MsgGUID: AuJGUfDFR/S4vvV5RICAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54999164"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54999164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 05:53:13 -0700
X-CSE-ConnectionGUID: JHHIKWgxRKSqppuoVxhH9g==
X-CSE-MsgGUID: 6CHsdMf9RK6HeaAY3SseDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="188780074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 05:53:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 05:53:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 05:53:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 05:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQD3KVEv6PW0HqahJbZxX9jJLX5HtwAAiA6aDJhlG0fIAzdO6U5n3IeD6+yE8MF98m5xCsZ7oVjLwfX1jpPatLrY0NzE5wz4lxFJiXTa8SFA0I/EdoaLUiojHxHXtHANds5BOKe2wUy82SNuT8ZR1lZg1hz1oAHccetr+Ftf7JLce01t+d+N6Se3vm/Rie8G+vE3lllM8cZjMR9OFp/RJDdQH7/VqVcLz9KZ3WOlW0vxlDPiiNThHKQ6WZSRuggJXB89cTRIpnfPDD7oajpj1zmSVsU/LB3KAZiLRO3cxCcPSaa7BnxGnTzs0nAYwmCgPQQoKE1PiEySicfoVek8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqe/WmqdbeEjLTi4Zwt7OJ0B+juCSdOnvgxbYMM+bwc=;
 b=BxSMYg07cgkNHtypOGbSs3c9Mu02ZrzrVOGe1GJWHk2vnmrPM+xZvw8pubBkwMcexIDVTmbotof1quB5x/r5ufFOFKrFBTFRxNgNHGqrCidGFek22ej8QkVrFWwvflvrCqK058wrnguSJS+IRSg/MWQCHwrbnx54fjhcAm/JuZtFf6JfGYMp8vv8oEq8sxPpSxapTkEr0YSVge49C67iWXDfDaoyonDsPlxJ1MjEddNW7pj88iWZEAGBMQkaLYsdqIaYGQ6WsYb1vqEk0HdjJwJVX56Oh4cfQO+d7uojdRjsF620QckAePk50k5IYmaTV+dOgQ5xe0FjMVrKTV+zyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 12:52:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Thu, 17 Jul 2025
 12:52:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250716153102.165779-3-kamil.konieczny@linux.intel.com>
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
 <20250716153102.165779-3-kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 2/2] runner/executor: Report command used for
 test exec
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 17 Jul 2025 09:52:48 -0300
Message-ID: <175275676838.1809.9237754349861054089@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e30e50f-09ef-4262-45b3-08ddc530d955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXpwamQ1TVlWV3lQOUVLdTRQcEpXeTZRbVc0dEhNQWROMEhuVDhHUGRaMjN1?=
 =?utf-8?B?ZUJqdG5LVy8zUHdsdVl6WnhvbjRWbTVXYUNaZ3VpN3FOK1N2b0JQWnVKQ3RQ?=
 =?utf-8?B?TDdublJBRTY0NU9YK2JvUEl4ckRQejQ3bU9mOXFjay9LREphOVlZT3c5b0JU?=
 =?utf-8?B?MGZBdThyQytBU1ExcVFFdUFCRVZCWDFqSDR3TkFtL2wwMnZBTnhyWC9rNkFP?=
 =?utf-8?B?bGRLcUkrZlh1WWdFSEFkTFluUGlydm9JU1F2Z2J0R3hyUHJJMEg1MTZwNExK?=
 =?utf-8?B?TzN0cVlZMExuSmJGSkZwNEg5b2QxVHJCelVjU0Y1c0M3VkxFcndaVVlEd0V3?=
 =?utf-8?B?dTNCSW82MDdWVElJeTJMcHYzbmVhRCtIU1Y2SmdBdGdyekwzTFVnR1c0UDhX?=
 =?utf-8?B?Y1hFRnhSc094bkRZL2pHMmJtNm9wK09pcU0yakdDQ0R3eVRkTm4zeUtSY3U1?=
 =?utf-8?B?THhjQ1JiK0JxYnhoS3pFSFY2MWtZZWE3WTBYR3B4VDNyNGtmL3FsTk1ieDJE?=
 =?utf-8?B?cmhWSXdIcVNsMFJ3T3UrekY0UE5WbGQyWFluRDVheWlSWlNWR3pjMjFROS9j?=
 =?utf-8?B?ZEFleitNR1lKSmlrMEVGTlNodWRVWkk5RTFKL2dXbUdBU01CUnFINWZQOEpv?=
 =?utf-8?B?N280NXY4MGY3TGlVWjJPdGtwN2RkZm1WRG05N2tNaWxnSktUL2I4YjdiVEh6?=
 =?utf-8?B?MlJVTnZKb1JZTThnUFJtaDBQRmZISFBRUEhiMXkvSkxLcUVMTnNpdG1WaG0x?=
 =?utf-8?B?YkdFZDJsUElIdVdHamhUeDR5N0FzWnBrL2IrUmZTUDVXSFh4bXJpbEtKQ3Nz?=
 =?utf-8?B?NzZzM24rOTBiV05kV2tVWkRqemJYeDlWT2NncTFFbU9URE9qM1N2SWIyNm1v?=
 =?utf-8?B?Y1daNTlaWmRnYmU3NmRUMUdpZEcwY2hsVThTd1FZQXJPRDA3RW9VMEpIY2RY?=
 =?utf-8?B?QktaQUJWdzMybkNXcE9SUFZITUdsbElIOXFoclJQZTZnVGFORDh6cThka2R4?=
 =?utf-8?B?SWQrQi82YVhkWWtTNktyeTVQNFNndHE1OUdSTTVJUGhjeHdUK1JGeXZYK3px?=
 =?utf-8?B?eVNHaUVPY08zdzI5QWJmbUR5R1k3Vmk0QysrVXl2blhpQ2VJWHdSNU94eFJB?=
 =?utf-8?B?eGVJOUZxWDRjaWIvVTRMbmV5enJuYURRQXA4czBMZGpxU3UwSnA4RXBMK0sz?=
 =?utf-8?B?d3o3SCszQThmQkhBOUJLZmtmendaMGw5NVJKWldXNlB3MWZXemhtdURxMFNC?=
 =?utf-8?B?N1l2R3FUcTZwUzRyQ1ZEd3hWc2JCT2gxbGlHbUpyUmI1S3l2cnl3NVRSTWkx?=
 =?utf-8?B?VEs3dndvTC9RU1NDOTBGSVIzeWJoaGhxN3g5bHFlcXgwZ0Q1TnJsVlpUZTAx?=
 =?utf-8?B?KzdObmhVM252QytMcE5FV3ZrZGpYTjBnazFkV1VUUDFST25qYTJEUU03T1lj?=
 =?utf-8?B?aVNuRW1obWd1Rk1pQzVzdkxydk03RFo4ejB0RnNrUjBXbjllVEdRdllRcFc2?=
 =?utf-8?B?Tnh2Zmh4aXpoUUdwVU5LL2ZEYWx4alExVlhiMG9QNzlmVDdQeC82RDhBcmpN?=
 =?utf-8?B?TFJRd1VrNEdGMkxJRFh0clVhWnU5b2hFUTNiL1hoZmlzOWJjbmFoT2o4VXYw?=
 =?utf-8?B?Uis1KzV6Z0JMUGc0aWxYS0c5Ti9rNmljWTZsclFvQWZpSEFDeDdoRlN4QmJR?=
 =?utf-8?B?R0h1V2FCZzJxekgyT25NTnFGOVd6Tzg4T2pnQnJSMmIzd0o3QWxrbENWZmd4?=
 =?utf-8?B?U1IzSDFtbSsrby9HWmo4c2N5UEE5UXZKd0ZieGhHUnZFVXhYM1BBemtvNE0z?=
 =?utf-8?B?OEVZT2Z4bEx3NXBwS3hLQk82dUU3ei9vSmM4TnFqMlFXUzZ6MDNFeUhvZ244?=
 =?utf-8?B?Nk5hNWd5ZUoySXdrQjF1SWhscWFYMk9qZ1hDSlA1NG1pdnRJaWkxcCttVlZu?=
 =?utf-8?Q?lOJ+btq91hA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkwwNFFid1ZiQnp4T3dhRzdmTHpDdXdPaXNlZkVwTWhYTFdRQlBpM0ttekFt?=
 =?utf-8?B?VC94cWRkOC91V1JPMGhCanYvMDJ6TTN4djBsSGlPdUppVXBnRW5mcS9tNGNp?=
 =?utf-8?B?cGc5MXNZRmdlN1FNbklLR2VxNnA2YjNuTDlSeTlqV1VBSUl6VFJESzdqWngr?=
 =?utf-8?B?Ri8zeVdmZ2xkdDUxbDZkZ3dwdC9YNnZHWUIwaFpWMUxsSHNUem1kTENpeVpD?=
 =?utf-8?B?MzJwQXcvcW1lLzl6a2JjZmpNSUdEYkMrWUtlL0dSMXQ0WTdDa3dtV2tVMmFU?=
 =?utf-8?B?bE1vaDBicGU0cVltS2U3U2k4R3ViZVp5MEQ0aDRvNGNFdnZXZWg1Z0ZOLzRW?=
 =?utf-8?B?TVRUYXNPZ0tvcjZCMWkwWjNiek1OVWRLT0JhQm1GQjVKbzloaFhuM1VURDRa?=
 =?utf-8?B?K2VLK1NxNjJlOXBvNWhDNnZnNUFJdWZZbFJoUDMxQ1VnYlFSRGgzU1pOVFlK?=
 =?utf-8?B?MDk3VUJzVTZQRFlQMEVYVzlvUDJBNThYcWlSempWR0VacG43d2FQdUtReVgv?=
 =?utf-8?B?WGZoOGlvS1pLT0ZGbmZSNTM2SVl1Uk4yb3E5aXIrR0dBMFFyeER0ektpQ29H?=
 =?utf-8?B?YzZVMnJRZWpIdEJkTTZYYXlwampIS0UwUTFTeFlWSmZtUTJrWTBiMFVpTmVu?=
 =?utf-8?B?RHV3V01QZjRJanJkZEtYeVZxZyttTmUxdDBGeCtaU2JMM2preFNjemcxcGQ4?=
 =?utf-8?B?aWRmTjM2U0toK0VKUk9RWGNhVVh0MGlGZUJlWmNuT2QwKyt5VG93VXo5amZa?=
 =?utf-8?B?T3NXZ0lGcVhsY0ZobHJSTVI4UUM0aFpmYnZmZHJsejdNTXVHVXRqQ2libjRP?=
 =?utf-8?B?UmpuVU8zb0dWRWVHMUhVVHZWc2tCVkpTcGw3KzZDRitIdlRFRExPZHV0TXZr?=
 =?utf-8?B?aW1VeFNnajVONSs0aTRKZS9wM0Jodk5pWENYYTFHYlVPcEdMMDhmQkFlREgv?=
 =?utf-8?B?RFRxaTZDNGRIZE5LdW9FeTFWOUgzaXA5czNBeVN3OXQwdC9rMmw1WnZHZlVZ?=
 =?utf-8?B?RmpNVUdvbVB4TXBCUnFsTVJFOS9hMVJnL1ExMXp2cHBrRDRMbGFpVklVMVd5?=
 =?utf-8?B?Q3hJdkxoVWhWbHZzUXVvTW5tVk44bEJtRlRMajRSa3ZadDZ2aVFtWjNmaW91?=
 =?utf-8?B?NXl0RXJiNHhHTDRMSnJNZ3JHazBYam80NjgycGIyT2RqRjNNQ2pRQ1R2QndQ?=
 =?utf-8?B?WXhuVk9seXR2Z29Pa1N3Q3RWOXFQbmdTWFBvWTErS3hLOTVjL0ZxTE5wK3Vu?=
 =?utf-8?B?b21KYkl3bndtNTdHUk1UalFpQWJjd3ZYek1kN2ZlOXlScHN4M1BjSjgyYUhl?=
 =?utf-8?B?cHdYWS81VmwyUXN4TTYwSHZWd1FXcHVmTkMwMTlaSG5PS3ZGSkJPcE9XN2Zq?=
 =?utf-8?B?WmRXTkhXNVFwSGd2WGxjUElKQW1xUGhqZ29uazA0OGNGYjQ0blR3Z2gxOCt1?=
 =?utf-8?B?QmoxM1c0dmxOZ1RlY2U1S0RsMllYQUVRN3crQ0JLbzRETk92NFdudnhScnB6?=
 =?utf-8?B?N3UvSndNZmhmOFBTVHB2dm5FN0t1T284ci9zbVVnRU52a1VscE1oNkxxengx?=
 =?utf-8?B?d0xPSzBpSE5tbmxLa2hwSEpJZU5Vb0hXb1VhRm5NMzdLc3FNbm1rRFo2cldx?=
 =?utf-8?B?dlFOWkRBZTJGRGh2clN5cklnTDZENVZQWEN3RzF2dTJDQTQ1QkoweFB4ZnNm?=
 =?utf-8?B?KzhOUGxpSS9IeWY4L2Vqc202Qjl4ZVV3M3MzS2w4VDhBelUyUzNOSmFtTEZn?=
 =?utf-8?B?S3FLQ1pPbDY2Y21tUlNiaEsxemZXYVRuQVZaQmdLSnMzQjBNUGV0RXdxQ3Jj?=
 =?utf-8?B?aitjQXFObGg5UlBNTlA1eW9ySTZWV3orV2hYUlo1OEd2ZmREdHBQb251NXJY?=
 =?utf-8?B?RDR4QkpSMEd4N0hvOVhQMHdydXY0OXNCYUMzU0RsU0F3eW43ZjRYTmVMR3pJ?=
 =?utf-8?B?U3BCQ3lzVStSVU1ienA0Rm5QaUFLS2dFbmFLQjN3SitPbFRpZytIZ01aT1hL?=
 =?utf-8?B?Snp5T25MUFdybVhqRjcxY1hHcE85cUdJYWRYb1oxOC8rUkZreWJDNDloL0t6?=
 =?utf-8?B?aGF5ZGNIRUJNNGNBUjhSQlQ3eVZOWS9LSFZMSG5uTC9RYno5azhGRnRKRTlp?=
 =?utf-8?B?YThJcHViajBVTklOd09mZTZGRjBRQjRHaTJ1ei9GSVZIOU0vbkdCQlFZaDcy?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e30e50f-09ef-4262-45b3-08ddc530d955
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:52:55.6276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paUrJoCfBlAtNrLo5zs0oZ1Sf02vBv/5Xtic4TgKc4naNWLAHwDVQeiJqqWG5kKA1/QGiflTRPgCONTMzIrI/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
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

Quoting Kamil Konieczny (2025-07-16 12:31:02-03:00)
>Add printing of command line used for executing a test, when
>the log level is normal or above.
>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> runner/executor.c | 41 ++++++++++++++++++++++++++++++++++++-----
> 1 file changed, 36 insertions(+), 5 deletions(-)
>
>diff --git a/runner/executor.c b/runner/executor.c
>index 7565f2571..6ee446cdb 100644
>--- a/runner/executor.c
>+++ b/runner/executor.c
>@@ -1623,17 +1623,20 @@ static void free_test_command(struct igt_vec *arg_=
vec)
>         igt_vec_fini(arg_vec);
> }
>=20
>-static void build_test_command(struct settings *settings,
>-                               struct job_list_entry *entry,
>-                               struct igt_vec *arg_vec)
>+static char *build_test_command(struct settings *settings,
>+                                struct job_list_entry *entry,
>+                                struct igt_vec *arg_vec)
> {
>+        char *cmd_line;
>+        size_t cmd_size;
>         size_t rootlen;
>         char *arg;
>=20
>         igt_vec_init(arg_vec, sizeof(char *));
>=20
>         rootlen =3D strlen(settings->test_root);
>-        arg =3D malloc(rootlen + strlen(entry->binary) + 2);
>+        cmd_size =3D rootlen + strlen(entry->binary) + 2;

I think adding to cmd_size for each time we add an element to arg_vec is
a bit error prone. Maybe a more robust solution would be for cmd_size to
be calculated at the end, by iterating over elements of arg_vec.

That said, see further below that I sugest that we build the log string
in a separate function.

>+        arg =3D malloc(cmd_size);
>         strcpy(arg, settings->test_root);
>         arg[rootlen] =3D '/';
>         strcpy(arg + rootlen + 1, entry->binary);
>@@ -1645,6 +1648,7 @@ static void build_test_command(struct settings *sett=
ings,
>                 size_t i;
>=20
>                 arg =3D strdup("--run-subtest");
>+                cmd_size +=3D strlen(arg) + 1;
>                 igt_vec_push(arg_vec, &arg);
>=20
>                 if ((dynbegin =3D strchr(entry->subtests[0], '@')) !=3D N=
ULL)
>@@ -1668,25 +1672,47 @@ static void build_test_command(struct settings *se=
ttings,
>                         argsize +=3D sublen + 1;
>                 }
>=20
>+                cmd_size +=3D strlen(arg) + 1;
>                 igt_vec_push(arg_vec, &arg);
>=20
>                 if (dynbegin) {
>                         arg =3D strdup("--dynamic-subtest");
>+                        cmd_size +=3D strlen(arg) + 1;
>                         igt_vec_push(arg_vec, &arg);
>+
>                         arg =3D strdup(dynbegin + 1);
>+                        cmd_size +=3D strlen(arg) + 1;
>                         igt_vec_push(arg_vec, &arg);
>                 }
>         }
>=20
>         for (size_t i =3D 0; i < igt_vec_length(&settings->hook_strs); i+=
+) {
>                 arg =3D strdup("--hook");
>+                cmd_size +=3D strlen(arg) + 1;
>                 igt_vec_push(arg_vec, &arg);
>                 arg =3D strdup(*((char **)igt_vec_elem(&settings->hook_st=
rs, i)));
>+                cmd_size +=3D strlen(arg) + 1;
>                 igt_vec_push(arg_vec, &arg);
>         }
>=20
>+        cmd_size *=3D 2;
>+        cmd_line =3D malloc(cmd_size);
>+        if (cmd_line) {
>+                char *elem;
>+                int len;
>+
>+                elem =3D *((char **)igt_vec_elem(arg_vec, 0));
>+                len =3D snprintf(cmd_line, cmd_size, "%s", elem);
>+                for (size_t i =3D 1; i < igt_vec_length(arg_vec) && len <=
 cmd_size; i++) {
>+                        elem =3D *((char **)igt_vec_elem(arg_vec, i));
>+                        len +=3D snprintf(cmd_line + len, cmd_size - len,=
 " %s", elem);

I think this would give a broken cmdline if there are spaces in
arguments (e.g. hook strings via --hook or environment variables via
-e).

Since we are just using the generated string for logging, that's not
very problematic on our side, but it could be inconvenient for anyone
that wants to copy/paste the string into the shell.

>+                }
>+        }
>+
>         arg =3D NULL;
>         igt_vec_push(arg_vec, &arg);
>+
>+        return cmd_line;
> }
>=20
> static void __attribute__((noreturn))
>@@ -1788,6 +1814,7 @@ static int execute_next_entry(struct execute_state *=
state,
>                               bool *abort_already_written)
> {
>         struct igt_vec arg_vec;
>+        char *cmd_line;
>         int dirfd;
>         int outputs[_F_LAST];
>         int kmsgfd;
>@@ -1837,7 +1864,7 @@ static int execute_next_entry(struct execute_state *=
state,
>                 lseek(kmsgfd, 0, SEEK_END);
>         }
>=20
>-        build_test_command(settings, entry, &arg_vec);
>+        cmd_line =3D build_test_command(settings, entry, &arg_vec);
>=20
>         if (settings->log_level >=3D LOG_LEVEL_NORMAL) {
>                 char buf[100];
>@@ -1856,6 +1883,8 @@ static int execute_next_entry(struct execute_state *=
state,
>                 free(displayname);
>=20
>                 outf("%s\n", buf);
>+                if (cmd_line)
>+                        outf("Exec test: %s\n", cmd_line);

I think a cleaner solution would be to have a specific function that
takse arg_vec and builds the string to be output. Then we would call
that function here. The benefits IMO are:

* We do not overload build_test_command() to do an extra thing (i.e.
  build the log string).

* The log string is built only if necessary.

--
Gustavo Sousa

>         }
>=20
>         /*
>@@ -1908,6 +1937,8 @@ static int execute_next_entry(struct execute_state *=
state,
> out_kmsgfd:
>         close(kmsgfd);
>         free_test_command(&arg_vec);
>+        if (cmd_line)
>+                free(cmd_line);
> out_pipe:
>         close(outpipe[0]);
>         close(outpipe[1]);
>--=20
>2.50.1
>
