Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43331FD065A
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 08:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2A10E3A7;
	Wed, 11 Mar 2026 08:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnquVUra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B810E3A1;
 Wed, 11 Mar 2026 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773218333; x=1804754333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rbm+BypP/RZrHuh5H+9Y3PYYPuJ9s4n2GCQnh1+V7Z4=;
 b=fnquVUrarTEo4wkzS0VTtslDZVmXb6cbA5HG7LxhY0VRP/yqUpbVTxYR
 uFEFuXW2Ybg/JvFrSxkg/ZHznkcsfQUqRqaGlre4xLsDrFTQgJn3xwa0S
 T85SEsSVe/2n8lmSAi/U7EsGsunlRYiNyWV1z0RgT0lbMSeeV9P8/K6cN
 1o7XicT/sG9e5FsEshxptGWAyawInMNeCExKm3Vw41JnORjLWoaxx3FiY
 n3/HmSyLNDGU2kn6zvN6t0P1M2lBG8ffLvWZEZMyInQHxQcPnq4lRYkMU
 TDuGVOTDDsIL+v1t2W5bQBqeyhENeaER+oSDbsxl3m0GAARK5q1g05k0C Q==;
X-CSE-ConnectionGUID: r4syol63QDSrfGC+lezRrw==
X-CSE-MsgGUID: FqfB6tbwRaioJW0jynaUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74251726"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74251726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:38:52 -0700
X-CSE-ConnectionGUID: 78ZPOW9YSQ2aDA7FWufg3w==
X-CSE-MsgGUID: 5QOlomuJRD26Ny7MZ7ppRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="250898945"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:38:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:38:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 01:38:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=covgusTNEGolH81TTdqRGej4MSryXiyoh2VegZK7pDOcwGev3UXg1N0+4om3PRod7PsS9Fkqrxz+UUSvFaXdp7KiQy93Vem5xd5YgeHT9bSPZQ4um/+JSubRZTjwdh45aHbGIVJ2qN8/SyTZjNKtp7bGGxQ4v3PkEW8t3ZYP7lTOkm7TY01aIJ2jF96WQE0QOEV3OXxN7eB8ukpfvuMBwL7syPCe3/FQcyeDI4AroLeB+pW3U5VmUrw1kuw36EWU/ZK0FdMYa+rBeuKo06vGo8m7St6RYUMEBoPNsQn3Px+n0B2HsSJpURX8i/kdcqvt1s4iqTkGKzEd80FD5kBoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbm+BypP/RZrHuh5H+9Y3PYYPuJ9s4n2GCQnh1+V7Z4=;
 b=lwjsxzNXQPsaclLj8HW5ApQ5JRS0owQWo34s28Xv2UcHomvS4TQn7b6jBjsqIGeX2P9hVIDBBbZd1UBvAUEjaSMtxuMFPqbQILTOOUElu+qnB26hBhfRtPU599NGWdbJn56XVQbN0J47rpYwb3E4zRXK+/BgEI2ksWmMRzEEeGpwRyslBbDUykkUeDWim0tw/Y2rWUUyFKcix3hKyPll8rRN9gkRL3gbj3eCaYsqBAcQR9RHEzeNdDWQnsbmGQdzftC0a21MjprCgGjrIYaGxmTkVWcqKkUiBg0YtJRHQR49s5cvXbxNBGYepaF+5+QuGKm9Btc3jkYhbuLv9Hu3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:38:49 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:38:48 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2k5MTUvZmJj?=
 =?utf-8?Q?:_switch_the_interface_from_pipe_to_CRTC_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaTkxNS9mYmM6IHN3?=
 =?utf-8?Q?itch_the_interface_from_pipe_to_CRTC_(rev2)?=
Thread-Index: AQHcsJssEraPvxn9BkSZ8tW3dRxqQrWo5b+w
Date: Wed, 11 Mar 2026 08:38:48 +0000
Message-ID: <CH0PR11MB5491C702DDF2712B6AA83596EF47A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260309164225.716195-1-jani.nikula@intel.com>
 <177314726572.338934.3819735917217243499@a3b018990fe9>
 <1168d882aab206c78d4ea9586ad4b2373a2c8353@intel.com>
In-Reply-To: <1168d882aab206c78d4ea9586ad4b2373a2c8353@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SA0PR11MB4734:EE_
x-ms-office365-filtering-correlation-id: 70b27b02-bd2e-43f3-e010-08de7f499da9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|13003099007|7053199007|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 5XQarNdjtT8pcgs2prJcs7+0llY6QJDQUip5I1ZpxWmde5qWTj119bEZdUpVXf+vZbXrMhhU1JU6v1I5xT/PYbYw5qpWnmx0sxXojgdRLoNJlvgXxTqL5qwUMlj01CGk/bIhLxL3JfWAEQQ0jnwOtzCZMzWoTI+ZFRBOqsjoiCZnAD5ARpwixoeKayZf0HkOO3uYB2DTZRp0DAnDkdix8XmnSQW4pwCuzbqqYlgeLRcuG0yr5FZUVffjU8lil/0DFTJMsL+AdMJcYfoYVhRrSdaDj/kkwwiBQZPIxsKRZkSVVbE7fQlsbpMx8VzOeOVwo0ZQ8DTQVKO0yjRwjfhUQwCMU9FvTJPIHuV5PDuDmEXoTBpZzI2GncJJ/WA8U098BsmQC3JdKrS2VX82c8haIzRGQg+7eI9IkBnAiVUk0Fx7p52rYDFNyh87RLT6TlVMVP1OtcXNakr2DqBynTUK98f+SfINQVW+UoAm5T8i2Sf78018+2VxJGYYWNeA3u0S2zFd3unh0+/aKkBa/bX9b/LliZAREDlqBkBYzzd3jp5OPa5+GQz3aEnLsdw/aUvVy16SgCseNj8AURMW8NA3MMEqj91bSwxQzioZnvLrxTnMYtqesL7ZuJa+ef2+Irp8VI7rxOEyjtXbSbzYV35UKZhZ+edqIuu4gsnMBR9Sanxa4g8ymjGE9+2GldF8FpOtpER7iFdMbmGyX8qq3vMeRYOKnHI3o613YoBsl9U09SH1rbHjHanQGxXP2JRYKYq7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(13003099007)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXhHZTdneVJrdi95SWo3NlorZ3pIczQza3NVL0pOUXFhcWVYMEl1Syt6ZFRL?=
 =?utf-8?B?eVdJYzlvSlo2bjBJWElPYzJacXN2RlRlcGVJK3hORENkZHQwWmNPUFl6eUFr?=
 =?utf-8?B?THlGQWhQcHUveWxDNkJ1aVV6Tk1uS1RtSUhHaHJGelJtYTZnMGhlUUFlYnFK?=
 =?utf-8?B?WTdFa3BRY1RoY1BibWtxWXQydFdYSHJhcXUrOEFzc0ZFYld4S0F2UGxEN2Fi?=
 =?utf-8?B?Y3h1Qk9sMmRka3ZxSVc1R1ZaZWJOaHZRdDh1QWkvRUpPbWt1U3hRVXRWazN1?=
 =?utf-8?B?RllEdk12RU5CZExrbjZDemM2YUpjaXFCRGV6ek51WGZBUWpwcnFKN2RwMDdP?=
 =?utf-8?B?SzJCNGlLUWFJa3RTZm0zVk9yVWM3NFdHTVl2cDdySHozenVsb04vQUFkdlBh?=
 =?utf-8?B?UkFpcHVaTnBvL2FadkwvcCtXdjREbEZTWnRBYTJJdWZWU0xuaU1IZHd3WlVK?=
 =?utf-8?B?T2I5MFNkdGFqL2lYR0dEWFllQXViSXRUY1JGZ1prK1F6MThoblRmY3lXdjJ1?=
 =?utf-8?B?VmR1cUN1OGhjMWNYRk9jOUVTcTBleFlwdjRMU2NRQ1BMWFNvSENTOXpzUFcx?=
 =?utf-8?B?a2svdjJHcStKZE90WjdhQnlDZlBScVJ2OGZ1ZGk2NFp4MU1wNUdUUUMzTGZt?=
 =?utf-8?B?eEFSSVgyUXhsRnJFYTdyUlVqWDNXVWhSWFhXLzlyeFNVMGZCZE13K25wU1Nk?=
 =?utf-8?B?RVI3c0FzOFdHbGdBVmxuRkRoMjFiVWZxUGtUU3oxTi9yNUtxS2tacXZ1c1Fz?=
 =?utf-8?B?akRSQW5WMlRNYm9mUzVHbkx5OUJJZURoYXRhUjJRWlprSDA3K2JxdjZLNkRF?=
 =?utf-8?B?ZjlTaUZSMTZQY2YrV3FvV3Rsdy9CZ25Nem9FRm9UZDFxcG1hOWpVMmdxaWN6?=
 =?utf-8?B?WkY3S1p5WUtUUThSRGViYlZEUExoOFJwL1VQUnhGSng1a0tLR1kxRVR0RE8x?=
 =?utf-8?B?WG9zUnp3aU4xTjJzczNmY3dKQUd0bUhLRnkwQ05sTnJNS3ZZSGovSVhPdWJs?=
 =?utf-8?B?ZkVZR1JKVFI2eXY3Z0NMWjlqZ3l4bk04TFlQb0dmVGxxZW5EU01Xb0N2VzVr?=
 =?utf-8?B?Qnk4MS9nSFlPL3VyYmFjK2UrYUJ6U0E1ZDZVTzZtYWVxZFJMNXZtdXUyR3dt?=
 =?utf-8?B?M3o4RGMrMFFIemVNeGdWNFVneU8yYzVaTldxTlczWUNQc2o3T1YyZ3YvRENr?=
 =?utf-8?B?OWZEaVZSdUdST1BZV05kdVV1ZGFwQ0hNaFE3MS96ckNmbmF2T1IvZVo2bnhk?=
 =?utf-8?B?NUVmUElJanFxbS91REY3NW1PNFZlS0dSNGJLeUNVK2FrUkQ5ZG5NbDNRRUlp?=
 =?utf-8?B?ZGxnc1R0TEtmQjR6NjE1ZUZ5MGEra3NXV1dYWlh4RFlmZHJhVVhOb0hkeWMx?=
 =?utf-8?B?aTVsdnVyWW16VENLajZwdTRwck5YK3A0dTNBSk1UTnRaQitWUGY1YjZZQzFD?=
 =?utf-8?B?VnYvMkRTb29UVGlLMDJnTFRwT3dHbUJkQXA4STV0eE5lUE1RbXRsRjdqMEpu?=
 =?utf-8?B?dkFUZ0xNWjVRekJCSlExb1lhd1lOTHBvK3BoTjh4WlVyK2pIWnRKZ0Rpb0hz?=
 =?utf-8?B?V29xWFpzQnp6bXNkZUJtQm1HZmRwMGJrLzJCSnBLdzNGVWhCR0hsQTlkWUI4?=
 =?utf-8?B?RGJnQ1BxREdQRzVMVkhUdnhiQmJCd1lDVkxDVUp3ZmwyQ3Y2MkV1R1l6TWZ3?=
 =?utf-8?B?QjFiZHR3aUVhWmVWSnhhTlVIai8yVXhQbUtEUENZSjlYdUdwTFlHNnhwdFFX?=
 =?utf-8?B?Z2NBTG11S2ZudDV6TmVYeklQNjJINVljR0VtbzIrUWhhcFpVK2JpenJiWW9X?=
 =?utf-8?B?bi9uSEE1STI3eExTbVpDZm45WWJ1RVJGOVRTQlh4ZkJEM01ac1ppQmc2OUNI?=
 =?utf-8?B?bFdEd2JPRHgxdmpkKzI1dXJzaFYwZ2ZIRWFhbjhReTlhZHhPR1hKa1F6NTZS?=
 =?utf-8?B?MDdDSHMrbXlFa3lHdEl4eitRbmVweXlKaUxUakhYa1k1RXNieUd1dHk1blVE?=
 =?utf-8?B?RHlTRFZ4V3ZCTU5GWU9jNnc0dGFJakkxVDc4aDhBaHRYdlk2aHJ0dmNLS0di?=
 =?utf-8?B?TVprUExrbXVjSXZoS2E4bkdORFFMNVFjbzBlRUE4aEh3d0hiOVErdnYzT0F2?=
 =?utf-8?B?a3BYNktxVjJ0OWNBZG1HSEd6dk1wdUU3am5idWNxTnlCbVNZd0xMdTROd0lQ?=
 =?utf-8?B?akxHdGJmOTlXd2J5OERaRHVWMkxzazB3a016MXZhcndicDMrUWxnY1lSQ3E2?=
 =?utf-8?B?T0xLcDVRTm8xcTJjZ1pSaVBFdFBGS09kemRHa3lOb3RtUFhNaExmYXJDSkgr?=
 =?utf-8?B?MHZTbiswV0dUcDUyS1Z4NmtWa0pVcWxzMVNGMndDUEtrcHJTTmdYaGsrSHRD?=
 =?utf-8?Q?chH1acFOrf7KUnqLO/0p5lzy9qz+NJuPql3iNdLxjPMGV?=
x-ms-exchange-antispam-messagedata-1: wy8wflUOOgMIlQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N1Yhgth/eSxQeiWLO9rffLuwNc7CZrkIYaVWC4HOaWCeCEg8FP85ympImXC6qHDtyTaZQq+fNS2x6KJ6UTwGrMujd+4mE29tlEeCIgzNNuyF1UYPUwlx1fL8XbBnXz7KSCwq/bUaIMK8Ikdd4XbpQoNxltGV8kGbpGf/24i7S2qDZAc6BM63LEZNR3/itNybH7trdxRniJhBvZFZANFQKjcPyOu+UvWZO9Qsehx7wiSadP44CRBDGD3fEpVua/A7DxEs1VADdSsDF4fR63x5nUvmQ3lZOjzUoqZjMlLGDGayy+HLMr51SjI17ELF+oXN/jrs0ebJB67rIn2lIFfCQQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b27b02-bd2e-43f3-e010-08de7f499da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:38:48.7517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shkCFF9W0sePL6r9m5qbCD1mxuWDfKV9CvUSHEocZSvk0g6OcehvVzRD2j/F8b+ELJn1P7eEknyXpn6MilejRJD0slRvBPCs/UfbG5S3TrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
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

DQpIaSwNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjI4ODgv
DQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFp
bHVyZXMsIFhlIGNhbm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5m
cmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW5pIE5pa3Vs
YQ0KU2VudDogMTAgTWFyY2ggMjAyNiAyMDowNQ0KVG86IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6
IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGxpYi9pOTE1L2ZiYzogc3dpdGNoIHRo
ZSBpbnRlcmZhY2UgZnJvbSBwaXBlIHRvIENSVEMgKHJldjIpDQoNCk9uIFR1ZSwgMTAgTWFyIDIw
MjYsIFBhdGNod29yayA8cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+IHdyb3RlOg0K
PiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPg0KPiBTZXJpZXM6IGxpYi9pOTE1L2ZiYzogc3dpdGNo
IHRoZSBpbnRlcmZhY2UgZnJvbSBwaXBlIHRvIENSVEMgKHJldjIpDQo+IFVSTCAgIDogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjI4ODgvDQo+IFN0YXRlIDogZmFp
bHVyZQ0KPg0KPiA9PSBTdW1tYXJ5ID09DQo+DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20g
SUdUXzg3ODkgLT4gSUdUUFdfMTQ3MTQgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCj4NCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+DQo+ICAg
KipGQUlMVVJFKioNCj4NCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJ
R1RQV18xNDcxNCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4N
Cj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzE0NzE0LCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+DQo+ICAgRXh0
ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RQV18xNDcxNC9pbmRleC5odG1sDQo+DQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQwIC0+IDM4
KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj4gICBNaXNzaW5nICAgICgy
KTogYmF0LWRnMi0xMyBmaS1zbmItMjUyMG0gDQo+DQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPg0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMg
dGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTQ3MTQ6DQo+DQo+ICMjIyBJ
R1QgY2hhbmdlcyAjIyMNCj4NCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+DQo+
ICAgKiBpZ3RAZ2VtX2V4ZWNfZmVuY2VAYmFzaWMtYnVzeUByY3MwOg0KPiAgICAgLSBiYXQtbXRs
cC05OiAgICAgICAgIFtQQVNTXVsxXSAtPiBbSU5DT01QTEVURV1bMl0gKzEgb3RoZXIgdGVzdCBp
bmNvbXBsZXRlDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RfODc4OS9iYXQtbXRscC05L2lndEBnZW1fZXhlY19mZW5jZUBiYXNpYy1idXN5QHJj
czAuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzE0NzE0L2JhdC1tdGxwLTkvaWd0QGdlDQo+IG1fZXhlY19mZW5jZUBiYXNp
Yy1idXN5QHJjczAuaHRtbA0KDQpQbGVhc2UgcmUtcmVwb3J0LCB0aGlzIGlzIHVucmVsYXRlZC4N
Cg0KQlIsDQpKYW5pLg0KDQo+DQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0N
Cj4NCj4gICBIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xNDcxNCB0aGF0IGNv
bWUgZnJvbSBrbm93biBpc3N1ZXM6DQo+DQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4NCj4gIyMj
IyBJc3N1ZXMgaGl0ICMjIyMNCj4NCj4gICAqIGlndEBpOTE1X21vZHVsZV9sb2FkQGxvYWQ6DQo+
ICAgICAtIGZpLWJzdy1uMzA1MDogICAgICAgW1BBU1NdWzNdIC0+IFtETUVTRy1XQVJOXVs0XSAo
W2k5MTUjMTU0OThdKQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUXzg3ODkvZmktYnN3LW4zMDUwL2lndEBpOTE1X21vZHVsZV9sb2FkQGxvYWQu
aHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0lHVFBXXzE0NzE0L2ZpLWJzdy1uMzA1MC9pZ3RADQo+IGk5MTVfbW9kdWxlX2xvYWRAbG9h
ZC5odG1sDQo+DQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlOg0KPiAgICAgLSBiYXQtZGcy
LTg6ICAgICAgICAgIFtQQVNTXVs1XSAtPiBbRE1FU0ctRkFJTF1bNl0gKFtpOTE1IzEyMDYxXSkg
KzEgb3RoZXIgdGVzdCBkbWVzZy1mYWlsDQo+ICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODc4OS9iYXQtZGcyLTgvaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZS5odG1sDQo+ICAgIFs2XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTQ3MTQvYmF0LWRnMi04L2lndEBpOTENCj4gNV9zZWxmdGVzdEBsaXZl
Lmh0bWwNCj4NCj4gICAqIGlndEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0LWF1ZGlvOg0KPiAgICAg
LSBmaS10Z2wtMTExNWc0OiAgICAgIFtQQVNTXVs3XSAtPiBbRkFJTF1bOF0gKFtpOTE1IzE0ODY3
XSkNCj4gICAgWzddOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VF84Nzg5L2ZpLXRnbC0xMTE1ZzQvaWd0QGttc19oZG1pX2luamVjdEBpbmplY3QtYXVkaW8uaHRt
bA0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzE0NzE0L2ZpLXRnbC0xMTE1ZzQvaWd0DQo+IEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0
LWF1ZGlvLmh0bWwNCj4NCj4gICAqIGlndEBrbXNfcGlwZV9jcmNfYmFzaWNAcmVhZC1jcmM6DQo+
ICAgICAtIGZpLWNmbC04MTA5dTogICAgICAgW1BBU1NdWzldIC0+IFtETUVTRy1XQVJOXVsxMF0g
KFtpOTE1IzE1NjczXSkgKzQ4IG90aGVyIHRlc3RzIGRtZXNnLXdhcm4NCj4gICAgWzldOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84Nzg5L2ZpLWNmbC04MTA5
dS9pZ3RAa21zX3BpcGVfY3JjX2Jhc2ljQHJlYWQtY3JjLmh0bWwNCj4gICAgWzEwXTogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ3MTQvZmktY2Zs
LTgxMDl1L2lndEANCj4ga21zX3BpcGVfY3JjX2Jhc2ljQHJlYWQtY3JjLmh0bWwNCj4NCj4gICAN
Cj4gIyMjIyBQb3NzaWJsZSBmaXhlcyAjIyMjDQo+DQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBs
aXZlOg0KPiAgICAgLSBiYXQtbXRscC04OiAgICAgICAgIFtETUVTRy1GQUlMXVsxMV0gKFtpOTE1
IzEyMDYxXSkgLT4gW1BBU1NdWzEyXSArMSBvdGhlciB0ZXN0IHBhc3MNCj4gICAgWzExXTogaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODc4OS9iYXQtbXRscC04
L2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiAgICBbMTJdOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDcxNC9iYXQtbXRscC04L2lndEBp
OQ0KPiAxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4NCj4gICANCj4gICBbaTkxNSMxMjA2MV06IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTIw
NjENCj4gICBbaTkxNSMxNDg2N106IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
aTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTQ4NjcNCj4gICBbaTkxNSMxNTQ5OF06IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTU0OTgNCj4gICBb
aTkxNSMxNTY3M106IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUv
a2VybmVsLy0vaXNzdWVzLzE1NjczDQo+DQo+DQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0t
LS0tLQ0KPg0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdUXzg3
ODkgLT4gSUdUUFdfMTQ3MTQNCj4NCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9E
Uk1fMTgxMTY6IDc3ZTE3NjY1N2U3ODJiYjgxMjcwYzIzMGQxY2ZlYzkxZjc3MDcxNjIgQCBnaXQ6
Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xNDcxNDog
MTQ3MTQNCj4gICBJR1RfODc4OTogODc4OQ0KPg0KPiA9PSBMb2dzID09DQo+DQo+IEZvciBtb3Jl
IGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xNDcxNC9pbmRleC5odG1sDQoNCi0tDQpKYW5pIE5pa3VsYSwgSW50ZWwNCg==
