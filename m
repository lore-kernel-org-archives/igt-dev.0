Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EE6CF45A8
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 16:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8305B10E2AA;
	Mon, 12 Jan 2026 16:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6cGrqBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788C710E2AA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768236876; x=1799772876;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Otp+ebkaTdS11nv2j1gZqEr7KyrL2lxruEQX9jCIRb8=;
 b=F6cGrqBPDzoualUzEMKaiDDkQKb86QKYcqMkL805lNFmrp6Ar3dy4YRy
 XDqDPPdg2O8Y9a/DZ9qRq7fRapBSz9GmfQkHrJrkLMjV1aPbGc8ZRCVQZ
 6/V2dmV453/Vme0Lz5/lgifqLT6/I9J9ibZcFPhPVc4nBdQT2/Ku46W17
 ZH1hmtwwD4dJ5sqJOu0SqvBzICyX5Xsn1fHyUkkxWqMPuo3dOTKbpOxLu
 flOESa74vtlxhWigOLInnDgeDmy5wLFbjnogFBdehzl9yNQSd2tKSb5O+
 pP+l5l/hpdk4x9J6yiwpWYe5ML8g+roPhpQn8TyijXDz6RVJjMrNtQHR+ w==;
X-CSE-ConnectionGUID: 3X+3EjvPR9ym71vhypfp+A==
X-CSE-MsgGUID: qcVq0a16T46b2qLrW89IYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68518777"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68518777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:54:36 -0800
X-CSE-ConnectionGUID: EQHH9ZP3RlGHkyJkMF0HCA==
X-CSE-MsgGUID: 9HZwG0GCQs+t0HzArW9WxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204147797"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:54:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 08:54:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 08:54:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 08:54:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFtSssAwdQjQaUBMpKguSUfDYxW5Y3yWY4790Zjoxo+nG7H/cpn1QRN8BKSOzFtk9hYglWRUg4LVmtqWJ8ATyLTA35RS5rkUBcC60BhCsoYwEhLipEFM69kKj0Vqr5t33mgJajSM25zMjHBRdEVAU1SKe9PVFD7McNIydZ/VHKd8Nzjz6L8QLd2TVux/7WnLdgt9SE7l+HGtqh9pi5aHDYpdNskzk5Jpgpw1wC7UthqcTA+ae5W357ofR/BrxPHjuztOKhdCBo4vV/QJeps7AevXMCNWfW6OdvfMFpM0Is9FhwGdlASws5aqSQPWZEqRD1MZx3mrg7Oc6MamXhUWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjoHCxyZryLxhdnOmqZq7NJHlgGYhpPuzImJ8O0JDWM=;
 b=NvLYI5yvRl86EKnYMk3auZ1OeLGb+SFSbrCFwEBTaLAgblYqS0QtpLrTaXL/fm8JLo/8khukURWlkZgyHYpVXfHCfyXV5UveCTVab3syOucYLugcSlxCqY5zfA8pb47R1VrFF9y8JvreSnFTSUvRhLffj4lPZnMbTnx71pOmrVANQJ6kpukAyqdFn6PU4EXPXJE+LitdBEIecSmtNOXsR1OaN4fkDOdSYBia4Dpd9HkX8F7t/ztvxFOT3u//ISUbZi4NWMKbBJV2+Ap819rbYyiArUgCIGhY0zZfJ6h2TyJs+Lys13qEs6iBDZbAOn4aAzPtElEkEjfA0klwbjDd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:54:32 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:54:32 +0000
Date: Mon, 12 Jan 2026 17:54:25 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/5] lib/intel_compute: Add compute-square for
 xe3p
Message-ID: <aWUnQdvdCNZw20Kw@fdugast-desk>
References: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
 <20260105124757.1421059-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105124757.1421059-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0162.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 993b45d3-0de3-4d00-bd33-08de51fb4211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWRycUdwYzJFbVpOdWR4aFV4UmN4dEt4NVNYZ3J1WnJOMEdkT0RKSmd5aGpH?=
 =?utf-8?B?ck5LVGFpMENtNFZrWHVPdWpnREMvRHZacmZqZE5pTkhWSjhTVFVlVG1PSGNl?=
 =?utf-8?B?aUZqSm9McTNseTlxV29iWUJnbEN3anZnNXd2VWZWcmlBM1UzQmFGaXNIZ2d2?=
 =?utf-8?B?d1M4akJlQmhFRE5rNXhBSXg1YkJoRG5qVGJMbVlNdVpjNzdlRTlKSkE4V1o3?=
 =?utf-8?B?WXVic0ttZ0JxUXFnM0RqYUtyelg0SENNRHVKdzJjV2hoOHI2RUpyUC8rbGRq?=
 =?utf-8?B?TUhZanM0L29Nejh4b2huTmlid0dMZWxDRGd1NFYyc01Td3NncXBSanVScXZ6?=
 =?utf-8?B?NVN5aXNWZEJZVXRtWEQzNGxFQ3Y4V3oyUGxOUXpUZkcrTXRJbzgxT0llUDdS?=
 =?utf-8?B?QnhFK3ovbll6Y1JUMzJURHMzSWM3QkJKN093ZmVIamwrcHRVOVRRY2o3Y0ov?=
 =?utf-8?B?MmZOa3p0aFA2MVVLSDZwSzlwTzNBTXJhend2bnlkTXptVG02MnZaNHdNeHhG?=
 =?utf-8?B?dGVqRndWZDRaRjQ1TmlmVkEvcDU1N3hENlRvZSs1TGNUeERuVGt1aVpqM2hX?=
 =?utf-8?B?VmY2R3BIcjh5anhRVmpTSjdwUVEvWWxKTUFrYUFaVXViSnpoN3l6K3RieGJ2?=
 =?utf-8?B?b20rL3VRM29MdUJBYlVMUWtHb29jZUFYN0poWUxGT1ArWTIzY1h2bFlNSUE3?=
 =?utf-8?B?aXBmTkJuTW1paVh3ZHh6TCtSQXVUeWI1UXUwaTVSUGQ0MVhpdjkyMUwzNElY?=
 =?utf-8?B?WVUzellIbGRaTXl0Yy83M1MySitTRGhtWmRra1BVRWhDVElJYVpSREhwd3I4?=
 =?utf-8?B?eTJoYm5FcnEvckdzMnU0eUpuVHhPck41dklrMlZEeVZRNHhhSlRhU2NCbGk0?=
 =?utf-8?B?WC9iNVQ1eEVISGhXTFBpWTg2WGx6bFJ5WGFJR093dmxITHpZWmQzSnExUmx0?=
 =?utf-8?B?OUUzd0JESzZvRUhxeHlMNkZrNVFxQnBMd1NXWXVJRnI0S1BNZlhGbURQRXdT?=
 =?utf-8?B?ZzhUd1U5bGNmY1krN3hXbXBwb055aWJGcnZsZ01kckZqWXZMU1plTmQ1M3Qv?=
 =?utf-8?B?R21ETklwWVY3K3pCRFJNRW1xcnQ1b3VCRVVPbVR4bHlDSHBmeE5yd1d2aGFV?=
 =?utf-8?B?U1FNYUpOM2pFMHM0Z3d0eFdraXk1dmI2Z01XK21xRzk0b0x6VW13d2QyZDE5?=
 =?utf-8?B?dU14ZS9zSys2NUFBQTc5czRxQ043ZTlhWEJWdDJZMHJOMEh5ekYrYmVxazdn?=
 =?utf-8?B?a0hjLzR3KzlYa0c5Q0JNSTFkUmZQRjg3MTRXbElOc01ZTm9zZ1FmNUc3THk1?=
 =?utf-8?B?YkZ1a3dXeERCYWZQMjZsZ25wYVh1dlVHTk9Qa2RYenpPMGFxNjBWbk5rRmox?=
 =?utf-8?B?dXRyMHM4RGovR0ZDbitXSUFEc1pBUlRJTDVQaXE2bGFNZXE0eW1pRWZhMm9T?=
 =?utf-8?B?OGtDUWRtSDBBSEQ3V3ZQTEVJWTMrMmRHUlcxOVhpc0ZXZFR3OVpZd3BYZ2Ew?=
 =?utf-8?B?SWNuYnE2QmZSSVQweDlIN3NIT2RXa3JmWUk2N0Fmd1ZhZyt2T2RteDd2dTRy?=
 =?utf-8?B?bEF5OGRRR1BMRE5YcUxuMnhES3R2b0FBYnVyOWdBYVlGdS9hSE41bWZ1WVN6?=
 =?utf-8?B?dG8yV0I4NGxmaFRSS2hPRm5yRWlqOHpwUms1UnA0MjlrUGJ0VXJ3VDBJRUV0?=
 =?utf-8?B?QzNxaWxkeEY5eW1SS3RsYXhsb2UxY3pNQVNGU01YZzhrTkJjb3FWMTNMUnJr?=
 =?utf-8?B?OHlJWXl2YWdUeHEwT1FBT2Y5WnMzdzZlczRSdndRVkdObm92UjR6WkxYMXZF?=
 =?utf-8?B?M1dHaDcrNmJldWtZMHAwbXdaRkZrY0xUTUxMRXgvNzBoK1NmeHJnb3c1ZzVt?=
 =?utf-8?B?UkVESFg2emYxK3h2cEVJV2MzZmtNbXJ0Y3F1bWxhS0JZNzBablQrY1RwR2xl?=
 =?utf-8?Q?4GhcOmsO9ZHASWT6sJ8AzFUxKOXCi06r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTM3UmZoSU91U3l5YTVWQkJkNWZLek51MmNpT3BZU0xVRzdtTURCUzBpamRO?=
 =?utf-8?B?RnFsb0E5b1dUY0tZSDEvbk9pZStGSG8veUc4M2dOUVFHQWVDNUFhOUtvQXpC?=
 =?utf-8?B?ME1TQzQ4dzJPVEZObWtqMHZDM1k0WUpxS3FIcllqTUxrSHlBOGxNL2ZHeEtK?=
 =?utf-8?B?NDdkRThwY0Yyb2J6aCszSjF3d1V5NjVwbm9aUWdZZ2NDK05HdHFJY3RDakxs?=
 =?utf-8?B?NTN2Z09WL25CY0t0dkhCNEw4ODRkTkhBQVExZTZKdFBnVmh1MVZrb3hmNWUy?=
 =?utf-8?B?Ym5pZVhpQjdtMEVBS3BWWmgwUlRXZStTMzB1L3NDNTVUcytaT2xSaHBOM0RB?=
 =?utf-8?B?c1QvREV6VTh1WEFJN1E4bnlRd0NuU0UrUlBJTXcxQTlMd2h2Y1BOZG43Y3h2?=
 =?utf-8?B?UlUycFMvc3dJS2tObmJmY1dSQ0F3WFg1TEFqQXhZWjZFZWZSa3V2NGpNR1Y3?=
 =?utf-8?B?dWZSSmtDLzB2U3Y5R0VtTHFWaWFLUy9mZkF0b0djdnk3Wmp1NGY0a1BsT3dt?=
 =?utf-8?B?TThoaC9qNkRlWHUxTGw0T0l1VEZmWkZjbGF3S3owem8zRUszK1BRK0RsdlhP?=
 =?utf-8?B?R1JLRGRuMERNZkVEZy9WL2RTaGl5SmVVNG5UYkp6M1JVWVZEdXZJNjI5T0Nj?=
 =?utf-8?B?dmtSZXdkajhZYjRlUFROUkpXTzBreFJ4UUdtR3lrNlpoZitpSkdwbXozS2gr?=
 =?utf-8?B?K3gzdlFZa2doakFqWnhvTGxtZXp6WHF0THovYzdhemdDN0ZkTGpLcDNkbXdV?=
 =?utf-8?B?b0pwVDEzSFdkcDFPMnlsOTJlNW1qS2xaZW9GNFhRak1EOExzMlVRb3QzN3Qw?=
 =?utf-8?B?QkNxTUFkbDBIVXBRTWQzaW1YU1h1ZmhjM3NHbHdOUlJ5KzlBMlJXMHBkMDVy?=
 =?utf-8?B?Ukl5WUJReUwvTXdVOFIzUTZZWFV4bmJBRk9SaThTa1hMOGV6V2pUT3MwNFJi?=
 =?utf-8?B?V2Q5VFhKeE80RXlEbTdwelZZM2VXUEpEakNhMlV6c3R0NkgxMnlTOFFxT1Iw?=
 =?utf-8?B?S0tNK1NNR3cwWU1TTzNLSlBqTXhTangzc1E3MTVqTEcxS3JvcndIVmhGRHNE?=
 =?utf-8?B?Zm12VURLcFFxUkhTcUJFYlBYVXdrenc0c295dDVZZ1RYUFppOW9ZVDR6SEhE?=
 =?utf-8?B?QVY2L0Z1U2MybVdKVkhKWnlLNitqZkUyblFWaXJiV2lsd2dIMWFhWlB5V0pz?=
 =?utf-8?B?aFYreC81TENDMkFmR1VjWC83K2NiamJ1ei9sZ2dTUmZSVzhOYThuTEEzUno5?=
 =?utf-8?B?VHBKbEhWbEVsd0VGZ2tVQ0wzYmJBSDdza282d2NtOXEraVAvc1pReThNci95?=
 =?utf-8?B?cmQzWURTT1Y0TG5UczdoRTlMUG1CVFV4R3d0MmpoQUd0OHpXTGZhQXdqTG5z?=
 =?utf-8?B?anVPVEl2ZjgrQUMydGhlRWJHZ2NqOHZPTVlQZkpaM1gzQ3VJK1M3Q2VPM2VS?=
 =?utf-8?B?MnFWMlpqRmFKNlRlTDJLdGovSXVKL1dlMjloVzdBQ2xoUUsvKzlVS21uRDBD?=
 =?utf-8?B?WTNYTGVTL1RVVVNUZDRCVWhhY2JJcTJKLzFKYW5lUWtrMzM5VDVkMDhsWWJn?=
 =?utf-8?B?ZlJ3UUtQMkJ4enRqMmhlK1p0QWx3OW1BcHZVUGJ1aFg4U055QjRncU1xeE1W?=
 =?utf-8?B?RU0xaXhFcWEva0hqMVdtMGpvNjhaVjFZcWdWejBvMmJ6Y1FEWW9qK3F5RytH?=
 =?utf-8?B?bkVCMHQ2Vkt3a0pVTjdoZE9TcWJlNm5rVEJrc2U5QjVOU2MxTm8xREwyK3Yy?=
 =?utf-8?B?ZVNEalNKYVBXdWxkMmtFVTRPMXdlVUZYbFZnT2FsWXZaMmQ1bE54dzNXRGVi?=
 =?utf-8?B?Uy9iWk5BTmd5SWdKNm9Bb3ErcENWeFl3UzlLM2hJSitvc0RQWUVxMWhQelFK?=
 =?utf-8?B?SFBMakQvWkRXQUxQK09jZExnNHZYMWY5L3lkSXdoekpyMitrNXU4VmhSOGpP?=
 =?utf-8?B?VzUvUHExaTIwbE1KL2UwenVyTTMrRFA2dmY1UXJzQ2duNU8xV2dqUy9KR2xZ?=
 =?utf-8?B?cEwwNDJHNHRGU0VNYVZkSjJHZ3FmR1ZWMjJ6ZUF2NUtzeFdTNUNscVppZDFP?=
 =?utf-8?B?ejYrN0N6eVlyOVd4MFlqbVZtUi9SQTV3LzMwS2JxMmIyZWs4ZFNmbHBFVDZN?=
 =?utf-8?B?SXhJV1YxNER5QlVLZ3ZHRkFQVlBmd09ScGoxbTJXL3pDa3lGL0N5T3A4UXJa?=
 =?utf-8?B?MkY5Y25abmliNjFFNGdseVpZZk5FTjkvZ1FJM2JieDhXbUR6QXFheXpiLzNO?=
 =?utf-8?B?TGl0dnA2K0NxYm9PVUJST0h6c2FDYXlHOFJxV2l0TTRSUmRiRUw4UHBMUUZJ?=
 =?utf-8?B?K0RCQXU4NStLcjhVMkVWZFBpbWpWNXc5M3RhQlM1a2hMWm9NZ3dibjd4Y3Mz?=
 =?utf-8?Q?E95oZabJxuLoezgo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b45d3-0de3-4d00-bd33-08de51fb4211
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:54:32.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7djiKV84Ndk+nCkXcaHUCq4IQgxdE1ZIQKMi63CgdcyD/+5fpGd0kYMuFA7kuCAqyLaeN3Qa4jbP9/EwsXEKrev0lpEhXhQVOIeyt8KSB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

Hi,

On Mon, Jan 05, 2026 at 01:47:59PM +0100, Zbigniew Kempczyński wrote:
> Extend support of compute-square calculation in IGT to xe3p platforms
> like CrescentIsland.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_compute.c                | 234 ++++++++++++++++++++++++++++-
>  lib/intel_compute_krn_square.h     |  41 +++++
>  lib/intel_compute_square_kernels.c |   5 +
>  lib/xehp_media.h                   |   1 +
>  4 files changed, 280 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index a555f908b1..c3a5cf83bc 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -49,7 +49,11 @@
>  #define ADDR_INSTRUCTION_STATE_BASE	0x8000000ULL
>  #define OFFSET_BINDING_TABLE		0x10000
>  
> +#define ADDR_STATE_CONTEXT_DATA_BASE	0xA0000000ULL

Maybe XE3_ADDR_STATE_CONTEXT_DATA_BASE?

> +
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> +
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> @@ -66,6 +70,7 @@
>  #define DP_PIPELINE_FLUSH		(1 << 2)
>  #define WRITE_IMM_DATA			(1 << 0)
>  #define WRITE_TIMESTAMP		(3 << 0)
> +#define XE3P_WRITE_IMM_DATA		(1 << 16)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -109,6 +114,17 @@ struct bo_execenv {
>  	struct user_execenv *user;
>  };
>  
> +struct inline_data {
> +	union {
> +		uint32_t dw[16];
> +
> +		struct {
> +			uint32_t indirect_addr_lo;
> +			uint32_t indirect_addr_hi;
> +		} xe3p;
> +	};
> +};
> +
>  static void bo_randomize(float *ptr, int size)
>  {
>  	srand(time(NULL));
> @@ -1578,7 +1594,6 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0xE0004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
>  	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
>  	// Split into low and high 32 bits
>  	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
> @@ -1902,6 +1917,218 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xe3p_compute_exec_compute(int fd,
> +				      const struct inline_data *idata,
> +				      uint32_t *addr_bo_buffer_batch,
> +				      uint64_t kernel_start_pointer_addr,
> +				      uint64_t context_data_base_addr,
> +				      bool threadgroup_preemption)
> +
> +{
> +	int b = 0;
> +	uint64_t kernel_addr = kernel_start_pointer_addr;

What is the point of the new variable kernel_addr instead of using
kernel_start_pointer_addr directly?

> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +
> +	igt_assert(idata);
> +	igt_debug("kernel addr         : %"PRIx64"\n", kernel_addr);
> +
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
> +
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
> +	addr_bo_buffer_batch[b++] = 0x14001400;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
> +
> +	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00000004;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
> +	addr_bo_buffer_batch[b++] = kernel_addr; /* dw19 */
> +	addr_bo_buffer_batch[b++] = kernel_addr >> 32; /* dw20 */
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> +	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
> +	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
> +
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
> +
> +	/* inline data 32 - 47 */
> +	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
> +	b += 16;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> +
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> +
> +static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      uint32_t loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +/**
> + * xe3p_compute_exec - run a pipeline compatible with XE3P
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel
> + * @eci: engine instance class
> + * @user: user defined exec environment
> + * @alloc_prefs: memory allocation preference
> + */
> +static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci,
> +			      struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
> +{
> +	struct bo_dict_entry bo_dict[] = {
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x1000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = ADDR_BATCH,
> +		  .size = SIZE_BATCH,
> +		  .name = "batch" },
> +		{ .addr = ADDR_STATE_CONTEXT_DATA_BASE,
> +		  .size = 0x10000,
> +		  .name = "state context data base"},
> +	};
> +	struct inline_data idata = {};
> +	struct bo_execenv execenv;
> +	float *input_data, *output_data;
> +	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> +	int entries = ARRAY_SIZE(bo_dict);
> +
> +	bo_execenv_create(fd, &execenv, eci, user);
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[2].size = size_input(execenv.array_size);
> +	bo_dict[3].size = size_output(execenv.array_size);
> +
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
> +
> +	memcpy(bo_dict[0].data, kernel, size);
> +	memset(bo_dict[1].data, 0, 4096);
> +
> +	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +				  0x400);
> +	idata.xe3p.indirect_addr_lo = indirect_addr;
> +	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> +
> +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> +
> +	xe3p_compute_exec_compute(fd, &idata,
> +				  bo_dict[4].data,
> +				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +				  ADDR_STATE_CONTEXT_DATA_BASE, false);
> +
> +	bo_execenv_exec(&execenv, ADDR_BATCH);
> +
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
> +
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
> +	bo_execenv_destroy(&execenv);
> +}
> +
>  /*
>   * Compatibility flags.
>   *
> @@ -1968,6 +2195,11 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.compute_exec = xe3p_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  };
>  
>  static const struct intel_compute_kernels
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index 2b616f136b..0490a692ef 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
>  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char xe3p_kernel_square_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
> +	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
> +	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
> +	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
> +	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
> +	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
> +	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
> +	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> +	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
> +	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
> +	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
> +	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
> +	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
> +	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
> +	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
> +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 3c888ebd85..4d69f270e9 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.loop_kernel = xe3lpg_kernel_loop_bin,
>  		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.size = sizeof(xe3p_kernel_square_bin),
> +		.kernel = xe3p_kernel_square_bin,
> +	},
>  	{}
>  };
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index fb65b8f207..20227bd3a6 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -18,6 +18,7 @@
>  #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
>  #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
>  #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
> +#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)

Why the trailing 2? XE3P_COMPUTE_WALKER does not seem to exist.

Francois

>  
>  #define BITRANGE(start, end) (end - start + 1)
>  
> -- 
> 2.43.0
> 
