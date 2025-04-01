Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E1DC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 13:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838B810E5A9;
	Tue,  1 Apr 2025 13:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNE7wT95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6386710E5A9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743514313; x=1775050313;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6VQgfQpeazjxH5UTPVZx6Lv/YK1uocCaGjwq+zrt9dg=;
 b=gNE7wT95EvxnR/5emzJpLU7ngMOFSz/6IOzAUXlzTM9pnd8Q8ISWzTcp
 pQ5weW/05Tov+CQciH1gxGvwXPth54r7CE8R34288ogFlif93HzQJ37zr
 89pnLbhsFZ2tfifQAgtsgFJ3DDqP9ARFWjBjfSaOvPULP8QfLslk6ZSpl
 TwRacIbtkcnLLen4tXcYM3gLTJYPCq67UlRKWVEneAvcTF6bTkvC0wMTo
 3X4Niz0pDiG1gRuwsxxuCybxTG1baSKazM0JJTYt1iQ9hNolly8VY3doT
 gngrypR/cMcxRpxsG4ncDxEO3GuRcB+h+xjiQesjn7BV2H28gY8OLoXZH Q==;
X-CSE-ConnectionGUID: B/PL74K1RkG5iAVG/Ysk/A==
X-CSE-MsgGUID: Lz16ns1aR06mjhm3BEDvSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44720111"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208,217";a="44720111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:31:53 -0700
X-CSE-ConnectionGUID: gXxs+vXLR4CRpsnPTx3A/Q==
X-CSE-MsgGUID: T0TgGbj1Q/2XgVfdByBvAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
 d="scan'208,217";a="131524899"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:31:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 06:31:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 06:31:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 06:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF94Tx+eXE7RotdvNHeUyfTgL/iqQE4Cm3WDPRWWyE/EUl+PkmqCwxDHJLnbfRaFjdyv1zh6s6S3Bb3pHgLLbAPRkNM2v/E6Yj3L+z3zsQ7GFsiihh+y/kjYqnuWMWnZtuTaXPY4UVbBsU614/i3FHbeZipJeighuVhuPfOV2FRMIT7g0SsyfjaelphZSzmSg0a09s4HOCuQhQyQlTROK+nBGwELWViW6VMkjMX/tfqv2av5DI6yhV6K1ZQrpahjmRtXMgLut5HR7A6CNefJKJRsnF4p0YVaGOUbHbJW/Bf1yutLUsAU1c9FUZX3kVX4Hzgc9QbyxpyPqMEBDs+rbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvbsST7waw4PHA/VEdwF6tu41kah8P3a9D9XWJgm4+I=;
 b=RRR8+T2UPL77+GhmVHBscc6hkJqC4TjEWYtV9mRbSbJHy04i79SmAIfXLXqvlTvqOrePmXIRR+F3YuZHAFAQfbJbixmqvuQYVnW+ZhQilGlQS+mNGQub0shofgTIsdDooHPpz53e8AhWVxmQcwGR1RHpLVvAPHFwOoOfJgW3vyuRUU/zcNXG7ajPCrAMc7XWBh06MiDlG2mlKq12wUqk0Ji1iYqWA8KiaLa7cFx3IwrKAQ2PFOGAXyZpwoQTO79TQR/dcWV02rsDa3tAAPs0o0gZsbnrnzgKizJ0GgWIFwiRDkXdtpvyZep4cFa1fKkbCryptrUipXsuBLhRaE18ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA1PR11MB8787.namprd11.prod.outlook.com (2603:10b6:208:598::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 13:31:44 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 13:31:44 +0000
Content-Type: multipart/alternative;
 boundary="------------7wPXOujAewo3bnMCnhcb001t"
Message-ID: <4292a1fd-d045-4a88-9978-047ef3d05aec@intel.com>
Date: Tue, 1 Apr 2025 19:01:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH <i-g-t> v5 1/4] lib/igt_device_scan: Enable finding all
 IGT devices for a specific driver
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <krzysztof.karas@intel.com>,
 <kamil.konieczny@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <jonathan.ming.jun.lui@intel.com>
References: <20250325191230.1822979-1-soham.purkait@intel.com>
 <20250325191230.1822979-2-soham.purkait@intel.com>
 <20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2>
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA1PR11MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 207715d5-2099-4d9f-da1c-08dd71218b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU0rSkFySG9pZU94VDNaZEVNSFQ3elJwdDRxWWlGc3NUV1FuSVRVSDcyczh3?=
 =?utf-8?B?bnFRRXBGUWl4dzhDNDhQY1A4NVZoQVhSQUVpOTFRODFZelBseTNBKzNkZlhK?=
 =?utf-8?B?SnlJajArc2JNMnNENHhqcnU3U1RLUjBMVHZNVHgwaERaK2U1aWR3SUxPSTI3?=
 =?utf-8?B?eFF0ZXVtYmI3K2lIYnNDc2VKa1A3R3Z3S2tMdS9rc2dYUTd2Rjh1ZFFLVURy?=
 =?utf-8?B?T0MzM2RhMStXLzlQZkYydnhGNjhRdXRSRnFhbFhJdGNma3haTVpiclQ4R2NF?=
 =?utf-8?B?bzJEK3ovaDFWRVlndFVHRElob1V2T1hPOWtsVUFxdlgzMGkrc282dk1yK3dV?=
 =?utf-8?B?Z21KZkcrc0R1d1JiRDVvL2ZUd0doQ0pLWU1GWkJQRUdydDVYQ2JPR244S1R2?=
 =?utf-8?B?NThucVp3cXJkR1VQa3c0WDc0Nmdpb1V4ZFI3anZhYW95ZGoycGJ2WnB4S0Vq?=
 =?utf-8?B?RmhoVFJvNGM4YjVEOGFGbk9GVnI3R0VsdGdtWW1hM1dIRzFkaFJUWTNiL0ZD?=
 =?utf-8?B?d1k1RndOcVlWeTNoVWFLOG11RkpaMlVOZ3JvWFFCd3FrQkMvTW1NS0phTnNF?=
 =?utf-8?B?UjlmSjRuOVdhVmJGbitLTTZ6OHhoSlNGTjJuMkR0OEJDSHF0YUF1TFFrOSt4?=
 =?utf-8?B?RXBGd0R2TGhsaTJZS0R5M1NLempaRXdyTkh4ZmhnNGt5SXVXNlY2L0llbVRk?=
 =?utf-8?B?VUtNcU4xWDRHUUNrakF5RWE4QUVvb2VmTjVzcUI2dDBCcThiU05SaElPaHl1?=
 =?utf-8?B?bW1xaXpwRERpVVJPakhTRWpKQ096aFdZeC9QeVlvLzhycmJIcUduRThMZENH?=
 =?utf-8?B?Q0lmUW1aWXkvRWdUWFZxNkJjMzlIS0hxQWdvVXR4OXFNTUN0UFNLc2hTQ2lC?=
 =?utf-8?B?eHgva2hGcFAzbTVIVFhHdEprbllKZUduUTNteS81YWhmZlNHYW4yZkZ1dEl2?=
 =?utf-8?B?WGhWLzVWblNBMW5LazJHdldnM3czckZ4MCtROGR3VjF6aWJzWFZHc3V6aGpG?=
 =?utf-8?B?bFdOc1REN2JzWU53aHAwcWFUMnRqTUExbVFUOGEzK1RiWWhGYzR2WE5wUE84?=
 =?utf-8?B?REltRWRGRGdpUWp3TVZzZTExRUpLejJLd0RPS3c3NjVyaEwranVaZGZlVnNk?=
 =?utf-8?B?Um5kNnpheXFndjk2akpydzd2TW1YVGFLcUZiZjNic0ZuZk1INkpqNUgwRW9a?=
 =?utf-8?B?Z05BMityQ3l4bGJJTCtzU2Vnc0NoUkpnOTBPMXFCQS9wWHA2RUh0clhJcFBn?=
 =?utf-8?B?TFZvK1RvbW9HMUFVckF3SkZpSGZiS0UwOFRscFhKVHZ2dEhrZGcvWGQ0dXpW?=
 =?utf-8?B?aGFGazNjU1paVmtNNm1EK0JFdUltYXRsQldWZmtHRUtCOWw4N0NwYXhqbWxw?=
 =?utf-8?B?U0lPRW9WTTJETnFzb1h0SkhaSVRzOXlqMiszcGR4Y1BkWk1KUkVwNmhaSXVq?=
 =?utf-8?B?RU9hNVJQVjdhV05Udm5IcG5kNENQcW10L0xRc05qa0R3K1pkSnhIOEpOR0x2?=
 =?utf-8?B?TkJsV2p2WUIxTFVhb0FDNWROTmdZMzdpS3ZNNDJXeDJKUFEzOTBtS0dEeUFF?=
 =?utf-8?B?dHU1czdUYXpwdmNmZEdaTGJlOUhBcnM2Qi9GSDRaMnRkVFNNY1hzT1BhYm9E?=
 =?utf-8?B?YkNZOWR3VE95bzhnQjJLUDRrM0dWZnV2S3huMGtMMG5qemNsc2pzOGpLTXlp?=
 =?utf-8?B?VVVmOU5YdEJUcWlhQjAwQ1c4Y2NwcmxYSDFaL3haeERmOUVZaldiNzdsZDB4?=
 =?utf-8?B?R2Y4KzZjUHFlTmxhS29TQWdObm9USUU2Q3NDVjZGQ055Tlh5eE9sZVgwdmo5?=
 =?utf-8?B?dkxDb2lwN2U2MTMxU2pxN2ZvNjI2RVVGVGtRT0tBc2trY1JJbnhxamNFbURZ?=
 =?utf-8?Q?/tDpgGHaULHOM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW0yOWc3S3J1L01aa3g2MXZFM2o3T05hdDBKK3prdW1KSDhCb243RFNlRllM?=
 =?utf-8?B?UjJkWlZtZmUwS3dqU2RVMys4OGVPOVM4aStIRWtxRjlIdFJpMXQ4aGFaK0xU?=
 =?utf-8?B?WWlZVXF0Nk9LekhrdnpsSHUvYzF5VmZYM240aDVaWFJDMUNxSEhSbHdiTGhB?=
 =?utf-8?B?bzRXZFNEU2RlSDg4WWRnR3hIWk9janl3a3RPaGV1UDRrMG9GbGxobGliQlM1?=
 =?utf-8?B?ZnlLT2FKeC83MmZNUTlYWGRKazlDSTlhRWdsY1pZUkw0M1NoakpEb1JRaUZR?=
 =?utf-8?B?a1QwT2NjSGViSEduN3Rod0ZjRmY1VmxrWTJFcDFPNHdJOG9xUFhXUjNvMnlr?=
 =?utf-8?B?a0RJQkJ2b0dON09xYW9OZ0Z3Nzduc0ZqWnB5YitWTEl3TEFYWFZrVW1qYloy?=
 =?utf-8?B?R20va1p0ekE0TVZDa1Rlb2N5TTFpdXJXa3B3MDFtcG55bWtVOGlacGo2WjNR?=
 =?utf-8?B?YXVPY3MyeEQ1dSswSGMrcVF3QUZlUHBNalJpUFl6RzFJOWUxK3RHTlRUQWp3?=
 =?utf-8?B?U3I0Z2lOU3A4UnZJL0YrOU5aYWxPRGY1QW56MktxS3phQzE2NWhFWFF5UVEy?=
 =?utf-8?B?aHp5cVQ4VXRkOWVmdG03azBkM3pjam80RWN6aFUxTUhjc2V2eHFwRDNHQlhO?=
 =?utf-8?B?Y2RnNkJJeVF5emRPblZteitoeHpiTEVJVXNWK2JBY25DNGIrTGk0dVRZZjNB?=
 =?utf-8?B?K1dlZU91RjlDZXpFZndsU1ZER1g2TkV4ajVZM1JZbG1BZnVXME9nemVDWFpN?=
 =?utf-8?B?MjRLQlVlaXpyTVFsNVBiZ25FMFp5SUdWV0J1cDVBRGFkNVdkN0tQZ3RWMkda?=
 =?utf-8?B?TWRWRWFQRTZDenFzVUZpUWt0TWpaWGJoWXFiOGdoRG9yaG9UbGM0R0pDSDFQ?=
 =?utf-8?B?MjhFV2dISjJpNDB3UFhqK3JvaFVlaHNRS1E4MGhocEYwL1FNTG9Fd1ZMZ1Uy?=
 =?utf-8?B?WWtKdjBObHRPczVvdEFmQUxqSTEreFhoRExETXVhUWRXdlZZTGZrai82RFhG?=
 =?utf-8?B?L0xoRDdTejZWTkM5RnhOTjBjbmRaUFFXV0hFSDVUM3B5bFJIZUhEWHFMc3kv?=
 =?utf-8?B?M2QydXRCWXd6T1ZxRWE4eWRRblJkMjBJOU0wV0UrbmhoRHdsc0cyMlNLdGtO?=
 =?utf-8?B?dWpCV2hKd0pEVGoyRzJyZTBIbUtTTlJtUThsbGRtVzRreVlmRnZ0ZFo5VjA3?=
 =?utf-8?B?d0RxZ2p6ckF0QzIwTmVubWtnd0ZHcVhzOUU5RWhNTWdtRzJTM0toaFB1TFRj?=
 =?utf-8?B?Umljd0JNcDl2T3ByZC9WTUIrQVpQczF3dWU3bHNyRkFZWlY2eENWMWpmdENt?=
 =?utf-8?B?SVBUdlVvMkhKVXZCcTQzcTVLUHQzVXNhUlFjK0REdXErTWtkcFVzOVJYc1do?=
 =?utf-8?B?bDM4NjVwZHBHM0ZIallSOFp2cFR0dVpJVjVsMDIxVG93cTlZZkE0SSs4eWxu?=
 =?utf-8?B?ME82aGExdlYzQnVwc2NFczRTK0l2Q3FsZjdneUQ4U0dWaVBDeFBqZHpSVG8v?=
 =?utf-8?B?NUhKK09xRWNwaGlZVzlRWTdJSThhSnZSTmlsemoxczZDSVBKdVRFQ0pkcnJk?=
 =?utf-8?B?OEV2dW8yZ2xNR1BWeHJKdFdNTm5oVS9ucWRPRnhTWkU1MlN5dXlvYWF6OHlO?=
 =?utf-8?B?UUg1YUFKN2VUeG52RTBZOC9sZ2p1Smp0V2dCZjczenUvdXN5SDlzVllDNVZ4?=
 =?utf-8?B?bVg3YmJ4Z0I0Q3BrVDUvMm52dDJ6U0JLVjZ4TEc5RWllK2MvUjRjb1N3b2dI?=
 =?utf-8?B?M2hhdmRMUDRmRGk0NThiYWNoU0diZWJ0Y3o2OVdNYVR3Tjh6WjdBVllNVWR5?=
 =?utf-8?B?RjFORlgvRVJxMngyOFl6T25VMlloTDhueFM3K2lUOUJacHU3YXNDc01mTjdW?=
 =?utf-8?B?bGdaUytic2hwTFFsTUw2ZFdJNVI5ZTRnSlY0Yi85aVI3a3lOdGhoSC9nM3RU?=
 =?utf-8?B?T1RDb1JhYVNlOGo1QUNUWmNEdGQ2bTJpODVWY2NTNk9GajFaTTcxSURYeFU0?=
 =?utf-8?B?MXkvdUpVZFp3aFZhcDFHcUtrL0tlUEdyeElldEl2a1VETC83OWQ4cVRaR1M1?=
 =?utf-8?B?Y1lWemRZK2ZCWVk3QVFWajJoa3Zwd3daZFlXTnlyQmhpaHcxUmpXaWVHNE1R?=
 =?utf-8?B?Rkp2TzhUTVJwME1Hc3VPYjVSWi9iZFdRS1RFU1pWZUoyemNDQy8yTVhMcjAy?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 207715d5-2099-4d9f-da1c-08dd71218b5f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 13:31:44.7805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjGHSI46RRD3gL3/ylI1yKuPoZpvHo6kFJM3UArZUNTap9IVStCrPX13xoC9UWylmzBO7BjysN9bacRvVokT4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8787
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

--------------7wPXOujAewo3bnMCnhcb001t
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Zbigniew,

On 28-03-2025 13:36, Zbigniew Kempczyński wrote:
> On Wed, Mar 26, 2025 at 12:42:27AM +0530, Soham Purkait wrote:
>> Add filter functions to find all the
>> available GPUs or few among them
>> by driver name and card type or card number.
>> Add driver field to igt_device_card structure
>> for storing driver names.
>>
>> v2 : fix for refactoring GPUTOP into a
>>       vendor-agnostic tool (Lucas)
>>
>> v3 : Separate commit for lib (Kamil)
>>
>> v4 : Refactor to use composition strategy
>>       for driver and device type filtering
>>       Refactor code to improve memory
>>       allocation and error handling (Lucas)
>>
>> v5 : Rename function name as per convention.
>>       Use "dev_type" enum for card_type. (Krzysztof)
>>       Add new filter to return collection
>>       of matching devices.               (Zbigniew)
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   lib/igt_device_scan.c | 177 ++++++++++++++++++++++++++++++++++++++++--
>>   lib/igt_device_scan.h |  12 +++
>>   2 files changed, 183 insertions(+), 6 deletions(-)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index 711bedc5c..452da2ee4 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -198,12 +198,6 @@
>>   #define DBG(...) {}
>>   #endif
>>   
>> -enum dev_type {
>> -	DEVTYPE_ALL,
>> -	DEVTYPE_INTEGRATED,
>> -	DEVTYPE_DISCRETE,
>> -};
>> -
> I think you don't need to extern this dev_type.

As the function (igt_device_find_all_intel_card_by_driver_name) need to 
call with the device type as argument from gputop.c so it has been made 
extern to access enum dev_type from outside.

>
>>   #define STR_INTEGRATED "integrated"
>>   #define STR_DISCRETE "discrete"
>>   
>> @@ -774,6 +768,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>>   		safe_strncpy(card->render, dev->drm_render,
>>   			     sizeof(card->render));
>>   
>> +	if (dev->driver != NULL)
>> +		safe_strncpy(card->driver, dev->driver,
>> +			     sizeof(card->driver));
>> +
>>   	if (dev->pci_slot_name != NULL)
>>   		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
>>   			     sizeof(card->pci_slot_name));
>> @@ -820,6 +818,58 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>>   	return false;
>>   }
>>   
>> +/**
>> + * Iterate over all igt_devices array and find all discrete/integrated cards.
> This sentence is misleading, otherwise what for is card_type argument?
>
>> + * @card: double pointer to igt_device_card structure, containing
>> + * an array of igt_device_card structures upon successful return.
>> + * @card_type: flag of type "enum igt_devices_card_type" to indicate
>> + * whether to find discrete, integrated, or both types of cards.
>> + * @drv_name: name of the driver to match.
>> + *
>> + * Returns the number of cards found, or -1 on error.
> You should add some note about freeing the memory allocated for the
> returned array.
>
>> + */
>> +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
>> +						  enum dev_type card_type,
>> +						  const char *drv_name)
>> +{
>> +	int count = 0;
>> +	struct igt_device *dev;
>> +	int is_integrated;
>> +	struct igt_device_card *tmp;
>> +	struct igt_device_card *crd = NULL;
>> +
>> +	igt_assert(drv_name);
>> +	*card = NULL;
>> +
>> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
>> +			continue;
>> +
>> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
>> +						PCI_SLOT_NAME_SIZE);
>> +
>> +		if ((card_type == DEVTYPE_INTEGRATED && !is_integrated) ||
>> +		    (card_type == DEVTYPE_DISCRETE && is_integrated) ||
>> +		    card_type == DEVTYPE_ALL) {
> Shouldn't this be:
>
> if ((card_type == DEVTYPE_INTEGRATED && is_integrated) ||
>      (card_type == DEVTYPE_DISCRETE && !is_integrated) ||
>      card_type == DEVTYPE_ALL) {
>
> ?
>
> Do you really need this function? I think according to device filter you
> could use:
>
> igt_device_card_match_all("device:driver=intel", &cards);
> igt_device_card_match_all("device:driver=intel,device=integrated", &cards);
> igt_device_card_match_all("device:driver=intel,device=discrete", &cards);
> igt_device_card_match_all("device:driver=xe", &cards);
> igt_device_card_match_all("device:driver=i915", &cards);
>
> (see explanation below)
>
>> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
>> +			if (!tmp && crd) {
>> +				free(crd);
>> +				return -1;
>> +			}
>> +
>> +			crd = tmp;
>> +			__copy_dev_to_card(dev, &crd[count]);
>> +			count++;
>> +		}
>> +	}
>> +
>> +	if (!count)
>> +		return 0;
>> +
>> +	*card = crd;
>> +	return count;
>> +}
>> +
>>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>>   {
>>   	igt_assert(card);
>> @@ -1705,6 +1755,55 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
>>   	return &igt_devs.filtered;
>>   }
>>   
>> +/*
>> + * Find appropriate gpu device matching driver/card filter arguments.
>> + */
>> +static struct igt_list_head *filter_device(const struct filter_class *fcls,
>> +					   const struct filter *filter)
>> +{
>> +	struct igt_device *dev;
>> +	int card = -1;
>> +	(void)fcls;
>> +
>> +	DBG("filter device\n");
>> +
>> +	if (filter->data.card) {
>> +		sscanf(filter->data.card, "%d", &card);
>> +		if (card < 0)
>> +			return &igt_devs.filtered;
>> +	} else {
>> +		card = -1;
>> +	}
>> +
>> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>> +		if (!is_pci_subsystem(dev))
>> +			continue;
> Why there's limitation to pci devices only?
Once the array of cards of type struct igt_device_card are prepared and 
populated,
it is matched with the respective supported drivers . Seems like this 
field is not present in case of non PCI  devices.
>> +
>> +		/* Skip if 'driver' doesn't match */
>> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
>> +			continue;
> Use may introduce 'driver=intel' which would match i915 and xe. See
> is_device_matched() function.
>
>> +
>> +		/* We get n-th card */
>> +		if (!card) {
>> +			struct igt_device *dup = duplicate_device(dev);
>> +
>> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
>> +			break;
>> +		}
>> +		/* Include all the card */
>> +		else if (card == -1) {
>> +			struct igt_device *dup = duplicate_device(dev);
>> +
>> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
>> +		} else
>> +			card--;
>> +	}
>> +
>> +	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
>> +
>> +	return &igt_devs.filtered;
>> +}
> I wondered to alter a little bit pci filter, which currently limits
> filtered view to have single element, but that's not a problem to
> change it and keep matching card first in this view (I mean using
> igt_list_add() instead igt_list_add_tail().
>
>> +
>>   static bool sys_path_valid(const struct filter_class *fcls,
>>   			   const struct filter *filter)
>>   {
>> @@ -1746,6 +1845,12 @@ static struct filter_class filter_definition_list[] = {
>>   		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>>   		.detail = "find pf or vf\n",
>>   	},
>> +	{
>> +		.name = "device",
>> +		.filter_function = filter_device,
>> +		.help = "device:[driver=name][,card=%d]",
>> +		.detail = "find device by driver name and card number\n",
>> +	},
>>   	{
>>   		.name = NULL,
>>   	},
>> @@ -2059,6 +2164,66 @@ bool igt_device_card_match_pci(const char *filter,
>>          return __igt_device_card_match(filter, card, true);
>>   }
>>   
>> +/**
>> + * igt_device_card_match_all
>> + * @filter: filter string
>> + * @card: double pointer to igt_device_card structure, containing
>> + * an array of igt_device_card structures upon successful return.
>> + * @request_pci_ss: a boolean parameter determines whether to
>> + * consider PCI subsystem information during this process.
>> + * Function applies filter to match device from device array.
> Describe what drivers[] array is for. But according to my comment
> above consider to have meta driver 'intel' for both drivers.
Via parameter drivers[] array, this function checks if devices of a few 
specific driver is found whose implantation is available in GPUTOP.
Even if driver 'intel' as a group is implemented for filtering, manually 
the cards/ devices need to check against all supported intel drivers (in 
GPUTOP).
>
>> + *
>> + * Returns: the number of cards found.
>> + */
>> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
>> +			      bool request_pci_ss, const char * const drivers[])
>> +{
>> +	struct igt_device *dev = NULL;
>> +	struct igt_device_card *crd = NULL;
>> +	struct igt_device_card *tmp;
>> +	int count = 0;
>> +
>> +	/*
>> +	 * Scan devices in case the user hasn't yet,
>> +	 * but leave a decision on forced rescan on the user side.
>> +	 */
> It seems this comment is not relevant anymore.
>
>> +	igt_devices_scan();
>> +
>> +	if (igt_device_filter_apply(filter) == false)
>> +		return 0;
>> +
>> +	if (igt_list_empty(&igt_devs.filtered))
>> +		return 0;
>> +
>> +	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
> Having device= and driver= you could just simply iterate over
> this list and build igt_device_card array without any additional
> logic here.
As already mentioned, the drivers of the respective devices need to 
check against the supported drivers[] array in the GPUTOP
to build igt_device_card array. Regards, Soham
>
> Resume and some other nit:
>
> Divide this patch to at least two:
>    a) in first introduce device_filter
>    b) in second add igt_device_card_match_all()
>
> --
> Zbigniew
>
>> +		for (int i = 0;
>> +		     drivers && drivers[i] && !strcmp(drivers[i],
>> +		     dev->driver); i++) {
>> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
>> +			if (!tmp && crd) {
>> +				free(crd);
>> +				return 0;
>> +			}
>> +
>> +			crd = tmp;
>> +
>> +			if (request_pci_ss && !is_pci_subsystem(dev) &&
>> +			    dev->parent && is_pci_subsystem(dev->parent))
>> +				__copy_dev_to_card(dev->parent, crd);
>> +			else
>> +				__copy_dev_to_card(dev, crd);
>> +			count++;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!count)
>> +		return 0;
>> +
>> +	*card = crd;
>> +	return count;
>> +}
>> +
>>   /**
>>    * igt_device_get_pretty_name
>>    * @card: pointer to igt_device_card struct
>> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
>> index 92741fe3c..62e7a1737 100644
>> --- a/lib/igt_device_scan.h
>> +++ b/lib/igt_device_scan.h
>> @@ -59,10 +59,17 @@ struct igt_device_card {
>>   	char subsystem[NAME_MAX];
>>   	char card[NAME_MAX];
>>   	char render[NAME_MAX];
>> +	char driver[NAME_MAX];
>>   	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>>   	uint16_t pci_vendor, pci_device;
>>   };
>>   
>> +enum dev_type {
>> +	DEVTYPE_ALL,
>> +	DEVTYPE_INTEGRATED,
>> +	DEVTYPE_DISCRETE,
>> +};
>> +
>>   void igt_devices_scan(void);
>>   void igt_devices_scan_all_attrs(void);
>>   
>> @@ -88,10 +95,15 @@ int igt_device_filter_pci(void);
>>   bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>>   bool igt_device_card_match_pci(const char *filter,
>>   	struct igt_device_card *card);
>> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
>> +			      bool request_pci_ss, const char * const drivers[]);
>>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>>   bool igt_device_find_integrated_card(struct igt_device_card *card);
>>   bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>>   bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
>> +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
>> +						  enum dev_type card_type,
>> +						  const char *drv_name);
>>   char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>>   int igt_open_card(struct igt_device_card *card);
>>   int igt_open_render(struct igt_device_card *card);
>> -- 
>> 2.34.1
>>
--------------7wPXOujAewo3bnMCnhcb001t
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Zbigniew,</p>
    <div class="moz-cite-prefix">On 28-03-2025 13:36, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">On Wed, Mar 26, 2025 at 12:42:27AM +0530, Soham Purkait wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add filter functions to find all the
available GPUs or few among them
by driver name and card type or card number.
Add driver field to igt_device_card structure 
for storing driver names.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Separate commit for lib (Kamil)

v4 : Refactor to use composition strategy
     for driver and device type filtering
     Refactor code to improve memory
     allocation and error handling (Lucas)

v5 : Rename function name as per convention.
     Use &quot;dev_type&quot; enum for card_type. (Krzysztof)
     Add new filter to return collection
     of matching devices.               (Zbigniew)

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 lib/igt_device_scan.c | 177 ++++++++++++++++++++++++++++++++++++++++--
 lib/igt_device_scan.h |  12 +++
 2 files changed, 183 insertions(+), 6 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 711bedc5c..452da2ee4 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -198,12 +198,6 @@
 #define DBG(...) {}
 #endif
 
-enum dev_type {
-	DEVTYPE_ALL,
-	DEVTYPE_INTEGRATED,
-	DEVTYPE_DISCRETE,
-};
-
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think you don't need to extern this dev_type.</pre>
    </blockquote>
    <p><font face="monospace">As the function
        (igt_device_find_all_intel_card_by_driver_name) need to call
        with the device type as argument from gputop.c so it has been
        made extern to access enum dev_type from outside.</font></p>
    <blockquote type="cite" cite="mid:20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #define STR_INTEGRATED &quot;integrated&quot;
 #define STR_DISCRETE &quot;discrete&quot;
 
@@ -774,6 +768,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
 		safe_strncpy(card-&gt;render, dev-&gt;drm_render,
 			     sizeof(card-&gt;render));
 
+	if (dev-&gt;driver != NULL)
+		safe_strncpy(card-&gt;driver, dev-&gt;driver,
+			     sizeof(card-&gt;driver));
+
 	if (dev-&gt;pci_slot_name != NULL)
 		safe_strncpy(card-&gt;pci_slot_name, dev-&gt;pci_slot_name,
 			     sizeof(card-&gt;pci_slot_name));
@@ -820,6 +818,58 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
 	return false;
 }
 
+/**
+ * Iterate over all igt_devices array and find all discrete/integrated cards.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This sentence is misleading, otherwise what for is card_type argument?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ * @card_type: flag of type &quot;enum igt_devices_card_type&quot; to indicate
+ * whether to find discrete, integrated, or both types of cards.
+ * @drv_name: name of the driver to match.
+ *
+ * Returns the number of cards found, or -1 on error.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You should add some note about freeing the memory allocated for the
returned array.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
+						  enum dev_type card_type,
+						  const char *drv_name)
+{
+	int count = 0;
+	struct igt_device *dev;
+	int is_integrated;
+	struct igt_device_card *tmp;
+	struct igt_device_card *crd = NULL;
+
+	igt_assert(drv_name);
+	*card = NULL;
+
+	igt_list_for_each_entry(dev, &amp;igt_devs.all, link) {
+		if (!is_pci_subsystem(dev) || strcmp(dev-&gt;driver, drv_name))
+			continue;
+
+		is_integrated = !strncmp(dev-&gt;pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
+						PCI_SLOT_NAME_SIZE);
+
+		if ((card_type == DEVTYPE_INTEGRATED &amp;&amp; !is_integrated) ||
+		    (card_type == DEVTYPE_DISCRETE &amp;&amp; is_integrated) ||
+		    card_type == DEVTYPE_ALL) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't this be:

if ((card_type == DEVTYPE_INTEGRATED &amp;&amp; is_integrated) ||
    (card_type == DEVTYPE_DISCRETE &amp;&amp; !is_integrated) ||
    card_type == DEVTYPE_ALL) {

?

Do you really need this function? I think according to device filter you
could use:

igt_device_card_match_all(&quot;device:driver=intel&quot;, &amp;cards);
igt_device_card_match_all(&quot;device:driver=intel,device=integrated&quot;, &amp;cards);
igt_device_card_match_all(&quot;device:driver=intel,device=discrete&quot;, &amp;cards);
igt_device_card_match_all(&quot;device:driver=xe&quot;, &amp;cards);
igt_device_card_match_all(&quot;device:driver=i915&quot;, &amp;cards);

(see explanation below)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
+			if (!tmp &amp;&amp; crd) {
+				free(crd);
+				return -1;
+			}
+
+			crd = tmp;
+			__copy_dev_to_card(dev, &amp;crd[count]);
+			count++;
+		}
+	}
+
+	if (!count)
+		return 0;
+
+	*card = crd;
+	return count;
+}
+
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 {
 	igt_assert(card);
@@ -1705,6 +1755,55 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
 	return &amp;igt_devs.filtered;
 }
 
+/*
+ * Find appropriate gpu device matching driver/card filter arguments.
+ */
+static struct igt_list_head *filter_device(const struct filter_class *fcls,
+					   const struct filter *filter)
+{
+	struct igt_device *dev;
+	int card = -1;
+	(void)fcls;
+
+	DBG(&quot;filter device\n&quot;);
+
+	if (filter-&gt;data.card) {
+		sscanf(filter-&gt;data.card, &quot;%d&quot;, &amp;card);
+		if (card &lt; 0)
+			return &amp;igt_devs.filtered;
+	} else {
+		card = -1;
+	}
+
+	igt_list_for_each_entry(dev, &amp;igt_devs.all, link) {
+		if (!is_pci_subsystem(dev))
+			continue;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why there's limitation to pci devices only?</pre>
    </blockquote>
    Once the array of cards of type struct igt_device_card are prepared
    and populated, <br>
    it is matched with the respective supported drivers . Seems like
    this field is not present in case of non PCI&nbsp; devices. <br>
    <blockquote type="cite" cite="mid:20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		/* Skip if 'driver' doesn't match */
+		if (filter-&gt;data.driver &amp;&amp; !strequal(filter-&gt;data.driver, dev-&gt;driver))
+			continue;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Use may introduce 'driver=intel' which would match i915 and xe. See
is_device_matched() function.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		/* We get n-th card */
+		if (!card) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&amp;dup-&gt;link, &amp;igt_devs.filtered);
+			break;
+		}
+		/* Include all the card */
+		else if (card == -1) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&amp;dup-&gt;link, &amp;igt_devs.filtered);
+		} else
+			card--;
+	}
+
+	DBG(&quot;Filter device filtered size: %d\n&quot;, igt_list_length(&amp;igt_devs.filtered));
+
+	return &amp;igt_devs.filtered;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I wondered to alter a little bit pci filter, which currently limits
filtered view to have single element, but that's not a problem to
change it and keep matching card first in this view (I mean using
igt_list_add() instead igt_list_add_tail().

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 static bool sys_path_valid(const struct filter_class *fcls,
 			   const struct filter *filter)
 {
@@ -1746,6 +1845,12 @@ static struct filter_class filter_definition_list[] = {
 		.help = &quot;sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]&quot;,
 		.detail = &quot;find pf or vf\n&quot;,
 	},
+	{
+		.name = &quot;device&quot;,
+		.filter_function = filter_device,
+		.help = &quot;device:[driver=name][,card=%d]&quot;,
+		.detail = &quot;find device by driver name and card number\n&quot;,
+	},
 	{
 		.name = NULL,
 	},
@@ -2059,6 +2164,66 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+/**
+ * igt_device_card_match_all
+ * @filter: filter string
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ * @request_pci_ss: a boolean parameter determines whether to
+ * consider PCI subsystem information during this process.
+ * Function applies filter to match device from device array.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Describe what drivers[] array is for. But according to my comment
above consider to have meta driver 'intel' for both drivers.
</pre>
    </blockquote>
    Via parameter drivers[] array, this function checks if devices of a
    few specific driver is found whose implantation is available in
    GPUTOP.<br>
    Even if driver 'intel' as a group is implemented for filtering,&nbsp;
    manually the cards/ devices need to check against all supported&nbsp;
    intel drivers (in GPUTOP). &nbsp; <br>
    <blockquote type="cite" cite="mid:20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ * Returns: the number of cards found.
+ */
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss, const char * const drivers[])
+{
+	struct igt_device *dev = NULL;
+	struct igt_device_card *crd = NULL;
+	struct igt_device_card *tmp;
+	int count = 0;
+
+	/*
+	 * Scan devices in case the user hasn't yet,
+	 * but leave a decision on forced rescan on the user side.
+	 */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It seems this comment is not relevant anymore.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	igt_devices_scan();
+
+	if (igt_device_filter_apply(filter) == false)
+		return 0;
+
+	if (igt_list_empty(&amp;igt_devs.filtered))
+		return 0;
+
+	igt_list_for_each_entry(dev, &amp;igt_devs.filtered, link) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Having device= and driver= you could just simply iterate over
this list and build igt_device_card array without any additional
logic here.
</pre>
    </blockquote>
    As already mentioned, the drivers of the respective devices need to
    check against the supported drivers[] array in the GPUTOP<br>
    to <span style="white-space: pre-wrap">build igt_device_card array. 

Regards,
Soham</span>
    <blockquote type="cite" cite="mid:20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">

Resume and some other nit:

Divide this patch to at least two:
  a) in first introduce device_filter
  b) in second add igt_device_card_match_all()

--
Zbigniew

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		for (int i = 0;
+		     drivers &amp;&amp; drivers[i] &amp;&amp; !strcmp(drivers[i],
+		     dev-&gt;driver); i++) {
+			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
+			if (!tmp &amp;&amp; crd) {
+				free(crd);
+				return 0;
+			}
+
+			crd = tmp;
+
+			if (request_pci_ss &amp;&amp; !is_pci_subsystem(dev) &amp;&amp;
+			    dev-&gt;parent &amp;&amp; is_pci_subsystem(dev-&gt;parent))
+				__copy_dev_to_card(dev-&gt;parent, crd);
+			else
+				__copy_dev_to_card(dev, crd);
+			count++;
+			break;
+		}
+	}
+
+	if (!count)
+		return 0;
+
+	*card = crd;
+	return count;
+}
+
 /**
  * igt_device_get_pretty_name
  * @card: pointer to igt_device_card struct
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 92741fe3c..62e7a1737 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -59,10 +59,17 @@ struct igt_device_card {
 	char subsystem[NAME_MAX];
 	char card[NAME_MAX];
 	char render[NAME_MAX];
+	char driver[NAME_MAX];
 	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
 	uint16_t pci_vendor, pci_device;
 };
 
+enum dev_type {
+	DEVTYPE_ALL,
+	DEVTYPE_INTEGRATED,
+	DEVTYPE_DISCRETE,
+};
+
 void igt_devices_scan(void);
 void igt_devices_scan_all_attrs(void);
 
@@ -88,10 +95,15 @@ int igt_device_filter_pci(void);
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss, const char * const drivers[]);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
 bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
+int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
+						  enum dev_type card_type,
+						  const char *drv_name);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7wPXOujAewo3bnMCnhcb001t--
