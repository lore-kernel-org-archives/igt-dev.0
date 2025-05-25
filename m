Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18802C54E90
	for <igt-dev@archiver.kernel.org>; Sun, 25 May 2025 15:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71410E04E;
	Sun, 25 May 2025 15:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtOm9/PZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8DC10E04E
 for <igt-dev@lists.freedesktop.org>; Sun, 25 May 2025 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748188649; x=1779724649;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=d0s1K0qj0vSXampXZTeTmC3IU7ICqKNTo0w8L0pQQVo=;
 b=OtOm9/PZsNLnpek/wEHlDsms1SDk4bB32EzqtG7XuLSiWDw4pkI1YgWl
 Gh4VsLwQGifkN/VuW4Ff+xiM2eXcQbsIbhCLVUCEAX2j7yPHybEOG1r6C
 EnfoeTjhPLpe4qypHs52JZP76kqG60l7Dt6ne4OnO57AHyD+9ec6KkRWN
 Z4wkAmdJ2sX9YLZ9dQwvKGjWvepTL9U/69hxHY/7hMTM7xAMwXaNkY4+l
 k1oUpAV8YlCDZu8jBvbTQWCsjpiM8Q8vD3MkjP9ZsLCfMjtzxY7mdYav4
 RzP2LfROGxmYZ+YQEY5RHxcOFDaQXJ6SaTrzAU4HpbZiGsS1deB8VM8Dt A==;
X-CSE-ConnectionGUID: BmkWKFvGQiGF1IhmkLjiqA==
X-CSE-MsgGUID: sBfMHUhNRJyjGUEm8pXiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60803353"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; d="scan'208";a="60803353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 08:57:16 -0700
X-CSE-ConnectionGUID: zMrb4/aVSLStJXmdKm2K3Q==
X-CSE-MsgGUID: KUFIxxqhTamqGH+wfFHELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; d="scan'208";a="142919469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 08:57:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 25 May 2025 08:57:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 25 May 2025 08:57:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sun, 25 May 2025 08:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yadjd+rfXJ5S0gO/NyAduYdzVys1z/dR4TYWBTtfo0k4aVy4xZsglTyWxx6hvZ8v7qTR8JUM5JG6cpjnszlk8PPXExyzoqSLcJ5UTOR8pL3cYwlY1bj2t9gFChbvnSjKco1HkG8ARelH7lEhLPhTt5PBdw+7oeiggiutTcs80p6IKJ1n+uBOxznG6Nt36rYtAw0JzToPyCoH7PazYU2+lPREm9bWSE4WrqM1+GvIfuFmcXCdShLlBxjeEfaB2KjuiCMcqfaTYHKEKLJM1yp24wWWXG0VoMTSG2YI7G4wp3q+SpiJR7BIcLHe3eIqpv/eG4mHQeVAW4jEx+cci2S2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0s1K0qj0vSXampXZTeTmC3IU7ICqKNTo0w8L0pQQVo=;
 b=UnC8fB8GP56A37OZ7AezJ9pDAu6x85gnn4OPTZfa+IO3nhYnIY548GyVQBObeGxd6F4Rcfb7LY3Yee6SvGnnAfL150aUzomnhqsLRCsnD2kA8J15LsK785S8GhOONGKqM2jzHrP/ZuQhxFg7hAN1e91KuWfJTsmH83YQXEz4lxcNt05Y9i6in+U3qbxrXs3IioDEd6hr6p3yCOr97tuCSYURLK1HnPrNOqux2P3MR4QtiEXtAnQOR4yk2CqCJ1VTSCFxICAKACJVANr9543mDGRHKDcKQpUEba5ax/y8i2rjzyrm/p58wcNaGiz6wX4AoOEzNZ1kU0HxP+juS8/F8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Sun, 25 May
 2025 15:56:29 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8769.019; Sun, 25 May 2025
 15:56:29 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs
Thread-Topic: [PATCH v2 2/2] tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs
Thread-Index: AQHbyLoWinOaqXZEWUyTKAP2b5t2rLPjibCA
Date: Sun, 25 May 2025 15:56:29 +0000
Message-ID: <97f2e78fdd540ce59d13a27c736741673486a59f.camel@intel.com>
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
 <20250519123135.1307174-3-mohammed.thasleem@intel.com>
In-Reply-To: <20250519123135.1307174-3-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MN2PR11MB4728:EE_
x-ms-office365-filtering-correlation-id: 5f8a0665-a481-4434-1aca-08dd9ba4b64d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmVrVDA5bkFHM3BuMHRlVVgrejBjckI3ajR6UUhmN2lyZnV5Z2lJUXJzY3Nv?=
 =?utf-8?B?VVR2aHo4U3p6bUY1RWNTeU42RUF0ZE9GQy9HKzRLTmpob3FPQ3E5RFZNbVhi?=
 =?utf-8?B?TTdnNTZZMmkzR3VmWkxZd0JCbXVMK2JOVURneFdsYlR2LzcxZ1p5cFhUdGFl?=
 =?utf-8?B?SHdMY29QOTExcGtxcnZVUlgzN1VLWHRVL3NnTXVCR1ZZNEo3VGpYdXovbnhy?=
 =?utf-8?B?QVdwaUhySkl0VXFvK09ydXZyMndSSlRRRUppOHAvY1RpM1UrM3gyQmxhTE42?=
 =?utf-8?B?WWZoWVgyL2VYNjdrM285ZWE2dHlxWWxkQzhMREdTdktoNG5FWU04a0RGTSs2?=
 =?utf-8?B?WGtINFBhNkM2Vy9IM2U2ZmthRDQyZHY3ZG9WOVorcDVZMllMRnlpQlliUTlW?=
 =?utf-8?B?UmpxRWR0MmYyek1aN2RzYkx2L1NLZDdzc2pGWmNBdWt2ZGJEZGN5WDZIekNO?=
 =?utf-8?B?Qi9MUHdvV08xWWlsdSs3MmlkbVpYajdFZzZnRjg4Sjk3NFRyV2JEbEs1aG51?=
 =?utf-8?B?aDdFYVRhVWljeFR4U09UdG5wbTZMT3NDLzQwWi9ZeGF1amtNc09NNUtHc2Nk?=
 =?utf-8?B?dWFqUHp3UFQzYWx1Z29lVURXb3hGWFpTNDZMa0JrMC9qV3UzRVNBZ3VpU1BL?=
 =?utf-8?B?TE5hOWE5NnRlajlPeDVNTnAzK05JZGw0MXJJTjlPSHBGNHNNdlFhWEQvYVMx?=
 =?utf-8?B?cy9LV1Q2d3Qvdlpaem9valQ1ckJlSSt6dDA0dExiRUhpUklSM2UzZHlodlpk?=
 =?utf-8?B?Z0ZzUmwvaDVDYW1QaTR4N2NkUlloalJCaHJDaGJsSUJsKzA2L01ZOWNJOFdv?=
 =?utf-8?B?Z2dWc1JWZHZmb3ZTWFNMM2tvR0QweEJSZldQbGdhcmVSdE9sOVFWSXFvQVY4?=
 =?utf-8?B?ZFhhYXQ0K1E3NkZZZkhmM1VsS01PNVZUNno2aVRNWWVVa25tRGF4T2c0dHRZ?=
 =?utf-8?B?Vy9TMlNYVmttWUxQc2swWE92eGtTZVZrSmpsVEVMcVhxRElGekhFakU2c1ZS?=
 =?utf-8?B?cE51Rm9PL2xPNmZnS0VFaEJaamk4U1JyaUpBemd1ZTZPR2dvSGZ3bFdFUWNC?=
 =?utf-8?B?c3RiNjNHYkYyVGVjalpYcVVLRHBvcGxLcjhhemg0UFNqU0hhRmROUmhmajkx?=
 =?utf-8?B?aGZmamRqZjhjUGg3VFBBY3kvVTJubVZGZ04reXZrZTNiSHk4MjJtNFJsSFlv?=
 =?utf-8?B?MFpwUVpCKzIvOUlReWtaVGxOQm0yK205K1Z2bUphdzVWVnNuYUd5TCtDZEQv?=
 =?utf-8?B?VytWd0NXWVl3MnhuNGg0UEZZNitmT3IrRlBlc2gxK3pvcTRrVkZJWjJMaEVD?=
 =?utf-8?B?KzRZTE1KK2d6LzRVSnhOOHJtZzRJQzFuMzVFUk45N01zMnVvSnlqakxWc2p0?=
 =?utf-8?B?YlhUb1IvMGxLTFAyb3BFM0hURE5TVlRMUUpGR2tUWHQxK3lUZlVpRGkra1NZ?=
 =?utf-8?B?RjZOK1lkSk95ZmV0dm51TjJMTnc4a3Y5YTU1cm1Ma0JBQjlHTWRjQ3Fjd3Mv?=
 =?utf-8?B?a2U5U1BoblpGOG5kKzd6ck9wUjdsaXhMTmJjUGs4UDhWV1ZLaE90M3ltL1VP?=
 =?utf-8?B?dDZmZEJJODYvY3FEaGtGR1huNXZjYVJRRFl2UE9meXFtekNBMTBoQmhqdVBU?=
 =?utf-8?B?aTVkdVNiYW9nQlh0TzhNOWp1SnJzU21xOHhTRVFaa1hvMDNlQ2IyOHFUcFlB?=
 =?utf-8?B?M2p4bE1RSXhpVEF3dDl6VTV4aE5pU2toTmJSU1h0ejVwOThqb2t6T3dNZVN5?=
 =?utf-8?B?UGJ6eklzUzFHRnBzeWYxZDREc3oyOGliUFJXUFBFYW8rQU93aWczcVZaZjNH?=
 =?utf-8?B?VGNRSWVXdS9wSnRNREtjcjFFQTU1NWlYTmgzNXdpbmF1TEp6Y294dWFZUVR0?=
 =?utf-8?B?QkduM0ZJT3NQNWFFdmNqWjBnY0VDSURRaEV3aDhoZ0tRQnF0RndYRExpQ25X?=
 =?utf-8?B?UHhUQ0hmS0k1RkFVNURBRzNoOHFmdjRiWlYxRGU1K0tVN2FZOHdZamNicjRN?=
 =?utf-8?B?NDNqM25GV0NBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjdFVUhJM1ZWby9zRWR5d0Y0R0NlTXFLTUlLeWl6bmpYYS9YN0plWitLVnBp?=
 =?utf-8?B?VDVvTGY2K3M0MEtheWZYRjlqZDNuWkhGRzJIa21hY045S2Rmbnd2OFMrUm5M?=
 =?utf-8?B?Z3h0ZGk2b2pjMWh0OXJvR0ZjVmFhSEIvUDNGdkNER3M2Nk0vVmRlTXU5YXVD?=
 =?utf-8?B?VEhHeU1IZHJISFowY1NwS2QzWjFnSjROSFFybkxlK0ZTL2VyZ1A5SXhsZXh5?=
 =?utf-8?B?WHIyeDdYM1BISDE1VU5vZ3BOTllCa1pzamQvZ0l2Y0NHZFhhT2FiQWR4V0xW?=
 =?utf-8?B?alFrUUR6dkV2VE1INlFyMmpuYWlEWDZGMGxDcG4zYlJQdWZFeU1rampzRU1u?=
 =?utf-8?B?WXYvWGt0ZmRya3I0V3M0V1NYUnJiYzVXc0R2TVRPYWxBaUJlMDVBUzhZUUdn?=
 =?utf-8?B?czZJY2FvaStaMjczZ3ZjK2tOc010K3I2dndTN0wvWUJxcnJNZFZlSCs1a2hn?=
 =?utf-8?B?Q0phREdjc2VPMno2NmJ3bktlanFScStpbTlXU3ZqbjVuR2NUOEtZa0pTcWhi?=
 =?utf-8?B?R0cxNXlBTzBqaFZEYUhpckZWTFRJTDVQL2E2UjZsR1BnbGF6MFZOTXhZM0xU?=
 =?utf-8?B?K2ZCRUJUMitDQlVzMVN2by81WGh3M21tOXYyTytNbDcyL20zVEdyb0VWamFp?=
 =?utf-8?B?WEFoMjltQWc3MFk2blhmSzFHaWVmTkIyTTBDUzhLelpZaWZEQzg5Ui9ocUx3?=
 =?utf-8?B?QUUwd3pBaUg1MTBBYkNTa0dyZHliMDZvL2d6ZDhoVFF6L3g1dW91a2RtSG1u?=
 =?utf-8?B?RThZbEVKczZrejl0N01zb0h6WURpTGZaaUNTcFlLMFhTNjJLMHY1blZOeUpv?=
 =?utf-8?B?WTdDSnBadHROMUNIWHZhQi9tcTNlR1AvTkVIdU8xUTBQekh4dXFRVnlBckYx?=
 =?utf-8?B?S0NPaVFPMFZJVm8xekdSVXR0ODVuak1MMUc4Z3ZPRUNUbTdSUU5wUUFRb1pH?=
 =?utf-8?B?ZmJWRkp4NU1rRnBOVUYwamhoakxzdzBYaFFpaVhPSWFhb0RST1FFeUUxNUNh?=
 =?utf-8?B?ZFZ5aEI2Zit0OVNQcWxDY080ZVY1Z0NGeGk1QnR0VGNkbEprV3hmTW40R281?=
 =?utf-8?B?ZTVYcDlZTTZmV3NqVUtYQ0xNcXM0dFN6UlViTXZBdHhGUGV3WnUwVUEzOHFX?=
 =?utf-8?B?UWNwQ0krTkNCVXdGME1kRXpmWmJoKytpVzh6cjNoMDVOOStlenVPNjNaa3hU?=
 =?utf-8?B?dUE2b2NmNnJCZXEvb3N0bVdVWFBYejIwaWtuT1QvRVVUR2dQVUtWVmhnVUww?=
 =?utf-8?B?SHNLTnBPUHJZQzBMVTVTK1ExcklPTHprNGxMSGpyaFg3VkFQb1lBT25GNGp6?=
 =?utf-8?B?dndHK2VFYlZNd0F0dytqY0JOb0Z6WXRENFBZQUhya3lnNkw1NDFVTUZMaEhS?=
 =?utf-8?B?dzZRTitGV2R4VzJzZWcxVkl1RkFkNmF1V3NuMDJLWUEwWk0wdmthTE9Tb3Fv?=
 =?utf-8?B?RnhlajdObExkRTFWRFBQUEgzMlpEMkRVMmtZR2xqUjBXMSsyWTZUUmRLYlJi?=
 =?utf-8?B?V2s0OXBoVmVEd2RHV0NnM3QxMjhCblR3Unp1S1BkSWdRWERhWnI0a3ZxMXFx?=
 =?utf-8?B?M3J6NjFsaHBiMElkUjJpd3Q0NUhYNVhDOXh4L2MvVVhaeGwrSTJKbFV4MkM3?=
 =?utf-8?B?R240Z3pseW5kcEJpVWY1RTFZR3ZNNWRFQW00T244WUNLZE1DRzUxU01URG5o?=
 =?utf-8?B?NDlOdDVSc3dycnF3UWhBMW40RWpjRkJlQTlTSlNJdjhMcWtlOXBQMWVXbnpY?=
 =?utf-8?B?QlNHcnFjSkt6VHhuRlQ5Qk0zcC8rN3prdStjT2pqT1VjMFp5TmNtVkgwL1E1?=
 =?utf-8?B?OTI1UWcwSWI5aTJVUmZQYk1zR1huUDV1VnpmL25uV0J1RFQ1THBUT0g0MXBp?=
 =?utf-8?B?cmZMSlhWUjdWQ3c5UDE1YUVlTU5tM2lqdW5oZVNLWjhDbTYrQkxrREpva01q?=
 =?utf-8?B?MTJ5eFpucFp5TGN2bUpmS1NJLy81aXZDZVRrWEpoU0F1cWlEM1o5OUV3SUdK?=
 =?utf-8?B?eWRmMk04TTMxZHAwQjd2UU1sc1E4UHI2dmFTK2dTelRYM0orWmhEU1BwQ3F4?=
 =?utf-8?B?eFNIcXhpM2Y1OC90dXBlbXdYNC9wUkxLOC9rNmF3RE8zSkkyOXZpQ0p0c0dn?=
 =?utf-8?B?c2Zka29yeDBORFRzMVpGMEdyRzRsT2RRUjM3cEFDWEEzOUg0WVJmS0hVa3R2?=
 =?utf-8?Q?iYi+Co23pkH5hr3CebWDIJg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBDAC060F0985B46BAF36C3AF2E6DA86@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8a0665-a481-4434-1aca-08dd9ba4b64d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2025 15:56:29.1498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2AWeqX4hB/K2ACHMdBjmCR6qao/g3Rc5xlWNAoxrcJLJpxueWrgf+CtWPKa/r30hggReQohK1AMiPkkqnnj1tJYEcEzK7h0UAebQU4hTc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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

SGksDQoNClNvbWUgY29tbWVudHMsIA0KDQpPbiBNb24sIDIwMjUtMDUtMTkgYXQgMTg6MDEgKzA1
MzAsIE1vaGFtbWVkIFRoYXNsZWVtIHdyb3RlOg0KPiBUaGlzIHVwZGF0ZSBzdG9wcyBza2lwcGlu
ZyBmYmMtKiB0ZXN0cyBzdXBwb3J0IHZhcmlhdGlvbnMgYmFzZWQgb24gdGhlIFdBcw0KPiANCj4g
djI6IFVzZSBXQV9GQkNfRElTQUJMRUQgaW5zdGVhZCBDSEVDS19XQS4gKFZpbm9kKQ0KPiDCoMKg
wqAgVXBkYXRlIGlndF9za2lwX29uX2YgZGlzY3JpcHRpb24uIChWaW5vZCkNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1vaGFtbWVkIFRoYXNsZWVtIDxtb2hhbW1lZC50aGFzbGVlbUBpbnRlbC5jb20+
DQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMjQg
KysrKysrKysrKysrKysrKysrLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJh
Y2tpbmcuYw0KPiBpbmRleCAwODA5MzUyY2IuLmFlYmVlNzA0OCAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
a21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMNCj4gQEAgLTc4MSw2ICs3ODEsNyBAQA0KPiDCoCAq
Lw0KPiDCoA0KPiDCoCNkZWZpbmUgVElNRSBTTE9XX1FVSUNLKDEwMDAsIDEwMDAwKQ0KPiArI2Rl
ZmluZSBXQV9GQkNfRElTQUJMRUQgIjE2MDIzNTg4MzQwIg0KPiDCoA0KPiDCoElHVF9URVNUX0RF
U0NSSVBUSU9OKCJUZXN0IHRoZSBLZXJuZWwncyBmcm9udGJ1ZmZlciB0cmFja2luZyBtZWNoYW5p
c20gYW5kICINCj4gwqAJCcKgwqDCoMKgICJpdHMgcmVsYXRlZCBmZWF0dXJlczogRkJDLCBQU1Ig
YW5kIERSUlMiKTsNCj4gQEAgLTIyNDgsNiArMjI0OSwyMCBAQCBzdGF0aWMgdm9pZCBkb19mbHVz
aChjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQ0KPiDCoA0KPiDCoCNkZWZpbmUgQVNTRVJUX05P
X0lETEVfR1BVCQkoMSA8PCAxMSkNCj4gwqANCj4gK3N0YXRpYyB2b2lkIGNoZWNrX2ZiY19zdXBw
b3J0KGludCBkZXZpZCwgY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gK3sNCj4gKwlpbnQg
d2E7DQo+ICsNCj4gKwlpZiAoSVNfQkFUVExFTUFHRShkcm0uZGV2aWQpICYmIHQtPmZlYXR1cmUg
PT0gRkVBVFVSRV9GQkMpIHsNCj4gKwkJd2EgPSBpZ3RfaGFzX2ludGVsX3dhKGRybS5mZCwgV0Ff
RkJDX0RJU0FCTEVEKTsNCj4gKw0KPiArCQlpZiAod2EgPT0gMSkNCj4gKwkJCWlndF9za2lwKCJX
QSBoYXMgZGlzYWJsZWQgRkJDIG9uIEJNR1xuIik7DQo+ICsJCWVsc2UgaWYgKHdhID09IC0xKQ0K
PiArCQkJaWd0X2Fzc2VydF9mKHdhID49IDAsICJXQSBwYXRoIG5vdCBmb3VuZCBvbiBHVHNcbiIp
Ow0KPiArCX0NCj4gK30NCj4gKw0KDQpJIGd1ZXNzIHRoZSBtYWluIHBvaW50IG9mIHVzaW5nIHRo
ZSB3YSB0byBjaGVjayBhIGZlYXR1cmUgaXMgdG8gYXZvaWQgdGhlIGV4cGxpY2l0IHBsYXRmb3Jt
IGNoZWNrcw0KYW5kIGdlbmVyYWxseSBhICB3YSBjYW4gaW1wYWN0IG9uIG11bHRpcGxlIHBsYXRm
b3Jtcy4gSU1PLCB3ZSBkb250IG5lZWQgdG8gdXNlIGEgc3BlY2lmaWMgcGxhdGZvcm0NCmNoZWNr
IGJlZm9yZSBjYWxsIGlndF9oYXNfaW50ZWxfd2EoKS4gQnV0IHRoZW4geW91IHdvdWxkIGhhdmUg
dG8gaGFuZGxlIHRoYXQgdGhpcyBpZ3RfaGFzX2ludGVsX3dhKCkNCmlzIGNhbGxlZCBvbmx5IGZv
ciB4ZSBhcyAid29ya2Fyb3VuZHMiIGRlYnVnZnMgZXhpc3QgaW4geGUgb25seS4gVGhpcyBpcyBq
dXN0IGEgc3VnZ2VzdGlvbiBmb3IgYQ0KZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4gDQoNCkFsc28g
cGxlYXNlIGNoZWNrIGNvbW1lbnRzIGZyb20gS2FtaWwsICJlbHNlIGlmICh3YSA9PSAtMSkiIGlz
IG5vdCBuZWVkZWQuDQoNCllvdSBuZWVkIHRvIGFkZCB0aGUgc2FtZSBXQSBjaGVjayBpbiBmZXcg
b3RoZXIgdGVzdHMgYXMgd2VsbCBub3QganVzdCBpbiB0aGUga21zX2Zyb250YnVmZmVyLg0Ka21z
X2RpcnR5ZmIgYW5kIGttc19mYmNvbl9mYnQgYWxzbyBza2lwcyBGQkMgdGVzdHMgaW4gYSBzaW1p
bGFyIHdheS4gU28geW91IG5lZWQgdG8gZXh0ZW5kIHRoaXMgZm9yDQp0aG9zZSB0ZXN0cyBhcyB3
ZWxsLg0KDQpCUg0Kdmlub2QNCg0KPiDCoHN0YXRpYyBpbnQgYWRqdXN0X2Fzc2VydGlvbl9mbGFn
cyhjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0LCBpbnQgZmxhZ3MpDQo+IMKgew0KPiDCoAlpZiAo
IShmbGFncyAmIERPTlRfQVNTRVJUX0ZFQVRVUkVfU1RBVFVTKSkgew0KPiBAQCAtMjYxMCw4ICsy
NjI1LDcgQEAgc3RhdGljIHZvaWQgcHJlcGFyZV9zdWJ0ZXN0X2RhdGEoY29uc3Qgc3RydWN0IHRl
c3RfbW9kZSAqdCwNCj4gwqBzdGF0aWMgdm9pZCBwcmVwYXJlX3N1YnRlc3Rfc2NyZWVucyhjb25z
dCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQ0KPiDCoHsNCj4gwqAJLyogRkJDIGRpc2FibGVkOiBXYV8x
NjAyMzU4ODM0MCAqLw0KPiAtCWlndF9za2lwX29uX2YoKElTX0JBVFRMRU1BR0UoZHJtLmRldmlk
KSAmJiB0LT5mZWF0dXJlID09IEZFQVRVUkVfRkJDKSwNCj4gLQkJwqDCoMKgwqDCoCAiRkJDIGlz
bid0IHN1cHBvcnRlZCBvbiBCTUdcbiIpOw0KPiArCWNoZWNrX2ZiY19zdXBwb3J0KGRybS5kZXZp
ZCwgdCk7DQo+IMKgDQo+IMKgCWlmICh0LT5waXBlcyA9PSBQSVBFX0RVQUwpDQo+IMKgCQllbmFi
bGVfYm90aF9zY3JlZW5zX2FuZF93YWl0KHQpOw0KPiBAQCAtMjY1OCw4ICsyNjcyLDcgQEAgc3Rh
dGljIHZvaWQgcHJlcGFyZV9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQsDQo+IMKg
c3RhdGljIHZvaWQgcnRlX3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gwqB7
DQo+IMKgCS8qIEZCQyBkaXNhYmxlZDogV2FfMTYwMjM1ODgzNDAgKi8NCj4gLQlpZ3Rfc2tpcF9v
bl9mKChJU19CQVRUTEVNQUdFKGRybS5kZXZpZCkgJiYgdC0+ZmVhdHVyZSA9PSBGRUFUVVJFX0ZC
QyksDQo+IC0JCcKgwqDCoMKgwqAgIkZCQyBpc24ndCBzdXBwb3J0ZWQgb24gQk1HXG4iKTsNCj4g
KwljaGVja19mYmNfc3VwcG9ydChkcm0uZGV2aWQsIHQpOw0KPiDCoA0KPiDCoAlwcmVwYXJlX3N1
YnRlc3RfZGF0YSh0LCBOVUxMKTsNCj4gwqANCj4gQEAgLTQxNTcsOCArNDE3MCw3IEBAIGlndF9t
YWluX2FyZ3MoIiIsIGxvbmdfb3B0aW9ucywgaGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0K
PiDCoAkJCXQudGlsaW5nID0gb3B0LnRpbGluZzsNCj4gwqANCj4gwqAJCQkvKiBGQkMgZGlzYWJs
ZWQ6IFdhXzE2MDIzNTg4MzQwICovDQo+IC0JCQlpZ3Rfc2tpcF9vbl9mKChJU19CQVRUTEVNQUdF
KGRybS5kZXZpZCkgJiYgdC5mZWF0dXJlID09IEZFQVRVUkVfRkJDKSwNCj4gLQkJCQnCoMKgwqDC
oMKgICJGQkMgaXNuJ3Qgc3VwcG9ydGVkIG9uIEJNR1xuIik7DQo+ICsJCQljaGVja19mYmNfc3Vw
cG9ydChkcm0uZGV2aWQsICZ0KTsNCj4gwqANCj4gwqAJCQlmb3JfZWFjaF9waXBlKCZkcm0uZGlz
cGxheSwgcGlwZSkgew0KPiDCoAkJCQlpZiAocGlwZSA9PSBkZWZhdWx0X3BpcGUpIHsNCg0K
