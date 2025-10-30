Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F55CCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 20:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7865510EA34;
	Thu, 30 Oct 2025 20:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOReqM24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F393110EA3D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761857490; x=1793393490;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Ac8EKXfUn9MYLCxmmj/fIHRztqlBtW13bE6CGJFbtBE=;
 b=iOReqM24nf9Zx2bPRSW5DB+P+D/ns9OkDnAD+T2KTlLFUlkbmGCWaiiC
 3XRdrAvp0uM1wle9iupsApatRdkgdppKGMvc7Db7avDb8q9w15OLzhYs9
 hRiPbAbq41r3JqrsrAvm4m5zDFl5ZTtPiysnLZn45TX7EVqj45dubgjwC
 X9Gp1RP92VCpc7G2zzy0OSZ+qnDLPE7/Tv1B9yrWYtdYbNm3HMfIx0R4q
 dPJurFCeNwuDHDqqaH39OuUdoqJp6ykJwKGTL1/bj8JqBMWZgDFJVn/xw
 4Vm5qhv02rW07L4N34T7XrAYVA1FrVXWKRUEKs7WBKCG9ruw3mYzpz2Ce g==;
X-CSE-ConnectionGUID: 8RwdlSyASBOG/eaba3XVeQ==
X-CSE-MsgGUID: RUOtDaqxTsSxUHtng1n00Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75361602"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75361602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:51:29 -0700
X-CSE-ConnectionGUID: a80HazbuRaOEh4JhENrvIQ==
X-CSE-MsgGUID: w0h+6MzHRxCxS8KZQuGXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185715605"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:51:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:51:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:51:28 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR+9AmWjItQN+LARELLXT0ZNi3RviNRaaRT2iKSq4SV1kYsD6RsunNEm7oStQKPv13h4Tl67jY2ynPDQCAFjKdlrUiM84luiUrIqvF5IFvqabZfxyCY5L5OoE7gbuGVSzKfxmZ4TD69b6F2OOE6Dn76fZ97VUts2hxpz08AoTHxOpZL/h9J6eA0e0VjnLAzHnbSqEXAKTEY31xaccM75WmCGd1KR7gHvGrCRR9tkfzzSLyX+ZcnOJEULPUy/4lNcWc1Eh3lDzY5zlQugMqWpvEH69S/Vjlpgfj1M6LbU8nF5jPKx35iconCy+d+qJha0C+ge7IVbzjqdc0MDQbZNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac8EKXfUn9MYLCxmmj/fIHRztqlBtW13bE6CGJFbtBE=;
 b=lPxSL21tijoQpvZnAFWlILvU1nF+pqf2PTUNkDlGA845UgNnEegwezJ+pssSRA2+5vdKNW88Z4B/f5T9Jr+96r716y3V640hraPuR9J729uXtnn26IGkk9I7fNo6dD0cemLG9ERoVlcNxx/7lg++7T6O+L3N2RoyOMYSx7FYk5p/sGhCIaOZQnssFAbSjqQdVtx+KM8ViebcYmuRLLntOO24iC3WS8v6ZouhQTogbVb2x4K8lJ7NC8TKVSawHIBYrEQn0cNtUNE5mCdQ1RmpkFdNVL48STSntczm6H0Tp9Qm7BIrPU4oDZVa95+7YLmS4EB1wMTAMDth8PZoyyuAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:51:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:51:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Topic: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Index: AQHcQhcatR0K/TlKU0+H4wlIwGnBo7TbObkA
Date: Thu, 30 Oct 2025 20:51:26 +0000
Message-ID: <6636a57ddbc6cd74848b3dfac6ecc1576f0a65a6.camel@intel.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
In-Reply-To: <20251020231253.138842-3-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4528:EE_
x-ms-office365-filtering-correlation-id: a2d34d2e-a3b1-414e-4ea9-08de17f61825
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZTl1cVlVMnRtcG9DbE8ram9XQk1VTWYxVDVZL0dBMTltZlJqRnRQQzlHUGhS?=
 =?utf-8?B?L0N4ajAwRy9sdmFUNEgxSVZoZVpmT1ZWOFJkd0cxaEhYL056Nm1VS04vZGFC?=
 =?utf-8?B?YWdNdTBQV3M3R1BSaXhTSlVMSTFCamJPQUdJRXZQQTJ3alNFTGpncXNyUmNO?=
 =?utf-8?B?T1ExNEp6YVZtK1l6V3h2VUx6UkUwcHMrN0hvWCt0a3dDSHJETjVVWEhsK3Rl?=
 =?utf-8?B?UklrQjU2WmhVU1lFL3RLU0Y0c05NMlpHUWowUUljSFBwdGFrMWNjWEpGZ2RX?=
 =?utf-8?B?SENwQ3NIS01Mcmo5NXU2Y0VaN3Ftc1ZyRCtJTWJHeWI4cm9vL0Zobkg5MW1L?=
 =?utf-8?B?ZVY4bmFYaThEdEkxN3hWdWxmbC9qT0hmZ2VhMGFnTnIvdngzN3Yxb05wbjE5?=
 =?utf-8?B?T25kaHJCbFNVeXZaeGJOc1l4S0drZERUTjBGVjcxaG9lRDF6cjFlaGs4Lzd0?=
 =?utf-8?B?a2FoT0VJNVV4VTdHcVpCZzB2eCt2elBhSTlsd1NxdUptMkRGRjNpSVpodldp?=
 =?utf-8?B?K0tIeElqWURXYlFXYTNvbGpSK3ZHcWpoOHJ6VThmWFRzNnMrV2V6Y1E1bDhy?=
 =?utf-8?B?WGIwRXhuODJoRS9mVmdvVk11T0FxSGpGOU5RZFJTRHdGVHR4TEVzc2JjOG5W?=
 =?utf-8?B?bFRpTURZRlovRFEvWW9RR0JjQ2RnbllScWp6QVQxV2laZU1wU1VObk1TTjh0?=
 =?utf-8?B?aVpNQmNEVkVKWEhzRHNEa2l5Ym5YbkNpeDQrZEZJT04yUkVWYm43N2VtRE9P?=
 =?utf-8?B?LytGZXB1aGFMWlV5TlQvMzNObVpBeWlpSGk0NWdyeGg4RkJNTzI4Vms2aHo1?=
 =?utf-8?B?c1JmbGU4Tk5oQm5VNzJmOWNoemdJMDRSV1l6Tk9JU2kzeFpNMjRTZjBGNHlq?=
 =?utf-8?B?UzEwdzhwRi9vdGR3S25pTGxyK1YvYmZrUlBFRjZOclJFRjRsMGRsR0I5RlBh?=
 =?utf-8?B?eTdjcS9wNTNKelVtNmhQM2d5RXFLbGZCaUVRcERGbVI3WTZUaENTZDR2SDdQ?=
 =?utf-8?B?SE9ZMmplaFgyamM1TytCM1h4am8zanRYVVFVWk8zNzN4QllDVzdPc1Ywd0Nt?=
 =?utf-8?B?WVZla0cvRnZtWGhOSVkxL3o1cW9jM2F3MG43elBCWTdBeDFidnI0Vk10REZP?=
 =?utf-8?B?QnVNeWJNanozOC8ya05UM05hcGx2UllBNDhOS0JWMFh3M21OTnNzMVI4N3N3?=
 =?utf-8?B?c042emgwZ2dGYjJpYkkzUzhSOTlrRG5EMU9pdDk3bEFBbi8rQlRRd2xaNklu?=
 =?utf-8?B?UENOL3pEQnpyaHppZjA1TnRPSVFGTTQzNzc5YVg2T3YxNExqWHpjL20xM1kx?=
 =?utf-8?B?a2owQTlrZXd5Z2Exc1drMnByK0Z0SGk4cnZ0dmREUDg1MFVkOWlIcC81a2Zw?=
 =?utf-8?B?a1FOSUNIaFJKT0RIRnozK05kUXI2WTZLamhuU1ExZFFIZmRZYXlBa0x2ejdh?=
 =?utf-8?B?ZHc1ZHhMN0V0TTZIY3VjUmpJU0VVTFRXVXdLNXlvSmloV0h4M3JyUGdMaER1?=
 =?utf-8?B?NHAwNERZRFlSdkNocElqUjUvT0VIN3p5RGF6Y00zUWpEQlpNZkZMSHFRT2NK?=
 =?utf-8?B?bklSanZaMTVtNWJPTUZvVVJpQXRxT3pwNmpjNlpncnd1bm9sWkh2dUpHbGtD?=
 =?utf-8?B?MTZZV0pNRjlqVndSY1RRczB4Z1N2QVRLdk54Q24veC9MM0VqcFdPbFJ5YXk3?=
 =?utf-8?B?N044dVdQMFBRMGZoYnFIOG1YeEd1aU9jZlNDVExNSUdXMFFaNnBnOXg5aTVW?=
 =?utf-8?B?dFZPbXlmbzFXcGl3WUw5cGxqSExoN3pIN0QrZDcybHhvS29leDU2K2dLVXNx?=
 =?utf-8?B?K2h2ZmNYbDdCTy9KTklNTEIxUHJzcjA4VlRnVFZSVGVCemYrNkdXNTU2RWt1?=
 =?utf-8?B?YzQzbkVydUdWc3N0cHYxVHU0TFhTRjRnSGZ1Sm1RVmJsK2d1NC9hNWdnT0lw?=
 =?utf-8?B?MVhqdjIrekd6TG0zUndlc3JLeWpZMWR4am9KZWs2VW5Va2Y4cGpGalY1Rnpx?=
 =?utf-8?B?Q0g3MEhQRXJtV3BJQWh5bDhKWTFMQk1hdVZjU3EzMmpTMDl2NzJjUDZlRFNs?=
 =?utf-8?Q?VHODUt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEptYkxZdkRRblA4bWMxVnlSRWFUSXp3dHFHMEZ1am44bzdJQVZ0VDJueUZ5?=
 =?utf-8?B?WGF3K0FmOHhXb1dRUExRVGcwWFllK1dQNnZCbWM5d1dIRlBaVHkyeU1ka01E?=
 =?utf-8?B?cVFQQXBZcjdHSDROckpCZXZrVEovQ2Nwa00rT0pia0FGVTZoQVNDRGVnN1FE?=
 =?utf-8?B?d3BSY0JsTmZNWmxVaFdMTUxoTlhzcVRFMUorMTM2bHkwWGZ1WU03dVBCcklw?=
 =?utf-8?B?OVBWSzZna0tvdVJrcGd5K1RXT3Mycmh4YnFGK1h3NjlmajJ5VUo4T3YxcGRO?=
 =?utf-8?B?a0pkQWNPVUJRTThSQ2JpRVlxeUJGbHF5M2w5UEU4czI2QnhqOGpZeXZhcEdK?=
 =?utf-8?B?N2RaT1pqaHZ6akZLUGc1SC9VRHJQUlJCelRvOXdmVjFvSWVFMVIxZHZZQkxx?=
 =?utf-8?B?MWRuZFh0RzR3TlRBRG9PTDNGNmxnWHhnUThNVi9lZVpkSHY2OUFBdFF1VlpX?=
 =?utf-8?B?bkltMG9vS1NNMWYxVFVnTUhzenNwazRLMkM3Z2REbFpHVWpXSitZM09kWncw?=
 =?utf-8?B?OENGblI2emlYWDdOZGdYeEF6VXYvU1lrSXIyWFFvVUFCcVJaU1cwOGFTZHZz?=
 =?utf-8?B?aG82RDVNa0JaQk9XRHEyWDVRSFhza1FOWHgxUWlLVmZhenZSVm10S05yckVy?=
 =?utf-8?B?QzBKaHpXSG1PNHBWbDc0R0puRFNDeFJtcmQ5dGl4U2VzMmlPcW5RejVPZGtV?=
 =?utf-8?B?RnVaQ3hwZkdsNXBjdmJYdXFCRHJsNXJzVVlUZnlSdkNxWU9yZVlQemYzODVV?=
 =?utf-8?B?QSthajhTcG5aZDZITTc0V1N3bVg3VnBNdDhXRkp6N0ZUWk1pbG1qK1hFdktM?=
 =?utf-8?B?c3Jnb2lzZEJaZ1JBaXNSWThnSUNTVUlCVE1sTnloZGlDYVVlR3lhZ1EvV0RF?=
 =?utf-8?B?bzJSNDRkL2R0M2svUU9ISjlaZ2QrSzd6YjhJdHA2QmRDbCt1d2JmOUl4YW9X?=
 =?utf-8?B?aG9yaXpaVzdYM0dVR1N5VW5VY09YZFU1MGR4SU9zQW0xT2ttUUlsRFRhTnM1?=
 =?utf-8?B?b2prUXZGcXk3L1BqN25GdzRzbyszSE44cERUUVBhNWpIYWQyVnhobWdJbERS?=
 =?utf-8?B?R0pwOFVWSWpMdjhaZkFWcnJRNXJtQkdJaFhIdjM4K0lXQTRGSG9lQmlPeTdI?=
 =?utf-8?B?OWJNMmpMb1dhVkt6eTJwbmlJcWI0VndZZDlaTkFYZnptTENzbnhiZTdrZlpP?=
 =?utf-8?B?bCtyTnFUWEVSWDdEY2JGUUc3VWFBUmV1RkQvVXExanlaUEMyZHlCV2RmM2xX?=
 =?utf-8?B?QXZ6QkFUc0dMVkhmN2VSTEphbFNsTmczN0YwbiszV3I4MC9rOHpYQXozTDdn?=
 =?utf-8?B?V1J4b3ltRkpNSDdKVm5DdW0rRzRuTHhhS1ZzbnNOMWIvYjRPZ1k0aEkwTE5X?=
 =?utf-8?B?Tkova2RYSnF6cGY2U3Z4aG9TaU8xNTlLd0I1M09DSHovZG9uNEdZbjRmaktF?=
 =?utf-8?B?MTZvNVdlUG5CTXRaL2VKdFFPaGdRdXQwc2xKTzREWDVrc1dlaEFaalBtL2xZ?=
 =?utf-8?B?eURCYk1GMFFNZ2Nzc1JKTGV1d0JDZnZTL2ZhcEIxNktUUlpRT1BFWnlvSVJm?=
 =?utf-8?B?dm50aHI1SzkrSkJUVlNkMk1EZXVOVFZ3NkV6di9QVE1Ha0M2WmFKU0cwTEsw?=
 =?utf-8?B?MXZ1Tmh1allaQXF3elJZNVdBMmwrdDJKZG1qM0dBVG05empUcmJnaG1uTnJt?=
 =?utf-8?B?d09RejVRNHZZcElROHFpZ3VJNlpDeWdvakVvMlVXU1pjRnVUU0IxS01xZGJa?=
 =?utf-8?B?VHZwQU9hRWQ5QkhzMDhJYzhYVmwxNlpxd0c3YzhtZThmZDlaYnJlWW5zWFM5?=
 =?utf-8?B?aUZ2S21pVXBXSS9tVHdJTHhVODkvek1pMGpxUzNqakU3UVZQalRFWEZKTzhk?=
 =?utf-8?B?UDlTMnJrUHBCd0JWTmNPYnZlUVc5UWFXN204RVA3M1pCNjFGY1dKNHhvTDhj?=
 =?utf-8?B?QUtiaE5jSnUra1RzL00rSzg5OVMwaHF0YTV2YXZZUzZrSmdva0tFSnhaUlgx?=
 =?utf-8?B?dlJ4NTZsT0U5OFB1emtDVmRyanZObEhBQzVCVnN1b1FxeTg0N1U5aEEvZEI2?=
 =?utf-8?B?K25wR3o5RTNwZjhtUk1KaGg0S3NLc2M1YnpRdStlTjZMZ0thbklqUWNJNlFD?=
 =?utf-8?B?Y3Zjb2taS2VQeGhDUEM4T2VWclRWb2J5NWlvQXZxUkJZb3U5bDB3OEdsS3Rq?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <443BF827F6F7EC4588DE05C2F7F56534@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d34d2e-a3b1-414e-4ea9-08de17f61825
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 20:51:26.7407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5y6GfWTsMg4c9Ny+eMF/pf/XVWlapa1eslp3ZHc3WLeclNRT0+5R0LloBrjJClZ0n0X74DbYwMlMMqd0ipXQk/k/F1WMW2kcxjzPaKPNemk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDIzOjEyICswMDAwLCBYaW4gV2FuZyB3cm90ZToNCj4gRm9y
IHBsYXRmb3JtcyB3aXRoIGdyYXBoaWNzX3ZlciA+PSAyMCwgcXVlcnkgdGhlIHJ1bnRpbWUgeGUg
ZGV2aWNlDQo+IHZlcg0KPiBpbnN0ZWFkIG9mIHJlbHlpbmcgc29sZWx5IG9uIGhhcmRjb2RlZCB2
YWx1ZXMgZnJvbSB0aGUgUENJIGRldmljZQ0KPiB0YWJsZS4NCj4gVGhpcyBlbmFibGVzIGFjY3Vy
YXRlIElQIG1pbm9yIHZlcnNpb24gKGdyYXBoaWNzX3JlbCkgZGV0ZWN0aW9uIGZvcg0KPiBwbGF0
Zm9ybXMgbGlrZSBYZTIgd2hlcmUgZGlmZmVyZW50IHN0ZXBwaW5ncyBoYXZlIGRpZmZlcmVudCBJ
UA0KPiB2ZXJzaW9ucy4NCj4gDQo+IEltcGxlbWVudGF0aW9uIGRldGFpbHM6DQo+IC0gVXNlIHdl
YWsgc3ltYm9sIGxpbmthZ2UgZm9yIHhlX2lwdmVyX2NhY2hlX2xvb2t1cCgpIHRvIGhhbmRsZQ0K
PiBzdGF0aWMNCj4gwqAgbGlicmFyeSBjb21waWxhdGlvbiAobGliaWd0X2NoaXBzZXQuYSwgbGli
aWd0X2RldmljZV9zY2FuLmEpDQo+IHdpdGhvdXQNCj4gwqAgeGVfcXVlcnkuYyBkZXBlbmRlbmNp
ZXMgd2hpY2ggYXJlIHVzZWQgZm9yIGk5MTUgdG9vbHMgKGk5MTVfcGVyZg0KPiBhbmQNCj4gwqAg
aW50ZWxfZ3B1X3RvcCkNCj4gLSBQcm92aWRlIGEgd2VhayBzdHViIHRoYXQgcmV0dXJucyBOVUxM
IHdoZW4geGVfcXVlcnkgaXMgbm90IGxpbmtlZA0KPiAtIEZvciBHZW4yMCsgcGxhdGZvcm1zLCBw
cmVmZXIgcnVudGltZSB4ZSBkZXZpY2UgdmVyc2lvbnMgb3ZlciBzdGF0aWMNCj4gZGF0YQ0KPiAt
IEZhbGwgYmFjayB0byBQQ0kgdGFibGUgaWYgeGUgZGV2aWNlIGluZm8gaXMgdW5hdmFpbGFibGUN
Cj4gLSBSZXNldCBjYWNoZSBvbiBxdWVyeSBmYWlsdXJlIHRvIGFsbG93IHJldHJ5DQo+IA0KPiBS
ZW1vdmUgaGFyZGNvZGVkIGdyYXBoaWNzX3JlbCBmcm9tIHN0YXRpYyB0YWJsZSBlbnRyaWVzIGZv
ciB4ZQ0KPiBkZXZpY2VzDQo+IGFzIHRoZXkgd2lsbCBiZSBwb3B1bGF0ZWQgYXQgcnVudGltZSBm
cm9tIEdNRF9JRC4NCj4gDQo+IFRoaXMgdW5pZmllcyBkZXZpY2UgaW5mbyBoYW5kbGluZyBiZXR3
ZWVuIGk5MTUgYW5kIHhlIGRyaXZlcnMsDQo+IGVuYWJsaW5nOg0KPiAtIFBsYXRmb3JtLXNwZWNp
ZmljIHdvcmthcm91bmRzIGJhc2VkIG9uIGFjY3VyYXRlIElQIHZlcnNpb25zDQo+IC0gQ29uc2lz
dGVudCBkZXZpY2UgaW5mbyBBUEkgYWNyb3NzIGJvdGggZHJpdmVycw0KDQpJJ2QgcGVyc29uYWxs
eSBkcm9wIHRoaXMgcmVmZXJlbmNlIHRvIHVuaWZpY2F0aW9uIG9mIGludGVyZmFjZXMuIFRoZQ0K
aW1wbGVtZW50YXRpb25zIG9mIHRoZSBxdWVyeSBpbnRlcmZhY2VzIGJldHdlZW4geGUgYW5kIGk5
MTUgYXJlIGFscmVhZHkNCmRpZmZlcmVudCBhbmQgY291bGQgZGl2ZXJnZSBldmVuIGZ1cnRoZXIg
b3ZlciB0aW1lLCBzbyB0aGlzIGlzbid0IGENCnRydWUgdW5pZmljYXRpb24gYW55d2F5Lg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4NCj4gLS0tDQo+
IMKgbGliL2ludGVsX2RldmljZV9pbmZvLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0t
LQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jIGIvbGliL2ludGVsX2Rl
dmljZV9pbmZvLmMNCj4gaW5kZXggYTg1M2Y5YWI0Li44N2IxMDY5YmUgMTAwNjQ0DQo+IC0tLSBh
L2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jDQo+ICsrKyBiL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5j
DQo+IEBAIC0zLDYgKzMsMTYgQEANCj4gwqAjaW5jbHVkZSAiaTkxNV9wY2lpZHNfbG9jYWwuaCIN
Cj4gwqANCj4gwqAjaW5jbHVkZSA8c3RyaW5ncy5oPiAvKiBmZnMoKSAqLw0KPiArI2luY2x1ZGUg
PHN0ZGRlZi5oPg0KPiArI2luY2x1ZGUgPHN0cmluZy5oPg0KDQpXaHkgZG8geW91IG5lZWQgc3Ry
aW5nLmggaGVyZT8NCg0KPiArDQo+ICsvKiBXZWFrIHN5bWJvbCBzdHViIC0gd2lsbCBiZSBvdmVy
cmlkZGVuIGlmIHhlX3F1ZXJ5LmMgaXMgbGlua2VkICovDQo+ICtzdHJ1Y3QgeGVfZGV2aWNlX2lw
dmVyICp4ZV9pcHZlcl9jYWNoZV9sb29rdXAodWludDMyX3QgZGV2aWQpDQo+IF9fYXR0cmlidXRl
X18oKHdlYWspKTsNCj4gKw0KPiArc3RydWN0IHhlX2RldmljZV9pcHZlciAqeGVfaXB2ZXJfY2Fj
aGVfbG9va3VwKHVpbnQzMl90IGRldmlkKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
TlVMTDsNCj4gK30NCj4gwqANCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvIGludGVsX2dlbmVyaWNfaW5mbyA9IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5ncmFwaGljc192
ZXIgPSAwLA0KPiBAQCAtNTA1LDcgKzUxNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxf
ZGV2aWNlX2luZm8NCj4gaW50ZWxfcG9udGV2ZWNjaGlvX2luZm8gPSB7DQo+IMKgDQo+IMKgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9sdW5hcmxha2VfaW5mbyA9
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5ncmFwaGljc192ZXIgPSAyMCwNCg0KU29ycnkgaWYgSSdt
IGNvbWluZyBpbiBsYXRlIGhlcmUuLi4gd2h5IGRvbid0IHdlIGRvIHRoaXMgZm9yDQpncmFwaGlj
c192ZXIgYWxzbz8gVGhlbiBiZWxvdyB5b3UgY2FuIGp1c3QgZWl0aGVyIGNoZWNrIGlmIGdyYXBo
aWNzX3Zlcg0KPT0gMCBvciB1c2UgaW50ZWxfZ2VuKCk/DQoNCj4gLcKgwqDCoMKgwqDCoMKgLmdy
YXBoaWNzX3JlbCA9IDQsDQo+IMKgwqDCoMKgwqDCoMKgwqAuZGlzcGxheV92ZXIgPSAyMCwNCj4g
wqDCoMKgwqDCoMKgwqDCoC5oYXNfNHRpbGUgPSB0cnVlLA0KPiDCoMKgwqDCoMKgwqDCoMKgLmhh
c19mbGF0Y2NzID0gdHJ1ZSwNCj4gQEAgLTUxNyw3ICs1MjYsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGludGVsX2RldmljZV9pbmZvDQo+IGludGVsX2x1bmFybGFrZV9pbmZvID0gew0KPiDCoA0K
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfYmF0dGxlbWFn
ZV9pbmZvID0gew0KPiDCoMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3ZlciA9IDIwLA0KPiAtwqDC
oMKgwqDCoMKgwqAuZ3JhcGhpY3NfcmVsID0gMSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5kaXNwbGF5
X3ZlciA9IDE0LA0KPiDCoMKgwqDCoMKgwqDCoMKgLmhhc180dGlsZSA9IHRydWUsDQo+IMKgwqDC
oMKgwqDCoMKgwqAuaGFzX2ZsYXRjY3MgPSB0cnVlLA0KPiBAQCAtNTI5LDcgKzUzNyw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gaW50ZWxfYmF0dGxlbWFnZV9p
bmZvID0gew0KPiDCoA0KPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8g
aW50ZWxfcGFudGhlcmxha2VfaW5mbyA9IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5ncmFwaGljc192
ZXIgPSAzMCwNCj4gLcKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3JlbCA9IDAsDQo+IMKgwqDCoMKg
wqDCoMKgwqAuZGlzcGxheV92ZXIgPSAzMCwNCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfNHRpbGUg
PSB0cnVlLA0KPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gQEAgLTY3
NSw2ICs2ODIsOCBAQCBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gKmludGVsX2dl
dF9kZXZpY2VfaW5mbyh1aW50MTZfdCBkZXZpZCkNCj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqBz
dGF0aWMgX190aHJlYWQgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICpjYWNoZSA9DQo+
ICZpbnRlbF9nZW5lcmljX2luZm87DQo+IMKgwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190aHJlYWQg
dWludDE2X3QgY2FjaGVkX2RldmlkOw0KPiArwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190aHJlYWQg
c3RydWN0IGludGVsX2RldmljZV9pbmZvIHhlX2Rldl9pbmZvOw0KPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgeGVfZGV2aWNlX2lwdmVyICppcHZlcjsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCBpOw0K
PiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGNhY2hlZF9kZXZpZCA9PSBkZXZpZCkNCj4gQEAg
LTY4OSw2ICs2OTgsMTcgQEAgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvDQo+ICppbnRl
bF9nZXRfZGV2aWNlX2luZm8odWludDE2X3QgZGV2aWQpDQo+IMKgwqDCoMKgwqDCoMKgwqBjYWNo
ZWRfZGV2aWQgPSBkZXZpZDsNCj4gwqDCoMKgwqDCoMKgwqDCoGNhY2hlID0gKHZvaWQgKilpbnRl
bF9kZXZpY2VfbWF0Y2hbaV0ubWF0Y2hfZGF0YTsNCj4gwqANCj4gK8KgwqDCoMKgwqDCoMKgaWYg
KGNhY2hlLT5ncmFwaGljc192ZXIgPj0gMjApIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlwdmVyID0geGVfaXB2ZXJfY2FjaGVfbG9va3VwKGRldmlkKTsNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpcHZlciAmJiBpcHZlci0+ZGV2aWQgPT0gZGV2aWQp
IHsNCg0KV2hhdCBpcyB0aGUgZXhwZWN0YXRpb24gaWYgd2UgZG9uJ3QgbGluayBpbiB4ZV9xdWVy
eS5jPyBTZWVtcyBsaWtlIGl0DQp3b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCBtYWtlIHRoaXMgYSBo
YXJkIHJlcXVpcmVtZW50PyBPciBzaW5jZSB0aGVyZSBpcw0KYSBkZXBlbmRlbmN5IGhlcmUgb24g
aWd0X2RldmljZV9nZXQoKS9wdXQoKSB3ZSBzdGlsbCB3YW50IHRoaXMgYmFja3VwDQppZiB3ZSBk
b24ndCBjYXJlIGFib3V0IHRoZSB2ZXJzaW9ucz8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCg0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbWNweSgmeGVf
ZGV2X2luZm8sIGNhY2hlLCBzaXplb2Yoc3RydWN0DQo+IGludGVsX2RldmljZV9pbmZvKSk7DQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2X2lu
Zm8uZ3JhcGhpY3NfdmVyID0gaXB2ZXItDQo+ID5ncmFwaGljc192ZXI7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2X2luZm8uZ3JhcGhpY3Nf
cmVsID0gaXB2ZXItDQo+ID5ncmFwaGljc19yZWw7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FjaGUgPSAmeGVfZGV2X2luZm87DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhY2hlZF9kZXZpZCA9IDA7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ICvCoMKgwqDCoMKgwqDCoH0NCj4gwqBvdXQ6DQo+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gY2FjaGU7DQo+IMKgfQ0KDQo=
