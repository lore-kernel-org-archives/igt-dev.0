Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8523C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 15:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F5410E516;
	Wed, 19 Mar 2025 15:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvQ5UbI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D0A10E516
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742396439; x=1773932439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XqH+2BP/NedjR/flP9qX24tglGqDjBzoIOSsLxCU5qk=;
 b=AvQ5UbI1XPRZCkYZ60//2K+RRDT1ezqTGHLIVTeVNySun/WkzLBTOoVi
 6TNW+Aa0OeuVbF+hrL3p0m+KsR2Nx+UyDzSD53TIJdleAXUWoo5sCqXaa
 Zn9JAWKfawaqnnKjxyJ8txGPK651puN2bsEyjnAln9ooneP+Ws+tM2/+N
 J8+Ig/snDIGIn0M7oTPg2sN0Y10XFEC+bEbyNh8jCugOPG7sqU+pGJuK1
 np82+Boxm2r8PKAO1UYECXl1q/laPoo/GNKHDg759ddGkaYi7NSjQrejk
 EOvQdVYAE/GO2ufHjg2TZQOI84BF/Ge3VRpNsvDEUtox8DouoJYcjOuRV Q==;
X-CSE-ConnectionGUID: HKb2dg7zS5yUpRX+2BsLnw==
X-CSE-MsgGUID: prjW5vvXSJqyzPl9F+urbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="68945199"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="68945199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 08:00:39 -0700
X-CSE-ConnectionGUID: go+OE69tRhGvScsqzdXa+g==
X-CSE-MsgGUID: k+OmVLzXSOukTb/5E4Wwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123397698"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 08:00:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 08:00:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 08:00:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 08:00:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQokhpb582kPmHGmU9FVfADvlgrT0N1/CS8QpiD3lfAPf5fWEe95JIjTtb6OpWIBKcOutXjulbELsG664E4JXvZTLMn3x3WIB82iS2kOfaAjMUMOyIVdl3fuJfGr1NffrjLhpM932vbddhbMrFhJWdY5mbxpBRpx1ynQ/lhWVZy1TvRVJVhSYQqMxsDx7XEj+meXS9HXsnArZp27YE8wG5pW6YRK3sLqeU4bON2lg6Ggr4G29ABAjIfHg76sD/AvvEsuBoJGxhptYSq0C4VzADLxVQbYj1ej39BCjNJ1hmQ2NT4w60BBjAeytd3mITqixtzRHONrlX+0kWgK6+xZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IeHRXI/9Ymus8q3IJThOUUVLzj8z92Ts5ISGtxpGUg=;
 b=JIQKzUtm9fkbFq0BkwhsQR2vikSnIfD6enUrUhmVknIku9sFtjpqzI4StNSBmYro4+954B6miIhYscvbU2LUdlvcYvrw+a8+nnkL87BGv7xQYGS0T0m1Lg3JsKBfj1WikD+OQBWzmv4pD75MqwV8Xmp2wzB4dYcRL0udmaYv5A+CCmnBuJfyIJLMGv5wxAIMGcJX9W7hyrO+zAOQMoY56KWgW8u6dxAl/3Ks47pWDRNhlU51hqD2jJK07e/w5BiNA5aHtgLjBRH5o/hFxtxiy1kHAZdQJXbfPhw0pdQ69KCSQOvX6jYfg4343Jt55WQWVNs3B8pCWNAo+DWlnf4sEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 14:59:36 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 14:59:36 +0000
Message-ID: <337176d1-41f4-481e-b81e-0f818f45a4ba@intel.com>
Date: Wed, 19 Mar 2025 20:29:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Content-Language: en-GB
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>, "Jakub
 Kolakowski" <jakub1.kolakowski@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
 <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
 <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cb0632-437c-43ad-8d22-08dd66f6aa84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE1KM0VzRURYUzdOVkxkclJsOXpwUm9UbTVnYnFCTXRrZW9OZ1drbGhkVU5G?=
 =?utf-8?B?Y1JFWXJEQ1BNVlhjUDdyV2xabjdHdkV2bmpLQTBrdll6cXlKT25KcHNvZzBR?=
 =?utf-8?B?OVk3dUNQZUIraTFlblJCL3htQmtaSkdlRTVxU2tOSHc5TWlvWHhsaUZ5bVZB?=
 =?utf-8?B?WDREN1hyKzZLLzZVcU9iY0NMNi84bG9pOE1kZ0dLbVI1NFNjeXZHVGRZQmpG?=
 =?utf-8?B?RDdsNkxsZ1RQTlN2WmE1QzNaQ3ZrMUVNZVplWVNEUXVYNHBJVit5ckd4aXVQ?=
 =?utf-8?B?aC9hSFVKTEdqQnpkR0szclAyaDRiTWh6TkVHaThQSFpsM1JNRGt3QnZKQmFC?=
 =?utf-8?B?QVVLTDVwTjBWa0xKYXdWNCtCVmRBd1p6NGc4dTJ4N0lBVW1jQ1dIMDdBczNN?=
 =?utf-8?B?dmhXajZ6VGx2a2IzWXZ3enYwTjduQ0Z2NVppUXlOSHJrYXEyajZiVHhlYklE?=
 =?utf-8?B?Ym5XSWd5TmxKMzJoTTgwZEoxWVlneWpIMlA5VytGUzRPM3JZNEJjRU1hcU1D?=
 =?utf-8?B?bmJsejJGM2RrYnFMbE9sRGoyaDBJMW1iN1Yrc3RaTHF4RmM2T0prV2xraWRW?=
 =?utf-8?B?SHM4Y0tqQU1nSHlKVU5MQ3MvbFR0TVpnblo4Wmp6YmdVdjZWSkVFVVErRTdK?=
 =?utf-8?B?Y2pnU0JUQWdsNlh5MmRGUkFyWFd4cldMR2JIbVJHeEM1RE1pVnRuanN3MmRO?=
 =?utf-8?B?UWpiTG9sTHdyQ1h3ZFBwbnlHanBYbXAycTRxTGFpTXI1Zk1KNWxHTGFSbWhB?=
 =?utf-8?B?U2tTcDNjQ0NzVmhNeTdtMEV4WnZjUThZT1pjZ25EMlVrQzJBaHM1NmQxN1pk?=
 =?utf-8?B?Ym1SM05sQWRMODJGL1lvdVRtSi95WGhueGROWitWZVRZdHhOSS9Hci9ndTZw?=
 =?utf-8?B?cHJGWkc5NGcxN3ROOEJHc0tJa255dzgrYUhDY0FkUGxUOXV4YnN6NWlFNk5E?=
 =?utf-8?B?STdkWi9Pc1dLcEJVbFpyWWg4eUZDMGJHK3N4STNldWw5SURYSFBWTElXRnVw?=
 =?utf-8?B?dXdPVjNnRXBtc01kOWZLNkRyb1NlVVJVNnI2cDRXNkJlTHJCQ3NuK0JuZEFt?=
 =?utf-8?B?TUlKZEVxS3Njd0NoNFRYc0NpR3UrYkRMYzZ2d25qZXY2OFR5ZjJuNlA1NDI1?=
 =?utf-8?B?djdZQW1VS0tzZk0xbUpYaDRpL1hoajRCZTFiNWh2c1FZcng4QWtaaE1VL29z?=
 =?utf-8?B?MmxzcTBkOTIzK2czN3BRWGlQUmw3Snh3Wlo4NDNzbWt3OHcxa0NWaTg3K0dC?=
 =?utf-8?B?WlVvbW11UnZ5ckhPZHFlVTRZeEJtMzhoYkZETG1Oa0pDaHNyc1FtM1h6Qity?=
 =?utf-8?B?andSRFI4TUxEdjl6QmQvTHhTVW5LTmlweU1kbFp3eWExazFDa29DTVl1Y2E2?=
 =?utf-8?B?RTRqVjVRL3pSQmtVcmRRMkVtemE4Y1VkWmFCZjZYOGZjYzdTVVQ2OE5CZFJ4?=
 =?utf-8?B?MS9TUERJbzZqdlM1c3FxR3pEVGd4a1ZDd1JlYUs0ODlTd0FXczJIQ0RwcnEx?=
 =?utf-8?B?eVRpS0FoOS9iUFgzb1B6ODFGblNXL3AzVFZSRHc4empSZGtmaHBhVDAzcmNa?=
 =?utf-8?B?UkxPa1JNemJXT2pTZE9XeW1nd3AwWGJybTRpSzJockdhNUVFWHFKVUFEY1FM?=
 =?utf-8?B?Qk54SjJQbU5DdUEzVFQ1dFhmN2ZGcndjOWNmTFhObnlOd1dBZGpON0laa01s?=
 =?utf-8?B?REd1WHNxaGF0ak9FMEFmY0EyR2JabmRDLzUxRTkxVVczUEovR2c5MmRQY3Ew?=
 =?utf-8?B?Nm51YmNocHJXSCtUK1dESUxBeTRNTi9ITTVOU0lFcDFOUzExbTFnZWFLaUhv?=
 =?utf-8?B?NDhVTW1TczdjUXdMaXVXVXBEbmlQMWlwUW5BR0ErNldjRXVuMWJHMk9DODZF?=
 =?utf-8?Q?T0ppMEkDZkEOU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhpYy9DMnI5eGIrZXpiVWtRWXcwQ3I3N0tNdlIyN2tLRXZ2eDBlMjlOLy82?=
 =?utf-8?B?QWswbDYxNyswSGZ2aUhNdU8wNG9mU01PL2JLenNRbmhRd0QzemQ1dFBpMTFH?=
 =?utf-8?B?ZjlWT0luQ1EyUWhDQ0pRWkdVZCtjRDRmSWJrQllyQVNjYUh0R3BScU9xd0dv?=
 =?utf-8?B?N1UzdEdqL0RHckNUVE5XQzYvaG1zWEZLQmRBNmRsNG9aSjZwTFJBNllHYml2?=
 =?utf-8?B?cDlxdEo5SVl0RDBWbWhxZ0Yzam82bm9wUGxiSEpPRjlWU0ZjSlJ3TTRzZTlh?=
 =?utf-8?B?dVBQZU5JZzdtSFUvOC9GY2ZBdEZmSXdGWFFTUlBiOHdsYm91Vk9NOUtEUTFB?=
 =?utf-8?B?Tmh5dzJZbTcrVW9HT2ZwR0hXNS80cjl1SVBRNWJMTnRKK01pbEhmazhxSEp1?=
 =?utf-8?B?aHYrZGlZUDRZbHhDaW9QQXhqa213cDdJa3hTU3dJMjBZbGlvVEM4cjJGRzFI?=
 =?utf-8?B?amErbVZGOGp3dGxQR1UwYjErdnBnQkhOVnowNU5qbUsrekI4UnVFQVUwL2d0?=
 =?utf-8?B?TU5uZS9SK1NEZ1haNXBCMzhWcDdLVnU1RU1rR2g0OWhVUUIzUkxveUZNUC9j?=
 =?utf-8?B?d3VMSlhrbDFIbkw5dm9JQkw1UCtvRFBWaWVMSGxhR3pRQ3JpTVBZZXRsbUgw?=
 =?utf-8?B?MGtJQ3ZhbC94aUVXYjJOMERFeEwrWTNHTGxKRlljU2Uyc0J0L2RFSWp3MHor?=
 =?utf-8?B?N04rQjdmZkl6bUtVZzV5ODRET1ZkMGo1Tk44cWZTSzU1b2xEMFdWSXY2dU1C?=
 =?utf-8?B?NXNxeE5BcC9QOFdkT25ld3dYMTd2bXJTSjhZOXNpZG14Z1FXTHp3Zks3VzRB?=
 =?utf-8?B?cXlRZWJ2WEVyTUxyZVc3L0pyNGtjM2dldmM2WHFYZjk2U3Jqa084WTBQYWNy?=
 =?utf-8?B?TWxxMjNiMGxVRUxlK3dqU2tta000akJwRk01a2tCUytPN01tQTB4bTNvbEwx?=
 =?utf-8?B?WG5nTGhVZXowQlp3bDJ0UHk0MWliZExOdE1CNGpNbWcyOWJWclJzQzErTisr?=
 =?utf-8?B?WW90Y3hveWRpWHN6d3JTY2VMKzVENnNZMFdieFo2czE4VTh1bVpBelRHcnNk?=
 =?utf-8?B?MmRkSkJVYmZvR3h5ZXRTU3NQZEMwY1VVYTlmSCtKVHdvRE1lcjd0aW03dE5Y?=
 =?utf-8?B?emlmcSt4VEtLWXpmYUF3eXhGeVlpUTZQc2VROE9TK2JNR2RVTUhtU1pxcGFn?=
 =?utf-8?B?cXF6M0g2L1NrUVA1TUhEanMrS2VLcmxVNG53UVJMSTg2NllsRnFVUW1lYzBw?=
 =?utf-8?B?c0VXK1dYOVFNdSttSWVXYk9VZEtEbGo5NGhSU25ZMHVybG9SRkoyVTh1Yk5M?=
 =?utf-8?B?Y3RCbm1Na01NbmFqNDh3Z0sxVm5kUUZwMzZkazVjcXRjVmJ3SXJxeHU5K0FW?=
 =?utf-8?B?RGNYNjBpRFpiYjJsWXpDamZ3dHo4eXk1ZWNraW1FWTdObjJhaEJiRGFZOWM2?=
 =?utf-8?B?TEZ5Yy9HaGV0bkRVc3laeU90NDV0clY5UDJMRlkweDN5L2FzY3BLbnhEa3Bh?=
 =?utf-8?B?TitqZGYwTkdvY0FDV2pseTMyNzR5Q2pGUE5RdVZTRVZPM0kvbmtDL2g5ZE51?=
 =?utf-8?B?WG1aQnBYK2lKemxJQ3NPSFJFazU0TlFXUHY0LzBuR0ZQNlZ0RkRIRmtOaU0v?=
 =?utf-8?B?RTF4bFkzV0Z6RWE3TEZZWkF1UkpvWWJoMGlGTVdFUHkrbmZubFMxWkZCdGh3?=
 =?utf-8?B?RE13SlFja0RyczFWcjBwRk5VRHhsRDdkSFpEdTFac1FYSXkrUGpNTnZWSHNx?=
 =?utf-8?B?VGlkNTRBeHRKSDMwVm5UVm9mS1p2anc0MU1uNXVxb3BQOXVJVHE5MXA3MnUx?=
 =?utf-8?B?THBmc2pJMjdoQ3BJdG9yZTR0VE1jT0hSbStZdDY5WVFvOFphLzdobFJOMSt5?=
 =?utf-8?B?b2ZoZ2w3aEVPNEhyVlRVYXVXQU9VN0lCQVpCVGlDL3EvRnFxWTBsUEVwU0l4?=
 =?utf-8?B?aHJOdGwyTjFzSzJQbEUyeXdSVVNkMkZzR2RqRGVBNFZEYTZ4YjZtSGlyUXQy?=
 =?utf-8?B?TWpydVJra2QrK1FMeEhBWURMT0hveWx1SlFPZFJFQis5ait4TWZpWDBTWThE?=
 =?utf-8?B?cy9Ma3huSm9ReWh0UzhPUi85RWJFeEpHMGhFWHV2RmdYaFRqc3NhMkxOdWlv?=
 =?utf-8?B?L09pb0czejdPUHpiMjVvVzdodnB3ajJZK2tRRU1PcHdkN3VQUkZtM3Z6MTJR?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cb0632-437c-43ad-8d22-08dd66f6aa84
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 14:59:36.6553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LolwhN+6aMdb1829M81M+xOSN03DPPtan4ly8V47qb1IlfPq5eJ4Y7NWam3wlsXV/RXz3J+Qhc+fkOxUe0Di5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
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


On 19-03-2025 13:44, Bernatowicz, Marcin wrote:
>
>
> On 3/19/2025 9:05 AM, Poosa, Karthik wrote:
>>
>> On 18-03-2025 20:31, Jakub Kolakowski wrote:
>>> Add a check for power management capability of device tested in tests
>>> related to D3 states. Currently if test is started on configuration
>>> that does not support the PM capability it doesn't skip, instead
>>> depending on test it may fail, abort or timeout.
>>> With this change test will skip with a clear message why it did.
>>>
>>> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
>>> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
>>> Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>>> Signed-off-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
>>> ---
>>>   tests/intel/xe_pm.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>> index c2026474d..70f0613fb 100644
>>> --- a/tests/intel/xe_pm.c
>>> +++ b/tests/intel/xe_pm.c
>>> @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
>>>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>>>   {
>>> +    igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
>>> +              "PCI power management capability not found\n");
>>
>> Hi Jakub,
>>
>> As per PCIe Base spec, all PCI Express Functions are required to 
>> support PCI Power Management Capability.
>>
>> Only legacy PCI devices wouldn't have it.
>>
>> Can you share details of failures without this capability.
>>
>> All Xe supported GPUs are PCIe complaint, this check may not be 
>> needed at all.
>
> This happens for runs with Virtual Function (VF) passed to Virtual 
> Machine (VM).
>
> "9.6 SR-IOV Power Management
> This section defines the PCI Express SR-IOV power management 
> capabilities and protocols.
> The Power Management Capability is required for PFs as described in 
> Chapter 5 .
> For VFs, the Power Management Capability is optional."
>
> -- 
> marcin
Okay, LGTM then.
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
>>
>>> +
>>>       dpms_on_off(device, DRM_MODE_DPMS_OFF);
>>>       /*
>
