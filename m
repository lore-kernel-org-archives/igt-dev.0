Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD30D116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 04:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4310E034;
	Wed,  3 Dec 2025 04:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1gMe6zn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6427D10E034
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 04:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764736499; x=1796272499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d8+Yg/vFpp6sJQIrjhsvnSyEbSGUsTWY7mKMIcQwvWk=;
 b=P1gMe6znuvnzPgnAoa43bua3UHBXSFF52qJGVIGfkZEjgDMhP3PhlpWZ
 GqqBrTq836rp0l8Wlen97VBFysGDDjQBKu2/CkNrU3O3kjZ7CjIU+hkMx
 6Buf3tSaO08lEv8GLY1VvxbJhkyUa3gO5yUVQ4agkGA6GH5ZJkWg7qAmZ
 ZwuQTeuRcLb4bkF3tka9scPkGpd6IFFIdH7AD+zpxpG8rlR5A2Jh7HlHL
 ClSChJEHSMTmKVusgmgs3qfHN8/20l0Z2GVO7xLjSgZDDViZcffDZcIOC
 yEx9VKbvOu3SGkEIoz2i4zcli2whpmqP5Yz8yMBPiXgvLpXxK6UCX2G8K A==;
X-CSE-ConnectionGUID: eOd6epjnQaW2NXeYXgpVjQ==
X-CSE-MsgGUID: 3HExDEwjRaiThGqeax1wFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70574423"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="70574423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:33:32 -0800
X-CSE-ConnectionGUID: OUwN9M/JQ7iyRTkd8d46aw==
X-CSE-MsgGUID: Ia3O3nPYQseKgt6Trd2dGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="198735324"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:33:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:33:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:33:31 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:33:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1pjfWL/5fY+wP/W948XHGgMdkXYm87JqeMjNX6NXgaEuZ/DR2x4sJGKf0KXxORXzm4sPbTFyQC+3tt/MGyc72HtHzIbzlpCeFDUXyqOz6Bao4S8o/yICZ/krGHd3dHZFJ4gGwzN22MUZcHoRQrgQZ9biyMIvZtH4zCNnVd2vmNDSQfUnE0/j5QG1O0qlANSPk8BxHiXNupvA9Idy1Ru0aaAX274SF2HAKjFQrHD9otvB2uwSD4ylz+ZyO63wp4Ksga82dDP+5aBUFEILZy/6+jfT2lL2eEDiC3QwzBYLKJ1o+9811Jwh5hLD2kQAJIZedKZxzwpk06oWFzV1JzaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaI30ofgGkfw5RqvLaKxYFnQ8C+WOX7f39wkea/N+Qk=;
 b=AqfSets3zq19GUbcRu3Yu2KrBT7iDIJxbyyXUgJSEmLe9w2cG/l0F/2lJ/Pywdy5iQhTgWFBXPaAvGHLJ1i2oXg+kXQwD0P/RqAaJpdomikwwXej8QrjW3d/jYc4er54y8IC2hdmXwXuusdzUm8G1huVg5/4QHZDnF9cgGyDWGgvzlhEk/sY8c/qxuZ6rKphxE39K2Jg1gUbAPrwdIqa8JaaOp3JLBCoxPY6DnjGm1hkvGJYYlio1MB0JJ+DRunnINKPIGDhQoCCKrcN5ns3Vs7FjQOKR0LzYETsVFeJVgPSL4dsNqtgYprrIUuyNSKwKS//+5eoaEXA0ZAQniXm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:33:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:33:22 +0000
Message-ID: <d0f8c823-f332-4be5-8eee-ec37885957df@intel.com>
Date: Wed, 3 Dec 2025 10:03:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] intel-ci: unify Xe lists naming
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>, Swati Sharma <swati2.sharma@intel.com>, "Jakub
 Kolakowski" <jakub1.kolakowski@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
 <20251202180851.148444-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251202180851.148444-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV2PR11MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: a4dcb86d-9e9b-46c0-4528-08de32251792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlBPTmVMakRSc2FnbnRhMnZscElwYjZNaVFKcHVjTXpkNkxUQ0hCU3pjdTkx?=
 =?utf-8?B?NEc3U3dvZDhCR2ZkWENXdXVGQTBPUWJSbk1OMjlLUEJaZW1XVkU5MmxlTDFU?=
 =?utf-8?B?YVdtQXA1d2pyeEkySDByYzB1d3hsWEtTcVVLMmYyeThPd3NQbnMyVHhFNm01?=
 =?utf-8?B?ZmlrNFJrZ3NCOWczRnZaWkM4ZU9yb2dMMUFSTHpnQ1NZY1R4eU9iSGtsaXVE?=
 =?utf-8?B?aEZhSlRDdVhoczBxU1p3bjc5RjJqai9ubDViSWE1RHpDcDQ3NDNCeVVBQzNk?=
 =?utf-8?B?K216MjNNaTdrbnJpakVtWFNKa1J3Mit5NzNIejltMmw4d3RvZTZCeDlDa0hH?=
 =?utf-8?B?K0l4NlUyb0YwblJlcysrdW9zMTdRRUF5cDVVem93dWRVeTUwVGIxeUpKeGRD?=
 =?utf-8?B?djhJM0Z1TWFxYStsc3JLVkNVeFRVZDIwVmRaVzNvYlh1RzJwbnYzR1Y2dWVN?=
 =?utf-8?B?bUdaL0w0ejdIS3FYV3NaUEQxTnNHVmU3cUVsUVdMVG1JQXFQQzJpQitUbnV0?=
 =?utf-8?B?d1RWNzYwVmI5U081bTZTaDhDZXpjVHl3TFFqWDNwMmkwRTR1TjJyUis2Y0RH?=
 =?utf-8?B?QS80RzNLUWVtNlVTVTR0SUlRZUc4NHdSbzdBcHFLcW5UZnUxUjByVDhoQ1pD?=
 =?utf-8?B?VDA0NXB2SG5pYVlybFVqT2wwak9jamUzcExYYkI0ODdVdEllWUJzSmZxSCtV?=
 =?utf-8?B?Yk1QWkJsdDVsSFRLVkFYamc5VjJIZFZWeGNZZ1p6QWRVelZEMUtGelpISWNN?=
 =?utf-8?B?TFFWRUVkbFc0WVBWNU94UDRDL0dTQzFPQnFMSDRLUzIvOXlZMVZYcCtjVDU2?=
 =?utf-8?B?d2FCUy84KzRkMCtSaUp4YVh6VE9YeGdjaUIwTzN6NG13MVBSbHIyUWYzM2px?=
 =?utf-8?B?N1F2S0N1QjhOcmU5UjB2Y24rMGlQNkt2SUxRSXQ5bkkveEw4SytlM1djNENK?=
 =?utf-8?B?WjVCT0owcDNKRHE3eUkrRys4VXdRTkJqdVZUTzlCUmdUMmIxTVlmNmNKeUYy?=
 =?utf-8?B?TTlzRlZ4N0dMY0hRbGdYWGtXUEQ1WHNkUXUwV2ltMDJIbWtvd1gyNEk0a0VL?=
 =?utf-8?B?NTE2aTFzbGlZVUp2QTh0NVdDWkI1Nlg5NEdxWkEwZ2IrWS9iVmNBMjkzK0o0?=
 =?utf-8?B?Uy9pc2luQUJMazhCOVQrYTl5bjNNNzNhRzFzRmFnR3FKL1VIc1M3aitWMEJp?=
 =?utf-8?B?V0lKa2ZETWhjT0VyNXpkQ2l0WUtSNzZQcG9wVVBNTll1TDRMRW94eUhCUmRp?=
 =?utf-8?B?NWJkQU1nSzM0TG9aVTROa2pucmR3Q3M5LzZ4QzR1dHlSSk1qVGw1NnphOVRJ?=
 =?utf-8?B?My9ncy8zUWdZeDYycTh1emdwQkliZjR5Q0RJRUNOOVVjNHB4S3h5ZnNMUFZu?=
 =?utf-8?B?bnVHR2huemhEaVpjVDhHaG90TzFRLzJEbGlIYWRwZ3FVdEV0QzFQYkhYQkhl?=
 =?utf-8?B?U25ZMFdUeHNyV2JmcUdDczdEcDRTQ1hVaFQxSEY3ak1TWnNQU1NnOVhoRVp4?=
 =?utf-8?B?RUhKYzRtUXdDRnBMK0hrcENXRnFmVDJBNXJNZ2wvZ21Nb1RRdFBBZDVEUTRn?=
 =?utf-8?B?QTdQaWNBWkU0SVRJRlBzNS9kZjlrZlRpdGV1a2VwUTdnUDNIN3RsMC9tNjNt?=
 =?utf-8?B?OTNMc0RLWk80TDFDZ0wyMnowcHdoY2xtMDZQdndXYkdQYWJvTnRnL0YrMTBJ?=
 =?utf-8?B?NjczWGxPSmxqeFE4MHJNQ3JIYjFnNmJZYlBaNjlxOFFMZkpFMTE3RVA5b0Fq?=
 =?utf-8?B?Ly9QQ2lKNVpiVVJxSnVJNmNjMlFBUWVPeUtKdXkrSFg2UmNoL0xiTWpUc2F3?=
 =?utf-8?B?ZWhTakNadXVGNytobDFaTlJYeTJYM2xlaGdiWllRbEw0Uy9QRW9MZlRJbWZZ?=
 =?utf-8?B?QUE3bzA5K3grZWxrR2o0VVVQSlZGYXdCMlB6dlVVV0JzQldQMmFyQXBwUVRC?=
 =?utf-8?Q?Jo/ps9IBKUO9+Ve9RezIofwJlGNppzTT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFJdCsvY1h5WndUNUl5SmwyYWhFQmNIRklyV040b0poMDRud0FqOUdEQzBK?=
 =?utf-8?B?UHZjYysxS1daYWdjcC9ESXVYWjZIV3ZsQ3JCU2ZzMW13KzFOMUUvSlVTR21K?=
 =?utf-8?B?NDN1RUJYWExTV3FKR3QyTzI3cy9HaThmY3Y5U3FCQU1VUDQ5Ri9PNWxRcHhn?=
 =?utf-8?B?dkd1MXg2a0ZSUWFtSDdxakZPTTFnK2hZQ3FNNFBTVVlDZlRNQXFQOW9uTzVY?=
 =?utf-8?B?SEV5MitUVzMvL0pQMUxxNDN5Rjg2RDdEa0MrQlV0UnlWTUY1My9pa2Y4dmVm?=
 =?utf-8?B?NDgyaTI0S1FHbGZneWNRdVA2bllwaHBwRWUvRFhyVktCVUFROWRYWFBtNWwr?=
 =?utf-8?B?eUpoZWtLSkNHOUtiNzRTL2c1b2xWUlVrRFlUQ1hGRnlWcmFFZ0JJSzV2ZkVp?=
 =?utf-8?B?Y3lUNy9zSFJxS3pDeWY0Rm4xVnlBeDBzRkcwOVdmOGZFS1puK21HNXZNWjVJ?=
 =?utf-8?B?UG9POE00ak04emRBdzVRN3g4Rm5XZjJEdytOTFBSQTZFQWxUcG8zMUQycGNV?=
 =?utf-8?B?U3NQQkE1TXExY2FESzdlck1sUUwvNVdJMzk1Tm1LMjRNRkRSLzdOM1Z2Zk1W?=
 =?utf-8?B?bDNvV054WkFyRWhJbkdtTzFMSkc1WlBXU0hFbHZHZml6eTBOd3NSbEpHb2Y0?=
 =?utf-8?B?VDNLU25BTlptbHFudDBVcTArRU1iVlZ2K3VZdEZBSGxMaG9SeDVjdU9aTGhS?=
 =?utf-8?B?YklLVURPeklhUVVOT2lOQkxzek1JaDhVWldydHlWa1djZzh1UFAxdVFyZmVh?=
 =?utf-8?B?TnN0ZTZ1T1FUYytQMExKcS85dXdOY2psRnRuajZVOGRtNjV1LzVCRXlLanU5?=
 =?utf-8?B?R1V5R0FSMWEwdHZYd29kanVIRUI3RVN1V1VxVHRZcGxSSTZDOEJnN3gxUDFY?=
 =?utf-8?B?aWczSlQxTVV2T2hwd1B4UzdDOXVBZEpBQmozaTVVN0lkRGZwOWtGaXViRW9n?=
 =?utf-8?B?WjQrVkt5b1ovaU5VdUZBV2kyTUpqc0R0VzNoNGhvemlUTXd2OHNWUlhsMmZ5?=
 =?utf-8?B?ZU1wQ0U5RE9rYVZqUnEvVS9na0JjUDFZQjluNVpEbHQ3OFIyMkNRQ2psYkU0?=
 =?utf-8?B?MWJyUEJWdzEwNmdkSTJBUFZ6ZDgzYlNZLzdrMTVNbngyN3V2bDJLUDVFd0F1?=
 =?utf-8?B?M2Q4RkNlOSszdnpYN3JYSGtHb0tkRjMrR2pHeDJKektaYis5cGVJSEdLTnc5?=
 =?utf-8?B?SUdWUGJONW5tY0dzbXFNSkdJR0JNNUwyVjZvdExpUGFZeGNLWjNockpzZVJX?=
 =?utf-8?B?b1ZTSjhBNFc5T3ZyWGhJRTc4L1BUYmVTYlAxY0ZZMWhuNjgyTytsWm5OSm9q?=
 =?utf-8?B?bmR5R1hpQkk5RnZaM0p0YXM3QWwvNlpva1JEV2ZvMlFSaERjcWlueGUwOHBN?=
 =?utf-8?B?aUZKeDZIczh4d21HSDJPUlR1SFRFZVVUcU0va2FaLzZHOFo4VmJnMFQzSkFR?=
 =?utf-8?B?bEVzVS9BVEIxa2JVL2ZqL29rK2ZIYXU3QjgwbStrenk4QVVXTnhZYldvcTRa?=
 =?utf-8?B?WUdmSEtHaFRVN0E0TnFwcHhYUmJjVGx5SXF2cjJCRnIrdDNOc2p6ejZaUCtS?=
 =?utf-8?B?bXlQczBXajF5Qkc2dFBIM29hcU1ROE1Ic0svaUhGSmRIc01YOEVDem5lQnVI?=
 =?utf-8?B?aHpHUDVGMkNlTXdLQStva3B6bFdaY3hMd2I0R3dNZlUzNnJ1VFM1ZFlQZVNC?=
 =?utf-8?B?Y285R0NEclFiOWd4T2pMdUVPYWppWCtEc3IwL1V5ck1VRGYyUDdLTW8wa1pp?=
 =?utf-8?B?bFhJbzJ0VFJwTC9MeWdYcGJhTEVsemh0MHpneVhmRGszeXc4RjhvenpMVEhN?=
 =?utf-8?B?ZDJ2VHVTVFltMUxLN2N6a0E5MjJYN0FGRWpsbExsMkJZTVhqQjRTVldWaEhM?=
 =?utf-8?B?bVB1YkVTRUVOTkhJRCsvcWY1enBPQzY1SWU4MlZmTU9LQURjL2NQczRKdzEx?=
 =?utf-8?B?aHRrblBudDlkSHBRdm9HWFZoRmNmWGQ0blRvZCtEUXl0MENxWk9wZitvWnpX?=
 =?utf-8?B?ci9XUnNGME9GaXF3Q1BId1p0bTFtaDB0b1l5aXZWTVRyTW9aTklMYm1iTG9T?=
 =?utf-8?B?b1JwQmE2VExtV2t1N3diZDMwWGQ1N1NlK2Y1WG1uN0VvNC83UlVQQ2h5eDZT?=
 =?utf-8?B?NUo3MEFlMWJoMXYwd2hjUU1vT3F3Zis0SW93Qy9mQ1lHMUk1N0QxbC83dEV3?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dcb86d-9e9b-46c0-4528-08de32251792
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:33:22.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsMOHamrwiqqzC9p4cNZacuaf8f0d90pYnlB9AjHp2O8MCgZNRBuxktdL4xCrzcpKbYkW3gO4AdA1Odp5BKERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
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


On 12/2/2025 11:38 PM, Kamil Konieczny wrote:
> Use uniform naming xe.blocklist or xe.testlist and rename few
> Xe lists.
>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/meson.build                                | 8 ++++----
>   ....testlist => xe.fast-feedback-chamelium-only.testlist} | 0
>   ...e-fast-feedback.testlist => xe.fast-feedback.testlist} | 0
>   ...e-sriov-vf.blocklist.txt => xe.sriov-vf.blocklist.txt} | 0
>   ...e-sriov-vm.blocklist.txt => xe.sriov-vm.blocklist.txt} | 0
>   tests/intel/kms_test_config.json                          | 4 ++--
>   tests/intel/xe_test_config.json                           | 6 +++---
>   7 files changed, 9 insertions(+), 9 deletions(-)
>   rename tests/intel-ci/{xe-fast-feedback-chamelium-only.testlist => xe.fast-feedback-chamelium-only.testlist} (100%)
>   rename tests/intel-ci/{xe-fast-feedback.testlist => xe.fast-feedback.testlist} (100%)
>   rename tests/intel-ci/{xe-sriov-vf.blocklist.txt => xe.sriov-vf.blocklist.txt} (100%)
>   rename tests/intel-ci/{xe-sriov-vm.blocklist.txt => xe.sriov-vm.blocklist.txt} (100%)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 0c3b79d51..917f18bfe 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -18,16 +18,16 @@ intelci_files = [
>     'xe.bmg.display.blocklist.txt',
>     'xe.bmg.eudebug.blocklist.txt',
>     'xe.eudebug.blocklist.txt',
> +  'xe.fast-feedback.testlist',
> +  'xe.fast-feedback-chamelium-only.testlist',
>     'xe.lnl.core.blocklist.txt',
>     'xe.lnl.display.blocklist.txt',
>     'xe.lnl.eudebug.blocklist.txt',
>     'xe.multigpu.blocklist.txt',
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
> -  'xe-fast-feedback.testlist',
> -  'xe-fast-feedback-chamelium-only.testlist',
> -  'xe-sriov-vf.blocklist.txt',
> -  'xe-sriov-vm.blocklist.txt',
> +  'xe.sriov-vf.blocklist.txt',
> +  'xe.sriov-vm.blocklist.txt',
>   ]
>   
>   if meson.version().version_compare('<1.3.0')
> diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe.fast-feedback-chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> rename to tests/intel-ci/xe.fast-feedback-chamelium-only.testlist
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> similarity index 100%
> rename from tests/intel-ci/xe-fast-feedback.testlist
> rename to tests/intel-ci/xe.fast-feedback.testlist
> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> similarity index 100%
> rename from tests/intel-ci/xe-sriov-vf.blocklist.txt
> rename to tests/intel-ci/xe.sriov-vf.blocklist.txt
> diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> similarity index 100%
> rename from tests/intel-ci/xe-sriov-vm.blocklist.txt
> rename to tests/intel-ci/xe.sriov-vm.blocklist.txt
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 02fb32534..559d46b4d 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -17,8 +17,8 @@
>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
>                           { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
> -                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
>                       ],
>                       "exclude": [
>                           { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index df7e6dcf0..65e685470 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -13,12 +13,12 @@
>                       "exclude-type": "regex-ignorecase",
>                       "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
>                       "include": [
> -                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe-fast-feedback.testlist" }
> +                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe.fast-feedback.testlist" }
>                       ],
>                       "exclude": [
>                           { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> -                        { "Xe BAT VF": "../intel-ci/xe-sriov-vf.blocklist.txt"},
> -                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe-sriov-vm.blocklist.txt"}
> +                        { "Xe BAT VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
> +                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe.sriov-vm.blocklist.txt"}
>                       ]
>                   },
>                   "order": [
