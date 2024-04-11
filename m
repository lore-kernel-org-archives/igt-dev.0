Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997C8CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6C10EFCA;
	Thu, 11 Apr 2024 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyR8Xm/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D042C10E5D0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712830519; x=1744366519;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vAFA5DeE0IU6J30HP5ovzwRWdkiNFzGQNgydG5xkIi0=;
 b=SyR8Xm/mx44mStPp84lGaJJvpx+3AJsr6F3qmFBy/XZa4wNgHxfNnpHt
 ky0Vyvwu39ZEFZYtaGR/sLh+tBMoqnY6Yq8y78of2yEVu71Izw9Cop5/2
 yAhkQXRN3MR5XuTrw9UD0vsHIO6aXPLtqfc37bEziZVLK4XKm0uRsdi7o
 ZTKfg5seLPeBwQ/B2+RC4SBGJBxA0WJnSMyuwcbwrHrN5Jrq95vsffghh
 DWAhtsl0TWTOI0hM5lBWVKgP9PYMqH7FibiN9Bxk94fSSDf8VUlnbl2Tb
 God3BSsdbII/1udlm7FD28k8XMLrnRCY4S34VaHzrgfiRuFLvRYcFrj41 w==;
X-CSE-ConnectionGUID: wQEHw9FzTM2incx+/xE4XA==
X-CSE-MsgGUID: tloFmnuVS4KYeBZLyYdRew==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12021932"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12021932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:15:19 -0700
X-CSE-ConnectionGUID: NTFy4aVYS4O0YJTircBrhg==
X-CSE-MsgGUID: mH7JjpW0T5Kc12/7hQMqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20907748"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 03:15:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 03:15:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 03:15:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 03:15:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 03:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZvVkUy7ngisSKOJt4ivW+HxErLCFFbMidfElSZIsXvXkhWui4R9gXPxXRcXRlp8oIAtFDPOjvfw3vOMp/SSVIEK8U4uPxdXu2SxTJBmwthGtNiLH8mrSb/BhWE/7tBS5GMGzXLZMwobathtpYIga7Dhx9RReWCYIRG3p7jFYwsQ+Nm79AFsW1uUQ7uaYZHgPRpcE9p9I3xDyUEuZYTtHA7wAaE3IIEDj5X9HYS27bnIDMzKW+LsSQ2zGo1q6CvUSBAsg5htraN1Sg4qcsRRYyqS0hoQDZCbLXaiilY8i45ZFUOAowHKUYe6oIgGDLZ7rMB2cV3XJdujwk4JDqeNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAFA5DeE0IU6J30HP5ovzwRWdkiNFzGQNgydG5xkIi0=;
 b=Ai9WWTETyl5p+ZmrPr4Rxpwwvwqe8A9jOuJQJStyaNh5VS5JgXGJR6xStqpaTe7z90A0c9Biul4QQBf5l60e84cNyM4ToqPOgxi17hMw+SYXz7LGFildqauDLyRa/GR3eVzIZcLqVu9rjaEqbE8Qx8d+TNqCp3pfTs9NIN1UvHO5q6whyuJFlrepCyHHpXzjCbgJAGyvFqq/8k7gE/1aubY7jAN69YuPOhpZomajAndTPA96/2NT08ofjMs44x48nrjzP5/N4JdjLnxY6uY7mZ91M25uoyqzn5a5HBkFZA82NwQjFRm5l0cUPMecJyAqzrqjeZkeoLXJqjeTdgKKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Thu, 11 Apr
 2024 10:15:16 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 10:15:16 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_async_flips: Allow the first async
 flip to change modifier
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_async_flips: Allow the first async
 flip to change modifier
Thread-Index: AQHafJjP0xFa9eAEmUycoNERCcDwurFi+NMQ
Date: Thu, 11 Apr 2024 10:15:15 +0000
Message-ID: <SJ0PR11MB6789662A8244240306843BE98D052@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
 <20240322203726.16637-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20240322203726.16637-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|DM4PR11MB5293:EE_
x-ms-office365-filtering-correlation-id: 77d19ca9-0cb6-44c3-384d-08dc5a104864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rsC5apLXz9O9jl/+3SBOuoratxo3ELJxKOLE3vp5etd08wb6VcQ6Vdhlv9ywfQI2OuD7FJdb1NwhQXZbKeBZ/ZZ9WsTt0yPV9KnMHcxaMv1md8NIlLK11UwFmp0Lk4BqDmY33pjlhjuK5ZlP9iTyg4ZA08e86sxigvLNk8z4ybBb97fHDtyOOYTL0odnaufIwyzhmcXShD86tCYwhchpUcg2luz91lsNOaUeCcaK5SQ1XSKs1Z7JQG1iTfZMmOEwindhDD8ZbxEm8s6gLHGLYNYY9eLVPardXpNgBDO/1cGNkK2rwS+GTWg4cXdiP4fglkfLC2A+2br2wzGM4/bn52f2zTiSe4T7NUW+sj+Cerqs8n6y4C0szH/fhPGWx9g4WIqo2I9PCLCW9FUtci6vwd68XM7dQFDewiSd+qGDs9EtklhZeQoOe7VQVhvetXsqDYkh029NxHV6A5BA/zDRKJJK6iCloHWyav68l0TvaHRdDdzk7oncIp4e2naPlpYTM46d9d8mqe1uryLsTT6Ujmt/d2vZtqaJCswG8xmorTOXEdKXJy62QYZRalTayUyWr7+wLY6GlvpeaMi5CMf9OUEg49Wth+eNPYDwz4K5TN6a9IigCXtGnUlRvMiMARf+14Y5lX+xZ8qXRNUmzcShbIq8t9dnONtRTtMoPpehOW6GMREQqW81dA9BUteIdfjs+PgiM4OgWpbj+tzpIuCICpNFW0rPLSaiG4L13QWNYqM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1hMRGx4OTJjU1QwUC9sS2pJMVpuL1crMWNjU3V6SUZ2ZTBibnE2VGlWREhU?=
 =?utf-8?B?RFZPZXFFNTFwMGpjZkJRdWRJeVAyaXkvSjR6TDM4TFZHUGJIRTE0ZGxqYmVl?=
 =?utf-8?B?TEFPSFFmZk91am9ZNk5kYlFGKzg2S2dWV3ZwSjhIVEtyOWNrOXhia3Y4QS9O?=
 =?utf-8?B?M29zMGllelRFOEhTQ3ZCanBVQUlnZlovQ1Y5a2hCQkk3MENldFAvcStvYXA1?=
 =?utf-8?B?SEZINEtxeDJWUWMrSjdwbk9IQnpzYjdlaVIzdGI3YlYzd0pqY3podUF0aU5Z?=
 =?utf-8?B?MlJyR3VkUXNVaTRLN2NtbTd6aVl5M0IrdGxpTGs5M0tRQklCb09uQWVCTjBF?=
 =?utf-8?B?d3VBS3lrVDk3bG9XSlBxRkwxb2doS2hWTlBWaWhIaGp1K3ZlZEpBYnNmM2dD?=
 =?utf-8?B?QTVFdDFrbXhSeEVPV2xwaElmV1AydlVVekRDd0Q1UHNXZDNDMS9zbHlWSU9l?=
 =?utf-8?B?bC9KYjROdlF6N0VleEh2VU5DVGhKQU5RNU5IeGY5WVk2bWl0cVRYdjExa2tO?=
 =?utf-8?B?WkJ0UXNOQ2RqeDZUNVRvRmdmZ1A2bndoNFFrSFFyc1BmQ2kwdzFKL25CT0J2?=
 =?utf-8?B?amNCTTBmRXpBYmNEOGI0RHFZZnEzUDhZc3NKU0VEOTl4dmxjTWFlbmxmR1Jp?=
 =?utf-8?B?clBPMDY2UStOOXNsUUFseGUxMFkzRTgrQkN2eGsvSUsyVFpRcXFzQk5SeUJm?=
 =?utf-8?B?WHdhNWphRDI2eVhyOWpaVWRLYnd6WVUyeVh0VUxjbEVlZkJxa3o0K2x3MGE5?=
 =?utf-8?B?TVBpSUpLc2xZRlVtTmxwQmt1QjlUMVZ2MHEyd1VDdDhzRG1DblE4bDl0ckxC?=
 =?utf-8?B?YWVJY3NSbTlxU2wyMTVjcEttTnJTblc0M1Q5cGhKdm5aZmROaDBYdlN0M284?=
 =?utf-8?B?d3JHOEMyaW52RzNoSm1YT0xOVTI0dkxscWE1WEswZUhXNUZSNUtlM25qc25k?=
 =?utf-8?B?ZWtuaTBwSGNvYTE0MU1vRmZPTTVXeVRYOVMrZk96Vnhwbk11WFV2M2x5Y2F6?=
 =?utf-8?B?NHQyaW9heVBlNjFUaHRTOUVTRXZCejNMSjNCbDJsZ1dwelo1V0R5UlF3aGxJ?=
 =?utf-8?B?RkJOS3NqT3B5bTFOd2RJRTBBNmthOGhraE40WTNXakQ1Q0pDM2FuakF1eHBN?=
 =?utf-8?B?TC9VN1pqeXlzcSt1bWVDTVFnbUJXdnBFZGVONnFpbTVWTkZ4SXN6aVBYWklx?=
 =?utf-8?B?dG56MndTVmxpYzk5eXBYck1iVEhDRnNLWG9NcW0vVkR5WDhlTDYzUExVT2Fi?=
 =?utf-8?B?aFg3N0M5WWREUkJXaGdZTlQweTU4ZFlneFI0MEFxUXhZcFpvSFJoOERzR0xC?=
 =?utf-8?B?MlNLSmQzd3piMlR5ajBpR2hJZU1Xb1NYc3RFVGt6L2hzQnloU241cVpFMXN4?=
 =?utf-8?B?L1p3SjRiOUF1MXNsdU02LysrY1pzL3NiM3R2NURsMkp1Z0NMQWJQNVBEbkM0?=
 =?utf-8?B?SUFtNzBURW01eVZOaVFGQjBHcFIvb3RZUENuUEJ0VE9ZU3NOMXd0djhMRnBF?=
 =?utf-8?B?QUlBdFh0KytUR3IzQzRlRklqMDZtSmFqbjB1TERINCtKTzk4bjdMNTUwelda?=
 =?utf-8?B?S0tyeG1FSEZCMCtHQ3BBVkQ0L29XQWcvZ1R2WU5WVUMxYStQUmRQRlBHYjdY?=
 =?utf-8?B?WW5LOTR5VlFlNkdOZXdCZkVUYytPZ1VEOGZ4ME9xR2RjVGF0djZTM1JGSE9h?=
 =?utf-8?B?QW5aQy9sRVBDZWZLdWt6NFhIVjhPekpPU3pVOU9CRHdyUW8vWWIvVk5Md3pM?=
 =?utf-8?B?QThRVlpLRk5peTB4MWkvNFdyNUxWdWl5ZGp0Z2F1U2htV0ljQmMwVFVMRmI5?=
 =?utf-8?B?QWpCY3R2Tk9NaTlzcWM2RmhZcXU2TlJ3VWphNGtFeEM1YU9lV28vaFBmeld1?=
 =?utf-8?B?NjRCSjZPUEtxWkN4RStUMFY1OUhycTd4T1RQdVRqVFdSZjlCUTRlNU1uc2Na?=
 =?utf-8?B?R2JxR0taWFB6b05relY4SnBzNkdmSlVHTEJ3VWRMWFFKUDhnUy9FYnBYb0pB?=
 =?utf-8?B?M045dTU5VnVtdWduSkwwblpza1lmSUZTZEhCMHVnQWM2RXpSazBaY0Vzczdw?=
 =?utf-8?B?THhhcDF6S08zNTNvbUkxblZZcTlqSjBjODN4amc3QmdpTDlhTjRZb3AvTDRL?=
 =?utf-8?B?YS9JeTJ0bW9CeGJEU1RxQnFqdFdIalA0N3JaUEtRTTFWNlJyQkhNYXNCWStI?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d19ca9-0cb6-44c3-384d-08dc5a104864
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 10:15:15.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WK+iCnNOb4yVTNsPii3STOn34PcrXgMy7xW1f/DYVqgq0iuxoQQPP7ouLTfQUX+Ne7pqSAuncrGhppd2tctdbM9TvF+0LkCGlJW9ICzOX7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUNCj4gU3lyamFs
YQ0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMjMsIDIwMjQgMjowNyBBTQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIGktZy10IDIvMl0gdGVz
dHMva21zX2FzeW5jX2ZsaXBzOiBBbGxvdyB0aGUgZmlyc3QgYXN5bmMgZmxpcCB0bw0KPiBjaGFu
Z2UgbW9kaWZpZXINCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+DQo+IA0KPiBUaGUga2VybmVsIHdpbGwgbm93IGFsbG93IHRoZSBmaXJz
dCBhc3luYyBmbGlwIHRvIGNoYW5nZSB0aGUgbW9kaWZpZXIuDQo+IFRlc3QgdGhhdCBpdCB3b3Jr
cyBhcyBpbmRlbmRlZDogZmlyc3QgYXN5bmMgZmxpcCB0aGUgYXR0ZW1wdHMgdG8gY2hhbmdlIHRo
ZQ0KPiBtb2RpZmllciB3aWxsIHN1Y2NlZWQsIGFuZCBzdWJzZXF1ZW50IGFzeW5jIGZsaXBzIHRo
YXQgYXR0ZW1wdCB0aGUgc2FtZSB3aWxsDQo+IGZhaWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCg0K
TG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRh
Lmt1bGthcm5pQGludGVsLmNvbT4NCg0KPiAgdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgfCAyOSAr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Fz
eW5jX2ZsaXBzLmMgYi90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyBpbmRleA0KPiBlZmJjODc3OGQ3
ZTEuLjFjODBlOTUxNDllYiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMN
Cj4gKysrIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMNCj4gQEAgLTQzOCwxMCArNDM4LDggQEAg
c3RhdGljIHZvaWQgdGVzdF9jdXJzb3IoZGF0YV90ICpkYXRhKQ0KPiANCj4gIHN0YXRpYyB2b2lk
IHRlc3RfaW52YWxpZChkYXRhX3QgKmRhdGEpDQo+ICB7DQo+IC0JaW50IGZsYWdzID0gRFJNX01P
REVfUEFHRV9GTElQX0FTWU5DIHwNCj4gRFJNX01PREVfUEFHRV9GTElQX0VWRU5UOw0KPiAtCWlu
dCByZXQ7DQo+IC0JdWludDMyX3Qgd2lkdGgsIGhlaWdodDsNCj4gLQlzdHJ1Y3QgaWd0X2ZiIGZi
Ow0KPiArCWludCByZXQsIHdpZHRoLCBoZWlnaHQ7DQo+ICsJc3RydWN0IGlndF9mYiBmYlsyXTsN
Cj4gIAlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQo+IA0KPiAgCWlndF9kaXNwbGF5X2NvbW1pdDIo
JmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXkuaXNfYXRvbWljID8NCj4gQ09NTUlUX0FUT01J
QyA6IENPTU1JVF9MRUdBQ1kpOyBAQCAtNDUxLDE3ICs0NDksMjggQEAgc3RhdGljIHZvaWQNCj4g
dGVzdF9pbnZhbGlkKGRhdGFfdCAqZGF0YSkNCj4gIAloZWlnaHQgPSBtb2RlLT52ZGlzcGxheTsN
Cj4gDQo+ICAJaWd0X2NyZWF0ZV9mYihkYXRhLT5kcm1fZmQsIHdpZHRoLCBoZWlnaHQsDQo+IERS
TV9GT1JNQVRfWFJHQjg4ODgsDQo+IC0JCSAgICAgIEk5MTVfRk9STUFUX01PRF9ZX1RJTEVELCAm
ZmIpOw0KPiArCQkgICAgICBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRCwgJmZiWzBdKTsNCj4gKwlp
Z3RfY3JlYXRlX2ZiKGRhdGEtPmRybV9mZCwgd2lkdGgsIGhlaWdodCwNCj4gRFJNX0ZPUk1BVF9Y
UkdCODg4OCwNCj4gKwkJICAgICAgSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQsICZmYlsxXSk7DQo+
IA0KPiAtCS8qIEZsaXAgd2l0aCBhIGRpZmZlcmVudCBmYiBtb2RpZmllciB3aGljaCBpcyBleHBl
Y3RlZCB0byBiZSByZWplY3RlZA0KPiAqLw0KPiAtCXJldCA9IGRybU1vZGVQYWdlRmxpcChkYXRh
LT5kcm1fZmQsIGRhdGEtPmNydGNfaWQsDQo+IC0JCQkgICAgICBmYi5mYl9pZCwgZmxhZ3MsIGRh
dGEpOw0KPiArCWlndF9wbGFuZV9zZXRfZmIoZGF0YS0+cGxhbmUsICZmYlswXSk7DQo+ICsJaWd0
X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgZGF0YS0+ZGlzcGxheS5pc19hdG9taWMg
Pw0KPiArQ09NTUlUX0FUT01JQyA6IENPTU1JVF9MRUdBQ1kpOw0KPiANCj4gKwkvKiBmaXJzdCBh
c3luYyBmbGlwIGlzIGV4cGVjdGVkIHRvIGFsbG93IG1vZGlmaWVyIGNoYW5nZXMgKi8NCj4gKwly
ZXQgPSBkcm1Nb2RlUGFnZUZsaXAoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5jcnRjX2lkLCBmYlsxXS5m
Yl9pZCwNCj4gKwkJCSAgICAgIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQyB8DQo+IERSTV9NT0RF
X1BBR0VfRkxJUF9FVkVOVCwgZGF0YSk7DQo+ICsJaWd0X2Fzc2VydChyZXQgPT0gMCk7DQo+ICsJ
d2FpdF9mbGlwX2V2ZW50KGRhdGEpOw0KPiArDQo+ICsJLyogc3Vic2VxdWVudCBhc3luYyBmbGlw
cyBzaG91bGQgcmVqZWN0IG1vZGlmaWVyIGNoYW5nZXMgKi8NCj4gKwlyZXQgPSBkcm1Nb2RlUGFn
ZUZsaXAoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5jcnRjX2lkLCBmYlswXS5mYl9pZCwNCj4gKwkJCSAg
ICAgIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQyB8DQo+IERSTV9NT0RFX1BBR0VfRkxJUF9FVkVO
VCwgZGF0YSk7DQo+ICAJaWd0X2Fzc2VydChyZXQgPT0gLUVJTlZBTCk7DQo+IA0KPiAgCS8qIFRP
RE86IEFkZCB2ZXJpZmljYXRpb24gZm9yIGNoYW5nZXMgaW4gc3RyaWRlLCBwaXhlbCBmb3JtYXQg
Ki8NCj4gDQo+IC0JaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7DQo+ICsJaWd0X3Jl
bW92ZV9mYihkYXRhLT5kcm1fZmQsICZmYlsxXSk7DQo+ICsJaWd0X3JlbW92ZV9mYihkYXRhLT5k
cm1fZmQsICZmYlswXSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgcXVldWVfdmJsYW5rKGRh
dGFfdCAqZGF0YSkNCj4gQEAgLTcyNSw2ICs3MzQsOCBAQCBpZ3RfbWFpbg0KPiAgCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pYygiaW52YWxpZC1hc3luYy1mbGlwIikgew0KPiAgCQkvKiBUT0RPOiBz
dXBwb3J0IG1vcmUgdmVuZG9ycyAqLw0KPiAgCQlpZ3RfcmVxdWlyZShpc19pbnRlbF9kZXZpY2Uo
ZGF0YS5kcm1fZmQpKTsNCj4gKwkJaWd0X3JlcXVpcmUoaWd0X2Rpc3BsYXlfaGFzX2Zvcm1hdF9t
b2QoJmRhdGEuZGlzcGxheSwNCj4gRFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gKw0KPiBJOTE1X0ZP
Uk1BVF9NT0RfWF9USUxFRCkpOw0KPiAgCQlpZ3RfcmVxdWlyZShpZ3RfZGlzcGxheV9oYXNfZm9y
bWF0X21vZCgmZGF0YS5kaXNwbGF5LA0KPiBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiANCj4gSTkx
NV9GT1JNQVRfTU9EX1lfVElMRUQpKTsNCj4gDQo+IC0tDQo+IDIuNDMuMg0KDQo=
