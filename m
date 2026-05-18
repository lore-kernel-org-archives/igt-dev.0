Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDED6CD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 11:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58810E2F0;
	Mon, 18 May 2026 11:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flYbXH1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CB910E2F0
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779103342; x=1810639342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xeum4ZMwNv/XyGIF98QepE9XIA8vbKRP8aIBvA90JlE=;
 b=flYbXH1pQDvPHs7BB4bvlKMTPYE1Ljd3E2kueIJfmF395nWQu2LNRVxr
 UYBkoiC4hSDZqZZ2VVL5beJHKGWeAWiiuChnqNkW4P2vplDFkHY1+Of3T
 NgT7etnU1h1N0roFW9wq/o7k6GPvmF9J/l/pJqge1WLLtvfQVm+gaDNNi
 qId3ZwJTOmJWzGrqYsCCnpGMTdASpi8O9ma+mCsOh3Vgh5nLmU1nuW0jQ
 G4+hetT4at/OgHOoZbA3M9hVMBGH0P0eSS4L3Pvlhy5ovZptiu0M6VEPP
 aGk7CHXoblbkOeErzKgVCmJa9dYedmiJflTNbZ3nBXl8Z2iBhAqi6WwO7 A==;
X-CSE-ConnectionGUID: ssi5oYVMQz2BMDxM2fBZWQ==
X-CSE-MsgGUID: VmTT3QdBQlyov5dlhP7ZGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67481605"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="67481605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 04:22:21 -0700
X-CSE-ConnectionGUID: 4sGiMsF0Rxah3CFhlh8CAQ==
X-CSE-MsgGUID: 7OBox8QzRz2Rpsu3shNt3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="233009529"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 04:22:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:22:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:22:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3H9Jb3Mtx+532YfnQW7LLiEf8JNfBg8fo+NwyLL2wBDl15Ua7HhSxHhZrB3V28qQVhpGBCuIyoGJEKTr/wWxRed1CbcYMuPPJI6y+pBpub1LMy63dFPXl1R3c+saqK9jbml/nK2xm6BEc0LDYBp/Wqdhwm3p1J4cXxGOGWTlOnhFkct7RV27oR4Bib05SIlhoQd1CAqUUGCMTgrYERtzteU7MV/imv4FkPC4SQa6ZiXVaVUNYGTw9QLYZzbI0qKPmHRNAkisITw0pZIlO9K5fOfE4I4a0nFsVD2rfyqry8GM7oqJqN4MaqgMEJIP7Q7boyWRDXWGrZCUSVP0A2GsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeum4ZMwNv/XyGIF98QepE9XIA8vbKRP8aIBvA90JlE=;
 b=oWbpZ8GgKNjfMFj9dD/Vaq5Q/BEt0qydKGKK3xW09GAXIzP+FkkGwJSkw81zlFkYMqSj5YkpuFhwhjEbTfwU8+lUAsB1RlIIJPUrZdiPByxr6YjeGdAcYPr8ghjYRI+xH1F11iHMatU3Qa64M/v+RnzdTQrsaev6SEojxpLWeYvMkuspvKEN3UK5as/xvpXp2bBmrntqSa+m+Y8fMdH5oZOz2JUOytCZHHjsOK3h4RjDR6RV1RZy3o0RfQoDwstkkpe1ine80S/8b123fYwjamlcoC0bdhi/DnjEhbo1i6mxj18RDvoFhH01lTGH67jzOs2W0ug3D9SpF70tGTXJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 11:22:13 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 11:22:13 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH i-g-t,v2 3/3] tests/intel/kms_sharpness_filter: Add
 invalid-filter-with-nearest-neighbor
Thread-Topic: [PATCH i-g-t,v2 3/3] tests/intel/kms_sharpness_filter: Add
 invalid-filter-with-nearest-neighbor
Thread-Index: AQHc4wwE4/SXnz7EtU2hUROefn/w0LYTqvTA
Date: Mon, 18 May 2026 11:22:13 +0000
Message-ID: <IA1PR11MB646742AF868A29A0A8BDF9AEE3032@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260513191732.2420879-1-swati2.sharma@intel.com>
 <20260513191732.2420879-4-swati2.sharma@intel.com>
In-Reply-To: <20260513191732.2420879-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: 5c574528-e2d6-45ec-8809-08deb4cfb5e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|3023799003|38070700021|11063799003|4143699003;
x-microsoft-antispam-message-info: MBHMmyfWmTFZobZvAxEVnxdlXkks+5/yK2dKNFnX0rlAV6o9+RnIjHQmIfPajkwMhf5fojL4MZMt6ojXGu4/gdDgJVCWoY61+KDjwsg6bXAENXm6JnYCoG9KuWOfU45jN9Ib32IaWUqG7bahJLp+y1nhibmnFFsVuzq5hsv+83QfajBnvsuIagKlG0M8qrflsMufRT+Ul+ZYXnQniAXy4R/wWrL/0xJ0mRY2Dk32d8uxSTliOcGa+BTBxsWiukNl0ydMg2L+AoJTUXPWKBpkf8yPlGWqqoEixNiP7nD8mwBL3P+arYcizAwzPljpK3C2iA2Dw444r1GKTQbstj3or7wfTlFv1jgiyXkpXjKHqNgAIupJ8BfFWuO1s/7S2I1kGOR9bSNqmHRiOS3bnx8XAnGBBzGkZb7fLGg4o+3uIm/2rH2a4vnZofAIqAmMMDw5ibKl4w3dXUIOKDZRftuP3AzRJsugWUml1LnPVmNjl0qT4nK5Ula8MEySIz0vM26nrX0MbSjfbWWIljSWkuRFq9kvwN4YJ/3ppNml1BnGcGIldMNz8F5rxKjXIbEtvI0SVeAU8sHiZkRSfPJcY6qDNYHPnPut07JbqJHPTLVMLb2L9ChwsFuphJGCbDLqf3QYvvxL7lUtEo6XL2GXGP+/TFZeqUD7OTaVRGuxyQAsHAiLxlXETwU1AtGaWuWMt8Obgc8SgtB4WcnRyPFZY+u/GZAsoPB/4Y8v8u6pUo9mqdY9sh1Fckx9Exw0qU7wljTt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(38070700021)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UERKRGVSZjk3cHIwcDZKSGZYS1BrbXhDaUdwTmFPby93VnBQbGUxNm0wZVVZ?=
 =?utf-8?B?ampMQ0U4TlZJZXVINk1VVzk1OHdUR2p6Y3lURktpdUdHYWo0TEt3VUVEMXlp?=
 =?utf-8?B?bkxSWmJUTXRLaU9SQ2hFbzVnNXZrbWpPMVZnMndoZWZ3ZWFYSzhmZE1iU0hx?=
 =?utf-8?B?TUpBRW9ldW1hb3JBV0c3S3d6VjhvOWdtWXIxcmtzOE5ya241cGFGTktwZTF0?=
 =?utf-8?B?T2I0U253d01hVHF6UjFzRmZzbVhxejZmMkxybnZYYWZLRk5kM2xNNUxjdVhY?=
 =?utf-8?B?aHA3cGFtN04wYnhjVXAxU1ZMaEdhQ0JEYW1GaG1NR3ZPZFFEbHVDM2krVENC?=
 =?utf-8?B?cUJyNGNmdUphZm1DQ0UyNHhWOFg2SVBwei9ZOXhHUGpaYkVHUWlIY1BLQUpn?=
 =?utf-8?B?cDl4VEJlNFFMbnB6YzRXTURqR2czT2pPZjVnRk9hSHpRTDdjVDdBV2ZqS0tG?=
 =?utf-8?B?K1lBbnhrRDBoYXhNbEpmZ3ZEaGVYWEV5TnprSTB0Q0k2NXJwOG5GbmJqQWZv?=
 =?utf-8?B?QzVYMDg0bndiMGdFY255WlZST2t5QXBQck0xZG1TYmhsUEs0ZDB6Vlc0VHBI?=
 =?utf-8?B?Y1B6SXU3MFN4L0NBOEJsa2NhcTZ1SkMxRnlwV2dVblNRZXJSdGxDelNJbXQ4?=
 =?utf-8?B?bXZWRFRFck1JRVpRWE9tQk5ScGN1M0J3bnZoSDcvUmdiTSsvRnU5ZTZFSkw2?=
 =?utf-8?B?RTB2MW1WWjhOUVBrdnArTlpNU1VqNldkQ1JGU2FMaWRaNEYvd3hpcWNETG5o?=
 =?utf-8?B?MjUvSlg5cExSL1NaNTRoM21ua2s4eGlFYzdKRkhrRno2eEtjanpvazk3NDNv?=
 =?utf-8?B?QU9aekhPRS83SEhiWVIwKzBIMFRPSENVelZNK01mTTRLWEdHSGNMTmgrK0tm?=
 =?utf-8?B?NDVPcFM3ZEFLb3NTTGN2MWdSSEd3N0VoN05pSnRTS2RaZmgxV1ltRmxsakNL?=
 =?utf-8?B?d09LQk81Q3kxN2ZFa3kzOEw3VzNMempGQUh1MytXOENqVDUrbGdTSXFvNUdm?=
 =?utf-8?B?amE3SFJ1N1lOaE9rb25jTm9QTVIrTVF4dGoyVnd1YWJHUTBnZ1R0VjVYNGpa?=
 =?utf-8?B?L2JGR2UwbHlUZi8vcFhoTm84WVUwQ1dqWlMyRVJQMUwxejRLZVdNSVVXdTdz?=
 =?utf-8?B?eDlkb1Mxa041VGRIV3ROcU5PRGcvTGhUbnJBSVhZS0h5VjRjUExoZ0J6alF6?=
 =?utf-8?B?d3h3OWdTVkw1NTZJejE5ZnJXd0xUT0JKVnEvRThhNGpIN2NtTllyT0RRbEh4?=
 =?utf-8?B?WFBWQWs5QmNOTldaVDZ1TWhvZCtrN280UTBHVEVJaTIrdXhMUHlKZkJudFBG?=
 =?utf-8?B?V3pDMytaVnlrRkpUeU9ENXFRV3BmRUszVHZDbVR5dXJWU2ZKRWxKdGJ6dVBK?=
 =?utf-8?B?RldhU0NUM0FET01LNThrZk9xalJ1dnhUcW5abEgvSmhKUWJPS0RGUmtoVVht?=
 =?utf-8?B?YXE3cFd5a24xRzN1NElESUo0bmJ5SVhoMDNGb2E3T1BodlpLQjR4NDc0S1ZP?=
 =?utf-8?B?QVA1Tlp4NXZQcHUvS1RCdlFLTUdsWXFnRVQvN1pHSkJCYUtkamgxWExZL3Nq?=
 =?utf-8?B?dmd2ZkozQWhURDVjZ0hpL1g1b2x3czIxL0lOYXNGaFg4WTBEL0pVT2JNYUlK?=
 =?utf-8?B?VWY1YUpHWTA2a2lGb3F6ZGZZdlZZMGs0N2V4dVQ4ekt4dytoZVZrcjVYYVFP?=
 =?utf-8?B?T0hxd3NpS1JVVDUvVjAwelNacVA1c1d5NnBKMXNKS29LZXFrZ0sxdFd3OW5H?=
 =?utf-8?B?RVJ6SUo2WkNnNkI5SC9yZ2h1Y0Z4bTROR25vdThRcDNxWTVhMlJmTTA0YU4x?=
 =?utf-8?B?VWxheTJkWkExcUwrbFNMWjBWNC8xMjFCQjJDM01MTnFHRXBsVm9DOEExNmhk?=
 =?utf-8?B?SytMUDlGYXMwNGlveG5DSlVQS3JIelBCNFZQcXBFZElIZzdsWE9WVTJKS3Nu?=
 =?utf-8?B?cWpSSkxpMERpQ2VDMkVqTTdkTCtwVFlGMXRUbE56RzVZU3dST2VnM0NhZFJI?=
 =?utf-8?B?dnZ3Ym1ZMXZDVFAxcTljNS81WkVXT08xK0lRZ21oWWtibkZibkttVmlSbUJ2?=
 =?utf-8?B?enlKUnc2RGlNczhHNllWMXpYcER4Rnk1SFE3RklqeGFKa2pyYlNwcUlTMHR2?=
 =?utf-8?B?engzY1p2MXllQ0FPeVorK3lDNytZeDUzUkFzU2tPYWd2QjhFUWxvS09OZ0Ja?=
 =?utf-8?B?WEkyY2tNWURPZjBpT3h0eU5OeXRFSFVrVEpNUDNvMmVtRWZ3TC9vWVl1K1pz?=
 =?utf-8?B?cE50dXZ5RHdCaGNjYmM4L1pYNGFTZVlmSG83VEVka0ROaXhQeUNkNzZCd010?=
 =?utf-8?B?aU5BRzBiU3dxeC8zdFpscEtITkZ1K3BEdm1ab2c5RzYvUHZxcllDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pYLlyIImuYn5xR38gbbisFaJoOCaeDfec6a7wtI2Nw/AgCVBHVKGmvaNXKlA96+FzhBE2IgkdrGOrinI9vKNBEidq45tIdkZOZ4RP7Lw39rSg8KkUundH+ic6dKjhHyT5psNuWMZ5RGCgiMmBRq91DflFvXXISP3dShIEfFPZHWmOMBWiiQz/t6q98BCfqgatDuM+DOpwicY879T3k1p3TdtaBhNW8Om6PioYpnbXRxxP1akfW7EBOKDvqGjv3Cw1GaPTaHif2ifwLo9bxNOZfOJudZWxscn+De8XhVCCUjmJJzYaeVI3neoAN+2okjlWKznjndbpjVnC2d25lPYVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c574528-e2d6-45ec-8809-08deb4cfb5e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 11:22:13.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: baPJcXFMFJsCuIo+xGYPOe0kkFUBLXG/ZCeDRER0ZPtLK0EfurJAJereTMvzQTWrEBB371PVmQoZMO65qrSTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBTd2F0aTIg
PHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE0LCAyMDI2
IDEyOjQ4IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU2hh
cm1hLCBTd2F0aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPjsgVmlsbGUgU3lyasOkbMOkDQo+
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT47IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdh
cmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQsdjIgMy8zXSB0ZXN0cy9pbnRl
bC9rbXNfc2hhcnBuZXNzX2ZpbHRlcjogQWRkIGludmFsaWQtDQo+IGZpbHRlci13aXRoLW5lYXJl
c3QtbmVpZ2hib3INCj4gDQo+IEFkZCBhIG5lZ2F0aXZlIHN1YnRlc3QgdGhhdCBzZXRzIHRoZSBD
UlRDIHNjYWxpbmcgZmlsdGVyIHRvICJOZWFyZXN0IE5laWdoYm9yIg0KPiB0b2dldGhlciB3aXRo
IHRoZSBjb250ZW50IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIuIFRoZSBkcml2ZXIgbXVzdCBy
ZWplY3QgdGhpcw0KPiBjb21iaW5hdGlvbiBzaW5jZSB0aGUgcGlwZSBzY2FsZXIgY2Fubm90IHJ1
biB0aGUgc2hhcnBuZXNzIGZpbHRlciBhbmQgTmVhcmVzdA0KPiBOZWlnaGJvciBzY2FsaW5nIGF0
IHRoZSBzYW1lIHRpbWUuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogQ2xhdWRlIE9w
dXMgNC42DQo+IFNpZ25lZC1vZmYtYnk6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+DQo+IFJldmlld2VkLWJ5OiBOZW1lc2EgR2FyZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMgfCAyNSArKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMN
Cj4gYi90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jDQo+IGluZGV4IDRhN2ZkNmM3
NS4uMzUzYTlhMjkyIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2Zp
bHRlci5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gQEAg
LTU5LDYgKzU5LDExIEBADQo+ICAgKiBEZXNjcmlwdGlvbjogTmVnYXRpdmUgY2hlY2sgZm9yIGNv
bnRlbnQgYWRhcHRpdmUgc2hhcnBuZXNzIGZpbHRlcg0KPiAgICogICAgICAgICAgICAgIHdoZW4g
c2NhbGluZyBtb2RlIGlzIGFscmVhZHkgZW5hYmxlZCBhbmQgYXR0ZW1wdCBpcyBtYWRlIHRvDQo+
IGVuYWJsZQ0KPiAgICogICAgICAgICAgICAgIHNoYXJwbmVzcyBmaWx0ZXIuDQo+ICsgKg0KPiAr
ICogU1VCVEVTVDogaW52YWxpZC1maWx0ZXItd2l0aC1uZWFyZXN0LW5laWdoYm9yDQo+ICsgKiBE
ZXNjcmlwdGlvbjogTmVnYXRpdmUgY2hlY2sgZm9yIGNvbnRlbnQgYWRhcHRpdmUgc2hhcnBuZXNz
IGZpbHRlciB3aGVuDQo+ICsgKiAgICAgICAgICAgICAgdGhlIHBpcGUgc2NhbGluZyBmaWx0ZXIg
aXMgc2V0IHRvIE5lYXJlc3QgTmVpZ2hib3IgYW5kIGFuDQo+ICsgKiAgICAgICAgICAgICAgYXR0
ZW1wdCBpcyBtYWRlIHRvIGVuYWJsZSB0aGUgc2hhcnBuZXNzIGZpbHRlci4NCj4gICovDQo+IA0K
PiAgSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3QgdG8gdmFsaWRhdGUgY29udGVudCBhZGFwdGl2
ZSBzaGFycG5lc3MgZmlsdGVyIik7DQo+IEBAIC05NCw2ICs5OSw3IEBAIGVudW0gdGVzdF90eXBl
IHsNCj4gIAlURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfUExBTkUsDQo+ICAJVEVTVF9JTlZBTElE
X1BMQU5FX1dJVEhfRklMVEVSLA0KPiAgCVRFU1RfSU5WQUxJRF9GSUxURVJfV0lUSF9TQ0FMSU5H
X01PREUsDQo+ICsJVEVTVF9JTlZBTElEX0ZJTFRFUl9XSVRIX05FQVJFU1RfTkVJR0hCT1IsDQo+
ICB9Ow0KPiANCj4gIGNvbnN0IGludCBmaWx0ZXJfc3RyZW5ndGhfbGlzdFtdID0gew0KPiBAQCAt
MjEyLDYgKzIxOCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1YnRlc3RfZW50cnkgew0KPiAg
CQkuZmlsdGVyX3N0cmVuZ3RoID0gREVGQVVMVF9GSUxURVJfU1RSRU5HVEgsDQo+ICAJCS5pdGVy
ICAgICA9IElURVJfU0NBTElOR19NT0RFLA0KPiAgCX0sDQo+ICsJew0KPiArCQkubmFtZSAgICAg
PSAiaW52YWxpZC1maWx0ZXItd2l0aC1uZWFyZXN0LW5laWdoYm9yIiwNCj4gKwkJLmRlc2NyaWJl
ID0gIk5lZ2F0aXZlIGNoZWNrIGZvciBjb250ZW50IGFkYXB0aXZlIHNoYXJwbmVzcw0KPiBmaWx0
ZXIgIg0KPiArCQkJICAgICJ3aGVuIHRoZSBwaXBlIHNjYWxpbmcgZmlsdGVyIGlzIHNldCB0byBO
ZWFyZXN0DQo+IE5laWdoYm9yICINCj4gKwkJCSAgICAiYW5kIGFuIGF0dGVtcHQgaXMgbWFkZSB0
byBlbmFibGUgdGhlIHNoYXJwbmVzcw0KPiBmaWx0ZXIuIiwNCj4gKwkJLnR5cGUgICAgID0gVEVT
VF9JTlZBTElEX0ZJTFRFUl9XSVRIX05FQVJFU1RfTkVJR0hCT1IsDQo+ICsJCS5maWx0ZXJfc3Ry
ZW5ndGggPSBERUZBVUxUX0ZJTFRFUl9TVFJFTkdUSCwNCj4gKwl9LA0KPiAgfTsNCj4gDQo+ICB0
eXBlZGVmIHN0cnVjdCB7DQo+IEBAIC0zOTQsNiArNDA4LDcgQEAgc3RhdGljIGJvb2wgaXNfaW52
YWxpZF90ZXN0KGVudW0gdGVzdF90eXBlIHR5cGUpDQo+ICAJY2FzZSBURVNUX0lOVkFMSURfRklM
VEVSX1dJVEhfUExBTkU6DQo+ICAJY2FzZSBURVNUX0lOVkFMSURfUExBTkVfV0lUSF9GSUxURVI6
DQo+ICAJY2FzZSBURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfU0NBTElOR19NT0RFOg0KPiArCWNh
c2UgVEVTVF9JTlZBTElEX0ZJTFRFUl9XSVRIX05FQVJFU1RfTkVJR0hCT1I6DQo+ICAJCXJldHVy
biB0cnVlOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCXJldHVybiBmYWxzZTsNCj4gQEAgLTQzNSw2ICs0
NTAsMTEgQEAgc3RhdGljIHZvaWQgdGVzdF9zaGFycG5lc3NfZmlsdGVyKGRhdGFfdCAqZGF0YSwg
ZW51bQ0KPiB0ZXN0X3R5cGUgdHlwZSkNCj4gIAlpZiAodHlwZSA9PSBURVNUX0lOVkFMSURfRklM
VEVSX1dJVEhfU0NBTElOR19NT0RFKQ0KPiAgCQlpZ3RfcmVxdWlyZV9mKGhhc19zY2FsaW5nX21v
ZGUob3V0cHV0KSwgIk5vIGNvbm5lY3Rlcg0KPiBzY2FsaW5nIG1vZGUgZm91bmQgb24gJXNcbiIs
IG91dHB1dC0+bmFtZSk7DQo+IA0KPiArCWlmICh0eXBlID09IFRFU1RfSU5WQUxJRF9GSUxURVJf
V0lUSF9ORUFSRVNUX05FSUdIQk9SKQ0KPiArCQlpZ3RfcmVxdWlyZV9mKGlndF9jcnRjX2hhc19w
cm9wKGRhdGEtPmNydGMsDQo+IElHVF9DUlRDX1NDQUxJTkdfRklMVEVSKSwNCj4gKwkJCSAgICAg
ICJObyBDUlRDIFNDQUxJTkdfRklMVEVSIHByb3BlcnR5IG9uIHBpcGUNCj4gJXNcbiIsDQo+ICsJ
CQkgICAgICBpZ3RfY3J0Y19uYW1lKGRhdGEtPmNydGMpKTsNCj4gKw0KPiAgCWlmIChuZWVkc19l
eHRyYV9wbGFuZXModHlwZSkpDQo+ICAJCXNldF9wbGFuZXMoZGF0YSwgdHlwZSk7DQo+IA0KPiBA
QCAtNDUyLDYgKzQ3MiwxMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3NoYXJwbmVzc19maWx0ZXIoZGF0
YV90ICpkYXRhLCBlbnVtDQo+IHRlc3RfdHlwZSB0eXBlKQ0KPiANCj4gIAlzZXRfZmlsdGVyX3N0
cmVuZ3RoX29uX3BpcGUoZGF0YSk7DQo+IA0KPiArCWlmICh0eXBlID09IFRFU1RfSU5WQUxJRF9G
SUxURVJfV0lUSF9ORUFSRVNUX05FSUdIQk9SKQ0KPiArCQlpZ3RfY3J0Y19zZXRfcHJvcF9lbnVt
KGRhdGEtPmNydGMsDQo+IElHVF9DUlRDX1NDQUxJTkdfRklMVEVSLA0KPiArCQkJCSAgICAgICAi
TmVhcmVzdCBOZWlnaGJvciIpOw0KPiArDQo+ICAJaWYgKHR5cGUgPT0gVEVTVF9JTlZBTElEX0ZJ
TFRFUl9XSVRIX1NDQUxJTkdfTU9ERSkNCj4gIAkJcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1p
dF9hdG9taWMoJmRhdGEtPmRpc3BsYXksIDAsIE5VTEwpOw0KPiAgCWVsc2UNCj4gQEAgLTUyOCw2
ICs1NTIsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHRlc3RfdHlwZV9uYW1lc1tdID0g
ew0KPiAgCVtURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfUExBTkVdICAgICAgICA9ICJpbnZhbGlk
LWZpbHRlci13aXRoLQ0KPiBwbGFuZSIsDQo+ICAJW1RFU1RfSU5WQUxJRF9QTEFORV9XSVRIX0ZJ
TFRFUl0gICAgICAgID0gImludmFsaWQtcGxhbmUtd2l0aC0NCj4gZmlsdGVyIiwNCj4gIAlbVEVT
VF9JTlZBTElEX0ZJTFRFUl9XSVRIX1NDQUxJTkdfTU9ERV0gPSBOVUxMLA0KPiArCVtURVNUX0lO
VkFMSURfRklMVEVSX1dJVEhfTkVBUkVTVF9ORUlHSEJPUl0gPQ0KPiArImludmFsaWQtZmlsdGVy
LXdpdGgtbmVhcmVzdC1uZWlnaGJvciIsDQo+ICB9Ow0KPiANCkxHVE0sDQpSZXZpZXdlZC1ieTog
TmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCg0KPiAgc3RhdGljIHZvaWQgYnVp
bGRfdGVzdF9zdWZmaXgoZGF0YV90ICpkYXRhLCBlbnVtIHRlc3RfdHlwZSB0eXBlLA0KPiAtLQ0K
PiAyLjI1LjENCg0K
