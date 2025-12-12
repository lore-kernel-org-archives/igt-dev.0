Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB22D49230
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 14:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440C10E31D;
	Fri, 12 Dec 2025 14:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXBjNBat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD80310E31D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765548653; x=1797084653;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=OZ++zJNl2E8cpT20VhhC7OUrVG7PY80QdixRskKEQ20=;
 b=DXBjNBatYe1UKCtYnR6+uW6Ajv0VmwkTEJxceqSNqqKL19/u6TLnxWAh
 ZQ8AyWs6QEDZLh4Fyh73innJOY+jcmgiAfhPmRGWYSdjA+V39+daLGdD6
 EHGtoxaItPmSXZlTClquCurPhwcRY3WBran9uO/GMPKxT5rVB2q+l8b0x
 fDjyAtN/Qx4EQgG4zeaVHrPYD/woM/nQO9DZyjaQ0sRiSMnQn5841cNA6
 FusAeElSnWok9eC4ieFW+CcLRYafCnLTGHaoMUVSKGk8liddK0KGwyHdD
 9DWteVFttQbYTnEkBtYAEqhVZfUrIOksDZDBiQ0XCpJTIPku0qNhfwBia g==;
X-CSE-ConnectionGUID: kNGCPtVASPeigag9C21GkQ==
X-CSE-MsgGUID: +OP7uDOlRQukS208baYGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78188698"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78188698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:10:52 -0800
X-CSE-ConnectionGUID: Zh5WXmRdQ2Ca3CvaqMIJdw==
X-CSE-MsgGUID: 1NtYnETDSdGD7JwvomHrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197163611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:10:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:10:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 06:10:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:10:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg1BbRxr5yUe2ULQpO752Y+wO/nDLIR9XDaOpnEs0E0+8Ecp1CgzKn2FeYoa/hcDEYgiaG0UENKU14rOFufjq3TxjrqNy5HP9ZRTPFx+bmTNFar14L0J0pNLfPGQaHuSuGNbvzYA5zdKDBZami84i4LsxEC3HiWfpSn9ZfODkjbY67LZirX4C0kZEBFOUimmiMincc98AuR7Gj6HYIZVkcd0yl1hDh2WuBYT9AInababhW2rVWcgIGNPbgyVkkC2o9HqKS5opcbyXgQt4mVI9nlBuIt2aHQa5+/5lYBkSmdswXzfX6iSlMDskCrHvIvR0KRtsCqKwuowAbZSrU02EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ++zJNl2E8cpT20VhhC7OUrVG7PY80QdixRskKEQ20=;
 b=m4g7t9JN1DkrlEm3yfhU/NwYhSv0VNHwNQax7F4HPBV3rqhWuWPc39DSrWk2DB/B3zodc+AmhiXwGaC3CXnc9VKweQblQtW4RViBTqguFPuvx69HWK0sFqjCuWF8K3kDlGcs3AvY4vaKG0oGY9/UOCJA8GtuLDPoAP7sRIumYI29FJXDAufycPfd1keqlcRASkmWIdGgxJIcbETm8gg1/AyAjb5XNnifbIj1efs2BcDIqEXm7zu8+gcuFuF1gjxS+kYi1D1Z44I4FSK7AYoXhjszKgnggic7Kb/mnNtpb3nv+KEOzz4qFMAwfqEKL9U4rdQOqaeD04R/3aB6vGlR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by SJ0PR11MB5816.namprd11.prod.outlook.com
 (2603:10b6:a03:427::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 14:10:48 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:10:48 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: remove symlinks
Thread-Topic: [PATCH i-g-t] intel-ci: remove symlinks
Thread-Index: AQHcY4wTRPbZULRit0eq7ZAEotp3M7UeGx8A
Date: Fri, 12 Dec 2025 14:10:48 +0000
Message-ID: <107b4cf7be0e07461d1c407cdf6e782720b75628.camel@intel.com>
References: <20251202130316.62780-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251202130316.62780-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: 43b6c11b-50d3-44e3-02ef-08de39883fd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NVVscFBlWkhMTHFnUXFld0ErZjU5U0FPZXBwSXFSN29BaUtqTzR3UnFJbnlW?=
 =?utf-8?B?NjdEaXpMOWhYVmd6UUJoQ1d1dmNnV0loZkRHUFF4MWxYM1BlV3ZPNUFFcjQ1?=
 =?utf-8?B?MDU5T25TenhQZkt0TG9oR1VTelM3QmNBZ214dUxGWGo3a2pmNFdQaDlMeW5H?=
 =?utf-8?B?K0RRTXcwcDVkUTdYYlU4V2wzaW9EcG8rYmpzRVAvZkxyUUhOekx2UUhUZ011?=
 =?utf-8?B?b0FwalJuZm5tTmh5Rlg1Q040SlkyT3V2UmI1Y0RESFIzUWtEeDNVM0VJMGxO?=
 =?utf-8?B?WVc4b0dBcFo1L1VuYnRldGNrMTR5MmtMeHFqSHo3ZDZCSUszUGJ4QkFzYi9I?=
 =?utf-8?B?ZGNZZTlGd04rQ1FTVmRPWFhHQWhWZHdFN0NwcUtNWlR5Sk5NMDFUMnh3RVBk?=
 =?utf-8?B?d21LK2ZvUzFDckF2c1dIOE1UaFJRcXppS0RvQlY0RkdobnN4UmIxcnRaT2N0?=
 =?utf-8?B?b2pxbC8wTEYzeHg3aHRnZmNPcFRPSUZNVzFwZVBGM1RFU2EveUpxRnE0MVRi?=
 =?utf-8?B?bTRrUUZsdVV3T2gxeHJ0cEFWcStWRmtiUlhUM25JY2dBYXBjMFpIMm4wVFVX?=
 =?utf-8?B?MTkvR3dESWpvb0Flc0tZNjdhYVRTQTFYSmU4SFlqUENCcnpObkFqMkZjYlk5?=
 =?utf-8?B?MGhGSFdXTUpTUktiR0ZwVkhZNVE1Q25XUi9EOE9MUUNNbEo1aWtCeVR5QS84?=
 =?utf-8?B?UlovbmpIdDJCV2tMcndld1B0bFhmWWxYek9pandMU1EwMHJNNnJlcmJtWW0y?=
 =?utf-8?B?UDN1M3l0bXdOeXJyUmk3QkQvWFZXQTMyZXc1bnd0S3ZQd2VmQUxsSGJ1U2lQ?=
 =?utf-8?B?SFIwcTIyYk1BaWFxUVNTSlRLR1ozVm1hY1BSemRpK2ZGSi9UakNpNndIa2tu?=
 =?utf-8?B?aWhTNmZGbU50R2VJOGJER3hvS0ZBaXJ4N0VxQVNUL2FrbjFWeG9VVnN6dGVC?=
 =?utf-8?B?VW96bFpQc3l4YzNaVjFGejA0VGVmY3FvVEROVm5SRExYazM3UjdaNzRVRita?=
 =?utf-8?B?TlpJRndkWHNhZ3B5STBOdDVGcnNaZThLYW1rcFpOa2R0dXRhTlRqb3ZKbmM4?=
 =?utf-8?B?S3hQRmYrU1RTZm44aFg4REN2YnhFSHZVc0JjUnlXNm5XOEVZL1pOekJQbEov?=
 =?utf-8?B?YUdhQ0tiekI3dlFoYitqczBzUDV1SkQySzlMUlFhQzNVZVpmek1kWGtaazI1?=
 =?utf-8?B?MGRCQTVpM0hZSU5kYW1EWU5iSGNqbHJESW54bW9FTFIzMDFXZWRKa05nN0JH?=
 =?utf-8?B?K3QyTWVsNlczKzN3aEVibjdOWEtLekpDS2pKNFFSeFJNbGhPTFJacU1PYU8r?=
 =?utf-8?B?ZFlXZUxUR0RySVM1WTFJaEFIdmFKby9zaFRza1N5dDR2NjJab2xiOEFpTjVC?=
 =?utf-8?B?UDgzOXNPenNVOHVBUEUxYU5wek82NWRCV3Juc2k0YkFYOTRESmRvNmwwTm5E?=
 =?utf-8?B?cDlOSkFmYnRraEpCVHNVaDRESHNoT1JvTElhOUFoaFg3Z1lubHB5VDFvd3NM?=
 =?utf-8?B?OVpxZ2wramZGMHdWU3AxcGdvOC9BclBUWnhIWmlONng4RWlacGRYNkVYV21C?=
 =?utf-8?B?RjlDL0VZRGJpS1hIbDdXckxLTnVraVJKcEZWdm5ZZFBKa3E1S0IvQ1lKNHlR?=
 =?utf-8?B?Z2NlOFh1SkFwb0lVUEE4U3hIclFvU0xEb2hzQUZyb2FUZ2ZhL0daOHlqZms3?=
 =?utf-8?B?VGIwRU0wTkFIVnRmY1VXNlBMalUrQi9LNitncm5NNG1JZkw2Unk1MlJhT1Fx?=
 =?utf-8?B?SjJBbWo0SURkQkRVQkk1emJYY2t3SHlSMFVGVTlMZ2FiMUNSMFhwYnpycHVx?=
 =?utf-8?B?ZExTY09LQTByRm1tbytUVEM1aGgyV0hZYWw2cGREbzJ2WVlnMGFueTdsVDBW?=
 =?utf-8?B?R3JzZFJ4eXgrekJHeUMxTTh3ZGNXZFNLdGJFQ09ob01oMUQ3c01NR0MyQ3hB?=
 =?utf-8?B?Sk56RTNVSVl2Sjd2OVVBbVN0S0hUTnl5ZHpBKzMwMGJpSENLbjdsU3FNdVNm?=
 =?utf-8?B?aElvS3RDOHhRQUNrc1d6QXFlSlNEYm9aSGo5NFM2WXI1Sjd5Y2xTL1B1VEZ5?=
 =?utf-8?Q?ABFtt/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aURkVzJmRjlCWE5LT1lEem5abTRobmljSGhUQWg2WW5MTW03R0FlQzRBL3R0?=
 =?utf-8?B?d045WjVuT0QvYUhCY1BONVhHQ3dpK1M5VS9PcG1NQUxENm1Ma3E4aXFwdTFD?=
 =?utf-8?B?NGx2dGxQa1llaW90ak1PR2xBN1N6dVpaY3hiekphRVpBdVQ0eWhMSXBVeHpa?=
 =?utf-8?B?Ty9zVGt4N1ViSjV6UEVxbTRBd29reGlDR2tCMGpTcXRBSVN1MjBtRXUzT2xa?=
 =?utf-8?B?WUxRQjFSYmsyUHlUTDlPVWZIckdjL2hNdWVOWllxWmhpYWJ5SkV2Rlh3NXJF?=
 =?utf-8?B?dFBwdGlOMERVTU5TaExTYWVEUnpJczgzMy9ycElKOS92aVZKaGd6NzlJemFL?=
 =?utf-8?B?Nkl6VTVqVU03TGFVVTZseEE2SzlXd0twOVFUVHhwZUdoWFZtOXkvVXI4Sk5V?=
 =?utf-8?B?Skt2Um9pRmtKWWdycU85T1dQTVZvc1QySEsyRUMvR0dUK2xrZUpCcXBPU0VU?=
 =?utf-8?B?WndpdHF0VjZwcTZhM1dDWlJTMnFETGowdTlJMlFyT0V6WGZndW1ZUWluOGFB?=
 =?utf-8?B?Q09xRHVSbnVqdGpxTkI4eEEvUi91WUQwVFZ1d1NaRXVreXVNWGxWWVhFcjJU?=
 =?utf-8?B?dStxY2Q1RjdqR29lc3paUlM0UmdqR3hpTTFxT1hBWXR4clVRb2xadGQ1RlRn?=
 =?utf-8?B?WFJ1THdtb24zb1E1S25qdXdscVBUQ1VRZTI2RGFXbytySzFXMnFCOE9kODBq?=
 =?utf-8?B?aDQ3M09kQklMZ1lzR1cwQkIwa2xiUnNyY1RnajBpT2NPanBzVHR2eGp2aG1x?=
 =?utf-8?B?RUx4MWpmcXp3Rk0rVjFYOVNwZW1FTVF6U3l1WGl0dStUa1VtcTBUdGVyWVpD?=
 =?utf-8?B?RFg0R3JLd3RDVlRzUlRhRzVhODIwV0VwaXVLcVIzektyaGhEZURhT2JobVhH?=
 =?utf-8?B?ckdvdGIvcyttZzYrK3NjQ3l3ZHdNSmVsZzNoWFR2cDdRTlljY0czSVQrZzU4?=
 =?utf-8?B?YzlDOVVWYlRvd09zeUgwb2JoanpHZUxpYkVPNGxuWDQyRkVHNXJFZXZDSytX?=
 =?utf-8?B?UERDczdaQlBNZy9FRmNRejhaWi80MW5pY1VENUczNVFIL2IvK3hmc28yNENh?=
 =?utf-8?B?TFYzY3VPRElPWkdaN0ZHSXhxZFhIWGNJTm5lRFRUSWp4MURDN1pFZHpucDA3?=
 =?utf-8?B?TERpVW81c0R2bHhidzFUVGxWQVFIV2JXTzJRK25DTnJGeWNKc0xFaXE3QmMz?=
 =?utf-8?B?Wi84M1JqeFFJK1dGTWVWSDNqNEs1aVh4M0grVnhJU1BJdnhnaFhXYVlYL2VJ?=
 =?utf-8?B?RFN0SmRCOVRQQWZNSnZLaEJQdno5d3VabzJKSkRJaWRwZnZWVi94ZFMvMEJI?=
 =?utf-8?B?bW1XczBFRXRsa0t3KzdaTUhSZ1RsQkhXNm5jalZyRXFWM3pDQWhZSEM3NHo3?=
 =?utf-8?B?cXpSVldaUFRoSzh0cFZRVjJWcUovZE9vQ2lSenBHOXp0T0hvY2JYTkV4dk5J?=
 =?utf-8?B?VW16T284d2lUSkRob3ZZY0IxSm5iL2s0TXpvWVBjcmg1dTVCaHJlcklIZEFV?=
 =?utf-8?B?Tk5CTG4rakNqVkRDZlgxcGZUR01JOU9FeU5PZnJ1SE0zOE5mYU9kQ1ZFS1F0?=
 =?utf-8?B?bi8vb01kUjFoT0FIYTVQN1lWZFlLdm14R09oQ1BlcU1FQ1FHYW1VS0trZWp1?=
 =?utf-8?B?VHcwM1pkbk1OTmZFUDQzNHVDQjhIa21DcWJlUmg5M2NVOFVBNUQxQW5NaU51?=
 =?utf-8?B?VlJDZmJVYkQydm4wM3p5RkNPejdsbVVSQUpqUk1Ec2J6MkdSVndwMHJQRlVk?=
 =?utf-8?B?SkE5a3RjdGs5Wkk1cjBtNjlXUko0L2g3OTRhSjUwM2E1aDJnY2x3L2dMQUFV?=
 =?utf-8?B?c0thN0d3UHBPYkNKU25yQkJoOU5NUHNDREVRNkg0SXlqVmdMdHFkU2ZqTkRI?=
 =?utf-8?B?RXNUU2ZXb2w1RG16VHl4T0tHR0VVTU5CR1g1YVNCbnM1a2dDaTRnUEpmbFcv?=
 =?utf-8?B?dGdBVE9XSHlBbVlnSG5jTlJvYTlXdXFPU2pINHZ5NkVjVk9MYXk0OUVQQVll?=
 =?utf-8?B?cWViWmlSZXZxV0dQK0QrSjRzNzV3VXpLeGQvb0FqSGFna2lMNXl5OWRiV2tX?=
 =?utf-8?B?M2MzZUptdVhTcHltaGJocUZybTRBSnhQTUJoQ3NKWk5rZTdOSU92STNwL2Fl?=
 =?utf-8?B?TWNYVWwwL1pDV3JCeGVCc2I0WGVYK3hkMzdFdEFHbGJxYVR6M3R1MVpucDRl?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D68D909310CD94898E6EAFCBA54FABD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b6c11b-50d3-44e3-02ef-08de39883fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 14:10:48.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeJTeB2bvnH1F99QVgESyiGR9SpKEoSpR6lCq6dvZaH3O/bKqR3b8xn0UkfjUP09KNDjN8wIHS4kkle/WlhF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

aTkxNSB0ZXN0L2Jsb2NrbGlzdHMgaGF2ZSBiZWVuIHJlbmFtZWQgaW4gdGhlIHB1YmxpYyBDSSwg
YW5kIHNvOg0KDQpSZXZpZXdlZC1ieTogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwu
Y29tPg0KDQpPbiBUdWUsIDIwMjUtMTItMDIgYXQgMTQ6MDMgKzAxMDAsIEthbWlsIEtvbmllY3pu
eSB3cm90ZToNCj4gUmVtb3ZlIHN5bWxpbmtzIHRvIGk5MTUgdGVzdGxpc3RzIGFuZCBibG9ja2xp
c3RzLg0KPiANCj4gQ2M6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC1wcmUtbWVyZ2UudHh0
ICAgICAgICAgICAgICAgfCAxIC0NCj4gIHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxIC0NCj4gIHRlc3RzL2ludGVsLWNpL2NoYW1lbGl1bS1v
bmx5LnRlc3RsaXN0ICAgICAgICAgICAgICAgfCAxIC0NCj4gIHRlc3RzL2ludGVsLWNpL2Zhc3Qt
ZmVlZGJhY2stY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QgfCAxIC0NCj4gIHRlc3RzL2ludGVsLWNp
L2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgICAgICAgICAgICAgICAgfCAxIC0NCj4gIHRlc3RzL2lu
dGVsLWNpL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1IC0tLS0tDQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUgMTIwMDAw
IHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC1wcmUtbWVyZ2UudHh0DQo+ICBkZWxldGUgbW9kZSAx
MjAwMDAgdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiAgZGVsZXRlIG1vZGUgMTIwMDAw
IHRlc3RzL2ludGVsLWNpL2NoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+ICBkZWxldGUgbW9kZSAx
MjAwMDAgdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50ZXN0bGlz
dA0KPiAgZGVsZXRlIG1vZGUgMTIwMDAwIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVz
dGxpc3QNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1l
cmdlLnR4dCBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC1wcmUtbWVyZ2UudHh0DQo+IGRlbGV0
ZWQgZmlsZSBtb2RlIDEyMDAwMA0KPiBpbmRleCAxMjRhMzFkYmYuLjAwMDAwMDAwMA0KPiAtLS0g
YS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdlLnR4dA0KPiArKysgL2Rldi9udWxs
DQo+IEBAIC0xICswLDAgQEANCj4gLWk5MTUuYmxvY2tsaXN0LXByZS1tZXJnZS50eHQNCj4gXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9i
bGFja2xpc3QudHh0IGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiBkZWxldGVkIGZp
bGUgbW9kZSAxMjAwMDANCj4gaW5kZXggZmZhNjU4OTI3Li4wMDAwMDAwMDANCj4gLS0tIGEvdGVz
dHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xICswLDAg
QEANCj4gLWk5MTUuYmxvY2tsaXN0LnR4dA0KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUN
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2NoYW1lbGl1bS1vbmx5LnRlc3RsaXN0IGIv
dGVzdHMvaW50ZWwtY2kvY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QNCj4gZGVsZXRlZCBmaWxlIG1v
ZGUgMTIwMDAwDQo+IGluZGV4IDM3MTVhOTQ2OS4uMDAwMDAwMDAwDQo+IC0tLSBhL3Rlc3RzL2lu
dGVsLWNpL2NoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEg
KzAsMCBAQA0KPiAtaTkxNS5jaGFtZWxpdW0tb25seS50ZXN0bGlzdA0KPiBcIE5vIG5ld2xpbmUg
YXQgZW5kIG9mIGZpbGUNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJh
Y2stY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNr
LWNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEyMDAwMA0KPiBp
bmRleCA0NGQ4M2YzNjYuLjAwMDAwMDAwMA0KPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZl
ZWRiYWNrLWNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEg
KzAsMCBAQA0KPiAtaTkxNS5mYXN0LWZlZWRiYWNrLWNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+
IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwt
Y2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2su
dGVzdGxpc3QNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTIwMDAwDQo+IGluZGV4IDg4ZTlkODBlMC4u
MDAwMDAwMDAwDQo+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QN
Cj4gKysrIC9kZXYvbnVsbA0KPiBAQCAtMSArMCwwIEBADQo+IC1pOTE1LmZhc3QtZmVlZGJhY2su
dGVzdGxpc3QNCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC1jaS9tZXNvbi5idWlsZCBiL3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxkDQo+
IGluZGV4IDBjM2I3OWQ1MS4uOWIxMmE4YjliIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC1j
aS9tZXNvbi5idWlsZA0KPiArKysgYi90ZXN0cy9pbnRlbC1jaS9tZXNvbi5idWlsZA0KPiBAQCAt
MiwxMSArMiw2IEBADQo+ICANCj4gIGludGVsY2lfZmlsZXMgPSBbDQo+ICAgICdSRUFETUUnLA0K
PiAtICAnYmxhY2tsaXN0LnR4dCcsDQo+IC0gICdibGFja2xpc3QtcHJlLW1lcmdlLnR4dCcsDQo+
IC0gICdjaGFtZWxpdW0tb25seS50ZXN0bGlzdCcsDQo+IC0gICdmYXN0LWZlZWRiYWNrLnRlc3Rs
aXN0JywNCj4gLSAgJ2Zhc3QtZmVlZGJhY2stY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QnLA0KPiAg
ICAnaTkxNS5ibG9ja2xpc3QudHh0JywNCj4gICAgJ2k5MTUuYmxvY2tsaXN0LXByZS1tZXJnZS50
eHQnLA0KPiAgICAnaTkxNS5jaGFtZWxpdW0tb25seS50ZXN0bGlzdCcsDQo=
