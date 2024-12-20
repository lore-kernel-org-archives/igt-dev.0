Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D4E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 08:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277510E65B;
	Fri, 20 Dec 2024 08:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XquKEhLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79E310E65B;
 Fri, 20 Dec 2024 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734682433; x=1766218433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ojlFz6DgSSidh/6yoYwRSJRnR9ghVRRcC0Hii/twaNs=;
 b=XquKEhLuG5OS5aayDj47M9vBkbS/tVE9Gw0oV7QkFVtdGL/JYM0hCM5b
 omw0W5DFsYGCTZhR5LFh2+DNIuk0Owm5fRV5mceiPJRx7hrKk7iZznSLo
 C6REL+PRSkyBlsXeRQ9bL0I4pMcTeX7DMz8ql9dutwrxbu1+Dn6B/enCt
 5cJWP1Z6ic1mVMQ7oALDaLIwVg4evw+L6siqUjk17PdwREjoQdpZ0b0hb
 zEmmjb/v0End3p/tdDcuItWtJoHqLeFVthdmKc6ah1u5yu0Nl+VEN31Vl
 C4o7XKrguC7KF7Usbe405KqJyqCIYLnKcRcjmTkvTsdZO0V/+xS/4OhSA g==;
X-CSE-ConnectionGUID: yzkRaSpbSmm7HFXL7BrBeg==
X-CSE-MsgGUID: nONQypLySOK1bTHrLMIZYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46233620"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="46233620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 00:13:52 -0800
X-CSE-ConnectionGUID: NkWWGeJZTsyvkcU6wJJS8w==
X-CSE-MsgGUID: 58hNq2qMQjGASm/nTQRyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98515174"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 00:13:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 00:13:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 00:13:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 00:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZskTA3gWdBLGKXY8lmXCJpmFqE4eLOK8cH68iHw9GsXoX79Q7jtcTTmSaTZhzS/Qq9lmlrRx+jQvgA0AjyNj2G6pirHNNWDNISMZmUEDwlk2L05cajMR08whBG9tqJCGEV0Q69zz4foPcLzr1RAvfPbLa8DnTl+/HPIQs9KcXjngSOSl1OH/lAmPQB6LQhufD6aA+21HxzwBiULqcB/cgiP83Phzl1ZwMgq760sI4OF16KX2f+pmL5D2bWSRKsSVHU4imzy+9jcockdJndgRN9nIQ2Nz9Xl/9lDiMyqVZD8rMTLjZor+Cwfo1K0MiJv/5L524gcvcUclI6dLTUbdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/LxXwkITq9SJSWbN+HcDVqkht4IqL2of3Ch2x7381A=;
 b=X9t4/oCs1QY2eVqcYe0CtH9O6MI9mF/aBSB5ACJlo1LeNuwqFohUPBzuWX13gsWQi3N5A1ZvFFPPYPQfk4vw2kCHsf07eU/2Foass58Lk0Vge6rFKEHZGZpZ3wgGzgxzywf66L/sbh4mX5w7Va8RBbSgki5NZGXJixAL3e8oUzOvGKXuc9pQpueJxvOkhCq4lu5X13wopo10U79Yc8D98Wx2InTrVNPwKJNvJBM/R9LKjjsGA2CgIrtwmDb6CLiwBHwv3AnXM4aoI1UYhfAzfWK8+LtdORFVatJVz92C4BBk8qT33WnpnI6AipeLhkPYEorseDdJsoGti05ogbJ0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 08:13:50 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%2]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:13:50 +0000
Date: Fri, 20 Dec 2024 09:13:42 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/i915_hangman: Fix spin engine hang (rev5)
Message-ID: <vgsh3pi2llfyt4tpy5gwecqbx6seop2uyhr6i3mn5ocikxknxd@kufl2h5ntf75>
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
 <173455876314.164096.8182258111434382144@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173455876314.164096.8182258111434382144@b555e5b46a47>
X-ClientProxiedBy: ZR0P278CA0083.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::16) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 673bc520-f666-49f5-17bd-08dd20ce3c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Lzh6Y3NMUXp5eDBXdUV3a3dXOHJBb3NmbmlDRlExMnA5ZTc0eEFGNndkZXRW?=
 =?utf-8?B?em83dWlBSnNWK1FmWVNLbFFIZWJEcUZmMlo1T0Q3eUM1d05yNEhZQTVobE4v?=
 =?utf-8?B?dHVhTEpQS2REbk91QmFMRXY2VkdLN0R3VndUZU12bHIrTXJFZVZ4MktrczRS?=
 =?utf-8?B?TDlPSk9pYXNiR0dJOE1JRkZIaWdhNjFkM3ZOUXpteWx5RHAwRDk1LzBRMktU?=
 =?utf-8?B?aGRuWk91d2VBMVRneURTc0pxaDVVRWI5L1Bkd085NlBhbTVZM3NieXNaSlVa?=
 =?utf-8?B?ZXhOSnBjRndibWxWMW1yZDZUK0JzY2VSNFY2TkNhMnE4d2JvR1BQcHBVMXB0?=
 =?utf-8?B?eVJFamhkWis2V2VvOFRkMTlYTWV1RDVwZ1JRTzBGc0p5Z3ZYcldwRytmbkNO?=
 =?utf-8?B?UllDdTRCVEtIMW44NDA5WTZWYUV1bUU4WndrU0VNbmx1SlJySUI3TkprNWhO?=
 =?utf-8?B?ZWVrZmFnOUxBRjNmMFdFMUk4MWdhL1RvbW13dm9vZEszaDNCckZsaE1XOHBL?=
 =?utf-8?B?UE1vcW1zWDBTVnVVVTRtK2s1cDhSV3lkejRnTG5DenB2WEVtOW1od2creito?=
 =?utf-8?B?azVGMXUybVZHencxeGNQYVVqSnozNkh4RXk0bjBmL0VKelRERC9pcGRPY2FM?=
 =?utf-8?B?SjBCQkhhY1prdlFwcnY2UDVmU1ZYc3VYcW5LR0gvMFZCRmx4Szl3RHFjZGI3?=
 =?utf-8?B?ZDB0T2pZS1ZZaEtOejNsVTBjaXQ5WWRrdGxaa292ZGJuVDZ0bkdvRjlIVW02?=
 =?utf-8?B?Ry8vUmQyODg3VkJOdys0VlR4RyttM1NUdXVjcDFOczlHV05zcUxZc1ZRV0RO?=
 =?utf-8?B?L0ttYUxvYlVPUkp3UmgxVlhEUnZDUlVja2dpc1VUcGxQbFhTYmV5YXN2U292?=
 =?utf-8?B?dXhIV2VrT2ZuT3A3U3FabCtyS0MxT25QcXpDSkR0VW9lOHNJcDlhRDZRUHpH?=
 =?utf-8?B?RFRPKzRqamR6WGxFYVRVS1VBckRpTFFEYmJpai96Rmg5d2ZLQWN4aCtyUVND?=
 =?utf-8?B?ZHVRVWt1d0x1czI4SWpPdG5yOVVOWHhwbnA5R2FqYmFPQjVXMkl6c3hUSSsy?=
 =?utf-8?B?Z0F0SGp1MGsweVhmeUduK2VVZTIydkw2dmpTbjY3MnRZOUJDM0FIOVZEUXFr?=
 =?utf-8?B?QmQ4MzRUSzRCZHNKTCtxWjc5dUNXdEJCMTJhY1p1d0NoYVgramR5UUhuYWtD?=
 =?utf-8?B?blliaUJYRm9BUm5rT1FxRFBlMEVleFZyREhIeFJVTENaOWdKOVNQRmV0WFc1?=
 =?utf-8?B?bTlSVlBCM1NWK1VMZUVGUkF5TWovL0FDMjUweGoxN2pTVkduRDByQW9hN2pj?=
 =?utf-8?B?U1o2cjkybUdyZjZWSThkNWNtaWc0VkxLSlZmRkxWVVl2OXU5Z3FyZGQyaWRE?=
 =?utf-8?B?MmFjUThFWGZiVG55c3VPMTRUZ1N4dUN3djg4MGJYT1FQT1o2ajJOZmpWYWc2?=
 =?utf-8?B?c0xMVmhrc0RKOVhGdFZLY0hIaG5TaWdleFlHSE1YRk41bGFFbFRvYWt0SFVn?=
 =?utf-8?B?b1F5d2J2ZUVhUGJlM29oMDhmeU1KRkNhdk5IS1lRUDRWSGF0S3JZKytmYjZk?=
 =?utf-8?B?SUY0bmpuMDF6SCsrRW1POXJVZlZFZGoreXZ2aWVPcXhoRzJRWW94ZlR6Uklt?=
 =?utf-8?B?RkRsSys2Z0JBQkdKWndxRU96eFh4Z2pOcTAyRDhXaWlFUytONmR6Y1pteVd3?=
 =?utf-8?B?Sjc4N2tnOE9IRzMvajVvMFh4Qm5RV2ZhVXlIenBRaW1MQ0dpcDZIcjRWRDBZ?=
 =?utf-8?B?VmlhMFA5V3VQUUpZb2lCckFiVmNqRExOR3dhUmIwQ2JyaHRrMkd1bXNLek5a?=
 =?utf-8?B?bER0SmxndWZUZStZYzBOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFFENVFWazlUSmtmQ3ZGRzA5cVQ3SE9QMlkyVGJxZTZlNllaWHUvL0Y2cEsz?=
 =?utf-8?B?Z2RTc1VseVZDMEFRY1Z3bG05SUtuV0JTK3hnNk5aMCtteGRwUFJTeElGdFNj?=
 =?utf-8?B?MFl1WmlVdm01ZW1xWmFPb0dlWkpMeFU5czloOVBBaUJRcWdhbTVqS1Z0K2hZ?=
 =?utf-8?B?ZVJTTGI0VkkzbW5JandXblRIcyswTmc4b0pVNTFvQ2VHOEVYbGpyZVFKT1Qr?=
 =?utf-8?B?cTBZWldxMmxZd1RXaTJtM083UG5jZlpscUd5YUVzVjkyb3VtTFRHR3pibndP?=
 =?utf-8?B?TzNXNVB6NVU1VittaUczTGFhY1BHTUc0ZnFJQ3lEY2ZqUmNON21lRWQ5eWFq?=
 =?utf-8?B?b25VTUFZZ0twbkZ6UUZTY3Fqc05IUTlaNDhPMWdyMTc3dllkdWQwdytZSkl2?=
 =?utf-8?B?anhwd3BrVTZFK0NsMXZHNTRYaFRDd1Urc1htWmpycUM0Ymx1MTRUbHZLUjVi?=
 =?utf-8?B?YUFRSTZyNURxVVZCbDNQY09vc0NiRi9NbXBlZ3pPcHljNFN3QXpXK2s0cGFL?=
 =?utf-8?B?QmVDQzlQSEdrQytxKzlyU1VZb2dSYWxjTlBtUnpvYStNaEdaMDBpbnRYVmM0?=
 =?utf-8?B?Q3h1TFAySWFaSVNWWVdNSnlzS1hzc0lyWWoyWGdxV2ZKREVyeldoVkV5RWtG?=
 =?utf-8?B?M244SUUyUkdFUEFJUDZqMVY2OXFQMGVLV1Z0SittT1NpakNkNVZJQUN4Qnc1?=
 =?utf-8?B?UVlyQlBlQmVPL3JGQzFMVUJiVlNlOERzNDVZTVJtWkdkVEpDYkFaZWN6MnFC?=
 =?utf-8?B?NU5VanZxZGs3b2dvZm10NnBsN1N6bFYwekVRRkhkajJPYlU2WUsrVXVwVkVv?=
 =?utf-8?B?YWFDWjQ1NnhoZHRSbnFsYm5CZXd6cmoxQ1NhUXlqUncwRkoybGZDaUlIdzVu?=
 =?utf-8?B?UUFHVGJRRk94NmRpTGhyOFNwQkNuYVhpTitHZThZaW10UVM3Y25aNWRHV0Z5?=
 =?utf-8?B?bHRlWTRCWVlCNDgzQllFdmhWajFWZ3RzTEZ1enV6a21Eb2RHT3FBRElTa0No?=
 =?utf-8?B?Y2svNzg5Yjk1Y25HRmJCeW1kT1BybGQvUENuRkVVQWRRLzBjVDBvWldjNVNo?=
 =?utf-8?B?RnRtd2s3ZWIxNGo2WHB3WTkrWGYzVkRSMG1PYklDWDJiK2MyVEgrVmxJeWdr?=
 =?utf-8?B?OWk3bkpESWt6dW5yR1MzSDVUcE9iemNxTHBOZ0p6eVN4K0VNNjBBYXAyN3FV?=
 =?utf-8?B?NG1IS280WitGKzVXT3p6Y241NXhkL3IzKzB0bysxd2tlVXhjUFlFcExRNDRK?=
 =?utf-8?B?ZHNjTElvdXZzRk9HS3ZESDBsNkdDbWQyWTZRZS9qTjgxcVFycGlWMHdnMmpO?=
 =?utf-8?B?RC9wUjBBREg2QzI4QTRwRFJkbnFEMzRGYzg2QlBjQ2NXakxDMHVxb2VsSEQ1?=
 =?utf-8?B?czFLWFIwWVo5OE9RMHAzMzJKVWpGZytDTUN2RE5TQnYwNVpQOENLYjFhMVdx?=
 =?utf-8?B?REJBRHJ0NDVDNUpLOVl0b0l6bEFFK0NnRWlOV3MzVnJyb05reTdpQlBld2Iv?=
 =?utf-8?B?VjJQN0N1R2NsdUFHTUlnWWxSU3NGSDJ1cDVPT29SNzVTQS9rTEQ0Y0t3ZVNR?=
 =?utf-8?B?UTQySzhVTitPZEJUUFRvZmoxYUlDT1g1L2JTQ2pGR3d5RGVVSVJRaC9KYVZT?=
 =?utf-8?B?cjYyaC9QdWZMdVljN0hIUEdxVEJnNHIzTDF3eGh6dmJTbGxlV2JTWi8rb0VE?=
 =?utf-8?B?ME5vRUI1ZDg4NkIvT29DM2RraHVnV2U2TUI4THpWYSs5TU00NmU4a2RoYTBR?=
 =?utf-8?B?U1hzRmwrZDFWcE5EeHVqVm9rOVFLZU85RUU4WnJteXNlMEZITHV4d0lCaVY1?=
 =?utf-8?B?QXdoTXJwbzEreU5WZ3JiUmdLRkZVY2grem1GTEpLci8xdUcycU50V2hLZHY2?=
 =?utf-8?B?ZGU0S1B5WDh2L01zN0FRbXdER0NBK2pqYVVjWnVPdG9KVndrekFyaXFSeTA4?=
 =?utf-8?B?NjF4S1NjRVBFUzE0YXZVcG5mcUxIcHAxdVlZUmZWaXFlTCtGVDRKRlpUdVcv?=
 =?utf-8?B?MnVnS3RIR3RrK3ZRM0duNGFRU2RMVnFwYy9ZRlZLUjBuSkpIaWx2ZFVaekcw?=
 =?utf-8?B?K3VpY1g1ZmdURUdHN3g1WXltcGlXaHVvc1dKY1F1dDYvdGgvTkVpUS95RXVP?=
 =?utf-8?B?ZVlEYkNtZ28rQ3VwcmZUMm5WT1RxQy9YZmtrNXNCNEpuaHpGT3dySGZhR1hX?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 673bc520-f666-49f5-17bd-08dd20ce3c20
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:13:50.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vvf/tBff/EzOv5j5+yjyPm6YZxM2yZo/kpx5ick3gf/heJlDlR5RhirSo/DdyP/m9z/c736pi4y5WIusllVAgYnkEJGPGqWw9Ez8+npErg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

On 2024-12-18 at 21:52:43 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_hangman: Fix spin engine hang (rev5)
> URL   : https://patchwork.freedesktop.org/series/141694/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8161_full -> XEIGTPW_12334_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12334_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12334_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12334_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/shard-dg2-463/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-dg2-435/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] +3 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/shard-lnl-4/igt@kms_psr@fbc-psr2-no-drrs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [TIMEOUT][10] ([Intel XE#2961] / [Intel XE#2998]) -> [INCOMPLETE][11] +1 other test incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12334/shard-dg2-435/igt@xe_live_ktest@xe_bo.html

Hi i915 ci infra

these issues are unrelated since the patch focuses on i915_hangman.
Please update filters.
Mikolaj
