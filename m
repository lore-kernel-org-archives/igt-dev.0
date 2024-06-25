Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B87C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 05:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36C10E02E;
	Tue, 25 Jun 2024 05:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtQqJDTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC99610E02E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 05:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719295135; x=1750831135;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6bdslUytieaNUBRpwhAeqxRqr6oIRJUMVVfXiNchyok=;
 b=TtQqJDTznXa5njuKkKBX6VEP71nl2DPeXc2Jp4qGLa47xS7atIEQGbAa
 Hp66g5+ZII/YTlSJbaYIuAdI3yP313aipdc+TjsKBXpG1k0UAJQrWT3Im
 QP16+XMjJV2nHqLZ3PhbnqbwdXLRpl1YrhYZzauAuJPPa5DTq+ScC5Agj
 Ekbd62mthUG7wGd3RpraC1E3JQUucjap5t4w6+3p8SPWA4RT5ZGey5y6k
 al5Lp7dbb1vCfXrDiLbzDob2a0DCZAJc4vOnKjpWtp769PMDizrdCwi3S
 F5LEExqGfn0znJ08+lmm/Rb3RGr5ufg6uXVMcXPNtd+uzLx6k+T98q6hG Q==;
X-CSE-ConnectionGUID: NGvqFAkPQLiRMXk6nvBjWw==
X-CSE-MsgGUID: b539y9fyTMSqlYmup78e9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19189915"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="19189915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:58:55 -0700
X-CSE-ConnectionGUID: Bq4GFkW2SXyBk9anuFPgWA==
X-CSE-MsgGUID: pyPsOvJbQu+7JQJGxORySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43339539"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 22:58:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:58:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:58:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 22:58:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 22:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPh8PwNJqCb49UeidzCz0QtBfz00jmkpT30ymB4sLYnBm98clVkNjWmKebJJ09nNCIyIiyeH/fbCAnZ3IPRT57RCua8nLu+Hp8/ERQVkwhmTtUVrs1cOsaMIRj+t2g+UbZMphuSO7vD0YRwMck6ddqRMfZq+t3JMCSyPVbwY/3bzIur/F2n9bsa0JoJI7fDPj9zejlYdLSw+QRmRYsa0RsNoXeW0VvmDCKl7c/WWaaByQPKJjy7izMJsGsNE3y0kGfHbzciJ0/jAKtheF35T3YrBtM8iCMD4JGcH+FZnh/L9ukvC5X0sA4Y4/vfhoHNwvEVQgov8TvDjj6XN54gn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tnjw5xTETDHKhbT/L/bpK2fiRVHCPdhUwbyDHSFRC2s=;
 b=h/eKVYA4TODUdjXyDpkgGRgcFjyWrgWDATTjWzgY0ihhB2y95+O/5TdRsOZ0jrv7mVcpVLtCPS/WzB6uFPTc7hTVF5bKUcpyOOtR10+AfKKFdc4KZ9+xuxESGnsOn0K3LD0evH5eztbNTcNXC7kOM7AuT1ZrC5RdVGftcvsj5tP0268ybL+YUwnnJXq8vd+f+ojjcvd8cx1aI0CEhGMV+XBZ/g3I5HIdEFYjKRkIt87jfqNe9FuU8wNAsLnKuVNFGtosCUOt6ftJB6EUU7en1WZ8dBudYbRH5IZb+6ITYNxMYz6yZgMnpt5fxJk6udXRCsA8jK3yF6ZN8iS9Q0daHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 05:58:49 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:58:49 +0000
Message-ID: <8b91f1f2-129f-4bb9-81c1-e2307bfc58c5@intel.com>
Date: Tue, 25 Jun 2024 11:28:34 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fhdr=3A_Fix_bpc-switch_subt?=
 =?UTF-8?Q?ests?=
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>,
 <tejasreex.illipilli@intel.com>
References: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
 <171929347649.153309.5995172191402209433@a6498e030952>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <171929347649.153309.5995172191402209433@a6498e030952>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: 11792752-ed83-4278-8c44-08dc94dbe246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVoydXRHSWhSNDJ2UnJBdHc1aEFvdHZnN1NnemtCRFZGQ1NBRTB2RnU3VUFm?=
 =?utf-8?B?ZkhKWUtQVHR2alRCOWs1ek1wcDhjRWN6OVNPMytzVW9oUFk1cjdkaEhUQ3Mx?=
 =?utf-8?B?SHFVY1ZnUmtyM1F0N01DQmpBQW1GZzZxOFdwT2xjKzRzeDFNTGNCRnBqZjRi?=
 =?utf-8?B?Z09ZaGVKVHBBaGhtY2VLSW5EUGtTR1AzUDdiMkdpem0vSFI2d1BKSVVIbG53?=
 =?utf-8?B?UWREWXBTc2tmREwyOGs5SUFidFpzV3dMQS9mVGJPSUUwN0lVUW1XYm9WeFl3?=
 =?utf-8?B?SER6bjYxbXh0aG5RV0hETGRRY1l4Qy9rT0lQaHE4T3BNbml3UjNEZ2J2ZURo?=
 =?utf-8?B?N0Jwa2REcXlnSytkWitkNm55QWZvczRNc0l6TlVxZ0JUZC9aWHRPaTdQVUNG?=
 =?utf-8?B?bkhad0FzeE42TXFtWUI5QWlrUjViMTNlSVUyMWM0UWZNc0oxWFMwWkh5RkdE?=
 =?utf-8?B?N0lnV2pVc3ZDeUpOOVgrUXI5T3ZDOTRvdi9qcjJESFRaMDlzdUR5cVBtZS9D?=
 =?utf-8?B?RzJCZ3FsVmZQRTRVNG5vM1pzUEJLcEx2YkFOd05OMXhCRXErWFNLUC9KZk0w?=
 =?utf-8?B?VlZqcUNJYzhZbDEwTVhtWGNlRSsvSXM0eUJyKzZ1b0cvK0R6dm5EL2FuSDJa?=
 =?utf-8?B?clBNNnN0bFllL0tDc0ZDNmM1TTRLZkxOTWhYK3IydEFXMTZQZDFMYWdiZlRp?=
 =?utf-8?B?dGxlamFwd1BCNGNBWnROdmoxTEwxZ2dFRzl2aHNSeFI1RGpnMXgvZFlUcW4y?=
 =?utf-8?B?aExkRWkxaFBxUGRLRHBmQ3BvdjRndkhCVnF3M0c1YlNkcVprTFhsYlNUdzdI?=
 =?utf-8?B?eWFVQXcvaGtzOUh0RnNGTDIxa2puTnVRbUYva2tVZVB6UnlDNmdFdmlaL0lJ?=
 =?utf-8?B?cHpnS2R0WFhPVWdZYXpvM3FXbHJ6dWNLd3UyY3hQME5PbURDUHZpQUFJS2lx?=
 =?utf-8?B?RWVpdXZyM2FUSVIrdVhBVWVuOWg0MmU4RUJnWjhaKzBVWTVqMk5SQytwUEVm?=
 =?utf-8?B?OUNGa2Q0RExDVnJtTUFRVW1DMGxxUGh0NkpLd3JXTmp4RUd1ZDg3SmtWV3pM?=
 =?utf-8?B?eSszaFMwRnpoUzZ4Qm9tYnpRYkJtTmdobUtPbzJUckt6dE81OXVBTmQvL216?=
 =?utf-8?B?a1BlUUlPcDN3NEhreWEzZVMzTVdOeFlNeFRydldhTzBYUmh0TUxsTVBhTG1S?=
 =?utf-8?B?SWZIcUxsK1NtWXM2VlA3VTlLdEd3UXRONnpTVnM5bGh0Tm45eDdvVEhScDVR?=
 =?utf-8?B?dE56bWY4cEF0MUdGOVhha3N3UnhDdVRHSk1WNnE1UTk0ckxCb2FBVjRBTXJ0?=
 =?utf-8?B?MXU0Y1lXVUVRQTM3bUt1UThNTElwbWNTdjR3N1J3Qm50UkZaZU53L2ZQRjZL?=
 =?utf-8?B?cXk0Qis5WkJrdDNYcyt6b0l6NmNYV0F0dCsxWTJDby9rb1Nnd1NjdHU1bEll?=
 =?utf-8?B?Q254bkxsZWpjTUFZd0tLLzVoaFFNODVianZmSzFLQWtqOEVRM1diZGVQZlVT?=
 =?utf-8?B?Uk8wR08xRnBQY2pHTnJQRjV1TjRMVmZTeUNjRDJlZ1BFbnZ6YXEwbVVBUEM3?=
 =?utf-8?B?aGx6allCL3hUNEozb1l2Z1VxWFVsaUlBQjAybnJQa1FOVEpPSFBDUGQ3Z3VG?=
 =?utf-8?B?bEtOYU51RXEzWjg4b3ZnM3N5MG1mRFVac1ZwS05wUHNuUjZwMWtaL0sxTUNH?=
 =?utf-8?B?aHJpWTBOZE5tdDFSNmE1M0ZZNkpLQnBNNFRMeStEN1QrZGIxRVo4K0xRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VStqTDhLT0NKNW9BUVlMdHRrdHowRDhtMTFCVkZ3OXRTNHRxNGJvc2xBeTB4?=
 =?utf-8?B?Ulg4cDJGaERTVUphKzdoWVoxQ1lRVUZyZ0xPc05hTHRpcW85ZVJyMFgvbVZJ?=
 =?utf-8?B?OHlvbm0waUcxTy9HTjFqd0ZuOHg4djdqSElyNXR3RkNRWWdUV3NRd2VpeTQ4?=
 =?utf-8?B?d1dHWkd0NHQzZWxGbE9sK2RWWmtZaXpwREg2N2lUMnZoMGlmUUdMMUZ3bUFp?=
 =?utf-8?B?cUprUXRTQ3dFOGE1MmhJYlZQQWtCeUdFYVlmY0xsNWQ5cWUzVk10U1BOdGZG?=
 =?utf-8?B?bXNXN3NDdmZlQmtIWWNFRHNhZWVpc1ViUDBqd052R1VXSEV6Y1BhNGJDeU1H?=
 =?utf-8?B?KzE4bW54emxPTzNFUGNNNU1INzBWdGJ6V3hkNHBhOUdhS1JsU2NrbXR2MHFi?=
 =?utf-8?B?Wm5maXFuQ2JwNkpGZlpJMXZxaVMrNmV2S2ZBRVF0V29XZzFjM0R4aUFVYks5?=
 =?utf-8?B?d0UzYVYzVFNJdmRCZDdzbzBkcUlkVWloUU0za2NQei9ZTkxuaWhUWUpiNXFP?=
 =?utf-8?B?cUg1TnV6WUpxeWpaSkZNaVU3clZYMjJuemEvMHNhcHkvQldOOEQyTTU1d0RC?=
 =?utf-8?B?QVBKdUxEU0dnbmRqQml4dnZZQ3Exa2tvdjk4My9JTHB0bzFOaWRRdTVNNk8y?=
 =?utf-8?B?T3FXdTRuRDcxZld2eHBkNlNxT2xaTmJOSGlYQThoV3ZmeHhYdWNCQm9TUWxk?=
 =?utf-8?B?RGNhRnlDUi9aMlVFVnJIUWNqdFd4c3B0YjZjUC9KQVRhSTdqV2h1THYxL0Np?=
 =?utf-8?B?emd4MlhNb3pzVVQ0Qk0zZTAyVnA2ZnpUUGx0VnI3Q3pLLzVzUEk4ZEl3RkVS?=
 =?utf-8?B?N2xsUms2di81NGdKUWZnOStkblZidTFFbGlrNjNOSVZzNE1mVVFWSlM4Nzhp?=
 =?utf-8?B?Tm41cFVyWk90QmJXUjdMT21hNjZkbE1MMDBucnVGUUN6U3RiTDViblRRR3pj?=
 =?utf-8?B?YnhRUERYdTdkczRpZ2Y1cm1nZnBzb2F0dXU3ODdDSWJaNnNUMUQzWEE3WlB6?=
 =?utf-8?B?MGZncG9wOGN6a0hhMTZPZUVUUGZNczF3VXZ0ZGlOZUJXc2xZeElWbmZZTEQ3?=
 =?utf-8?B?SzNYV3E4c3h3QVZnS3dKWHF1TGxNaVc0bVRubHRlSkZJZlAzMFhQRjVjcmh3?=
 =?utf-8?B?UUNPSzVnNE9STnpvLzRaSWVkMDhDQVBlUlpQYjhncGpMU2JKVFM5WFErS2I4?=
 =?utf-8?B?UHR5eWsxWHBRZGRwaHdZK2piUVJtcmU5djluT08raUhzWE9hc2xVSlpyNlJP?=
 =?utf-8?B?aTFNS1FwT29Kdk1KMG8vQm4yOTJ1dWY2dnFIRFBRS3FCaU9jSlZ1djVBU1E1?=
 =?utf-8?B?N3J2YVE3LzV1eWdJRlpOcnREbENGc2hKWXllcDM4VE5WSDRUZi9BU2RKZUZR?=
 =?utf-8?B?dVBhd2Y3RVNrQjRvVjlPUXZKTWlzR2IyaCswQjAwRHI3UlI5MEE1cUV0cmYw?=
 =?utf-8?B?eHF3VEVSajdQQngwNy9DWFRRUGtFeWFuZy9DSjRVcWN6ZEg4VlExU2dmUEs1?=
 =?utf-8?B?bWxFdjZjTGdHeFBLNDhIQ0NzU1ZDMWlYL3RyRW10RmpXMzdzazlldVNHYXBF?=
 =?utf-8?B?RC9NU0hVWU5IQzIvR2pKR0w5OVMweUIxNUJzWDdJMURIcTFMSm5td1NQVkhk?=
 =?utf-8?B?Z1B6WWJKazhHLzBZVDJqU2JtRlFvVDhUS2hocjliL2hwWDFUVEc1dDdkVXp3?=
 =?utf-8?B?SGNlSFVobTRaSjVtcG4yd0xuUlc2aTZXdnFpWng1aURwRmE1d2dHVnNRbkh6?=
 =?utf-8?B?U21DUmVwMk9qaFJkQ21sRGI3Z3VEZkdRclFWVURzL09yWXNWNk5Hbnk5Tjhu?=
 =?utf-8?B?aHBCL24vQnhSWDgycUU2UmR4Uk83UUdmUndWZ1l3ZG1ZL3l4bzNsWUhrMWI4?=
 =?utf-8?B?djJlYnhzS00vYUs5V1BVR1h4RVY5ckJCNm1UbU8rTm1tSU15cml2d0xqNHMx?=
 =?utf-8?B?UHdXeUZRelBKK3FPdmhCQ1VLYWQ3Z0hvaWNpMndDeUFaUVNuT0dKR3JiR2lX?=
 =?utf-8?B?dUV0RnhKZjFxYkV2S0JUcjBwZHdmUHdJYXRIY0JienJTVHQyMXdGdUgvY2NQ?=
 =?utf-8?B?SUVJUzg1bnJEQ3p6YkZxRFRpNURFZG0rSnB0cDhpTFpsMm1lQUFwR1FuZmhO?=
 =?utf-8?B?SjBSQzA1VGZ0aTlPdzZET2VEM0dLdUFQREhxQmIzY04xVFl6b0lUZjR2QWlz?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11792752-ed83-4278-8c44-08dc94dbe246
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 05:58:49.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BHt1BnWgne+N8vsTJD35k4dWZ5ISYHVyez0QqokQuOIDvwwhrNjTUdq+2bXAcr6XpaX4ZATzwLfqHoxvtJ+YVwX3OdExfTbQ5eimgqgRyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
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

Hello Bug filing team,

Below failures are not related to this patch series, please re-report.

- Bhanu

On 25-06-2024 11:01 am, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/kms_hdr: Fix bpc-switch 
> subtests
> *URL:*	https://patchwork.freedesktop.org/series/135334/ 
> <https://patchwork.freedesktop.org/series/135334/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_14996 -> IGTPW_11308
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11308 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11308, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/index.html
> 
> 
>     Participating hosts (40 -> 41)
> 
> Additional (4): bat-dg2-14 bat-dg2-13 fi-cfl-8109u bat-adlp-9
> Missing (3): fi-kbl-8809g fi-snb-2520m fi-bsw-n3050
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11308:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@requests:
>       o bat-mtlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14996/bat-mtlp-6/igt@i915_selftest@live@requests.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-mtlp-6/igt@i915_selftest@live@requests.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11308 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-cfl-8109u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o fi-cfl-8109u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +7 other tests skip
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o bat-dg2-13: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html> (Intel XE#484 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/484> / i915#4550 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html>
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o fi-cfl-8109u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html> +11 other tests skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html> (i915#9812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-adlp-9/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-dg2-14/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>       o {bat-mtlp-9}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14996/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html> (i915#10580 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-6:
> 
>       o {bat-mtlp-9}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14996/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-6.html> (i915#11009 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11308/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-6.html> +2 other tests pass
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7898 -> IGTPW_11308
> 
> CI-20190529: 20190529
> CI_DRM_14996: cf83cd8ff370955a504fdf1388ea6e257da76a8b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11308: 11308
> IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
