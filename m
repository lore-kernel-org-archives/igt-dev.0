Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0128FD29FB5
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788010E0A1;
	Thu,  4 Dec 2025 19:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOQLlr2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6948410E0A1
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764876325; x=1796412325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qjX4jEkjQ3I6fQV7EK2l1jdAPUa7RZ6ZrxBKGSRqyVs=;
 b=kOQLlr2c7dLEZYt0+oVRsUGZDB3FX3RVw3RUY3NVxH53i4EpPgGjm2pz
 TEIqzjO1h9Bg5s5xpqQc1eplUPGIn6vc8YHREUMt1poAb8CzqYYWVcyU8
 GvP5ciCYiQw1W23b4WEBDEVT1DsMwr/R3Cs+8Wyf4FrN+g+hbC0ia+pa+
 duMYoHeK1zrMjmMfq1OFCqitaiUv2NMogXWQVnii4Z0L+Xe+P8hmA2j1P
 tCr9jNq2G9DxsD1BD7+D8hGAZ8Z4S+N8k5VoCJmbvRmvISVrL7+nBGe/c
 kC3/5p0qxjEF3hkpJEZN6erxQfkpyw7wqKg0ZPuwtgGk2a2ZUwZxuvJ9U g==;
X-CSE-ConnectionGUID: 8oqm8EQmS6mlAhGvqYEYZA==
X-CSE-MsgGUID: blV8SoRDTmiMLNYb1JVpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84513741"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="84513741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:25:25 -0800
X-CSE-ConnectionGUID: UHIFYS14SDaoj69WihDxmg==
X-CSE-MsgGUID: UF0sU2GMR6qr9+iRvJ5UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194880233"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:25:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:25:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:25:23 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:25:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP+rPH9oLcHEOzso3MkOXJPABcAXZd8SO69abi8AahE1hTHfcpspzhRswhBmxLyEV5Ow+7XDNa+u0wm4cgYY7VqWQvBaJWsiJcFFtq/5Culq7SjEAvCuZJlHVu7K9ExW1bECIT6o0xeXxNQ6jIDy7R3ySgkmnAdz4fNvPDsh7zvUeiU98zKP2HaaEyjbSayjdKTbFiCB1yolB+OAFLm8JwDv7N5e/fLxBz6LfXQV9LxsWrB9dOiwJssUmssB9jES70U08SBbyEq3feQCtaWjN9NMrrhwJp7A95z9F0SDGfedeOSA6t6z5oUxIP/i2PJ69jACCyvFU8Jr716FvmBsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjX4jEkjQ3I6fQV7EK2l1jdAPUa7RZ6ZrxBKGSRqyVs=;
 b=UN/ymkpu/5d72gNP3suC0MGnDGfqmzYZP6M4zW0D5xRe9y68nGlN8DxpdFF0S3t0159C1XJiSNJLVjCeuLqotMTekuIAGLXof9tPX4RYz4+z/NHqwzfr1rldJTwB6wJR2n6Ddhp1uXO2qZZXv23uI65KWzP34YMfgOm20oZZm2g9xuzpaIhvah02CkwuPk1XrrbqXyjgS08IzMRuL0RNedm1lBIlE4WAs4YFWSxaM0pHkMOypYgAbrpYCEvnKELxsp7vq9xXaVI7ZH1I5wC83LoXl4wmY1XyoWOZ63lsTOzYZV379DH+qAvDQ68wenAjntjqBaYnuiGJT0HV3a5LZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 19:25:21 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:25:21 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 19/19] tests/intel/xe_exec_queue_property: Update
 invalid-property test
Thread-Topic: [PATCH v2 19/19] tests/intel/xe_exec_queue_property: Update
 invalid-property test
Thread-Index: AQHcWpv8K/IIH+D0akuKjyyN+QukzrUR8juA
Date: Thu, 4 Dec 2025 19:25:21 +0000
Message-ID: <56a5f6f12eba5afb1e6aa8f2909a969f6c824f4d.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-40-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-40-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB7526:EE_
x-ms-office365-filtering-correlation-id: 55f9fc1e-e5d8-451d-bfd8-08de336addbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R3JwU1NFR2dYTnJZWWxlSDBWQ29ZV2dZL0tZdDhnVlQ2djNGUXY4MXBFQmhN?=
 =?utf-8?B?SlYxaEkvbld1R1VvenhJWjd3UkZmemFYQld0Qk5CS2Z1Z3lNbWpxMGdhUVVN?=
 =?utf-8?B?U0k2WXV0bDJoemMwVjVyMTM4MXpJU1lqNy8vVGNSSk5waUllQWYzLzI2Wi9h?=
 =?utf-8?B?SElad3Nsa3UzUVF4Y1Vxcm1KVmtyRTZhTEhuOXhmMFpoVlNZUmdaVVpRaE5i?=
 =?utf-8?B?TUdyK1RlbHZGWnR3dlFQVWdlNHVaV3pSL1YwcVMrMjhOQ09LZy9TSHZHVmJo?=
 =?utf-8?B?T2RBTjRhSnJjaXdIbnAzUy9aWFpzaDJkd3haQTZKVUFSQU43eG9hVHcrN0hs?=
 =?utf-8?B?RktNbjFOREt6TGtrckVCRVFLbVdpVzVIYnZ0UHl2alI0a3dkNUlTWFloQ293?=
 =?utf-8?B?ZnJLM3IzZFBHRmxnUERTYi9JTXp5OFd2aWl5Vk9IOGpndW94WHQ4blBIYnBy?=
 =?utf-8?B?dG90WW5rU3ZuMEtxTHU0R1ZkY0VUajdqVkhPR21VTEM2eUsvVHNXaDZpS1RP?=
 =?utf-8?B?Ynk0cWZUSFdtQ0cxWUtpZXAwa0o2Rk5pbnhkNHU0eGR6cDEzVUlaN1JOTlY4?=
 =?utf-8?B?Q3o2TndXV1VvZCtjbyt1Z0U4ZUJLc1podFA4Zzg4dE1SRkhVN1c1UmtGaXZs?=
 =?utf-8?B?K1A2bG1EZ0RaUGd0YWVBSS9PZURhTGYvdUdIN29wT24yTVRBSzhzRDJ3cm5Q?=
 =?utf-8?B?OXNNVU1nWS9vVGhDQ0hpb05SN0JkZ0xlWXdCS0d4ZmFVOXVFTVJubVVzbkwy?=
 =?utf-8?B?NEdwazBwM3RlV2lFZm5CTWZQdm1Qb1hQR0E0RHlwRnQyV0t0MXAwazRFVENY?=
 =?utf-8?B?NGV6VjNxbTViZGdMUzRVOWRFR3UzWFZla0ExSkx6UndaaXdadmE0cU8xUkl6?=
 =?utf-8?B?SjRpK0dmTENrNXk0SERmbHh5blNjUzkveW9OcGNNM3BaWktHM2drN0lYYmV4?=
 =?utf-8?B?ZWVHYjNsK3Q2WW80U1RoUk9ObmhNL3pHcVRuUFFXdmU2NFc4RTFpT2czWFRP?=
 =?utf-8?B?aFh1NEpDUU0wcXg4T2ZWQkxuT2VLVGJNcEN4czQ0YkdLY2JEcXVPRU5WU2pa?=
 =?utf-8?B?M2R5ZmFSZGRuYzdOb2F0NVJ6RGJsU21LMEhEU1liUkNZSXExL0VuMG04QWYw?=
 =?utf-8?B?T0JEMUVCeGUyemlXQ01DcXNPcmg3TG1PZ0NnR2UwU3pYTW81a1g4Zkh2TlZo?=
 =?utf-8?B?aEUyZmI5bW1UdDBQWld2UFU2aURFWXZtcXpVNlJybXF3dE5MT1M3d210eWo5?=
 =?utf-8?B?WmtkbGl5VjlLY1FoVnIwaW5yQ3A1NEU0M1VDUzFLSXBpaDZNcm1UL1EyVHdK?=
 =?utf-8?B?QmpHVGwyc0Y5a1BxU3lQSDZiRjVCVGFIRzlkWTh0dzFOa3lJSXZTRytYdTNl?=
 =?utf-8?B?RXUxaWQyNTgvT0s1ZjNQOE4vWDFJaEpyTUFIVVhIeGxaMUZRVTdwZnFrWWRi?=
 =?utf-8?B?YTRLTXc2ZGR5N2l1Uk41RjR1UUkycnFHcjJxeGFlRGlTRTJBWTBhN2tDbkFh?=
 =?utf-8?B?NmVxMEV3Z0d1bE9CeDZSemNNUFMxM2NZcUlOa0xoSnYrZGFuVFpMU2tjTisz?=
 =?utf-8?B?MWxUU2ZyR2MzTGtBRDhVSjJsTDI4UWVaR2VGdGhXWGUyUmQrVE5ESW5kekt5?=
 =?utf-8?B?M3djcFpxeUl3VG9vQ1c5RGdLQWVIZ1lMNnprdmpVdXByTDA2cHk2R0llbXQ2?=
 =?utf-8?B?dmJpTXlrVlR3K0haKzZKeWtqUFViczY1UFdrOVIxaGJjNE1JZXN5dG1hOVVU?=
 =?utf-8?B?Ymd2Ui8vK2VmenQrUXIrY0FESzlQZkloelEvU3Y1VEZmdUVaUmVJbVhKUEFu?=
 =?utf-8?B?dU4rMHV3bks3WVdvdnRSS09FQXNlNEVLYmFpY283UjZhSFF5blJUU2ZhUkFq?=
 =?utf-8?B?am16dW5qR0tveTRGcm9zWCsyN09sdy8zSG5tdDhyQ3FDc1hOQkVFY2o0NFdq?=
 =?utf-8?B?T3pyYVdUS2pqcWJkZzRKQy9Qb2Irbi85eGFQOFlJcXY0b2FqV3NTU3NtVVlu?=
 =?utf-8?B?bEs3V1psRGUyT2QyMmJhbGhJUU5SU3duZm9iMFY5K25yVDhHWEE4dlJMcTg5?=
 =?utf-8?Q?nYriQr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wno4UlN5R1dYNWpZREw3OW91WFJqSEIydHU5UkNDZkkzdzZGU0J3MTQ5eGha?=
 =?utf-8?B?UFAwVzJYSFdIeW5ZR0NuL3kzWGZzR3NaK1dhUkgwRjliMTZ1akVoUXk1NWEr?=
 =?utf-8?B?T05iZkh3SkJUNU1FY1lDdTMyWUpuRHpqRXo3YUxQZXkxNWIwUDdvaURDNW9t?=
 =?utf-8?B?K25LQnZDdU02Q3RlcTY4TXpvbzhsOVZvcTZIWFZEcVA5dnFWVzkrUjZVVUtN?=
 =?utf-8?B?a3gvVjBoTGVUTktEanRLR1h2WlpJTGFTdEhLazBMU3ZoZjRuYW1rWDJTVHZ5?=
 =?utf-8?B?T3gra0YzQkJaUUZnYmoyZ3pvc1A0aUQyWmVBTEROL1ZBa05KVE5zRTFLUHZh?=
 =?utf-8?B?S1QvWXgrWUNyYVFpTVd6Smh1TTJPRUQvMFdleXhGdDdoL0VpRTNYSWFYbEZK?=
 =?utf-8?B?RkdkMENMbmhnUk9YaUx4eXVuMXIzT24zMThkYjFIQmdHUGZrOUtqaHJnOVQ3?=
 =?utf-8?B?RnNrdVlUdTM0ZEZaOVNqWDFNd1k5SkhwV2ZxVlM4dEo5VnJjbDdMQmJhL3I2?=
 =?utf-8?B?aGU0bVd3Rkkycm1lMnRpSTJyWE93OVhsYUY2WXI2alZRcTBNdXhlek1YbWQ0?=
 =?utf-8?B?enlEd3hxRVlxQzU2d1R0RHFCamdPUnA4SHVDa2NrelpCNHZzbER2dE5zRkw0?=
 =?utf-8?B?VnZoV01NTVlvS1pvVE96MUNwUzlSTnU0YnJNU1FrQWlzWFdVUFd4Y0sycGdH?=
 =?utf-8?B?REU0ZGxSVXh6c050bWE5WUtlL1VDRHpOSmttUjlHMFFWL0tucURPRFN2U2FS?=
 =?utf-8?B?ZGdhTDdZN3hCdzlhZjdCWmF4eW5OWjIveFltbmcyUFRmRXIzSElaMDQrOFRK?=
 =?utf-8?B?WHBZSXhzc1pyeEZvMkZpbGhCQWc1cUo4bUZYQWliSGNCc0N3QmlnN0pidkVk?=
 =?utf-8?B?RFhEcjFCaUhod1JTeWpqT0w3dDJncW5pOGo4MFFYcEtwY2xuQllRb2lQZGt2?=
 =?utf-8?B?QlBrdVlRREtnbkpHaGkvbmxhRlQzd0lxTkNzd0VQRlM5MHZpQ05xcTR1MmpM?=
 =?utf-8?B?NTJUc3B2elpkSUN3akl2MG5aa3RWT2JVNzRuSWtXWVZlY3FhbFFyVE9xT1Av?=
 =?utf-8?B?OTJjbmhtV0ptNGVWQ0FoV1cvVVFjL3BPNElTempzSFhzcnExbTB1cSsrTDdQ?=
 =?utf-8?B?Z3NtYnNTNFdDd094UHJoT24wRHNhU2RyYUZvTTJsZHJVa2xzS2IrRWdnSmFL?=
 =?utf-8?B?emVYQUFwenFxVS9QQUJtanNYNmUycllmT1FBL0NxVUEwNHdqYXBuUFZabzYw?=
 =?utf-8?B?ZkdjTEVZQ1lpVkVBY0haUnFoNlJMSlFMUGdyUitsODNzcWlLZDFkWmhhdmpn?=
 =?utf-8?B?VDJyVmh0TkFlOTRaVWd3S093YjdFNjJaQlBOUHMraHBwSGlaMUNtN2N5SFFJ?=
 =?utf-8?B?VDJGYVhKK0QwUzFNL1ZXanRRbnczdTYySWZsRk5LVGw2dlduc0R6SWpYZjJj?=
 =?utf-8?B?b1BFdGt4bjZ1WnUxci83dGEzZFZmRi9wdlBTL0t6djJnMWlGelF0MWlNQ0dZ?=
 =?utf-8?B?cGFCMHh6ZFpzTVFXb1JZcmROUmZ0NmJBWG5Ud0FMdGh5aktreDVqS3NyeGdz?=
 =?utf-8?B?MSthM0NUck50ZHBNRCtDdTJiZWZLOGdSMnh0bUVNUGtFdnFnYnVoVWl5d0ZU?=
 =?utf-8?B?VWFyRWdCQmJHcy8wdkFFVGU3Y0Rpb1FhOXJNZFRTd0JyZm96Mk9qSDdtV25u?=
 =?utf-8?B?aFpYeWdvM3RwMjQzdmNSb0dLbUo2bVM0UEQyR2Vjd2l4RkxoTU1vSzMxK3Ax?=
 =?utf-8?B?OVk1TEFuWGt1aE9aZTB6TVBqM21WUVEwYUhsV1VBTXMzdUdrTFdjQ0JnL1R6?=
 =?utf-8?B?ZUhDS2I4S2lSNmJqaTVyUjlEbXJiQnFsM0V5eWdpc2xPVnRzQTV6ckRxbGxL?=
 =?utf-8?B?RzVvemNGTHdTaW9iSzgydEw3d0U0aGdxU1hNbWFEblZFRkxyS3hYTmZ1ZjFm?=
 =?utf-8?B?NkRoNis2d0ZDend4Sk9MbHk0eW5vNEl6eDVMSFlBNlhhZzNuMDJ1d09Ockxr?=
 =?utf-8?B?UzBCOVcvbk5XdU9nMlQ2N28zbklKYjljVnM3RUNSK0RzR2ltb0FPYkJkMXB4?=
 =?utf-8?B?bzZSL0VnZ0tFVjEzaVE4RWxJUGoveWNqdWh2UVJCOFlZdTdzK3lIbXdoMGpS?=
 =?utf-8?B?OEdtZ2RhbUpGVUpuSkZCWXpoLzgyeCtpcmUwd0VmOThML1BLcjVFSVVGL0xh?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BE60FB1C2F2F141AAE37D363618C2CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f9fc1e-e5d8-451d-bfd8-08de336addbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:25:21.1958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UdWCd0pPQcNQH5rWP/+/5+B3TNgYfBwXkBqrjXX0hhHt4IxApbb3Pu/HT93HVzpkEdlLmSiY+S0akpNVQuY6FF3r1aeCz7f6sRYlcgiZmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEdpdmVuIHdlIGhhdmUgbmV3IG11bHRpLXF1ZXVlIGV4ZWNfcXVldWUgcHJv
cGVydGllcywgdXBkYXRlCj4gdGhlIGludmFsaWQtcHJvcGVydHkgdGVzdCBhY2NvcmRpbmdseS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5pcmFuamFu
YS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJz
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+CgpJIGRvbid0IGxpa2UgdGhhdCB0aGlzIGlzIGFs
bCBoYXJkIGNvZGVkLiBCdXQgYWxzbyB3ZSBhcmVuJ3QgZG9pbmcKYW55dGhpbmcgcmV2b2x1dGlv
bmFyeSBoZXJlLgoKPiAtLS0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJvcGVydHku
YyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5LmMK
PiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJvcGVydHkuYwo+IGluZGV4IDRkZmNmMDll
Mi4uZTFiZTFjOWRlIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJv
cGVydHkuYwo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJvcGVydHkuYwo+IEBA
IC0xODksNyArMTg5LDcgQEAgc3RhdGljIHZvaWQgaW52YWxpZF9wcm9wZXJ0eShpbnQgeGUpCj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogVGhpcyB3aWxsIGZhaWwgYXMgc29vbiBhcyBhIG5ldyBw
cm9wZXJ0eSBpcyBpbnRyb2R1Y2VkLiBJdAo+IGlzCj4gwqDCoMKgwqDCoMKgwqDCoCAqIGV4cGVj
dGVkIGFuZCB0aGUgdGVzdCB3aWxsIGhhdmUgdG8gYmUgdXBkYXRlZC4gKi8KPiAtwqDCoMKgwqDC
oMKgwqBmb3IgKGludCBpID0gMzsgaSA8IDE2OyBpKysgKSB7Cj4gK8KgwqDCoMKgwqDCoMKgZm9y
IChpbnQgaSA9IDU7IGkgPCAxNjsgaSsrICkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZXh0LnByb3BlcnR5ID0gaTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZSh4ZSwgdm0sIDEsIDEsCj4gJmlu
c3RhbmNlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gdG9fdXNlcl9wb2ludGVyKCZleHQpLCAmZXhlY19xdWV1ZV9pZCksIC1FSU5WQUwpOwoK
