Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137EAE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 21:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0EB10E65C;
	Thu, 12 Dec 2024 21:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0UNPj8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF3F10E658
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734039714; x=1765575714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5dh2PH9jEi3ywhplTQB2Ht8aYzE5x+U5plN5k5JAYD8=;
 b=l0UNPj8n7392fmHgm1+B1s9S/xFZq6UpY1a/hIldA1gLSbK7HMrhGazz
 fMtwOKdfWvuEQw2SSPHl/WoL4MZkQoVtVtTThaa8dN+4CTISMdmmk5Df0
 0M3YMbOiXrdttInPdnqiMWkLvVLkGcd6GZj4QF/h8/V1r/4QkY249uxTm
 d31AL9yK4u37gm4GWOv0ShiBejbHoZADCNlGgZJpQYUmHfOQPOlaLGREm
 zAspjoXWqkCwFzFldXr2C6GzhkJsdIdvIZFAVFx8JpbdM5qrnZU8ieRgP
 DSKzyHIRHzI5resYynjXPW6ycFdcrbt5RdicFqCC0YjcnSggmznqOkd6Y w==;
X-CSE-ConnectionGUID: 5SJ2G1cfRbWpjKXZV7Rj6Q==
X-CSE-MsgGUID: AxgqS5DOTVuCGuwl0GwgdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51899282"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="51899282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 13:41:54 -0800
X-CSE-ConnectionGUID: MexBTPvfQFiX0CMn1o0HYA==
X-CSE-MsgGUID: 7LEX2WOvRgmjjmUxZhnScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101311054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 13:41:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 13:41:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 13:41:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 13:41:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SalAz9xCSlv37r80gBM23KpoeOQGXmH4YrhPkFhiGOlxOQieeTEft3yxN9MQ/BnaaJx6SUKXnGwY4MeOZ+2CE28oT4U34p5Ah08WC2sAOZVxzafZO275uQp9QqsDR1s3cToobxqb5YMkDPcb7S0z21+u3lO5LbcJo6PCTSf7ih2tBAsSq5xOnGKLl5L2cGNrt9TcpYbXYjIwSrJW0rO7U9RIFnjerVXZIe+F6zHxjc92HhUtucXj9CS66Bwx2NYFbZlhwZFYu4HPngmsR0QIFzIclvh7quSxttjp7BLyXKrq7h6cls3hSo3NTrFeoh7RbWJi1JwAnsG8bodczCUR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dh2PH9jEi3ywhplTQB2Ht8aYzE5x+U5plN5k5JAYD8=;
 b=pDV27w1IYx+3h7gYLdsJ3rGL9uY3BVtFoayw0QZLXKPVQHT6YLavKjLfaYk+4SiYgcf+4W3hQSwcxtaiBeYD/v8IRseJJIMiUl9Yy78aLXkiAu8suktc2w/VvLLdU+sn6SG4VB1EQhrxCwmyl/Mqt/LuGxFrwjhymqG/z31aa2tdJi78+DMG7av+B1Yy7dL2T3IH4YUX7IKr51oSePRJY1D0h4RDCJYf3dxf2IoPoEDz7HsdgYVbSs4Hm0BIKiv/ejT0scEDgSNhyLc2JkhR8Q5JRl7BnnpW7sJ68sE69utLjX+pMzJCOGo4cvxFFjlhT9OvMl4Kvhc1su2AFuhL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.17; Thu, 12 Dec 2024 21:41:50 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 21:41:50 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Topic: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Index: AQHbSDJ/rULFXyfQPE6WCBrh40ledLLjLOUA
Date: Thu, 12 Dec 2024 21:41:50 +0000
Message-ID: <af3aef60ce3eb6963120ed1a45865a98cd8fcf70.camel@intel.com>
References: <20241206225911.465603-1-zhanjun.dong@intel.com>
In-Reply-To: <20241206225911.465603-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: ad8b65e4-688e-439d-4f9e-08dd1af5c93c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Kzk1WGc3VDFHVnQzY1hGRHp1Ym1RVFlYcno3OUswSHlFb2gxRlUyb1ZhRW9G?=
 =?utf-8?B?bTU0OU9hM1VoOUZSa3BBVVFXYzJCbVhmZmVIL1lONFVORVNiY2ttY0lJd2Ft?=
 =?utf-8?B?eXY2ZjlpTklhR1lqUTJNYldUVDh2elFaclF3RUdER2lFUTUwMm9RWXRuQ3VQ?=
 =?utf-8?B?dUdvL1p0SlExd2MzWkhWM1NqcWNXcVBZZVp0MC9HRDU4M25RcWgxVGlvWkZq?=
 =?utf-8?B?b25xMnlaMHJFSGxGZDNsOFp6S0Y3LzdOcE56bEtYL2NXeXZjY05ER2szRGdL?=
 =?utf-8?B?V1YzekpzS20ybTllOFgwWG84R3lFZ0dRTEk1Z01pUWNsOHk2Tnd4QzB4dy9Z?=
 =?utf-8?B?MTY2TmdvUjZMK2JJVzZZRzJ1dTQyczZDWHVESlVzU1cyRWVnSk1mVkxITnlq?=
 =?utf-8?B?UFNzUFkrOWk4aWRyM0I0T2RxNmppZHdkbTlsbWdKRW9GWmxHa2t4M0ZkT3Bz?=
 =?utf-8?B?WmlhWWVBOWRnZjgwSDJWVXE1d1E5a0tjVnNKcCtpZCszN3l2WFpFWmJmRVd3?=
 =?utf-8?B?K3JFL0F0SlFJSXV0UjZNY29ub3lMZ2pHNkh2UGhwQ1ZKMWtmUzljN0g1aXhy?=
 =?utf-8?B?eDl4QThpajl2d1RUcUVSOVUrQXU4aDRNai9LUk9sMzErdFpsU3ovTHRxWmpK?=
 =?utf-8?B?cVk3UmcrZElhWUkyWXlsMGFaemNzMzhINU12SDl5amJ2NGU3UlF1SUpxMnJ3?=
 =?utf-8?B?QjMvS0hHMEE5NXJCR3gvZWxJK0RKTTY2eWVlN1REUGdlb2E1MFY4eUtBc2lk?=
 =?utf-8?B?Y1VzUDcxTUsxOFhaM3ZFWHpKeWVjR0IzVnNqL3Q4YUFRSlFuV0ljd1JhaTBj?=
 =?utf-8?B?TDRoSUMwOWF3Rlc3WXVScDdIeHBLOGhkc2lDNVZnYmsyQm9xKzRqTEV6SWE3?=
 =?utf-8?B?WXV2eGw5bVZBa0M0dmx2OVJRck54NHVZWmpXeWZxOE4zOVVsNEFIckNOWEVZ?=
 =?utf-8?B?K0djYVg5SitGNzVGNmMvQjJQNUVmU0RaYlg1alY4UFFpVWFQbGZpRS84Qm1H?=
 =?utf-8?B?WGd0M0l5SEYvOURoZUREdHRjR3ZobVZ6akthMzBHVUVCOGtHVFFFVzZacko4?=
 =?utf-8?B?Rk1OUk42THpsQ2pLcENTWTJWOHZXMVF4bi9FRHdBMEVMODZSZUNXR1B6T284?=
 =?utf-8?B?aWlKWU81K3ZXbGpjSUtqTXdMR3BHU0xFRzVyOTEwcHFiTXN4ejQ3ZDM3Z0hG?=
 =?utf-8?B?Tmh3V0NGTzE5YzkxQ0pldENLdHlhWG5OaVNjNUdYRzJlMGVUT1gvWS9lcDJM?=
 =?utf-8?B?d2NEMmIzbVVIQ3hLdXdZVlJ3OXVZTTZSSWZjMytiTUM4NE93c2pmeEdnNDFH?=
 =?utf-8?B?TTlVS3RLbFRwekE1N1VqRlhJOE5vOWdDQlBYdEpJQkJsNGUzNGtjZ29sK0hT?=
 =?utf-8?B?WXprMGhVdkc2UHJqWGM5WHJSeHRYR25oT0cyV0JCMjZjb0NBM2xvb3l0UzRV?=
 =?utf-8?B?VDNyVWxNejVKRk5WcHErc0F1cmJxNmZFWjluL2duYUpEQlllZW4zR2VCSkhx?=
 =?utf-8?B?SXMyZFp1NUF5QVd6WTZUZXlPZlIzMW1rNmRMOFY4TEZZUFdNNDk2QlB4M2RE?=
 =?utf-8?B?WWhmVElYSmpOZ3NpZFk2MFRiMEtzckFiWmg1dWRjNDJ0b2FOYU9QSnRtekRo?=
 =?utf-8?B?Vm96Y05QSHZ6U1BPaS94K1pyR1BZOWhoa1hYeklJeGhMVjlyeENMYzE0RGNF?=
 =?utf-8?B?UEVpeWN5alBFK1ZvSzVVS3RhTkVYYWJPRm5UdUFTaEFBQlBmV2tBWGhCOTJH?=
 =?utf-8?B?Tjc1dTVyaXZEb3IrU1JQYUMzNGtHTXk5bjVkNjZGd0pHUXprckd6WVRvQmNB?=
 =?utf-8?B?bjdCbE80U2FNanE2U2srK1VmaVBJdkF0cnNlUkordFJnVHJNejhJOFRENWJF?=
 =?utf-8?Q?IH2FIRYRCAixb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmFIY0cxNThOamJTcnQ0MW8vNDNkRW9Pd0FEOXBjSHUrSGFieXJNcStmQUlv?=
 =?utf-8?B?YUsrUGlZZUJRd0g1VitvbGQ1UWJkSDNITlZlcXBhaXJSbTRrQXRIclp2eG1l?=
 =?utf-8?B?MUc4eVpjODIvRlVhdDN6Mkt0MTh5UUF0LzQyL2s1OEZiT3NtSHFLWG1EY1Na?=
 =?utf-8?B?RkFsVVNqVzlDd2w1UXJWbGtLWUtRMEtnRkkzT0JqSUt0b25yTi9va2x2aWxx?=
 =?utf-8?B?QVlZM2tiQ2VlZUd2ZjU3dXA4MWFPK0pHUnhpd21sbEhjajlhTzgyUmNQYU4r?=
 =?utf-8?B?WFlPazVCbEFFTU1uRDVmZEkzU2UvaVQvOVBvWU9zSHlFWjNGR1ByTUNGbUxJ?=
 =?utf-8?B?U1Y3RTBwaS96R3BYTzFaY2pHeU5Ja3ZFTExmWi9wMG12bTRSdkNVS1ptRXI5?=
 =?utf-8?B?bkJDeW5kTEFOVS9rNHU2Ukk1VTFSZzF3dHdySTVSc0U4MTlEcFdqaERyL2ll?=
 =?utf-8?B?MXpFRkkwWUNRd2gyTk52OEpyaHJYbUpsRVFRRTViUkp1MGpXQy90MVp4ZHZK?=
 =?utf-8?B?L09FeEZDSGdxa0V0a1hDVHA3K2p4TytJL2Q0V1h2YjdZYmZtT2JrUmVzSE9O?=
 =?utf-8?B?eGtZN0RBL09SSnR6YVVBd05ib1J1MVFXNFBPdnZuMks5aS9XWm9ETzllQ1Rk?=
 =?utf-8?B?SEV6STRJMkIwb1g3bTAvTXZCUzQrUDVqQ08yVHZyUVl0RkFlbmdZSUlHcmhV?=
 =?utf-8?B?cFd6MEFIR1FrTTcwNmFCaDhzcnkyNzQ4OU1sUlRoL2xTVjEzK0ZKLzVhOXcr?=
 =?utf-8?B?S0YyRDNjL2hpSW0yUTdFcDV5Q1Jxb1lUNFpwTGExd0dnWUtuZG55bWNIY0hI?=
 =?utf-8?B?VmJiUkJMdzMwL3pjOUdDT2RCWEpDWmNyendBbXlCS0E0Tjg2L3FRNUJxeUJl?=
 =?utf-8?B?bzJhdEdneGpBbjZlK3cvbkZBbFRmSG9VYXNjcjRuYktaVEtPenJ2TkNMWWxl?=
 =?utf-8?B?a2tWTk8vSGpVdTFvdzZhL3Z0S2xJalFnZXVBckpDbDFFTFIxam4rak5iY3NH?=
 =?utf-8?B?NGNXZHBUM3l6WStUWU9VcVNxWUhXdGpZWlQzcDBmY2pjTWxNWjlCLzNXYnZS?=
 =?utf-8?B?aXZzY2N1WjJBRWpKNloxZ3ZjU213aFRuNXZhK0N4WC9FWEZpNjRzOFl2Wm41?=
 =?utf-8?B?U0pBM1MyM0U3dE1nVVRNQXlzTWJ5Q2gzanFoT0E4bjVTU2UzV1QyTFdxN3FN?=
 =?utf-8?B?VWV0UHNVZjU0c1NmMDhjZkVZRHZIaGcySmxTSEdBVVB2R3ZSS1JsQ2xRTmRI?=
 =?utf-8?B?Q2ZrM0JmRW9CVy9LUjhyRG5RQUgrUjNSaFZ5K0I5Ym1USmx6TDVDNHd4L2dP?=
 =?utf-8?B?RFhOUmkwNzBVQWtFK2lXVU9wRW9ua3k0MFhJbjVHb2dWY0tvalBTQmZrc25M?=
 =?utf-8?B?RzR2M0I1blo2SlVhTVVieUxNTHJWRTlIdVc1Ty9ZalhjcHJjcDRaMG9sSGtu?=
 =?utf-8?B?NWlnOFJ3YXlpcytSQlJFeVdiSmlkd1pvdVh2Skd4VDR4clA3dlkwSU1GZ2Ni?=
 =?utf-8?B?WGZLdmtjRmNTME44L2d3SE4vOWhJcFNSS0liaDMxNWFHUkVWRVhWeUI5aDFW?=
 =?utf-8?B?V3Rld1FUa0ZSUWg1ck5UR0w0SjFFVWJnSi90Y0paajFLUnV5L0ZRT0N6MU9h?=
 =?utf-8?B?cVozb2wyRjgvVzNtSEhhT3IyOGIrZjJoajYyUndlK00xeWtEODRteW5rVkxu?=
 =?utf-8?B?UUlkSWtOOGlRVy80YkpZV0J4ZTlQanprK1Q0NGJLeXlKOVljVGRldk8vQUtF?=
 =?utf-8?B?ekZFaFJZeUJwUW45SUdPMndIQmpNUkJDNzNLcHMwSlZWMlA5ajVYbjJ0Wi80?=
 =?utf-8?B?cEsrQjFLQTk1TEZUVUFjNU5PbEFyb0ROS3VmODhFSkhMd1FoNWdObW41YU9N?=
 =?utf-8?B?QTYzVWpqNUQ1TE1TOXE2MEhQWVNBUU9rWUFKaUN2RGdFSnhXUU5rK2tTd0VJ?=
 =?utf-8?B?K2VVOFJQQjVVN1NPTHdHK2Q2b2s4NjcwcS81TldlUmhkSCttZTBObWFkdnd0?=
 =?utf-8?B?aDBlSk1NeXNZdXFOS0tPQWIrZUFMMklBaC9sVmplMXNESFFIZ1EydEVCaE9D?=
 =?utf-8?B?L20vVDJ0MWVlVW5pNjE3ZFE0TDEzVjNUcGwxZjBPamVPY1k4Y3A0N3ZLdE1H?=
 =?utf-8?B?WGdEbTFBU2FGbWJHNzJ4Q3p6MnVjamdYdnVsc0UxSVJNTzdITVNoTlprcjdv?=
 =?utf-8?Q?Uz2xa3iVt2S1THCsBL2cXy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9E2D9E45724EB42863D091333D81369@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8b65e4-688e-439d-4f9e-08dd1af5c93c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 21:41:50.1713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sy4AIRX+saHpZJ1FrK5DYcJTMoPJDdNgEEJWOhwGcqphmUGJ451XyIJJmjPuLhbWn2f1X1HXazpoCVqS/Elb/MHTPAeTN/3LK3dS639GYfhxUTYMoadM/8WgxFo0w3cc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
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

T24gRnJpLCAyMDI0LTEyLTA2IGF0IDE0OjU5IC0wODAwLCBEb25nLCBaaGFuanVuIHdyb3RlOgo+
IFN1Ym1pdCBjbWRzIHRvIHRoZSBHUFUgdGhhdCByZXN1bHQgaW4gYSBHdUMgZW5naW5lIHJlc2V0
IGFuZCBjaGVjayB0aGF0Cj4gZGV2Y29yZWR1bXAgcmVnaXN0ZXIgZHVtcCBpcyBnZW5lcmF0ZWQs
IGJ5IHRoZSBHdUMsIGFuZCBpbmNsdWRlcyB0aGUKPiBmdWxsIHJlZ2lzdGVyIHJhbmdlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4KPiBD
YzogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4gQ2M6
IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4KPiAtLS0K
PiAKYWxhbjpzbmlwCgo+ICtpZ3RfbWFpbgo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IHhlOwo+
ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfZml4dHVyZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZSA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqBpZ3Rfc3VidGVzdCgicmVzZXQiKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludCBncHVfY291bnQgPSBkcm1fcHJlcGFyZV9maWx0ZXJlZF9tdWx0aWdwdShEUklWRVJf
WEUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoeGUg
PiAwKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGdwdV9jb3VudCA+PSAy
KSB7CmFsYW46IFpoYW5qdW4sIGkgZ290IHNvbWUgb2ZmbGluZSBmZWVkYmFjayBmcm9tIEthbWls
IHRoYXQgd2Ugc2hvdWxkIGJyZWFrCnVwIHNlcGFyYXRlIHN1YnRlc3RzIGZvciBzaW5nbGUgZ3B1
IHZzIG11bHRpLWdwdSBzY2VuYXJpb3MuIFRoYXQgc2FpZCwKaGUgd2FzIG9rYXkgd2l0aCBkb2lu
ZyBzaW5nbGUgR1BVIGZpcnN0IGFuZCBkb2luZyBtdWx0aS1ncHUgbGF0ZXIgYXMgYW4KYWRkaXRp
b24gcGF0Y2ggaWYgd2UgcmVhbGx5IG5lZWQgdG8gZ2V0IHRoaXMgdGVzdCBpbnRlZ3JhdGVkIHNv
b25lci4KTGV0J3MgZm9sbG93IHVwIG9uIHdoYXQgd29ya3MgZm9yIHlvdSAoaSBiZWxpZXZlIGJy
ZWFraW5nIHVwCnN1YnRlc3RzIGZvciBzaW5nbGUtZGVmYXVsdC1ncHUgdnMgbXVsdGktZ3B1IGlz
IGFjdHVhbGx5IG1vcmUgc3RyYWlnaHQKZm9yd2FyZCkuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfaW5mbygiUnVubmluZyB0ZXN0IG9uIG11bHRp
cGxlIEdQVVxuIik7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWd0X211bHRpX2ZvcmsoY2hpbGQsIGdwdV9jb3VudCkgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCBn
cHVfZmQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGdwdV9mZCA9IGRybV9vcGVuX2ZpbHRlcmVkX2NhcmQoY2hpbGQp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlndF9hc3NlcnRfZihncHVfZmQgPiAwLCAiY2Fubm90IG9wZW4gZ3B1LSVkLCBl
cnJubz0lZFxuIiwgY2hpbGQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm5v
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZ3RfYXNzZXJ0KGlzX3hlX2RldmljZShncHVfZmQpKTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dGVzdF9jYXJkKGdwdV9mZCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2Nsb3NlX2RyaXZlcihncHVfZmQpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3dhaXRjaGlsZHJlbigp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2luZm8oIlJ1bm5pbmcgdGVz
dCBvbiBzaW5nbGUgR1BVXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHRlc3RfY2FyZCh4ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9CgphbGFuOnNuaXAK
