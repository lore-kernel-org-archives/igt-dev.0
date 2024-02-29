Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65EDC54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F1410E415;
	Thu, 29 Feb 2024 11:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jb53IDad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC110E415
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204795; x=1740740795;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0BFtwy+I6IVKWZ3/fWh7ENLtjNganoAxjBQX53zAxn4=;
 b=jb53IDaduN5wGCw8RewM5/SjwpD+K+iwLTLJmN7SkkEIYn1J/mcNA+st
 aXPjQspyrlY0oZGTXVZ00hQN+xE91vZIAX4c35VzqWQp0GZQfePj3bKqR
 D19nCY5wVJF7wgJ5H+EsA3/EYhHHCAv+9m7qt/Bdx7PNyzrepLJbp8VFM
 rhI5dTHwdMYJRb4v6CSaphgzYU/zRnvkYI1crtqwuYmVOGYb8dzXIM2D5
 xFtcPBkcsXIsq7FQKUnFo04GmHdDRTuQ/nThkXrINAUNFsIhmBUBnjHim
 FemGzI7YWWAfWFJ21cBrqRmq+5V1QsoBJ/Zym8UuPFrNZ3HBWOXg5z8oN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3831180"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3831180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12403746"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:06:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:06:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIiu0bmnFbyYz7lLTtjauThKgzfL+VcXGmnfBabzBN+aK8hlP+7BB6RzIzi+ySDAXR7rxLtnqAaj51fRQ9JVhBV0Rj8Gdg9SnBhgQeiWHtruB/TZT7Hp3aM/uKpLjNLvXCCbAhnupeiRq/7IpD27X7KGKkwMUTLb39EcLkh5Zzw6fGmtFSryUNjLVfqoVWhQWu7qB+qZQ9oR+nP73Y6gjqTNbqMnFenxz7Ntj1s16XMoCgnm87rejdWHswB5Dk9x0gB2Pd57BiuzMoIU+emFKxUGX02ODDHI3eHVMvEO52acPNoUBDGZ8/fpfEja+pDLF+LcXTIndZVGigSHeuwmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BFtwy+I6IVKWZ3/fWh7ENLtjNganoAxjBQX53zAxn4=;
 b=XYFVeI+qaSga6otGFyk0WgPJdQXTBgzdOFbmJ2/NetA/OYvV3RxsCJRCOLt8r4F9YXofs97Yps7Xd5Jzk1ta2rBUylSb4kapG3Fq5E1uc/bCzUXcPpK3gRfAgbAvjrpg1vdSYb4YXlo1kWn1UVUvLCC2kYN1e1ALaXw7zCwvejZah35AhjX5gf/QIz0ju9RT89s4gF9e9MT7rTaf4EH0mwdt+El3hUQeTsz2FsjNmxMGMn/MIC/8nz4tOKX3PQ+vfhyMaxR1iKxC9RoL3mZisE1n0hEqDRYN5eoNCku71Gm5aAgr+CLhMbOL/k5M3iLCF4sjZjLrn4iH0gQ+J3PH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 11:06:26 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 11:06:26 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/4] tests/intel/xe_query: use Hardware building
 block for MultiGPU
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/xe_query: use Hardware building
 block for MultiGPU
Thread-Index: AQHaatzvWtxAzU5GUky/xUwmM6f5TbEhKK6A
Date: Thu, 29 Feb 2024 11:06:26 +0000
Message-ID: <IA1PR11MB60974C71D695373DC184D7EE865F2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
 <20240229065953.538861-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20240229065953.538861-2-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SA2PR11MB5001:EE_
x-ms-office365-filtering-correlation-id: 6c4e731b-6c51-4db0-5a7f-08dc391678ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2DrRlAmsLiA2Trho87M6lBd0J82Z7WEkps+vnb1zm/a07vWXY3cOtp/95a49dOADGTftpl2PLPyFlk/phHY0keU75tYDT+6DsbMrNCgGBHaM0Qod1MdHaOcZHcwsWhEb1tXoeJbJ4b0Spph74ssTHyUdAKQOB85QkcWzG/wrC4IgcWk9ARdcqkMkg34S92Abe3ZDVY8wBZuDFThrCuVIq5kxGZ71eXLnLbd30TAEjHM2oa/o1D4qyQJZQcqe+hAwoRgNMqC9Iwdv3tkb2TzHa3f8hcM84GVfk1dftQvEBN1XDEx3nPGXtkrSvOF3b/Ygc0q2MweODkhA32YODFutFP/fcImZab6TCvXeyxFbwXyDZJw4vhkEnlngx0PL/J5HRc6atEbAhwaimhWzp5biXZFpOh88xTEM0dAVOce/I4NYH5QwOtBTNoXdU0I1JgWWd60YHEPeWN7kJBo7uBJm4WqFFw8JzJQDDm0HnylPdoW9UOqcWWNtPx244sP7QRciq1UcgTZ4DYvZQZwD1X7EvpzhbBH4VB1GRX048EDN5xhaTTJQueV7e36Rvy5m153+tEHD9ZNyzDFykEkJ2DEX3uXVkNd/g/uEVDuvQRupVBnOZiG95nwbiIkkXkAoUTMF6bDv7x8kmR+Qn6hMfjqnmxikhyDXhQreQe90Tp1qSryVa3WTed0lYjlYbC9o0dKRUG83oqAUQB9I97zaK8Mqzq8zUM6inkdePmMuKGDh9jE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXA4WURRZnN0UGVwb0syTE9uR0dhZnVvTUZ5RFk5NDVOK2E5eVEzcHFOenly?=
 =?utf-8?B?OWJ6OWliTmFuL1BkRlhQQklpMWdnVnIzMVZLQzJJVE9wQ1FhOExuN0JnckF6?=
 =?utf-8?B?cXhxV2FlaEgyb0c0NTl4bW4yc0pxT3ZkeVlaMzhXOXRkQ3ZvS3BDVVF5L2pK?=
 =?utf-8?B?cklidkU4VDQ5L2ZnUDE3VURyZWNIOXoxTks1NUNwRWFMcmRPZWxJc0dvWS8r?=
 =?utf-8?B?azlZL3ZMeGt3MDlTRDNPQU5jcndHU0N4TGVoN09Kcmd4T2JCZmR0a0V4RnJh?=
 =?utf-8?B?eGo3SU52TmUyd3llR0Z2K2RuR1p6R3FEd095djJRaE16RDA5eDZ5aWV1OW52?=
 =?utf-8?B?aVdXWTRxWCtLZng2OHZJZjVMZ0VkMVZPM3BWeDQ5NmU0K3NwYzM3NXArY0F6?=
 =?utf-8?B?c0FCMzdxRzhteTEzNHFlNU1SV0MrNHpaQW10MHgwejdJcXprbkxOSEdFcVZq?=
 =?utf-8?B?cnZxT282WEI5c0I2OFlJbzAyZTFER2FFSFpxV0d5dmZQMnFDdVo2ZEFTclJL?=
 =?utf-8?B?T2tTSU1nRjNldmRsRGJFRUttNk1lbWsxK1JqUm1KMGE5RWhkeDNzS3lOTitR?=
 =?utf-8?B?N3VhT3NtVlNWUWdRcTljaWNuS2l3UXE2dFE2N25XWENPRmtVVUdjb2hFaHJa?=
 =?utf-8?B?dEtYQ3ZWMVMxTmRSelE1YXF4WXo5TzFsZG9uMitzYkJ6cHZEK1RiTlZQcGNl?=
 =?utf-8?B?TlF2aGJDSnlHOWxVSXR4NEc1YjdiMVdCSTZpNG9pcFNVVEpQcHpxeUFlSjV1?=
 =?utf-8?B?NUJUaTZIQWg5cUZtQUFLU0JOMmpQdmltMlJ0Yk84bHFuRGxnUUhjNVN3NWMy?=
 =?utf-8?B?LzlER2laNFAyZEZVbE4zRUVYMXJ2ekwrNUdmWTJ5NWZOd0JWK1hpM29UY1JJ?=
 =?utf-8?B?L0JTNzk3dXJ0SWY0VGZQalNFb01EdUtFU3hGTlNOVUNKbk93STRUR3FrRlRZ?=
 =?utf-8?B?WDg5SHRWbEpyS3dOV1BQS0Q4YUtsWGV4ZWxnc3BxOUpKZ09LS1VsQjBGOG5t?=
 =?utf-8?B?QTNjOU5hbVJ1dWQyMmMxcjNtQWt2RGdGYWRMa0ZQRk5kUFNGclJZcFpTR3NB?=
 =?utf-8?B?UHJyYUFXMzNLMU83MVhYTEFFU1dDQ2dzOXdLODFEeEdUK3VpbElSc0ZMYkl5?=
 =?utf-8?B?cG5BbVpPbkd4WjI1VGhQYnN3TGo1ODdPNkJYN3BIa2lNM3dma1JEcXo4ZlBH?=
 =?utf-8?B?Yk0xd2JBQTNCb29kdngyeHN3MFJiNnRHMFdhQ0YvWXErOEJzZ2xHb3RSRUt6?=
 =?utf-8?B?UmNhUVpSWTRCRnlCa08zZ3RPM0Q5V3lSMWZONjJMUGRmMlJrSEpQWTZaL3BG?=
 =?utf-8?B?eEJNK04zcEhVSHBpdFI5ZWRYNDRlR2RzRHg1elJBeDZkOTFyU1ZySERvdkNC?=
 =?utf-8?B?ZUNDVzZNMzcycmdZaU9nUjR0WHBpdTRMU3FiVXo0cnc2aFhQMnNFNkY3ZytX?=
 =?utf-8?B?bTBOU2NxamtSa2p4NWZqWURrNE5JaDdzRys4S3M1TldzbEdrcjBxZVV1a3lr?=
 =?utf-8?B?cUlYWWtvcmM5ZW1GZHZUcWJrK2RFRUZkaHhMMjJKZ240YldOOU85YWdhUmJN?=
 =?utf-8?B?cWtzaVEwOGJIRUVuZ0FyczJSSWl5dkJEeHhQcGZHWmJLMDNDZVBiMWJHVVdL?=
 =?utf-8?B?YW05N2Q0WGRlempXeTh5TUJHbjM4NWpvWVlqYWo0WllzbUZEV051VlNaSVZz?=
 =?utf-8?B?Rm4vbVZUajg1ckpsbDBjRXZQSHE4U3VBSSt6dzgwMUxWL1R5d0dkVUJ0bE5G?=
 =?utf-8?B?NUR4SExlU2xvUEZZSjZtaDBxcVBNVTYwNGtGWFVNR0NmWjNsTWt2a1VJRVlD?=
 =?utf-8?B?T0pZeC9wSlIzRmlOZTIyRk15SjY4OUVwSFpTZHg2c1N6YTk3TGJ1d2w2b1Er?=
 =?utf-8?B?bWFJdGJ6aitKdkZXNm5uL2lBenJ3SEtPUjNoZWlpQUU2SlpDTTJ4UllCY3Q5?=
 =?utf-8?B?bklCd3FQUldmRXg2dFl2cWdIYU1meFYxSFlLNWZSQzI5akJ6RnFTdzhIcE1E?=
 =?utf-8?B?dGpVNGZuTk9OUHdSWG1sMzkxblVvTDlJNFhvNTM5SDBBYTRJRzR2MVMvcjZ2?=
 =?utf-8?B?NHhSekxsM2pXWDVUS1VEU3B6akxOQnd5c2Mxb2IvaE5aNGtnWnZYMll1RFZS?=
 =?utf-8?B?bjlodUVUZUZlL1l0ZjFlTFUxQTBkRG1hOUdIb2VvZ2J1NHE3SlBaZTljQURs?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4e731b-6c51-4db0-5a7f-08dc391678ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:06:26.1742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGe+rQNqGii5QqQsWx1yiUHtevD4k4oi5FOJRRsFcd0VYFK4a6Eb/6TEE9/+ypSgpPnz0/VEyPQyku3qWIOlVaZCCDs3tDyWh0BVJZLtQmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMS80
XSB0ZXN0cy9pbnRlbC94ZV9xdWVyeTogdXNlIEhhcmR3YXJlIGJ1aWxkaW5nIGJsb2NrIGZvciBN
dWx0aUdQVQ0KDQpGcm9tOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9y
Zz4NCg0KQ3VycmVudGx5LCB0aGUgTXVsdGlHUFUgc3ViLWNhdGVnb3J5IGlzIGRlZmluZWQgY2F0
ZWdvcnkgdG8gYmUgZWl0aGVyOg0KDQoJLSBIYXJkd2FyZSBidWlsZGluZyBibG9jazsgb3INCgkt
IFNvZnR3YXJlIGJ1aWxkaW5nIGJsb2NrDQoNCkFzIHRoaXMgaXMgYSBoYXJkd2FyZSBmZWF0dXJl
LCB1c2UgdGhlIGZpcnN0IGZvciBhbGwgc3VjaCB0ZXN0cy4NCg0KU2lnbmVkLW9mZi1ieTogTWF1
cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+DQotLS0NCiB0ZXN0cy9pbnRl
bC94ZV9xdWVyeS5jIHwgMTEgKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcXVlcnkuYyBiL3Rlc3RzL2lu
dGVsL3hlX3F1ZXJ5LmMgaW5kZXggOWE2Nzk5Yzg0NzNhLi41ODA3ZmUzZWQyN2YgMTAwNjQ0DQot
LS0gYS90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jDQorKysgYi90ZXN0cy9pbnRlbC94ZV9xdWVyeS5j
DQpAQCAtMTc2LDYgKzE3Niw3IEBAIGNvbnN0IGNoYXIgKmdldF90b3BvX25hbWUoaW50IHZhbHVl
KQ0KICAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KICAqDQogICogU1VCVEVT
VDogbXVsdGlncHUtcXVlcnktZW5naW5lcw0KKyAqIENhdGVnb3J5OiBIYXJkd2FyZSBidWlsZGlu
ZyBibG9jaw0KICAqIERlc2NyaXB0aW9uOiBEaXNwbGF5IGVuZ2luZSBjbGFzc2VzIGF2YWlsYWJs
ZSBmb3IgYWxsIFhlIGRldmljZXMuDQogICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0
ZXN0DQogICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQ0KQEAgLTIwMyw2ICsyMDQsNyBAQCB0ZXN0
X3F1ZXJ5X2VuZ2luZXMoaW50IGZkKQ0KICAqCWFuZCBhbGlnbm1lbnQuDQogICoNCiAgKiBTVUJU
RVNUOiBtdWx0aWdwdS1xdWVyeS1tZW0tdXNhZ2UNCisgKiBDYXRlZ29yeTogSGFyZHdhcmUgYnVp
bGRpbmcgYmxvY2sNCiAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCiAgKiBT
dWItY2F0ZWdvcnk6IE11bHRpR1BVDQogICogRGVzY3JpcHRpb246IERpc3BsYXkgbWVtb3J5IGlu
Zm9ybWF0aW9uIGZvciBhbGwgWGUgZGV2aWNlcy4NCkBAIC0yNjcsNiArMjY5LDcgQEAgdGVzdF9x
dWVyeV9tZW1fcmVnaW9ucyhpbnQgZmQpDQogICogRGVzY3JpcHRpb246IERpc3BsYXkgaW5mb3Jt
YXRpb24gYWJvdXQgYXZhaWxhYmxlIEdUIGNvbXBvbmVudHMgZm9yIHhlIGRldmljZS4NCiAgKg0K
ICAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LWd0LWxpc3QNCisgKiBDYXRlZ29yeTogSGFyZHdh
cmUgYnVpbGRpbmcgYmxvY2sNCiAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QN
CiAgKiBEZXNjcmlwdGlvbjogRGlzcGxheSBpbmZvcm1hdGlvbiBhYm91dCBHVCBjb21wb25lbnRz
IGZvciBhbGwgWGUgZGV2aWNlcy4NCiAgKiBTdWItY2F0ZWdvcnk6IE11bHRpR1BVDQpAQCAtMzA5
LDYgKzMxMiw3IEBAIHRlc3RfcXVlcnlfZ3RfbGlzdChpbnQgZmQpDQogICogRGVzY3JpcHRpb246
IERpc3BsYXkgdG9wb2xvZ3kgaW5mb3JtYXRpb24gb2YgR1QuDQogICoNCiAgKiBTVUJURVNUOiBt
dWx0aWdwdS1xdWVyeS10b3BvbG9neQ0KKyAqIENhdGVnb3J5OiBIYXJkd2FyZSBidWlsZGluZyBi
bG9jaw0KICAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KICAqIERlc2NyaXB0
aW9uOiBEaXNwbGF5IHRvcG9sb2d5IGluZm9ybWF0aW9uIG9mIEdUIGZvciBhbGwgWGUgZGV2aWNl
cy4NCiAgKiBTdWItY2F0ZWdvcnk6IE11bHRpR1BVDQpAQCAtMzU4LDYgKzM2Miw3IEBAIHRlc3Rf
cXVlcnlfZ3RfdG9wb2xvZ3koaW50IGZkKQ0KICAqIERlc2NyaXB0aW9uOiBEaXNwbGF5IHhlIGRl
dmljZSBpZCwgcmV2aXNpb24gYW5kIGNvbmZpZ3VyYXRpb24uDQogICoNCiAgKiBTVUJURVNUOiBt
dWx0aWdwdS1xdWVyeS1jb25maWcNCisgKiBDYXRlZ29yeTogSGFyZHdhcmUgYnVpbGRpbmcgYmxv
Y2sNCiAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCiAgKiBEZXNjcmlwdGlv
bjogRGlzcGxheSBjb25maWcgaW5mb3JtYXRpb24gZm9yIGFsbCBYZSBkZXZpY2VzLg0KICAqIFN1
Yi1jYXRlZ29yeTogTXVsdGlHUFUNCkBAIC00MTIsNiArNDE3LDcgQEAgdGVzdF9xdWVyeV9jb25m
aWcoaW50IGZkKQ0KICAqIERlc2NyaXB0aW9uOiBEaXNwbGF5IGhhcmR3YXJlIGNvbmZpZ3VyYXRp
b24gb2YgeGUgZGV2aWNlLg0KICAqDQogICogU1VCVEVTVDogbXVsdGlncHUtcXVlcnktaHdjb25m
aWcNCisgKiBDYXRlZ29yeTogSGFyZHdhcmUgYnVpbGRpbmcgYmxvY2sNCiAgKiBUZXN0IGNhdGVn
b3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCiAgKiBEZXNjcmlwdGlvbjogRGlzcGxheSBoYXJkd2Fy
ZSBjb25maWd1cmF0aW9uIGZvciBhbGwgWGUgZGV2aWNlcy4NCiAgKiBTdWItY2F0ZWdvcnk6IE11
bHRpR1BVDQpAQCAtNDUxLDYgKzQ1Nyw3IEBAIHRlc3RfcXVlcnlfaHdjb25maWcoaW50IGZkKQ0K
ICAqIERlc2NyaXB0aW9uOiBDaGVjayBxdWVyeSB3aXRoIGludmFsaWQgYXJndW1lbnRzIHJldHVy
bnMgZXhwZWN0ZWQgZXJyb3IgY29kZS4NCiAgKg0KICAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5
LWludmFsaWQtcXVlcnkNCisgKiBDYXRlZ29yeTogSGFyZHdhcmUgYnVpbGRpbmcgYmxvY2sNCiAg
KiBUZXN0IGNhdGVnb3J5OiBuZWdhdGl2ZSB0ZXN0DQogICogRGVzY3JpcHRpb246IENoZWNrIHF1
ZXJ5IHdpdGggaW52YWxpZCBhcmd1bWVudHMgZm9yIGFsbCBYZSBkZXZpY2VzLg0KICAqIFN1Yi1j
YXRlZ29yeTogTXVsdGlHUFUNCkBAIC00NzQsNiArNDgxLDcgQEAgdGVzdF9xdWVyeV9pbnZhbGlk
X3F1ZXJ5KGludCBmZCkNCiAgKiBEZXNjcmlwdGlvbjogQ2hlY2sgcXVlcnkgd2l0aCBpbnZhbGlk
IHNpemUgcmV0dXJucyBleHBlY3RlZCBlcnJvciBjb2RlLg0KICAqDQogICogU1VCVEVTVDogbXVs
dGlncHUtcXVlcnktaW52YWxpZC1zaXplDQorICogQ2F0ZWdvcnk6IEhhcmR3YXJlIGJ1aWxkaW5n
IGJsb2NrDQogICogVGVzdCBjYXRlZ29yeTogbmVnYXRpdmUgdGVzdA0KICAqIERlc2NyaXB0aW9u
OiBDaGVjayBxdWVyeSB3aXRoIGludmFsaWQgc2l6ZSBmb3IgYWxsIFhlIGRldmljZXMuDQogICog
U3ViLWNhdGVnb3J5OiBNdWx0aUdQVQ0KQEAgLTQ5Nyw2ICs1MDUsNyBAQCB0ZXN0X3F1ZXJ5X2lu
dmFsaWRfc2l6ZShpbnQgZmQpDQogICogRGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5IHdpdGggaW52
YWxpZCBleHRlbnNpb24gcmV0dXJucyBleHBlY3RlZCBlcnJvciBjb2RlLg0KICAqDQogICogU1VC
VEVTVDogbXVsdGlncHUtcXVlcnktaW52YWxpZC1leHRlbnNpb24NCisgKiBDYXRlZ29yeTogSGFy
ZHdhcmUgYnVpbGRpbmcgYmxvY2sNCiAgKiBUZXN0IGNhdGVnb3J5OiBuZWdhdGl2ZSB0ZXN0DQog
ICogRGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5IHdpdGggaW52YWxpZCBleHRlbnNpb24gZm9yIGFs
bCBYZSBkZXZpY2VzLg0KICAqIFN1Yi1jYXRlZ29yeTogTXVsdGlHUFUNCkBAIC02NjEsNiArNjcw
LDcgQEAgX19lbmdpbmVfY3ljbGVzKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmh3ZSkNCiAgKiBEZXNjcmlwdGlvbjogUXVlcnkgQ1BVLUdQVSB0aW1lc3RhbXAg
Y29ycmVsYXRpb24NCiAgKg0KICAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LWNzLWN5Y2xlcw0K
KyAqIENhdGVnb3J5OiBIYXJkd2FyZSBidWlsZGluZyBibG9jaw0KICAqIERlc2NyaXB0aW9uOiBR
dWVyeSBDUFUtR1BVIHRpbWVzdGFtcCBjb3JyZWxhdGlvbiBmb3IgYWxsIFhlIGRldmljZXMuDQog
ICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQ0KICAqLw0KQEAgLTY4MSw2ICs2OTEsNyBAQCBzdGF0
aWMgdm9pZCB0ZXN0X3F1ZXJ5X2VuZ2luZV9jeWNsZXMoaW50IGZkKQ0KICAqIERlc2NyaXB0aW9u
OiBDaGVjayBxdWVyeSB3aXRoIGludmFsaWQgYXJndW1lbnRzIHJldHVybnMgZXhwZWN0ZWQgZXJy
b3IgY29kZS4NCiAgKg0KICAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LWludmFsaWQtY3MtY3lj
bGVzDQorICogQ2F0ZWdvcnk6IEhhcmR3YXJlIGJ1aWxkaW5nIGJsb2NrDQogICogRGVzY3JpcHRp
b246IENoZWNrIHF1ZXJ5IHdpdGggaW52YWxpZCBhcmd1bWVudHMgZm9yIGFsbCBYZSBkZXZpY2Vz
Lg0KICAqIFN1Yi1jYXRlZ29yeTogTXVsdGlHUFUNCiAgKi8NCi0tDQoyLjQzLjINCg0K
