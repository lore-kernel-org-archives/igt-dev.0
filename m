Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF6CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422C810E9F3;
	Fri, 24 Oct 2025 08:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUVu6ywR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98910E9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761293065; x=1792829065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+fX1uoJFhkVQ8C384csm4mOGkEq8cQaJhLHuPd8/vDU=;
 b=ZUVu6ywRD3mGBkSXuTu+meqiRTcrGTxgvfWd7xGc1wsj67tWzkGyGlse
 zqsNyhbAqOH6ZKpRxmcJ6D6VGG39gpFtrY27dJMswuK1QRS9QssuFtd8m
 mR9a1Wt7YBLiPTdBTxEBw8mgDKVax5WgYZS6+mu2yrUjuV1B6IJ0qrLyc
 0L2jU+rvPv6Xtoh64DDB3qqRcR5e9kJ9aX8xorsIm5x3ZTPhEoGnX9wg4
 Isj2QuZlWt5eXXLj0Z3KfMeqX5sIJathrY3ZTIF4M7QAgaFIVqWUfmZWL
 D292PtuUODIcRhJC5NZuHb7n/ZfZtDnQuGigrDs0EVMOpojc7/ucw4yqU w==;
X-CSE-ConnectionGUID: 0d6ino/WToK/UzEqAMTN1w==
X-CSE-MsgGUID: ZinEcaalTQirJ4Kitmn3ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63396543"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63396543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:04:25 -0700
X-CSE-ConnectionGUID: kvHZZWZ1S9uE1gaX6fqEHA==
X-CSE-MsgGUID: dydzFj9/TQWYjTvrjTH/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="183598035"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:04:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:04:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 01:04:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLcVDgJNsZta3psRqh0o3GEbMa1y3D5L5vnFF+nxrcCG9LtjEbJw++Sh7krthFKajLhn5q9zKf7hAHzd9ZwwdWM0ZcbXiow++fjHopnUQKuYYIAOSFCtu+daytYiSOsxR1kRj90QgoFi07mfhiQlX0myrIIbvn8XRxRvJAtQy67isbP+HCrOHvcTbwsK5MC5I4rXxxz7w+08vOKsvJI2ldLBZbCgxv1uvGXFmYCZ/r81Q5ln4KGUK4c/gndbsmWoyh40QkpMmvIopxyW2oae3zlf+Li+c7whQGis1anUEs/6mys6q/QWeCg7MOPI0pQDbTpNygLnEGXDHFsjnnsg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fX1uoJFhkVQ8C384csm4mOGkEq8cQaJhLHuPd8/vDU=;
 b=i672mYexIF6kYuCNWqYM5+hQLRdXHEIWLuNW3J1coDr1Lxeln4EHBI9LO6ny83gC/0X1HFOcv5d/d6NFNh4w8x6qnpdqGMC5GP6lhAhW1cgC3w4Sqx1SwjMRabWpIdB9tIXZzH8bRxF4KD+mAthqDEd1sg9IFKiMASU1YxvGgKKYQPLxHeLZCTa8iGArpbkwtdQSIjaL0Wzub7J+aVbkrd2av7b2VH9/6cgqH0zx96Jf5E7BhEKn8/cHYaZxLNsnUJBRnHKK3r5rZ/vzvcFi1vCfEUZJocQCo6f0a/g8Zv8qkbV2tNSBHgQeG96i39SK/m8+iXfnbQv6XrWFrwGakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 08:04:22 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 08:04:22 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 2/5] benchmarks/intel_latency: Add xe_execqueue
 test
Thread-Topic: [PATCH v5 i-g-t 2/5] benchmarks/intel_latency: Add xe_execqueue
 test
Thread-Index: AQHcRJbGV5pUWYzne06dvBN+bLUh/rTQ7/dQ
Date: Fri, 24 Oct 2025 08:04:22 +0000
Message-ID: <CH3PR11MB8434F527F246367DDA3D01CF8DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
 <20251024033118.15674-9-gajendra.uttamchand@intel.com>
In-Reply-To: <20251024033118.15674-9-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB6768:EE_
x-ms-office365-filtering-correlation-id: 4484620e-4677-4331-0ef9-08de12d3f0d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MGsyVkMyUWMwK3ZDK29SaTR6MkZHN3VvVWpydTNQSm1lbFNXQU1Ba2JkV2RG?=
 =?utf-8?B?MnJmYnhwaG55Z2pFYTVUby95V3JYdGYyUVFkazloYzYrdG14OCt6L1A1Y0h4?=
 =?utf-8?B?Y3V6UGpYZHBsaE9NLzk0ZUR6VjJyRmQzYVdGVnNnMERIM0JxaFl6V3FRaHpP?=
 =?utf-8?B?TTZqSkkrUkpVbW1CTnhyOFU2clR6bUVDTmFwWVlKTW5aejVwSVRtRktsVDdi?=
 =?utf-8?B?T0VkQit4VUhsb3F0L1hCSWVIaVJHaktzakRyNGdQRUcwUjlNNGNtR3lLQkRL?=
 =?utf-8?B?a2lWd0RQNmNyZ29CUGRmdWI1a0tMaHRZRkEyU1Q0T2dsR3BoQUVpanpBT3Va?=
 =?utf-8?B?OGdxd3h1MnlnRFFQdEhHcE9wWjFGMVFhL2NDWE0ybzlVRXhsYmpZS0NaQlFB?=
 =?utf-8?B?ZUJ3eENPcGxlNmlXZllOVlNNQXVPZytyZjJJRDlvOWZYeDRkQVN2dnA4WUZo?=
 =?utf-8?B?blpNaUp6WXNsK3dLc1U2aktRdituWE1YdXZTRFphdm9pZmdldzFadTJuc2dC?=
 =?utf-8?B?SXZQV0lKcEhyMW5GNWxibnJlT2IvSnM1SFpxUEIwcGwzRXBNWVpEN0VxeTl1?=
 =?utf-8?B?eks5WWtvRWQvcWsyNEkrM2FaSHdRWGdHSlFESUovREVMVktRTWdpcXZUZ1U1?=
 =?utf-8?B?ZDR5S3Y4bjFRZjFndmRIRjdhZW1KMDBWUDViSFpBTFliQnAvbktaZmtCbnB5?=
 =?utf-8?B?STZ5TUU2aHZTajNvWTV4ejVxQ1NiR3BkYlVId01ERWF0OWFnejVmYnpCNXR5?=
 =?utf-8?B?YkY4TUNRNlQyMlVnajBmTTA2cmZ5Q2RYNzJDWWlRUFNRQWQ2K0JaaDlRTm5v?=
 =?utf-8?B?WXRBLzdoZjQ3NVF4QzkzZ3JsY0FndG4yV3A2RUdBc0x6YzRzV01HcVhzaDlB?=
 =?utf-8?B?Zm4yMTdrMU4rVEVXT2NRMWM1bVYwblE0ODZNbm1RTVBNOVVpVHhmVE0rbUpV?=
 =?utf-8?B?SnNKa1BtOFVuNTlaSmoxNFk2a1BHQ2F6TmFjWUVaOUY2WXgwbGlUbkNzVEhW?=
 =?utf-8?B?UEJCY0JlSTF2T3NmL05LbEhuMEVMeHBjb2ZMcmU2THVxWnRsb1p6NTRhS0M2?=
 =?utf-8?B?V2paVSs3TzVpWXpWanIySjRpQ1dHSkxWMmhIMXJHK1V4ZVRXMWd1N3JjakVJ?=
 =?utf-8?B?Sy9vdFRVWk5pMUhmMXkybjNGZ3ptYWtnN204S1UrQjArbEhTaGZwNXRXR0pS?=
 =?utf-8?B?NHdUekh5S1FNRDlaZUplRHY4TnJ5VGNMdzBOYlhYSkFhQnNRYnNiNFpMNHBO?=
 =?utf-8?B?MzNwWEE5SXJ6aTl4eWdJajVtaSs2c3UzeUw2SHozY21wWG5mYVZaVDJhQlhQ?=
 =?utf-8?B?Ny9vblIydTZ1TWsyS1l1T3BuZThUZGoxa2ZmODRMOEo0YUc4eE11aWlDdjdr?=
 =?utf-8?B?T2JxRHFNZ0M2c2hxL0FMYzFkTCtKRnNIRXBSOFE2Rmx3clkrZ2xJUVVtODlS?=
 =?utf-8?B?cWkvZHdIS1FWZ2R4KzFNZGNTRm1LZVA3UW80WVBiSFF4cjV4ZEo2Q1dzandm?=
 =?utf-8?B?bVZpeGIyZFM3NlFPQU9JZkR0eE0wZXdtNnhYN2k3WUxwK1BucWtTUmc4ZW9E?=
 =?utf-8?B?RzVzMjc0eXZVdWlGWTBMeXdOaE83cmo4QjJ3UTA4Nk80Y1pZbkdFZ0tzb2dY?=
 =?utf-8?B?dWlXd3pIZ1dXSlA3RHBMTjB1UGErckVCUFBKekhKNElCc2c0UGI1LzBLbGxF?=
 =?utf-8?B?N2RteWhQWHR0dEZDMDk5SlZUMlArS1dZL3NXdHY0RlhSanc2OGlkSDIrT0Fp?=
 =?utf-8?B?ajk1QTE4NHVyMzlTR3NWVDNpdkEwWHR1a0xvOE1keGRTeldiYjNtdUFuM3I3?=
 =?utf-8?B?R3hxeGV0dTlJZTlyd2xhc2JJdk82c2x3N0s1YnNYNndLL3lGZzkwNGd3bDhp?=
 =?utf-8?B?UHdNQmZFWDR0ZEVZTjRJemYzS1hCcWZxVkRBWjBBMmNSVE0vbnkxZnZlZEpJ?=
 =?utf-8?B?VHpIN002WTR5bUozV3BUTmpDalRkdlpMRUNBMENoaVB6bEdhNnZQbnFuc3F6?=
 =?utf-8?B?aE5ic2h3bkpJUWpHdS9SaGZWTkVvM1JMNG02c1pYeW5QWlUzaFhXS3MrLzZs?=
 =?utf-8?Q?MBXgiD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTVPbVdibXFtcVM5blpPTm50SWpuYWV3VDUyS2VCM3FqYzF0WENIOGVtZG8x?=
 =?utf-8?B?bXRlK2E2WU1JczlDSm5VQWNBS0ltajdabjd4REN4ajhQdlllcUR2MVdYVFJ5?=
 =?utf-8?B?bDJBdFNHaFRaVGxnWlYyNVZiZGFBU1AxYzIzdGZaSUZrOTF4Sy9ZOWp5dkZp?=
 =?utf-8?B?eU55T0xhY3V3eEU2YzNmYU1IdkZoY1RqbENVNnh2S1hQWUhzSVlYVnpDcG1t?=
 =?utf-8?B?WG5BRTV0eE5UT2xqbmI3NzEzbTBza3VqYUs2ay9LMnJIVnU1bUt6TURGQkhX?=
 =?utf-8?B?RXNEMVp2L0lXWTkzS0xFN29hbzRHU3EzbFBFaU9JcUJOWnJYTlpUODNza1lS?=
 =?utf-8?B?K1I5UVhWcUJvSHdtUEhYcjRDaWI2cDZjK0RZRmdWc09SZTJuWlpocFJaNHRQ?=
 =?utf-8?B?SHNiRlRBVWxUTVBUMXV2cGpoOTRJYnNtbmNJYUc4M1BwekNBMjdiNCt1NTB3?=
 =?utf-8?B?ZHlNTjczTmtCVVFTdjJmU3ZwYnVWWmNNVWJSR1dQZzAvRUd3a0lXQnE2MVdT?=
 =?utf-8?B?dFV2dW5VQjcybkVqL0o3MDRSWHdGL0pra2R2b1Rrb0p1Rm05ZE9MSnQ0MDdS?=
 =?utf-8?B?aDk2UFhYUFJoZllKd0pqREV2U0VIaFBpRHR4ZnVVRGdjd0tjSlJLM2hxazYy?=
 =?utf-8?B?TUFaNVpNbEt5SUZUNmwyS21qU3FPK3FYQ1hmVDdRYk1mamZ0R3BNVlZ2dklu?=
 =?utf-8?B?eGQzZWR4MC9nc1RXb1lqTXc0c2pXeVFiM0FoaEdZMFNWUk9aUHQ0RTBvYWox?=
 =?utf-8?B?dkI0WS82d1BsTGtjMGtlUDk5ak1KcE83VWl6d3VaVEdna0NMclNEM2hkWmxy?=
 =?utf-8?B?NktZb1N4dG4wUjdnZUxLY1FEUFFhbE43djRxTUJWUWRjZXBTK1o0QzdOVGhr?=
 =?utf-8?B?cEJDOTB3dWN5RXE5S0E5dk8yc2FLdVBBOWtKSHZVNEtSK2ZXOUEyK2dLcmt4?=
 =?utf-8?B?UVNrdmhVK3lza1pIbHNBaGduK09FT3RCRWdJOTFxR3lBanhLSkFOQzVhMjh0?=
 =?utf-8?B?SVZWMHFPRjRXemZ4Q0NwOEY0cHczR09QWFNlOG5DOXpwYURCT0o0TjYxOUlK?=
 =?utf-8?B?ZTByVkVkNkorenNaMjZMUHNFV2R0Z1czZjk5TmVoeXdhV0FXYVdyRTRsOG1P?=
 =?utf-8?B?anlQeDJKa084Wks4bERtbDdkNGpNd1N0ejNYZGRMS2NNczRxTXhsbWF2SXo5?=
 =?utf-8?B?M0kydWVkc2VWY2wzUUJkMTVnSkM3ek1HdWlPMitZOUxtZm81NUYvaHlUTEJR?=
 =?utf-8?B?a3JSR085Vlh6M1pEd2M0RVlOZm84STloQ0Z5RjFOQ28wWVpyekRNSS9SdXJT?=
 =?utf-8?B?THJOOUJ0NWlxY1gzc013WHQ5ckc3MUJLMlJhcTBjK3VKeXhEK1lSYTlNZ016?=
 =?utf-8?B?NFRYN3AzZ0YwRmdjWHd4dTFTTmJyQS9GT3RTWVJKK0hSZ21qbU5qaXZ3YXYv?=
 =?utf-8?B?N3g3QU9zV2dtK2w3UkxFN3AzR3d6Z1lEeUpET1JxaXdrdTJybFFtZmduaDV4?=
 =?utf-8?B?VHdtMklxdVpKYVNmR3N0cmFPN2JvNndQdTdvOHZQOXpNVEZxTFh6Z1JPK2l5?=
 =?utf-8?B?OEFjNUR6QTFxLzlWR1lQdDNPeUFHblVrbFZpOWMwd0hOcVRDNUdJMlFtbWFY?=
 =?utf-8?B?WXRuVzB6cUNEZGJjb3RJVUZidGlpaDFKNUNWS2VBVGowQ2M2NFRJNlFiajFI?=
 =?utf-8?B?U2lFMUY4UmxqYzhsRjU3RE84dW1TRVRFZ244Q0tkVEgzTktRaDJBMHI3Yk44?=
 =?utf-8?B?YVBVQ1UvT1NQbVg4c0RVNHk1bHE3eFdOQ29YdTM4T0l0VzAyc2NrVGthU1NI?=
 =?utf-8?B?VVd2aWcvRmRtbEhZc3czRUd3Mmp3cUNyaS8yVWVuaE9CNHgzSlQ2M01uRE80?=
 =?utf-8?B?ZXpFZ0djYitSRkhIRUNENCtUV3oxRUs0NWlyT3lnZjVtNHBxR2VTR1F3OGtI?=
 =?utf-8?B?bUxnNzNmUzVxeWl1dmh1bFBKSzl6aHZVWHE3Rmg0ejJFOHAySGdiQXpFVTFY?=
 =?utf-8?B?ejBHSmdZTVlkTUZCdXhPRVlFTEpYZVlWUWpLeG5NNkpaazFhK1c4RkNONXRs?=
 =?utf-8?B?b3NYU3pvMGdjam1yUjIvL0hqcFA5czMybTF0UDk5U2F2eE9HWkdDbHJsaHl1?=
 =?utf-8?B?Mld4ZitDcy9pUEdLVDIySHlzdG40Z1RFYTMyUGJnckxBOUxpeHFPdWdya05w?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4484620e-4677-4331-0ef9-08de12d3f0d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 08:04:22.0452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mjq8mNwz9aNqz/vYViNs/Ykll5t2QvtJ7RG7j1YaEVbqogWRAj0b28PM+mWCI9xG2OjunOmLuoieampQec947VdPh5sOz7aRQ6yeO3q1lyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXR0YW1jaGFuZCwgR2Fq
ZW5kcmEgPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiBTZW50OiAyNCBPY3RvYmVy
IDIwMjUgMDk6MDEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgRGFuZGFtdWRp
LCBQcml5YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFV0dGFtY2hhbmQs
IEdhamVuZHJhDQo+IDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY1IGktZy10IDIvNV0gYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5OiBBZGQgeGVfZXhl
Y3F1ZXVlDQo+IHRlc3QNCj4gDQo+IEFkZCBleGVjdXRpb24gcXVldWUgbWFuYWdlbWVudCBsYXRl
bmN5IHRlc3QgZm9yIHRoZSBYRSBkcml2ZXIuDQo+IE1lYXN1cmVzIHBlcmZvcm1hbmNlIG9mIGNv
bW1hbmQgcXVldWUgb3BlcmF0aW9ucyBpbmNsdWRpbmcgcXVldWUNCj4gY3JlYXRpb24gYW5kIGRl
c3RydWN0aW9uLg0KPiANCj4gRGVmYXVsdHM6IDEzIHJlcGV0aXRpb25zLCAxMDAwIGl0ZXJhdGlv
bnMgcGVyIHJlcGV0aXRpb24sDQo+IDIgc2Vjb25kcyBwZXIgc2FtcGxlLCBzaW5nbGUgQ1BVLg0K
PiBQYXJhbGxlbGlzbSBhbmQgYnVzeSBtb2RlIGFyZSBjb25maWd1cmFibGUgdmlhIGNvbW1hbmQt
bGluZSBvcHRpb25zLg0KPiANCj4gQ3JpdGljYWwgZm9yIHVuZGVyc3RhbmRpbmcgY29tbWFuZCBz
dWJtaXNzaW9uIG92ZXJoZWFkIGFuZCBvcHRpbWl6aW5nDQo+IGdyYXBoaWNzIHdvcmtsb2FkIGV4
ZWN1dGlvbiBwaXBlbGluZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHYWplbmRyYSBVdHRhbWNo
YW5kIDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gLS0tDQo+ICBiZW5jaG1hcmtz
L2ludGVsX2xhdGVuY3kvbWVzb24uYnVpbGQgICAgfCAgIDEgKw0KPiAgYmVuY2htYXJrcy9pbnRl
bF9sYXRlbmN5L3hlX2V4ZWNxdWV1ZS5jIHwgMTIxDQo+ICsrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV9leGVjcXVldWUuYw0KPiANCj4gZGlm
ZiAtLWdpdCBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS9tZXNvbi5idWlsZA0KPiBiL2JlbmNo
bWFya3MvaW50ZWxfbGF0ZW5jeS9tZXNvbi5idWlsZA0KPiBpbmRleCBjNDA0NTAxZTguLmIzNTQ1
ZWZkMCAxMDA2NDQNCj4gLS0tIGEvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxk
DQo+ICsrKyBiL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS9tZXNvbi5idWlsZA0KPiBAQCAtMiw2
ICsyLDcgQEAgeGVfbGF0ZW5jeV9wcm9ncyA9IFsNCj4gIAkneGVfYmx0JywNCj4gIAkneGVfY3Jl
YXRlJywNCj4gIAkneGVfZXhlY19jdHgnLA0KPiArCSd4ZV9leGVjcXVldWUnLA0KPiAgXQ0KPiAN
Cj4gIGxhdGVuY3lkaXIgPSBqb2luX3BhdGhzKGxpYmV4ZWNkaXIsICdiZW5jaG1hcmtzJywgJ2lu
dGVsX2xhdGVuY3knKSBkaWZmIC0tZ2l0DQo+IGEvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hl
X2V4ZWNxdWV1ZS5jDQo+IGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4ZWNxdWV1ZS5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uMTk0ODJiZDc1DQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2V4ZWNx
dWV1ZS5jDQo+IEBAIC0wLDAgKzEsMTIxIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24N
Cj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNv
YmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1
ZXJ5LmgiDQo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ICsNCj4gK3N0YXRpYyBkb3VibGUNCj4g
K2VsYXBzZWQoY29uc3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwgY29uc3Qgc3RydWN0IHRpbWVz
cGVjICplbmQpIHsNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAx
ZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ICtzdGFydC0+dHZfbnNlYyk7IH0NCj4gKw0KPiArc3Rh
dGljIHZvaWQgdGVzdF9leGVjKGludCBmZCwgdWludDMyX3Qgdm0pIHsNCj4gKwlpbnQgZXJyOw0K
PiArCXVpbnQzMl90IGV4ZWNfcXVldWVfaWQ7DQo+ICsNCj4gKwllcnIgPSBfX3hlX2V4ZWNfcXVl
dWVfY3JlYXRlKGZkLCB2bSwgMSwgMSwNCj4gKwkJCQkgICAgICZ4ZV9lbmdpbmUoZmQsIDApLT5p
bnN0YW5jZSwNCj4gKwkJCQkgICAgIDAsICZleGVjX3F1ZXVlX2lkKTsNCj4gKwlpZ3RfYXNzZXJ0
X2YoIWVyciwgIkZhaWxlZCB0byBjcmVhdGUgZXhlYyBxdWV1ZSAoJWQpXG4iLCBlcnIpOw0KPiAr
DQo+ICsJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlX2lkKTsgfQ0KPiArDQo+
ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+ICsJaW50IGZkID0gZHJt
X29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJaW50IHJlcHMgPSAxMzsNCj4gKwlpbnQgbmNw
dXMgPSAxOw0KPiArCWludCBjLCBuOw0KPiArDQo+ICsJd2hpbGUgKChjID0gZ2V0b3B0KGFyZ2Ms
IGFyZ3YsICJyOmYiKSkgIT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3In
Og0KPiArCQkJcmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4gKwkJ
CQlyZXBzID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJbmNw
dXMgPSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+
ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmIChu
Y3B1cyA9PSAxKSB7DQpXaGF0IGlzIHRoZSB1c2Ugb2YgaWYgY29uZGl0aW9uIHdoZW4gZXZlcnl0
aGluZyBjYW4gYmUgaGFuZGxlZCBieSBlbHNlIGNhc2UgZXZlbiBmb3IgbmNwdXM9MSBjYXNlPyBS
ZW1vdmUgdGhpcyBpZiBjb25kaXRpb24gY29kZSBhcyBpdCBpcyBraW5kIG9mIGR1cGxpY2F0aW9u
IHRvIGVsc2UuDQo+ICsJCXVpbnQzMl90IHZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4g
Kw0KPiArCQlmb3IgKG4gPSAwOyBuIDwgMTsgbisrKSB7DQo+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0
czsNCj4gKw0KPiArCQkJaWd0X3N0YXRzX2luaXRfd2l0aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+
ICsNCj4gKwkJCWZvciAoaW50IHJlcCA9IDA7IHJlcCA8IHJlcHM7IHJlcCsrKSB7DQo+ICsJCQkJ
c3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWludDY0X3QgY291bnQgPSAwOw0K
PiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZzdGFydCk7DQo+ICsJ
CQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsgYysrKQ0KPiArCQkJCQkJdGVz
dF9leGVjKGZkLCB2bSk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tf
Z2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50
dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJCWlndF9zdGF0c19wdXNoX2Zs
b2F0KCZzdGF0cywgY291bnQgLw0KPiBlbGFwc2VkKCZzdGFydCwgJmVuZCkpOw0KPiArCQkJfQ0K
PiArCQkJcHJpbnRmKCIlZlxuIiwgaWd0X3N0YXRzX2dldF90cmltZWFuKCZzdGF0cykpOw0KPiAr
CQkJaWd0X3N0YXRzX2ZpbmkoJnN0YXRzKTsNCj4gKwkJfQ0KPiArCQl4ZV92bV9kZXN0cm95KGZk
LCB2bSk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJc2l6ZV90IGxlbiA9IChuY3B1cyArIDEpICogc2l6
ZW9mKGRvdWJsZSk7DQo+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiArDQo+ICsJCXNoYXJlZCA9IG1t
YXAoMCwgbGVuLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLA0KPiArCQkJICAgICAgTUFQX1NIQVJF
RCB8IE1BUF9BTk9OLCAtMSwgMCk7DQo+ICsNCj4gKwkJZm9yIChuID0gMDsgbiA8IHJlcHM7IG4r
Kykgew0KPiArCQkJbWVtc2V0KHNoYXJlZCwgMCwgbGVuKTsNCj4gKw0KPiArCQkJaWd0X2Zvcmso
Y2hpbGQsIG5jcHVzKSB7DQo+ICsJCQkJdWludDMyX3Qgdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAs
IDApOw0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90
IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAm
c3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykN
Cj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgdm0pOw0KPiArDQo+ICsJCQkJCWNvdW50ICs9IGM7DQo+
ICsJCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsNCj4gKwkJCQl9
IHdoaWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4gKwkJCQlzaGFy
ZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwNCj4gJmVuZCk7DQo+ICsJCQkJeGVf
dm1fZGVzdHJveShmZCwgdm0pOw0KPiArCQkJfQ0KPiArCQkJaWd0X3dhaXRjaGlsZHJlbigpOw0K
PiArDQo+ICsJCQlzaGFyZWRbbmNwdXNdID0gMDsNCj4gKwkJCWZvciAoaW50IGNoaWxkID0gMDsg
Y2hpbGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJlZFtj
aGlsZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10pOw0KPiAr
CQl9DQo+ICsJCW11bm1hcChzaGFyZWQsIGxlbik7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7
DQo+ICt9DQo+IC0tDQo+IDIuNDMuMA0KDQo=
