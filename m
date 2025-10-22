Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23FDCCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 11:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ACA10E0BD;
	Wed, 22 Oct 2025 11:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkKmcRtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EED10E0BD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761134127; x=1792670127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9icmkj4ggRv67YsVbHqwrt6sdSgHgDsp68YOGUhmdfA=;
 b=QkKmcRttGM9Je6/LQmsXW0S2/47MvzayNirfpAgmDD9Ok/RUmx8SApO5
 5aicOPnnd7kAHpWha9P2LfLe7GrMtElv+DH+I+8Msu8XhmY3jPcUJZFe9
 /jamIqjOediHEwF3VhkcUfGkjddq4Er+ChlbwMZEEdGWaXa4Oi360RZ6g
 OKHAEok9JAVYYwe7Ws5WBR1C83iyqBlM2mrJ2dsdn20o8VCL+I7gZ0noi
 5VXCq3TVp3T2e9QMgqBaff4XiPu8y1AAL1rCZQopzwUGlpENhBjj8XxBN
 3J4r5CwS3uJM8S1wHXt7tXcPR33l2tNCe2qNz84aqgAP3Ub3p1jQuYlow w==;
X-CSE-ConnectionGUID: VjTqNGt6Qd25awfNX0ibTw==
X-CSE-MsgGUID: i9JASW2MRCOoUVOAbgWKbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74397554"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="74397554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 04:55:26 -0700
X-CSE-ConnectionGUID: okmzyPtZQCW1Lp+dtpyuyQ==
X-CSE-MsgGUID: JuoJixT3RJC8tEha0+33TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="221045685"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 04:55:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 04:55:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 04:55:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 04:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2KE5jBPfa9DUknwwEokcj3QUybuVBry2GYxJi0dWN16yq8WUlXTpBMVpZyPvexqbP1o6Yjc3H6DiJzbrBQarkqdmDMAB3uJ8IXSjH1QeOSq+XioKOqkyA6dQUH3+rTrTB6Zzfyqemp0mkTJ0ejcF1t8db9Gm+buUbGoOZ3zsTKAzcX+Co+wOV2saVsA6J37POxcx1cuUsUNvhge2zkOV0Kz9I/5oJ049nLqw7rlaBKFTyYfwKd3zZM4Ki37UZRbOvyYMyNKksdROAoeokpYoDHePtUkKfgHyy0DIwDE+i9usYpSVIvxg3IvgjCbWDl/lYet00gHqTYeGJt3c8FFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9icmkj4ggRv67YsVbHqwrt6sdSgHgDsp68YOGUhmdfA=;
 b=ja7eAGvkH6me/aqm2HXRXSWtlD0vADMJrtHzR8vAXt4Rsvjj9MRRAe97PIXx3Zg95B2kUYL3FcZhTmul0tk1mIFI4DnaFGhcxp/Rz4leSVfQLWORdnErF8M/A3rSgeinnIbTWyBFvElcWdJAQNf52xN7EoAAVxV7c0Vc4gpaEuW+NXWXUoxY0KMRGScCEuSeZYAAa5DKkV38rUlNAmbZ2WNagWZJw1GyeuFWqsUV8lY5wWbKXvPVom4EqerhaNvyi71uC6XFQuSWDc0A7hKHaTOky20EubIFkezIdUUVLeQAuXZ2lhIqGumF0Y7k4bLJIzMys4xgN3lMXtTDup/EHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by CH2PR11MB8868.namprd11.prod.outlook.com (2603:10b6:610:284::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Wed, 22 Oct
 2025 11:55:22 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 11:55:22 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: RE: [PATCH v1 2/3] lib/xe_mmio: Add init flag and helper to check
 initialization
Thread-Topic: [PATCH v1 2/3] lib/xe_mmio: Add init flag and helper to check
 initialization
Thread-Index: AQHcQd5pG0ggAtCLP0+bQ9d7H6CmEbTOEatQ
Date: Wed, 22 Oct 2025 11:55:22 +0000
Message-ID: <IA4PR11MB925163D4D07ACAAA1C69A89C99F3A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
 <20251020162633.2622396-3-piotr.piorkowski@intel.com>
In-Reply-To: <20251020162633.2622396-3-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|CH2PR11MB8868:EE_
x-ms-office365-filtering-correlation-id: 11d1eb0c-44a5-42ac-de2e-08de1161e15f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?c1pUNmpiR2FHbWpuQjA3QXVFYXVwWFIrQ3VKSzVLcEJhVENjdWNKUVhSUmJn?=
 =?utf-8?B?c2RZNHFXK0JLRUNKZFdjNjA1SWxtZDRzSWZESXlPTndtMjhKZmZad1VCVXI2?=
 =?utf-8?B?c3IvRW5BbnZXN1RmZzBvajVzRHN3Q3RUUmdmR09IMHNCQTM4Ukd1ejFIc2NI?=
 =?utf-8?B?RGw3WmtkcDUzUDkvSzZacDRUNDRIa3hxejA1ZjlYQnQvSmZETWdaYzVKdnBi?=
 =?utf-8?B?SzZNTnI3U1pTQmhQc2FZMU9wQ0c5RWRRSVRxZGZUM1l2Yklwb1FVUFFXd1pU?=
 =?utf-8?B?d2wyNXdhOWJ2c0l0aUdTM2hUTCtJaUNKK21YUHBmclUrVFJ0aHo5d3UvK2Uy?=
 =?utf-8?B?L2dVcjdDb1hVdTl3eVduZmovakx0Q0g1Z0x1MHF6RzhrNkJ4OGprTHRObXUr?=
 =?utf-8?B?YmZVK2pCL2J4OElJZm9nNWtSa25XamJrelN4MGdoQ3RLOG4vZHBsQjdlTnVn?=
 =?utf-8?B?bnJwdHRSalZqaFVOdFE3UUtjTTFwRGJUWFUyYmdNU3g0QjFGMy9Od0lXamRk?=
 =?utf-8?B?b3YweDN2OEJpYkszTVhxL1I4ZkZMRUE4ME5qWTZVVTduSEN2aDBjeEZLTDE4?=
 =?utf-8?B?Q1Yzc2E0NkhFMmlBamgrYXFUeStTYjVORWM2OXdDTGxkNEo1NnVZQVE2U0NH?=
 =?utf-8?B?Tkg5WEVEODl6cXd3UHJxalpYOWJ2WjhLejdrT1lIUzlUQjJjS3QvaW9XYllJ?=
 =?utf-8?B?RmQ0SWdpNEc1akM2S05UNU8raDVibDlCQWM4ZlpLMU9kaEpoUVordklXWTE2?=
 =?utf-8?B?Zkx3dm5yUjBRQjh3RXJJblIvQytlSDVtZXp0ZFVEQ29CTnMxVHFWQzQwWWxj?=
 =?utf-8?B?MDUrdWVndmNZd05NRDVnU25rdjJTTHJCdTJCdTVvVENMM2NXM3YyZkdUbmtP?=
 =?utf-8?B?M3dnbU9XbFhBbE5GbStHckN5V0U4N1VSYTR2K1RhTnV4dWdUM3dtQkxhWWxI?=
 =?utf-8?B?SXJUUW1Jb1ZSLy9SRWMvZ3BrMmVzM08wNWM1U0Zvbk5BOGNZWkZCUVJRckl5?=
 =?utf-8?B?VkNkemMyS3VBVk9kNGhaR09SRTA1RzlsUVRGV3k1bzZ6TlBWVU83NEJYUTl4?=
 =?utf-8?B?czlDL3dDMlFFVTFhdFdYK2NRbFZyNThsQ0hROHFPSi9nQXBjSzJqbHI2Uytp?=
 =?utf-8?B?WWYrZ2xBSit2MzJOWHM3cUFNREMzbTR3Rm9Dc1MwWUpQVXprcFMxQ2lUQUFl?=
 =?utf-8?B?d0xlM1cxOGROZ2VENkJlTk50NWhNUDEzVkg5NWE3c2xuajNQOEJaTWFmeVB5?=
 =?utf-8?B?MmMxdERuaWhKQThENE9STk1CMXhNTjN2bUxTeW8xdi9hQXZXM3ZUeWp2Nmk0?=
 =?utf-8?B?OEpRdzJObW1ncTNUR2FRV3djVmFkN28rdnpGS29ndlROemZxU3k5ZkhrNjZ1?=
 =?utf-8?B?dUt2OEx4UXpNMWxpVlhMNUVmcWVveXQ5MXFHN1JXQ1BxbGpVQmpFelBzMTRl?=
 =?utf-8?B?aU5EbFl2WDNCeitYZmhXNnhSd04wZ2xmb3pza1p4dmN4c2VCZ1NrSXVQZmRm?=
 =?utf-8?B?QXRtVTVLRG5JcUJVWTJQd3BvbWJIL1FpMFBhRFVYSUR6ei9jMS83YWc0TTcz?=
 =?utf-8?B?SG04YWJNOWRTZnB2U0VCb1h1ME1lS29USE5QR1IrZ3RORGgwL0xzWEdQWXd3?=
 =?utf-8?B?bGJkWGs1Z3YyeEVKUWh2SllBbTlmZmh3c3F2aER0cDhQWVhvaUNQMXpreTBO?=
 =?utf-8?B?NUtJVHRUOW83TVhaakZsZXFRZE05UXI5ZktmOTZHNDVtSnMxWG4rZWpSeWZp?=
 =?utf-8?B?WXRzV2pYeUh5ZW9zYlBrMmU4RTRHdTNXYWRQOUdZdGRWUE96NnAyZnVuWXg2?=
 =?utf-8?B?WHVHVUJZTnhwN3hPbjlRdzdUR3g1dmZ3ZzRTVkNjNVZUY0EzWWtBYlJmanNz?=
 =?utf-8?B?enpWd2x2ZlVqSzFRcHkwdFh2S0xicXNMTXpZd0llMDhVV0JEcC81Z1BnQitq?=
 =?utf-8?B?YUxyUGhYa1B3S2p5WCt0OThtcHZscDR4V0FtcVpUL05tcFMwcTVQQ1JZTnU5?=
 =?utf-8?B?d3pXR2UvWHNURWw1VUs3NHAvNXRrbHp5Vk42ZXA5NmRqY3hCaDJXc1h5eUhq?=
 =?utf-8?Q?c1li5r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2xzbU16T01hOHhhSE83YnU1Yy9WQlVrYmVURXljb0RWNWJJcEFEbnp0UGFY?=
 =?utf-8?B?TGc2N3pDaEYwNjZoMTNjaFZaTkc5anlCQUc2RzdNcWFoQkJTQW5TTEtoOERH?=
 =?utf-8?B?MzVsV1RMZFYrc01WK21TSUhTS2w0UGFKTDRXWlJxZ1dOSnRjQktVNnhEU3Yy?=
 =?utf-8?B?TnpQQVVxNlc5NUcvaG1DY3I1QmQyKzR0YUI3ZVpwSFVqbUZPaEQ1MHYyNjlz?=
 =?utf-8?B?R0RzTk1VSGg2SUlVeTB1cy92NkZUVVBSREFIRDVzQ2ZCRUpQV3U4MHBabGZY?=
 =?utf-8?B?QlYvdWpPM3J1SVVsSGdlT3dDSGZiY0VhUFpoV3FWNHUzSzZrMUxIOG5KS2Zm?=
 =?utf-8?B?ZkZ1QzB3dkRqVENXdU00Wk1qd3YrRW8rUW4wblhkSm1MZk1ZNng2V3UrUTYy?=
 =?utf-8?B?S2RUTVkrdHJzQXdQNlJybG1McUxkdVVRVEc3bWw5LzN5QU45R29PbVpLRDJJ?=
 =?utf-8?B?MHdJZThTMjhaWmVlMmZJazNpOGRDdldGMWpRS2F3UjhNUitNVUxYLzRESExC?=
 =?utf-8?B?RHIvcGdQU3hlQ0NoK25zNFNEOEx4KzBBVWpGTGd6S0pRTXRadHdROGphVmFz?=
 =?utf-8?B?bGJBbDJYVFB2bWozd2N4OG9uS2dxVytDMDFrUGRNdjlyUUF5TGQ2a0xrVW12?=
 =?utf-8?B?ZnpEbTBwa1dyYk9WZkptK2FSQ2FxL3JwVklyWFBURGJXUzRqTDRKMkRLR2x2?=
 =?utf-8?B?Nk9EWjZkaW5aM2FURngrQ05pWVFGY0IzT3RyMktVTEN5cXhxRXc0TUYyWkQ1?=
 =?utf-8?B?dHBKTFNHVnAycklWUDBlQ0VGMEdiekh2R1ZwZnhVK3B0US9zTmRjSCsxdEJ3?=
 =?utf-8?B?N0pWc05pei94UGZGVmlMdUVuL3I1Ym02ejBMc2dGUU9zekl1TldJR1JPTlNM?=
 =?utf-8?B?ejZiVWE4VlhDbVJ1MW1rMjdYcFY3dC9sZ3lNbkRYZzFjdnpZbkoxWXA1bzZR?=
 =?utf-8?B?TUpvOHpuK1JqS2xyalEyNG5NY0JpcDFVSlBoQkhXdGVJMnRjRHNMck1VV2V3?=
 =?utf-8?B?cjRlajlXOHNkSGNuN0NmZzB2S1I2N2hta29rNlBNaENsWE42MW0zcUdrSGQv?=
 =?utf-8?B?aWVrb0YvQVp0RHQ5Zi9uM3VGOVVLUkoxTHlwNWRrOFZLeTNCcGc0c2I1eXJI?=
 =?utf-8?B?V0g1RXRJTTEzMGxtNzBTcWJIRzJyR3FuODJPS1h1MEtWQ29kcmhhOTY3RUE2?=
 =?utf-8?B?Rk9aMkcwNkptRFpYWEsveiszZjdINmFjL0lqVzVVNDdmVTFDQ1VZVVlGMHV3?=
 =?utf-8?B?Zm52dk1wWGVybk01R3BVMkJDRmd6NThYMk5wMGpsY0hVeisrVEdlbjNIczNt?=
 =?utf-8?B?VU81eWZpWVFETFRSTDVlY0FuY1dyRnFwbHhxZTB3TzBHOHlHVkFRdE0xejRs?=
 =?utf-8?B?TlhZOXNTTXJPcTVGTm51UUpGZ2ZHT1BSRUFXRFZrSFNlSmo3NGtPaWhOZEdj?=
 =?utf-8?B?Qll5YjFJTVozR05KKzNQSmJSVHNMck51c2c2c2E5WExtMHJIY01yc3pwa1pJ?=
 =?utf-8?B?TnRDK2tCVWtZNWVGNHZ4ZG9kVCs1d3NxcTR4SnhrcnNvTWhWbzlkS3dxbUFG?=
 =?utf-8?B?QWZCVTJmQzlYSjNkVEVicW1Md1JlRjlCS3h0M3IvQjh2SEVaRk03YythdytZ?=
 =?utf-8?B?RU0xNXUxa0hOVU45bDVwdGMzOWQzSlVkQU5NcXdVZU8rTFB0RFpreTNEK2s2?=
 =?utf-8?B?UVFYcG45VWxldEQzYWZMckliTG93d0wvYWdSRkdzUjA4T1RTeTh2TUlhUUF1?=
 =?utf-8?B?S0luZ20yeUN1VTRBUHY5YUV6VUJvVFduem90U3lIY044Q3Jna2lvZXNLS0lQ?=
 =?utf-8?B?Ym5rbW9ybkRuTzdZNlYvY2VyN1p3TUt3bnZQaUpyY3g5YlhDUWZOWmY5S2dk?=
 =?utf-8?B?S0VlRldjRWFQRDYvNUs1c2JBL1FOVEtIVTdQQ2MrOEN2MGJmM1ZyS3o2QXM2?=
 =?utf-8?B?ZkUxb3huZVpHV2d2ZEU2VFVEcVE4Y2RGOXZwcE1HM1dnaGZISUVTd3poZThV?=
 =?utf-8?B?WkhGWWdWMU9UU1ZFS1lNNjUyaGtHVFhDSndCM2FyR0JIditqNGRrRHFJLzRE?=
 =?utf-8?B?bGR0OXJGNkFuTWdjVmc5cDVDTFFoSzBRUkY4MDViZzgvREpQVzVQSEdwdjJj?=
 =?utf-8?Q?JnWrCMdw6SPeI76PxfcZxypPy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d1eb0c-44a5-42ac-de2e-08de1161e15f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 11:55:22.3590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BL5v6dDUUbz6y2OaubkZlm/K3atx3UcnX+heai5z0ic0YkZlJKeqD1yuhvPfoOaG0vywbAZ69JlOnqDHbnVRjmIvCFu967/0cML9c4Z6zgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8868
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFBpw7Nya293
c2tpLCBQaW90cg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjAsIDIwMjUgNjoyNyBQTQ0KPiBU
bzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpb3Jrb3dza2ksIFBpb3Ry
IDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT47IExhZ3VuYSwgTHVrYXN6DQo+IDxsdWthc3ou
bGFndW5hQGludGVsLmNvbT47IE1hcmNpbiBCZXJuYXRvd2ljeg0KPiA8bWFyY2luLmJlcm5hdG93
aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYxIDIvM10gbGliL3hlX21t
aW86IEFkZCBpbml0IGZsYWcgYW5kIGhlbHBlciB0byBjaGVjaw0KPiBpbml0aWFsaXphdGlvbg0K
PiANCj4gRnJvbTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29t
Pg0KPiANCj4gVHJhY2sgTU1JTyBpbml0aWFsaXphdGlvbiBzdGF0ZSB2aWEgYSBuZXcgYGluaXRg
IGZsYWcgYW5kIGV4cG9zZSBpdA0KPiB0aHJvdWdoIHhlX21taW9faXNfaW5pdGlhbGl6ZWQoKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5waW9ya293c2tp
QGludGVsLmNvbT4NCj4gQ2M6IEx1a2FzeiBMYWd1bmEgPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29t
Pg0KPiBDYzogTWFyY2luIEJlcm5hdG93aWN6IDxtYXJjaW4uYmVybmF0b3dpY3pAbGludXguaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi94ZS94ZV9tbWlvLmMgfCAxNCArKysrKysrKysrKysrKw0K
PiAgbGliL3hlL3hlX21taW8uaCB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfbW1pby5jIGIvbGliL3hlL3hl
X21taW8uYw0KPiBpbmRleCA4YmM0NDZmYjkuLjQzYWEzNTRmZiAxMDA2NDQNCj4gLS0tIGEvbGli
L3hlL3hlX21taW8uYw0KPiArKysgYi9saWIveGUveGVfbW1pby5jDQo+IEBAIC0yNSw2ICsyNSw3
IEBAIHZvaWQgeGVfbW1pb192Zl9hY2Nlc3NfaW5pdChpbnQgcGZfZmQsIGludCB2Zl9pZCwgc3Ry
dWN0DQo+IHhlX21taW8gKm1taW8pDQo+IA0KPiAgCWludGVsX3JlZ2lzdGVyX2FjY2Vzc19pbml0
KCZtbWlvLT5pbnRlbF9tbWlvLCBwY2lfZGV2LCBmYWxzZSk7DQo+ICAJbW1pby0+ZmQgPSBwZl9m
ZDsNCj4gKwltbWlvLT5pbml0ID0gdHJ1ZTsNCj4gIH0NCj4gDQo+ICAvKioNCj4gQEAgLTM5LDYg
KzQwLDE4IEBAIHZvaWQgeGVfbW1pb19hY2Nlc3NfaW5pdChpbnQgcGZfZmQsIHN0cnVjdCB4ZV9t
bWlvDQo+ICptbWlvKQ0KPiAgCXhlX21taW9fdmZfYWNjZXNzX2luaXQocGZfZmQsIDAsIG1taW8p
Ow0KPiAgfQ0KPiANCj4gKy8qKg0KPiArICogeGVfbW1pb19pc19pbml0aWFsaXplZDoNCj4gKyAq
IEBtbWlvOiB4ZSBtbWlvIHN0cnVjdHVyZSBmb3IgSU8gb3BlcmF0aW9ucw0KPiArICoNCj4gKyAq
IFJldHVybnM6DQo+ICsgKiBOb24temVybyBpZiB0aGUgeGUgbW1pbyBzdHJ1Y3R1cmUgaXMgaW5p
dGlhbGl6ZWQuDQo+ICsgKi8NCj4gK2Jvb2wgeGVfbW1pb19pc19pbml0aWFsaXplZChjb25zdCBz
dHJ1Y3QgeGVfbW1pbyAqbW1pbykNCj4gK3sNCj4gKwlyZXR1cm4gbW1pby0+aW5pdDsNCj4gK30N
Cj4gKw0KPiAgLyoqDQo+ICAgKiB4ZV9tbWlvX2FjY2Vzc19maW5pOg0KPiAgICogQG1taW86IHhl
IG1taW8gc3RydWN0dXJlIGZvciBJTyBvcGVyYXRpb25zDQo+IEBAIC00OSw2ICs2Miw3IEBAIHZv
aWQgeGVfbW1pb19hY2Nlc3NfaW5pdChpbnQgcGZfZmQsIHN0cnVjdCB4ZV9tbWlvDQo+ICptbWlv
KQ0KPiAgdm9pZCB4ZV9tbWlvX2FjY2Vzc19maW5pKHN0cnVjdCB4ZV9tbWlvICptbWlvKQ0KPiAg
ew0KPiAgCWludGVsX3JlZ2lzdGVyX2FjY2Vzc19maW5pKCZtbWlvLT5pbnRlbF9tbWlvKTsNCj4g
KwltbWlvLT5pbml0ID0gZmFsc2U7DQo+ICB9DQo+IA0KPiAgLyoqDQo+IGRpZmYgLS1naXQgYS9s
aWIveGUveGVfbW1pby5oIGIvbGliL3hlL3hlX21taW8uaA0KPiBpbmRleCBmMTUwMTdjOTYuLjE3
MTBhMzg0ZiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX21taW8uaA0KPiArKysgYi9saWIveGUv
eGVfbW1pby5oDQo+IEBAIC0xNiwxMSArMTYsMTMgQEAgdHlwZWRlZiB1aW50NjRfdCB4ZV9nZ3R0
X3B0ZV90Ow0KPiANCj4gIHN0cnVjdCB4ZV9tbWlvIHsNCj4gIAlpbnQgZmQ7DQo+ICsJYm9vbCBp
bml0Ow0KPiAgCXN0cnVjdCBpbnRlbF9tbWlvX2RhdGEgaW50ZWxfbW1pbzsNCj4gIH07DQo+IA0K
PiAgdm9pZCB4ZV9tbWlvX3ZmX2FjY2Vzc19pbml0KGludCBwZl9mZCwgaW50IHZmX2lkLCBzdHJ1
Y3QgeGVfbW1pbyAqbW1pbyk7DQo+ICB2b2lkIHhlX21taW9fYWNjZXNzX2luaXQoaW50IHBmX2Zk
LCBzdHJ1Y3QgeGVfbW1pbyAqbW1pbyk7DQo+ICtib29sIHhlX21taW9faXNfaW5pdGlhbGl6ZWQo
Y29uc3Qgc3RydWN0IHhlX21taW8gKm1taW8pOw0KPiAgdm9pZCB4ZV9tbWlvX2FjY2Vzc19maW5p
KHN0cnVjdCB4ZV9tbWlvICptbWlvKTsNCj4gDQo+ICB1aW50MzJfdCB4ZV9tbWlvX3JlYWQzMihz
dHJ1Y3QgeGVfbW1pbyAqbW1pbywgdWludDMyX3Qgb2Zmc2V0KTsNCj4gLS0NCj4gMi4zNC4xDQoN
ClJldmlld2VkLWJ5OiBKYW4gU29rb2xvd3NraSA8amFuLnNva29sb3dza2lAaW50ZWwuY29tPg0K
DQo=
