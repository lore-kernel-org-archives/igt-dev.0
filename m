Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E9C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 05:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13C10E4D3;
	Wed, 15 Jan 2025 05:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bS8WLFjs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901C310E4D3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736919501; x=1768455501;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=zV9sDPzXC6tS5ocgjz9/sRcH68JqOQs8AntA0erphkQ=;
 b=bS8WLFjsnXE2uutwgBoz68tiYBOTxDyPkMn8BY1vJUNbxzVG6EULL4Pc
 e4V995SUowCRwaU77newkqjEB9+kikVcYDOOi0QvVH+6bRsvsQd92nyVY
 ZlleoyVBKYEHT0gY/jz6Gsj9tIblF8WlpU/82KpskcyeTHeOxXFk/ivqN
 RYH5BEzwIoI9O3KFcfzjwZM0q9PcvUmJbo7xCE9BQB3P2x6EH5SrNOe5J
 Pmaqa9LCLvROMzAiYZ5wfGRZJMzFuCUnNlS747nq9OPX+Zgephbq3vMgR
 I2FAe1aYVvdvYj22/pPqcsTU2JElLel+mWLMrGyPEhycAUnqDqm4H4xFu g==;
X-CSE-ConnectionGUID: 7O4zmQz4QqyUQQl2m5v9Rg==
X-CSE-MsgGUID: N+QIGxH3TpSoSxz01hesUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37401071"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="37401071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 21:38:21 -0800
X-CSE-ConnectionGUID: 3fCjcRU9RBSROk2MIiGkCg==
X-CSE-MsgGUID: qm6x5v9kRcO+nOoLtl3Uog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109646317"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 21:38:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 21:38:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 21:38:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 21:38:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONOLPkih8JXCpq9f0QT8Z/U8giVwrCVNh47TYJiF8jX12THOrBdkZFn1RpCZcAgS/LXXce5+2mJ0RWuMtbHPgCXnCHc2e/9cs5mvQmclw2HkIrJvtt/VrOYcbwRS2tKfbKn2BVUW401gwYPylW+QzZOzj9t9W67M55tnwkXTwvt9LNXqHVDwdW1vNolsCAY7xIJSGqM59HMZskSHbR/NCfgB05IN9q4TplTer4G/vdr9a5Ek+FWqaIU7DaZFtonIUN8LehqIKd3PJabRBkht6Xt5d1Li9/Sg2pGBEpc2cbbNX1rHoRxwBq5beguLH8a40b9iXYoNRGCe1Q/LiOrOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV9sDPzXC6tS5ocgjz9/sRcH68JqOQs8AntA0erphkQ=;
 b=au1+FpptAj770e/JzRiwBLiHdgpSssVfiuzOsZBCzghGhllaOZFx32zP73tZ06N9qZ4NtbB4D75K6fbGVzqMwiXBaCE99g7lZACRiwThtYgiYJ8/caqViBLe1CjSGcR40ctDorK8xxTbcFxNw7KKsdZ/fLjMByZI5rsE0C5XxnY8KUz8gM/QVSoi8yikeOpjPjinsIRJUNYlMFx8SiATpxMUu8lEEQ8u9me+UUqf78CDj09YDhMQEzyNi36X954C+xmHy+Sxy4V1xepdPDIr0xbVNBWBnEbymTZxpGxzG41sPLbuHeeTe4jhAvu0lLSYWtsCM3a+mZ68bLKmJJMlTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Wed, 15 Jan 2025 05:38:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:38:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t 3/7] tests/intel/xe_query: Add test for PXP status
 query
Thread-Topic: [PATCH i-g-t 3/7] tests/intel/xe_query: Add test for PXP status
 query
Thread-Index: AQHbTCty62J++LXNeU6blgbgrcKyOLMXhv+A
Date: Wed, 15 Jan 2025 05:38:16 +0000
Message-ID: <77885790bca81c9cd4030ee784147c3fa632247b.camel@intel.com>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
 <20241212001829.2082490-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241212001829.2082490-4-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB5861:EE_
x-ms-office365-filtering-correlation-id: 0900d13d-2803-43e5-e343-08dd3526cf61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THFTcVIxVDhQQktQSGw4Wk5LbFZySGxMU3dMWGhHS1VUTUo2aWFlTHc3SFpj?=
 =?utf-8?B?dU4vNnArK0E0TjMzVlppeEpxZW9KSWpSbDBObjR1MWtyQUZ3REMzNzFMNkNp?=
 =?utf-8?B?WHFnWHVRenRTTmJrMjdhV25SMm9URVJFRDFQZ1pMOGJubXM5eTNkSCtrWjFC?=
 =?utf-8?B?M0J2Z0w2VjVveVh3cXBOYmswVnNSZjltb05oWGtySERqRTZLamMxNFQzRHJM?=
 =?utf-8?B?NkU5K0pXZUtTRXpUL1NJS1ZpSHV2VlhhTm5oZ01JcXFScXJyZ1BzT24xRjNX?=
 =?utf-8?B?NGdBU0o3ZmdiRHdERmZwNXdmQVNDZm1OMXBpZ0w3NHVDOU9zTU12M0F0aXpJ?=
 =?utf-8?B?K3JhaS9HS2dBdkRJUlh3RGpBUnB0NlJ4K3JKd3A5L1FFWVZuUXU4em9JRnlM?=
 =?utf-8?B?YWZqdnVFc0o5cExkdDE4bUFkRVRXWVNaWDdFWlI0ZzlKQzdDU0N0bXVoUU83?=
 =?utf-8?B?MTE2SUoxQUdrNGdIZ0lrZmNxY0NVeWYyYXk5M2R3alc4dUdza0lSVXAwWU45?=
 =?utf-8?B?N0RmNlF0U09qM0RrTnpXYm9LcEVyMk1LYVdqN09BVmp0RnBJMUpQZXl1aUxi?=
 =?utf-8?B?aUk0N3ZITldjTmpHbXJQQ3l5akRzeG4rRzlkclFSYjVEZVB5S01oRGxPVHgx?=
 =?utf-8?B?ZmtIK2VFdXdaL3dXb0xwc0xOZUwxTzQ3L2F0RDBmUzdkZUtQOUY5SXBWRG9i?=
 =?utf-8?B?WHR6dHNrRytNMElXcTc2UVFFZ1k5aDBvVHVXcThZczRoR3pTVHRWbEFpaFpX?=
 =?utf-8?B?QTVRQ0p4WGxTMDdiZERiRXltNlFwZlVyaUgwL3NhZ0FwN0ZtTU1rUW1YbnF0?=
 =?utf-8?B?Y2VsQjJlL29Bd1BjcXFjL3h0dWZKbzFYeWtSS0tJSUZROHM0WTVTZHA4MUQw?=
 =?utf-8?B?WHl0K1Z4ZnE2Nk5OQVh4eDhYbTFSZHBpbktjS1YvWmJZSmQ0S1lick13Ly91?=
 =?utf-8?B?Rm1JUHA3ZEN1aFdNcGJ0NzQzeE1wU0s4SSs2WXFHK2Z2ekEwODNlYmpaU2hH?=
 =?utf-8?B?ZkN2Q2RTT2JWaEFGOWxubVRYYUE5eDNlS0d4UkY0aFp6MHZqSEtLUWNoaDFZ?=
 =?utf-8?B?RUE5SURmSm82Mnh3Zm0xdzMwRHFZRzRJeDJqQWIvWWZrYkFSaHhjdUhVSGNT?=
 =?utf-8?B?YUY5K2U4eFQ5QmE2ZDV5eXdqanJqWUo1QmlPUEhuYnpVb3pmVnNLMzQ2Tmx0?=
 =?utf-8?B?a2t2TUpvVkVUVlE5M2FuSEJZZVJmV0h1SVRacGRVTExDZysybU5EU3FwK3FK?=
 =?utf-8?B?cWNOeTRsTWpNUWxlek9rQUVua09QdXFJVU9jMXkxSEJKWW1wU2F0c0kxVkpV?=
 =?utf-8?B?cnpuNVJCSDdpVjgwOEdMK0E1aUNJcndGL0tjeDdSMnROcWVLK1hpVFUvMHJP?=
 =?utf-8?B?S3p3L3E0NUtIR3h6SXhiZHl4VW5qTk5UMHJ0WXAxaVd5SVpwanJOMUl2cXBo?=
 =?utf-8?B?RmVNd242am5PNDV6RVNYc05iZ3l4UCtFd3ppQVlGMkhQRDlIajIzMVp1eGVK?=
 =?utf-8?B?WkV2QVpjaEU1UkRyY0VybGpsNVk5dlZSeDROVStmSjJOK04yaXYyZC9LZkMx?=
 =?utf-8?B?b1U4cWxHSFRyY0llaUM2OCsvaDd5Q295cGlCVDc0ekhnbFcyd05TVlJRMlkr?=
 =?utf-8?B?TzZTVnlWWkJJUXBITFVzYnFXRjNabmlHMjcvZmdPdlJlYkppNlNFZEgwQkZH?=
 =?utf-8?B?dytvczU5ckYwRTBnUE91OUpPd053N2x4cUtZWDFlRC9FcGRzWUZkYzcvbkxa?=
 =?utf-8?B?bnRodjluK0tvYytYSXFnYXpON3ZqTm05ZHpCZ281Q1o0SlhXL1pMNHpRY2sy?=
 =?utf-8?B?d3lJRU5hYWZZTU13OWg0RmxXLzUwdXAxRXgyME5JS2g4UFgwWDE4VlhmcUND?=
 =?utf-8?B?eU9OVDlZNjVrUmUvMjBEM1VLWVRQeXRmbUNOVzlSQkc1RUlsS212Y1NKb3pt?=
 =?utf-8?Q?w4YEiq087/ypjvC2LGhhifkZWx4tsDpL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3MyWmUxcGEyRWo2QU01SzBybUJORWRBZXdHbXc5VWp1OXlPS2RUQXZScEZR?=
 =?utf-8?B?eUx3Mm1MUWRTdmI4UXpVUVREWkFMY0R1akMxVHBHaHFVYjlOUXhmbmViSWht?=
 =?utf-8?B?anlSOWdBcU9tUnU0UXJsYVY1UnQyZFRUZ1lNNzFlNVJwYm5QU3R1SlV4QTJW?=
 =?utf-8?B?WHkyVk5pTEJRdVlhcDRFYk5ySUdHa0lKalQzNUVSZGZKbDBobmdSUGpxNWlW?=
 =?utf-8?B?dUtRSUlwM0RqN2dMNTg1cVBrUUt0N2cvaEduUVJFeHUySm45OWdueTI2UTd1?=
 =?utf-8?B?eVJMNWYrMjJoSUVGcWxNcTB0VU9FVlRKdE9meGJKWUp3b2hDVlI2Vi9HWHJ4?=
 =?utf-8?B?MEkrQmRQUWR5a1pVeVdxK1pMQWJsRk40U20xRVRNeUtKVS9KVURkaEhPOW1X?=
 =?utf-8?B?T1NzOTYrektnRUJtTWtGenFzclNkeWp3dFZYb1ZaQjJscG9SMy9MQTBwL01x?=
 =?utf-8?B?dnNXMEt1aXBPaFlhQjIwZC8wRHpPa2VjUGtsVHdzRm90dUZOaDVreWx6VkpF?=
 =?utf-8?B?V3V6SHdCWkhWRDI4THRwTnlucy9MSmR1UXpyNWF0aldpdWxTam1GRXprNCtW?=
 =?utf-8?B?MWVxT0pMUGNQQVEvZWZ2OTdMM0UvVXRTZzQyNXpyaFR3eW1SVCs0d0EyZmh1?=
 =?utf-8?B?Z0xzSDg1WjgwY1JJVTh1TWtGNzdmc2Z1YUhQNjVtOFA5dkFzRzVuUjJrL2xW?=
 =?utf-8?B?MzR6Z0o1SnZzbTVEejladURERkRsd2kxaVMxRXFEN25jRGEwd2JQaUhESVEx?=
 =?utf-8?B?dW4rZVgyRDJFbU52V2NLYVd0L1J5TThWRDVHa3BXWHF2WnFmU2JJK0N5OEFp?=
 =?utf-8?B?anVrRno4VUFSaG9sRnZFL3ZzcTVDNjdUWDZWQ1pKNnAvczdPcDFzbXRxZldG?=
 =?utf-8?B?eFhYZzZVMUFGTmtGQ0hSVlhCejBoVWRvRlRnMXlMamlFSXdLWFNBTDVzeVQ5?=
 =?utf-8?B?bnRXd0ZFWThreXBmZlM5VjdmNll6Y3dxVFEwUG1oODFiSUI5MXBJVVE2RnRw?=
 =?utf-8?B?bHhBVkdsOTRkSGZsVkQrTGo5VmlqY1Fpc1c3T2FRRndNYm0vNE5DZ2dIT0VZ?=
 =?utf-8?B?anhWWWY4RjZrU2hiUmNidVFRaTFNKzJyZ2lyUkNPU2ZYaEc3RGtTTXJmaVY5?=
 =?utf-8?B?SEgxK1dUOEpuOS80V3FPL3VRQ2ZwQnNVb0R1Vnc0cHd5bUwxVXVEdk5QMnUx?=
 =?utf-8?B?N0trYkFuaGc0NXJtMlQ2cDlhVVBjaEVaMWNUUEZNanF3K0pNdDhCdlA2OEtn?=
 =?utf-8?B?dndESXlHNlduNDZNc050a0pMWHlMSStaKzN2V3JXRitOQVA1WkEyT1dMNkZu?=
 =?utf-8?B?Z0pZN2VxRWp5dlBRcHluSjE3OGRzWVphU3l6MzF2bWkvM2J5c0F0aW1mK1B5?=
 =?utf-8?B?TGhVYklNR3RjY3d3M01SR0FZRXVUbjNWNlFtemVxcEhRSVhGZ3hzWTlsaG1K?=
 =?utf-8?B?ekkyMHZHOTRiR05kTkhqNHVidUFXaG9ucW8xc0hmUTVYZ0JYWmZPTTI3d0Nn?=
 =?utf-8?B?SFFZY3JDclpZREJ1T1R4UXFlNWNuNzRZNXhFRW8yTTFWZXpHYmp0R2xwM1Vl?=
 =?utf-8?B?NmtLZkNseHNicDV6aEEvZ3R0cFZ6U21YQUtwOGsyOHFEZUMyQnp0R291NjRJ?=
 =?utf-8?B?QzJwS2c4a3Uza2k4aENjUHpvSno5WmV3eXhtbW1EajFROHlFYzdqMG5XQitL?=
 =?utf-8?B?S29ncy9GeWJtSGN3bWRkaERndlB5eUlUOG9IcWlMVnR5OUdnR2llNVpUaGFI?=
 =?utf-8?B?bDBEZHBpam1tSVRmdElBeFk3NDhyZExDMk9VTmJWMVJDMGU5L3FnNmpmeURU?=
 =?utf-8?B?VmZSTUFlelZRQjlja21ZdUE0TzdYOWNrblNBbXdLNDdLdzNsalI0NGJOaG16?=
 =?utf-8?B?OHFranI5MDJ6aUxDaEljSGxDK08zM2gvNE1yTUEvb2ZxdlFHL2Q4L1l3U1gr?=
 =?utf-8?B?a2JJT0YvTy9CVWtMaDk2bHc2UHFEM3BoMlNJeFN1NTYrSUFEeStUVlVmWm82?=
 =?utf-8?B?ZmdzTEZaZ0xPcDJFbVFUaGZ5cFN0eVAvWGpiUFpLY0hnSWJkaWMwYmlhQ0lV?=
 =?utf-8?B?NGZIR0kyZXl5VEdMY2MwaFhGTkphbURRUVB3aEJnSi9Eazd3dDZRV2dlelJC?=
 =?utf-8?B?Mm1WWjRqMG5yWTUxUUlVRVYwYXFSTHRsTUl3d3RsWDA3RlFmUnZhMk1WVmYz?=
 =?utf-8?Q?oEkCaNifBbRSsU7XVY7ZGys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A44AAA4DE5207945A4CC991ECDDC2407@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0900d13d-2803-43e5-e343-08dd3526cf61
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 05:38:16.0589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+BE/bWTA2neW3ya39Rq9C/SvO9zH5GXNs5JWrJcx2U5qH92lDVtWCIuj6QDjE9/03WGDIFd8LmtVD7lakNGh00OP/dUnT/wqhJDCTQygi29m2zWzgorLc/TarvbtZx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
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

bG9va3MgZ29vZC4KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5h
bGV4aXNAaW50ZWwuY29tPgoKT24gV2VkLCAyMDI0LTEyLTExIGF0IDE2OjE4IC0wODAwLCBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOgo+IEFkZCBhIG5ldyB0ZXN0IHRvIGV4ZXJjaXNlIHRo
ZSBQWFAgc3RhdHVzIHF1ZXJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBT
cHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gLS0tCj4gwqB0ZXN0cy9p
bnRlbC94ZV9xdWVyeS5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jIGIvdGVzdHMvaW50ZWwveGVfcXVlcnkuYwo+IGlu
ZGV4IDE1NjY2ODBlNy4uMGEyZmY4ZDdmIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3F1
ZXJ5LmMKPiArKysgYi90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jCj4gQEAgLTEwNzcsNiArMTA3Nyw2
NiBAQCBzdGF0aWMgdm9pZCB0ZXN0X3F1ZXJ5X29hX3VuaXRzKGludCBmZCkKPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgfQo+IMKgCj4gKy8qKgo+ICsgKiBTVUJURVNUOiBxdWVyeS1weHAtc3RhdHVz
Cj4gKyAqIERlc2NyaXB0aW9uOiBEaXNwbGF5IFBYUCBzdXBwb3J0ZWQgdHlwZXMgYW5kIGN1cnJl
bnQgc3RhdHVzCj4gKyAqCj4gKyAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LXB4cC1zdGF0dXMK
PiArICogRGVzY3JpcHRpb246IERpc3BsYXkgZmllbGRzIGZvciBQWFAgdW5pdCBxdWVyeSBmb3Ig
YWxsIFhlIGRldmljZXMKPiArICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQo+ICsgKi8KPiArc3Rh
dGljIHZvaWQgdGVzdF9xdWVyeV9weHBfc3RhdHVzKGludCBmZCkKPiArewo+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCBkcm1feGVfcXVlcnlfcHhwX3N0YXR1cyAqcXB4cDsKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSBxdWVyeSA9IHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLmV4dGVuc2lvbnMgPSAwLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAucXVlcnkgPSBEUk1fWEVfREVWSUNFX1FVRVJZX1BYUF9TVEFUVVMsCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5zaXplID0gMCwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLmRhdGEgPSAwLAo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gK8KgwqDCoMKgwqDC
oMKgaW50IHJldDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBp
ZiB3ZSBydW4gdGhpcyB0ZXN0IG9uIGFuIG9sZGVyIGtlcm5lbCB0aGF0IGRvZXNuJ3QgaGF2ZSB0
aGUgUFhQCj4gK8KgwqDCoMKgwqDCoMKgICogcXVlcnksIHRoZSBpb2N0bCB3aWxsIHJldHVybiAt
RUlOVkFMLgo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGVycm5vID0gMDsK
PiArwqDCoMKgwqDCoMKgwqByZXQgPSBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0Vf
UVVFUlksICZxdWVyeSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoZXJybm8gIT0gRUlO
VkFMKTsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoC8qIG1ha2Ugc3VyZSB0aGUgcmV0dXJuZWQgc2l6ZSBpcyBiaWcgZW5vdWdoICov
Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChxdWVyeS5zaXplID49IHNpemVvZigqcXB4cCkp
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqBxcHhwID0gbWFsbG9jKHF1ZXJ5LnNpemUpOwo+ICvCoMKg
wqDCoMKgwqDCoGlndF9hc3NlcnQocXB4cCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG1lbXNldChx
cHhwLCAwLCBxdWVyeS5zaXplKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcXVlcnkuZGF0YSA9IHRv
X3VzZXJfcG9pbnRlcihxcHhwKTsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBpZ3RfaW9jdGwoZmQs
IERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlksICZxdWVyeSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYg
KHJldCA9PSAtRU5PREVWKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9p
bmZvKCJQWFAgbm90IHN1cHBvcnRlZFxuIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybjsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlndF9h
c3NlcnRfZXEocmV0LCAwKTsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X25lcShxcHhwLT5z
dXBwb3J0ZWRfc2Vzc2lvbl90eXBlcywgMCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHN3aXRjaCAo
cXB4cC0+c3RhdHVzKSB7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSAwOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZ3RfaW5mbygiUFhQIGluaXRpYWxpemF0aW9uIHN0aWxsIGluIHBy
b2dyZXNzXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8Kg
wqDCoMKgwqDCoMKgY2FzZSAxOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rf
aW5mbygiUFhQIGluaXRpYWxpemF0aW9uIGNvbXBsZXRlXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdDoKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9mKDAsICJ1bmV4cGVjdGVkIFBYUCBz
dGF0dXMgJXVcbiIsIHFweHAtPnN0YXR1cyk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZ3RfaW5mbygiUFhQIHN1cHBvcnRlZCB0eXBlcyBtYXNrIDB4JXhcbiIsIHFw
eHAtPnN1cHBvcnRlZF9zZXNzaW9uX3R5cGVzKTsKPiArfQo+ICsKPiDCoGlndF9tYWluCj4gwqB7
Cj4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCB7Cj4gQEAgLTEwOTQsNiArMTE1NCw3IEBA
IGlndF9tYWluCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJxdWVyeS11Yy1m
dy12ZXJzaW9uLWd1YyIsIHRlc3RfcXVlcnlfdWNfZndfdmVyc2lvbl9ndWMgfSwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInF1ZXJ5LXVjLWZ3LXZlcnNpb24taHVjIiwgdGVz
dF9xdWVyeV91Y19md192ZXJzaW9uX2h1YyB9LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeyAicXVlcnktb2EtdW5pdHMiLCB0ZXN0X3F1ZXJ5X29hX3VuaXRzIH0sCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInF1ZXJ5LXB4cC1zdGF0dXMiLCB0ZXN0X3F1ZXJ5
X3B4cF9zdGF0dXMgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInF1ZXJ5
LWludmFsaWQtY3MtY3ljbGVzIiwgdGVzdF9lbmdpbmVfY3ljbGVzX2ludmFsaWQgfSwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInF1ZXJ5LWludmFsaWQtcXVlcnkiLCB0ZXN0
X3F1ZXJ5X2ludmFsaWRfcXVlcnkgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHsgInF1ZXJ5LWludmFsaWQtc2l6ZSIsIHRlc3RfcXVlcnlfaW52YWxpZF9zaXplIH0sCgo=
