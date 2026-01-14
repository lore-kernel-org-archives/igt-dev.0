Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5273D31A26
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 08:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EB610E393;
	Wed, 14 Jan 2026 08:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCKKVCPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E39110E3F4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768380398; x=1799916398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKP0rhhCHiE3eDM66ZhQOJfEDmTt6h6y4k2X72wwUzo=;
 b=YCKKVCPN2p8dbhaYcTOaa+AhX8PHRs3pu7fN1AioK8g7n2GPfFWZjTMb
 Ofb6O5UJW3TjTV5lOOToKSf3EhMOoxYeCpe+ZizuqMjwyKqHxOU1LprFD
 r3YaZ2SEe0iyEkz7wtefN1LdQBn7XRvoIL4MF8It7vyK/lx5JLpAn1WTz
 5pGfJv+sctQx0kDUbUl5ljwTeHUbD+K/RjcKCKuH+c3RX/heUHtaBiJmm
 f7WPtlLBn9wa7P2pyHNFmy+M7QVjQfQtdTWz9WWlFe9FYUmK+uaf+4VJg
 pTK26RISBWS7AWFmeFnKO5QgH07e/4GJrDcod73Ii24lzB8SZwjyNajCy g==;
X-CSE-ConnectionGUID: 7sk8JQVNRfaBCf9a+UoaVA==
X-CSE-MsgGUID: THvc05lTSpudZqxSspdbBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95150441"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="95150441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:46:38 -0800
X-CSE-ConnectionGUID: 1YC/UCsYSEG8YwP6ELQ+Ww==
X-CSE-MsgGUID: IeXrz6bPS/2l9qYoHNG2DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209464573"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:46:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 00:46:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 00:46:37 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 00:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4GHaBdBe+a3V57V+tyueBf3Ua8bAh5mC0nGZeTPB4cnnHjMolkCZi+LS2ZKx+QcwSDt0rjChd7x/qTQwG6xL9POxUEybiUALdeEK8qSUZPfsrBUjnFkpppint8AzcDeuGVAPnmiGtxHMCAGhcWPPOk6pvD8JNQ3Y5W/3JzvMy5PNq0/S5Vw6GrmJ6dTP8wXapNJA5nqPcFvb4fe/Dju8yXF3cPVYKRU+6T8whOWJCC+6HPYWGrlvw7geym6t7bxFnXyt3FEs1slEd0zs9W8CTmeVRT2ec8iZaYSdGtmEuKacTbCq68d3kK41yTGNS3lDp4oHgJuywBWxAChH/Ja5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKP0rhhCHiE3eDM66ZhQOJfEDmTt6h6y4k2X72wwUzo=;
 b=VNjex913fjgVKDZe259VKWw8K3RsFZd8waP3eLJRLBHgpdhhSDH0WafY9gq/Ig/MZcyx2/AfPHDSz5z3BI4xftfeLnkImpciUHgBGO6MCIamuwCwgKMuO6DEWYzW+9AcbHXBFkybxjZDnUe/LkO3BbIkPSEiQcLTTWPAX94CwV/+oRyMigICfA0RNaS117BahgADSqUvb2erDQxRItgqtYcysMwBG1ElzRFx379PAwiaD6rRxB9MwbVgNcuROhERXuZ3NcTp1LDLdIdUr/qfUIJ30lDpKBCATbsmnz0DLCws5OPjJmJFQVP+9l90fk4/uIhxIW4di89LsxJAOi040Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 08:46:34 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 08:46:34 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add igt_debug
 instead of igt_warn
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add
 igt_debug instead of igt_warn
Thread-Index: AQHchKfh7/djq8EMckyMWxY5NdB0gLVRVFuAgAAGyRA=
Date: Wed, 14 Jan 2026 08:46:34 +0000
Message-ID: <MW4PR11MB715108A8601A7B4557707BE2E48FA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260113161520.675912-1-nishit.sharma@intel.com>
 <20260114082151.dcyfkhpxsaw2dyls@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260114082151.dcyfkhpxsaw2dyls@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: 76244180-802a-453c-0842-08de53496c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aHlaQXJTd29sUHdUdE0yREJzY0NhK2pBSENrbEVZb3NmV0NUM1lBWHIvUmRR?=
 =?utf-8?B?NC9LQ20rR0V4K1Iya2JyVXZOTjIxa2ZYTVBQKzdGdVJmYmhwWWdQU1I5b3Nt?=
 =?utf-8?B?ajBHT2tXOUxvSU41YzdDMUtWSjRDMlJteUtLdEN4bkhpaUl3TVltN3AwSmd5?=
 =?utf-8?B?dGJCc2hFR3RJYmRsbmNPRCtjRHNVL3RZaWJEa0RSdUdsMFJpbUF0QmNFeENw?=
 =?utf-8?B?Y01wUUxNbDYwb3hwbG50ZWROcnFscG1xSUpnTDBqN093SFMyMU8xQ09VUGh2?=
 =?utf-8?B?M05iTzY3MUlVeUhCbDFlMU9LOGUyeXZ5Szc2dEcwQ2J1T3lhcnhWb3BUejhL?=
 =?utf-8?B?a2FSK1lLMGFPMnZNMkE3dGNaYnBCTEN2NmxwOXIweEp1enZ4cCtJbzJrTmJK?=
 =?utf-8?B?azNSbDRqeEJ3OEhiSUNkaXFjT2x4dG1ZbWM5UHdUYTk4OVFMN2pnc3VKMDVn?=
 =?utf-8?B?Q2dWdjVPdmRzQXlJM3JuNVR4R0kyVGpaWktWa2xLalFzQXd5TnlWSlUva2oz?=
 =?utf-8?B?bnprTG9reS9rVUdhL3c1SEJwWElsVW1GbnFZYzZINnkrU1Z1dGp4R1E4Qm5C?=
 =?utf-8?B?UFJ5RVFvQldNQktRbmVUdkN2TWt4WGVjOHZYRWlRdTl5Y052NWJ3V0NPdm9M?=
 =?utf-8?B?QjlEVTZsQnJUV3o2VUhHbG1NNXNwTDR3MTJtWHVOSVVMQmtnVmJ6SW55L1A2?=
 =?utf-8?B?ZEcrcnJyamw1VUdvV2Rhd3VINmltQUFzYnF3UnhleW5XUGdsN2drMGtqZHFz?=
 =?utf-8?B?bit2emVsR2lYbmN6eGN3NE9QQzJDeEdUQ2pETXNyK3U0VExzRHhES2hob2VP?=
 =?utf-8?B?ZDVleGxYWEhDTU01NHJaQUxFb21WdnUrMWhDR3V3akRWQ2pMTXdYdVNUak1W?=
 =?utf-8?B?VWtEVFRsZ2d1NVFSa2NyVTJlaHZOOVg1SlN2c0xMcnhSYWVuSU5BQUdzS0Zy?=
 =?utf-8?B?SkFydHdud0JNOG1Ncm1WcW8vQ3h6SG1HTHJmeHFVLzdoVnBUZTVKcW5OTHdE?=
 =?utf-8?B?NGFGNWQ0WGd2NUx2Mm1OUlhPVVhIbGZZdUZ0RHRGdEE5TVJ6d3YzcTZFK3F4?=
 =?utf-8?B?TTdNb2o4UGpZWHlUcTFhb2pnSGU4K1JNYldDRmo0aURuK1l6UnZVY3c1Sllz?=
 =?utf-8?B?ZGlRMzhsZWNBcUFIaXNOQWVQVjBOMkJVcjdQOWNxVSt0Qy9pV05LelpCRFo0?=
 =?utf-8?B?NGsvRUpOWG1nTytZUnhJbGVsUjVDS05PR29aakpXSURod3cyNHpZSFQ3OHZq?=
 =?utf-8?B?ZGZZZys0WXpUUy9lTGJMT0w5YVA0ekRjdmQzV2VIRWdLM29CK1JhK05VUCsz?=
 =?utf-8?B?T3hyNmFBVytwTjJKWk5QaUFFNXEvZ05lTUNYaTgxTTNISWs1UHlmR1RKRHIw?=
 =?utf-8?B?cUxJaVZsTnBwbEUvQU5jbFhvOTBGVkZsQXRvbW1KQkRoNzlTSjJLMFJ2Mm0w?=
 =?utf-8?B?UW8vZlpTMU5YQmRoK2JFQTIwcmFGd0x6Wm9zejJ3TWxXdzRnMnZxZE0rMzlv?=
 =?utf-8?B?bDJIL3BIL3BtQW5OdUxlTzU5UTlzcmt3QVB5R2lNNlhVMmhZTXpPUHE5WGo4?=
 =?utf-8?B?NVlnMnppR1Y1WjFrRVRobU5saGJLbHlPZjZwb3VIVTJMbWFWN2NsTHZFUGd0?=
 =?utf-8?B?Z1dpU0dpL3IxbUtwTDJCSVZyT1F2WkVtVklCeHF1WjVzNTEvSlQvUERoSVZq?=
 =?utf-8?B?SHNPNDFLbHBjWHFyakhGZnVNd0hPRmFZcjZTNzBIM3VaaG16QWV2VTRPMzRm?=
 =?utf-8?B?bkN1L0o4S0dzdVBENHVBRGx0eVdwTmU3eEdPZVFuN1ltS1VyUTRwK0JxREpp?=
 =?utf-8?B?VDUwL3pmcU4xK2w3Nk5FUHNnVFVXRFRoYU8weFVScDNUUitsV1F4akYzOG5Y?=
 =?utf-8?B?WHFJdC9vZ0NjVXFnWDZ0aitTbCtZSmpLQ3JKK0ZkN1NuNEJyQ0NVanVwa0U4?=
 =?utf-8?B?bzZtZXNNcTlKbitQNDUvQ0x1R2FkaTZQdE1SR29HRmp0b05zeStuOWlsSkhn?=
 =?utf-8?B?NldnaFZod0RGUm5Od29TRVU2bVpYWXhoRjhNMHVUUFBlVlNaUUV6emtUUGg5?=
 =?utf-8?Q?tbrj6a?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW5sUVZ6czQ3RzdJY1FzV1hkQTJSNlpCa1dmdEtTYjR0UUk2OWUwOEhtaFlS?=
 =?utf-8?B?bU4wRkQ3VkQzSmhWY1poajVpYkJrdm10Q1JlQ3dLdFdnL0hGZnJMSm03eXNw?=
 =?utf-8?B?QlVoU0c5cTA5WTYzNEhpYlRjdHpEV0NoUG5Dc2d4NG82ellRSEE1NUxWSy9J?=
 =?utf-8?B?aG5ISW9vS016cUVQMklOSVZXbUNQYW9vQ0tydkpGbVptWnNoWUkrOGZNdnJP?=
 =?utf-8?B?cUhaclNxbktkc1BobTdPYktIMUFiTkRoM04vZ3ZyR2l6ZFh5S2NKRWd1WE5E?=
 =?utf-8?B?UTlBVGx0S0xTSVltODdrLzB6WkwzZThUYkZtMTR4cnVZTGVFSk5lYTJUNkVR?=
 =?utf-8?B?L2oyTjAzK0tVemU3eTljSktYVlc2ZHlId2FranptUXoyNXBadWl5WHozUS9W?=
 =?utf-8?B?THp2MEgxSVZpS0oyRDc2NFczSnRScVhFbERYTzFvb1kxNlovM0N0NUVTaUNB?=
 =?utf-8?B?b05XRmtwSHFmZFkwNHNmbEF1ZTdwdmlxMUw5M0N6K2s1VlRwWG5DOXNxcFp3?=
 =?utf-8?B?dmxhNjNGT1JKb29FN2dVMHhBZkNHUGlTeWpyT2tpby9jbG8wS01GYXl5VXBk?=
 =?utf-8?B?Q0pETTh2MWxsUkM1QS9Ra0hqT3FmVC9WZ3hBdzA2K2JMOVNiSVg4SzhWNTdk?=
 =?utf-8?B?MklONE1Nd0taWHoxQUFEUTIwQWsvTEl6dmp0ZXZYUDZlM01reEJ5ZGZjVStK?=
 =?utf-8?B?Q0RJa0J4ekduSnR0Q01XOXNlRGpVLzRJNTZUaHRSRldrUUhBamZ0c01BTVVm?=
 =?utf-8?B?ZUFOSnJEQ1VGZUlzWGhWOW9vMXR0SUFLQ0dSbGtMUndIcXJPZDBIOWpZU0lP?=
 =?utf-8?B?SWphZzZEaXBnSldQZmtyMllhUFNodFF4cTE1a0xVQ0FPcml2K0ZtWGMyR0Uz?=
 =?utf-8?B?YlF4bU5BVERMY2R6VGpmVVB6Q3RqeG9SQ2pCRFlVU2RFWnJqaE5JZy81RW1m?=
 =?utf-8?B?NVJYekVlZzBCL2dSdEcxV1ZFQkpCNEJmak1jUitIclNyL3NiOUdmZFZLcjAz?=
 =?utf-8?B?VjdWeTRheHZ4SnlZNUVEZGEvWlFGZnVWZE9QaEJJUTF2cXAzT21VajRVTVdl?=
 =?utf-8?B?NThUOVhwRlFhVGNibll6Yy8xb2dYeUdtVWJROGtBemYwYTJ1VTd1VXBpNFpx?=
 =?utf-8?B?Mkg1YUdhdzkzdkVrNVRYZ0dBbHdMclFLYzd6RDVNNDlmM1BCWWltRng4dmtR?=
 =?utf-8?B?NVpuK09HZFVLTlY0ZlE3eU10RlErRnNxdzYrTTJkalErTEVhY3ZWc2ErbWJ1?=
 =?utf-8?B?d2pQMUc2bzN6RXJKZlBmL1FLVW5EOG1qMzI0UWJmbW56dk15Ymh1cy9DUWF2?=
 =?utf-8?B?YjRKRmxGUEFYbFpIQm1CUjduZERnSFF0UFJJK1pBcE9xTlBmRnVXUWdjb3lY?=
 =?utf-8?B?MHNBMXNwVWJ6YkhQZm9hWDhGRWZJY1Z2MW1kMjlyQ3ZOZ2dyTUx6QXlMKzZs?=
 =?utf-8?B?SHFkRkxiK1BwcFdmLzZGVTZVRWM5c2RmRGZDK3p2c3NPbTlCWjBSd013aWtS?=
 =?utf-8?B?cjhzbnlSWkpJK1JGcklxWjFyY3orTFFoV0hGN1diWmQwOERSM1NpUnVjWTFp?=
 =?utf-8?B?bzliTGpVNittMXg5UVJqTytnK2p6QStsaVphZzQyWXhta2R6UlhqbGpYSTUz?=
 =?utf-8?B?dFkzSkZWVXFJbG9LVHNpS0g1NVRVR2pBdVNweEV1eFZPaHplOThISVdWQ3FC?=
 =?utf-8?B?OGg4MlJkdHU3RXlUV3BMd0dvazJsOG5nS2k4aFB5R1k0ZE9aU29pZU51ZkJy?=
 =?utf-8?B?bnFjNmN3TVJ3QitueDJUcGt6NGdCMGlkS0l2RHlvTjZCMW1ndjdPOEJjUkI3?=
 =?utf-8?B?UFN1WG1BWHo1ZjJVSnpqNThDb0UyOWxaazRDdVBhb0dHOXVETFRKOS9JQWNp?=
 =?utf-8?B?dVNmSnNjNWJDeGlMZUQ0aEpONndrWk5uYTlrZWFZZmtXNld5VlIvRE0rdFdo?=
 =?utf-8?B?Rk5yd0M1ejRNbkZhVVoyelpFRmZVOHBkQS9YZTI2MmNNK0Qxd1Y5TGZjL0p6?=
 =?utf-8?B?RGMzNGdqSzhzaVBzajQrbzNEdlVWNTdVcHJTMVhZTXl2MytHMFFmR1M5VkVw?=
 =?utf-8?B?ZEN5VTUyUm9qMEhUdjAwb280UHNoZWFzU1JwdjNsMERIbVNodExmWDdtQTFO?=
 =?utf-8?B?QXladHU3UkhBZy9nVC9oQlVPMGFhY2I4T00zRkFXSmV5KzNFMGhZR1IwaVB1?=
 =?utf-8?B?NU5uMnVBcUxMVU5PeTA5WlFaRFV0Vk5tNGtKbUVLaDNmRUVLMHZ4VEhudEFV?=
 =?utf-8?B?ekhEREFTazJZUFRZVjFydWliMGJkQ1pHL0MyUGJSZG9MV0ZPY2dhOHVGMnZr?=
 =?utf-8?B?VU00ZkRXL3B6dDJrNUlHZERNVGxFV1FnMlY5cjh3MGxVamJQOExRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76244180-802a-453c-0842-08de53496c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 08:46:34.4692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XwkqMfEzfTLPgBBah4pXW0lnzgDpO2NRCYVW5nd1ZJaAbDDFooSKeov4QXXbeEqQ5gYuKqKk1bu/JDul6mT8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

RG9uZS4gDQoNClJlZ2FyZHMNCk5pc2hpdA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPiAN
ClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxNCwgMjAyNiAxOjUyIFBNDQpUbzogU2hhcm1hLCBO
aXNoaXQgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlA
aW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KU3Vi
amVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2Nh
dG9yOiBBZGQgaWd0X2RlYnVnIGluc3RlYWQgb2YgaWd0X3dhcm4NCg0KSGkgbmlzaGl0LnNoYXJt
YSwNCk9uIDIwMjYtMDEtMTMgYXQgMTY6MTU6MjAgKzAwMDAsIG5pc2hpdC5zaGFybWFAaW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNv
bT4NCj4gDQo+IFJlcGxhY2VkIGlndF93YXJuIHdpdGggaWd0X2RlYnVnIGluIHRlc3Qgb3V0cHV0
IHRvIHByZXZlbnQgDQo+IG5vbi1jcml0aWNhbCB3YXJuaW5ncyBmcm9tIGJlaW5nIGZsYWdnZWQg
YXMgZXJyb3JzIGluIENJIHJ1bnMuIFRoaXMgDQo+IGNoYW5nZSBoZWxwcyBhdm9pZCBjbHV0dGVy
aW5nIENJIGxvZ3Mgd2l0aCBiZW5pZ24gbWVzc2FnZXMsIGVuc3VyaW5nIA0KPiB0aGF0IG9ubHkg
cmVsZXZhbnQgaXNzdWVzIGFyZSBoaWdobGlnaHRlZCBkdXJpbmcgYXV0b21hdGVkIHRlc3Rpbmcu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVs
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYyB8
IDkgKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2Fs
bG9jYXRvci5jIA0KPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+
IGluZGV4IDhhZjY2ZDc2ZS4uOTQ1YzU2NTM1IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94
ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5
c3RlbV9hbGxvY2F0b3IuYw0KPiBAQCAtMTkyNCw5ICsxOTI0LDE0IEBAIHRlc3RfZXhlYyhpbnQg
ZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICAJCSAqIDEw
MCUgcmVsaWFibGUsIHJhdGhlciB0aGFuIGZhaWwgdGhlIHRlc3QsIGp1c3QgcHJpbnQgYQ0KPiAg
CQkgKiB3YXJuaW5nIG1lc3NhZ2UuDQo+ICAJCSAqLw0KPiAtCQlpZiAocGZfY291bnQgIT0gcGZf
Y291bnRfYWZ0ZXIpDQo+IC0JCQlpZ3Rfd2FybigicGZfY291bnQoJWQpICE9IHBmX2NvdW50X2Fm
dGVyKCVkKVxuIiwNCj4gKwkJaWYgKHBmX2NvdW50ICE9IHBmX2NvdW50X2FmdGVyKSB7DQo+ICsJ
CQlpZ3RfZGVidWcoIlBhZ2VmYXVsdCBjb3VudCAlc1xuIiwNCj4gKwkJCQkgIHBmX2NvdW50ICE9
IHBmX2NvdW50X2FmdGVyDQoNCllvdSBhbHJlYWR5IGNoZWNrZWQgaXQgYXQgaWYoKSBhYm92ZS4N
Cg0KPiArCQkJCSAgPyAicGYgY291bnQgY2hhbmdlZCINCj4gKwkJCQkgIDogInBmIGNvdW50IG5v
dCBjaGFuZ2VkIik7DQo+ICsJCQlpZ3RfaW5mbygicGZfY291bnQoJWQpICE9IHBmX2NvdW50X2Fm
dGVyKCVkKVxuIiwNCg0KUGxlYXNlIHVzZSBlaXRoZXIgaWd0X2RlYnVnIG9yIGlndF9pbmZvLCBu
b3QgYm90aCwgYXMgeW91IHByaW50IHRoZSBzYW1lIGluZm8gaGVyZS4NCg0KUmVnYXJkcywNCkth
bWlsDQoNCj4gIAkJCQkgcGZfY291bnQsIHBmX2NvdW50X2FmdGVyKTsNCj4gKwkJfQ0KPiAgCX0N
Cj4gIA0KPiAgY2xlYW51cDoNCj4gLS0NCj4gMi40OC4xDQo+IA0K
