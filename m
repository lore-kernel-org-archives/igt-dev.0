Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9659C282D1
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 01:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B1B10E71B;
	Fri,  7 Mar 2025 01:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEsJM6ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF7610E71B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 01:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741309467; x=1772845467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fTyO8I5cFrLPql9WeO7ct5McfHSTXDzu5TA+hWurnS4=;
 b=mEsJM6eizxXSTxVn5VgBqdZATbr6d7+67mdwoZmvh/06dSNjnxuQBJ2n
 P4HP4UaJ2uFuX6IPvtHaPTQCiHz0tsrEZPAyD6UKoPsYe5MKd6HZMgub8
 wvyt/Z4JrmeZScgdFCysjQ2M2NLpQyS14LHPwvgOGZRPlSSL2ew3Ao3+y
 Bhgk1oGQQtLi6Ou0RvJQxTC1lqXVyPLFFx+kidyyRF9/i979k8XZaQJZA
 AxWexapRE7X8kunUw0L6iCK/+qsp3JEh19+4ta3PCz54M9nK0PLdI3Oyu
 MtKUe3jONgWkSghiGxBshzJP0v+6R2vgfL/PSQe6vuX+YEsH+z4eQKNyq w==;
X-CSE-ConnectionGUID: kiU/NHuHQ4+Ue0aXdC/eXg==
X-CSE-MsgGUID: kgTzNrR+SyOdBkz53zO3LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46000982"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46000982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 17:04:26 -0800
X-CSE-ConnectionGUID: ltyrsGY5Q6m0sl2IJvTt9Q==
X-CSE-MsgGUID: aZqPrYG9TZWQ4aLVAXmXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="123774156"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 17:04:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 17:04:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 17:04:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 17:04:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K780qLYupozj0EE2DDXr+D4FCFphBMiz32RejzgUuRfkfrvQ0fQs0dCy7wq/mHLlLbUyPZrw5Nsi/+pAiZK3HarXHGeZXwkeGjgcjsxKpaFWQW7XK7sDcvBHL1aBS2Sw/4opSIMAYjDXBxGHwVEldYDDs8ReZ8uuqLzpfFvlMLqNiaE9v/V3YOm2BbcYyou3bD8PbuTPX5lC6x8WdLndA6P7ZjqU8Q2Z7oe7n4V16nwF9lgams14mzGJtBYEBPBdMm4GcWIdJr/TOkXHLkGfwCgWztibMSOrb2Mk+N8Me4acKzPLZOdt9smDq22AHvLr3wyz88PkAnFUmwmh679KBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTyO8I5cFrLPql9WeO7ct5McfHSTXDzu5TA+hWurnS4=;
 b=ZFUGmcBJmKgTw/dpz5yWQhhcp4sXDSN6Qi1fpvvx5AtA0k3bkjiUwU1QXI0cNNVo6HxvYVrQ/oKEwMOQQAQlS7lK1m8qWKxmsvbYsxFrOzrvV4MENy/XJF2RWTiTIo9b/ertbqtWQFiF+iDqxV/HwfSEhwJYkHPCsbV6vrr2oFklDMpFpjDgj+wa9ctIKsuGBH+IkbGJQXqOqQ9Qpbx0h6BLoz5x82rONOR8lRA2AaSZpBl1Y4PY6EblwPjt8yW12K6BmQGFVVNwHU71SEwlbLvoztlKvP8Yf1nnidtC3G7+mkqRSEfXr8wFT2RhkmVctSF0Xa89TUl8gWoZToPnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.16; Fri, 7 Mar 2025 01:04:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 01:04:19 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 5/6] tests/intel/xe_pxp: Termination tests
Thread-Topic: [PATCH i-g-t v5 5/6] tests/intel/xe_pxp: Termination tests
Thread-Index: AQHbjigB+1JR39SiLUiMy1+T9ebVubNm3WOA
Date: Fri, 7 Mar 2025 01:04:19 +0000
Message-ID: <462500b98da99d4bb73a00ad2131089db2226221.camel@intel.com>
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
 <20250305233951.3488609-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250305233951.3488609-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6312:EE_
x-ms-office365-filtering-correlation-id: 9b68dde2-192c-4d63-10ee-08dd5d13fd4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHNNRGMveXJRMjk3c29sQ1V0TmlBMGt5eGVyeWw5RFVRc1Fnd2hnYzJsZ2JD?=
 =?utf-8?B?cVA3UkNpYjFyMHRZUmdqSGJEQ1N6RXlJaGc5RGhBUW5wTHJWVCtKRmd5R3pI?=
 =?utf-8?B?bjRmTS9DcEs5TWtUT01EckFTRmMxTW9WK0syNGRIYUJkaDVJQ3pnT1FBYmMy?=
 =?utf-8?B?eDJ6LzBVL3pjV29Jdk50dGp4aDduQzFKbmczWUs3ZXRwRnBlODBsUGlCUjEv?=
 =?utf-8?B?czljdGlNdEs0aXN5UlNZbzhEVVpubTdZSHozUGxSUnVaVzdnWCtwWDNSRkht?=
 =?utf-8?B?OEFLMDZLdWxPMHhDVHdyekNhd0JOeUtyZXBScWdUbWVhRnFsUGt2OHg4ZkdX?=
 =?utf-8?B?NHovTDlTUU51c0dhaGRLY2ZvWHlVeUxaNWhVbG1wRThIY1ZTb1YvcngxN3RY?=
 =?utf-8?B?ZkZLd1dHWHZteUpjdEdueElWRUIzNlZNdjlibXpzSFBhZ0V5MGQrblZDVmFH?=
 =?utf-8?B?ZXV3c2g0SHZYY1h2a0g1RC9tWkZIYVhHMkdXeEdLc0d1enJEMnBSRkxQTVBu?=
 =?utf-8?B?dUFZR3htREd5ZC9uK1Z2dDRSenRISzI0Z2RDQWRxS0ZXd2R6eFl6aGNUQ2tm?=
 =?utf-8?B?eVBKMXpBWGVwbVFpY3dqcEpYdHBDVDY2eU5vRHR4eVN1ank4VDlCUjduVTRr?=
 =?utf-8?B?bHVaSEk3VjE3YXhtRmF4SE1RU1JyMmRoZkFyY3BPVWNvSjAvcnJQUktXQlhL?=
 =?utf-8?B?bGxOejdKbTR2YVA3ZWk0eHhIczFoay9GU0VnNHllcFF5OWVhaEcvS3E0cTBP?=
 =?utf-8?B?T2VpaWMwZFJSN1I5aVBvN3lTUi8vZkF2a3h1SGN6QTF2RktON3V0c2RBTmZM?=
 =?utf-8?B?YTNIaG5yTEFhUlF4QzJWU0Z4NWFKVmdwU3FlYXJNYnlZL2g5RE1iVUV2NXNk?=
 =?utf-8?B?U2piM0hnS0Fta1NFYmQ1ZmVwbDlmMnkwUzk1UnpXeEZQMXMwNVJSYjZvTmxk?=
 =?utf-8?B?ajVpa2VqcFN3Y2FjOTU5RnFqSGliRmJNL2FnSFFMcTJObFNxeHRSU2ZmZmwz?=
 =?utf-8?B?SGhubEh6SVRWdjhlR2hXeFgyTC83dmZHZXlkSHNLSDJHUWF1aGwxeURHbFZL?=
 =?utf-8?B?WGFmN2dEUFdnNmE3SUtNZXBQa3ZRRDMwblhsOUEyM0hSaGI2RkN6V0ZxME9w?=
 =?utf-8?B?V0pCNGFyb3pIdDZtbkFPZmNXS2F4WWUwNXEwb0RwT3VldWRNbkx1Tk5jMjJI?=
 =?utf-8?B?Z01nYXR4dXo4T21KVjVUY0lqa0VqRkU2a21KcmFhcTV6ZEtCMldZcUs1Ykw3?=
 =?utf-8?B?R0hLNTRXSnFadHIwcGVhR3c0K0ZmdnBuYkJISHY2TVVJa1pCYkpZKzlVaVZC?=
 =?utf-8?B?N3dBdXRpQ1ZuTC9OZ0hlb1BWcDNvUDRjK1V1UU1ndzE4WUFrNWY5bmtqQ2VY?=
 =?utf-8?B?c2F1cW5vWkx1UHBDNWsrcG1sOWs2d3U4MjJMRDRuckNUaHdqLzhub3ZpQjhN?=
 =?utf-8?B?UlYzUEF1ZUxNQmRxSHRsYmF6MmV5VU1GTlFBSUFiTTRoVzVwWXliNVdWdEJZ?=
 =?utf-8?B?T0xuZCtmTmFzcEZ4enk0VVBvUWpxMWtFZjIzVTFMdXRlaXlQSTVYTlpFMk5T?=
 =?utf-8?B?RGUwYmFNQkwvbUpsbnJnMHBJZkQxRENMckVpdStna0lTbjBlUHZtSHhSQVlR?=
 =?utf-8?B?SzU5bDJBUWVzTFRKMHp4bktRZTNYZmtPVmVOMzZmWWlKYzM4STZqdy9rMWxw?=
 =?utf-8?B?T3pvanR4dWxIWGs5WW5xNXpETXdtSFVoSkg4UnBhVG9kK2MrZm9Xc0NCeGhh?=
 =?utf-8?B?eEFnSU9PcnJ5Y29EVERRQUt3Z3dYUXMvYkZKaU5USDlsdHlacWYyOVV5Wjc4?=
 =?utf-8?B?ODhNRGdnRmRMdUoxVlVnNFZRK3JtcUVHb3lsNjZET3FoNWRaT2Q1b05DbG43?=
 =?utf-8?B?UVlJTVRNTXVWdys4THUveEpjQ21VZEN4TTFEaVhZd2dxc1Job0U3SW9jUW9r?=
 =?utf-8?Q?C36ETAV6SijkoouwTL2I60E7U1ydkZ0n?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW16U09BVUh4SVVWcVdxYkhEeHlXdy9KR2hIZnlPV2t4azA2NE5ON2RWUU9j?=
 =?utf-8?B?V2FUNjV1b045cURwalIyVXNjNDAvOGlnRUFoUTJ6SFVyY1I5TytMTUJCTHFh?=
 =?utf-8?B?YW43V0NVN01TWWY0REExY2tFQlpDTWNkcnhxaTlwY2ljQzhoQ0pxZUFyVnVs?=
 =?utf-8?B?NzBkK2NvOTJ1T3BueXNGVjNtSmhBTVB6UDFSOHcxdW5BcVNhZTRDeTZqYVJl?=
 =?utf-8?B?Ykc2NWp2bGxWcTRxekxLbXlZTlorTHRPeXdtTVRDNmlsV21iOGZPSlRxRnZU?=
 =?utf-8?B?eGJWODlNY3dsV1hvWnlGQm1GOVVuZGk0Z0xZWEkyaWRSN3JzVVZlUXJhdVJI?=
 =?utf-8?B?by9YeEdZM0pDRE14VUhmZEpGS2JnYnBMaG03K2lTcnhWK3lZekkvMkhLNUY5?=
 =?utf-8?B?Z3BwYVpFN2RGQndkckxzZCtwSStFNEx2OFQrN2UwM1NpbmdMYytnRHJpN0h2?=
 =?utf-8?B?R0dJK3VoUUJTVDBKeXl5dmdEb2xQZ2NFK1FzdVh4Y1VQMENHbWZMa3pnWWpF?=
 =?utf-8?B?YlZjanZMVE9zMFhDOWhsQmx6eG5zZFArQi9OT2VvS2xQOTM0Nk8vY2lDZk5h?=
 =?utf-8?B?dmJaUEFQSzdEZ2VZYTdFaHVtaEdIZHBBVWFvL21XYkhBb29ERXFyMmJPaEZ2?=
 =?utf-8?B?ZUZCY1NMN3YraXlTalVpMHlCellnYWVJdmp1Vko2ZE5XS2wvMmpTcVNTdHRX?=
 =?utf-8?B?UklpdVlPWkphT091UmNWMmxRRzJZQ1lzK3J6NHFFV01XWFhBdDZWeXh1RlVn?=
 =?utf-8?B?ZDBvbHluV1N4OHlzRCs2NkcvR1gwZDdBM2oyRFQ4Y2ZGajByVW5xbk9QU2Rm?=
 =?utf-8?B?YyswSVlhc0FwR2JDODRCSjAzQm1md0laMTdEN0ZUdWIxKzZMT24vbk5EMGRK?=
 =?utf-8?B?YWdmM1MvRXIzd2FSQktzWFlwdHpRb0t4b09TM2w4bGk0NWJvLy9tVEZlNjBz?=
 =?utf-8?B?QkRMa2JkYlpFbExpWkU0OXJrNzZKdEF1T1RMVHBHY1lCWlFTNjFmYklzMEdl?=
 =?utf-8?B?Q1VZblhTeXlaN2lZd3JkRm9lL2phMXZTdVM0RGZXbHVxdWNnVFRiRk5meGlK?=
 =?utf-8?B?VGp6WTRiTm9aOWp4dU5UcmFsZExBKzhrMjkrd0w1M1NGZndpV0x3M2JYUkFj?=
 =?utf-8?B?MUhCcnIxSGxEUHpSYmRyVWJQT3plcmVDcGpWRDVHV2NaNENpUjhNQkg3bytO?=
 =?utf-8?B?OFdRdEd6NjVrUUNWQi9OS0dHSktLQVJJZHl0aTRJVko5aWpwbHFsU1dvVG9Q?=
 =?utf-8?B?STRlV3MvWHVsRFgwdmRpVUhyMEU3K2o3SENIN3FVMS9DZjVEN0VGRlpaSjVH?=
 =?utf-8?B?LzZvZzJ1VEFoTHIrK2NDYkpHeDZDdXgvYm1KMGdqU1RjR25rbXR1c2gvcXpE?=
 =?utf-8?B?Z3FZSVlwTmxPQ2lvRUF3OXJqcG91RkxsNFp3dk5vZytEckJ4ejRKaUVpbmRF?=
 =?utf-8?B?R1NTdUJ4SDlUWDU2aUlWVkRUSFQ4cXlWV01vQ0x0YVJNam1YWEtxUU9aOEJP?=
 =?utf-8?B?T2NMR1lORHUyWmplYWRHcGdGWFRuWjB1S1RZNVc1cU4zUUllL0RlWHRtSnVX?=
 =?utf-8?B?UzloR2dUbkQ1RVg5bllGcC9QZmYvTlM2TE1LOWFnK3dNM1l5bVFUck5kQVlT?=
 =?utf-8?B?ZHlpSVZOZFNqU0NQb3pySXJQeW5JVEprVVZ5bWR6clgveGV4QzR2WEIvOGlV?=
 =?utf-8?B?RXF2QU9HM2huYkNGOTMwdGhGUnNGR2dFeXVTOFZoL2owTmNnQnpCdlp1NE40?=
 =?utf-8?B?YXArNTBON1E3VUpCS05tOUFpUVFFZVV2ZXBzODcrT2RVbDNIRzRMRkpXUWk2?=
 =?utf-8?B?WUhkaGErK0ZuWHJyZzNaQUYybHlXa0tDMjhCYjQzMVJsRlloUUpEYkU5MnRt?=
 =?utf-8?B?QmQ2cS9RMytyYnhHV0ZEWEd5bGZXSHVCMXRXSWhxUXVRNVlZSkppVld4SFhk?=
 =?utf-8?B?UEsvb3Riaml2SEJwQ2drN21xc3NFSlhOeHVuWWNBakdFSGx5KzVkMVVxR0RB?=
 =?utf-8?B?TU5meTBNRUI2UlpGZnhSMUxHR0dUSmVOdEFveVYwNXBxYStxSFRKU1ZWK3B4?=
 =?utf-8?B?RFBSSFA3ZWxTRnh2NFJmaU5tRERMcUNwSDdYWnQxOVhWT3AxSmM0ZGVISmp3?=
 =?utf-8?B?SFZPZWZDRE1PcTYrTHBLcEJ0a0xpNDR0b2tMUnhlaVkwSW9wVlZ2a3RVZUdh?=
 =?utf-8?Q?PEp+2j14WV5aQw3fTVmB8oA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA4A4BCE9B9DC34E99F0D3E877DDE339@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b68dde2-192c-4d63-10ee-08dd5d13fd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 01:04:19.1549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56tSr4xegbSnXPmWXptP6lAKbQp9yA/0EKrUKVKpCGuloRV5w+I14IQSp69wWXXsiP0Ae+5qRZJy1AvgWLUyMlHByBUkH3/QwynjG771mOlDMTQgqaNoDHwwvzVV9GQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

SSBzZWUgeW91IGhhdmUgYWRkZWQgdGhlIGRvY3VtZW50YXRpb24gZm9yIGV4aXN0aW5nIF9feGVf
YmJfZXhlYyBhbmQgeGVfZXhlY19zeW5jLA0KYXMgd2VsbCBhcyB0aGUgbmV3IHhlX2V4ZWNfc3lu
Y19mYWlsYWJsZS4gQWxzbywgdSBoYXZlIGluY2x1ZGVkIDxmY250bC5oPiB0byBhZGRyZXNzDQp0
aGUgdW5kZWNsYXJlZCDigJhPX1JET05MWeKAmS4gVGhlc2UgYWRkcmVzc2VzIHRoZSBlYXJsaWVy
IGNvbW1lbnRzIGZyb20gS2FtaWwuDQoNCkkgYWxzbyBub3RpY2UgeW91IGhhdmUgYWRkZWQgdGhl
IGRybU1vZGVSZXNQdHIgdXNhZ2UgdG8gZGlzYWJsZSBhbGwgb2YgdGhlDQpkaXNwbGF5IGNvbm5l
Y3RvcnMgYmVmb3JlIHJ1bm5pbmcgdGhlIHJ1bnRpbWUtcG0gc3VidGVzdCB2aWEgc2V0dXBfcnBt
KCkNCihhbmQgcmUtZW5hYmxpbmcgYWZ0ZXIgdmlhIHJlc3RvcmVfcnBtKSBzaW5jZSBhbiBhY3Rp
dmUgZGlzcGxheSBwaXBlbGluZQ0KY291bGQgcHJldmVudCB0aGUgcnVudGltZS1wbSBmcm9tIGtp
Y2tpbmcgaW4uIEdvb2QgY2F0Y2ggb24gdGhpcyBvbmUuDQoNCkl0IHdvdWxkIGJlIGJldHRlciB0
byBnZXQgS2FtaWwncyB0YWtlIG9uIHdoZXRoZXIgdGhpcyB2ZXJzaW9uIG9mIHBhdGNoICM1IG1l
ZXRzDQp0aGUgcmVxdWVzdHMgaGUgaGFkIGFib3V0IGZpeHR1cmVzIGluIHYzIGVzcGVjaWFsbHkg
d2hpY2ggdGhlIHVwZGF0ZWQgY2hhbmdlcy4uLg0KYWxzbyBJIGFtIG5vdCAxMDAlIGNsZWFyIG9u
IHRoZSB1c2FnZSBvZiBmaXh0dXJlIFdSVCB6ZXJvLWltcGFjdC1vZi1zdWJ0ZXN0LWVudW1lcmF0
aW9uDQp2cyBjbGVhbnVwLWFmdGVyLXN1YnRlc3QtYXNzZXJ0Lg0KDQpUaGF0IHNhaWQsIEknbGwg
cHJvdmlkZSBhbiBSQiBoZXJlIChzaW5jZSBLYW1pbCBkaWRudCByYWlzZSBpdCBhZ2FpbiBpbiBW
NCkgYW5kIHdlIGNhbg0KY2hlY2sgd2l0aCBoaW0gb2ZmbGluZToNCg0KUmV2aWV3ZWQtYnk6IEFs
YW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQoNCk9uIFdl
ZCwgMjAyNS0wMy0wNSBhdCAxNTozOSAtMDgwMCwgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgd3Jv
dGU6DQo+IA0KYWxhbjpzbmlwDQoNCg0KDQo=
