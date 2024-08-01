Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E48C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 07:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA5110E8A4;
	Thu,  1 Aug 2024 07:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOfY8aOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F111D10E8A1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 07:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722496101; x=1754032101;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+uGO0a71Y2bkM58knHbnrOFA+LV2pTOjePauHM3Fatw=;
 b=KOfY8aORl0s9aX8Zr69DF6waUjgWsIhsDzYwf5DQ9i97jCY48cjX2ov6
 Jmkpf4+07VizfF1LJtk9oiXUyxYNX+EeEfWTgq591okz9QY+QNzXCb68G
 qv2ogrqapksidadqMFarrXGv4Gxs1MKg/hQkO+3G1GTgxQdeh5FrvixcR
 EqYIhLPMs9nVnkr79pwduomgA3Tw4ZBi3YLBZr2Q6VMi5XkT5ex8HL9tI
 ufaIv/ZbTnl0OIOC4j+rk7LAIOzrnff+no0G4KLz/Sh3Pr6htW7RKgP0F
 C+EWWNE+OJSESd8sLQysXmwwZw5GA4HHJNHQj/U+VsXKBUa1npWsdtHOb A==;
X-CSE-ConnectionGUID: 4J4KpBkjTb+OMfBrIAGrBw==
X-CSE-MsgGUID: 96ipvJDRTV+MIzKTBxjWqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20111344"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="20111344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 00:08:20 -0700
X-CSE-ConnectionGUID: 6opTBfE2RfeQwSEO7fa7VQ==
X-CSE-MsgGUID: JmplWK/jQWK2BZO4Wu+8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="92471515"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 00:08:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:08:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:08:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 00:08:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 00:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFFhFS+XTqxuiQdsvs9it/HhUaSQGtMuxNx3u74poGCLciT/Hr8vkQ543/hpVAGX2z9MyqAN9H8yWEeLt/tvEk1t7lSrzVRGkUUl84ic5rNBfV/Hg4Ye6YBJNyDK3MgbU9PonOHJaPPUcSountwbB9G7MK4AwsdhK3Smw68Fe0Ndtq9EwBg85Cyr23Lqdh2Hdi+WpqVQG1UWT04oDcIZWO13//3xANFvTXlu4mGSzBWcNDoRLRLFWon7PLMYoaEKDgxImlgU/Uo8ZZvzL451l1HbGxCneqG3u2FeqBzJaPG0zNkSY3xI3R5BCguVzLTTcOEyLE5FxtX79WzWQ/a0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uGO0a71Y2bkM58knHbnrOFA+LV2pTOjePauHM3Fatw=;
 b=okJ6U59Kjpl+1BXVbZvPl/YB3WZrTxtBnHN9d56768P3owBBNXEBqjXCcYai3ZWDRXSm64G9L0/mBPMeJE0VZxLpNDWFvxf1L5nZ70w9rKKyUdFMo31XrbPlfGhOuSMq6R0CKhVqRQFz/o1sCYMosk82xJ1UWejaqwnlLtdnmR1P1ExQAxyNpND2XcXRmyB+V4lscivVF9pORCVWapM4WyBi/0R63Z66T5jKSJJcYrNvKoRJQz+ipR29xKFCGtblKA7pgXx3Mhddthe1AzVe45W6aomCBKYboGs2g8ZW/LiXwwyGD//w4YLHA0jX9CDa0NHjSejJoHwVtGVwTxYMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 07:08:16 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 07:08:14 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 43/66] tests/xe_exec_sip: Add
 sanity-after-timeout test
Thread-Topic: [PATCH i-g-t v2 43/66] tests/xe_exec_sip: Add
 sanity-after-timeout test
Thread-Index: AQHa4nZ5Q/qCEd3cSkmctDpE+SaiGLIR/g6w
Date: Thu, 1 Aug 2024 07:08:14 +0000
Message-ID: <DS0PR11MB726451995272E0ECF72A5233D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-44-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-44-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MN2PR11MB4597:EE_
x-ms-office365-filtering-correlation-id: d8e1f7eb-271d-4307-1935-08dcb1f8b61e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1ZRYk9hWGhNMW9weFlqTEx0cWcvQmZ0TzVZUi94ZUp2TVErRCtNaSt4Q0h2?=
 =?utf-8?B?OGQ0c3pnZXJaZHJmRTdJRU5yUklzTGZ2QzM3cWkrbzgvWWFYOEZzMko3c2JB?=
 =?utf-8?B?ZjMvY3BLb1kwdHkxY0hNVVQ2SE95TWRJQjFUdHhSWk11SmJUak8zTldXc2Fj?=
 =?utf-8?B?SThVYTJ1bk1MN1NqdUpYaVpWRnR3Um93ZkNBOGR0dHRFL2ZMTUR5SFdzdCt1?=
 =?utf-8?B?U0xnMFZsT3FYY3h3d1MzS1J5ZVpYNGhYM3ZjOWJmNFpxbG5NY2FxTlJ2ZWU3?=
 =?utf-8?B?MjkramNyVkZNMjJxWG5DbDZZWTRvemVMc2NVNWFWSENLRlA3UFlCai9rendy?=
 =?utf-8?B?dkRoWTFWLzE4WmNGQThyb09BVHVLSWl0RTRtTmFiYkljR0w5bnM3b3VTY0Y5?=
 =?utf-8?B?Um9OYjdHbjgwQVlNVGNCR0s3WjBnTWoxKzByS2tWemRXTkZkMVV2VXN5WmMv?=
 =?utf-8?B?UFR2QXRJUkp6T1BKYzFnTHNnZXBWQXRaVzFjV3lCTWMvOG82RVFxNGllb2J0?=
 =?utf-8?B?Z2d6Vk9qQmh4Vi9SeXA3TWpFQnJIMW5GSUE0TGU3WHRDSkFNRlRnM2tYNkNW?=
 =?utf-8?B?MWtqNEJpMGpVSXR4bTAzSnFFVVlvYXR3OHVjWkFxWGJYRGlXZngxZ2xhVytr?=
 =?utf-8?B?andTbFllbFJGZitGdjV2anZwYS9pZWJrbmJTZ3JlTjd4YWJaNEFwUWhiVjJJ?=
 =?utf-8?B?emZrdW5FdFN2cml3MlNvNkF6aUdFK1hZS3phNUlDUDB4YVI3WWo0dUVpN21W?=
 =?utf-8?B?NW5qTVJ5QkQ5VTRaR01vd3NBb2k2Z3FidGQ3c2RhekNJWXZrcXl3S3c2UWhU?=
 =?utf-8?B?cHRLTG1wUHJtbXVlQlJJT3ZNQWw4SzhVWllvVXhBM29uelRyay8yZW1TZWtQ?=
 =?utf-8?B?WEJFUUptYUJZTmZMNzZhMTRUZ25qNHBPZW5xdERBNlJjcmtaaXltUyt6VkJP?=
 =?utf-8?B?dDJERkxKRkZqM0plUmtoaC9ubUVjZDlDS1U4NXV3Z1ZDQU9sL05DYXczNklJ?=
 =?utf-8?B?bGZYYWFRejFWeEp6enh4dURyRFo4RGVYZWhsWWFpc1JhS2ZEVTZBeVljcG5x?=
 =?utf-8?B?UzFjQWg2T2gzWE1UeDlwdGpYOHp2T0pUcDVqcTdMMXdEYUkzNmFhdndTTnNI?=
 =?utf-8?B?bEN1Y1l5WDQrbVJDSTZoQUc4YVJ3SFlienBPa2NaQ1dQMEpTY21Xblo1RDV2?=
 =?utf-8?B?L0N4ekprNmVPQlRwOWpUdFEwRkZOZndXZ1pxWVdUSDhwNnZoMDhlUkVMTDk1?=
 =?utf-8?B?MzRTK2NQV21ER0grMWV3dFZjSUJ5TnRBek5jU3Z4bkxOaGprVTk3c2Npa2RC?=
 =?utf-8?B?cFdxWFRiS1JFRUlzRUNZeTVIZTR4ZUZJY0JEOHJrWVJndHRkd29ndyt4QkpN?=
 =?utf-8?B?bEdkOWk0V3oybEovOENJVVBFaFJpRHg1RmllVFpDbXQvMWtKRVd1R0V0Um9V?=
 =?utf-8?B?bmxIc015Nm5ZRG9JNEJ5YURsdVcxL1pVYUdSR0p4RHBKMTdrK0RHNTVIUWkr?=
 =?utf-8?B?eDh2NW15eDNla052eUNpREw1N2kycXR5eGtIbmVnUUpWUzdQZERvdGRJRlhT?=
 =?utf-8?B?Q1ExQVgyRUlPMXlZVDM0Q2pvb0x5Um9hV1V6V1VJQ0N1VnMwZnpVQlBFVjR3?=
 =?utf-8?B?KzB0MFZmd1VCVVcxenRxMVZyMmZwaEo2QWpkaHpjNXRDMHdCa2daWWRPTlE4?=
 =?utf-8?B?SXhDOHp4aGdHd2d2ZHQ5Q2swb0k0bFZEdlRzK3diOERoendRTjhpTGVtRGN5?=
 =?utf-8?B?UVlBM1Z1YkhzMEVad3JZYzdGM0NLZ3lQdmp3Zno0M0dHTy9oZXM0a0hWckN1?=
 =?utf-8?B?NnRoL2haMVhPRGt0M0E1cU4xWlhRZnBZMXMxNGNlV1ozQ0V6NEdSLzhuYllF?=
 =?utf-8?B?TXp1SXVsZm1Wc3dpcmlQWmNlM0RjWWwvQUdDZEQwR0lvdmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGVjejVkOTJXWUJpKzErd1AyUFlGNzNMQXcxT1RraGlGUExZb3NSK0NQN1Bl?=
 =?utf-8?B?cnNIZEUzR2xhTWxJL1V2MlJNYlZOclJLa3FnM1h6U0M1UEtWM3N0WnlSdWNJ?=
 =?utf-8?B?Q0p3RWFHKzV6YWpzZEgrYmxGOGk0UHBYTHNWMXJXZUdjZy8zZkxDdXVjTGhm?=
 =?utf-8?B?Wm5JN3pnT0xtTGprMm5oY0haL1NSSlFaUGZ6MFVhaW84NkRDa0hLTUlWVlpT?=
 =?utf-8?B?WStRY3hUNmJ6cHFLSzllWnNEWTJ2V1g5d0cwUGEvTTkrdVpNdlBGUUlPdmZo?=
 =?utf-8?B?VE91RTNOY1I4WktFUEZQU0ZyOVdNL0NhSDZiemVjeGlob2NDaG9YV1NIR1V6?=
 =?utf-8?B?QlVnSWQvY0lZaTVFZXNCZ3pWRGVVbmJ5ejRpNzVtbytsZXdHbmo0MXJOY2pP?=
 =?utf-8?B?NkdKcDJuTVFiTEpLSVg3QXIydDJtNlM5UG9LaHFQbDlvSno4YmFNQTNXWXU3?=
 =?utf-8?B?QWtTRlZvN1lkQ0pBOTJLS2MvOUh1UGw1dFZpM0o4YlF1dWM5SXMxYWtIbmZR?=
 =?utf-8?B?UGRTaFJrbUtMWjVSSnR1YlFlQ0tTVllHUkV2dExXRkR0SGdyTnVhZStQc3Jq?=
 =?utf-8?B?a1oraG5nSURJeWEvQlZxUHdDUjc0azQvOTNMMk5VZ0tEczhvRmpkejIxRmtF?=
 =?utf-8?B?VkUrZ3k3QWtqelg3Zm5Xdk9SaHBoZlpIRU5vdkpQQjdSbWJKa0JmVmtzZ25H?=
 =?utf-8?B?MnBnWnJJUGRTMy82Qi9jeklrallOWnltRTRTQ2U2NjVLK0pyeFREU3ArZnpy?=
 =?utf-8?B?clRnVW8rcWZEeUQ2RGUyMCtpNHdPRnFkSzMyNHE1dEZ6NlFHUTduN1diR2JS?=
 =?utf-8?B?Q2g0V3VIMTEybG9RS3ZpMzBHNFNYZ3hHSHNvQ0o5dzA0ZkZaTFFnNFRGVU5X?=
 =?utf-8?B?bkllWTlvYnBPTnY4T01vNStnSXFWd3lDUURCenNoTXIwWjhqd25tVDM1VHJ2?=
 =?utf-8?B?dVpWUkg1RXpWWVdSTFpHeW12VHFzUnJJTGx2Q3hPMTNabWNkcHJvdVMybVBW?=
 =?utf-8?B?R1JPT3FrbDc0T2tCSVFUU0hkNlhNRnExMTVXbmpEQmZ6WVYrU2x4cmJDT0xM?=
 =?utf-8?B?Y3pjOEhwV2hrcG45SVU5WjFEK00yVUlZSVdhTmUyOUNYNHY4c2ZBendxZ0pJ?=
 =?utf-8?B?SFo3Z1poWUJIMkw2MnZlOXZreFVRT2c2MzZkWVBGRExQWTNSTVRtUld6NTEw?=
 =?utf-8?B?UTJXVmNOQ0tGMzNGYXd6NCtNZXVYdEdUNlJvZkNSZW9sOGpnSldpY1pVTDNG?=
 =?utf-8?B?NzllMXJPMVR2YWhsek5wVkFjR1c3L1FYNVUvWXg1dlMxMzFOUVFiRjNHVDZm?=
 =?utf-8?B?dkt4VzY4VUxxaWY2NE9tQ2l6UXFOeXB6cWZIem9vN3dEUkVKeUQ5M0tpNTBJ?=
 =?utf-8?B?bmF1QUkyYnZaWERKUUtLa0Q2M0VhUHlXc250SkZSZTg4bitLSFFnTGd2WUNR?=
 =?utf-8?B?SmpHK21PeXo1RVBJN2pydlFuWkpMcm5sT1lzSXhPTitaZ2RsN254bmp5YWQ4?=
 =?utf-8?B?K2o5MDNwNTZuTkhudnFMaFFPN2MyMHJMOGlWU2x1RHhBaGg5ekVMeXd0Qmdk?=
 =?utf-8?B?bGRpWkRueFk0VERBcGNlNzl5V1FLNnZiUTFMak1sK1ZBS3NTc1lUZEdWSDlQ?=
 =?utf-8?B?c3BpL0FyQndndlZRTDNmbHo2UHIwczRRYmFZOFNNUDQxS00xNHR6bmk1dXF0?=
 =?utf-8?B?MC91ZkJKYzdjUXZyczlmNE9wYzRGM2loMmRvczVBSGtXc2NFaTV5ckl2c0Y5?=
 =?utf-8?B?c3JaUG50cVF4UjY0SllNTDVqcUI1U2NSWk5yKzdHVjdYZWdlaXg5RnhBTnJ3?=
 =?utf-8?B?elFTcitHaDE2OXNXQy9zMXZIMnNyRnhCYzBGQmJFVk92TEE4MVZQYXZuQTVX?=
 =?utf-8?B?VGRRdnA2NTlMNTlEQzlnT0tIenRMMmRIY2FSU29YVW8wYTFCdHQ0dWNia29T?=
 =?utf-8?B?OGRQdlJBUmY4WFgvWTFwUTJrOXZxaytxNTFNSVBCWmZ1d0F2OEI3cTM1emRX?=
 =?utf-8?B?REpvMGZabDlCczZVTm5jNjFYZWNJWDJrZUVNOVZhVVVzL1BHbjZBeHo5SkZs?=
 =?utf-8?B?b2xoaVVsbVhRaCtXWS8rdS9pbWRiQnZpN2lnOVN4S2Zhbm9sUDRNeHU0Nkxh?=
 =?utf-8?B?MkljbE1UNHlVRkZ3TVdNOTVpMThDTG9KWCszU05RRm03ZS85Zll0cXYyaDg4?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e1f7eb-271d-4307-1935-08dcb1f8b61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 07:08:14.5034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdilkY+wO63xDDIif2iE4PHbOJSbdjthUCPoX6Ck0Hx/1drMu57a+SWwKTZojVyqvvUfg6PP/TPBaAfO3ap5i7MnlDOIlUf10XFjafXfPnpXm8hQU0kMf2amSD5e8mnn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMzAsIDIwMjQgMTo0NSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgS2FtaWwNCj4gS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPjsgR3J6ZWdvcnplaywgRG9taW5paw0KPiA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT47IFBhdGVsY3p5aywgTWFjaWVqDQo+IDxtYWNpZWoucGF0ZWxj
enlrQGludGVsLmNvbT47IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wNCj4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsDQo+IDxwYXdlbC5zaWtvcmFA
aW50ZWwuY29tPjsgSGFqZGEsIEFuZHJ6ZWogPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4g
S29sYW51cGFrYSBOYXZlZW5hIDxrb2xhbnVwYWthLm5hdmVlbmFAaW50ZWwuY29tPjsgS3VvcHBh
bGEsIE1pa2ENCj4gPG1pa2Eua3VvcHBhbGFAaW50ZWwuY29tPjsgTXVuLCBHd2FuLWd5ZW9uZyA8
Z3dhbi0NCj4gZ3llb25nLm11bkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2
MiA0My82Nl0gdGVzdHMveGVfZXhlY19zaXA6IEFkZCBzYW5pdHktYWZ0ZXItdGltZW91dA0KPiB0
ZXN0DQo+IA0KPiBGcm9tOiBLYXJvbGluYSBTdG9sYXJlayA8a2Fyb2xpbmEuc3RvbGFyZWtAaW50
ZWwuY29tPg0KPiANCj4gSW50cm9kdWNlIHNhbml0eS1hZnRlci10aW1lb3V0IHRlc3QgdG8gY2hl
Y2sgaWYgdGhlIHNoYWRlciBnZXRzIGV4ZWN1dGVkIGFmdGVyIGENCj4gaGFuZy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEthcm9saW5hIFN0b2xhcmVrIDxrYXJvbGluYS5zdG9sYXJla0BpbnRlbC5j
b20+DQo+IENjOiBDaHJpc3RvcGggTWFuc3pld3NraSA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50
ZWwuY29tPg0KPiBDYzogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5w
aWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC94ZV9leGVjX3NpcC5jIGIvdGVzdHMvaW50ZWwveGVfZXhlY19zaXAuYyBpbmRleA0KPiA3YjQz
MDU1NzYuLjkyZGE4ZjE0ZCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19zaXAu
Yw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5jDQo+IEBAIC0zOCw5ICszOCwxMCBA
QA0KPiAgI2RlZmluZSBTSEFERVJfQlJFQUtQT0lOVCAwDQo+ICAjZGVmaW5lIFNIQURFUl9XUklU
RSAxDQo+ICAjZGVmaW5lIFNIQURFUl9XQUlUIDINCj4gLSNkZWZpbmUgU0lQX1dSSVRFIDMNCj4g
LSNkZWZpbmUgU0lQX05VTEwgNA0KPiAtI2RlZmluZSBTSVBfV0FJVCA1DQo+ICsjZGVmaW5lIFNI
QURFUl9IQU5HIDMNCj4gKyNkZWZpbmUgU0lQX1dSSVRFIDQNCj4gKyNkZWZpbmUgU0lQX05VTEwg
NQ0KPiArI2RlZmluZSBTSVBfV0FJVCA2DQo+IA0KPiAgI2RlZmluZSBGX1NVQk1JVF9UV0lDRQko
MSA8PCAwKQ0KPiANCj4gQEAgLTcxLDYgKzcyLDExIEBAIHN0YXRpYyBzdHJ1Y3QgZ3BncHVfc2hh
ZGVyICpnZXRfc2hhZGVyKGludCBmZCwgY29uc3QNCj4gaW50IHNoYWRlcnR5cGUpDQo+ICAJZ3Bn
cHVfc2hhZGVyX193cml0ZV9kd29yZChzaGFkZXIsIFNIQURFUl9DQU5BUlksIDApOw0KPiANCj4g
IAlzd2l0Y2ggKHNoYWRlcnR5cGUpIHsNCj4gKwljYXNlIFNIQURFUl9IQU5HOg0KPiArCQlncGdw
dV9zaGFkZXJfX2xhYmVsKHNoYWRlciwgMCk7DQo+ICsJCWdwZ3B1X3NoYWRlcl9fbm9wKHNoYWRl
cik7DQo+ICsJCWdwZ3B1X3NoYWRlcl9fanVtcChzaGFkZXIsIDApOw0KPiArCQlicmVhazsNCj4g
IAljYXNlIFNIQURFUl9XQUlUOg0KPiAgCQlncGdwdV9zaGFkZXJfX3dhaXQoc2hhZGVyKTsNCj4g
IAkJYnJlYWs7DQo+IEBAIC0yNTUsNiArMjYxLDkgQEAgeGVfc3lzZnNfZ2V0X2pvYl90aW1lb3V0
X21zKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSkN
Cj4gICAqIERlc2NyaXB0aW9uOiBjaGVjayBiYXNpYyBzaGFkZXIgd2l0aCB3cml0ZSBvcGVyYXRp
b24NCj4gICAqIFJ1biB0eXBlOiBCQVQNCj4gICAqDQo+ICsgKiBTVUJURVNUOiBzYW5pdHktYWZ0
ZXItdGltZW91dA0KPiArICogRGVzY3JpcHRpb246IGNoZWNrIGJhc2ljIHNoYWRlciBleGVjdXRp
b24gYWZ0ZXIgam9iIHRpbWVvdXQNCj4gKyAqDQo+ICAgKiBTVUJURVNUOiB3YWl0LXdyaXRlc2lw
LW5vZGVidWcNCj4gICAqIERlc2NyaXB0aW9uOiB2ZXJpZnkgdGhhdCB3ZSBkb24ndCBlbnRlciBT
SVAgYWZ0ZXIgd2FpdCB3aXRoIGRlYnVnZ2luZw0KPiBkaXNhYmxlZC4NCj4gICAqDQo+IEBAIC0z
NDIsNiArMzUxLDE1IEBAIGlndF9tYWluDQo+ICAJdGVzdF9yZW5kZXJfYW5kX2NvbXB1dGUoInNh
bml0eSIsIGZkLCBlY2kpDQo+ICAJCXRlc3Rfc2lwKFNIQURFUl9XUklURSwgU0lQX05VTEwsIGVj
aSwgMCk7DQo+IA0KPiArCXRlc3RfcmVuZGVyX2FuZF9jb21wdXRlKCJzYW5pdHktYWZ0ZXItdGlt
ZW91dCIsIGZkLCBlY2kpIHsNCj4gKwkJdGVzdF9zaXAoU0hBREVSX0hBTkcsIFNJUF9OVUxMLCBl
Y2ksIDApOw0KPiArDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgZWNpKQ0KPiArCQkJaWYg
KGVjaS0+ZW5naW5lX2NsYXNzID09DQo+IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSIHx8DQo+
ICsJCQkgICAgZWNpLT5lbmdpbmVfY2xhc3MgPT0NCj4gRFJNX1hFX0VOR0lORV9DTEFTU19DT01Q
VVRFKQ0KPiArCQkJCXRlc3Rfc2lwKFNIQURFUl9XUklURSwgU0lQX05VTEwsIGVjaSwgMCk7DQo+
ICsJfQ0KPiArDQo+ICAJLyogRGVidWdnZXIgZGlzYWJsZWQgKFREX0NUTCBub3Qgc2V0KSAqLw0K
PiAgCWlndF9zdWJ0ZXN0X2dyb3VwIHsNCj4gIAkJaWd0X2ZpeHR1cmUgew0KPiAtLQ0KPiAyLjM0
LjENCg0K
