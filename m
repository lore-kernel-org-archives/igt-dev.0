Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F51C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E9010E3B5;
	Mon, 31 Mar 2025 10:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj8bYR6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E0C10E3B5
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743415762; x=1774951762;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=juTBndlpxK2Pknw1oSQTYfwulfMs5sikojyGkCYQxxQ=;
 b=bj8bYR6YBjAiHS39IUKPku6UySnPHHY7tuBt+uW6RzqBSRcHZaKHT0wa
 TwGF3r0udg/qu+ZLA0W66iZMmS+V5ZdsFOSV/GxHDw0npzq//LdDR/EcQ
 OBj7yrwqW7LdNiZL7X1GrdwXNJupsjyjLR8Dd9XeJAEw5SVtQHD6GUX8T
 SpB5QIrNYmXipMvmkr0nvIJ4m0kCkMaKoTWOSQyanTnY6p0KnuGG6xdXX
 izbw4ZMPlLUpjuwusWMqh3p/5oDvVmEfNk62WUPweJvM/Zjqa1cwJ1lIj
 dkEYZL95ZT66i2aYQKy/P1wIHh1MSUVSC5SfrPDmSAGZpLYCWbBJ5JHxH w==;
X-CSE-ConnectionGUID: 3QKEpYjNQ4G9NDujbTDN3w==
X-CSE-MsgGUID: SSUEkl3uT4OQhlDHoWKQbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48568843"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48568843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:09:22 -0700
X-CSE-ConnectionGUID: pMbQkxaYQvO6Pg5jnjHdUA==
X-CSE-MsgGUID: D796D7hKRFOTSUhBooMipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="156975314"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:09:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 03:09:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 03:09:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU3SXFU7wZcyDk98f3dPGpmkKwrS+AOfIH/J2Mbv4OCP0mjlv5Amy1HyjtRPx72mF2TWDfWSruOIg97zsWKTwxEyHJ6VOIfywpbgeoTuWvxhEwRirVJDOTtmQ9Rwfn4PvhZyiM9nblYXWd86EJ/9JCvL1sHucjVDi7F7wHuLBi+lcFVj/EqGyMhUAVH45qTsF3q8uvbVqdjKK3z8/UiegPKykjbgKtar+f5G9iaNJOTi9BRLTsdT+RsZU9GzeQEnbMdSt+OpPhpKAYi9GCM9X/d8nS6gVkbFLaPypUJLmq4W6faiKtTvn/SpCFN68RZ2d32vppR16hSo9/jxGzAF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juTBndlpxK2Pknw1oSQTYfwulfMs5sikojyGkCYQxxQ=;
 b=o0w8jN/8d7HPeE5lWoylV90mzWPKAhRZNIttjE1PqdzK6fSYuaWGMH9z31IEYUJ/JcJ88TiGm9q4Bb74/7JQY4IVbezdz3Ve7FGcVDK8qf2y/vZ9/FOSE/TOmG8UfnxkWNMx6cA0YD1mxHpkatWvAZPVm2YqkWHe9C48dMV4iIt+rclGjwlLTWu+llf4ck0yo5Y3oKbFc+/Xsk0IaRJYJWaQxY2GPBBu+rF6+0KSQYdCWbc2krNN/0LcmNHkzNjcQXKSSGlBxgUMFwRs8kYkPL5HfD5PjVP2p3sFEu6+DpJtzYFAzDl0NGZsqwFx1togN7kdD+Oc033YGLDjd6roNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Mon, 31 Mar
 2025 10:09:18 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 10:09:18 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Thread-Topic: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Thread-Index: AQHbny1tDVqVgumf90aBq2QgBHEEt7ONCyJg
Date: Mon, 31 Mar 2025 10:09:18 +0000
Message-ID: <IA1PR11MB6097F0C118656EA0CBE6111F86AD2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DM4PR11MB7352:EE_
x-ms-office365-filtering-correlation-id: c3647d97-3f22-4446-8a59-08dd703c1945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHR2NW8ra1QyZnhDTzQ0cUN2ejVKdSt4MFdPUU9TdysrUStUWkttaVlwenBt?=
 =?utf-8?B?UzFhRHI4K21IZktOOXEvK2RlbVVkU2x6eDdFV3k5aHppWVdnelNtZTdCOUEw?=
 =?utf-8?B?QytDVTVoSzZOMWFnOEZGNDJJV1hwbFAyV2Z1UjY0NDVuUDBndHhmTEd1WnE2?=
 =?utf-8?B?b3diM1NOSVVoNDlnN3lnMUdTSjJ0UGF0VDhhd21zZGNGa1hOUjRueWEzZDdj?=
 =?utf-8?B?NUlIbWtkY2xzNWtEWVJJY0tZR3UrWmNabGU1TTNiYlpIcTBONzRZYkZqVmxv?=
 =?utf-8?B?a093b29NNWJCdjNZeGN1aXNRWitwMTZwUzFsT2tQQWlDZnFkVkRrR2FOdDh2?=
 =?utf-8?B?SUlQMzZ1c25IVzRZdHB4WFpqcG90ajNXeS8yWDJDemRWdlB5YjlEc0ZYdHBG?=
 =?utf-8?B?SHE2cUMya3JUVDUrSGtveS83QnJoZXp4MUkzbGFPcFhxdTN0RHZUWEdBSzI2?=
 =?utf-8?B?RU9kTjE5bjVadjg2T3ZaSURTUUxDWVJSZVc0azhaOUMyeG5GVlpaRnRtS3FV?=
 =?utf-8?B?VWZOK3U2S2FQUGhFMW5zSGFMMGRsTHhyN0YwMVk4ZTVCWDZaVkRWZlEwUjM1?=
 =?utf-8?B?YitLY08wY1JhNWlrVEF3NVpuK1loaGJoT0NpUElaMHM4WGxKeW1XbUQ5YUFG?=
 =?utf-8?B?UEFBQWNJeTlxL0xKTWJ1TzQyaVVOSTVvTExBK1BPSGNwdmV3a2hhMHZNbTJ2?=
 =?utf-8?B?bU52MzBjLyt5bVpGcFlwM1V5YTVvY05wb2EwdURnM3cvdTk0SVUyMnJhY2gx?=
 =?utf-8?B?Q1I2SnRqS1NhUWNEWjR5TFVvM2hqK0lzMVpSRnhUR2JveFpmQmZjVXdFWEJj?=
 =?utf-8?B?clZ4d2pJaTgvNytXeGV0T3E2M0ZKK0U2U3Z0TVZaNnRKMXdacFk0ZHBOTzZy?=
 =?utf-8?B?d1hsVzZXemdRbndjRGt3MkZub2F6cU9TYW9tREhLTmxCbkg2SzZwazN2cWtM?=
 =?utf-8?B?aXNXSVd1Vk1VYTk1NDB2ditnaS8ydk1CN2FVeXE2TDVQTlpqRVJaN0h2bnJG?=
 =?utf-8?B?VkkzWGNkWENJeUVlWlpWWW5HWGtPTTZGT0NoNzBnd28rVlJlNkd0MGtaOGdT?=
 =?utf-8?B?aXNCZnl4N2hSdCtRaWlZOHZPa1hQaFY2OTlIcVQ0YWVTblBPL2FSWDU0TDZz?=
 =?utf-8?B?cGR5NC9DalA0RklEeitwNjZEUUZqUGRDdVVwRUVTWWNaZEtmRWVWRDVUajZk?=
 =?utf-8?B?MUc5dFN2QTFMekE1ZVNvTnVBMlhrOG90VWt3ejA5U2NxUVMrWllZdEhvdTBS?=
 =?utf-8?B?U2plTUo5c0FNQWJBTmtTcDl3UTlqelo2RE1jRE9NL2Zsd240RHNwcWNLMWQx?=
 =?utf-8?B?dzgvWU5aa252M1ZYRnl4SmF4WDV3eTlGR0ROL3ArMEVOeGMrcmJ1dTVpZzZK?=
 =?utf-8?B?OThHbXBwUGxOR01tWk83ckpnMS9rUEZaeEtjL0Zsd0VGZnJHRGFOcGdsZ0M4?=
 =?utf-8?B?M3ZEaDZwcGxEMGVRSCtkRlpQbzdxZ0RNL3VSRllpRmQvb1VNdUd0WHU3eUFJ?=
 =?utf-8?B?Zkt5OUhaNWczeVFTWFppbDVYMUlPdTY0cVBkWC9MekpyaVVSNzB4anZOMWdE?=
 =?utf-8?B?K1hNSEV1Q00zLzZvbXJ0UUFzTnpNNmU1c0NJLys1Z0p4WFlQbSt4ampyeGlU?=
 =?utf-8?B?clNSdEtkdURabjRvcjNValhjS1dUVTJnNVJvSUdpTithdGErRHZ0VW1pOWYz?=
 =?utf-8?B?WnF5RkZtYlhyVTh3MlgzL1NYSTFXNjA3TWRoQ3BUckFmL1N0NkdqWXA2QUpk?=
 =?utf-8?B?WStkM2FWMmk4ZUIvVzl0QUlvWnRod2ZSWTYwU0VaM3E5RGh3cW1xeFJNQXhD?=
 =?utf-8?B?R0k1b0tNRmFhc2toSjF5b2puRUw3elE3aUpmclNkb1BsSTlhNW5MNHVGcE96?=
 =?utf-8?B?V0F6K1laME9idmswOExHdjJpeE81elR1bVZ3ZHRuVENGOFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNRUExqc1BmU0RpYVdrWG81WHdlMzRIbkhYUEtQMTRLWFpPc0tFVTVFS1Iz?=
 =?utf-8?B?NHlkV1NjUTNIODl1dDd2NGJqMFFwa1p2TGNOazR1Q1EzMU03Y0Y2RFp4b01y?=
 =?utf-8?B?UU0rNmhIdjh1dStlL0pnSzV1RDFtd0FCbUR0OUMvSG0yMXk2MDV4U3hGQmZS?=
 =?utf-8?B?bkdad1Y5WFFKMm5vc2IveWlvemJ4VmQ0N1BZckdNMFh3ejBLQWlrL0hiSDZr?=
 =?utf-8?B?ZTVMeUpyQ29tcjJkdGgvU05qTGlqa0Fac2JIZUFESTVpOGJxU0w2M24zZzdI?=
 =?utf-8?B?V1EzRWo1QkpXcklvSkxncFk0VkpQSjJMM3AzNmlQcWNFd2JPKzlMMGdBUU14?=
 =?utf-8?B?YmorMGxyaFVOREZIdmYzUnBuOTRnUVB3TWJkNGNaOWMxajJqUndXbFpPR2k1?=
 =?utf-8?B?Z0lodTcvR3VkQjhPUU40ZytFeU93TWZWUDRxV20xdUdOdjNuRjQwRUMvODZU?=
 =?utf-8?B?S3c2MzY0RFBnWktrWjM1czVJMk1iSjYrcnlWMFJJS0pZaGVsem5Oa3FXekc4?=
 =?utf-8?B?RGV4a2NyMjAxYzBVcGo4M0FZQVVTeXNRMjRzaitCY3VDcE9tQzdndHZCcnln?=
 =?utf-8?B?UVhZNlNOSGdFZ2xGYlpTY1BCeE91cWc3Y3R1YnZwbE9nRUxDWGxDUVhuZ2lK?=
 =?utf-8?B?dUZCNER6TmtPZ0hsckovM011RGpaSTliaXJaRXEwZE9DWFNHNWtsbnlkSnU0?=
 =?utf-8?B?ajFXTUJWYXFYckVnYjVEYkNLSGdmNkU5a3BKam5XTzVqWVZQY3I0dWdUZmVD?=
 =?utf-8?B?TFdpbG9IbTNMM2N6NkRGZ1VHa3lpbk9IMDE1RFk4QmpFQUIwQW12UEVFWEN2?=
 =?utf-8?B?Y2FqR0RDZUpTKzRmcmIrWGp1MnpaSUlXV3JoMngxQ2s0bnh0aTh3TWZNY0RJ?=
 =?utf-8?B?TG55endzZHI2YmNQTWJuSUhFQWI3eXM5aHhhUlhuTWVMam9VZVR6Q0dFSmFB?=
 =?utf-8?B?MWF6ZFRGeU1jSHo3bXZlTzBhL2dkeTZvYXErZ2U1SWV1dGNBRVRRTWVnMTFZ?=
 =?utf-8?B?VDBWaTZDbWVUaEtaOHQzdjJQYzZ1RWdQcXdCUDZPUEZWSUVXMGtQRVN4REwr?=
 =?utf-8?B?OURDQnFya01XaG1aN0ZiN01zQ0I4VUhBa1c5ZHl1a1drUG1KVkxuTmpjWDBq?=
 =?utf-8?B?QW5pZS9LOGI4dmllRVpSaXdkSWxLMytFbjRteU9kTmlweENNZkxIZFZiWkds?=
 =?utf-8?B?Sm56YXJhYnc0Ti9zS0FlSm5lczhCYk5SNkR4Tm1XaEJGQkRKTUlaU2cwUjZI?=
 =?utf-8?B?OHN6UlNXRUx0TkxnMUNEM09uOGF3d3FSaFZ2UENkUW01T1ZlYVZHYmpsVElm?=
 =?utf-8?B?ZEVESTRRTWhZcFFQRm1MemRrV3EyS0ZvRE1lQ3YvNGljTk1JT1NuckptMUhh?=
 =?utf-8?B?K1ZIclZEdVp0NVgxMGVqdEhDK1pXakwyT3Z5dUFDYzkycmpMY2M1U0FCQUVl?=
 =?utf-8?B?MHE5eHpJcEcvbmdvcHFoNTdYZzZ0VWNNbHhlVTZqWFBScmZ5RTlBLzZlenRC?=
 =?utf-8?B?NU4xanlsNEo1cysxTE51dDZtNjRLMWNmd3plNWlyTThkNHJHK3RaNnAvVWxu?=
 =?utf-8?B?QVZMRThwd3hpcWwrd0VDU3NqeFgwWXVxeFJEMElEdEpnRWxPQWYvOFUydVo2?=
 =?utf-8?B?OE9nU1oxMitrcmNOcll3ekcvRmpXUmIrMEp2cldDMW9tNEh0aVBSMUlybmp6?=
 =?utf-8?B?bHFUMTdjcFpnWFVNNWcyTnZQNkJKeXZoTTQwWnNBNWl3ZXoxU3psV3RKYnE2?=
 =?utf-8?B?UWs2UmN6eTd5WUo3RVJxdnh4a0toRjZNOFhHY3ZkaTVaeG5lUTh1YVFDazlS?=
 =?utf-8?B?VHYwbUovaUVPL0FWRWJvNXRYOVNwZzgwZjdjVDNCU2lMRmN0WDlGM0hsZU5h?=
 =?utf-8?B?NUFXZ08vOEhMbGJGcGNIN2grQnNkNjdjYSt6T1BBakJIVk5MRVpPRDhPcG5q?=
 =?utf-8?B?V1NiSGJUbHlFMVVFZ1VtNDlRQUYzallMRXNyeVFFd1B3NVBYeGJYaEVuZy9r?=
 =?utf-8?B?TnVod3ZVcEI5MkV1cmZDZ2Z6UDlDWWhhbjRVamYzSkhLTFZwMDk4ZFNxbTZq?=
 =?utf-8?B?OW1Pbk9ocWpQRm1ySEFhcU9ENW45dkZMUERFbSswTU9DMStwd25zZ3l4dEpw?=
 =?utf-8?B?aGdranIzMEE4VlI2N2p4SjYrK2Zya0hGL2FRdThsOThieTFJaG43NHpGN0dq?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3647d97-3f22-4446-8a59-08dd703c1945
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:09:18.0578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80KPd4eq+RIDZGn3WE6w6Q1w7mC5rNEhkW0YWh7M8jWzYPCCE0RXah6CQmGTTcItEFSzLoD2f2UirQseH2n2E8igmqGjCshjMnt8Yp3Az6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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

QWRkIHNvbWUgZ2VuZXJhbCBndWlkZSBhYm91dCBhZGRpbmcgbmV3IGxpYnJhcnkgZnVuY3Rpb24g
YW5kIGEgZmV3IGd1aWRlcyBmb3IgdGhlaXIgdXNhZ2Ugb3V0c2lkZSBvZiB0ZXN0cy4NCg0KU2ln
bmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KLS0tDQogQ09OVFJJQlVUSU5HLm1kIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0NP
TlRSSUJVVElORy5tZCBiL0NPTlRSSUJVVElORy5tZCBpbmRleCBiNTcxYjVlNjguLmQ4NTI2NmE2
YyAxMDA2NDQNCi0tLSBhL0NPTlRSSUJVVElORy5tZA0KKysrIGIvQ09OVFJJQlVUSU5HLm1kDQpA
QCAtMzgsNiArMzgsMzMgQEAgVGhlIENvZGUNCiANCiBbaWd0LWRlc2NyaWJlXTogaHR0cHM6Ly9k
cm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy1Db3Jl
Lmh0bWwjaWd0LWRlc2NyaWJlDQogDQorSUdUIGxpYnJhcmllcw0KKy0tLS0tLS0tLS0tLS0NCist
IFRlc3RzIGFuZCBiZW5jaG1hcmtzIGFyZSB0aGUgbWFpbiB1c2FnZSBvZiBJR1QgbGlicmFyaWVz
LCBzbyB0aGV5DQorICBjb3VsZCB1c2UgdGVzdCBzcGVjaWZpYyBtYWNyb3MvZnVuY3Rpb25zLCBm
b3IgZXhhbXBsZSBpZ3RfYXNzZXJ0LA0KKyAgaWd0X3JlcXVpcmUsIGlndF9za2lwLCBpZ3RfaW5m
byBvciBpZ3RfZGVidWcuDQorDQorLSBOZXcgbGlicmFyeSBmdW5jdGlvbiBjb3VsZCBiZSB3cml0
dGVuIHdoZW4gaXQgd2lsbCBoYXZlIGF0IGxlYXN0IHR3bw0KKyAgZGlmZmVyZW50IHVzZXJzLCBm
b3IgZXhhbXBsZSBpZiBpdCBjb3VsZCBiZSB1c2VkIGJ5IHR3byBvciBtb3JlIHRlc3RzLg0KKw0K
Ky0gSW4gYSBuZXcgbGlicmFyeSBmdW5jdGlvbigpOg0KKyAgaWYgaXQgaGFzIG1hY3JvcyAoZm9y
IGV4YW1wbGUgaWd0X2Fzc2VydC9pZ3RfcmVxdWlyZS9pZ3Rfc2tpcCkgdGhlbg0KKyAgICB3cml0
ZSBhbHNvIF9fZnVuY3Rpb24oKSBjb3VudGVycGFydCB3aXRob3V0IHRoZW07DQorICBsaW1pdCBh
bHNvIHVzYWdlIG9mIHByaW50cyBpZ3RfaW5mby9pZ3RfZGVidWcsIHRoaXMgc2hvdWxkIGJlIGEg
cGFydA0KKyAgICBvZiB0ZXN0IGNvZGUuDQorDQorLSBMaWJyYXJpZXMgYW5kIGlndF9ydW5uZXIN
CisgIFJ1bm5lciBzaG91bGQgbm90IHVzZSBsaWIgZnVuY3Rpb25zLiBJdCBpcyBjcnVjaWFsIGZv
ciBDSSBydW5zIHNvIA0KK3VzaW5nDQorICBsaWJyYXJpZXMgcHV0cyBhIHJpc2sgb2YgYnJpbmdp
bmcgY2hhbmdlcyBtZWFudCBmb3IgdGVzdHMgd2hpY2ggaW4gDQordHVybg0KKyAgY291bGQgYnJl
YWsgcnVubmVyLg0KKyAgTm90ZTogWW91IHdpbGwgZmluZCBwbGFjZXMgd2hlcmUgaWd0X3J1bm5l
ciB1c2VzIGxpYiBmdW5jdGlvbnMgLSB0aGlzIA0KK3dpbGwNCisgIGJlIG9uIFRvRG8gbGlzdCB0
byBiZSBmaXhlZC4NCisNCistIExpYnJhcmllcyBhbmQgdG9vbHMvDQorICBUb29scyBzaG91bGQg
dHJ5IHRvIG5vdCB1c2UgbGliIGZ1bmN0aW9ucy4gQW55IGFibm9ybWFsIGNvbmRpdGlvbiANCitz
aG91bGQNCisgIGJlIHNpbXBseSByZXBvcnRlZCBieSBwcmludGYgb3IgZnByaW50ZiB0byBzdGRv
dXQvc3RkZXJyIGFuZCB0aGVuIA0KK3Rvb2wNCisgIHNob3VsZCBleGl0IGdyYWNlZnVsbHkuIERv
IG5vdCB1c2UgaWd0X2Fib3J0IG5vciBpZ3RfYXNzZXJ0LCANCitpZ3RfcHJpbnQsDQorICBpZ3Rf
ZGVidWcgbm9yIG90aGVyIHRlc3RpbmcvcHJpbnRpbmcgbWFjcm9zIGZyb20gaWd0IGxpYi8NCg0K
TEdUTSDwn5iKDQpBY2tlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVj
aWVsc2thQGludGVsLmNvbT4NCkFmdGVyIG1lcmdpbmcgdGhvc2UgcnVsZXMsIHdlIHdpbGwgbmVl
ZCB0byBoYXZlIGxpc3Qgb2YgVG9Eb3MgZm9yIHBsYWNlcyB3aGVyZSB3ZSBuZWVkIHRvIGFkanVz
dCBjb2RlIHRvIG5ldyBydWxlcy4NCg0KS2FzaWENCiANCiBTZW5kaW5nIFBhdGNoZXMNCiAtLS0t
LS0tLS0tLS0tLS0NCi0tDQoyLjQ5LjANCg0K
