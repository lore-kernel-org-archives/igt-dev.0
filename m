Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F3C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 21:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD52A10E1E0;
	Thu, 20 Jun 2024 21:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI1vePnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F56710E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718920552; x=1750456552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XpZ7w1xIHs2wFSIFDjpNCLV/3DKM5M/F0drh2Oe1pRY=;
 b=EI1vePnCNy+e2lId4a/5VuATmYdpuyIF7qg1Dx5lsXZEcDX5oDMq88//
 k3S0Yp1AXFz1SJvCBqW51t9p9K8AOktoZKgmCGf7DL/MxuY7jcH33Bt3t
 zNtBP8efCrOIkrdQFGjLyp+E801vU97J/rpCVl+mr9qVPoIk0K5EE9gYY
 lP7iN7lJceijBxWICBKidHi6MzAP3hMzaZ/sjh/PXES4taQ+PQiMjToOm
 ZHDr3+0b+Q6E1RkbD8KA2OEEqpfYuBElbsrHb4Hjtjw8/+3doowIjBDMN
 fT/XF3ml6hISltKsuHoTc7DtU1WZ91Nc4k+ahRpFjLVi1LhkwYSxgM0H0 w==;
X-CSE-ConnectionGUID: v9qEyLG6Sj2lN+q5/jju6g==
X-CSE-MsgGUID: R4ZJCNQ+QZK3bQzaDuY9Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41339338"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41339338"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:55:52 -0700
X-CSE-ConnectionGUID: UBKoYyZZSEu+Ft/gUemL3Q==
X-CSE-MsgGUID: iCPqmxfbToexnb8lK3BBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="43066162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 14:55:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:55:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 14:55:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUVKiaX3oIzkJywdRzF+zQnhVUNWH3+5dnHdq2y3u06iAxPbVtSEksl3p6lrMRgBJ/SDjdGeWP1WhjEAYcNeEczq/YgqXw++AlS/BRF/2rywwhu9M8Ul5koH8hWvEUaqWD3LooFStbjT3ylCE/7QphMNAyUhnBE32eOIZwiDrr4Lnu3ISp7PAJeISnDsgYaNaRecw8zPHm3PBAzyWh9yZ08XObA72eoNC8dW8h1x+S7rbq7OghmQlSuF/KwQQvelfbZ6mQpU8lc61QuNMRjZkvI7Qr1GzKwBHbT3wjJxykCZ3144IZB3hLwkw/YNouhK74ybV+v+HVLHvBqTbH1fPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE8FHce657fGJrc67aT0PV4gVSZSyKwQc7PPPF03wFM=;
 b=Tx2FDg/mO0LUnR1jUwqywzaE+NrUg2OBiSDXED6wwj6FXcDih9aBPK5k3C2hWqlY8orCFHEN2QmUUAxFxhpd+6C4m0RZFTji+Y4ZwtQ/+6YllW0E2FPgKasGZx1GzK+0aWeBfnfAv3nHKXRwnXuMXgg3bBTf9ZWo0z4XALskAVM/Yoi5EZVP/dzc7DoqHXH+omdMAO/AepbjNfLumC31B8b10+ZwhW8NyfmA1H8f/LRGOxuvysmaWdoiD0htY8x2lekEYSNigdFmjXmCDwI+u0g0CgVLI/zHrNVvnnx88KXBibHZFnDslfw4SXPSzQ/PhWWgSh7HglqXSAVxxrqA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Thu, 20 Jun
 2024 21:55:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 21:55:42 +0000
Date: Thu, 20 Jun 2024 14:55:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/28] lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
Message-ID: <ZnSlU0jaiPqOg6rc@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0f4ef2-5c94-4fa3-50c9-08dc9173bac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWY0ODlEUHB3bWY1cWo3SHdGWVJKQVlSZk5LaGUvZGk2b0lRRzg0R1NXWHdX?=
 =?utf-8?B?ZEhheHI3NUhvRWx4REpMM2ZRRkIrMkV4cnJHcjZ5MXFRQldEbVZGMTYxblFT?=
 =?utf-8?B?aHhlMHlSVEJEVHhWVk5GMnJhcG5pelpIcHM2QTA5SWVSVHpjUS9GNDVCVFEz?=
 =?utf-8?B?WUFRL3gyTHVMd2hDOVRERUkvaHA5VVBrYW4vOTUrZXIxRS82aFdIcUE0TnBa?=
 =?utf-8?B?aWJvRGhuUW0zOVJyVnExYkJvZmFEcDV3SDZ2dWFaRW1TR0N1UHR4emQrSjNy?=
 =?utf-8?B?VEhuNWxLalhuaEl4WHlHa1dCZ1dqY3JjU01OKzNUb055Q0M0U1J2OE1iWUp6?=
 =?utf-8?B?b1F3c0llOFJCOVB0L1Njd01zNnMvcE5VUFVaNFVMaGNWbGlaRUVINkY2UWJl?=
 =?utf-8?B?djBGdVkzR0NvemQ3d0MrRWxDZE5PMXo3bmhBSWsweFJIWFhRckc0K3Y0UTc1?=
 =?utf-8?B?ZmpnbGs0VGI1ZUZ4aklyNlNHUnRNbjRhdEw0RW9UUThGY0tMeG1iM3RXWmJ5?=
 =?utf-8?B?bDZGRnpqcjBBOHpXN00raDdCRVdkSDY4aTZ3Q0ZTUTVxZHpRd3lkZkVNMThj?=
 =?utf-8?B?QlNYa2s1aUJBSFFBandPM3BWZnQwVzJ1Qlg0NWRRYnh0OG5DTDIvRHpYKzZp?=
 =?utf-8?B?c1ZFMDFGem55Mk9xMHpkdC8weTUwTmNlN0ZZT1RhSWpRZjdRQWpyQk5LeWs5?=
 =?utf-8?B?VXVWRm51Nm1lcmN6MG80eWN5R29BRGpFaWh2WnlMSEwzeWRLNGMvVmJGNkZQ?=
 =?utf-8?B?b1pUVWF3emd1dWc2QWZ0SmFDdnZacmoyQUh0M1N3Wm5nczRVd05XSlExYTZT?=
 =?utf-8?B?bktLZE1hZTVwbXcxbi9sc3pxdnJVMkZCQ29QSVFUYnRwRDZveTRENnlteFN6?=
 =?utf-8?B?V1RCSEdjcHhQVldENlFYMGtLajRaR2ZnNkhUcHhpMys4eXdCdldFQVZKMWhp?=
 =?utf-8?B?RlF5YmQvRjNLbVkxaGNoL0R2M2RFNFFZZG1LSWxqa3l5cUZyYW1UR2poZ0Z5?=
 =?utf-8?B?cDM0NGtjbXFYbjhYZWZJVlBQYkJGNm5oOXBJTXVSc2lBSHZiR1IxNFNOTC85?=
 =?utf-8?B?UTkySy8wQVZ3a3JSVVhXL2tMdmRuL29FcU5wYkZ6Q3JVNm9xNW1tNXR1MVV2?=
 =?utf-8?B?RllBTWRZTTVMYk5nenRCam1MNGNERnBmVTd5OUtzUGtFRS9LWS9Za1FvOHNI?=
 =?utf-8?B?S0JQbXRaVndRZWpxakxERFIxME9XdEEwTjRhUkZWOUMrQnorTjJwcGZBbHR0?=
 =?utf-8?B?Rkk1Tkg0Tjg1dWVEdzI0TUl2ejhjZXVpNHBpbGNoWUNudnFPaTdSSEFPQ0c3?=
 =?utf-8?B?SzlDbWkwdUVwa3JZUU8rSlRMS1lLY2Z5Zm9SdU9Wb0M1REpONTZvZkZMdGI3?=
 =?utf-8?B?RU40ZERSbkNkVHg5U1p5NDdRczJ1bjF2cnViUFIwWXh5bEtscHlXT3Ixc0pC?=
 =?utf-8?B?QUg1anNFNENrUkt0U2Qrb09UOTFPVXVZZEM5R3l6VWVrbWJpbUE1bjNBYmE0?=
 =?utf-8?B?SkFja3hIaWNpL1Q3dWtNN0VtRSsrUUN0bTNtM0pKR056eVp6Y0hRV0hoZkUr?=
 =?utf-8?B?TVVSNHdWTUhJSnlNTUtKZ1BKaDU2OWNOYUNGTWNrUHFySDA2dk53TlNrSWx6?=
 =?utf-8?B?TzRUdEhMZDFHZTMydnBBMWN2cTlyeHdDNGgzcDBTUFBvM0E1czNUeElBQUVX?=
 =?utf-8?B?VGVaSzZlZFBteStobG1PSXlDbk12SjBnLzQzSWo3ZWNhbGljLzZscWhTa3l0?=
 =?utf-8?Q?HPlQF8+Eegi3A6elLGzAPpS5VTicYYt9gRbctUD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1IyQVlQTm0veGsyL202MFNIVEUyMXphMStKREZDRldkQmE0R0RCQmxYd3dY?=
 =?utf-8?B?TC9rUWtGVEhkU2oyUy81VURkRW1vVWIvSmdkRkw3NzRJR3VYdmJsT0NtemVy?=
 =?utf-8?B?bmpTVHpTeDV0ZSt5cGQ5bVdDdC9KLytObklxUE9qVjczR3M4MjNaL1BQNFVQ?=
 =?utf-8?B?WWhkenlITFNaNFVwY2JmMTV0cXF4V1YxcUhzYU5vZ0RlanZMSzB0NTlvRUVN?=
 =?utf-8?B?cWtYbVRGVFFOcDdqZ0NvQnlFemF3Ni9oR2F6K2tPcmdOV0taNEl1Tng0dXJL?=
 =?utf-8?B?Z0N2RlczRkdLR1VHbHFUaTdEUURNNE5LR2ZuZmdGNnFtOHRWZCtPL2wyY2Uy?=
 =?utf-8?B?WmpKeGJmZzAyNTZxWi9HMkhyZGFhbE1yVmkvL0Irb0NXUU55RjNQbnhvcWZm?=
 =?utf-8?B?R1NHVXkrdFJ2RnpsUFdTQ09PN3JKWHBwQTZMUTI4bmpGSWJ0NkdDRXFISm5M?=
 =?utf-8?B?RWIyZ1RtL1dYZlF5U2NiUU5reWpOQTVQdWRZQVJmQS9xem9ROTBjQjgvNmxn?=
 =?utf-8?B?djF2N1VNbG9qbmhBNlFoMzhWZFR4aStnUFJ0U2N5YWhjTFhUTjFtbU9vSDF5?=
 =?utf-8?B?KzhleHI1RXlDeVZTSDZ2Nm0rUVRZaHV3Q3lmNGxicENON3hBV1VKYkp1bG96?=
 =?utf-8?B?cVNDcmxZaDd4TkRGSjFXN0dIUVFieGJmaUhXOWQvOU9TWFNkLzZLRk1LZ1J5?=
 =?utf-8?B?TGc4ZFFONDlHY20rRGpCNUpuS2hhMEpXVDhLMmVIc3FtMEZwMEl6NVJoc2tF?=
 =?utf-8?B?SFZSaXdXSml3eTVQUE5rNTBIaFlvT01iODU0TC91SHV1MUw2K2JVa2srMmo0?=
 =?utf-8?B?czZvM2ErSTRLd25aeUY4elRzeGtVZ1VlSHJsWXh0ZlNkQnRNZ25nRmg1M0lr?=
 =?utf-8?B?TWh1bXdGQjUvd011enZ5ektyN1gyWkxCZStnbXBEM01sRlIzTDdhcmdsSW9r?=
 =?utf-8?B?dFVMZW5UUm9tVzQ1Z0dONk1zdzU2MkxoUU1laTBxK1diNnYwaE9UVHJnOUYv?=
 =?utf-8?B?Y2tYTVRxTnMyYjVhYWI3bFJESk9rdFBZZEk1K1N6ZWo4eEpJQWtPMm52bVM2?=
 =?utf-8?B?dXA3aG5jRkJzSFVwSkF3TUpBS0ZqVFpCVGhpTE91T2VnRWlMSGYzdnlCOXdG?=
 =?utf-8?B?TDVOQUtVZjhreFNjUHFlQlh4bElXL0J2RFFvY3JVd3IvaGJpaWsrVzdobzNa?=
 =?utf-8?B?MGdjdWVnLzJ4YmEza1ZtUTMrWm9Vb05ObUFtb3dwejU4alRLeDB1Sm9jMjN6?=
 =?utf-8?B?REl3TDZTWVVTZ0pOOUdhcTBEdndLNG5sVW9xaUhXNi9OSWgzUWJmTDBNbnJX?=
 =?utf-8?B?R0hHY0FkWGpDTUNQRzhMbkVsZFp5TWtBVFVuRTZDRkh6UWFIdG1zY0taU0h4?=
 =?utf-8?B?a01oVjFxZFdBamZybzVlc2RYbXZYaVNVc0lCbmZ5TjRHVm5LL2wwcXpwMFNz?=
 =?utf-8?B?eXczall3QjdJZzJvY1kyQVF4c2Jpa25VMXpaRldVQkh2N3crbEY4MHhBYkZi?=
 =?utf-8?B?ZkxsN1NnZjlmZDBrN0xtZE1MQVZac3N4bGExNU9XL1daTXFJS3VLZG5ZVmZ0?=
 =?utf-8?B?T0htS0NTRnh3YlBWdkdXcE5oWmlqT3N3SHBmZ3JXKzBjQ2VLbXczalVwRE1n?=
 =?utf-8?B?ZXhTY0IzanVHa216Y2dGd1UvWTdyTWNwZjJmVFoxbng5UVFyQUJ0UlYxZi8r?=
 =?utf-8?B?U2RFTVRLQzlDQmVsbTZHdmRINkR0WktUY0x6QWV5Nk1lems3c1BoTTRPSE9l?=
 =?utf-8?B?LytsNWRYUXVQdEtQWFRFSUFsc2NoY3hLZ2dHVUlTYllJTXc2UldnaDVTUVRq?=
 =?utf-8?B?cWpPQkprVWFUN1BsUXNndjQ4M1Blb1hlaFIyV2RDc1FDUDdMNHEwV0xWNFJa?=
 =?utf-8?B?SGZEbE9GcUZ2b0RlMFZPZFNqN0hRWTFvSk9RL0VNWWtMKytNcktIdnl2RE1z?=
 =?utf-8?B?UXdpRldSZ081NXE5Sm9iWWxDNE9weWFWYzFCMEcyeHNFL2hqd3NlYkkrS21E?=
 =?utf-8?B?SStiOXdXUEE0eHBjYXlpN1dramU2WnRZS2w3anBPcmpTSUhWVlJvWFhnM3BY?=
 =?utf-8?B?UWVCOW1nYW1JNkthRTlBZTUxdklqc3hPemFybWFhaC8rZTZhY3VEelFIUmRX?=
 =?utf-8?B?NTVpSVVES1Z3OUdobXA1U1pFQ3lxY3NQNUhodENkV2d5N2liTGZEeVBZV0Q2?=
 =?utf-8?Q?maQUCDf1GhE5CeBLCkBQPs0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0f4ef2-5c94-4fa3-50c9-08dc9173bac4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 21:55:42.1685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLeoAZ06NPkOEFdP3WpVsmJJDnbeEGCstBXag5LeFQVNhRZlt4/6DVcsUELul1+zshAvE5lY4TRdeUNd4Puz58114Loaso1UL0Y7ljJ4km4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Thu, Jun 20, 2024 at 01:00:28PM -0700, Ashutosh Dixit wrote:
>$ mdapi-xml-convert.py --guids=guids.xml MetricsXML_P31.xml > oa-lnl.xml
>
>Note: The metrics XML's consist of (a) the registers (in this case NOA or
>mux registers) to be programmed (b) the metrics themselves which specify
>how the counters in the reports should be combined to construct the
>metrics.  The changes in mdapi-xml-convert.py in this patch completely
>ignore (b) since they are not relevant for IGT. (a) is needed for IGT LNL
>OAG uses "576B_PEC64LL" format which is not available on previous platforms
>so we cannot use metrics for a previous platform such as MTL to generate
>LNL OAG data.
>
>Note: LNL media guids had issues after running mdapi-convert-xml.py so have
>not been added, revisit this.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/mdapi-xml-convert.py |   25 +
> lib/xe/oa-configs/oa-lnl.xml           | 2799 ++++++++++++++++++++++++
> 2 files changed, 2824 insertions(+)
> create mode 100644 lib/xe/oa-configs/oa-lnl.xml
>
>diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
>index 5903ef4d35..ab4747ddd1 100755
>--- a/lib/xe/oa-configs/mdapi-xml-convert.py
>+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
>@@ -149,6 +149,21 @@ mtl_chipset_oam_samedia_params = {
>     }
> }
>
>+# FIXME: everything except oa_report_size is incorrect here
>+xe2_chipset_params = {
>+    'a_offset': 16,
>+    'b_offset': 192,
>+    'c_offset': 224,
>+    'oa_report_size': 576,
>+    'config_reg_blacklist': {
>+        0x2364, # OACTXID
>+    },
>+    'register_offsets': {
>+        0x1b0: 'PERFCNT 0',
>+        0x1b8: 'PERFCNT 1',
>+    }
>+}
>+
...
