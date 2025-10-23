Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46B2CCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571D510E07B;
	Thu, 23 Oct 2025 06:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZOpJYmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E098A10E07B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761201990; x=1792737990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gFuTR88TWks/SrrkggxPGYmZUaH038SUU/xcHy90Sms=;
 b=CZOpJYmbWbAUnxjVTcAsIvu8FmQheivP3ax7AOUhjiXgw1ZIo1arZdKy
 D6lWLDXY45zVoEX5/+5zYSg2vV0LPk0t4Pr8omrcfrO/AYzFOiFjafu5l
 U00pJdKd5zeSa3duqCQMUuC5K7zBFmxaLgLiY4kdke5rqBT5zQFa5l9YH
 DAgfNJvXomhkRnoKF3/M5tuiN0PhYbgzZNQ0SWww+sGY8/C4QhKPeWyXp
 n75A2OmvHKFJFD9uASYB21PAYH7/SxPqZgyMgv1JRidjrQzYx+1wdoBZJ
 UioxcW0l5JDfFEWi05urIqh4PdHDS8ZdafUunBnnYVGkTwzaCiAcPkcxG A==;
X-CSE-ConnectionGUID: MqNjpLl8Rv2K5zRxFWQe3g==
X-CSE-MsgGUID: A+1LBC0oTBSudpXdIyFpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50940373"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="50940373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:46:30 -0700
X-CSE-ConnectionGUID: oe3tj76QQP2EX7zIBK71Sw==
X-CSE-MsgGUID: ymesWNvyTnm/xi7Jp3j6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="214728235"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:46:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:46:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:46:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0p93QbdH787NRBZG/dGuUsi8QoHjsDLX9jed9EDAMo2kKhU+4QHbbnMRTg36og6Tp10aKwboEkk7JJMjh1p1rZ+OzNvuerYXJZ8Iv13Ok+f5fPPjtonlV059CmpRK9NEqqM/wGwVnId4pCnpLhBwFR8qnrlklsk5/5f8rWA//biBwdfzTLQctz8RQ6tfhY2sZ473SyOJi9F28NLOPEpjS7RlC22y+KlwnzI9feIOQZMBbRLxVdjUuRywoYhMbFKGMhY5fSRNNYquol073aq4bHTUV0UeuBT16rPX5McIxO26jg25bpVoDhyhK+jkYmeG9B/u4mYV6ZAWpMKlOFU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WywVQvUWPYvLS8X/lHd770DRqAe0/saqFlKC6xQt4I=;
 b=B5RzbfMBhSH8zqPgF9Fucob5s/AEFIVDqkUPTW7fA+AtO0g9p2Ph37PT34rlth7MK1Z6HiAiRliukIK79fQif+gdyz3bnie4IzxGk7fAOQGYMjYvwve2r0ds42D1+OpQuieHHzk5KpYyE4ISOgP4CD5PdH4+10pFpSHG7bbqREQt1cdpu+Wsm0Z76tJEzOjjfBlHWY3aDBmSrPxRmaoxOH9FqC0c0h/ND7ExGhw4ZieP8fknoGZxdRdVh1GYUwR/tAO8EYRIi0FUwFYwZ0kPaY/6QtkZ1PQ/5gn6WxFy7NEbThE8Zle5h+HJUuLqv0FIrB+EexAvON0qgXxy7XwbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Thu, 23 Oct
 2025 06:46:21 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:46:21 +0000
Date: Thu, 23 Oct 2025 06:46:11 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1 1/3] lib/drmtest: Add raw card|render opening
Message-ID: <tfgxsi2pydcxnycgki7whxwbuigfz7kuvpjwhinaenkxcvx35g@kje5iguk5xo6>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
 <20251020161846.156952-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251020161846.156952-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0216.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::14) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|SJ1PR11MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 14412a8c-056d-429c-f2b6-08de11ffe060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFhhK2NnOW1kd3VndzhTakprcmc2cXZ5M2dBcjdBcVR2WWtNUGlIOXAzU3Ry?=
 =?utf-8?B?c3k4YnVTT2dFVk9KNytPWUpOdzZkdXFaYjV3MjBncVZwNjFoVmtZVDM2Y2Fa?=
 =?utf-8?B?R2k4Qy9JUmU5YzZKYUJxNjdiRFVtNkxCcDNQZGFsOHNST2pQNWRrajRqVUR3?=
 =?utf-8?B?cHRvZExwOHFKenU5SHBoc0tUUWdjNEl1RlZCNG9JVm9sWFNTVTZRTVFZYTgx?=
 =?utf-8?B?WDllY2NkeWdPd21hc3IxTVhRVVNOWmwxUnNLYWRJZXhnMXAzTTFMZzNvaTF2?=
 =?utf-8?B?Z1J0SUxORUl0bEZnb0MvLzhEWG12Q3lBSXpYTVpFNFF2cUNnMVBOaXlDZklB?=
 =?utf-8?B?ZGh1cVNzcmV4RHR6ams4L2ZCckhnemdPVlhyUGNScTEwSVAwNFFsby9HOUtF?=
 =?utf-8?B?SkFqL0VlSm9aRkhsZXpxcmthTURZWDdxTGhxMENYclpCMGs2STZWVmExVHAx?=
 =?utf-8?B?ay9vT2todCtTcDZxZXNYUGRpSU42Z0lZZC80VEhVM0txU3dHeEcyZmhsd0I5?=
 =?utf-8?B?Q3FRenEvSHd5d2Uva2laU011MEp2Tjk4aEk1WFlwQmFUR1ZvYmcram95VGJ4?=
 =?utf-8?B?L2ZsanR2cEdFZyt6UlZ1Uko0MXZYVDdRNk03aDZwZFhRMnREM1VxbURWQ0tR?=
 =?utf-8?B?enFCeExBeGt5RGttakJpelhRdzBrUURYTVVSTldWVlBNWDFHVy9RUndWd0xS?=
 =?utf-8?B?NjZIVFA1bWY2UmVIdWt1eERLeTZYckF4dlV5b3Nsc1VqVXk0elFjdDhZQzZD?=
 =?utf-8?B?ZnlMWWdzVFVRdFM5RlhRbjkrL1NGNGJWdTVqN2FBT1BBdFNwWW54QklJcDlp?=
 =?utf-8?B?dWRBOVJSKzVmdFJqRVNUWXBvTzYrajlQM0N1UjRKWTZmdXpQNUZLTUEzVnRL?=
 =?utf-8?B?V0tidWJ1Q3Zxbk04akQybzYyeXZYa0dxZWJOVllLR1FicXNqQ21wdTdyQ08r?=
 =?utf-8?B?TE13YnJBalFVZ3dVcmgxSU9iRG5EYnJJcjdDaTBRNllXNUFERU1IZ0l2ZnB6?=
 =?utf-8?B?ME04SFpzMjBHbVVrSEZNQnUvWGNBS0gxMFhmcEgraUdJcHErV3VDUVZFdXlK?=
 =?utf-8?B?Y0RwSWR6eHBuc3k4YU5ZMGpmUytnYytjd1NRei9yZTdwd2dCVmNCMDZXaW1T?=
 =?utf-8?B?bE5ZKytmbzc0bURmMUo1d0src3FMczVveTRTbEFWSlJkNGI0aGpZb2ZvR0sv?=
 =?utf-8?B?RGN3eGluZVJEbzM0MmErd2J1aWRta3FNV3pibmZxQnNNSW9EVTFVRjJrMzJK?=
 =?utf-8?B?dTlpdXRaY2VJRVRLWWhERzRlTGFLeXpsSFdaOWRNY1NTL2IvNmZJc3ZmMlNz?=
 =?utf-8?B?aHNPZktMVWYxNWk0M3lkTWVOK3FFeUEzMlVVWGFCSzNhSnNMWGtoUHArTUxC?=
 =?utf-8?B?TFkvSnRkWmp4VFZuZ3IyQUF6T2thZlJ1VlZZS2dkTDlWQ2Qvb1NyTGd4bVZt?=
 =?utf-8?B?aTlvdEVHcjFYVnhTKzJNTldqejdiQVNDbVd4dldiWjV0YTNTUTlSbk15RWlN?=
 =?utf-8?B?U0RQUFBOdFFFeDlxY2NJa0NBZWQyVUh1NDZkQkJpL0pmSFh1dE4wamk5SnNN?=
 =?utf-8?B?azMwYmpCVXVtRjZuc0RTTElBNEhRTW1Yb1lBZUFDLzlpeExJMTJ2WWk4TW5N?=
 =?utf-8?B?eTBhbGc1cy9oUm4zMmVWM1R6Mm1TdDR1TnVPUmdiUVZpRzhscitmMXRZRDdM?=
 =?utf-8?B?L0E3VTNVeDNBbUdJVG5oTTRIZzhEZ3I3REZ0amJkeUVWNkVDaWliNTVMenJ1?=
 =?utf-8?B?VndrTmZjeElLKzhNcHhsblR4Y0xGdDF4VzVublF1cmM0SlVyZWxpS0p2Ykhn?=
 =?utf-8?B?cDdCRDYrdUJTNm1MeVlweUhQdEtuTXZUMXhNYUtleTJTenUrOXpmSm81WFJz?=
 =?utf-8?B?ak53K0t1RitYdEVzL2RtMHJMSzhRRG9RK25RSjVxUm9GM3krcGd5MzdGMFFi?=
 =?utf-8?Q?UC1OWIHAgx3JXDGPtb8nmbgKuDF8m3Ym?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHlzYXE5N09Jaml0NlB3anRVM0JwZUlWUmxMUTRBZWEwbXhhZnlXbTc3aExr?=
 =?utf-8?B?Z21EcXlDMzE2dkVkWklkcVZJYzI5RE1DR2o2ZDdOTy84YllQOWhZZzRwL2ln?=
 =?utf-8?B?eW1BQ3BMU3BhaFZnaDE5SG9UdW9QTFBSNFViQnVBSVZkN2xFbU5ZVngxenhY?=
 =?utf-8?B?SHpxbWhOeGlvK0wyT0h0UEFmeE1qWER6Y3loKzZSN2Uvci9URWNiT1c2SVJV?=
 =?utf-8?B?d0hFSThYSUp3ZHdsbWVqRUVaWTcvaVJwbzRwQnVZTkhvM1FUUS8zSFVBb01Y?=
 =?utf-8?B?YWxVZ3hYUnc3NW85UExwOVdtbmp2b1lqMTRNZEFWaVZuRUtlaXVwdFNFeTh0?=
 =?utf-8?B?WUtya2lYUC9XQURTWFlBSXdwYkRoRVV5Z0tSZ1VoTTZpeUxtNThYV29IQmFO?=
 =?utf-8?B?STJGRHJvQWp4TnFBcC95ZnI5SDFZanJhaGJZa3F2WWlxNFFXcHhnTDdmZ1kv?=
 =?utf-8?B?MTdqTVdSTWtXQXl4R2VFZllBQm1UcHhWSWp1V0YrVzlubitrc0h5OXJqUW5B?=
 =?utf-8?B?SjBFenVZZ01YNU9DOElEWkkwVkNkUjRuZDYxdzliMnBvSWdkWDd3bWpnTjQ5?=
 =?utf-8?B?Zk44alBaaGZUVHVEdStQdVRqQ1ZCQ1BxQVFkVzhJVVk3Y1o5OWRSWm5oT3hj?=
 =?utf-8?B?M2UyaG5MNmcxQUFtODRPRDg5dE9ISWRuTXJzN2E0K2hvaWtpUWlyeEtxNGtz?=
 =?utf-8?B?UW02UGdPUTUyRTZRM2R1QkMrZ3FtS01oR0k5bHBJK3ZMcG5sY2JPa1BuSVJQ?=
 =?utf-8?B?MXllaUt6cm9jTTFWblExaXdpSzNZT3JxRHR1RDRKNGR2MTI5OFF0N0IzbzFm?=
 =?utf-8?B?bjloSldObzg5NHpDWmZBeDBiMnF4NU9maFUwWFU2OVkyK3J6WFBOdkxicFBT?=
 =?utf-8?B?Y1B6VW5sZU82RENOYkVRUDNLeWc1cktwYmNYeUpXM0JIbXFyazNLRk5seGNs?=
 =?utf-8?B?OUR0OGdOMWdUdzdSckRZV0YvUlNhMFNERmhYZU55T2pEbmFoWUV4N28wNXpu?=
 =?utf-8?B?YXN2d2VrbHVKMEdTQjVXRDFrcUQ0L1UrVXQ2c01BTVJmSmR1S2tGdkRIdzZx?=
 =?utf-8?B?L0phdzlkS2dJQ09KYzQ5MGsrMnVlYzdacU5oUG1CMmJUUERPRHhoOHZEc0lE?=
 =?utf-8?B?TlEvR2xIVEVaaW1FUXhjdEg0ZndSZHNtdE8yUWR0MmhuOFZCVW1UYTV5WjZE?=
 =?utf-8?B?M0NxaXBwbFZQNWVFeWhyQmhFYUxZc1JSV1JxSzluSktHM2RuRzNtWFlyVytX?=
 =?utf-8?B?dmNpUFFsdkhkSlhLU1U3dkNCeVlia2NHbkFtY2JsK3lLY1F5WjhjQXRKdU10?=
 =?utf-8?B?ckY1OE8rSmpBVlBHZDdUU2dVMHh4SDJieC9hNU5ObjVjYlNmM0xuajZnNzJS?=
 =?utf-8?B?NnM3dVYzQ0FVenlWUS9Xbk9WbFF0enpWR0NTMHlHSTRwZWk0UlFhMUE3VkJN?=
 =?utf-8?B?S3pRUEUwQUdNRFdQN3hTYmY2U1BQQk9BTWROb284VmM4dlJiUGdVcEV4OGwv?=
 =?utf-8?B?cE5SOUpjRXNVeERBVUtmWFF3RkpTQzVNdXRIdnZuNGcraVNlaFZQYkQrRWs3?=
 =?utf-8?B?WEgxcjU5RWtZWFdkMVVGZTZlYXdiMUZ0NkpKQ2gwV3Rla2pDM0lVdEp2aEZR?=
 =?utf-8?B?bG40ZW5XMElKZU1BTnpQbjZOSVg1ZGdWYXF2a09oSTdoL2ZPREpIbGd2WUNJ?=
 =?utf-8?B?T3JobzNIUVN2dWswcjMvRy9hZzNhK3ZDbmtENDh3b21SeEJmR2V0SkRIS0ZK?=
 =?utf-8?B?aWFPQk1PUGJlY2RwOXhmQnNoZllIN2tiTG5LRU9TUm1DQWU2QUIyQ0NHdTMr?=
 =?utf-8?B?WEdWQnVmTlpMTGJ1a0lVbS8yUENTZncwSE5qVTNoN0RKdVA1blJwR01lRVM0?=
 =?utf-8?B?VmJKTktMdU8wQUVwcXNpVWJVZEUxbERPdURxNmhjTGt6YURBOHc0TGJFRFZv?=
 =?utf-8?B?MjE3ZzhkaThac21GQTBsRkQ1SC9ibVBndmlEdXpyaW9uOW52VGlsRzVpZzh0?=
 =?utf-8?B?TGFqa3Z4L0V0K0QvY2lZcmVGd1lGOWxiMVE0empIZnVlSGZVdlkxMk0rOWxS?=
 =?utf-8?B?bWowOEJRQU5hZXh6SmtSbERad0x1ZkRvTzVROVN1b2JoazIzNEFnai9CMEt1?=
 =?utf-8?B?bHp6azhwTURxSnhiQjhkRm9iYXhOcFpKVGFDQ3ZlUnJnUmdpZjQ2Q21lRE1Q?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14412a8c-056d-429c-f2b6-08de11ffe060
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 06:46:21.5727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYXCsSZYgGv3IfOUb3eF8QgzUieHKUDMMiOLsVA3JdlEciQhRzzcJxc1hlf0iiRrLjfs2IZ2abR62Nl3ZQUEXmt2JrQl7rvNNCZXbf3jAV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
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

Hi Kamil,

I noticed one minor thing below.

On 2025-10-20 at 18:18:44 +0200, Kamil Konieczny wrote:
> Add two functions for opening dri card or render, without any
> driver loading nor caching. This is using starting index from
> zero and will return -EINVAL when index is out of bounds.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/drmtest.h |  2 ++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index a1fb0b5ba..ede9f07fd 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -313,6 +313,80 @@ static void log_opened_device_path(const char *device_path)
>  	igt_info("Opened device: %s\n", item->path);
>  }
>  
> +/**
> + * __drm_open_raw:
> + * @name: DRM node name
> + *
> + * Open a drm legacy device node with given @name.
> + *
> + * Returns: DRM file descriptor or -1 on error
> + */
> +static int __drm_open_raw(const char *name)
> +{
> +	char dev_name[32] = "";
> +	int fd;
> +
> +	fd = open(name, O_RDWR);
> +	if (fd == -1)
> +		return -1;
> +
> +	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
> +		goto err;
> +
> +	log_opened_device_path(name);
> +	return fd;
> +
> +err:
> +	close(fd);
> +	return -1;
> +}
> +
> +/**
> + * __drm_open_dri_render:
> + * @idx: idx for a render, starting from 0
> + *
> + * Open a drm legacy device render node with given @idx, starting from 0.
> + *
> + * This ignores all IGT environment var settings, for example IGT_FORCE_DRIVER.
> + *
> + * Returns: on success DRM file descriptor.
> + * On failure -1 for non existing render or -EINVAL for @idx out of bounds.
> + */
> +int __drm_open_dri_render(const int idx)
> +{
> +	char dri_name[64];
> +
> +	if (idx < 0 || idx > 127)
> +		return -EINVAL;
> +
> +	snprintf(dri_name, sizeof(dri_name), "/dev/dri/renderD%d", 128 + idx);
> +
> +	return __drm_open_raw(dri_name);
> +}
> +
> +/**
> + * __drm_open_dri_card:
> + * @id: idx for a card
> + *
> + * Open a drm legacy device render node with given @idx.
Should this be "card" instead of "render"? In the commit message
you stated that you are adding two functions: for opening dri
card or render.

> + *
> + * This ignores all IGT environment var settings, for example IGT_FORCE_DRIVER.
> + *
> + * Returns: on success DRM file descriptor
> + * On failure -1 for non existing render or -EINVAL for @idx out of bounds
> + */
> +int __drm_open_dri_card(const int idx)
> +{
> +	char dri_name[64];
> +
> +	if (idx < 0 || idx > 127)
> +		return -EINVAL;
> +
> +	snprintf(dri_name, sizeof(dri_name), "/dev/dri/card%d", idx);
> +
> +	return __drm_open_raw(dri_name);
> +}
> +
>  /**
>   * __drm_open_device:
>   * @name: DRM node name
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 8416aa491..d0ba93b01 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -116,6 +116,8 @@ unsigned int drm_get_chipset(int fd);
>   */
>  #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
>  
> +int __drm_open_dri_card(const int idx);
> +int __drm_open_dri_render(const int idx);
>  int __drm_open_device(const char *name, unsigned int chipset);
>  void drm_load_module(unsigned int chipset);
>  int drm_open_driver_another(int idx, int chipset);
> -- 
> 2.51.1
> 

-- 
Best Regards,
Krzysztof
