Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25587D18153
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 21:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D472410E4D5;
	Mon, 14 Oct 2024 21:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaaW7mSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A552410E4D8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728942500; x=1760478500;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5yaKenj4qavp6ZeulOjzHjbo0/lI1rBOwYV1jgu0DPk=;
 b=XaaW7mSANJoio0ugUZlIsQ2MsVhauN24bm690bZcNodfYnQheO5ExWWP
 3kr/EygcwyujhbcaSD3BE3emFddNV0TE4i6Tld6Ajh5hHmq0gL6rz1v6L
 pFzKHUgndabDAJuFgVYpkFFY9+OwablJXfHT7PtBHw22Mp9lF7HfV6YAa
 dmuziaQk2cxQir3Y8CaLL9Q3tAnhtlwoVnYFkxwSPf2TZ8FYvvkkL61Qn
 ANAr5s0YdHQRtFjcWWKnf6649pVbYE3IpJeBCD9DyTs5QpccrPl8UK3JC
 rp2+NC4vSa/WCKNc0u7r7Akj66JoXgOxgjti7LKFsSLNxaBJnwGGbRKhl Q==;
X-CSE-ConnectionGUID: AyA4i2QyQaSxeE9X0Gk2EA==
X-CSE-MsgGUID: QJSDT3kpQ/6XykqEEKPNaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28268776"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28268776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:48:20 -0700
X-CSE-ConnectionGUID: gzhPAWsdTbiNI3ViRVpArg==
X-CSE-MsgGUID: thbTsDKDQ1Olz8al+kYr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82727253"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 14:48:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:48:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:48:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 14:48:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 14:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY3QTGrXe5Fbh29hcHD6m4PA381ZzntxsS9tQCvVDIkOciQq1OvquZPjs6rAEMSzbr5Ix6Jch8DNEmPGxAFDM5p0ZOyUNfyoaV73qrOn7+baxR+aNc/DVO8DAxEkL+750rp3gHrNcz3E11/6l1uQoDXQokZefm+cpdzUyEQwW6DYF0HHkm9SlJ4plKr/LLc9tGzA+N80ZEFOWwe2wg1XexWU1r0/NuCWJ7G84Sk55vQygkr84G9cf6dggDQZU//dSDqyopB6coXnLylMI7R4SQPejXQC3B8QhWomA0fniv9AH7yahwXaCrmaO1mY4lyYE/bY9MQyn2WI9AAl4yKOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLrjyV+ypNHOuu3meo2srVRdOfLsBSTbyI2DcUodKPg=;
 b=R13VBh3aiJ6zkWdGxqw0dDQd0Y7HqwtBiS1LO2ZJme+1FnmKz24jAk8OOtzfvbbCIbxaMbIrRgMpzR16Q4YEU8/c6q0v4WFDC4uqmJxLP9GEOK8P0tYpsNJA1ks8oyWNDOLUNrLSy7uh/kEjkZDGZIMYwhKjyYdiyZAjY1UsuYGKxqikOC0WA4ZgitvBAyx4nlZHOFh+jlej8L0GsjvbnjMBrlEN/Exl7QX3eONGHGbkovpLGFFeaEdH/dARIZRp8faAi8w+Cs4Ag8fpO0tGgde1jGdJ5Ylvl1rPlE9lAp+so9e1dEemyCQHVlvr8KjFxiQ0tY8XXty1JCCM05yB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 14 Oct
 2024 21:48:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 21:48:16 +0000
Date: Mon, 14 Oct 2024 14:48:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 i915/drm_fdinfo: Quiesce GPU prior to running some tests
Message-ID: <Zw2Rng1c7myy0G3+@orsosgc001>
References: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
 <172791341636.1165733.2070994288194346438@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172791341636.1165733.2070994288194346438@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbed817-a355-4724-3586-08dcec99e8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdPUTc5VElIcmJxR1lxUnpqc1N3TmdsWlgyRGR2RHR5RHZmQ29pSS9vNENR?=
 =?utf-8?B?UTB6OFY3TTQ0QVA0NWpwbGNuQnc3NlZtV0ZUaDVUam5VTVY2YjdybktlZTM0?=
 =?utf-8?B?WjllV0tEaEpyR0xBQ2NxZXVpK3ZPYW9Vd3ZJMDZiWnc2T1pIMEhKdm1Qck4y?=
 =?utf-8?B?SllJN1hQSWhjb1ZwNzlLeXg4ZTBaNlBIZDYxRUxOWTBjU05DWE92MFhIK2g2?=
 =?utf-8?B?bHdYWTA1aFRxSHR4QzZFcEFkWnBCaVJsNjh0N3BTTy9rSS9COXh3RlJPUEtG?=
 =?utf-8?B?YjZudTlTY2MxTVk3a0dJZVY4amJCcmVPaGVpeVFEczhubFp2b1JpRmZOZkJu?=
 =?utf-8?B?UytmV21vc2VaVU1SVGVVeGRtVkNCYTJWN29hRWkwcko2cVprdHJaV1d1VVFT?=
 =?utf-8?B?dW1uM0h5UWRtTk4wSkdreFh0cEdKcVVXYnJTWlpXYjBpMzRkV2tFck0yRjdH?=
 =?utf-8?B?UWZtUWZZcC9BUXRNZ2pQT09ZNDlHeTJSOXZVMENUSGFESEJZaVhZWk1TTHNk?=
 =?utf-8?B?dGJIa1F1cmcyaWs4cGdhcmU1TVZKakYrbDIwUkdlalpNSlhZMEw0S0U2bU54?=
 =?utf-8?B?WHlYZFFXbTdqVmExVlN1elRUQjNmWlB6L3RFWi9qMjVLcGRjaDhhclA5bEl0?=
 =?utf-8?B?cHhpMHhTZExwaVA2ME5FeFpyczFWRGxaZTc1WVJiV2M1bno0NHNtOTFtbGI4?=
 =?utf-8?B?V0hZQ00vcm82eWw4WWlDRmMyM28zSTFWVjFEeFVkMVQxZTJVSzlTajhGNlhO?=
 =?utf-8?B?Sjhrd253TXM3MGxJbWt3Y3JJR2RwZ1Jlbml0UmxjekdickFFQkQ4bkZKbC9n?=
 =?utf-8?B?MnhQV3AvRzEzYnVUWjA4SE1CZDRZVjYvT3k3cDBQL01XMmdEdDNoSDFNMTR3?=
 =?utf-8?B?MXpZc0ZFSVhPRmRFS3dzc3AzZXAzZ3ZUQWJ1Ly9qZ3BoS3E5aTQzY0h6OHZ5?=
 =?utf-8?B?SjJvemZSK1J2alVvSzN4ZEpGMksyVFYrNFlTZmIwVittenBrZFVPcWkzQ3dO?=
 =?utf-8?B?OGRNNVh5RW1OSUdsYW5CaU5zQ2xwTlZaMms5Mlp2d1JiRGlNaHNvM0hlSU4r?=
 =?utf-8?B?Z2lpVFU3K2ZKZnRzYkhOeG5XSHZ2VS9Lcm81TTBMWHZGSlBMZ1NHN1B6dGkr?=
 =?utf-8?B?eGNrbHVLamRjdVR1c1RwSWFlTHVJaVdBMXlFazhBZ3dyOGxqS3JuVVBrM25B?=
 =?utf-8?B?cVUxVXN5cUJXNEZHVlNKSS9Ud0FseXBSQkxsVWhQcFdiRUtqVFMxV2RBMzZG?=
 =?utf-8?B?SFRVLzR6T0V6WDg4azRJR3gwSkRJVHZEYzNsUzNVMi93TG9oeXdWZnpZU0s3?=
 =?utf-8?B?dlJ5bXd6Qko4eGcvOHd1QlVmSG9PWStvcER2VS9Sc1Y2bzJHY2NVMzhrUktV?=
 =?utf-8?B?K0MxSVRhN0liQ3libjJpcWtKMmVrRVpiYzdoZFo3WFo2RVJ5aFRNLzh3NDh5?=
 =?utf-8?B?eVQ0RjdGZG13akJ3VE8wWFdveXBLR0Ntb2RkYWJLT2NZa1FlYWxCQzRqT1FO?=
 =?utf-8?B?N1VpcHo5NUtCQ2hWNE5QK29ERzJPbDF0TXVQbzdQOXRCVFNIYWh6d3VpZGlQ?=
 =?utf-8?B?QVE1UmFKQmxvS3p0WGNaTGl1OXRmd2R3KzZwWWNMb0RHa3lzWnlrS1F3bDRu?=
 =?utf-8?Q?5OLTHduy6TIPHNkxpWDYegEsiVZjUtNefNYmo6pAhvDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFU5aVYzSGlWK1lGUUZTOW8rTC9xQlI0a2F2VXgweC8yaDkwQVkzZ2xWSGYv?=
 =?utf-8?B?Uk5XT0RxeHNFZDI4cDhqKzlXd3o1NmNlaGZTd1JMV21JVFhiZTZjcmRWZHk2?=
 =?utf-8?B?NkkyNE9WT1VRU0tuaWhpVlRqL3FtTHk4dlo2VTlXR1lUZ3pKRFhqN1AzV3Fy?=
 =?utf-8?B?ZnFta2t0dXpLTEZFRG9ud1dpTngzQ1dYczFQV0l5VlFXV0ZhTUUzUitTbXRV?=
 =?utf-8?B?bkdNQ3YzVDRIeG9aYmRYcHMwV20zRFZCSmM5NmQ0TTBJcnVoNkZwcFg5NzBt?=
 =?utf-8?B?aThnbkFUSWJESC96eW9tN0MxRkpCV2pJWlQxMVRDK0Zxa0MrcWRWNm56RXVD?=
 =?utf-8?B?eEVyRUJYU3RZdU55QW1JYmdoRVVoWi9wNGFLeS9sQmNBMzdpVGJGelFxaTVm?=
 =?utf-8?B?M2tleU9RcllmQjlKS2M3RENwQ0F5Y2hrTkQ1RTA2UytjK3ZqUUJKVmtqZ3c2?=
 =?utf-8?B?Mm1UVGFXSlhNZGZFd3pNN2twV1d1ZkQ4SXhZRzFQVVFEWW5lMjJpakRiNW5n?=
 =?utf-8?B?VnNnZ1M5OGU1aVFOd29ob0lEMW9EUEVYSWhSc1B0NUFWOXh3a2ZkRXJVNGxj?=
 =?utf-8?B?TXpvNWJuU21icjlQTDlUNEpBR3hyL0tLMVlycmhINU13ZlpidFdsNTd3bWJ2?=
 =?utf-8?B?WFpOeGZHVW5mQkpxcDVDdkRPU0o5OFJVMi9iM1lDQ3p1d052TUpac1ExV2c5?=
 =?utf-8?B?YURqa3FEenJiWExPTXFleUVlZUNwaTh4dDlyaER1UTRPUXgrTUFYNFhEQXNz?=
 =?utf-8?B?SmRBV3czWldWaU9IaHFQZ3hKS0J2WjRzSEtRYUxDMWRWTUtNaVYxK2lZWHlZ?=
 =?utf-8?B?UlZ5Qk5IN2s3ZVAzREZVNDdHWnl4UldacDZwRDUyeEFiQlJnaEdscVRnYWlG?=
 =?utf-8?B?by8rRmpid2V1UGwyV2toTlZUNVdkclh5TkNsZFJDc0lFZUxtRTNBWDRFRTc1?=
 =?utf-8?B?eG15Y3RJT3YzZnR5NEpKRHlzWURBeXNMUGlndU0rVGJ6aDl6VkZVYjVBU0Fm?=
 =?utf-8?B?OW9tdTBoVmlUTkNuV1lpeXVuTHpqdjdwYVdJVmJyVVV5WXR1VjFQajR0UjFU?=
 =?utf-8?B?TjY0djdSRWV4TXFVSlE4R0Fvclk4T1BRZTB2bkxRMGxQblhRSjBMcGZ6djYw?=
 =?utf-8?B?S3R3Ny9Ia3ZOU2xZREU0dzlhSDhCd3FkR2krQk93UVNGMmZBOEZjQU1kOVIr?=
 =?utf-8?B?aVdjQ2NyUUFkUUtrUUR6UHN6RUpwK0pOcTRJSDdyQmJMSGF4alhTOU9QeTBQ?=
 =?utf-8?B?MmlyaFQwQk1KRWNNdFZ3R3k1OTRXSTlOcWYzdlFNTzBzL2lRQVVPMEozZTRG?=
 =?utf-8?B?Z0ZSVW42MzRDMHhxSHJSRTlpV1MrTEZET3M2eGhPRHQrL0R0R2FXMUphbnlH?=
 =?utf-8?B?VEVPanRMcDVBbVMybUc1aENCN0s1T2lrRVBwRE1PU2VJcmxMdTF2QmpNS0s4?=
 =?utf-8?B?ZUNjdTVJb2dBM2hZcHdTZm85LzYrUDhhR3BGNklDSHV2ckVJRkV0VmQ1UGJB?=
 =?utf-8?B?RHBNajh3M2hidG5neVgrekdFZFFPQVloWENtbXhhcVM1VVQwY2s5S1NjVThE?=
 =?utf-8?B?K3RQRjB0NWx4MGxjaE1nYlhsQk0xWW4wQTExREIwdzltdW9kSUUzVVl0SXFF?=
 =?utf-8?B?WFBYV0FqbnRxWTRhRFJIQXY0N3JyaW8xQnJmREMzZERtWWJicHVpTTlKSWRl?=
 =?utf-8?B?K0lrdXpuYmdlUG9hTER0aUtzSFg1S1h2UHgvcjBnbnBMZnZCQ1dSSXJGR0Qr?=
 =?utf-8?B?QktHY1BOMEd5TC9UbDBMNGgxN1BJMTRPMXVxRDJlVEZla1dCOGVVaUx5Ulh5?=
 =?utf-8?B?THJKRmxmY2hkbDJBL3BmR0RFYzZxcWw0L2lZZFZFUDRIaDJMc2dIcWVWWjgx?=
 =?utf-8?B?SEZndDYxU2gxYVo5YzUvN2dVMldCdGoyaDU4RG1uQTZIQ08vekF6UCs0dUxt?=
 =?utf-8?B?ZHBFNEZPb0JhK1ppQUlhZ2M5Rmw1RlpVS1VqWTZ2djZBVVZlc2lTWVdkNUcz?=
 =?utf-8?B?bjE1a0VRMFFGM2NMSnI5TjVZbUU4RHFHMFQyYmp5eVVySThSMUc3czVFOFNV?=
 =?utf-8?B?TFl5Wnl2Z25NR0hsSmw5aW5lNlg1ak5VNlUzbGtLZ2xHUVZyYWoxcG12SEZB?=
 =?utf-8?B?eVpkUXFPSlg4MmVwcTQrdjFpSE96SzAxcUl1OHcvUVh1ZXZKVXhSRU1JN3RF?=
 =?utf-8?Q?BnztiH6mvE0F4NxCliRQ3L0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbed817-a355-4724-3586-08dcec99e8f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 21:48:16.3370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDToFcxDIGUgPLMnMeBTlKVQvw1lvY6285wVqLhr8/AWALbTIAcsWOdj3qEaPX3d0hM4SSpWwRNXgfAJP95eTexY8JH3OX2mDihOjt96CKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Wed, Oct 02, 2024 at 11:56:56PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  i915/drm_fdinfo: Quiesce GPU prior to running some tests
>   URL:     [1]https://patchwork.freedesktop.org/series/139451/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11859/index.html
>
>        CI Bug Log - changes from XEIGT_8050_full -> XEIGTPW_11859_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_11859_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11859_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_11859_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>          * shard-dg2-set2: NOTRUN -> [3]INCOMPLETE +1 other test incomplete
>
>     * igt@kms_color@ctm-signed:
>
>          * shard-lnl: [4]PASS -> [5]DMESG-WARN +3 other tests dmesg-warn
>
>     * igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>          * shard-dg2-set2: NOTRUN -> [6]SKIP +1 other test skip
>
>     * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
>
>          * shard-lnl: [7]PASS -> [8]DMESG-FAIL
>
>     * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>
>          * shard-lnl: [9]PASS -> [10]FAIL +8 other tests fail
>
>     * igt@xe_live_ktest@xe_bo:
>
>          * shard-dg2-set2: NOTRUN -> [11]TIMEOUT +1 other test timeout
>
>     * igt@xe_vm@munmap-style-unbind-either-side-full:
>
>          * shard-lnl: [12]PASS -> [13]INCOMPLETE +2 other tests incomplete

Unrelated to this patch since the patch only modifies a specific test.

Umesh

>
>    Suppressed
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>     * igt@kms_pm_backlight@brightness-with-dpms:
>
>          * {shard-bmg}: NOTRUN -> [14]SKIP +2 other tests skip
>
>     * igt@kms_vblank@ts-continuation-suspend:
>
>          * {shard-bmg}: NOTRUN -> [15]INCOMPLETE +3 other tests incomplete
>
>Known issues
