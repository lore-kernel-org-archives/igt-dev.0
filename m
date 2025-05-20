Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88607C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05510E0E4;
	Tue, 20 May 2025 06:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkahSg+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED510E0E4
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747723823; x=1779259823;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j3gqp+xbOj1hn9rbi5q2vjd8eGy4XQExrAYFtvcQjaI=;
 b=QkahSg+5WwyqIMAYBJ4Di98ApagPZCiLin63/PHHNWZwoeGdpo66bnwL
 8uxxZSwndUaDxw85Jxkqu+8tCiRI5TfD2tMelGpafnkubF3wLVH2dB/A4
 MPQLUhE02bx4hQvdXxYj9RTHwTzli+6GCpCShCLu9qqxVUmmZ42l1C3c6
 yBrHUJxY9Dv9urkcKZ+GTiG7CHQFk52buxD2bbBbm/jZmlyNdoxokpwGO
 0Xm/nkaQxmDsuE1mnOe8flZBZ6m5t6eYdRiGFEolkx9zEv/IHa1V4mvh0
 tjBeUMD9aaRgIMMYmWb0OCwnaB9UhQUAw/bkZqMcylglw+oZ/hnpeV7Yz w==;
X-CSE-ConnectionGUID: 1SIOpv5PRE6IQddxPmLzaw==
X-CSE-MsgGUID: pEj8k0MKSpSuG5sWqqEMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53456474"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53456474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:50:23 -0700
X-CSE-ConnectionGUID: Rmcy+yDjSECFrKkW+qRI5g==
X-CSE-MsgGUID: 6uNzKUv5RPGL5MPCF/aXlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140606615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:50:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 23:50:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 23:50:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 19 May 2025 23:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgFSrvIS9qGsQRdJs/crFlCTpq+kqnSyqB6/ZcK71IzbPxleK1fw1FZrpN8l0V14WrFNZUxxxpDwU9hURNxhFmucQpcHOZYEVWAESqPkHPLWsXVVMRy0biG3fcT5iSVoE28CKNa4k29nN+ujBJu2mnf0fN7PvRITLJsGT6c3LbW7aoW90IKTqvJCKOQWKcWchtJ9ISLiZDSZeS9HEAH9Cq2utliYlvEC4BVeOSsY+7iwpxyXvnUeXi/ixBdVMvqC1NpcJVO1WisUcjMbOWJ1Z6KagzOwLuHLKP+J1xJfl65tfnVGox/43c+Q9cO0R6ulq2wLY5dBwPYRWR1nlWUKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBReHW/p87fOK7explLoGJb1IK15WnPl61RAPz8Ndpk=;
 b=Sq9Xk+cOxLo6gFaVVHyxwb4G+HpOsFUH32GVDnsQK8xebWm2mRIevf0jUgtwkJg65yhTbHCbekIillGvmgVBf7c/zTkqB/dyO4R9XlwttNe4oVdwK4YhS4MrDgCyaUyCfEHqZb2sBqmwyZXedJogaV2Qfkh9Zf145GMN+cQj/0fjv9VjiOMTtONsC6UPI0Uyy0/9LqDd50lnODdndHr75P9okWa5311jHu2Q0hBI2zHx6s32kDCV5Ydpmk3z6Cl8HLWOmUDGbEcMTwnDSYmr27piyDZuRJc+k+5qnMmGq/3+VQl6HQ+LMGvm5OvXeXSduM5Uq+0Tn3vCKgQoShGM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 06:50:18 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 06:50:17 +0000
Message-ID: <c9c19a0f-4389-45b8-be00-562b68467c00@intel.com>
Date: Tue, 20 May 2025 12:20:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel-ci: Block unsupported dirty rect test for i915
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250519091403.3305383-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250519091403.3305383-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ1PR11MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c95818-ab87-40f2-27eb-08dd976a94b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBzZ29ZekVjRkpNd2hPdVFrZDdPVFJvRnIvREVNemxXSXRBY3Y3bXlDb09B?=
 =?utf-8?B?UHVlOHdlNDVId3IyWDd5cGt2T3JhVnhtdGhjc3p1dGpuQjhUelhzNGhqME41?=
 =?utf-8?B?Z3pQSjBWUFpDaGV0WlFtbndxeGJQbDdTU1RpZTB1V01DY3UrS2kxcGpoM21t?=
 =?utf-8?B?NFlUdlMyMEhaZmNKckpsMklQaCs4N3YyNkMrQmx3RXM2MXFqbDRzNnNUZ2hp?=
 =?utf-8?B?VXY0K2RtQXBZdGEzUWV5ejNTNUZnMkdTUllaNnprRHBVY2lhcWJUMWFUWk02?=
 =?utf-8?B?MGcrQldxVUl3OEtFNzVDVDhOYWZqMmJBMjE5UGpsd083eEtDeFRqY3J4c3Jl?=
 =?utf-8?B?RysrQkhMMlRJNlIyek1ETXdWVjZHN1I4WnlxbW5jY2pyVTRtcDdzWUgxUml4?=
 =?utf-8?B?bThXVG5vellyMFBZazlZSHo4UjhLV3BJOWdjS2dPZy83ZlRlRWNlVmxDanhV?=
 =?utf-8?B?Yk1OWjlncmVjaUQ4Z1k2OXNKZnZWRnNFMDBVRzhhbitjc3NVSldmVlROSW8x?=
 =?utf-8?B?MGNSdmplY3B0S0VUQzNEWXAyV3IxRUpYcFY4SDFVaE5QSjVOaVNsQjBaR3NH?=
 =?utf-8?B?aEN1NXZaZ3ZBWWJ6cVFaWHZFZXZldit1WFJpdHVPNXhLUmE1enJTM1EwVnhq?=
 =?utf-8?B?UlY5M2NNYVBYSmlFcnRCZG5qQW5ZeDBWQ2JpSDM3dTI4dWxQTW5DMUZUeWto?=
 =?utf-8?B?SjA4YmdaaDJseXV2UmNWMHVvd0k2b3pyOU9UcTRiWEFFNDdhc3hZV05aeHEy?=
 =?utf-8?B?U1J4WXRvZldSVExLNnFLSHlxZlZZc2gwSW5ISUsrTEFZS0tOK0JVYWRYTTE2?=
 =?utf-8?B?ZDlyNmhXcUtRaDVTaEZpd202QmU4b0lTUVUxZXpCOStCYWRRWVdMMHMvUEJX?=
 =?utf-8?B?aUdrOStqQ0pxMVQ5Tng3Y1hqazRxdW1kTEYyUGtCaHUrWHJ1RlNydXhuYU1N?=
 =?utf-8?B?WlVhenBaR0dOeWt0b3hQeWFnT2hvWGFoR3NSWitjbVphMEZGRisrVEN1cnRq?=
 =?utf-8?B?L0VweldPTC90ZnNkcGdIbjVzMHlNZVNqOTFva0kwajBCY3B3a0tkdFNFdVZ6?=
 =?utf-8?B?aGp6ZXA3am80VlFXZUM3cDFxOEtTY2M5dklqQmk1TTAvbWtOcU9tbUN2LzBF?=
 =?utf-8?B?clZqRk1KdldxdWNqOTNhc013SFJPNXlTbDI4VGxNWFk5U2E0V1ZHcE1WeGw5?=
 =?utf-8?B?YVBNYm1ib3ZaWFNLWDRrdFQzY3RPRkVlVTFOZDJMdmNqc3VHNk9YT0taUDdK?=
 =?utf-8?B?MCsreVZXUGwvQi9YTFlPQUpFQ2ZzeW05UDV0Y3BGcVE3djZGRUphSHQ3bGRo?=
 =?utf-8?B?SW9SeU4rTW10empSL2lBR1ZaRFI3ZEZhV3pBNWVGaWRrZitBQ20vQXdjSUtY?=
 =?utf-8?B?ZjZmcGZQMkl1R3RoMm9BQ1ZRNXg1NDNoM05BaGE3RHp5ZWcrczJONlRuY25m?=
 =?utf-8?B?QTlGc1NpcXdnUmIwRkliNFkzV3I1V3IyM21Rb1NzUnE4SFc1ZU1jNmN1UFFP?=
 =?utf-8?B?bDBDNmtRajZtWXJLYTFwWjhkRUJjcjd5cG1jL0pMWGo1b1B0ZGtDSmhWbHBz?=
 =?utf-8?B?MHZ1VlhDNDVwVjlmL1NOQzduejlib2kxS2hPNHhpZFhkU0VORUVxb1N4WnNW?=
 =?utf-8?B?cTZjZTdrV1NYMXdid0NCVFBLVTZESDhrN3pVK2FPUDg2dEMxbHpFS216WkF5?=
 =?utf-8?B?RC9KMFl0cTZOWW9vQk82WjR1TFhDSXFIZG0yZVp3YWgyd3dGcEZMcElaYnN5?=
 =?utf-8?B?L1lubExLUTM5VFk1VE9NTEdQcHQveTBNUDh4ZG9ESXY4UmhLU2RYa09yZUlV?=
 =?utf-8?B?enFNL1c2TjZqOEJPSEVBdlhYSnRHTEg1dmpvSkIyQncwM0t2TlVPMUprY1Ez?=
 =?utf-8?B?WkVPVXVQKzlrM01xUUh5UEw2K0JWeGNHaWhxWEhseVp2U1NuMWQ1Y1R3RWU1?=
 =?utf-8?Q?eSoEGxnrQpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRJOEVUVERMNklvTjZDRG1PdTZRTWpMK25CTkxzQkNwTml3S0I2ZHppK09S?=
 =?utf-8?B?UVQvajNFb2p2WSs3eW1TcllwV2ZhNUJzcXpRK1B2ZW0wczNRK0pBd01jeFpk?=
 =?utf-8?B?S1J1WVdNRTJKL3Aza21uK0xNRVpUZk92dHY5TGxVVDNOQ2xBRThyQVFQMmc5?=
 =?utf-8?B?V2tORzZFOHV1M0w2YW5IS0tJWmM5SHBkVDBTWTYwQXUrTDZ1VDBtY29DbTJL?=
 =?utf-8?B?MkRwQ3cwOXJuWEp6Z1pvR1h4eUlHYmNiMmRUVXpNWC9CRlYzNVZ5VEVHb0Nj?=
 =?utf-8?B?Qlk5WWd2SnBsdzkrUTBqVVR3SnhsdE96Q0NQdHFLdmNST1NLdktzYzJRMW9i?=
 =?utf-8?B?MGxzbExBOFBEeWVUSFJraDFtdU5jcG1zU2tmS2Z0UEl0VnM0a1ZkZ3VDRmlE?=
 =?utf-8?B?cVR0VXoxcUVUdzdVUEU4NjZGL1VvMERYMGN6d3RRL3YwN0xHeFdkalp5NVN6?=
 =?utf-8?B?dmptOVhvdERGTk9nOWFFVkNSRXRld3FDWEwzMzI2MElHOWhybmQydUovM2R1?=
 =?utf-8?B?TENnWWo3NVZod0h0OC9rSVM3c0VvTHQzK1dKd2Vtdzg3OVFuU0lHVHFhdTBR?=
 =?utf-8?B?UGNwU0NVMzlWdllsSloxN0xVS0xMeFlLQlEwN2tZa0NMbFYwWEFQTGIxaVNi?=
 =?utf-8?B?Q05ldHo2aElEMjlTckZpL3Rwc0ErUnJDb0lVZFBLa0VqZ2wzRUd4MFRtcUF6?=
 =?utf-8?B?ajhIMGpqYnp1ekxyYVRzQm00T0FacnB2SmkzNytjaUZlb3h6bU1tb3U4RGZR?=
 =?utf-8?B?L1d2UEl0aUJzQXpZNG95dCs5U1g3NmRsL21Pd1ZLano5dVpOMEh0WmdIVTM0?=
 =?utf-8?B?RG1ENi9XOHBOWGZHaklRcU1BU0RTQzZXdWs0ZHJGd0ZtNUZMUUlubWZJbStr?=
 =?utf-8?B?R0dYbVd4VXdGTEorQnNkb2p4ZnlaeWdXZ0twMWVNUXZxUUdOcFkwQUVpeFhu?=
 =?utf-8?B?ZmExQTdINFV4M01VOCtLZkpXR2J0UDE3QUljY2M5OFVLc0lKRXo4bVpoWjIw?=
 =?utf-8?B?YnBOWmpRMklTTlgrR1VzKzNKQ2pwNm9meFhHRUIvaWRQWjZlcWhHK2luc2RJ?=
 =?utf-8?B?SHhmK3NQTEMveFlOWXJ0NzBETmJ2c1Q2bGxxSzJ4N0NZYTk1NmVyakJuN1Bx?=
 =?utf-8?B?WGR5a2RWZFVGY3NCSXdESElpcEhIS01yZEM1ZkhRUi9vZkZPL0dmUUxEVDh0?=
 =?utf-8?B?MUtVSm9vV3c4WnBBK1pva3l4elZPd2EzUmNORE9pUnpnYitOUHJ0V0NBcjFt?=
 =?utf-8?B?bUxDaWQ0bXNkS1lXaEhpancrYXMzZEthRzlta0Z1L2NCc1pqc0NuNUJ5dzFz?=
 =?utf-8?B?aEJIcmQ1QTBZbXdiZ0FrblRKZ0xmM29LUkFRY2RadnB5cFF3enFOc1RrWnVQ?=
 =?utf-8?B?ckxuUlMrTXEwdGt0UFJZVS92cHJoN2FmU2k3MjYvZDBjZUdNQUVEaFl0SUwv?=
 =?utf-8?B?cG1PMHMrdFVnL3ZBZ2NlV3VJSStUVGtCR1JtdFoycXpyWlNnR21YMzdNTmUz?=
 =?utf-8?B?WTBmeU9rYXZlTTB1dGVHUkJTNFVxV1p0ejNZVkNrKzNHNWx6a0M1SThCcy9N?=
 =?utf-8?B?NDdkN1Jyc2FPVlQ4bytzNFdhcUNLKzQ5SHR2Mjg1b3lPMVVpazB4Y2hUZUlM?=
 =?utf-8?B?SjdaTlVSS29vbk1kUGE3alhZVnR6ZXhKaFVVZ2FCQnRZaDB3RklhbjQvNmpG?=
 =?utf-8?B?b1NmUFEzaEhvY3cvWS9DbmN5Y3pacTd5MjlJKzBPU0hTdWM1cUYrT2RDUEVj?=
 =?utf-8?B?Um80YWdRRjRweEdLZktBMlgzekp0ZGxwZmNRVkoyRXBaaXpSMEJLS2x5WGpZ?=
 =?utf-8?B?a1E1WnhJaW1VSkY2NFJZRnBIb09lb0twSysxYjhEWjFMczVFcDdSMWg4eGN4?=
 =?utf-8?B?NW9WUmZQRXZ4SjBQZGR6UU9jK3JoNkFqUW5KNjZGQnhleHN0RjNTb2FrT3hJ?=
 =?utf-8?B?M2tyd1JvQ3VCTnpNVHZqbDJRZGcwSnQ3WFBHaSs0dy9HZUIwSzk1ZlNHUXFo?=
 =?utf-8?B?bkdhTUZXdUJIRmNtekNET2pRNC91ZWl3VSswZ2lPNko1ZTZ3UWFvVlZ5RW0w?=
 =?utf-8?B?UVZxSDFtbU9MZUhEMDg1M1B3YTcveGRBYWYvSDBwb2QrUDZlMmNwV2xOYzFl?=
 =?utf-8?Q?xjmhhvAGoIZhyygdz6pBTbToT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c95818-ab87-40f2-27eb-08dd976a94b1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 06:50:17.7592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uo1bUpO7ShYiz3QWXA0wTw+GEFb/HB5o8Z1v2w2cwaMuD/8odFFFwYb4lybmUoSNlLUNmYbuockb8J1W4AD9dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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


On 5/19/2025 2:44 PM, Santhosh Reddy Guddati wrote:
> Block KMS test as the feature is not supported on all i915 platforms.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/blacklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 5a563e84d..8543f5ddc 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -153,6 +153,7 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
>   igt@kms_frontbuffer_tracking@plane-fbc-rte
>   igt@kms_pm_dc@deep-pkgc
>   igt@kms_vrr@cmrr
> +igt@kms_fbc_dirty_rect.*
>   
>   ###############################################
>   # Test was written with the idea that edid read shouldn't take an
