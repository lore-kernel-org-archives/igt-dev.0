Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BBCCD187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A4C10E552;
	Wed, 18 Sep 2024 07:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPUxbWP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7310E552
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644986; x=1758180986;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Urxaf1iWZK8jI2Rr+VST/GWJwlYJTMZdqciNpR9cF98=;
 b=FPUxbWP+bzag96lqzsiQ2/NIZ2pMsLFKmbzlsIcaQgT68x9NS8n9qIsE
 sVL0ORDvjaUZFQThLKY/QCIuoAs+VCwcFYQ4DNPCHX0HeVGADY/Rf7V/s
 oIahVdgeKrSVYuJBv0z98Qr88SAUXAs1F/O5ejp48ghuZPCYsipf6kkMs
 5SqExCRJyLMkPs/uwH5PciTu7tnbaruT1G+iLNoYsfe/M6087hd6rUmzE
 DnqqZtgxAmd+st61TOpx2LPV2zLkPsug9wuVLAebjroA58b4L6nXwlH27
 NrYfD8I72Nh8iEuR+BLmZv2YoA/SR2OOBAzsoFna1ZRAy7O+r6S3cbW/u w==;
X-CSE-ConnectionGUID: YySyboBgRA25DlSiKOLZyg==
X-CSE-MsgGUID: /hXYBLDGRyep5dQr9zML+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36122732"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36122732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:19 -0700
X-CSE-ConnectionGUID: WVw8Ig/qTbiemHXZ2RPApQ==
X-CSE-MsgGUID: wiPIKP6cQtSCZFHIyhxDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69452993"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 00:36:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:36:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:36:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:36:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9fTVbNLNS3oh2l1n62VQtYXeezOE0UEeR9SaOb26MsYZtJJW7O+g8TLWXyov0w/MIjzJoaWF2Eknmba6wlRbuV9G6cxu7UTBwr2t9UvJCUTTBhxugPmqfql1ivXxiHpvX7TbDslKjNPfxrOcUvzGeENHZy/gohklLWY0/8Qs7zRsXHzIiS7XwpjGg7J8yzhB/v6E+BykdXXn3IZhdxXjh5kr5ifd3XUsLkm0rYjRk3cEQF/KTMXkFYw6GmpBP6DlY9n5CAm4M6D58Wmdtc5mBRJC8PaHGsLUX/VpCqn0iW1nfsxP6yXSGwu08G9CmH60WIi0pSGSo6vN12kk3OPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Urxaf1iWZK8jI2Rr+VST/GWJwlYJTMZdqciNpR9cF98=;
 b=fDGwglnEljfIQ0YtSuPboXTZ8Rn3/E3zbbxqz3xRGF0mHt+MJsQyOH0JLQQThi4MgOkIfKC68y48oInVlhs6tuLQy0CkeqS4fxKxTf0bNhD/8i2mYYTwZM6zYDc+m6TF8jX+Oh0hKQQYwnkQTqOud2DsmnLUwLxmVtux8C8ndpt7E3dSltHF6NFpi9HWCQB5Luz3aerD2OCKpQYr6qY5XE/YkdcLLJFCrCU5LxM3CXzXayRSJrccHbYGGZa1YXqXB8uLnj14w1MlxwOmsK7C8OHV1ZqtEEUDr1nb3EGRC1nW2Pvu/bEoF0LNwRhrlKQ+Pbsk6XnEgiQHno5igLr7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 07:36:13 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:36:13 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] lib/igt_psr: Fix PR state check for
 DisplayPort connectors
Thread-Topic: [PATCH i-g-t v3 2/2] lib/igt_psr: Fix PR state check for
 DisplayPort connectors
Thread-Index: AQHbBIiy0noRw06j00ar0PG2+OFPubJdMc0A
Date: Wed, 18 Sep 2024 07:36:13 +0000
Message-ID: <864cdc02b98299644469540a39ed2fa3ac583b29.camel@intel.com>
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
 <20240911202408.1665929-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240911202408.1665929-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: 7926d1c6-91d9-471f-9440-08dcd7b492b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WXdGQlA1SmMzSHRRdU9tMWk1YWpER3FoVFdRaXRjWjYwMERxdHVqQ3VMNjZN?=
 =?utf-8?B?T2hsQnZNRHhMb3AwcGFEc3dBUW5zbkFJbk8zbThPVjYwM2d1UjFzc2JoNlR1?=
 =?utf-8?B?bE5JQzZMTnVvWUs0eW1lbEhwN0wrTHJnSTYyNzEvU1ZjTUw0bkFsejJrQ25t?=
 =?utf-8?B?ODlqRTFRNFIzVkdYWFZudVFuZ095djhrM1hHaW14UUhuQk9OUXM4TFE5R1Z5?=
 =?utf-8?B?RDNUbEtRSDhPTWtBZkZ0Ym5HSUl6S1FPQkUxRU1QUlRWNW1hMjVQVk82VHU5?=
 =?utf-8?B?dVI3NmZUZzdZU3p6QVVJWmR1dnJCMnBQTllRTlphek1xVlB3c2JVdHJjWUQx?=
 =?utf-8?B?NmhnNnF5SW9ocVVVeGRoNlBCTTdQTDU5bEVQdUdjWUFBbFhNNU85VHg4bnNy?=
 =?utf-8?B?aFNlVDJ4T1Rnd0xITWhycUlmbjNqaVphYW9mN1A4NEY1bW1kWXFCSTVoVzJO?=
 =?utf-8?B?QjZCdUxjbmNtcUVXdnJpUWpWOU9JTHNkRHpNVldGMUcwdHZWcFowN3hjRExo?=
 =?utf-8?B?NEN0TGJCZjZCVG1xaXAydFQxWWtmcDJHMlRoelRMY3ducnNDSEN3NEdsaHNS?=
 =?utf-8?B?eUlUQVo2RXN4T2ZUSndwazc5MXZLcExwc09zNElIb1RuclBMY2lhQjI0ZHNo?=
 =?utf-8?B?TlFsMTcrYlNDN3FQSUtudFBZZmpNRDNiemdicFBFbldiU3FWSlU3RmJLNTAv?=
 =?utf-8?B?NjFDY0hKYUFkVVp6MXVaeVBDc3Q2bW0wRnExRC9kOW5FdjZ0bkRhQ05LeTlX?=
 =?utf-8?B?N0VCZmRxZW1yN1h1MG11RXorSHJ2aFRaMDM3WGVpYnpKb1g1VlJEN1FydDFh?=
 =?utf-8?B?WFJCSk9SL2xEZjFNSHJNS1Ftb0pUUEdtaStudmlnUDdSdFZIdllBWmpZMWwv?=
 =?utf-8?B?SmttaHd5Y3FFOWhJRUFObjdSQm81d3U0SWwyYUNOeUkxWUdZbC9KU1A4OU5O?=
 =?utf-8?B?eVFLaEhRNDB3a0EwRFNQSFAwY2lkSG10ekpBcUUrOEtyVUJ3UVBFVTkzVjBI?=
 =?utf-8?B?dnN6V3ZVUUhNdkpIY2hsYzZtYmRhZ2xJNUU4dExVVVVGeDJGRDdYWC9waXhi?=
 =?utf-8?B?VTZkTGxCNUh1TmtKV3hCQTU5YVNWVG9vTHBkRi83bGJQMkNUV0x1MW1GU3la?=
 =?utf-8?B?MnExZTZ3Vkc3dmNSUVdYckRCSENWSnVvaUxPWDNlenljMThDRzY5MFNucmFj?=
 =?utf-8?B?cXdldzVMUHZnSFRTbGJEVlBNRjQ4K2lMVHN0aDM4VU9TSjJKTGZIWTVlOHFV?=
 =?utf-8?B?L0lpWVZYbWdFdnNSUER1aGlmS00xdUNXaC85ejhZRGo5MFYyVEVxMHlhdmxq?=
 =?utf-8?B?azBSelNSTFE4N3RlT3FkYmwvVGlHS1N4SFNvWVZpVTFyN01yYm80TEZocFRM?=
 =?utf-8?B?WERNTXdOSGt0TVZkRTBOYVJESUxmdTVKSU1kOHNSV3RnUkNENUYxTUlaa1JD?=
 =?utf-8?B?UnRNWkNjaStOY00zVnlFRHhkNHlHSDdJSXpsY1B3Qno2TUU2R3ZFV1kzZHFL?=
 =?utf-8?B?NVRXRzZFN3lsOXQwbXAzT25TcXI2L0RaYUFnTTc5Zllsa0J1R25mckRCUkdT?=
 =?utf-8?B?WjRIbWQxeWM3aDNhTzVielJnbjcwVzRxZldXdDl5ZnVoVW5mcWtGNnpCTlR5?=
 =?utf-8?B?ZUFUL2dyTGkvMXpPS0h1a3Y5K0lVRHJwY3FHNzdMZTZaRnFzSDFRTjBOWnVz?=
 =?utf-8?B?U0RuR0xUK1g0UDZxT2lXdlVPa29RenViNlo4SzZUZGRZZVRudzFva1BySXg3?=
 =?utf-8?B?TzNzWS85WFQzeTdhTU16czg1eG9kQm9xd0Z2dkNPQ3NzSFFxdXhOeFZyTzc4?=
 =?utf-8?B?S1hsSlc2b0xCUWVSZ2dVSkJoRDFIOWVYVE1wRlEyNENNWWhCS051NXdSZ1Ir?=
 =?utf-8?B?L2xRbTY5OXpDWG1QNGRYandwRHpZTlcvWll3WElUeW8xTkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWlKU3FETzdrZmZTSEJNcEFyRTFDMDJHaDhqSnVGVVFZbEhvZ0piSjJwdmJE?=
 =?utf-8?B?NmpVU3pkeWpIR3E0U2xpV0tGZ3prMGY1czNYMGVROGFGbG8zeng5SDEybUdD?=
 =?utf-8?B?WTdhdVhiTFl1bVkwTWJuUVMvYi8rMitva1N1a1NsckVYY0QvcG94SzlXZE9X?=
 =?utf-8?B?Mjh5UUFsNTNsVjNYV2VrcXpVdjhQY3p5SDRLcFo2Z3pNU3JsWkNMQktqQUxk?=
 =?utf-8?B?SEtYSjUzdDJOQTljTjM5cGoxcW5aVk9UV1ZuRFZEbXFSeXFrcEI0Z0l5SWJ2?=
 =?utf-8?B?MG9HUDIycVBCWCtzKzFyUFk2Z3dsREhmNHM3UG5ZenlablBDWGxxTlNhTXNU?=
 =?utf-8?B?bU0zbjU2dUNWUG92cGtDdDgyTlcvdjJyWllDVTdiZ1RXcVcxVFZON3dIRjlw?=
 =?utf-8?B?RVYrRTMwWndSWi9WOVJla3ZvZzg3aFFxeEZ3K0NFcWFvUHpPYzUrdjlaUXVk?=
 =?utf-8?B?MjNYdHRTL3BNcmIrZFQ3WW1zS1VlTDlxSXgzRmRRUFlUdVZjUmdIQ2E4TGtz?=
 =?utf-8?B?d3ErUFFYajZMdFpKNjMxVi9DWUxPYkdRM1FkeHc0SHRnSko0OGNIQ1M5ckY4?=
 =?utf-8?B?bUh0VUYwSnFKcGg5ciswZXdWQjFKbEhGUVk1bHhBNk1TZ1ZmNndCeGNUSGsr?=
 =?utf-8?B?QkJLdG9CeGs0eFpDZ0tvWHRhQWtyNldoZmxlcXdhcE9ORkF0S2cyUTlVWUpj?=
 =?utf-8?B?bEJ5aXF3K2UvM0wvSXhYc1BaYU1WeS9lZ0hOTFlmMk96ZlpVaVVldVZ0RTQx?=
 =?utf-8?B?SE5UL1lSVEtmZDlqeDhVemFiYkQxNkdScGkzVmM4ckNLS21FZTg1QUtxMUdk?=
 =?utf-8?B?amZxY3p0eGQrdkhVN29xM0VmMjIwWUJnd2QzYmsvSy84TjVSMVYvTXoyZmo1?=
 =?utf-8?B?TnphdFBHeDNLbGp4UDNRekVBdnhTNFM4VzFKcVZMbUF4TFY0WXhxUHJSMUxa?=
 =?utf-8?B?QzVzRGJTVlpkNjZIdm5rVnB2V3l0MHFRclU4Q3JZOUEyTnlmcjh3bGU2RUhV?=
 =?utf-8?B?TjNaaXJYZGRDYVZQdWxIa0VtRkM3elBoWjhFOFdDem93eDNhZHpybWcvMmtC?=
 =?utf-8?B?M3lQRUlFemJ6TUMzNnBXN3VVMUJoeXp4L1FLSEhGaHo2Zi8rUnN0ZlZFTUtj?=
 =?utf-8?B?dnZMM2tHZHI1UXFaVm81NGRRRnBtRnhpUmRnWTQvYWduV1JwUGRLY1VaUlRv?=
 =?utf-8?B?b1J2Tm9tUEt5RXN3aW5qQUNmYmsxMnNVL0l5ZXUzbmZGdUUzR0FJYi9sdndt?=
 =?utf-8?B?Sjc4S1A2c1FZa1kzMFlDM1p2MS9hQmVIVk9IdHVkT1U2aUZmUnMyWUxST1Ix?=
 =?utf-8?B?Unp3Zm4vWE1hQ0J1SklFYnJWeHoycFdzZzA3NDQ1UVFCUnY4Y2ljWms2Qkp2?=
 =?utf-8?B?NXVjOFptQzVjYldRZ0w4NFRscEVzWjlCMFlHa1RuQXJqUytQaHRlL2lFRUJN?=
 =?utf-8?B?b204MmJMYUxWQVhHYm9mQTlSNlpBM0tXb1NuU2hra2E2d05TamxYMzBWd0Mx?=
 =?utf-8?B?cWNUNEdFNHYxOE5VZWNlQW5WS2Zja0JXTDM5Q2Q3c2Z2dWxrWkhOajJlenp1?=
 =?utf-8?B?M2lQV3dSMFVPM2xCNzBCRDBLeWE2aGlmdlNUQ0JVcUZnbkJBYyttaFdMWGJZ?=
 =?utf-8?B?TWlza082SThxSUJxTXFURGxMaG53dmxORk13OVRGQjhwbXRuODlJSGNpZDBT?=
 =?utf-8?B?YjlkMGtBSi80VkkyaFV4MHVKL3FKQWFkaXJjS0tacTR5Y1ZpbkV1T1FOV29i?=
 =?utf-8?B?VWEzNjJIcnFJUWdVU1MyaWVVV3U1ZmgxRlFkVGFPcVd3TklEcnRyK0VrdGty?=
 =?utf-8?B?ZGh4U083RXJPVnVGR1VzVWFyUnpsTXprK3RJdGpOZjB4ZWZaQ0d2SzlQMUVn?=
 =?utf-8?B?NTB4OFNBZzlteE5abW9ydUFuYkZqRnlxZEF0RENRY3ZyWnJCdmVGczE0ckZK?=
 =?utf-8?B?QnFRbjQvY09SeWJLOFV0WXY0OTJIT1k5T2tIM0k3RDFsZ01udVdnYlY3YU95?=
 =?utf-8?B?ekw1aEY2MlNMajNhT3JubzhRakJNQ0lyTjVVaHFWTzZrajNwZUFzdlIzYWFo?=
 =?utf-8?B?VWRnak0zTW9IcnYrd1BmZmJ3dXJwMDBVS21NbjlGTWpLRU5NaFJJSURYLysw?=
 =?utf-8?B?N1BKUEVuWHJXOWFhZ2RlNE8reDRRN2w3SmhDU0hCc2l0Z1d0L1YyNGprQnpX?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CD63A1D8B179440873E30473678843D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7926d1c6-91d9-471f-9440-08dcd7b492b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 07:36:13.5277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYJUAMzQcm0IlpYqHK8mLoZHVyLdMaDTTreRRJlF2t8B2UGPyt/aykLV2/PG+1YoqJEaDKM7PcGs/lMc4XAJtD7+jaQy/aero9hf+ArS0WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

T24gVGh1LCAyMDI0LTA5LTEyIGF0IDAxOjU0ICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6Cj4gVGhlIFBSIHN0YXRlIGNoZWNrIGxvZ2ljIGhhcyBiZWVuIHVwZGF0ZWQgdG8gaGFuZGxl
IERpc3BsYXlQb3J0Cj4gY29ubmVjdG9ycy4KPiAKPiB2MTogVXBkYXRlIGNvbm5lY3RlciBsb2dp
YyBmb3IgUFIgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxy
YW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRl
ciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPgo+IC0tLQo+IMKgbGliL2lndF9wc3IuYyB8IDEx
ICsrKysrLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9wc3IuYwo+
IGluZGV4IDIyMmUwNWU2Yy4uOTlmMDhmM2MyIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMK
PiArKysgYi9saWIvaWd0X3Bzci5jCj4gQEAgLTc3LDEyICs3NywxMSBAQCBzdGF0aWMgYm9vbCBw
c3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtCj4gcHNyX21vZGUgbW9kZSwgaWd0
X291dHB1dF90ICpvCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChtb2RlID09IFBSX01PREUgfHwgbW9k
ZSA9PSBQUl9NT0RFX1NFTF9GRVRDSCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWd0X2Fzc2VydF9mKG91dHB1dCwgIk91dHB1dCBub3QgZ2l2ZW5cbiIpOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYyA9IG91dHB1dC0+Y29uZmlnLmNvbm5lY3RvcjsKPiAt
wqDCoMKgwqDCoMKgwqB9Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmICgobW9kZSA9PSBQUl9NT0RF
IHx8IG1vZGUgPT0gUFJfTU9ERV9TRUxfRkVUQ0gpICYmCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
IGMgJiYgYy0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdGUgPSAiU0xFRVAiOwo+IC3CoMKgwqDCoMKg
wqDCoGVsc2UgaWYgKG1vZGUgPT0gUFNSX01PREVfMSB8fCBtb2RlID09IFBSX01PREUgfHwgbW9k
ZSA9PQo+IFBSX01PREVfU0VMX0ZFVENIKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoYy0+Y29ubmVjdG9yX3R5cGUgPT0KPiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBv
cnQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0
ZSA9ICJTUkRFTlRfT04iOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlIGlm
IChjLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdGUgPSAiU0xFRVAiOwo+
ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAobW9kZSA9PSBQU1JfTU9ERV8xKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdGUgPSAiU1JERU5UIjsKPiDCoMKgwqDCoMKgwqDC
oMKgZWxzZSBpZiAobW9kZSA9PSBQU1JfTU9ERV8yIHx8IG1vZGUgPT0gUFNSX01PREVfMl9TRUxf
RkVUQ0gpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0ZSA9ICJERUVQX1NM
RUVQIjsKCg==
