Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A805BCF8849
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 15:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D9610E2A3;
	Fri,  4 Oct 2024 15:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hs3vGyJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDCA10E2A3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728055162; x=1759591162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9EQ47IecqHm0UP/WhS4FD1FfC2kbykaUgYRrB5GzrYA=;
 b=Hs3vGyJ9qplNmfZ/sFHxcbA3jT0Ea1CEf8WiQ4Veu/SBPjDLalE5+4TQ
 vqtNpcYdgjs19DSFSZnLQDqVmLV8s5cEng1V32LmLlcfJv7xrEV9K/7fx
 DjXDkwrWcSkN2d0V0rjlL8Q2dIAiO+AkTTJja4GcrNadq/QPSX6J54Gzm
 wFEmGMRPJ9Rf0VKGm950mL6bd3uGoI3Y9vWr64vjVq0A74gSR19NDhH41
 gsMq6efwHw4FVoXvGhSG7Y62fp3503egy9+MWb275/zZ47rpPsxyEMeGq
 hR8ToRciZGzW3oaeUhreloz/At+h/ojVAmgFXi/QmheJIeRCAvoDoMh0I g==;
X-CSE-ConnectionGUID: FRNh/gzwT3iGIiFX0sk3nA==
X-CSE-MsgGUID: l33QKXKRTA2Tt8dx+c6/Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27371893"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27371893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 08:19:22 -0700
X-CSE-ConnectionGUID: lDqYlXbNRz6GNF6k5KuIjA==
X-CSE-MsgGUID: PIhl76gOQUu9ySO87Z4X2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="98054961"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 08:19:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 08:19:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 08:19:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 08:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYNvSvs6daW8KmfrxerzULEFjwA0PE7Z5tLPVtBEosYXvVL8C7TAYwmg+QaXDddbeOp2UB2NmMeLPAKpCV5byU2IqHDJiv/tPiIaRJEdbxnEl49puGu6x36ui6NXQxiba4jnPi+katvNybjBufP51DLYRNaZkT7bTIhKSAb6j06wZyZ5z5G10n+1qfIoeIFuZXF4C2xtkg3OzFXEhb9Q0kzUNMXaFfmaNGjqeyYVHDMQ4l+PNa+3KkibB211l/prN1KXTSApByKTW7PCbGrBd6nSmYGtU+COYGGROfNtRwk+f2riTW6EmZp8qHefHR0QaVAgi9OUXqYABiJ6q99YkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EQ47IecqHm0UP/WhS4FD1FfC2kbykaUgYRrB5GzrYA=;
 b=rXC+JjuFLoX92mVDwRI7P5DE1dwxv0JZhsIJN+2V5XCCqa93b+bevj4plTThD8XzF7ZkD2tvp6zspVqg+FrMhD3JRCILqdFc2xssq+ShFnUmC1hqAL9REc5c969AW7DAXX5ek0HC2Fpr6nOYmoAYM0aJcF+CG+9udMPr0xN1l/7+1rAynF0WybIP/vctaNZSoTRlOCuaBO+eJz0LK0MpuNlivl0INgYHBCek7qRI2E8u+HBKJ7LK+Fu+4TnPPk5hNSlyZDco4imhGJzFHECvB9AOoC7d1dM/j5/R7+UhhCKZJA5nk3Lq0nQfdDt1zCoysVkxDziNhu77jrOfIcAYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8495.namprd11.prod.outlook.com (2603:10b6:610:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 15:19:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 15:19:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_pm_residency: Skip on
 igt_power_open failure
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_pm_residency: Skip on
 igt_power_open failure
Thread-Index: AQHbFmgT8MU6/yczt0yNMhvF2NgwALJ2pLgAgAANX6A=
Date: Fri, 4 Oct 2024 15:19:18 +0000
Message-ID: <CH0PR11MB544462BC62C37730DCF40414E5722@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
 <d790ab39-cdc0-4ac7-8629-e2e993c10cb4@intel.com>
In-Reply-To: <d790ab39-cdc0-4ac7-8629-e2e993c10cb4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8495:EE_
x-ms-office365-filtering-correlation-id: 523ae61d-44f1-4547-c0af-08dce487eaac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzhYcjlZT3VDR3o2endrMnpUejA5aitnOHQxTHNSSGdWc0YxTVYrQWlYeE1x?=
 =?utf-8?B?RU9VVWg1V1AraDdOd1JCT2xzSm0vd2EwQWx1ZUx4cDdMaUx3UlZ3cWxBS0xU?=
 =?utf-8?B?MStmQ2ZITDB3WnZDeVhwNGN1ZWE1Wk1NdGhycjE2K3Iyd0VuNGZsME40ZXFz?=
 =?utf-8?B?VVFOTWFFNXdlQ1F1Mm8yeFFzeTZLdWc2emhVSHFzcDhTTXZUdG41OEYxcXpk?=
 =?utf-8?B?YXNjbmo0eFg1cnBSV0kvRjU4a2R1M3ByMDRjblVERWxBVHF4OHQ3ZkZTV1pw?=
 =?utf-8?B?eTB0TjhGTHhGVXZqeVV5YlBQZStwcGUvSW00OUpNclNaLytZZ2NGd3Q3eUcy?=
 =?utf-8?B?cnRtMkRyT0w1S09EMnVhYWtUM09JcWo5d2xFOGpoeXBaTmoxWkl5d2FWdENs?=
 =?utf-8?B?VEtqVkovSWZaZCt0eGtvU2tEK2lvYnpWTks2MTNwb09zQ1JQQXh5SlpkTGdZ?=
 =?utf-8?B?VFBrWlQ3WVJoR2VVU2k2ZUhJc0tZVkhCbXcxNmFaS0pUbG8vWXQ5algvU093?=
 =?utf-8?B?QnQvejRyVVd2c214NUxsOGMzNFdMK1FsMDhma2FpRFVTcEFGbW5GRTV2TTJr?=
 =?utf-8?B?ZFNtK3hxOVZBVEZFVVFJRjM3d1kzWmNPb2pVY0lSaTg1L0ZycUgwbWpVczVw?=
 =?utf-8?B?NVl0aXB2SFU0dkJXT1Z4L3gwOFpqT3cxSVdSNEtJQUNoOWJRcFlZekFwakZw?=
 =?utf-8?B?Tlpaa3MvY012K0JldDQydHBjTFM5bWZwaDZVYzgwbnFTZDB6L0dSekE1Z1VJ?=
 =?utf-8?B?aXdkSkx6bEY2K01Ma0ZOVXg0VEZlcGtHNGpYcFZLWm4vbnZlOVY5R3g4TkhG?=
 =?utf-8?B?ZUpkUlRrZnBFWmZtNFhMcFRBWUVmMG9LQWlrRzg0L1h3ZnJtSlVKVkljQ0Nl?=
 =?utf-8?B?N3hOUnB4RzFlY0ptRnNmSXBpMHVNdmtsRWZmR2RXZGZYS05kSDB5RkRRTm13?=
 =?utf-8?B?bnFlcEd3UHFoM3RYazg4K1ZhYStZQnhJMTdxaEM3aGo0blRybnlDRUNuYzFo?=
 =?utf-8?B?RHNtVTFVa1U5OEh6cFhEMDJoakRqTmhrMnhYaFJNTm5jOGMxejEvd0piSlVF?=
 =?utf-8?B?eXkyNGFpWERlM3ZDWWRET0M2VTZUV2RoTWJiZHZDQTlpZTZGd1NPSlBHSVUv?=
 =?utf-8?B?dkwxbHhndzlwczY1MWcwQkdoQ3BBYkJaVEszOVRvcUlGb3gvKzVyTmVEaUcw?=
 =?utf-8?B?M2V2cXdxZkVoVlRJQTdROElWeXdKSmZDSWRQQlFqQy9aYTNPTk81NGtNbDQv?=
 =?utf-8?B?dDk5VTlweFhNT2x4bk9yeVR4bk42ci94ZFYzN1VsRWRBenc0dVEwaTlBYjJ5?=
 =?utf-8?B?YXFkZ2dlZGJKOE5rY2ZwT0QvL0JXRlZrNW9QdjJxYnhqRWtJV2Vvb1p6Ukpw?=
 =?utf-8?B?SWhwQW1RWjVWUEMyWURMQzlpMTBZWml0QjNvM1NsMkRaTFdFZ0xBSzRJbFRP?=
 =?utf-8?B?YUdwVTJReFErZVdqdlJ6OGc4TDI2WW5UcGNncXFMNnJHaWo3UFlJeUN0bjFV?=
 =?utf-8?B?WVdDQUtMMTZZVytzN1JwZG5UaCt0TEpxdmpQSGZZWTZYVnFtTUZvQ1BvakhZ?=
 =?utf-8?B?eTh6Z3paUmhtV0xDaVhBeVZSeWpmdUx1QWtFcXNNdUZwQStkcmE4c0w2dDBu?=
 =?utf-8?B?dC9pMnhSMU43YnFrMDR1cjBGUm5HV2ZvcHo5dloxL2dGK3E2NlFBbmlqa0gv?=
 =?utf-8?B?SVNieHloSFVTNVppdHRRMXdMSXJsTE43cFFCWjY4RGdLOVIyYWxJdnByeW9q?=
 =?utf-8?B?MDM0VkFCRzFjcjM3cnhKcGVoYlYyUzNUZUpHbHRVQmVpS0xzdElWMEoweHBs?=
 =?utf-8?B?Vm5NWXVid1pKd0pNRE9UUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW1DeEVRS1UwUGxqVHRqQzQ0dURxUFJ0a0FkNlJNUmYyQTZBRVdMeDBSQk5F?=
 =?utf-8?B?VFpFWE5vNi9jTVppb2Uxandaak9PaG1zc1BobUVsVDMvT0pSRG1EaWVJM1B2?=
 =?utf-8?B?aWUvbUR5Y0hSbWlyQ3dOVUUyd20wdmZGSzBya2NTMkJCSXNyNkVRM0VPb1Jt?=
 =?utf-8?B?QTltUndzbHRWb1lzeGwwdkRsRkNoYXB4Q2x0STJsbXVWQVd5QjdtTDRja2ph?=
 =?utf-8?B?Szcra2wxV25QVDZFeEc4MmFZdnJpcm9wT2lNRmVtakFJQi9zOEdJcEErMEZq?=
 =?utf-8?B?ME84L0NvTWp4RERUSG1iMnBvWVp5b1RLZE4wL3BveHdZdVFDRnRVRENXR0wv?=
 =?utf-8?B?NllaS282L0FFaHdqd0FXN2lSL2JtYmVoRTBldzVvOUVwZ21XcEI2ZnBxSXpJ?=
 =?utf-8?B?cjBTbkJxdXgrc25vdHJTVEo1T1RHR1h4aEtaOWRxbTZ0Nk5HRDNzT3Z3RzdZ?=
 =?utf-8?B?T3N5MWs1M3g3Q2xaTVphcUZpZE9PSUkxOFduUE9SZjkvcjFPZiszRW1kSWtT?=
 =?utf-8?B?aVBtVnFPQ0MzM2RYZWJUdzZzWFk1QlU5YVpKOFpNQmowUUlIK3NwVnZzRnBq?=
 =?utf-8?B?WHgvc3RtaS81T0tOSzJkdHljaUxPVmVCTDZuMVJEeG8rYnRoVUxUbGlSVlMy?=
 =?utf-8?B?YkM2RDltSzdaN3cyM2NaajlzOUdXOWtMVFNEUHVTZFU2TGtjaWhidjY4Z2N4?=
 =?utf-8?B?bnZKRmFaOURvZGcyeEVqR0JIOUMwcldwTVpFUGs4N1ZGU3VYTThIUy9WSWJG?=
 =?utf-8?B?T2t0MFplL1NBVmY5WXlDalFESUlIVmU3dERJVjFjQnd4c0N5emlsRWhDTUNT?=
 =?utf-8?B?Zm9laDc4WGFBNWwyVXBIS2lDMVN0eDRJMkZhMy9oQkpybkFoMUJhVFhRSVd6?=
 =?utf-8?B?cmZocDRGT3V2RVJueGVzd2ZTZWZlNGc4amppT3NwYm1ncHVYVEYrekVmV3J5?=
 =?utf-8?B?YlJHdW9KM2huTHZJWmhpOXpCRmV5WkN5VCsyZjA2UVFjVVR3Q3FKK0JnbHQv?=
 =?utf-8?B?WXEvYXpHNFgwbytDQXFGV3J0V3E1Z3BwRUgzbUZoazJNK0pXSFpZNGR3b01P?=
 =?utf-8?B?N0JLbjhyNmtxNXpER1dITGw0ZzhKOWIyM3J0cDcweHpYZmJuOFJnYkNrQ0lm?=
 =?utf-8?B?OVRTYmJBVjgxNEFEZGd0WGlDcEUrTFJDZnNZVlRPdDgrdEEvNFUrZ29NSEJy?=
 =?utf-8?B?N1UvbGt1L1N1QmVZSFNWVmI5U3BrR21zaVpteHYyd1dLY3pHYlNDRHAxYWNz?=
 =?utf-8?B?M3RxcFdpc0FhUzNRVVVRMzY0S3Q2Vm56dnNkeXpWNTE2TjFNbVNvcEUwL3BB?=
 =?utf-8?B?MDdJcCtXV09BdmFOanFKU25nc0lqa1I2R0hST2FaZko0T21Ec0I4RzI5dDJo?=
 =?utf-8?B?b25Rd3ptUkl0emQ2SzhlQmxiUDVGVi8zMTJsdkRwaFVLMVJHT3hTQmdsMkIv?=
 =?utf-8?B?SDBnOUFpRTZTckZDK1QvdlVLMHRXQXN3dzd5dUIwR0hKNS9NSGhmZDNsSm1Z?=
 =?utf-8?B?SGJyQ3M5WTNza2g2UTNCMHhlam5pQ29MeUwzWnl4WllDUkVIbVR3TXdXTW5a?=
 =?utf-8?B?bFlqdmgxMy9GdDdBRTJJRFlrb3RJMzFyL1hnZDFvRm9EWU9tTEwxNE1QeUJT?=
 =?utf-8?B?NGZmNXV3NGYvVFdkbDVqalZkZUxIekV6ajlXVUZoN3VLZU80dWRaTHdlcm43?=
 =?utf-8?B?ZUNPOFJiZXdCbXB5UTI1cjZ2Uno1b1BUdERYVmlPNTAyNE8zZXkwaUJmU3Jr?=
 =?utf-8?B?eU1FQUt0T01HeG1HVHVVUk4zTExGV1JFKzE3VWliSm1HYU4vTVd6bVZ0c1hk?=
 =?utf-8?B?a09ZUG5wazcraTRoKzEyVjlwRm9Oc2xrR0NtRUtmSWJFS0p6VWhTeHdVQW9i?=
 =?utf-8?B?TmE1Q2kxTEdnMy96Nzhmd01KdE93bTR5bE5IS1ZWSlNRS3V5UUNXbCs1VWlv?=
 =?utf-8?B?NnZ5NWxsSWhNM2hZUHhPMHdnRmMrOGtTV3FPd0JzMkg5UEEzWVg3VlRtcHZ4?=
 =?utf-8?B?ckxWbVNUV2p3K2plenB1RWgwVkZ1WUdqeG02NU5mcGNjYXY3YlNmeGtEMVBW?=
 =?utf-8?B?bmlxM0ozVjkydlB2NllFYk93MGN6Z1VkblNpZ0ZZajF0bmY4QlBYRDU0ZzZw?=
 =?utf-8?Q?38MHtnTDtpTsKo9RMdakSGhbo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523ae61d-44f1-4547-c0af-08dce487eaac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 15:19:18.8326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA/DoqkGbQey34h+9rBnf+m/iD4UGlpIOrHl5MYbwe403kK1eUIpgJLoXJQrlssf/43UqjzaehGU8nqB2nWNKjJNdMp1DFnY6SRD0n/pzHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8495
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1
cm9AaW50ZWwuY29tPiANClNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDI0IDc6MjIgQU0NClRv
OiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhnLmd1cHRh
QGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsga2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2Ml0gdGVzdHMv
aW50ZWwveGVfcG1fcmVzaWRlbmN5OiBTa2lwIG9uIGlndF9wb3dlcl9vcGVuIGZhaWx1cmUNCj4g
DQo+IEhpIEpvbmF0aGFuDQo+IA0KPiBPbiAxMC80LzIwMjQgNzoyOCBQTSwgSm9uYXRoYW4tQ2F2
aXR0IHdyb3RlOg0KPiA+IFRoZSB4ZV9wbV9yZXNpZGVuY3lAdG9nZ2xlLWd0LWM2IHRlc3QgZmFp
bHMgd2hlbg0KPiA+IGd0X2M2X3Bvd2VyID49IGd0X2MwX3Bvd2VyLiAgVGhlc2UgdmFsdWVzIGFy
ZSByZXBvcnRlZCBieQ0KPiA+IGlndF9wb3dlcl9nZXRfbVcsIHdoaWNoIHdpbGwgYWx3YXlzIHJl
cG9ydCAwIGluIHRoZSBjYXNlIHRoYXQNCj4gPiBpZ3RfcG93ZXJfb3BlbiBmYWlscyB0byBvcGVu
IGVpdGhlciB0aGUgaHdtb25fZmQgb3IgcmFwbC5mZC4gIFNpbmNlIHRoZQ0KPiA+IGV4cGVjdGVk
IHJlc3VsdCB3aWxsIGFsd2F5cyBiZSBhIGZhaWx1cmUgaW4gdGhpcyBjYXNlLCBza2lwIHRoZQ0K
PiA+IGFzc2VydGlvbiB0aGF0IGd0X2M2X3Bvd2VyIDwgZ3RfYzBfcG93ZXIuDQo+ID4gDQo+ID4g
djI6IERvIG5vdCBza2lwIHRoZSBmdWxsIHRlc3QsIGFuZCBpbnN0ZWFkIG9ubHkgaWdub3JlIHRo
ZSBwYXJ0IHRoYXQgaXMNCj4gPiBndWFyYW50ZWVkIHRvIGZhaWwuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4tQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+DQo+ID4gQ0M6IFJpYW5hIFRhdXJvIDxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gICB0ZXN0cy9pbnRlbC94ZV9wbV9yZXNpZGVuY3kuYyB8IDEwICsrKysrKystLS0N
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jIGIvdGVz
dHMvaW50ZWwveGVfcG1fcmVzaWRlbmN5LmMNCj4gPiBpbmRleCA3NzJmZTliNTc0Li4wZjE0NmJh
ZDFjIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+ID4g
KysrIGIvdGVzdHMvaW50ZWwveGVfcG1fcmVzaWRlbmN5LmMNCj4gPiBAQCAtMjgyLDEwICsyODIs
MTQgQEAgc3RhdGljIHZvaWQgbWVhc3VyZV9wb3dlcihzdHJ1Y3QgaWd0X3Bvd2VyICpncHUsIGRv
dWJsZSAqcG93ZXIpDQo+ID4gICBzdGF0aWMgdm9pZCB0b2dnbGVfZ3RfYzYoaW50IGZkLCBpbnQg
bikNCj4gPiAgIHsNCj4gPiAgIAlkb3VibGUgZ3RfYzBfcG93ZXIsIGd0X2M2X3Bvd2VyOw0KPiA+
IC0JaW50IGd0Ow0KPiA+ICsJaW50IGd0LCByZXQ7DQo+ID4gICAJc3RydWN0IGlndF9wb3dlciBn
cHU7DQo+ID4gICANCj4gPiAtCWlndF9wb3dlcl9vcGVuKGZkLCAmZ3B1LCAiZ3B1Iik7DQo+ID4g
KwkvKg0KPiA+ICsJICogaWd0X3Bvd2VyX2dldF9tVyB3aWxsIGFsd2F5cyByZXR1cm4gMCBpZiBp
Z3RfcG93ZXJfb3BlbiBmYWlscywNCj4gPiArCSAqIHNvIHNraXAgdGhlIHBvd2VyIGNoZWNrIGlu
IHRoaXMgY2FzZS4NCj4gPiArCSAqLw0KPiA+ICsJcmV0ID0gaWd0X3Bvd2VyX29wZW4oZmQsICZn
cHUsICJncHUiKTsNCj4gPiAgIA0KPiA+ICAgCWRvIHsNCj4gPiAgIAkJZndfaGFuZGxlID0gaWd0
X2RlYnVnZnNfb3BlbihmZCwgImZvcmNld2FrZV9hbGwiLCBPX1JET05MWSk7DQo+ID4gQEAgLTMx
Miw3ICszMTYsNyBAQCBzdGF0aWMgdm9pZCB0b2dnbGVfZ3RfYzYoaW50IGZkLCBpbnQgbikNCj4g
PiAgIAlpZ3RfaW5mbygiR1BVIGNvbnN1bWVkICVmbVcgaW4gR1QgQzYgYW5kICVmbVcgaW4gR1Qg
QzBcbiIsIGd0X2M2X3Bvd2VyLCBndF9jMF9wb3dlcik7DQo+ID4gICANCj4gPiAgIAkvKiBGSVhN
RTogUmVtb3ZlIGRnZnggY2hlY2sgYWZ0ZXIgaHdtb24gaXMgYWRkZWQgKi8NCj4gPiAtCWlmICgh
eGVfaGFzX3ZyYW0oZmQpKQ0KPiA+ICsJaWYgKCF4ZV9oYXNfdnJhbShmZCkgJiYgIXJldCkNCj4g
U2hvdWxkIGJlIHx8DQoNCnx8IHdvdWxkIG1ha2UgaXQgYSB2YWxpZCB1c2UgY2FzZSB0byBydW4g
dGhlIGJlbG93IGFzc2VydCB3aGVuIHRoZSBzeXN0ZW0gZG9lc24ndCBoYXZlIHZyYW0sIGlycmVz
cGVjdGl2ZSBvZiBpZiBpZ3RfcG93ZXJfb3BlbiBzdWNjZWVkcyBvciBub3QuDQpJdCB3b3VsZCBh
bHNvIG1ha2UgaXQgYSB2YWxpZCB1c2UgY2FzZSB0byBydW4gdGhlIGJlbG93IGFzc2VydCB3aGVu
IGlndF9wb3dlcl9vcGVuIHN1Y2NlZWRzLCByZWdhcmRsZXNzIG9mIGlmIHRoZSBzeXN0ZW0gaGFz
IHZyYW0gb3Igbm90Lg0KQXJlIHRoZXNlIHZhbGlkIHVzZSBjYXNlcyBmb3IgY2hlY2tpbmcgdGhl
IGJlbG93IGFzc2VydD8NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gVGhhbmtzDQo+IFJpYW5h
IFRhdXJvDQo+ID4gICAJCWlndF9hc3NlcnRfZihndF9jNl9wb3dlciA8IGd0X2MwX3Bvd2VyLA0K
PiA+ICAgCQkJICAgICAiUG93ZXIgY29uc3VtZWQgaW4gR1QgQzYgc2hvdWxkIGJlIGxvd2VyIHRo
YW4gR1QgQzBcbiIpOw0KPiA+ICAgfQ0KPiANCg==
