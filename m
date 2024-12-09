Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6CFE77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 09:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7206610E69C;
	Mon,  9 Dec 2024 09:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVNHmJs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF3E10E69C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733736234; x=1765272234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dSsgz3mbx1yhQfNJ2H8ewJsP5OQh8CNqggOCoOKy80I=;
 b=JVNHmJs28u14Mv+7tj26msuz09e2zWzoFE/PLJh8bkjUBO1kuBkift4g
 JSVJZByo32Os7z31gOP7PPhHw5eJDRI/W5CqVMoKW/dPgBxujgF387aQA
 2vpcFFARNkMmDQL9R7AjFCd6zkxZAIXv8mJWtuo7AYrIqIxPl/JHkkwEg
 VlnjwVhk104mKRIef2885aFUu65cp+87vYT6X+OVppeCgwvAgErVQrJPU
 Fq5hhHW/k3sqSCoIQlKzuZBMFEZKmoKjQb+h/EiM1MkX/pMnjeee7bFfG
 uqo1i2NI47+LECV1oM31YobbqRqOgtlBkcTJ6Cjm3/6XQQd3lYoczp0NV Q==;
X-CSE-ConnectionGUID: Ubznf6iPSamwJmYX7pxvog==
X-CSE-MsgGUID: 8XjcbWT1Rkq9UZXcmZZN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34169742"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="34169742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 01:23:54 -0800
X-CSE-ConnectionGUID: OpFqXHGXTQegT105EERPKQ==
X-CSE-MsgGUID: YqcUtXc8Q9CQhAkCz98pKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="95098707"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 01:23:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 01:23:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 01:23:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 01:23:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSBrFHPctdd2KfXDEELr+Yon37peUijen1O/3KU7jv3xoXVWIxoBQaYvJCncGFfmTXQ7QELvJ9g+CzQ/pl5o2zAUhJqUmXpARL0eiGIJTCpkRV/ysdHojHi1d5pVnfMIi2mN/j+UrEYjStTCoGM/0P6LwQTGbninIUXiUaNtvdIOw5Pnvm0QUYXP7wQPdMAb3nudogN7Llaj01G9i5yjZWxHUms4sUAUtXNUxw12jgvpdZQaqwmK+7vv5cS+bBk/cHUvOV4rs/T2lrWZFFutUhSceCub6BMB6HLFQVc1IEmIMrlR60cNKgyU3obZ5OKlsV13OAVo6wM7s4TOo+7DgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSsgz3mbx1yhQfNJ2H8ewJsP5OQh8CNqggOCoOKy80I=;
 b=onk8ExPb3BTP61h1mNAE2pbN5Kfan/37bl9GQ9VAxwnxJFzjsrmw+8uHd9DcICrCrFsypRTaNPr0QpLswoWroLIZSxBfQ5a1B4twUb6O8+yCQn8UKkF8NqR/u4FSKN47d09gcdv/ZNi4nOtIvK36r7oGOosj3A9uozzz/Uugml1Ka5huQqNmMKWKMStTL40+LbehtNzgyiR0QuwJWnvSHLO8P86Eb+MDDd2WYhXI79/LQWgrSuwjgN8rpJKtpSQbTfFSE9whhXriwZZ67MrO7x2ntIi6JA9PKxNJofadi51a9kEI/1yHrJy8LsbR/X2Tl60xQH64yujl1Qi0eA4ciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 09:23:51 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 09:23:51 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_mmap: fix assert_caching on small-bar
Thread-Topic: [PATCH i-g-t] tests/intel/xe_mmap: fix assert_caching on
 small-bar
Thread-Index: AQHbPP5l1DX96Pwr4EqZSOQ1xAZ9V7Ldvh6A
Date: Mon, 9 Dec 2024 09:23:51 +0000
Message-ID: <8bd208bf4ef4e4ae333bfb3223ebc487688a82b4.camel@intel.com>
References: <20241122164730.326543-1-matthew.auld@intel.com>
In-Reply-To: <20241122164730.326543-1-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 20638d71-0c0c-43c3-fe72-08dd183331fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VzhLVWdtQnJkZFhBaE5MMlAyeU5mNEVRZnpQUndERktwSUtkMUdVOTJvSGJK?=
 =?utf-8?B?TnpsNTBOVStsMUVkby9ndU1oMllYNTVPUTNKYTIvQVo5WnBKL3Z0dlhkV2l0?=
 =?utf-8?B?bkQzdTNrTElrOU51Ykp2cXEyczR4dEdDOWtwSmJvdjNsKytnK1B2RUxBU2xt?=
 =?utf-8?B?eDdJMVpJMVZCOG9BTUgzQitVeWZISkk5S2VEeERZWlNXbGNXUkRxNGdvbWpx?=
 =?utf-8?B?VkRQS0lpckV0NVMyQk5hdndqdFJVRXNkdVpyR2VldG1BNHM2ZXR6Ym9XRmpn?=
 =?utf-8?B?eG1WMlNDbHRZSFlGZmhoMlFXUTd3ZjZCTmJ0UVpIa0Qrb1p0WnZOMk5TZDIx?=
 =?utf-8?B?SDVsdHV5dzRCZmpoR1ZJbTdMbXpKa2pWUmVCR0hZRDZDOUU2RmJQdkdQVDQ2?=
 =?utf-8?B?UUhodjFxZTJnMWpuaUtzRVZzelMrMmxaQTVyWHc3RmtSakdyOWpydTNnVGhK?=
 =?utf-8?B?NFYyN1JhdGhVWFVyS0I3bUhDU3ZiMkNneFZJU0RzT3UraTArWVBlNFYxUEt3?=
 =?utf-8?B?cnlXS1JtU2YyUll2TXk2bHU2eHo2cTc3ZHdTemRIT1dXZlUxTE0vSysvUjRr?=
 =?utf-8?B?N3k4VVZUZkwxZkEyN1VrOFFYSmFmM04xblJmeklWRWZYU0lsSnVHajdUVDBD?=
 =?utf-8?B?NE9RQjFpQVBuV0JmRW1pOW9QaWwrajlxTjZhWC9PTUIvRmRkYTBQaWxJMWJv?=
 =?utf-8?B?S282OThkcHRJbXBGYW92Zk9SbUxKUWE4VS9QSm1UL3NHOGwvM2twS3A3WHl6?=
 =?utf-8?B?TnRNTndydDhCRVVHNUp4UjFnNWxhSEhBZTdpenlKNGZPU2R4T1pOTm94MWgr?=
 =?utf-8?B?Z2tQWlUrU1RiaUtIY1VzbjExK0wwY2lZQkpwOXIrZkpDTUVEY282RXE1Y0dK?=
 =?utf-8?B?aUNaQTdIRlpNSTUvUFdDQjZjSEIwbEd5N3F6RGxKWGlwTEVtMTFzVjY1c05K?=
 =?utf-8?B?ODFEYnE2VHIrR0ZYZ2RCV1c0VkZuQlR5aExXN0NQMUxKVDJVdGRjcUxwYm4v?=
 =?utf-8?B?MHNkTlhPUVdCMEovMUpOR0QwSWZiaElYeXV4L29tWE1FeHZFODR5dGhha2I4?=
 =?utf-8?B?clBQTktqMVBCY0dNNFNoWkpRbEcvKytMUHQ1ZERwc0pETll3VnZlbW5Rc3F5?=
 =?utf-8?B?QkkzMHp2bG42VUNqNU1ZeHdNOUU0dXR4SE55eUhzNHJ0QjNkN1JNWDdRc3Ey?=
 =?utf-8?B?NnlXWlpOTFk2R3NSaWV2UlpBQWdtMm5hK2VaSFo3RzdnY3hPTkRoYjdIVmdx?=
 =?utf-8?B?TzU3RGo1SW02c2ttRFVVRVY5SFdNTWRwMm1SZzZMVUI0Ujl1bGplQnUrcjMw?=
 =?utf-8?B?WDZGQXBvcGtLeVM0cit6RWx4dkF3ZW9ldjlLS2ZKUVErWG9xOENlWXhJWG9Z?=
 =?utf-8?B?NmhCcVN2WnNYVkJCSTVobHF2UG95R0QxTGdZTmJLNGdkSTJpekI0R2E3Nkhs?=
 =?utf-8?B?VTJERVRob0dNK3ZTMDFBRUR0V28wRm04cHp2N3IzS3YzZEVXVkVFRzNuZmUz?=
 =?utf-8?B?bXMyODVpOGkyejc0RVUybU1SUlhuTFdncHJDbUJHTDdxdG51bHc1QVp3eXlp?=
 =?utf-8?B?ZjNGQXMvQXQ4QnZOdG1Qd1dmVlRsTmRiQlhQaVVuVFpLeG9YYVJUL3hWbW5M?=
 =?utf-8?B?aWJ5VkFOYXgwWjVqa0JLQmhtQUJnbHhwMEx4c09XS0t2OGhSYUFnbTdpU0sy?=
 =?utf-8?B?RERvRGlqb1lCYzc2Y01CNUMwWnpKU2QvSytBYUF5aHJDNWwxSEJOVUdhZU53?=
 =?utf-8?B?ZnZmM2hKRkFKYTJTWHhxT2Q4UHl4cXNHZ1ZkMnl0N1psenIxYkRUcm5hVTdz?=
 =?utf-8?B?Nmw3K0luU294M3l0VlM4Qm5JOUdZU25xdnNCUEd6QUZZY1p0Y20yL1ZYZzlH?=
 =?utf-8?B?dnd4ODQ0Q1BKZDloNGpjWVVCWUU4YU5VYnpERHNqU1pvSWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEtBWmgvTmpuM29GOUtNMysxYTVwS0JIY0dza0RpTWNVTVdCZHh1N0o4Q214?=
 =?utf-8?B?NGZQeGZnVGVRVkNVU0JKbFFWWXlRWVRndytKTDBvNUVaRXRZNVNNaUp1Qkww?=
 =?utf-8?B?ei9sTXdweTNROGdyUmM2NGNVRkN5K2JGRFRXZTFsY2pqUmt0WHdXL3IyM0tD?=
 =?utf-8?B?dXhXOXprWERLcVBrUjd2WEdyNTg1ZXZqV1pDbkFrbjhxMW9VOFk0d0hPemYv?=
 =?utf-8?B?elhQRFlHZGVjY3pvQ2l6TzVWMTJnUDZ5UnpuWUo3cUduSW9odU9Id2Y0ZGpX?=
 =?utf-8?B?aG4ybjBVZFptYVBHU3E5YUQrY1JTbnE3dXpEUjByMHhIYTBXT1NGSU0xRDUw?=
 =?utf-8?B?MURMY040TGh0QTc5elh6eWlWMlhNUVozckFuVnUyLzJReDhUclBtUHFhdy9q?=
 =?utf-8?B?dnVmMGhaQmNnY09LbXNxSlVtSmcvdmxEbDVRM29hRTVhVXM1R3pibkdlNlRO?=
 =?utf-8?B?SW9FcmNDZ2J6WW9JcmRxRnFsdVJvU1ZUdVkzUENQZVVmVkh4WHZqZ1Yzc2tt?=
 =?utf-8?B?K0hKS0l6M0gvOU41SnZPbzhiSlJ3cHJDb1IyRXl6Uk9CZlFqN0trZDBPOURN?=
 =?utf-8?B?clQ5cmpvcmVqNFFNUTJsUXBuQ1ArbUl0aTFZZXYxR3cyTTdRMmRuVU9qQVcr?=
 =?utf-8?B?UmltQkJuUzFldGRYUVNLN2RBRW9xeHhXaWk0ZlhueTZXNWVwUDlEMUVEN1B6?=
 =?utf-8?B?SUoyanVVUi9oMlFwTFNrdURDREt1ZUl5Ym5XRFFaUG5GZ01LTkdwb2FxQVRk?=
 =?utf-8?B?NndnK1dKNnR6eHJUdUhsUDlNZlRRcVNCMFVIS0kyUTlPNVpaZjFKbzBkTk9K?=
 =?utf-8?B?Zld3ZExwc1dqTW4wTVRPaHE3TzBseTcySXFjWncveCsrRlRvVDk0TUlJK29Z?=
 =?utf-8?B?Sk1RSmxtZS9ubWsrSjRUK1cwWTZYcWxwR0h3NytFanlla3NHVXFoalY3QzJP?=
 =?utf-8?B?NlhMUnJRTVVWSUVMc2xOSmRvRnZOa2VtazNvSlkxRVpwVVhzcjBiaEFXZlNG?=
 =?utf-8?B?Y0NKanc2RStwL1VSR1V1SDRBNkxiaCszYXlUTW9PNlhpYlJpNzNpL1lHNndi?=
 =?utf-8?B?c1RXVVBscXNXa2ZYRHk4b1RNYTRmRnhwZ0NMNmJmQTNLbkpsZHZNZW5MV3hQ?=
 =?utf-8?B?eUFVRmNza2piaGgreGFTc2ZGT0IrMEZUTlp0ZkRXMUxYeWVuZHR2MWZ1VDFI?=
 =?utf-8?B?b1UzaVptWmd3ZjhPV0pXQ0VzVGwzYnR1YXVxSS9IWmd1eU82UGZxSXNISWQr?=
 =?utf-8?B?cS95S1RYaU1BOW9Xa3pwYW1TYUNWS2daYzAyU0Y5em1DYWhrYlkwRWNncVA1?=
 =?utf-8?B?QnFTVXAxYTIwRmNDQXBkYkIydC9ZcG5tVjRoK0hqMGREWnVZRGdZSm9rKzFk?=
 =?utf-8?B?dUdqcjBZS1lwWTBLc2lXd2hUSlhnS3A1ODRLS0dDa0lxSnRrNmQ3VUc1L0dR?=
 =?utf-8?B?Ry9PUjhqVDhIOUVWbGs1RWxUQnFMTDEwZU81M2ZBY1VpMmswYTMxanRvY3Bs?=
 =?utf-8?B?dDZ2WVU4emc3a2dPeGZNd0grTStjSXZ1Qmd5OGVjR2dSTkFiSWpoM2JTQks1?=
 =?utf-8?B?ZFlSc3ZiS2cxME5leFZDSU42T0RoZ1RyYjRTbFVSWWJSU3ZpRms2Q3ZTWTJI?=
 =?utf-8?B?Z1lnc1pGU21jcXk0aiswUm9wdTVrazZFbkc2YUhCSDFVREtlRE5PUTU5Z3Nh?=
 =?utf-8?B?YUY5YTcwQTl2eVQrbXNkOGhTaVRzK1BOeXBQdGxYTW40ZWZHVi9TSkh4Ylp2?=
 =?utf-8?B?ZldNd1hDK3F6MEpBS09xeHhuak1WVlVKYkdGZ0I5c011KytzZWpSUTRueE9s?=
 =?utf-8?B?L3dicjdkc1M3ODNkdHBZQVEyQmxVb00wakIyV3RGLzJ3Tnc0U1JNUjNlQ202?=
 =?utf-8?B?eXorc1dPWndPSnFpNFdnRjRmT09SUXNyZy90NjFLd0YzU1FPRzc2N2JVWTVS?=
 =?utf-8?B?NUdueEVVOEExQ1hZOWF1d2FHYVRVYW02eTNaeFpITC9TSnVuY0tSRTNDQWh6?=
 =?utf-8?B?djQ1R01kdnBNTFVWQjhhQ2NrUm9sOWpQOHJjb1NIR1ZoR0VRRUNSS21TaEVt?=
 =?utf-8?B?eVZLcjl4eXFXSEUwUERodHFoQXFEczg4NjVGQjVCaG5MTERTaWpiY0diYW1C?=
 =?utf-8?B?YWY1ekMxVWNlM1NUaFVPZCt3TGtqOThEZWhOamY2TGRDWHgwZXZkTkREK2lp?=
 =?utf-8?Q?wmZZSfNT/qJWmVUsx2BuxiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DEC966CFB64274EB798A3D2BA826BAD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20638d71-0c0c-43c3-fe72-08dd183331fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 09:23:51.7132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfx3AkH8uxICLsunaAtFAKeCeX+CEQcQG5VxMYfxWZlJmalQxeUGxVAOu6JrNTTe6OodpDrdYBZPnGesqqtV02XAg+DmIdtcnK1puy2CuO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDE2OjQ3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE1ha2Ugc3VyZSB3ZSBhc2sgZm9yIERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJM
RV9WUkFNIHRvIGF2b2lkDQo+IHNpZ2J1cyBoZXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0
dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQoNClRoYXQgaW5kZWVkIHNob3VsZCBwcmV2ZW50IHNp
Z2J1cy4NClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpl
a0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfbW1hcC5jIHwgMTkgKysrKysr
KysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfbW1hcC5jIGIvdGVz
dHMvaW50ZWwveGVfbW1hcC5jDQo+IGluZGV4IGZjNWQ3M2Q1OS4uZDgxOGNjMmY4IDEwMDY0NA0K
PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9tbWFwLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbW1h
cC5jDQo+IEBAIC0yMDcsNyArMjA3LDggQEAgc3RhdGljIHZvaWQgdGVzdF9zbWFsbF9iYXIoaW50
IGZkKQ0KPiAgCWdlbV9jbG9zZShmZCwgYm8pOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBh
c3NlcnRfY2FjaGluZyhpbnQgZmQsIHVpbnQ2NF90IHBsYWNlbWVudCwgdWludDE2X3QgY3B1X2Nh
Y2hpbmcsIGJvb2wgZmFpbCkNCj4gK3N0YXRpYyB2b2lkIGFzc2VydF9jYWNoaW5nKGludCBmZCwg
dWludDY0X3QgcGxhY2VtZW50LCB1aW50MzJfdCBmbGFncywNCj4gKwkJCSAgIHVpbnQxNl90IGNw
dV9jYWNoaW5nLCBib29sIGZhaWwpDQo+ICB7DQo+ICAJdWludDY0X3Qgc2l6ZSA9IHhlX2dldF9k
ZWZhdWx0X2FsaWdubWVudChmZCk7DQo+ICAJdWludDY0X3QgbW1vOw0KPiBAQCAtMjE1LDcgKzIx
Niw3IEBAIHN0YXRpYyB2b2lkIGFzc2VydF9jYWNoaW5nKGludCBmZCwgdWludDY0X3QgcGxhY2Vt
ZW50LCB1aW50MTZfdCBjcHVfY2FjaGluZywgYm9vDQo+ICAJdWludDMyX3QgKm1hcDsNCj4gIAli
b29sIHJldDsNCj4gIA0KPiAtCXJldCA9IF9feGVfYm9fY3JlYXRlX2NhY2hpbmcoZmQsIDAsIHNp
emUsIHBsYWNlbWVudCwgMCwgY3B1X2NhY2hpbmcsICZoYW5kbGUpOw0KPiArCXJldCA9IF9feGVf
Ym9fY3JlYXRlX2NhY2hpbmcoZmQsIDAsIHNpemUsIHBsYWNlbWVudCwgZmxhZ3MsIGNwdV9jYWNo
aW5nLCAmaGFuZGxlKTsNCj4gIAlpZ3RfYXNzZXJ0KHJldCA9PSBmYWlsKTsNCj4gIA0KPiAgCWlm
IChmYWlsKQ0KPiBAQCAtMjM3LDIyICsyMzgsMjYgQEAgc3RhdGljIHZvaWQgdGVzdF9jcHVfY2Fj
aGluZyhpbnQgZmQpDQo+ICB7DQo+ICAJaWYgKHZyYW1fbWVtb3J5KGZkLCAwKSkgew0KPiAgCQlh
c3NlcnRfY2FjaGluZyhmZCwgdnJhbV9tZW1vcnkoZmQsIDApLA0KPiArCQkJICAgICAgIERSTV9Y
RV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiAgCQkJICAgICAgIERSTV9Y
RV9HRU1fQ1BVX0NBQ0hJTkdfV0MsIGZhbHNlKTsNCj4gIAkJYXNzZXJ0X2NhY2hpbmcoZmQsIHZy
YW1fbWVtb3J5KGZkLCAwKSB8IHN5c3RlbV9tZW1vcnkoZmQpLA0KPiArCQkJICAgICAgIERSTV9Y
RV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiAgCQkJICAgICAgIERSTV9Y
RV9HRU1fQ1BVX0NBQ0hJTkdfV0MsIGZhbHNlKTsNCj4gIA0KPiAgCQlhc3NlcnRfY2FjaGluZyhm
ZCwgdnJhbV9tZW1vcnkoZmQsIDApLA0KPiArCQkJICAgICAgIERSTV9YRV9HRU1fQ1JFQVRFX0ZM
QUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiAgCQkJICAgICAgIERSTV9YRV9HRU1fQ1BVX0NBQ0hJ
TkdfV0IsIHRydWUpOw0KPiAgCQlhc3NlcnRfY2FjaGluZyhmZCwgdnJhbV9tZW1vcnkoZmQsIDAp
IHwgc3lzdGVtX21lbW9yeShmZCksDQo+ICsJCQkgICAgICAgRFJNX1hFX0dFTV9DUkVBVEVfRkxB
R19ORUVEU19WSVNJQkxFX1ZSQU0sDQo+ICAJCQkgICAgICAgRFJNX1hFX0dFTV9DUFVfQ0FDSElO
R19XQiwgdHJ1ZSk7DQo+ICAJfQ0KPiAgDQo+IC0JYXNzZXJ0X2NhY2hpbmcoZmQsIHN5c3RlbV9t
ZW1vcnkoZmQpLCBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCLCBmYWxzZSk7DQo+IC0JYXNzZXJ0
X2NhY2hpbmcoZmQsIHN5c3RlbV9tZW1vcnkoZmQpLCBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dD
LCBmYWxzZSk7DQo+ICsJYXNzZXJ0X2NhY2hpbmcoZmQsIHN5c3RlbV9tZW1vcnkoZmQpLCAwLCBE
Uk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCLCBmYWxzZSk7DQo+ICsJYXNzZXJ0X2NhY2hpbmcoZmQs
IHN5c3RlbV9tZW1vcnkoZmQpLCAwLCBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDLCBmYWxzZSk7
DQo+ICANCj4gLQlhc3NlcnRfY2FjaGluZyhmZCwgc3lzdGVtX21lbW9yeShmZCksIC0xLCB0cnVl
KTsNCj4gLQlhc3NlcnRfY2FjaGluZyhmZCwgc3lzdGVtX21lbW9yeShmZCksIDAsIHRydWUpOw0K
PiAtCWFzc2VydF9jYWNoaW5nKGZkLCBzeXN0ZW1fbWVtb3J5KGZkKSwgRFJNX1hFX0dFTV9DUFVf
Q0FDSElOR19XQyArIDEsIHRydWUpOw0KPiArCWFzc2VydF9jYWNoaW5nKGZkLCBzeXN0ZW1fbWVt
b3J5KGZkKSwgMCwgLTEsIHRydWUpOw0KPiArCWFzc2VydF9jYWNoaW5nKGZkLCBzeXN0ZW1fbWVt
b3J5KGZkKSwgMCwgMCwgdHJ1ZSk7DQo+ICsJYXNzZXJ0X2NhY2hpbmcoZmQsIHN5c3RlbV9tZW1v
cnkoZmQpLCAwLCBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDICsgMSwgdHJ1ZSk7DQo+ICB9DQo+
ICANCj4gIGlndF9tYWluDQoNCg==
