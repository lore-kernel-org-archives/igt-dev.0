Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4430C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 13:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DC810E43B;
	Mon, 24 Jun 2024 13:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVug6OVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4623810E442
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719235348; x=1750771348;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HdCzyQ0fn5frcv0k46lWJtk+4vOwewY7mlPYCgZETe0=;
 b=JVug6OVfTpTOt4QthtVxTPJp0DkvUwU/F0emFV4SA3liZEPTRWbeO7Bq
 0gJAaFsSp/r+VkQqxvwHsRJP5V2+Ek1xTfBY3WttFbQoGP4o87z+9Jfsw
 w13Og8S/YJexurr0iNcafSC+rC0X+EIqIrGVZ/s+wRpxtICiHqhJ7mF/J
 tPPJKqC3taIVVVCCqkS5zkcnOpY8Ief1ba860anvs7wsS3Qf+9sFkIiy2
 pbz7vsYLmWcXqJiZnvVIGC8/skmMliCEyK887FNVoR9dl0iMHXSwQFMdQ
 bxwVjSKpseHrKq2PJSbS4IzHyj9n8Na1dYeMBIuUx3Fuj06Bf/Wqor6k3 g==;
X-CSE-ConnectionGUID: TnLSC/M+RuGrGxKuuaXhNA==
X-CSE-MsgGUID: EzE0EsvtREebxgJbDEQBTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19977721"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="19977721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 06:22:28 -0700
X-CSE-ConnectionGUID: zozcUdL5S8KWQw/dFF0z4A==
X-CSE-MsgGUID: LD5LxMUpTBSmUa6iLNsOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="74046673"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 06:22:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 06:22:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 06:22:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 06:22:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 06:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD2pBWQUQPgRR28UTRyHDxwOAl1553lBvm/DF1GZN6VtfKlmtIl1GAgeHQP10ritgEmB4wjJyrKZwj11xQIMDzFX/rzqjGp55kGg13YRNK4kAETs3gYJH4UvbV9GEhMPnAI1x/yLBO8yEAoFECTGxFZ9Tmm6fQvBSc2Rq42TOKwTySnxJ2kWH2PzsBRCoiMb7QRPb8kKOQj8zf71oUHWBlUoAVDkF89mF55mM/qOxKuG+5MOa4+EQ7oUEBPqy57Eft+wTAVimrG7IJcTqzHSlSzF0/E9bwL30GQ6TE38FPUtmXKfa59NgyqOx8zZvZEjC7zT5rxOtiiM28wQT+eE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+8qr2xZ452cQPIv1BaDB8r5XFoUOWkaFrybF86xhWY=;
 b=UN0HduKZnAg28iuPCLfKPRhKENSltiDq7cJEWFC6FnW+N896tvn10zTL8Wg02WCAEtJYR1W2uiqgTkyhPPhTM7KPHOJrvaQQ842sn2aeoJUcjfW0V/xeJPpo4LypBmCNTKnm7qaAFUKxb1VbIbXp3NdNi2vtM/hkd4+UhQSGcMhXqspWeD3xeaG+eEt7LgVpnheIw8TA77gdYeEpLasGRXftVtu51xV+/fiC0yOCyIechKyUPHNl2a6DFPgoRwOQDnYWiujcbenb8Ugd2vDIJK+vTmz6z2fxh3JcCtScwvosNBsqed/pjm55Lx5Kg0//2Usi2kX4ry3RwEMvixoMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Mon, 24 Jun 2024 13:22:23 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 13:22:22 +0000
Message-ID: <89a349a5-68ea-487e-8f1f-88864c557aec@intel.com>
Date: Mon, 24 Jun 2024 18:52:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/chamelium/kms_chamelium_color: plug ports and
 prefer HDMI
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240624071805.1356668-1-kunal1.joshi@intel.com>
 <20240624071805.1356668-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240624071805.1356668-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 925b3b10-8af1-4df1-32b7-08dc9450ae71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk54N0srdllHYmNUWXB1dG1US1N3ZzhTbWRFN2daYk4zNlhqZFFWSkp0d0tw?=
 =?utf-8?B?NmhJblplRG10MmErWHhicWgxSnV2a0IxaEtPVmFuRFhOSUVRRmtYTEFDMy8y?=
 =?utf-8?B?YnZhcnV4cFo4VEZGWmVWYzRWZzJtQkQvSXBwNGpnVHRQeVJ3V1RNNkRlQVZK?=
 =?utf-8?B?UjZrK1RKamVHSEM2djA0bGM5cU81Tm5aMUFkeGNZQWtmRXBBT3R2Yy9OS21r?=
 =?utf-8?B?ZFlreEFxMjlzK3IxbGpwR2NGS1RQZm5MaldIM3NkaGdMMXBsWVFWeGtmL1JF?=
 =?utf-8?B?emozaW05NjE0aWpSZUEwdk00MGJGZEV6MVZpOE5hREJmWDZoWFBSbkIyWUwy?=
 =?utf-8?B?azRjY3RFeEEyY3RBcmxkd1JSUnBuZ0U0bGNYdHdWZ3ZhZ1c1K01rejB3dHBh?=
 =?utf-8?B?UjFXY2tQbnQ1Lys4SXpYaDJBb3JPNnFPaUE3czcvbUFCaHlPVmlwbklxM3h5?=
 =?utf-8?B?ZDFEVmYrVmgrRW94MnZEVUwrbHNteUtBVjBBajdNbHJBbTE4VXR1U283ZXdK?=
 =?utf-8?B?RWdhV0VQcTI5K054WVVYWUZGRmdVVDJZV2cvTGpMU1pFZklrSzFuWitJYUI1?=
 =?utf-8?B?b0w3QTJGM1VWNTBEcnVvWUNDbTdpRjlON2FhQllCeFdmb3NKY0ROTmd0Mm1p?=
 =?utf-8?B?aFUreDBVVkRBWVhIb09uN3Bpd1RIRXRMVUlCczNOY0FOL2I0RjZOUS9pUDdG?=
 =?utf-8?B?RGUrc0xGcDlxem80b1F5RFl2b0FqekNZSUljZC95Q3RyQzI1WmMxWmxsMzR6?=
 =?utf-8?B?TFFoOXZmRjVOTHQ4MFRCNGY0RjRrb2VxQ3A4dUtxTyszNWV3SmxOalRSRmNQ?=
 =?utf-8?B?Q3h1eUtSaTRLaFpIdnVPZFNGZFpCclpQUVVRek5IODRMNkRrNDRPTUMyREd6?=
 =?utf-8?B?TEQwczBCTHF0KzJaRWU5YUorZjcrbGNkd2ZVUnRKc2c3ZFEyMWNQc2xnY2Ju?=
 =?utf-8?B?TUFFbzhDZXIveUFpUm10Y29Pc1lzUzFCVFhGNGY0Tm5lR0RIenRWSkZnRG9n?=
 =?utf-8?B?Y0Vta1pITENiN05BTEg0QUQ2ay9WOU83U2RhUkcrQldUZjhVYWI4V2QzZWRz?=
 =?utf-8?B?TjNjWFBicitPYmxrOEpWYlRPYkF5MWJmU0tsNHdOVHZ6YWJzcFhCQ3d2UzUr?=
 =?utf-8?B?SGl2aGJVQTkraUxVTkd2Y0ZhMnVTQk5VYnYveVpyMVpKZCtOUmF3dnh5L3h3?=
 =?utf-8?B?WUcwaTFpYTBNcU1oK0dLOW40OXFVZmliRHNsZHM5NmNZUVBCbzV2ZEpqYW1I?=
 =?utf-8?B?azFWK2dydDViYWtCa0czUWZQaFZOWUliYjNYVlpOeU5STnV5a1RpQ05WUHZY?=
 =?utf-8?B?djA3eXg2VWllM3NYS05GdUg5NHhOL2tpY09FdEVrWXRDdEhpMks5N1J4bENj?=
 =?utf-8?B?ZjVYVmd6cTEyQ0Jiak8vRzNMc1h4bzdqTkFjUzkzenYxUncrcmJXaXA0WHUx?=
 =?utf-8?B?dFp2SUJIOHVJWGR6enk1NFhIU2Fhd1gwVmNrWVoreWNIWkp1MkhrVUxmVHRO?=
 =?utf-8?B?ZXdKcm9kQXd0Vnp5NlhtMGhtNkRwMnZaVTRzQlNabGtDK0ZVR2JpZVVVR1Bu?=
 =?utf-8?B?OUtTNXBabjd1d1FGdU4xUy9RTXZuTWVtMnlqZ2dUMTdYN201OVdmaVd1SDRh?=
 =?utf-8?B?bmNJSFROa3pkelBOSXlrUWRKVmZmbmFkTEV1WmFjOUd2VUhDaml4QmJoVnhJ?=
 =?utf-8?B?aGdBSGZXNW9oQVB2MjlGVWN3b29rMkpyRkEyZWtNbkFJWXlBUkZmOWVYRHJu?=
 =?utf-8?Q?p8Dmep07m3OIKbEKuqQqohOnAXsmnz4HghvDluZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampnMWRKb0pTSGtYYy9mM2ZJRFlIbXFSUjdDQ0tXWW9pYUhlYjhoT0hKOUl4?=
 =?utf-8?B?T3FLMkkwT1ozTkU0RWRMaDZkNVpsMStHWHhPeGRuZ0c0dU9MODF0YlN0NC9E?=
 =?utf-8?B?REp2UVhCR0lQWHQvdHJCM09IUGJhWEVKdDFCZFhFSXB6Zkhtb2FuT2MzWW1q?=
 =?utf-8?B?aGtqdE5lMDk4VTF4RVBwWkJEZXNZREplUlJxZjQxWWhzdCs0Q1cvQ1dGSjNk?=
 =?utf-8?B?UStSZnUxL1AxOE42UlpseEh1Rm5DbEpLNE5IWFIwUVZ1OW9tNmRZNWZPYy9r?=
 =?utf-8?B?akZOeEJPOVNlUFpkRWpDZVZydWVMSGZ0S2NhOGxNWnhDSGtZMHNuYnRBTHNi?=
 =?utf-8?B?Q3d4Y3FVUlBTbUtGQnp3aWg3VjFLN2ZoWFJGWk1xVnJaK0ZPQS9ROG9zOXBp?=
 =?utf-8?B?SXJsSnB0eUhvZnFMWmxIMW5rN1ArN0VUV2pCRXRpNHNBU1dPQkIzNkhOUlZ6?=
 =?utf-8?B?em14djE4R1VZOHUzRVRMMWVjcU1mRnZYS0lUL24wUWh6QlQxR1ZId2NVdnVq?=
 =?utf-8?B?VzlUVEt1U0lTM2RMR3dacG9HMkpiejhTUDNVN1pQcjg4cEszeEdyN0sraHlv?=
 =?utf-8?B?amljOFRSS2N0Ynl0S1NQY0IwK0JuRjkxMk9iRHJmblhNL0QwdWpzZStMRExy?=
 =?utf-8?B?OXpjSWxlR2pHUURpRTlOT2xhOHErV3JRUnhXUWZFeUltOXZRSExCVy8rNU11?=
 =?utf-8?B?NFAwVXlVcGc1aGJWemd4V0ZUTlRURmdWVkxlT0FZMGpnSkVFZFVNV0RiTXdP?=
 =?utf-8?B?akRZcllZK3VKWStiUTdXNHNZNHIyZ2Z0Q0RQNVhqWkc5UjdMc1RZOVhSOVdW?=
 =?utf-8?B?ajhMUmxlZm1qRUZQZDVobGg1KzBUNno2L1loZWxMamc3NmlCYVdCRDJ6enp6?=
 =?utf-8?B?TlZ4K3ZzYnFZbEk5WmJwT2RlN25NRUJzM3NjNFFaczNKRWJGVGZHZ2ZiVzdU?=
 =?utf-8?B?WjJaZk44STF0OE1TYWJrbGxDUnQrdE93U0tHTGVzSGNuRk81ZHRORSt4ZGtR?=
 =?utf-8?B?U0p2NXJkemFZaWM3OTdETUlPcWJnaUNTbHhMWmhENjdoKzRNTXB5MnZna2hK?=
 =?utf-8?B?Tm5lRWF0WFNsazV2SWd0RDlwYm5hQlZHV1dmdjAzcDFWeFVFT0hNMWhna3Zq?=
 =?utf-8?B?aXBBOW4vUnI2TCttYkxnc2pQaVJwb1hOb3l0VW9pT3oraDNkUkxFNVRNM3Mx?=
 =?utf-8?B?dEFaQWYwRVdFc0pFQ2dNcHF4T1hWNGp6VGJFVWRzcjNyS25CbTlEK2dGL0JK?=
 =?utf-8?B?QmNqclZTQUJQWkpMUHFhYjFjWVlRNEJ1bUxoY3YzU0FtcUFCSm1VTzMzbUpo?=
 =?utf-8?B?Nmdka0ExalhqczZZN2pCR2pZVmdYYzBSZW9vZnNZYld1RWRuNzRkVzhGbVhq?=
 =?utf-8?B?YkhPZkc3U1hqZURVU1BOOXNqclRRNG5Dd2FFd3VWZXExYmE1TXhKT09VUFBS?=
 =?utf-8?B?ZUtTbnY1V1M2ckQrV1BoZFVRczJDT1FRcXZKamhWRFFJMUZyUk40WUx4M0lk?=
 =?utf-8?B?QVlSa3dmcXVON0NiSXlFRUF5STFseVJldDY5bE1TdFpMOEZNUDBYYmJMcFYr?=
 =?utf-8?B?T29VUFVwNlJwdmxrVWZMUHZFUTJRQnZxYzl3V0Z4bjhueThuMVZYcGUxbmhT?=
 =?utf-8?B?Rjc4QjFhTVk0ZHZHeDhXNmJUTllYZWUyYVJUdEVkMnBrbGJPdllCbkdkTnR1?=
 =?utf-8?B?UGhyck53Sm1MZGZCWHZjTVdvWmZLekduQ29PM3pmdEtKUHVXb2x3SXI1RHgr?=
 =?utf-8?B?SHB0eEljNnVZU1I1cUJpMTVBUUxuU0wxYUxBT0R0L29yUldxaTBubGJLeHZE?=
 =?utf-8?B?bmJOUlZuVFkyQXlVY0JPZWhBa25QcUwrWGVQSk1iVCtVeEQzVGszRVBaSUt5?=
 =?utf-8?B?b0JxTmxlampiQURqd2MxbkIzQ2JpT0l3blMwcWhjU2J6VVcyVGUyQ2NOZkZT?=
 =?utf-8?B?TlNPUDhBZ0JGSTUrUWJuZGhaZjFtUy8xOTNxYW5Gb1hXTEhCaStHRGlocHpl?=
 =?utf-8?B?a3JDTHEvZGFuWVluQUw2dnZOa0wwZnErUGFpOWVSdmpsdWM4eHo5VDRRL2po?=
 =?utf-8?B?VEszbWJQbDBNb095TTA2ME51dmllWXdBZmtxZGdrTTlMckl6UFdTNEdWbFdR?=
 =?utf-8?B?b1oxRjlrTWFGOVFJcXpuaUlGdHhVNmk5UjVMaUtZcHVSQlIxdkd6NDgxWHNX?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 925b3b10-8af1-4df1-32b7-08dc9450ae71
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:22:22.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3paX/p0P6JIbzwjRnqkeCYveRL5gZoTMMx9kqEU0tBo/iGhk4B5qLemaGiClyYdr+KmrkZuk4dkC4AE7oCaphut8bkm+8aaOallw1OeY9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

Hi Kunal,

On 24-06-2024 12:48 pm, Kunal Joshi wrote:
> plug port before starting the test and prefer HDMI connector

Can you please add some info like why do we need to plug the port 
everytime before starting the subtest?

Also, please split this patch into 2:
1) plug port before starting the subtest
2) HDMI preference over DP

> as we face DP FSM issues on DP connector
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_chamelium_color.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index 4156023da..f8e80f350 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -468,6 +468,19 @@ static int test_setup(data_t *data, enum pipe p)
>   
>   	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +                for (i = 0; i < data->port_count; i++) {
> +                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +                                return i;
> +                }
> +        }
> +
>   	for_each_valid_output_on_pipe(&data->display, p, data->output) {

We can drop this line to combine HDMI & DP checks in single loop.

- Bhanu

>   		for (i = 0; i < data->port_count; i++) {
>   			if (strcmp(data->output->name,
> @@ -709,6 +722,7 @@ run_tests_for_pipe(data_t *data)
>   
>   igt_main
>   {
> +	int i;
>   	data_t data = {};
>   
>   	igt_fixture {
> @@ -731,6 +745,9 @@ igt_main
>   		if (!data.port_count)
>   			igt_skip("No ports connected\n");
>   
> +		for( i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
>   		kmstest_set_vt_graphics_mode();
>   	}
>   
