Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C75C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 06:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EE310E982;
	Fri, 28 Mar 2025 06:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Asw09emc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89610E982
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 06:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743142823; x=1774678823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Oz5tjG8KpljfjT+05GlW2UpHAGNF/Py3rZwkrzjr1Y=;
 b=Asw09emclh+47o90EsJ6evZnGyVxelN5WhGUzKigBsx2O1w8JcKiwNyt
 Ob2Gh8DhJtMffxk+WzQOXR2zpihwvk9nKQ7crr81PdeOVW+dyA8rQuVqv
 //G5zIzzIHOrAtoEyz4dd7e/Hk585Dp8NOaOpMpDDV4tHqsSoQWmopJaF
 kDjCC34dYGSVghfvdr0H+Sa2y2tDBLyKKeDC1ZFA0DVNSX/mBcL6vL0Ai
 5JjZeOQrvZ2Wnts9Qg42f0b9pPASYZ5IQwdAnDJMYkA7+G34DrhBA+ArC
 +5U0yMMVfEiFFynYqwNjejlkoehvS3gTwE2smkDy+djPiA2CzOi3rTxZ5 g==;
X-CSE-ConnectionGUID: ntJTKUzJTzecFboYSPyEvw==
X-CSE-MsgGUID: WsqotTrrQHe0laMGTlwfpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44388141"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44388141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:20:23 -0700
X-CSE-ConnectionGUID: DHbGUX8STzCoRPcmVgA+6w==
X-CSE-MsgGUID: rVWoqYA3SoaB6x0l+V5m6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130071238"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 23:20:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 23:20:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 23:20:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 23:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw5o9uwvL+R4PbMygGKtX7WdoYNk76yYFG6UkZJA+6Pa3nIkumypNenbY1Fu1JISscUSnuSCxmC42WEo93urrng2lA3Vea06G3Ih3gMzcvyEJaX3GUcSBX5+Xzkbaqi2YYlRwihjjMzBXlAX7nkwAifXTwwdW3OIA3x36lL5BFNimqQH6B5Ty+f23UwHmMHLRV7YgVWvFL1klQCfAYmHEZRfXMBvnuQKrXNPMfxVBmaWyZ9fwZMsu98bZo13uKetpHpKB/Y+wJSTegol8qrpYSnIb5wHJQcWmzJtszjUBnttZcJuE06CI5yurGjlKvf0tIqooxAdSbkS5qHaMwffuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oz5tjG8KpljfjT+05GlW2UpHAGNF/Py3rZwkrzjr1Y=;
 b=btSeSJFeL2BtEARYwTD0Gb7ib5w+TxhhAjDOWgrCaf96IqZFhYKoTUGPOWR9HZFbz7WjRXZT4fRlCy0Mqx57lcpIJHVPn6+yICs6KrUaRKcevFbE+s64SvPip2Vh+ToooxPaAZPdKOBm+iT21446k1dkGNrj8OFkqiE4gph+hHNBYA0izTpuqo/lRsAxEaWnXmsyAlG4YNdO88+m/GOj4jXN51Ad4Q/YQ1iaPs1es9Yv/pNRJ5qAT79Derak3M+7EmfNZS74QUT6RCkuBhFVBg8PnYiabdhPn5NOD8V18See0qMrKxPU1gYsc9SlIw/3GPmD7QzthphDouAiYHEKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 06:20:09 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:20:09 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v2 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
Thread-Topic: [PATCH v2 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
Thread-Index: AQHbn6AFR7fGPfq/w0ahKekrhg3Y/rOIEtxA
Date: Fri, 28 Mar 2025 06:20:09 +0000
Message-ID: <DM4PR11MB636064002F90D147AB1940EDF4A02@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250328050959.659508-1-mitulkumar.ajitkumar.golani@intel.com>
 <20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY8PR11MB7135:EE_
x-ms-office365-filtering-correlation-id: 8cc38efe-0ff3-42af-c262-08dd6dc096fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MmpnNURUOVRxbXgydW51MU45U21sY3dyWHByZHJNdW5LbWRUZjVyd2xlRS9v?=
 =?utf-8?B?TEdvVTk0MklTUVRxRjRYciszVWdwZTdYZGdmL3Q0YzlMbHQ1aHc5S2ZBaHNS?=
 =?utf-8?B?Tk04T3l6Z1gxVEJ4U2J5ZURhYU5oOURaYkM3TlRkQ2hNaStUTnE0Zi9oa2xC?=
 =?utf-8?B?emRJbWhCV2lFSFVTd2V1cEowU0tFeFBJMk9zT1ZCb0thZ1h0NXdVdklJa0VC?=
 =?utf-8?B?ZHdUelFCc3Z6Z1JERGJXM2ZlZ2MveFlRL1VKTmlDWFowZmVWTHY5WkMyTEl2?=
 =?utf-8?B?OUZBNWRMcHlwd3RjQkNkTWR5djFNQlJLOTZIVDROOVp2N21ZNWRUMG45VHdr?=
 =?utf-8?B?K2dOY0V2WENBOU1qZHBaYWJXREFMWEJOU1hCeXNIK0pSb0dwU1lBejBZUjJL?=
 =?utf-8?B?bG8yK1NQRG11VEJBWERlYVBHWUZLL3F0bzFkNkFkQjQxVFFqV0tkOHhNQkdQ?=
 =?utf-8?B?eVcvcFllQldJdzBtbUtUdWlla25zNDRDYlVUcjh6K0YrNUwrS0ZWTTE2OGJ4?=
 =?utf-8?B?Q0xpc1FZelVsR3FHTXJpWUhjK2ZHY21Jb2wzZGtwVUNvUEsvdDNLREZqRmtW?=
 =?utf-8?B?OC9RaHdFZ3d4L0JFYlU2YlBtYzAzYlc4MU5EMitXQTJ5VWVEcVp6SHpDSDg3?=
 =?utf-8?B?T01kOE02VGt2b0dYdlF0cy92aW55Q00wWm5JZWE2czZja3JkZG1KbUhDOElu?=
 =?utf-8?B?Y296eVBhWUg2RUFHNXJTY2l5N2t3M3ZHdTVneGt3MGlORTBmYVgxOHJpY01m?=
 =?utf-8?B?MExhTVB4eTZhU1FEYzlzOW1VdVN4cC9ITTEraTdWRzI2dVBPMkMzYUM0MWJJ?=
 =?utf-8?B?dUgrcEl0bzI1V1V3MnRKbkFZbFNwVEZRT1hCNE9CaE16MHFuN2lmSVkzVHJO?=
 =?utf-8?B?R1BCWFdLL2ZqdnRBTnEyckUvZTg3SkgvQnd3ZWh4TTlSbXBReS80cFJEWXZh?=
 =?utf-8?B?RGdnZnUyRUY4WXF0S2c3K3ZMWjZHRHpZdnkza1VpZmdHWHA1WHFuY3BUL0JB?=
 =?utf-8?B?TVdIbDc2bmVnTWhJWkNRa28ybFJUNjhyRkNCRDN2SDUxT012NkE1OUJxTUpw?=
 =?utf-8?B?SXprb1hUb0xQSXRHdStBcm5BRzJVNmc3NExRQXlPbVJ5bDF4YVE0Yjc4MWdU?=
 =?utf-8?B?NjZoWEYzRmdGMlBQUEdacG5yUWRvZ0Z3RytmalN5bnZBd0ZZK3RxUVZQazd5?=
 =?utf-8?B?Q0ZUNjZOekRjK2grem5vWXB4N2dTSXQrRXM2TDBZSGQ4TCtFZ0UyTkNoSm5E?=
 =?utf-8?B?MVM3RlVnNkw0Y1NWMVNtaHJaa2c1VHRTOUkxUmtTdzQwNGlnRjdWaFJKOVNx?=
 =?utf-8?B?TVR1L0g0REJmZk9WOHhQTXI0S1ZVSy9FeFROT0xXMTkvblRTRnFuZUFIMkk1?=
 =?utf-8?B?T0NEWDVCQ1pnejR2QXF2Q0dXWm1Tb05MU3c0QjZ3Z0UxblVFaXo1Ynlad2ts?=
 =?utf-8?B?aU91ckVEWUV0VmRhaGlzUnZJMC9UQ1FXcGdXZE1waDhmMHBtQjZIL3AxYk1a?=
 =?utf-8?B?QWYzUk92MWZxSk55VnFwOEpoSjdEcjlwTnNLTWtoSHBoUzhsS3dyaUVqRVJQ?=
 =?utf-8?B?TFI1NzNKSEV6anpWZU5ZN0d5bFhXQlB3eVNNSHZyZjVyd0VrTktoWFk2UFBw?=
 =?utf-8?B?Q2pUcEtUZ1BJRkxDWXNJeHJkbCtyckVkWXdIdXlnbCsyZzduNGsxbHY3eXNP?=
 =?utf-8?B?c2o4bDZ1cXFrbTFkaGJQdFB2cUw1L1NUelI4aHRHMVV0b2tCR2t1MFNxc2hH?=
 =?utf-8?B?aXI0Z0hmbmtucEJERFdkb2NsUU1GNlVKL1dNZEZuT0J0MXdzOUNyWFAyK2Fn?=
 =?utf-8?B?cEYyd3dTbWR0U2ZRQmM2SnRiOFU3WnF3Q3k2dW03bE5KQkNaMjlzNXFuM3l2?=
 =?utf-8?B?V1I1bUxyR3V3RXhwdWJMVE12N1MwK25vdWxiak5yRGhkNlNFV2pLeE4vdFZt?=
 =?utf-8?B?SXlvL1p2UUdZMzdza0Z5OUtFdFpkWXFqNTNudThadmtJOFJwTnVjM0hFUEJN?=
 =?utf-8?Q?2AxbQnr5TP/9zSatn8mdCaqklBEhBo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3Q1ZndIWXpxLytOSitCMGN6bUhubGw5ZGhUUTg4YldZdjdCenZoZ1poQmNi?=
 =?utf-8?B?WXdoTlVWU0NodzJGWnRJMEU1aDkraHFCMGlJOHhHbTAyVUgyYTBCT3MrZzdt?=
 =?utf-8?B?UG5IZ1d2eVp0S0F3dFBHNmVjY2F6dTJSTjkrZTdEV09GbjhOYjZrb3EvQWta?=
 =?utf-8?B?UzlEbXpKTWg3NGR0Y0NrMldmZzhzekdnOU5MbmIyOGM3YTR3RmQrY0hSQWpX?=
 =?utf-8?B?bGF6VWpIRVFzZlhpcU1EYjdJTnlDQ1JlYTBJSi9YMUZYNGQ1UHQ2clZYZnVt?=
 =?utf-8?B?Y1d3Z2lZU0pSd3lYK2VUbFBlY2NGVU1BajlCL004bmFxL2xZb3BzTnNwOU1y?=
 =?utf-8?B?bFNCWW9nNDIyalY1Tk8wdHlTVGw5Tm9SOHI5RjhYUmVQVjhGdXBHNVlLVEpr?=
 =?utf-8?B?S1Q4NlVCNlY5VWxlbzNwRWVKNnhyK1ZRMnRyOXp5V3h2QmpzanRPTUZ5Mjkw?=
 =?utf-8?B?eVFVWFJXTEFKTndOWUhqSktxNml5bHFyTDRSdEFtdXNjcVdiUFlNMjFQWUNt?=
 =?utf-8?B?Q3ptdkcwcnljZ1NkUnNENkFnemF1b21XTlhwRkpaT2hScDRGNW9mdVc4R3Vr?=
 =?utf-8?B?OTRJNHBmQ0dhallpQUJxODVROUwzZVRKdDI4Y2ZPWGtSbWJCWWtyeWJGQ2tq?=
 =?utf-8?B?N2NKYjRLZVNEWTlWY21wK2ZRY0RmTHVMc1BMVnN6clV2UC8vd1F6d1AvMGZO?=
 =?utf-8?B?MU51S2JHWjBLdHdEeStyRHBWVWdQRVhPSjhkSU50aXkxVTd5WTFFV1pqVHRL?=
 =?utf-8?B?ekQ0NWNHb3BCNGdaM2htemIzbmIrbE5CbTE4R3ZYSzBLbEE2eUo1WWdISnNw?=
 =?utf-8?B?bVpQU28yenJRV0pRck51YTlFYTdGQi8wRklyRDczUnpzdGJRbVh0bVFseTZu?=
 =?utf-8?B?RERUQTI0Q3pWMHZHNThZcUViRktyN3BNcUZ4bzgvenhmU0k0VWRaemxrem9J?=
 =?utf-8?B?ZC9jN2RLNi9XdVpybHRhS09FMjN6L3pucUVSRFdoS3pZTFJPbFdxNUlyclYr?=
 =?utf-8?B?ZGRWZzcycE9CbGQvV1dpUXhhYWFwdFN2aDRPSjU5UmJSZWxrM3hqYnlkcHZu?=
 =?utf-8?B?bllqbGtjOXpCeWJpcFloMFlLdkczUU5zUkFWWTEreXM4Ym54ZjFLQ3E1a3lS?=
 =?utf-8?B?dllkR3RsV3hOSDJocFJ6eW15bDUwY3dHdkJ2d0ZRMEVMY0YzdWlmeTEvb2M3?=
 =?utf-8?B?eXRqY3ZuNkNCNU5QUmIvRS9JZnA0RVZxQ2JQTXhUMi93andxci9vcGhmc0No?=
 =?utf-8?B?cVErMjdTRnlpbE5xc0hLcGxtYnBWL0lDZGR0Mk8yMkxTcE9rc3JPVEM5dXFu?=
 =?utf-8?B?c1FSNXdTTkc2eUtzN1NBRUNWdm1aamtMK0Z3U3UzMVNsT0pmSGNQTzEwanJJ?=
 =?utf-8?B?ZGgzRnFKY3FOQnJZMkFhSUJYSUJRcnVkQTdIZE5RSm5YNzJCSDd2Q2lVWXJO?=
 =?utf-8?B?VkNaS3o1ZnZIRFVPeDlwWStGSVhvajlPQ0Z2VVVpaHJZc2VTVXVUMmtkRHJ2?=
 =?utf-8?B?bzkrM2p4SGcrSWhPL2hyQ3NyazlLNm9xR3hWSXZFUjhkV2V5ZzB6YWZuM3Fj?=
 =?utf-8?B?cTRUdThQR3RQM2VHZ3Nrd3dYWS9zdXlhbzJhZXpSVjlzdUNCM2ZlelFtY3pl?=
 =?utf-8?B?TkZWYXJnekZsYzNGWmtieGl3UUNYNHpKUnV0Wk9GeThwc2lLQTkrRkU2eGdW?=
 =?utf-8?B?blZIRWVNUmpUR1pMRkhWekVUTS8vZnR2aTNmUUZmUUd3anhkU1F1YVZvTzVU?=
 =?utf-8?B?Y0dUMzcxR0xNMnQ0WERGZ0NpaE0wZDhSN09NSllVUCsva2lrbXVSM3Q1UEFn?=
 =?utf-8?B?R1hDb3h6VEdSRzRGcEozT1pVZVMwdTlCdm5xOWFRcFovU0tkSlF2S3h1ZzlW?=
 =?utf-8?B?eWR0L2FHS01uWlZ5YUVZbWlDUG42UzRQRHBqS2ZrU01qb281RU5EazZZd0lw?=
 =?utf-8?B?UnVHWjIwc0pxZmN2UGY3dUlWSU9INm9jb2lJemFkckd5bE5UcklxSmd6WnJH?=
 =?utf-8?B?eDNHSFhUcXF1Yzhpa003ZTF1aFhDQ3IzZ0k3U2tvbEFMODRsZVpjYVFXTlA3?=
 =?utf-8?B?L252RGhnb01jZjRueFhQRDZuSkUxWkphempkSytSS3pUeE45RFVLL1ZvNjho?=
 =?utf-8?Q?nuLj/9lnQDXtqL5U7CLzWnzXf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc38efe-0ff3-42af-c262-08dd6dc096fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 06:20:09.0229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVkPbMzFAmgFy1lbG+r5IG3Jdu7c8N+jUi9Ej7pcSzxa/7ekXXAGEI03cUwQJX1YSD5GETEpVcFuEj9me8Ic3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR29sYW5pLCBNaXR1bGt1
bWFyIEFqaXRrdW1hciA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5pQGludGVsLmNvbT4NCj4g
U2VudDogRnJpZGF5LCBNYXJjaCAyOCwgMjAyNSAxMDo0MCBBTQ0KPiBUbzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwu
Y29tPjsgTmFsYWRhbGEsIFJhbWFuYWlkdQ0KPiA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNv
bT47IEdvbGFuaSwgTWl0dWxrdW1hciBBaml0a3VtYXINCj4gPG1pdHVsa3VtYXIuYWppdGt1bWFy
LmdvbGFuaUBpbnRlbC5jb20+OyBOYXV0aXlhbCwgQW5raXQgSw0KPiA8YW5raXQuay5uYXV0aXlh
bEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzJdIHRlc3RzL2ttc192cnI6IEJ1
Y2tldGl6ZSByZWZyZXNoIHJhdGUgdG9sZXJhbmNlDQo+IA0KPiBSZWR1Y2UgZmFsc2UgZmFpbHVy
ZXMgd2hpbGUgcHJlc2VydmluZyB0aW1pbmcgYWNjdXJhY3kuIEludHJvZHVjZSBhIHNtYWxsDQo+
IHRvbGVyYW5jZSBidWZmZXIgYmFzZWQgb24gcmVmcmVzaCByYXRlIHdoaWNoIGFjY291bnRzIGZv
ciBIVy9TVyBsYXRlbmN5DQo+IHdpdGhvdXQgY29tcHJvbWlzaW5nIHZhbGlkYXRpb24gb24gSFJS
IHBhbmVsLg0KPiANCj4gLS12MjoNCj4gLSBjb3JyZWN0IHJlZnJlc2ggcmF0ZSBjcml0ZXJpYS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pdHVsIEdvbGFuaSA8bWl0dWxrdW1hci5haml0a3VtYXIu
Z29sYW5pQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfdnJyLmMgfCA1MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfdnJyLmMgYi90ZXN0cy9rbXNfdnJyLmMgaW5kZXggYzRiYjMwZjZhLi5jN2Jl
MzdmZjggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc192cnIuYw0KPiArKysgYi90ZXN0cy9rbXNf
dnJyLmMNCj4gQEAgLTQxMCw2ICs0MTAsNTIgQEAgZG9fZmxpcChkYXRhX3QgKmRhdGEsIGlndF9m
Yl90ICpmYikNCj4gIAlpZ3RfcmVzZXRfdGltZW91dCgpOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2
b2lkDQo+ICtjYWxjdWxhdGVfdG9sZXJhbmNlKHVpbnQ2NF90ICp0aHJlc2hvbGRfaGksIHVpbnQ2
NF90ICp0aHJlc2hvbGRfbG8sDQo+ICt1aW50NjRfdCByYXRlc19ucykgew0KPiArCXVpbnQzMl90
IHJlZnJlc2hfcmF0ZSA9IE5TRUNTX1BFUl9TRUMvcmF0ZXNfbnM7DQo+ICsNCj4gKwlpZiAocmVm
cmVzaF9yYXRlIDwgMCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBDdXJyZW50
IElHVCBpbXBsZW1lbnRhdGlvbiBmb2xsb3dzIHRoaXMgc2VxdWVuY2U6DQo+ICsJICogMS4gUGVy
Zm9ybSBhIHBhZ2UgZmxpcCAoYGRvX2ZsaXBgKS4NCj4gKwkgKiAyLiBXYWl0IGZvciB0aGUgZmxp
cCBjb21wbGV0aW9uIGV2ZW50Lg0KPiArCSAqIDMuIENvbXBhcmUgdGhlIHRpbWVzdGFtcCBvZiB0
aGUgZmxpcCBjb21wbGV0aW9uIGV2ZW50IHdpdGggdGhlDQo+IHByZXZpb3VzIGZyYW1l4oCZcyBj
b21wbGV0aW9uIHRpbWVzdGFtcC4NCj4gKwkgKiA0LiBBZGp1c3QgQ1BVIGN5Y2xlIGJ1cm5pbmcg
YmFzZWQgb24gdGhlIHJlbGF0aXZlIGZyYW1lIHRpbWUuDQo+ICsJICoNCj4gKwkgKiBJZiBhIGZs
aXAgY29tcGxldGVzIHRvbyBlYXJseSBvciB0b28gbGF0ZSwgaXQgaXMgbWFya2VkIGFzIG91dCBv
ZiB0b2xlcmFuY2UuDQo+ICsJICogQXMgYSByZXN1bHQsIGFkZGl0aW9uYWwgQ1BVIGN5Y2xlcyBh
cmUgYnVybmVkIHRvIG1hdGNoIHRoZSBgdGFyZ2V0X25zYC4NCj4gKwkgKiBFdmVuIGlmIHRoZSBu
ZXh0IGZyYW1lIGlzIG9uIHRpbWUsIHRoZSB0b3RhbCBmcmFtZSB0aW1lIG5vdyBpbmNsdWRlczoN
Cj4gKwkgKiBCdXJuZWQgQ1BVIGN5Y2xlIHRpbWUgKGZyb20gdGhlIHByZXZpb3VzIGZyYW1lKSAr
IEZsaXAgY29tcGxldGlvbg0KPiBldmVudCB0aW1lLg0KPiArCSAqIFRoaXMgbGVhZHMgdG8gbWlz
Y2FsY3VsYXRpb24sIGNhdXNpbmcgKipmYWxzZSBvdXQtb2YtcmFuZ2UgZGV0ZWN0aW9ucyoqLg0K
PiArCSAqIFRoZSBpbXBhY3QgaXMgbW9yZSBzaWduaWZpY2FudCBvbiBIaWdoIFJlZnJlc2ggUmF0
ZSAoSFJSKSBwYW5lbHMsDQo+IHdoZXJlOiBUaGUgYWxsb3dlZCB0b2xlcmFuY2UNCj4gKwkgKiB3
aW5kb3cgaXMgc21hbGxlciBhbmQgbW9yZSBjb3JyZWN0aW9uIHRpbWUgaXMgcmVxdWlyZWQuIGku
ZS4gZm9yIDIxMGh6DQo+ICg0Ljc2Mm1zKSwgYWxsb3dlZCByYW5nZSBpcw0KPiArCSAqIDIwOWh6
KDQuNzg0bXMpIHRvIDIxMWh6KDQuNzM5bXMpLiBUaGlzIGNvbWVzIGp1c3QgMjMgbWljcm9zZWNv
bmQNCj4gdG9sZXJhbmNlLCB3aGljaCBpcyBtdWNoIGxlc3Nlcg0KPiArCSAqIGZvciBhY2NvdW50
aW5nIEhXL1NXIGxhdGVuY3ksIENQVSBidXJuIGN5Y2xlIGxhdGVuY3kgYW5kIGNvcnJlY3Rpb24N
Cj4gbG9naWMgYXBwbGllZCBpbiBpZ3QgZm9yDQo+ICsJICogdmFsaWRhdGlvbi4NCj4gKwkgKg0K
PiArCSAqIFRvIGFkZHJlc3MgdGhpcyBpbXBsZW1lbnQgYSBCdWNrZXRpbmcgU3RyYXRlZ3k6DQo+
ICsJICogUHJvdmlkZSBhIHNtYWxsIHRvbGVyYW5jZSBidWZmZXIgdG8gYWxsb3cgSUdUIHRlc3Rz
IHRvIGFjY291bnQgZm9yDQo+IGNvcnJlY3Rpb24uIGJhc2VkIG9uIHJhbmdlIG9mDQo+ICsJICog
YXNrZWQgcmVmcmVzaCByYXRlLiBUaGlzIHByZXZlbnRzIGV4Y2Vzc2l2ZSBmYWlsdXJlcyBkdWUg
dG8gbWlub3IgdGltaW5nDQo+IGFkanVzdG1lbnRzLg0KDQo+ICsJICogQWx0aG91Z2ggYW4gaW1w
ZXJpY2FsIG51bWJlciBidXQgYWxyZWFkeSBJR1QgaXMgbGl2aW5nIHdpdGggdGhhdC4NCj4gKwkg
KiBUaGlzIGFsc28gZW5zdXJlcyB0aGF0IGFza2VkIHJlZnJlc2ggcmF0ZSBpcyBub3QgdG9vIG9m
ZiBhbmQgYWx3YXlzIGNhdGNoDQo+IHRoZSByZWFsIEhXL3NvZnR3YXJlDQo+ICsJICogbGF0ZW5j
aWVzLg0KDQpGb3IgdGhpcyAiQWx0aG91Z2ggYW4gaW1wZXJpY2FsIG51bWJlciAuLi4uLiIgDQpU
aGlzIGNhbiBiZSBhZGRlZCBpbiBjb3ZlciBsZXR0ZXIgb3IgcGF0Y2ggaGVhZGVyLCBubyBuZWVk
IHRvIG1lbnRpb24gdGhpcyByZWFzb24gaW4gY29kZQ0KY29tbWVudCBoZXJlLg0KDQpUaGUgQ2hh
bmdlIGxvb2tzIEdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT4NCg0KPiArCSAqLw0KPiArDQo+ICsJaWYgKHJlZnJlc2hfcmF0ZSA8PSAx
MjApIHsNCj4gKwkJKnRocmVzaG9sZF9oaSA9IE5TRUNTX1BFUl9TRUMgLyAoKChmbG9hdClOU0VD
U19QRVJfU0VDIC8NCj4gcmF0ZXNfbnMpICsgMSk7DQo+ICsJCSp0aHJlc2hvbGRfbG8gPSBOU0VD
U19QRVJfU0VDIC8gKCgoZmxvYXQpTlNFQ1NfUEVSX1NFQyAvDQo+IHJhdGVzX25zKSAtIDEpOw0K
PiArCX0gZWxzZSBpZiAocmVmcmVzaF9yYXRlID49IDEyMCAmJiByZWZyZXNoX3JhdGUgPD0gMjQw
KSB7DQo+ICsJCSp0aHJlc2hvbGRfaGkgPSBOU0VDU19QRVJfU0VDIC8gKCgoZmxvYXQpTlNFQ1Nf
UEVSX1NFQyAvDQo+IHJhdGVzX25zKSArIDUpOw0KPiArCQkqdGhyZXNob2xkX2xvID0gTlNFQ1Nf
UEVSX1NFQyAvICgoKGZsb2F0KU5TRUNTX1BFUl9TRUMgLw0KPiByYXRlc19ucykgLSA1KTsNCj4g
Kwl9IGVsc2Ugew0KPiArCQkqdGhyZXNob2xkX2hpID0gTlNFQ1NfUEVSX1NFQyAvICgoKGZsb2F0
KU5TRUNTX1BFUl9TRUMgLw0KPiByYXRlc19ucykgKyAxMCk7DQo+ICsJCSp0aHJlc2hvbGRfbG8g
PSBOU0VDU19QRVJfU0VDIC8gKCgoZmxvYXQpTlNFQ1NfUEVSX1NFQyAvDQo+IHJhdGVzX25zKSAt
IDEwKTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gIC8qDQo+ICAgKiBGbGlwcyBhdCB0aGUgZ2l2ZW4g
cmF0ZSBhbmQgbWVhc3VyZXMgYWdhaW5zdCB0aGUgZXhwZWN0ZWQgdmFsdWUuDQo+ICAgKiBSZXR1
cm5zIHRoZSBwYXNzIHJhdGUgYXMgYSBwZXJjZW50YWdlIGZyb20gMCAtIDEwMC4NCj4gQEAgLTQz
OSw5ICs0ODUsNyBAQCBmbGlwX2FuZF9tZWFzdXJlKGRhdGFfdCAqZGF0YSwgaWd0X291dHB1dF90
ICpvdXRwdXQsDQo+IGVudW0gcGlwZSBwaXBlLA0KPiAgCQllbHNlDQo+ICAJCQlleHBfcmF0ZV9u
cyA9IHZ0ZXN0X25zLm1heDsNCj4gDQo+IC0JCS8qIEFsbG93IH4xIEh6IGRldmlhdGlvbiBmb3Ig
ZGlmZmVyZW50IHJlYXNvbnMgY2F1c2luZyBkZWxheS4gKi8NCj4gLQkJdGhyZXNob2xkX2hpW2ld
ID0gTlNFQ1NfUEVSX1NFQyAvICgoKGZsb2F0KU5TRUNTX1BFUl9TRUMgLw0KPiBleHBfcmF0ZV9u
cykgKyAxKTsNCj4gLQkJdGhyZXNob2xkX2xvW2ldID0gTlNFQ1NfUEVSX1NFQyAvICgoKGZsb2F0
KU5TRUNTX1BFUl9TRUMgLw0KPiBleHBfcmF0ZV9ucykgLSAxKTsNCj4gKwkJY2FsY3VsYXRlX3Rv
bGVyYW5jZSgmdGhyZXNob2xkX2hpW2ldLCAmdGhyZXNob2xkX2xvW2ldLA0KPiBleHBfcmF0ZV9u
cyk7DQo+IA0KPiAgCQlpZ3RfaW5mbygiUmVxdWVzdGVkIHJhdGVbJWRdOiAlIlBSSXU2NCIgbnMs
IEV4cGVjdGVkIHJhdGUNCj4gYmV0d2VlbjogJSJQUkl1NjQiIG5zIHRvICUiUFJJdTY0IiBuc1xu
IiwNCj4gIAkJCQlpLCByYXRlc19uc1tpXSwgdGhyZXNob2xkX2hpW2ldLCB0aHJlc2hvbGRfbG9b
aV0pOw0KPiAtLQ0KPiAyLjQ4LjENCg0K
