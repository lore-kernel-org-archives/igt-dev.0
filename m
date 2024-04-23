Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187ADC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9D310F9F0;
	Tue, 23 Apr 2024 08:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4mOJ0Ya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6F510F9F0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713860971; x=1745396971;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+hhu0nmbmKP3o6LbPFPDBriUP0qMOyTWb28sIl4FCxk=;
 b=B4mOJ0Yax3Uf4SqrZGIW/AaPyIGic0Os/WqN61+Dp5F6zYkl+EcpspYu
 YLtVynMqs8FJ1JBKRWNPRIJfsR1Smh256jWXYVlDLgcI/ZgSu0HLQGLY6
 YqYpOXzC2xSjVMZwz1tcqi4UcXGWg9PDKZibV/vElxw6TYZqlkGUnUtiV
 hMOGwFv6yAF98ND/tSc8JHYTGCBejZbpws5ln7sip/sRDL4XlfeNmtACe
 oTEz5ecp8uRjIWG5DDmdY8L//9yksZY0Ou5nQGk2rp0oucTqSaKk4TXj/
 2/XnU2JVKvDgvFqlD6E8lPFyMYYCW1qgxtYl1Ftb9cNSQk8lZgDMujsUA Q==;
X-CSE-ConnectionGUID: J+VQBwmxSKKbY3AM5Cipww==
X-CSE-MsgGUID: debP2eDpR42vs5dH9tkBfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="12366562"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="12366562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:29:30 -0700
X-CSE-ConnectionGUID: lSRpCDyQQCOtiqb+NfIB9A==
X-CSE-MsgGUID: Jo+/wFxdTKSdFbOClM55vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24354909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 01:29:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:29:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:29:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 01:29:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 01:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0TUC0xO6pfC7tQxB/ly0z9Ux511NutMKP+11n1wCnoEd9UwC0qEgdZWUBCqhwFzT6dYQHsVa8Y3sJkAbjZJnwPkWhB+BgjBGTzSktu6bteBhoZ3KWp5qJ4D9skHftRYQrhLGAie1h7H1IDfHgyAhw+qkO8oJn/x+laPk4qKuw2d3xqnlWH1AuhP16HMHwiAX1ZJK67DdMNgK71iaO8NzejLNBFoY2+UAU77yUQQZRy9JStNlwaF30H3zPN2kw3pv+ehOPDcs0mo3DIwnXzhzcoogha/BqtU+zQNzl4JukPoX3x3QqT12O48oMBQb3j9t9G4tVfZ02a22qfNqj2W6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hhu0nmbmKP3o6LbPFPDBriUP0qMOyTWb28sIl4FCxk=;
 b=FqRV0s7UVE00OcldbRP/dOiCpxd0wW7j5yW0h0Ox8xvjzsXRf66yZxYxHDxr3auX3kzk10ZY4WWykOsbvm0kD4JzbfTFayDynlMu2keLfBLMrLj7DLE7Gq541J0Ppa1r5WCud6A/8BBp9ilv6uSUYh8enJ1U0ZiVS6hvG9zdc0cfpChIj51KxsUmkfxzR/hi6wlTbxobQ0dDiRKlRkxqXK8XBQSkz+oAqMR3wkmaYVPUrJaPR1hxGrOE6fOWaHaD7141I66vu9vUsH+KsOLJpiRZen1v2c0LGfzd4JfZ9fIwnKxJZBT+MBA+adJHkfHHWNGflCvMUeQC8nnwzM2roQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 08:29:26 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::1124:dd10:9706:3784%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 08:29:26 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/rendercopy: Fix horizontal stride
Thread-Topic: [PATCH i-g-t 1/2] lib/rendercopy: Fix horizontal stride
Thread-Index: AQHalUyRh/2SgvQtjEWeqT/OgFn6ULF1hhgA
Date: Tue, 23 Apr 2024 08:29:26 +0000
Message-ID: <8f2f60ba238d546c5ac12f7cecf5e4893ca720e6.camel@intel.com>
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
 <20240423070449.150518-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240423070449.150518-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: e5b491ee-049e-47af-c70a-08dc636f7cbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VmZ6WHkyOVRrSjFicE51cEhTbHMvREVycml5L3cvV1ZYcjNrNTFlc1g0eDlu?=
 =?utf-8?B?UWdEaVBUSUxIL1BybFpnUWhZaHFtb3FHbDV4MS9PMTFIZzNMNEZaU2s1dUpZ?=
 =?utf-8?B?UnBIaVU0Z0EyNU9iL0NrT0NXSXk3VTEyU0JlR1VJMm43cXJXcVAzcEdrUjVQ?=
 =?utf-8?B?Kyt6QW9UUEQ0YWhra0NNR2pOZmJRL2V2K0x2bVhYWEUyclhjc0JuR1lscnV6?=
 =?utf-8?B?ZnpIT0RZYnBTdkdTSVhUbUEzN1UrLy9FNC85Vks0UVU2RGcwNTM1R24rSVQz?=
 =?utf-8?B?VFJoZ3hYN1ZBdTYwVkNSYkZKb0kxV2NNeUlpMXFSUXhaTXhHWi9kdHJMRjk3?=
 =?utf-8?B?NVF3b2Z0M2dLYXN4ampQTnh4T2xybk4zc08xdkxqUkk2UXpVV1lCeVR3OCtC?=
 =?utf-8?B?TnZwUGNmN0N6UGhqUGoyZjdzcmVlVDVuY3BpeFloU0lTdUNiRUFuS3cxbkhw?=
 =?utf-8?B?OWU0bER4VGUrU200SVNIWkltVTRzbUtyQy9PZmJkeWhhMGh2NEtJb0UyMTU4?=
 =?utf-8?B?bktLNkZlQlFWYXpCYWliY3VrUHVLRHloaW1STTFhWjRYN05CcFUzaDdvanlU?=
 =?utf-8?B?V25lamQ2WS92aWYvdDV5UVBSeXdLLzJ2dVczb0pLM0F1L1E0Q3pqR3VNOVoz?=
 =?utf-8?B?RFR3ZkZncmNWcVZ1eUZKeTdoaHE0R1hhTUZlR1BldnBuU3JQSkRRdXRrY1B4?=
 =?utf-8?B?bGhIb0UxU212NUg1Nit2YkRNMUdIUlY2dFVzT25aWFl0M0FpWkVzVmdPS1Q0?=
 =?utf-8?B?VmMwS09GMGRpNTR3TkJTRXNSTkwzN1BkWUlOWVVYbVpkTkZxenZJMjZKTVox?=
 =?utf-8?B?ZEtIU1ZlK2FGa1RUM3VjMG1PSS91REE3RzJoaURRcjNvbFUvL09tUnNlLzlP?=
 =?utf-8?B?bk1kcy93WU5PckZiTjMxN0U1M2VZOVYvNWlNbENpOW5yUk55RHR0eHYvTk8y?=
 =?utf-8?B?YXBRUHNrWDNHaml0NERSSEF4aHdkS1ovSzY5cVVYTVBRdFBZVmpoYkFUUW1F?=
 =?utf-8?B?WExERmZ1blZ4eFhuRWIzZ2tmcXEySjh1bWhWZlUwUUswNE1KSjkydlE5eVFj?=
 =?utf-8?B?YVpVMjhGeTVNSW1vYVNrc2F5ZnY4Q3RwUSs5UlZGV2ZPbFBOU2xtakZBWjIr?=
 =?utf-8?B?UzJYOFJncVlRSjBWMUh0dWRIbUw1bWtDV0huQnBXVitvVzRmdncyNzgvTmh5?=
 =?utf-8?B?SnlrSWd6N0lsMUtwazJDbXExSE1rL2pKSUREQVZJdHZncCtsTEZDKzBQNE9s?=
 =?utf-8?B?RWl0cE56RE8zUEw1ckh3Z1dUWXBaRkJiOFV5MzhsUmJwYk5GbXJvUGJTOFor?=
 =?utf-8?B?RmxISVVYWkcrcS9LM0xTcFo0bEN3N2xGK2VHcGQ5bEk2aHlZSXBQQ0FSaGE1?=
 =?utf-8?B?UmxDK2FWVHczcXpyMmV5Q2JFM2VXa1hoakdPaVRUNmdGRHBUakZObjhqRXdI?=
 =?utf-8?B?cEROdFpQbVUzSTc5NGZVQ2h3RWRGUmxVdlVrMnAxUzlVeVp1YURxRnUwb2xm?=
 =?utf-8?B?SXZxUDFZSW80MHlqalM1SFRoS2JmTXlISVA5WERWQlBaVlBDMkNCbDcxQU40?=
 =?utf-8?B?Wm5lZGFZeEQ3RHB5bEZGL1ExQ01uN3FKNFhuR2p5ZjdSMXkzTFg0VC9pclo1?=
 =?utf-8?B?dmdHNVZrclNRMmJsa1ZWTlZIQUZvRTNOSEpQMmlXMlZ2K0NVb3pHSU9RVEdQ?=
 =?utf-8?B?Z0VRZmV6SkFuMEl3UkY5VVBtT2MvOFB5blZhNHVlcjJEOEFsQ3FyU2ZZQWVX?=
 =?utf-8?B?S2l5ZUJxMjVwSW1kcXBmRWUxcGhXenZKRnY5NlFkZU5DOER6WVlldnk3U25J?=
 =?utf-8?B?Yjlla1d4NG96K0xkc2s4UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlgvdGRxRk9QUDFYUTZuZFRLempLcm5pYzlLcGRrNm5TbUhyTFdoWHBSaXhX?=
 =?utf-8?B?T2RQMGh5dk9oZ3JHNG5ORWRuV1lqWjJkaVNYTERCZy9CY0wwKzhaQWt4VUlm?=
 =?utf-8?B?bGVkeTMxMUpDaTRmenlXUGJVZVZOeWRhblhGS2FvUTNjeTJrOUU1Y25sY0p6?=
 =?utf-8?B?dHY1Q3RkMVNjZ2srOU9XRDhEemdqNVlUQlQ5K2poeFVHWERSYkh6RXlsTmxK?=
 =?utf-8?B?RHZXN3RQVEhLaXZPSEpVVjVjaDU0ZEpKa1E0N0VtT0NGMDUxTzNYWUs5M0hS?=
 =?utf-8?B?VURQODlVcS8zM3JCUHM3L0I3Sy9qeXFucmdGQjVZRXI2cnhFd3h2YXR2djUv?=
 =?utf-8?B?aEdMOUlmZjFabmUwek5UU1ZMT0NBVnZPZ1grdW00dStYNWhaemZQYm1Ma0c4?=
 =?utf-8?B?VXV2ZWh1WWxEZ3NaaFRkc24zbEczd29nTmdpUEhIWjFRMHppWjMwVEpRRHZC?=
 =?utf-8?B?Q0ZnZHBIZmJwK2diQjJXaWNwYWJrUmNOVUhsb25TaHVaVFhaZjZsSEhVS2Vs?=
 =?utf-8?B?cEhabmh0ZXFZbU44OTAzbWl6OEhLbGt2UmNmQVd0RlI4UEg1RnVVNTdvNHBC?=
 =?utf-8?B?STRQWUhwYjhmRS9rYXQ2VGgvVFBvK2p0TEFTVDJUVW1uSzRKQWtReXFkRXlN?=
 =?utf-8?B?eVFrL0djM1lHV1BEQUpMQXplcnB5Um83WUpMZzAvWXY4Wlppdnh2YmFFWnZv?=
 =?utf-8?B?SFc5ckxDS1ZyMEdURkgxLzBhbGtGV0NBUU1wazdzTDRicHNxUk5wYi9SL3la?=
 =?utf-8?B?T1dTQnBrZHpUVTZHWFNmWGVWVU1UZ1I5UjhKOGkrU1ZIZTB6Sm9DMnFnYUxG?=
 =?utf-8?B?enBCMDltMGU5OXZLK1NPSFBrVWIzT25BVU10S1lvWXVMaGxCd201QWtnQWxm?=
 =?utf-8?B?TEQvY2lXUDJ0Z0xQSUp2dUpJY0JCVjlHbk9kRXY5RXJxeFhXK2UvUWFRa1VC?=
 =?utf-8?B?RnBEbmtmMnNORE44VHFmSkhZRFJac0UrRVRzKzN6czluY2dSb2h2eGFYME1N?=
 =?utf-8?B?c0JlcWl4enlKRW5rblNxaEQ5dGdWTmVEVW40dXVZaWdiN09kUWVUUUVjR2lz?=
 =?utf-8?B?cmh1cFZBVlRMdm1rWENPeUdtRVZUd0Z4b2ozdnNFT3lYRXNtRFlSdVlUcnRL?=
 =?utf-8?B?UDJwdHRoUWU2YTdaNXRHWGY3ODd0WDZobTlCTEk5b3lNR0RCUFExL2R2eVlK?=
 =?utf-8?B?Tlp3Sm9IWEl2Wi96VDNPZDFxY1UvTDNTVFo1TlFQam9nWmlXWm9nYzhUNUw2?=
 =?utf-8?B?S2FPMWdmNHR0TkdOUXljYjhNNW9ZbFBrTUJtY1ppaHpvNnVNcDVaVFUzd0tZ?=
 =?utf-8?B?TkM4elBsWUxuWVBqVkVOU24yeUpDbVRaa3ZoSk5VSHptVnpMUDJEQ2hNVEp4?=
 =?utf-8?B?NXA5S0hFVWJCbUkvbVdFTi95RWloa1A4d1RvRnloR09saytYWVRIVnhlOThZ?=
 =?utf-8?B?cFlDUW5CblpKNDhVMzluaFQvY2ZCaHFBTjVkSmVjMHJZNk10RVZIL2dCbDl4?=
 =?utf-8?B?YU4xQ0U3Mzl3WG05THR1SkVnU280ZGY2YzM4NnpmeFRXbHhWZGNucWVLVlV1?=
 =?utf-8?B?REtQYnhmeUl3U3ozb3ptR0FQd1FzcE9BbndSU0t0a3p6Wlc1Sk9NcGdXS0FQ?=
 =?utf-8?B?aVVrSFdEUi85VXFjZ0tMTzhqZ1J2OU44ZVFUZjFqUG4vZGttOWpnRTI1SmRr?=
 =?utf-8?B?LzN6c09VOFhCV2xBSEVJQU9Eb1l3SForQVZxOGNUYTZtS1dDYUJ4eVd1Wk9r?=
 =?utf-8?B?WFBoQ29oL1QvZ25BMExqdmVoT3ZaeW9XN1ZMSzM2ZEtmMUI1RDVDZER3Uytz?=
 =?utf-8?B?NG5sVmFnRWhJOUVjMnRweThpS0ZJM3dNOThrcjNGYkU5WUtBZFNEZkJKNjhG?=
 =?utf-8?B?UEpYcmtQWjZuNG1UUTY1QVM3VXFDbk9GSjlRUDZYMVNRV1UyMkRpL2ZEUzJs?=
 =?utf-8?B?K3RVcSsxa0VDZEh5Qy9sWm5wMWtWM0NZMUtaQy9VazdWTkJ2VlFSU1B1cno1?=
 =?utf-8?B?bUZ2RjBwVFZtSk0vSWZWU0RKZ2dlbVU1OVR3SDRWdWlMWTdKcFpCeXZHamRJ?=
 =?utf-8?B?K0thRjczK3NjRWMwaGZUT3RUUXZoRVgwamRWM3I3SDllbjAvQVFhVFpuY2lw?=
 =?utf-8?B?bjhJMGIzUHRrVmNKZEh5UERnVkUrYm1EQlpHeU9iRHB0SDNLb015UldpVFI1?=
 =?utf-8?Q?TsFWVfS/s4BI6eBKgKU7TfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D8344B9B54EC244AC758C6EAB2945F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b491ee-049e-47af-c70a-08dc636f7cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 08:29:26.4955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZIN7wC8iz9w6dcHyNnFoK1VAgeeyGeMV3nVB4YVBDEv+1YONKq5Pq6Lnf4i5vn0sZjsl6Q7U2Ab8341ziktgiymtAvVTUxYENXPw2QC02g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

SW5kZWVkIHRoZXJlIGlzIHN1Y2ggcmVzdHJpY3Rpb24gaW4gYnNwZWMuIEluZGVlZCB0aGUgY2hh
bmdlIHlvdSBkaWQgY2hhbmdlcyB0aGUgc3RyaWRlOg0KDQp+IGlnYTY0IC1wPTIgLVhpZnMgIm1h
ZCAoMTZ8TTApICAgICAgICAgICAgICBhY2MwLjA8MT46ZiAgIHI2LjA8MDswPjpmICAgICAgcjEu
MDwxOzE+OmYgICAgICANCnI2LjY8MD46ZiINCgkuLi4NCiAgICAgICAgU3JjMS5SZ25IeiAgICAg
ICAgICAgICAgWzk3Ojk2XSAgICgyKSAgICAgICAgICAgIDB4MCAgICAgICAgICAgICAgICA8Kjsw
Pg0KDQp+IGlnYTY0IC1wPTIgLVhpZnMgIm1hZCAoMTZ8TTApICAgICAgICAgICAgICBhY2MwLjA8
MT46ZiAgIHI2LjA8MDswPjpmICAgICAgcjEuMDwxOzA+OmYgICAgICANCnI2LjY8MD46ZiINCgku
Li4NCglTcmMxLlJnbkh6ICAgICAgICAgICAgICBbOTc6OTZdICAgKDIpICAgICAgICAgICAgMHgx
ICAgICAgICAgICAgICAgIDwqOzE+DQoNClNvIGl0IGlzOg0KUmV2aWV3ZWQtYnk6IERvbWluaWsg
R3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCg0KT24gVHVlLCAyMDI0
LTA0LTIzIGF0IDA5OjA0ICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3JvdGU6DQo+IEFj
Y29yZGluZyB0byByZWdpb25pbmcgc3BlYyBob3Jpem9udGFsIHN0cmlkZSBtdXN0IGJlIDAuIFRo
ZXJlJ3MNCj4gbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gcmVuZGVyLWNvcHkgZXhlY3V0aW9uIG9u
IGhhcmR3YXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsg
PGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2k5MTUvc2hhZGVy
cy9wcy9nZW4yMF9yZW5kZXJfY29weS5hc20gfCA4ICsrKystLS0tDQo+ICBsaWIvcmVuZGVyY29w
eV9nZW45LmMgICAgICAgICAgICAgICAgICAgICB8IDggKysrKy0tLS0NCj4gIDIgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2xpYi9pOTE1L3NoYWRlcnMvcHMvZ2VuMjBfcmVuZGVyX2NvcHkuYXNtIGIvbGliL2k5MTUvc2hh
ZGVycy9wcy9nZW4yMF9yZW5kZXJfY29weS5hc20NCj4gaW5kZXggNDgwNTdmNDQxZS4uYzRlMTJh
MzY4NyAxMDA2NDQNCj4gLS0tIGEvbGliL2k5MTUvc2hhZGVycy9wcy9nZW4yMF9yZW5kZXJfY29w
eS5hc20NCj4gKysrIGIvbGliL2k5MTUvc2hhZGVycy9wcy9nZW4yMF9yZW5kZXJfY29weS5hc20N
Cj4gQEAgLTEsOCArMSw4IEBADQo+ICBMMDoNCj4gLShXKSAgICAgbWFkICgxNnxNMCkgICAgICAg
ICAgICAgIGFjYzAuMDwxPjpmICAgcjYuMDwwOzA+OmYgICAgICByMS4wPDE7MT46ZiAgICAgICBy
Ni42PDA+OmYNCj4gLShXKSAgICAgbWFkICgxNnxNMCkgICAgICAgICAgICAgIHIxMTMuMDwxPjpm
ICAgYWNjMC4wPDE7MT46ZiAgICByMS4wPDE7MT46ZiAgICAgICByNi4xPDA+OmYNCj4gLShXKSAg
ICAgbWFkICgxNnxNMCkgICAgICAgICAgICAgIGFjYzAuMDwxPjpmICAgcjYuMzwwOzA+OmYgICAg
ICByMS4wPDE7MT46ZiAgICAgICByNi40PDA+OmYNCj4gLShXKSAgICAgbWFkICgxNnxNMCkgICAg
ICAgICAgICAgIHIxMTQuMDwxPjpmICAgYWNjMC4wPDE7MT46ZiAgICByMi4wPDE7MT46ZiAgICAg
ICByNi41PDA+OmYNCj4gKyhXKSAgICAgbWFkICgxNnxNMCkgICAgICAgICAgICAgIGFjYzAuMDwx
PjpmICAgcjYuMDwwOzA+OmYgICAgICByMS4wPDE7MD46ZiAgICAgICByNi42PDA+OmYNCj4gKyhX
KSAgICAgbWFkICgxNnxNMCkgICAgICAgICAgICAgIHIxMTMuMDwxPjpmICAgYWNjMC4wPDE7MD46
ZiAgICByMS4wPDE7MD46ZiAgICAgICByNi4xPDA+OmYNCj4gKyhXKSAgICAgbWFkICgxNnxNMCkg
ICAgICAgICAgICAgIGFjYzAuMDwxPjpmICAgcjYuMzwwOzA+OmYgICAgICByMS4wPDE7MD46ZiAg
ICAgICByNi40PDA+OmYNCj4gKyhXKSAgICAgbWFkICgxNnxNMCkgICAgICAgICAgICAgIHIxMTQu
MDwxPjpmICAgYWNjMC4wPDE7MD46ZiAgICByMi4wPDE7MD46ZiAgICAgICByNi41PDA+OmYNCj4g
IChXKSAgICAgc2VuZC5zbXBsICgxNnxNMCkgICAgICAgIHIxMiAgICAgIHIxMTMgIG51bGw6MCAg
MHgwICAgICAgICAgICAgMHgwNDQyMDAwMSAgICAgICAgICAge0ZAMSwkMH0gLy8gd3I6MiswLCBy
ZDo0OyBzaW1kMTYgc2FtcGxlOnUrdityK2FpK21sb2QgdXNpbmcgc2FtcGxlciBpbmRleCAwDQo+
ICAoVykgICAgIHNlbmQucmMgKDE2fE0wKSAgICAgICAgICBudWxsICAgICByMTIgICBudWxsOjAg
IDB4MCAgICAgICAgICAgIDB4MDgwMzE0MDAgICAgICAgICAgIHtFT1QsJDB9IC8vIHdyOjQrMCwg
cmQ6MDsgZnVsbC1wcmVjaXNpb24gcmVuZGVyIHRhcmdldCB3cml0ZSBTSU1EMTY7IGxhc3QgcmVu
ZGVyIHRhcmdldCB0byBzdXJmYWNlIDANCj4gIEw5NjoNCj4gZGlmZiAtLWdpdCBhL2xpYi9yZW5k
ZXJjb3B5X2dlbjkuYyBiL2xpYi9yZW5kZXJjb3B5X2dlbjkuYw0KPiBpbmRleCAzOTJkNjg2NTNi
Li43Yzc1NjNkNTBjIDEwMDY0NA0KPiAtLS0gYS9saWIvcmVuZGVyY29weV9nZW45LmMNCj4gKysr
IGIvbGliL3JlbmRlcmNvcHlfZ2VuOS5jDQo+IEBAIC0xMzgsMTAgKzEzOCwxMCBAQCBzdGF0aWMg
Y29uc3QgdWludDMyX3QgZ2VuMTJwNzFfcmVuZGVyX2NvcHlbXVs0XSA9IHsNCj4gIH07DQo+ICAN
Cj4gIHN0YXRpYyBjb25zdCB1aW50MzJfdCB4ZTJfcmVuZGVyX2NvcHlbXVs0XSA9IHsNCj4gLQl7
IDB4ODAxMDAwNWIsIDB4MjAwMDAyYTAsIDB4MDIwYTA2MDQsIDB4MDY2NDAxMDUgfSwNCj4gLQl7
IDB4ODAxMDAwNWIsIDB4NzEwNDAyYTgsIDB4MDIwYTIwMDEsIDB4MDYxNDAxMDUgfSwNCj4gLQl7
IDB4ODAxMDAwNWIsIDB4MjAwMDAyYTAsIDB4MDIwYTA2MzQsIDB4MDY0NDAxMDUgfSwNCj4gLQl7
IDB4ODAxMDAwNWIsIDB4NzIwNDAyYTgsIDB4MDIwYTIwMDEsIDB4MDY1NDAyMDUgfSwNCj4gKwl7
IDB4ODAxMDAwNWIsIDB4MjAwMDAyYTAsIDB4MDIwYTA2MDQsIDB4MDY2NDAxMDQgfSwNCj4gKwl7
IDB4ODAxMDAwNWIsIDB4NzEwNDAyYTgsIDB4MDIwYTIwMDAsIDB4MDYxNDAxMDQgfSwNCj4gKwl7
IDB4ODAxMDAwNWIsIDB4MjAwMDAyYTAsIDB4MDIwYTA2MzQsIDB4MDY0NDAxMDQgfSwNCj4gKwl7
IDB4ODAxMDAwNWIsIDB4NzIwNDAyYTgsIDB4MDIwYTIwMDAsIDB4MDY1NDAyMDQgfSwNCj4gIAl7
IDB4ODAxMjIwMzEsIDB4MGMyNDAwMDAsIDB4MjAwMjcxMTQsIDB4MDA4MDAwMDAgfSwNCj4gIAl7
IDB4ODAxMGMwMzEsIDB4MDAwMDAwMDQsIDB4NTgwMDBjMjQsIDB4MDBjNDAwMDAgfSwNCj4gIH07
DQoNCg==
