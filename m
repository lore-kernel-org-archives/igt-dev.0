Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3A9C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 03:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D1510E1C5;
	Tue,  3 Jun 2025 03:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFv9oDOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCE010E1C5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 03:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748922511; x=1780458511;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vcyyqJJQ9Ncnqp5rMYMXHWKKLdTgaeC0TG5F/+LAdhM=;
 b=IFv9oDOan/s1Mzb4xu9PJ5M97y02pnwLKBanuQEEGMbsQ3/NWCVpz6XM
 x22YJhB7G55/bKagMHM7V7+wgEPNePwjL25wOtjgIZdl6cRIKuRePcDA7
 VJrlv/oelzzH6yqBV8c7EjQ34zFymTPvl3246KihosA3irmN7YwG3Fq2X
 n6XlYAIuc+p3vyp+T5iUGwmXCtHlAxNqRcxUL8Wk6sSxvPechAi9xZEEG
 nBcBojI4XE95CJ9o9tZnsFeTv3I0akReii7s9DOsZz/b4Lr83XVPkDRy3
 Roa/N4Tr3X+T7/uBxFTjKRB21DECOouVZhmAkto6vStrFoYId95goMG9R g==;
X-CSE-ConnectionGUID: XGjrSQiGShG3RQloXBxSBQ==
X-CSE-MsgGUID: Gh4aeXrkT4iET3blR6Vc1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51012801"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="51012801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:48:26 -0700
X-CSE-ConnectionGUID: pMdh41xET5m5AF5kI2yncQ==
X-CSE-MsgGUID: 992YjwKdS1iqwSTnBFaf1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="148586013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:48:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 20:48:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 20:48:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 20:48:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2+Chz0212x4a/x1hwc2wIVORz3UPMhxzOJ+Q2jZLWSWYZXFHNR4Exri5kanM/n6jdoCQqkNCLcN3RGYrr4d8PXfgZrKmacGrzw3laenOHN+nRX0kH1Baj8mvb3NDSyCmgdEoE8yrqXp6Q0QWl9xnVs+6Pvo9L2YPeN1pMALspzZCpjZ2lPVUzcF6FR96ESzBtWuglt6OgRlp7m1OtQO4UmNgxH8W+j8CXlumlKIH2y8rR8LWWf2gcxVwYfZf3MkV5vyjTumhSHWK4xK9ryIxRAI/v2Tbwz/IfyTheFrL2XvSvBeFWCaMg4Z30vw8zlDFVLC5Hd6UtMABSfYAT4vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2BAArqGOC8jWYINoJTU6mWh7ncYD55ui+Xed4hRvpc=;
 b=Pz012ahXhLF1qQgc5zROv94JV3uWzNTx355K3R8+XIfU7yeRKCkiNaGfECpx1eQ6eKD1BizM5siDrBdhySlYcMUnxQj5x0DxoQYK2okkI0SRgC+MDkOKEXqtpJRqdkPuOA7vd7ZjZA5JHV0y6J73IWgYzuARuivdOYWRAw8frwztsh8R9yesJoMxxqTUiFXLNqA5H6q4tEYRWEQEaBYTDUkG8q/B6kzW8bPeNdOgEtIsE0WJABpqLd6rHdNySLl5UsgIAymoeoTyH+HPxfR9lMaEy6HHWPzEFT8OOdj5GbpdA4lkyXsZGOyjGdJuEkKW8wOpToZNnYyR4711ZJCRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 03:47:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Tue, 3 Jun 2025
 03:47:35 +0000
Message-ID: <b35117e4-6368-4244-8656-5fb26418be3e@intel.com>
Date: Tue, 3 Jun 2025 09:17:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v12 07/11] tests/testdisplay: Include local glib
 header for Android
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>, <kamil.konieczny@intel.com>,
 <markyacoub@google.com>, <seanpaul@google.com>, <carlos.santa@intel.com>,
 <sapna1.singh@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-8-jeevaka.badrappan@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250602192515.95309-8-jeevaka.badrappan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d5a26a-05c2-47dd-2be5-08dda2516011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3pvYkcvTDdTemZLN3VwZ2NyekJHSnhTa2txcGliZDFWV0x4ajRQM1dhRVlm?=
 =?utf-8?B?K3ZMOEhTQjZBNVNxVnhId3NXcmlsZDJ5ZmVCZmFFVDJjUEJPODNaZ1p1ZWJq?=
 =?utf-8?B?c25EWHVHRGo0MzRxcldzYWtneTY4N3VwQ3BzbERUNWVQWittMmg0MCtsa1dG?=
 =?utf-8?B?UHRyTXJCNllqc1VESEtPQnNvTDExK1BRTXNzaDc1K29GUzZ3NUhWSndWNTl0?=
 =?utf-8?B?UXZBY1E2Q29SWjl6ZGh4OWxQNnY1R2w1NnFOYjh4eno5WDh1MnA1YjNVUWRh?=
 =?utf-8?B?UlZOaTlqeHd5TExEempqNWZHNHF1aHY2VFhJZHNOTmFBQkJxUjhLTUlwSklw?=
 =?utf-8?B?NTV3aVNhWm9SVG5pZ2NOa20xVHBPc1Jua3Q1K28rL2hSMUZWNDBuaHppYUxM?=
 =?utf-8?B?czhWbVh1cjN0d0pSZEVMb1Z5YlowUU9LaUllTm12L3dncFhqNzJ4Mzc3bEhx?=
 =?utf-8?B?RjdwMElDU3EzUTE3ejQ2b0JHbCt1VlBvQ2lCdVI5V1pBRnJvelVZZmVlajlz?=
 =?utf-8?B?R3VIa1Y5bFJNSTNKcnVCTkM3Q2xmZ0dJU05OUVQwRDc2VFZSbFVrZ0FkKzd2?=
 =?utf-8?B?R1FwUU5EZXNXQWZaZTR2c3hBN0V2NVN3L2Fsc1BWcEN2TytzR01ZWGlybXhL?=
 =?utf-8?B?eHNuOUhTMWYyRE81OHJOdVRrQjVmMDhjQ24yK2pkeUcvck5na0ZVWVNxNVlU?=
 =?utf-8?B?NW5hRzFBTTdYUXhLVkozVEtEK3RieTYyTlBOMVRPcmI2VlNNWUY3QnZIMk9l?=
 =?utf-8?B?TUhnb01xR01YUVBqYTFiZk41RzJ4ZTgvSnhXL0pRVkdKMnRJT29nUyt0OVg5?=
 =?utf-8?B?LzhTa3JUVXRzQ09VT0oxQVBVVzIwMmRmNEp4YXROUmNUaVd6eGhXb2s2blVy?=
 =?utf-8?B?dVBEbVArRkRlNFhyRUtidThyRmNlL3kxMFZSYmwwTGxaZWszYU5aMGN5eUNQ?=
 =?utf-8?B?Ykh5T2daRnFSalZKN3VGRkEyZk1SNkFOWkxDbVlGVU1DSTZsWFZaQnQ1amlp?=
 =?utf-8?B?NDVYaHFPY1pGUFhqenhSUGg3R0g4c1ZDL0g4MkU3NThWVWp2MW9TTVlBdG9F?=
 =?utf-8?B?UDNPTWRTYWVtQnJZY3NvQlNISy9xamcyd3pXdFcwZ0Mya3U5d00rVXBlWjAy?=
 =?utf-8?B?OXY5TWlTb2JlTllBZnJaUWhtWWxxNzNRS2NxZ1ZjSGtHQ2Jlcy9QajVKOEs2?=
 =?utf-8?B?NmIvQkZFeUdEMEMzL05pR1dCM05LdjFjbkNBRGlQTmUxb1RwYm1EajhiV2V0?=
 =?utf-8?B?SUMxOTVBaVludkhTenJQMFZQRzhFTEtta053bWk4Mk93VW8zcXJld05IMS9C?=
 =?utf-8?B?Tlg3cDY4YnhpbGVzQ0dteHlwSkdnZWZFOUhtM20rQWZIN3dtOUx0a1lxeDdC?=
 =?utf-8?B?VDQwMlBja1gzMDF4Zm5SNzFQbTNlanA4UFc1NmJaNzQ0by96TUdMMGZhN2dC?=
 =?utf-8?B?U0dVZ2VRK2JxZmlEYUcvNmxvLzhsMzNudldHbkt2SFNRb2NDaDNhT083cDNH?=
 =?utf-8?B?b1l1andPSlFwU3p5QjhReVdCS1hOM3NjZDF0azlNcDJISlJ6YUZCS1RHRWpU?=
 =?utf-8?B?aVA0T2JiZzFoUzFFU2w0dENoSUpiUDl0ZkI2U1NNWGM3VDlHV3V6ME1rVHdj?=
 =?utf-8?B?MzY1QjNjNThzSk1lKzdIaVJjVWd0dURWNG03dzBad1RnQ1BIU0p1cW42akR2?=
 =?utf-8?B?TjlEaEt1N0N0dktvV3gvclptVVJRVmVZQVVnVkNsVmp5Z2tROStQSXhvNFEv?=
 =?utf-8?B?ajZ3Ni9BeEhFVGtrcjQ3YnJ3R2liRHRJOEZubHVDcnJKZGJRQ3pzdmZtaW5z?=
 =?utf-8?B?elBVWUE3N1JzQnUwQlEyamRkcXJTZTMzQXFNMzZQMUY2b1N0ZmdIZ3d4bmdv?=
 =?utf-8?B?czYxYjdUVW92T0plSnA3OWJnWXBqaENGVkRaeFNoOTlTaDdoTTFPbUJOdTll?=
 =?utf-8?Q?Uun+RpJxT4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRETHV2TkFzV2ZIRXIrc004Z3FsNlVuYml5anJid0U5c2dHUUptUncwNmFS?=
 =?utf-8?B?VGpETjd1cjF2RUZ3c0pVY2ZMQzgxQWE0QXUrcXRycUg3Z2R5QlRrZzJQL0w2?=
 =?utf-8?B?YS9WUFVFK0F4c2NGWFZjSVdnQ1UzR2s0MDU2MnQ3KzRESklXOG14VysrWFRM?=
 =?utf-8?B?NGRuNmdOaVFkbGFGVzRRU0dmNnRJeEVsQkpDRGFma2FCRTJVeGRuYXMyc3Nw?=
 =?utf-8?B?SWNZaUpDZkJJSEoyQlptOFc0ZDNlWVAxWkNYZkpZYUhQYmtQTEZkNTY2S1hE?=
 =?utf-8?B?cHZ0VXgzaU9oMGtQaXRrTURlU3F6RTlzZ09YYllhTC9jME1YeG9DQldMcnBt?=
 =?utf-8?B?NXZXQmFwWGtTaXI0LzhvVCtRNXhOODhJNXRYeEdaK1J1UXhubFVNREdZKzha?=
 =?utf-8?B?VGhJWU1aK3p4YVhoZ2o0a3luK1J4c04ybko4OVN2VnZmVHdTeWdqTTNkU2lM?=
 =?utf-8?B?ZnBqUHRFWkx0QTdiNXBzcHpsZHo1RjkzbFkwT0laMzdYV3cveTdjSHFKUEQx?=
 =?utf-8?B?elQ5T2pyOS9kbXBGN2FaOFdWMjJEbS9pUGJET1pDUjNJRXB0OExFODgwZEJ5?=
 =?utf-8?B?d0FVbm5CSk80eUxSMEsvc2kxeWxaUEdpMGZQRnNkd0hib1lzUTRGQXYya29i?=
 =?utf-8?B?c3RjZEMyb2craHp6c0tHclpQV0gzd1U3K2g2RGRmcWtpRStWL3hHMS9ia3k4?=
 =?utf-8?B?d1RXYndjV3RhL3E2VmdYZkkzVGo1Ry83dFBjekZxNUxYZ0k5ZEgzRlRsQkt2?=
 =?utf-8?B?UEM0ay9la3ZmMEt2SndmbWkrRllZckVUZEtNQjVCckZKZkZQL2hycXR1UWIz?=
 =?utf-8?B?ckxMR29xanRCN0NNSnFiR1FMRFQ0NW05NjFOa3VQaTlGMGJLL3d6bGR6UWJL?=
 =?utf-8?B?elY4cUwxdk4rVksyRUNjdDNqRzRja1M2aitwYk03dDNyNVhKUzdYRW9Zem9w?=
 =?utf-8?B?aXZJYUpvemV5MDA1VWo1eHRtejJFT0RTOTZmV202NjhhSjhBYUFOL3RUcnIw?=
 =?utf-8?B?ZllxdmwxUHV0QXlGaWZEYzRzNXBGclh1dS9HUDFheG9pZGw0bUZmYzNjTnh3?=
 =?utf-8?B?dDhVN1Q2VklrVmdvdW9UU0R4T0k0YWtGSmlPYnpTVU5rWXJ3b2hYTi9wb05H?=
 =?utf-8?B?aS9iR2V1Q01rRDlKZUU4b1UxOHpMTSt5MnhIKzRyY2tmYzR1cElWNHBBNmox?=
 =?utf-8?B?NXhGMDB1eFdyS1ZTaWhTQjNIRWlXbTExVkwrRXBnWXU1amhpZTgzZ0dvWll5?=
 =?utf-8?B?ZmREakZhTUJ0a29EQUVDbUxNeGRhdHhwMEtIeHZpYnNpdjhKQklVOGNGWEtv?=
 =?utf-8?B?L1ExU1N2dE05MXNtTVFZelRSMDlla2l6cHYwN2NTdjNrOGxqN1U1UE9hbHF4?=
 =?utf-8?B?WENHbnpDNklGakNLcEN4ZnN4YVFYUVN0ZExkOG82OHRxcG54KzlQTllLdGFZ?=
 =?utf-8?B?Q0dYUEY3SmU0MnV0ZHE2RHBJWXlETWRsQXAxbTcwRExDMzZNSVJVOXZMUkdu?=
 =?utf-8?B?M2RLL2hVb2ZReGRoUHd6dVNGUmdhYlhEMktzVHJlK2ZsRnNZZy8xcG0zL0Vs?=
 =?utf-8?B?WGNxa1ZDdS9xVHMzSStGWnJ0Z21kSGhwUWtlUlBlYitlT2hjWFcrOGliNFlK?=
 =?utf-8?B?VE9ROXEzZ0lrNXJ6UWE4eE5mb1FpbEV6WkJWN0lTcExUSHpTSFpTNkRRWVcr?=
 =?utf-8?B?ZEsxNzBXbkpLM29TMVVuQ3Q3bXNrTzZNM2wzSWRPZGZiQm14VEpCRTdJZ1NW?=
 =?utf-8?B?Y3AxY2Ryd3JFV25SUjhlV2puQndqYUF0czlFN3c0V044c1VYZFRtajlRdVFE?=
 =?utf-8?B?RXRnSEhBd1JYcEJDVHNUeGlOUnBFUXVDa214TSt1TWtFQzlmTVg4WnYwL1NJ?=
 =?utf-8?B?SmNNN2EyUkdGSWxmNmxpUUpGa3Q0bmdwT3ZGdGZnNXRPNVNhdzR3RTA5ZmVO?=
 =?utf-8?B?RkdmQ1pFMjRWSkNzbU9mamlWdHpwN1lsNDY2Q203VVVjbXFJcm15dEsvdDNZ?=
 =?utf-8?B?bmwwbW10cW05TSs1UVpEL2JFNXJDdGp3OTNzYlZaL3lJZDd6ZjlGcmRnUmJT?=
 =?utf-8?B?UW12ZU9UVmNVcXhwNlhNeFhwWisyNDBZcjRJZDhJSThCRmJHTXpFNmxKTTFj?=
 =?utf-8?B?YkxURUtUZTg4dmpxNFowaTV5NC9jUGJsWFI3YmFQTUlpWDVwS0cxZWxWbzh1?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d5a26a-05c2-47dd-2be5-08dda2516011
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:47:34.8782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03WUL+DcGvC/oFzpNUaPp7rZ4ivJzti5uqX20AKSnF8OQIlO+HeIxdLp0djaMUeEbGgMOhIqUVE+5DqqGtY5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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


On 6/3/2025 12:55 AM, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local stub header to build
> igt for Android.
>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/testdisplay.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/testdisplay.h b/tests/testdisplay.h
> index 27f8209e2..0f606c028 100644
> --- a/tests/testdisplay.h
> +++ b/tests/testdisplay.h
> @@ -24,7 +24,11 @@
>   #include <stdio.h>
>   #include <string.h>
>   #include <stdlib.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>   #include <glib.h>
> +#endif
>   
>   extern int drm_fd;
>   
