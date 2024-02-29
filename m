Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A10C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636C10E455;
	Thu, 29 Feb 2024 11:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5iK9A+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CA010E455
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204798; x=1740740798;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m/ZEyE/o0UzgY2gdBD7rnOF8AiiYOsnvwFZh2hIVH1k=;
 b=G5iK9A+BLR9PmizJZwKDxidpz4/+Q7wdyP/TFhZs7jhkdouJGsrpJ0VM
 rz8Qonvv+EUqyX90N3U9tLRepsQxTcY185tsEAQpl2r9XGTrK6FHFEPdM
 72sa74Q7aYtDZfsyAtI0P7+wcc8ykipUqYAeBIkzv8U1Tf+nNSLkVoMcd
 oN4POMWwVN7df7Qzl/xU5IdYfVOBpY2/Xbd3xJ9+eiOQh5eYCe0yUJZ1n
 8J8UNJ44wNqgT/qInK+1cqNR/OPW50+wlu7wSkZlJRJDTmV43GvkcYWJe
 eKZrH405vIkD9Amz1S3DeGyXszNvK/F4l74//fsjl8xBstIjHSbU+0TmW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14818785"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14818785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7701103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:06:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:06:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksuabb05HFA312Eaed28BiX4IRQS8C1RYCrOppdR8FotfwmkSZKNS/isqRuQv+PVGoXPIQHjAK2lq9y/Ac6w+ZM3CGW28Q2M2KQgywb5p0S/tNz+VEM96ceaRD4yO5DnMkdxcdaBbC4knDnAXSmn3b/xUbGIN/nuzD9E16euT3rv3mwPSeqcCW2M5L8uWqmIlKEYJy1siuG22aXmdNmPv1SBkdDWIlCZ7XxLpreG9R0uYnYWKAYM7CvLsgIQ+d580gq2W5RANofb4B7D1IUREdDakIMwAITH965gajPBB/zKpaedFNfa4wnW1edaVbuEvDxN5kF1AAMflRm9gUJYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/ZEyE/o0UzgY2gdBD7rnOF8AiiYOsnvwFZh2hIVH1k=;
 b=iEb0YyTGNei5s1T8u4d3vc+1K7te34Ttxr1+J3uJdXaoLKygVak080PQOcYpbcADzik2hNMVZo8YL7b0mJ3FB5X/umynhxjH20/Dd5mCoZeT3Nwg+ZJnxmDBt41mlS3ZhGNatz3YUlrBH57eIeBsro+YGDWBtlsSkQCZbypth6ywE8TEcV2bGAtQZdTicSwl4vPiZNt9SEfm20ClgDwyEnp4esVrbpN1AyJLVv7oZtpg5cIdV6BXM3xdGTeDvd0B10r/EO1/4Z48S/OGsbiro060h1l+XqtROMtwXFmk9CfqaGiUME8Y63b1c2nVX1H5kJ+4Vt4HMofr/0v66jMWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 29 Feb
 2024 11:06:33 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 11:06:33 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/4] tests/intel/xe_noexec_ping_pong: change
 category to hardware building block
Thread-Topic: [PATCH i-g-t 3/4] tests/intel/xe_noexec_ping_pong: change
 category to hardware building block
Thread-Index: AQHaatzuIagXdBz3EkixHN9ryi9DjLEhKPbg
Date: Thu, 29 Feb 2024 11:06:33 +0000
Message-ID: <IA1PR11MB60973F3CB66FCBA85516C70B865F2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
 <20240229065953.538861-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20240229065953.538861-4-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS7PR11MB7783:EE_
x-ms-office365-filtering-correlation-id: 817701b0-77c2-43c0-0671-08dc39167d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QINKRr/S4h+OA7RGkmreqPkW5HL1PXQJJNqWrsPgjhtwE1AxA4IGGmyCT3JRRmNyB7JP+Deea1eGFJEeg+37XpdIJLbkYZ1auEPb7fGvVsyN84OxcWtXIQyK91OyHNHdC1YOZ3dMo5x6R8QFyw97oIR48Iw6pn/hNC9XKavZ8e08cis389HlAWiunvYvlfJR38i8RHdt7e9zNOteQVEY2WGOBYASiNjtDzYrFpo+G2JMU2SRxfExm8W3210OGt1fACX+bbmAeRjyuEDLHN7yWKYXNhXh7IbapiqA79MxUfVpqnDofoMWUtSSHhswmNm4xQkO7Ch3MJ5reabAjs7xASsuqUQqpho5Ik/QyleAqhk7wbGzni2Ct1JdXNSs8mhSaMypFKpQTLJ54oUWaKl6qJjwxUg1kNSnH9pGiVZVA+aanALDYXcpneYeFkYVk/9CJLSRcdZ6m444VOZElQKnvVDVOdFD5QmZOs8T9+KULO8kj23/XDEb9DB8auP5PWWWyO6xWfJe4ea4BxhDzzFyA+WNiJ7K829zTPFj/Ugjn3fd0atNnjQEWiQbeVCKcRFN7YJyMxC+H25KGIyTBU5OnPWQmdYs2MsHfu9dDfJkQ+q2CDv3+oBRaIF6RkwP3FDohRIxDzjUA8RFzugQnuxJOTeYH82ZkRWU2syPXhdvzD8d48OzqLFe/DE5WwVKWG3lFT0NPyhZPJyPUz3OnrVlJA4U9f/G/g2+FutvTUyozMc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkxBcmVES2pDeWJUMVY2ZFB2dXNnWHFSdzJ5bVZxRk9iREZuTXdadU9KWXFm?=
 =?utf-8?B?NWVLWFhyZTZ0TnI2Sm4zdThqYkJ2cVBvL2dFaGFZL1VObkJocVk5NDVDdSt0?=
 =?utf-8?B?THljK0d3cTVOdjJYaTd2cE9wUFlEQ0NMUVpiYlQ5UUJWZjRZSi81QWdBalE5?=
 =?utf-8?B?K0poV0JvbjYzWllNYmJsYm1yZVlZRjNsZUtuM01YTExqa2RQdmkzOS9wUUxR?=
 =?utf-8?B?WlEyWWY2bHgxYlN6K0o2NFVRK0lKRmNSTXllM2VFUnNPTER1aTZ1d2lueDh0?=
 =?utf-8?B?SXNrVXZOOCt6NU1TTTlUWE1IVDhHcEJmMUtTanpmTVc3RGZTSkZhNmYyTjlL?=
 =?utf-8?B?d0k3a3B3a0didGNHenZjNHpQZXF0OGFHYm9QczVySGxCa0FTVVVzNDg3ZWtQ?=
 =?utf-8?B?YWlUZmN3QURES3g2YmpqeW9LdmxXWGJFcVZhUTY2Qlcxa1c0TGhvZmplRTVv?=
 =?utf-8?B?UE5RcWxpUzViR1NFem9vZS9ETWpsbGJNQXhRQVF0OS85WUlXZ3pCdnJvK3Bt?=
 =?utf-8?B?Z0dnbDFoWFVVTm5mR29aOFJHcWxIK2xRM0NiYkxnOUVPY3pMbm15dnI3TSsy?=
 =?utf-8?B?UEFHUUNIMndHL2xhMWxWWCtqNWZ3ZDBsZ1BRYmNNVHJiVVFycHNwYVdXLzUz?=
 =?utf-8?B?YS9Gd3hjZmNWeFV1eW9zS3lGbG1QZUpPMEh1VHhyUWYzckxwSDZKYkpMUnlS?=
 =?utf-8?B?UzZhM05CY0diQXJ2bHQyZUg5R05nalFodngraW1sSUVzU0wyR2ZJa01mckE4?=
 =?utf-8?B?bUxoMHlkUmVVcWVoWXZGRjhlajhsMERwOGJlY2hGczVuRmUyTFNwRnhjci9n?=
 =?utf-8?B?dStyVmpQekRlU1V1K05zQUhnNUNSK0NraDhmcHdtTjVnV0wwREhjZmk0cEEr?=
 =?utf-8?B?bDhTY1p6WDhiS1F6SXhJZG81UFRGOTlONjZsenN3aTF4ZEloOTd0YjZTY2pO?=
 =?utf-8?B?ZDYzRDdxU0xuMEhIVFU5N1gxdWp1YkRNUDdzZ2xCS2dLd3lLVExDN09TazVB?=
 =?utf-8?B?VWtTMThhR3R4WnE3UnJ4aHRIOGtKNGZ1MVV4MENtZ0QxVDdJUnBRMUJpYWQv?=
 =?utf-8?B?dG9zWk9laExCTzNaU0NNRXdmY1U5MU5GSHo1M0F0TkRabmpIZEwvQ1VFYjZC?=
 =?utf-8?B?TjYzeWhSem5wNXFML3pPT1BjNVh6bnJhdDJadzJiWkE4WGZNbm1iSUpFMkFE?=
 =?utf-8?B?YW5SWmJZY2FVakJtV3FCNUdGaGpaUHBYSHhidE0yTXF0S3ZnZVc3UTl1cUFz?=
 =?utf-8?B?WkFhemozVmplMGNzV29adjlxU1pTUzBLWHdPejRhaXJaN3hmdWpCKzZBbDdm?=
 =?utf-8?B?S1NMNlEyZzZXZDNWQTg1R3NzM0xJK1p2amg5UWE1eTE4OGZKU0U1WEhwTXNL?=
 =?utf-8?B?WldwcWlwNXdVSUFURE12aGJmdTZVdnB0YU9JeHhyV0dsV09qaFdNRHZ2MjBx?=
 =?utf-8?B?cHRoTXNybTRnYVFMMFFLem5KdHI5KzdTWEdhMUJWclBTTDdLRkFicXQwTG5I?=
 =?utf-8?B?eHJKYUplL1lTMWlwdGgyTVpQaFdEU2czREpVb2VIdmFRL0N6NktYOXAyOS82?=
 =?utf-8?B?c01LZlc3NG5PZitNWHN2WmJZSStodWRTdmtzWDFYTENlb0tmQ01MdytiUzBl?=
 =?utf-8?B?SVpJRG94bjF2RFlTZ0V2TzlOcExBbWVhb3B0T0VXcGcxVjFFSExLNGphQmpX?=
 =?utf-8?B?OWgrcHc0V1YxcXhXT3hyQjhBTEN0RUtIb1FrcDNoR1lGWHZRdDF0bDJQd0Rl?=
 =?utf-8?B?SUhibzZtU2lWRkJZc3lBNFNjNmtnTnZVYlFoYmVpR0VjNmhIbzBaTWJPTVZO?=
 =?utf-8?B?dnBobEtPUm9HZzBkdlhyMjRkaHgyQk1IYThzNEM1dENSOS9tWnp6SjB0Q1No?=
 =?utf-8?B?a0VTaVUvaEpCRy8rbkZSNForcVRuM2E5Q2hVVFFqWkVJL0ZKaml2NXo5cGI4?=
 =?utf-8?B?c0ZwY012T3hKa0QrYVFBdFhVSmk3ZzN6bE1Xd0NDdTNDWTJXOU95VjMzMXdr?=
 =?utf-8?B?L09aSHhjYkR3N0RweWtrUHRFSVczU1R3ZFNBOHFXZTNDdCt3b1BnWTNGRVlm?=
 =?utf-8?B?REpLczdabW50Z0Z6RXlQOE9yTCs1VDZPb3FXaVd3RTd6NW9rVkhvNUZMdjlF?=
 =?utf-8?B?a1JwV3pISWhtUXpVL2xDNC91amtiUHBQM0hodGVaRmFJTXRIMm1USnlBNFhY?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817701b0-77c2-43c0-0671-08dc39167d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:06:33.0658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad71H07UCnp3JGhKnXUawSO3F/Ery2vpjxCilil8WusPWHAZz5IpAaKBtg+12YABcJNuuXMd599Qvt0pzmgHQGOkY9+4lQP1FsQn+qte9ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

TEdUTSDwn5iKDQpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5w
aWVjaWVsc2thQGludGVsLmNvbT4NCg0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVs
LmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjksIDIwMjQgNzo1NiBBTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMy80
XSB0ZXN0cy9pbnRlbC94ZV9ub2V4ZWNfcGluZ19wb25nOiBjaGFuZ2UgY2F0ZWdvcnkgdG8gaGFy
ZHdhcmUgYnVpbGRpbmcgYmxvY2sNCg0KRnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hl
aGFiQGtlcm5lbC5vcmc+DQoNCmNvbXB1dGUgZmVhdHVyZSBpcyBjdXJyZW50bHkgbWFwcGVkIGFz
IGVpdGhlcjoNCgktIEhhcmR3YXJlIGJ1aWxkaW5nIGJsb2NrOyBvcjoNCgktIFNvZnR3YXJlIGJ1
aWxkaW5nIGJsb2NrDQoNCm9uIGRpZmZlcmVudCBwbGFjZXMuIEFzIHRoaXMgaXMgYSBoYXJkd2Fy
ZSBmZWF0dXJlLCB1c2UgaXQgZm9yIHRoZSB0ZXN0IG9uIHRoaXMgZmlsZSB0b28uDQoNClNpZ25l
ZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0KLS0t
DQogdGVzdHMvaW50ZWwveGVfbm9leGVjX3BpbmdfcG9uZy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwveGVfbm9leGVjX3BpbmdfcG9uZy5jIGIvdGVzdHMvaW50ZWwveGVfbm9leGVjX3Bpbmdf
cG9uZy5jDQppbmRleCBjMzcyY2M4MmRiMWIuLmQwMmVmNjJlNDA5ZSAxMDA2NDQNCi0tLSBhL3Rl
c3RzL2ludGVsL3hlX25vZXhlY19waW5nX3BvbmcuYw0KKysrIGIvdGVzdHMvaW50ZWwveGVfbm9l
eGVjX3BpbmdfcG9uZy5jDQpAQCAtMTcsNyArMTcsNyBAQA0KIA0KIC8qKg0KICAqIFRFU1Q6IEV4
cG9zZSBjb21wdXRlIFZNJ3MgdW5uZWNlc3NhcnkgcmViaW5kcw0KLSAqIENhdGVnb3J5OiBTb2Z0
d2FyZSBidWlsZGluZyBibG9jaw0KKyAqIENhdGVnb3J5OiBIYXJkd2FyZSBidWlsZGluZyBibG9j
aw0KICAqIFN1Yi1jYXRlZ29yeTogY29tcHV0ZQ0KICAqIEZ1bmN0aW9uYWxpdHk6IGNvbXB1dGUg
Vk0gcmViaW5kDQogICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQotLQ0KMi40
My4yDQoNCg==
