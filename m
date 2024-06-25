Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D5C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 18:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4D410E21E;
	Tue, 25 Jun 2024 18:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHVrb4JD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B394D10E714
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719339461; x=1750875461;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kvp0qPu1c6SdI01JxYXh6OfRLcuDvuE/pPrTL3PHkSc=;
 b=YHVrb4JDcaDc6PJDM7SGtHfYpC6UN0XGnjAIE4Tw/XH9zwgCatCIY/pg
 VvFf29PzhCDn2oYNeRNOE0S2+aboh1i4HSFXrdEyYVnEvRJLgge6ZLtft
 +KUX6OMEa+8pVYE1xgIoQhoFvtIxdCZ8vezT5d0/fq92PXZo5mNXz3BlR
 slE9TGjN0IvOHM/kUhsMrTL/4igLglffwZrVmp8z548JY265wCi2CIzsx
 MDCBJpgPHElvFL3Bl376jJYrg/LYdJG8LHLo1oUezbHfFduYCMclLlTTi
 qfxutmKXi/YjOQTeMJL1vubLyIN5TXk1F+18m2aLRakhQC/4ACXJ2D/mX w==;
X-CSE-ConnectionGUID: QS9GzwzHTJ2tIRE/xrgKew==
X-CSE-MsgGUID: yBkbN00rSNO6AmedxLcyvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16059513"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16059513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 11:17:40 -0700
X-CSE-ConnectionGUID: Wsdj+0N9TpiVOnw488ML2w==
X-CSE-MsgGUID: sj4qeVR/RnukHUDUZwgqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="44448570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 11:17:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:17:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:17:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 11:17:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 11:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy67/4W4tJHHNnGLVEk2e4Q/qCoBRzi5ehfTdXe+Lo3KU+1S+qgxcYBj1tOOJq9AGh5khormpQbIvGK2qgAkXqcdOUTPTH5ncsEmB+R153Dgnx8cfocqDNauwfLrG3Mzx+TZFwxleKSFsIcLww4k2m/EAPqWagXY2WJfQZ0X2QXzAjOZMIZ5wYB8iN5S5y2P7s08dc73qXcIf2z+2bdEsqYdjeEzKpxwEfPO5TC9Dx+rvJy6ZMZItQkf45Pxb4umNQArgIfnicx0lWkxeUcKSxA9ZV3qoYnjdY6cmyKuap3CvVMa3U3yVKNlP3I1dxGRMxYhOEdyP9rtcmCXzD4Vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZgzEBLDe0Rbf5mKnFTS4IOKjGvFJdXf75z+mLrV4Io=;
 b=LL5yh4UakAQb7r0PiyVUdq/yvl0ZHao1hY6+asdJ37gVOUM5+IjUs+jUOVDlqcj2z/18OkilwreuopfCchLyPZDSeqaBJo/FC/RsLmCFKtg7KC444+H2T4GVjWylO+B2LugIbFcT46wqYuYYI8ROoU4WrKLXK4O1QPdbEokhKBDGSvVLCwSpuAaeMv83BRpS/iTT+yl2hL/RITrGTxRJW07AOgI1XdqW9B3Rwy8zrZdLcNxm0hxn0/4IIgSNPGKTwx6fyAf5nsKSfxrPFGpscvk0QXoWULZNjXLISjxu6A+HPXYEilY5+Ttu4Eq8nVV92g0ECUrw4B1HpqYJU76nyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 18:17:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 18:17:36 +0000
Date: Tue, 25 Jun 2024 11:17:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t] lib/rendercopy_gen9: Use AUX_NONE for platforms
 with unified compression
Message-ID: <20240625181733.GW2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240625091651.131301-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625091651.131301-1-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e77974a-a9c4-4491-a453-08dc954316cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2Z5RlFSTUdscVhXT1M3S3pkSWNUWm85clJOakQ5aWpmaHRQbFFVSXVWck1i?=
 =?utf-8?B?d0JsZGRuejVQOCtTYXJ4YW1YcWF1WmdVVE9qNXR4Vko5dFZ5N1Z1TmM2cFpD?=
 =?utf-8?B?U1FCWW1rNGt5Zk5WcTdSVExSVk00VkF4cnBUM240eWJhWnQ2UWtQTUd6Njg3?=
 =?utf-8?B?V0dRSHRVdUFGaHFDNkJ6dG00MXZtL241ZVJhOHcvNjdRUFdidGVFS2ptdC9q?=
 =?utf-8?B?ZWRuNFd3VkV4SnpZd2ZhV20rbE5LM2tsZmk3TWVEb3N2ZU92MldYTVFOeENP?=
 =?utf-8?B?QmN1VWd0bGJaYlcyREdrYlhvb2w2alFvWjBQeGV4UEVCbXIrbEhGSllxbVVj?=
 =?utf-8?B?S284V3pTT0Y3WFJaOGFiK0RRT3NlaFZBN0tMb0dBQU1CZitWTDVSdERQTWVt?=
 =?utf-8?B?cGJiQ2FuYThwSS9XUjVEN0ViR1pjN1F4YmFBaW0yakdDOFNFOUc4TEdRamVE?=
 =?utf-8?B?M1NFTHR4WmtMUTE2VWVkd0FUNFc0SGZOSVBvbmdzT3pYU1llZTdXNmpDTk9E?=
 =?utf-8?B?endtbkJ1ajhTV1dtcFRPSlpWejZSR2ZIVUxpTE1Tamc4SjdqbzJzalFVWjMx?=
 =?utf-8?B?ZnhINlNiMWdaa2FTd2Q2QndkdG8rb2gyUVJRYS9hd0taQjZjK3R0c0NZTElQ?=
 =?utf-8?B?UVZtYWVYMnpuUzFicE1acVVac3ZMVExHQ1czSVBmbXlhbExES2hUL3FvV3B5?=
 =?utf-8?B?QTNjODRJZFZkY3VML3VSdytuRnBQcnhMa0Fsck4xL1pMdGFxUU13bmFBckVX?=
 =?utf-8?B?OWxyb2lJV0lEMXVuS1M1eDN5UFM2SzdpK09TNm1SemRvenFyano3SHczWWp6?=
 =?utf-8?B?TGpDWExQVzVFV2VOamo5c0lxWHd1ellrY3RRSUI0SWtHa1pvemV5VVlCUHds?=
 =?utf-8?B?TkFtaEpDOVhUa2REUzZ3aHRDU3hOc3BHZGNYSFh3VzJBVDc0SWMycjR2UnY1?=
 =?utf-8?B?ZEZZNkk5dDk0WUJBWlF1eWZCV2VvSHo2NkNEZE5lejFPalJhb0ZYRkVpRk1Z?=
 =?utf-8?B?bjlzOXQxcldwVEZRNGdQQzJqeDZLdHhsdWdQRDhWcFlydHB3Rm5oa3A2aW5Y?=
 =?utf-8?B?RnczYUc3dUphbkdrZG1mdVhHZ2o4VFhPRDVVZlFjTXFJSWpIN2tsSmJnSjRN?=
 =?utf-8?B?dmU2bzJMSjFSOHg2RmdqVW5rK25lQW84U3l2N056LzVTTURNZkNQMGVxYk1p?=
 =?utf-8?B?QmE5NmcybFJOUXV1UkNValB2cWdmcVdJb2ZjeDZrN2E4czR0RmFqRDFTKzUy?=
 =?utf-8?B?aGtUY2tYMjZVYlVKNDAvRGFzRElNN2FNRHlOMm1sN1JuaHBJdmZqRHNlaVVz?=
 =?utf-8?B?K21Tb2ptMnQ2OUkvNTNtd2R3SnJGT1NzVm5aUS9TRStkSjhRVkxHUUNYZk9k?=
 =?utf-8?B?dWNJZUkvL25URURSdUZlQVk5WVBTMzBmUmY0aWJsR0l4NFdyd2dBRWlVNEcz?=
 =?utf-8?B?OWlmWTJrS2ZmSEVMODJ2TDRQaTNBSk1XWFByUElZbnovUHZCMVJKdVZ0eHVz?=
 =?utf-8?B?dWkzRk5EdmFTUjRRemVvZFU5QmhxcnBQZEFNeEZ0RWpVNk5iUHNwb0Y0Ky9R?=
 =?utf-8?B?L1lmYUV6anFBRVRMVlNsR1orVkQwTzlEY3pUcmkvTFZlM1NUV3p5NVo5ZXJW?=
 =?utf-8?B?eWFQdVhweGY1d0pIOGRFbjZGZTVIMm9EcC9GcWlaZUNkKzBVdTdKeC9jVTd0?=
 =?utf-8?B?eW5ab2NzUzJsalhxNG11RnVOeDlUa2RueVpNc3VTUW9RQzdYTDZpMFcxaThD?=
 =?utf-8?Q?BT99GVhCWWRFkuNL/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1R4VFpnK0JabUt3T3V6cmF0ZGpzMjVOa0VQUXNLcEsreTdDSXZCTU1zdHlD?=
 =?utf-8?B?bUhSSEtVbVR6eXJ1M2oyVlFocGp0K291TUpySWVyMHlKa09zcUYveE4rQ3VE?=
 =?utf-8?B?YkNPelo3L0tnWHdrc3kwSmZvNzJpNmtuelUxd0hpMzc3akt0VFRZanpHcGkr?=
 =?utf-8?B?MGNTVWdTWnZYbGhJaXZOOWhOcXk3Qi84ck1MSjlpNHN6T2xEQW53S1VUY09F?=
 =?utf-8?B?a2NmN01FcWc2dmhiSmxoelhpcVNWUjR5T0xhNkJVSlV3SUpYcWUyQnB0QTRp?=
 =?utf-8?B?SHFydXdwVWQ5SnpSYjRQLzlqOEFGY3JrWFAxbEhhRUZ0VWZkTjM0TFJ1RDRM?=
 =?utf-8?B?bHF4RURSL0ZKVndEMnZmUkV3cEFydVR6eTVOMXhMUVJ5RGFicHhWelpCaXdY?=
 =?utf-8?B?NDBmeHYxRWQ3LzgwWDc2eDU1MC9Nd2llbXdXSlo3MGRkUTJJd1F6VHBWM05N?=
 =?utf-8?B?LzEwSFZxVlBzY2NkR0Q3aGY2WFJyanlxdTgxdThqZDltRDF4anBBUytrRHNY?=
 =?utf-8?B?dC9EMWNEYkdzYkRiVnZSWHJ1elkwbm9mY29YMHp4cnJZOGRTWGdDeTRhWVlZ?=
 =?utf-8?B?NzNKN3VMWi9mTkxkOU9KeE02UHlCWlNvL0E0T2kxamxjTGh6cGF0STlZYmRL?=
 =?utf-8?B?ZkdBMFk4YVdCTXdPcHM3UHJHY29OUVZ4V1Nzb3hEOVhPWFMzZThGdFRyMGg3?=
 =?utf-8?B?VXNVaXVPZXB6WVQyMktKemNTelFkWVBvU3BYRzlxMitsdEx4dmdjV2hQTzIw?=
 =?utf-8?B?dnlEQUpFc01xVzZiMy9rQTdHLzVkNVBUalg0K1NBSWh1UUQvUjRxNnF6Zkto?=
 =?utf-8?B?d3N3ajdjTU9Hdy9ZN2JWeHNGbjFSVFd3YXpISHY0WVQrT1FKZWhUZGladXBz?=
 =?utf-8?B?eFB3OE94Z2hrR1JqdDBXaExnalZYZW9uQmJ0STBkeW1LcXVJR3Jxcm1EcUxt?=
 =?utf-8?B?Z090ZExIV0w4ZCs1NGhMbVhueXhkOTBqcjNob1NZV3ZoL0UwOXpPS044K3Rk?=
 =?utf-8?B?Z2dwelFYQ3UzbW5hSU1TSkI5RDRXWFVmOGIwejFIeVhRTG5EdWtGZkUxY0NS?=
 =?utf-8?B?NE5Bdndaa1daTTBUcUJqQzJQZmNUakNOejlQWTVmVmZ4bDJRQ3J6U0U5Slc0?=
 =?utf-8?B?bnliTjVtMC9DekVmYW1kWWtOeE0wUEpnWVZVWnBlSEhGUVBmSHBPakVZWXZp?=
 =?utf-8?B?U2RmSTFoeVk1a2VoQXdzcDJzZXJ5RUFmY0xvaTVqOEpQeUVadGpIcnphNXdT?=
 =?utf-8?B?d3kvemxnUkdqbzJWYTRHTmZjc0Uya1JvTGZUQ20rdnlxVm9DZXJRcTFwVE5L?=
 =?utf-8?B?RlQvcHdSWHdndWp6UnJhM2ppMlFkc2RzTm10Z3Nzb09KYkpTRDBVaXNiS212?=
 =?utf-8?B?QThhZ2RDaGh3blRUb21jVXorbmJmemFEUjBEMjNXOXludVZ6SmR2MFdMZVc5?=
 =?utf-8?B?bGd2VE9CUWU4OVlRQk9xRkxZRzg3SG55Q1ZIYnVjUlhYSTlOZWd3KzBRR1JZ?=
 =?utf-8?B?WUdaRzJXYjVYSHdqbHBqMkI5dzR0R0h3dHdBTEc5RTlUVlNveXZuTG9peHEx?=
 =?utf-8?B?N0Evd1VibUdWOWdVMHBZZU10Y2J6SThMSFc0MmdkaE13dkVnaFBZSktZSW4w?=
 =?utf-8?B?aW0rOXBEUFZRVlhGVEJHMWpjbnNBNXMyMWtXYTRBQ2pyUHpqMzlkcXpmODRX?=
 =?utf-8?B?SEtrUmtMbzBaM2xVejNyNWMranBNR2RPcmdTWFlpSjhGMlFsMW1LR0x5amVV?=
 =?utf-8?B?NE5qSFZYMmllZUtmUHhZQnBuRjg0bFR3bVdObnRwVlBRS2tkSmw5VlRRdDBK?=
 =?utf-8?B?cXlxdkwxOE1pdlRsRThJd0d2TFdOa20yV0o3RWVaejk1ZUxxSVNTRklXdjBu?=
 =?utf-8?B?a3hFajR0MXQrZGRWU2xtMFpjbUV6RDhnd3JWclJ4akhrVGJrWlk3V1lTUmVR?=
 =?utf-8?B?blRDaTNBKzk5ODRSQWZ3RmVjSEplMCs1VUZnUVpqdGdkQm5sUnhSRXlUMHRH?=
 =?utf-8?B?am5lMkE3ekM0c2pEVDIvWUFsMTluS2FnZXBIYjdDT0dCaE9ma3VyU0FhdHVh?=
 =?utf-8?B?dGErR1dGaGRQQ21ZQm84ZzB2am9MUHhRUk9OMFlCR3oxNGd4M1V5VjFRRktt?=
 =?utf-8?B?S0x4citLei9vRmlOT29pY3hpdzJNOEl6a2JBK2lNSVdDMzdRWmZaS2VQVHI3?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e77974a-a9c4-4491-a453-08dc954316cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 18:17:35.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CymPhbjCzKz4TbT/n2NWcPHB9rau7cRVWXTr124fB3mbtGFWawmjJOlGdunmHgUHrlDsc/MHIIdnZQfP4VMXRriC0RYX8bUI+0wkKFzf+NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

On Tue, Jun 25, 2024 at 11:16:50AM +0200, Zbigniew Kempczyński wrote:
> For non-MSAA surfaces when unified compression is configured in PAT
> auxiliary surfaces must be set to AUX_NONE. I haven't noticed this
> on Xe2+ before as it setting was silently ignored by hardware but
> setting to AUX_CCS_E is incorrect and may fail on newer platforms.

Matches bspec 57023; 0x5 is no longer listed as a valid setting for this
field from Xe2 onward.

On Xe1 platforms, does this field still apply for platforms that use
FlatCCS rather than AuxCCS?  It's unclear to me whether the setting is
correct for DG2 or not.


Matt

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  lib/rendercopy_gen9.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 726f1a087b..62a365f3c2 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -229,7 +229,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	if (buf->compression == I915_COMPRESSION_MEDIA)
>  		ss->ss7.tgl.media_compression = 1;
>  	else if (buf->compression == I915_COMPRESSION_RENDER) {
> -		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> +		if (AT_LEAST_GEN(ibb->devid, 20))
> +			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
> +		else
> +			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
>  
>  		if (buf->ccs[0].stride) {
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
