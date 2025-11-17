Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB691CEBF92
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 14:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B6810E0AB;
	Mon, 17 Nov 2025 14:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNvypIK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A54B10E0AB
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763390894; x=1794926894;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Vy31jdVgFrgjwGv7ElkdVllbe2YV2uGPzW0gZzeAz+4=;
 b=QNvypIK7G/Ew+1kD9IGwlaqDPrmKgqtocDhUKfaDS1JFTPfEoznoVsdk
 5b8fQ1xZ9UEhwAUYwf3vGAb9thhb5PKQNEkNWVOt48dk7i4o702cSfcC7
 8GZaJKraoHDmokbF1Tf8aJx0jfw6m9UX5YcPXiTLHZVg5xZeQWHmsM46L
 cYBjs+SvOaZjCUEydivkCoIqfTytUDVsRt3g9qufSezJNv2/CuAujFztW
 HSCpzyQp/vrnAXuB9H/h6gmX+h+lZGPDFmqP1qHtjIPjxCXejxfCSVHdp
 wid0BcKpu3h4ZIWmZn3emAch2CxTFGZjkPgB1ll//Cq7omiC1zYFYlbiK g==;
X-CSE-ConnectionGUID: WSIvN2ZkRPSvN8U5dOgIhw==
X-CSE-MsgGUID: GrNsfOy0SIOThXRKZKsjTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75991530"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="75991530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:48:14 -0800
X-CSE-ConnectionGUID: EmF22In5TCW8qD7kfJFu3Q==
X-CSE-MsgGUID: x/Bm7zrnRrWRrMnVDNOknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190488302"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:48:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:48:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 06:48:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:48:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWd/gFozqyalsftRVH57Byh6Go8y7JchWKW5UXMl+xCt/u1+c+Q/XzfVEkU7cO30VBcniNXfZNSRVUP4eG43kHq37k0wkbOt6/EgSkFlqwp6YeATuo5Zi8TR18hsxPqpZD35DyWERpF2qu9GaJI60KhP8g3LgBV1R0X5nxxvbHmve5I2FB8xm0wvUz6+nP9FQSVicR3tW7kMPSaU0x64ISnadilc28fmCCYct9vb2zcdKlweR0Od9I8cHgJV+w8YShgxTVhIgt+mcfbDNkR81O7DTa7RHoQKJ73adXTHFU7Q5m2XQKjz1b88HOntiOi0nmkw2QiTXHRT4gUgxde9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy31jdVgFrgjwGv7ElkdVllbe2YV2uGPzW0gZzeAz+4=;
 b=mNB+7jQUWRzuuISqL/FP60+errdipbOi8vrSquXmAM5fAghWlQGBRbJxMS5C+W2itq7oCoIQsL5ggZuzNrMXbQhCQPQL8eyhwIDCCJTyzqjsDvQgTTwSxXYcW+ny+495AhE/1WKcdIyI3dbOfpK1UXSe+70BR8zVYBB5LknftuMa82S1m3C042HFYlpUqI4bdpR4EX+Qw1RQUE+IQ2BTRTwz3EZSiwqTGOMwRfHJQLdfx4GA5wwqRSbM+25oG/DoOmNKwnSY4gMM4GF0yvlQr4VDj+P47k9ZKuv2mH7Of5EQeaHcECw/5Dli0HlO5rNOl8rnLHRouMHzgbtHL/ph4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Mon, 17 Nov 2025 14:48:11 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 14:48:11 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 07/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU fault handling test
Thread-Topic: [PATCH i-g-t v7 07/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU fault handling test
Thread-Index: AQHcVLs9NY4DlKwAhU+uRmbI96ukErT2+OsA
Date: Mon, 17 Nov 2025 14:48:11 +0000
Message-ID: <3979a2fb96f36c4eaea5106408cffa5557e355f7.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-8-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-8-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CY8PR11MB7848:EE_
x-ms-office365-filtering-correlation-id: f77251d5-3a66-497a-7f4e-08de25e85460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dHY4NHlWZ0E4RDBzeTVUanhtVTkyZ3VMclAwUUhNWFVGSXJBQnhidzdYeHVX?=
 =?utf-8?B?c2Z4UmZVQ2toTXBDa05iWGt3UG5STDhxV1FxSzl6L2xUT01ROHVmQWNNNEM1?=
 =?utf-8?B?alV4dFdWanZHbEprSU4vRFI1c0s4Qmx2UnVrZE5ramhHL0d1anNWeXZzMGZO?=
 =?utf-8?B?OUZFMmFjNSsrUFBLL0R6Q1pReCt0TTJYR2c0bTBVR0xLNHlFZFFnZG9PYTBw?=
 =?utf-8?B?Yy9YbHo2NDUzZm1Nc2ZBYlRkR0dhTkowREx3NUhkLzNFNGlxU21aWTZIS202?=
 =?utf-8?B?cFlQK0VneWx2bG9TdHB2OHc3MTBlT3VxMHNhTVRic00rV1JwN0dNbVRwbzYr?=
 =?utf-8?B?RWpLTmtiRXhINVB3VnBKNm5vZ1IvVC9NMUhiVnpDZGVvZG9JWVFIM0dnZXJm?=
 =?utf-8?B?WnhudlE2ZWpJTGlESXZNKzlWb2JWT2pxd3VQS3Yyemk1eHUyQWRuUVN0NkhD?=
 =?utf-8?B?Mnd1NHpQbWQ5bXZiaTdCam9tTUZycUVYb2R0M3QzSWZNdWwxQmNQS2lER2Uv?=
 =?utf-8?B?UENncjJpNlgvQzhtaHNyVVl2TG42QndPaDdzblF3aWI5Vnp6TjRmRUdhaXhE?=
 =?utf-8?B?R3FBcHk3YmxPUEVieHFoTE9WUkZSTUlUTjkrNXdLNWpjVzl4SGU5aE9WYjVn?=
 =?utf-8?B?ZHRnNEs0VUY3MjdMRkF1QkxRVFRTQSs0aUxjZVhuY1BXSm1FWUp0djAyS2Jq?=
 =?utf-8?B?Z1FOMFd6WEk1d2ZranRhanFCa2t4UGdMdEhzRXRDdmF2cVRUYVUva2FMa3JN?=
 =?utf-8?B?L1BJVHNQR2d0d0ZFaWZsVEZyS2h4cTg1TkRwNzBnNENabk5wSmVoRkJ0MUR5?=
 =?utf-8?B?QW8zL2lxQWhQd2U5clA3THZKa00weDFUK2JKSEdiNEE5QzBZTjJBajlDN2k4?=
 =?utf-8?B?emdwRURvOEp4MGpXZHFrUzA0dU9BN1d2VEVaaWdxUkJyQzVacHA3QnROdHB6?=
 =?utf-8?B?RUh2dTJIakRlOFl4VmlZYkRWYUdUZGc3WHBhZ3JhNXQ4ak9vaVFhaFBEWloz?=
 =?utf-8?B?VS9kcDFNMWFGeEx5VE1ETCswdEwzK1JKK1BvM29FV3lqUVRiOTlsVkRwaUpI?=
 =?utf-8?B?SzhHZjQxejFlWlNRSThtZ0dJVElJcThTbWpKMnYvanpjVUdpTk5lelU0SkhR?=
 =?utf-8?B?ci8yU0lpRDFicG5YWXk3T3FHUzNQMFAyOS9razdIWEpWNEV4cGgySXBLYWpG?=
 =?utf-8?B?NytVSjJxYUQ5U2pySmRHNE5BcU50OTZWZGlxcEFVSG9XMWI5d3FoZlNLcS9J?=
 =?utf-8?B?ckF0bUtDS3dIN3BTVFpzckRJQTZPcHgrOVplNktsK1RQdCttNUg1SUJINHpQ?=
 =?utf-8?B?OU9YM2VqencrVFBaY2huTFRKcXlURmQ5WGtuUjlobzJVY0dzZGI0MGxaVmJj?=
 =?utf-8?B?bUVzU2pLK1U2VlFINXQ2NjlEaXNKTDcwK255c3RkUXI3N2V5MENCUEFCYk45?=
 =?utf-8?B?WEdTbmZiUW5JZlVueGZSYm4rcDBLSDE3Mk5RL3R2SGxPbWJTNkg1QmpnVEx3?=
 =?utf-8?B?aXI1Nms3L3NaOU14L3FzWGVmUk1hWndXMkhQY1hrd3FaUFRpMWpoQmxlV08y?=
 =?utf-8?B?bTlYUVNoUXMxdS93YnFyZVI4L21NMTczUldDMnA0d084UjBQTFl6R2pEQzRa?=
 =?utf-8?B?cWJ6RlBPazFsT0pPVmtFcVk3QzcwelM1RlN0L0hxa3VkY1kreDdOL2tVQjdr?=
 =?utf-8?B?cGRndEZ1NzNSOC9jbmdadmVhSUpXbWgxeVBJM2V4cDBBKzE2dHYya2NzNU11?=
 =?utf-8?B?WTlJZ0NEdEJ1aHdjYUZDNDkwUTBsRVo4d3gycUpNdDRYbmdrMzVxMko0SVh5?=
 =?utf-8?B?aG5iU0lnUW1WZUt1QkRUUzNzclBadDlJOGJCRVIzbjcxMDE3NjdwcFppRFRy?=
 =?utf-8?B?RkJCeDJMTXVUcThReXJhMDhhZW9NMzhwSjZRTEcyZ0cySmM1SVZKcVN4Vitn?=
 =?utf-8?B?R3VXVUxWLzZxYVJXa1RCdE1ZVWRSSG1OcG5XZk5UOVFpalRSTE9JWVVlZHh2?=
 =?utf-8?B?UnUyVnFVVGdzT1dlRWVOVVNNcCtQWm4zc1NGdWo2WmtYa2lDc0R2NWd5bHdK?=
 =?utf-8?Q?ZjVlFF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVOR1FEL080TFpCNWhEbFlyNWIyYXpSek9qWmpyd3pvY1FnSVF6b2ppSG5O?=
 =?utf-8?B?emFVYlRkb3Rxcnc5TVRQZnVYR0F4VVQwMUZqNzFDRzc5cXRTUFNmdmN6QzJn?=
 =?utf-8?B?a1lBdlBaWnhBM2docGsvNTRMM3JBb1dyMk92ZitsTFpHSHJjNFZsSkx1Ym1r?=
 =?utf-8?B?MmowakRCMm1nZnBPdEJCTmdqTlU1WU5zNmk1bnpLclFSYXd6OG9JaVg4cWt4?=
 =?utf-8?B?ZFlVVjRFRHgwU2tlWExOajhnNGlVTjlsZmx4KzZGOXFMOHA1RXNVRndldk01?=
 =?utf-8?B?WjJ6Qm9ZemYvQVphUVhEOHNrU2RXL3dWQW05TVlvYTBBYmYzQllYMWtGYWta?=
 =?utf-8?B?ZnlWMVY3dHI1Ni9XU0MxOWJpYm5zT1h1UUcvUEpXSSswNG0yTkpJQ0M1cnNl?=
 =?utf-8?B?Ulk2SnpCeGlUMVVKdDZuSGdZZVZSSDVNN1JycVJDOWpDUlNFVjVZWHZyZmE4?=
 =?utf-8?B?MlRmQUlhYVpRUUJzdDdyK2ZwYjVjaXdpeEJFczZZbFBBTmdOZGlDaG8rcTBu?=
 =?utf-8?B?b2NYZGlMeGVjalQ4VWRPRVhHRXM3bTNVY2IzTHFVV3NLNkR0cEhUUjMxRENv?=
 =?utf-8?B?V05Xdm9DYnVnU2d5SU9IdUpNbUlseS9oeE1LTWRDL25OTFJuSlZ6TTdsZ2Fl?=
 =?utf-8?B?R0w4YWJiL0crRUtiYmVNZDJIUDMwamgwUGpzYUNoK0F2eXJ3ci8rUm1sc1VK?=
 =?utf-8?B?blFCUWpzNVRXQm5POElQaFJYcjl4Vk14Y0lJSkhLZlBZSzJPU3JlQlE3N2FU?=
 =?utf-8?B?YmtLM1Q2T1duNjJHZ3p6MzVVOFJtVndJU0pTZENGMWFWN3p4MkMxMFFxS0Zv?=
 =?utf-8?B?YmxBNmxIcUhDcy9yUituMVBvVEgvM2RUM0dSRVpDQnlwajF1UXVlVTFoR0Vl?=
 =?utf-8?B?eE5pVHJxd1AzTlh0L0U3NTR3L3gzQnVsSkRzTE83NUZ5VHVlcnZ2RUQ4RGFQ?=
 =?utf-8?B?VGVSaXplSElvaVYvTlhaQzQwaHBtV1AwUHdLcUdHQlVXUFJUSGdTZkNPV1NV?=
 =?utf-8?B?Z29TeFZCMHcvcHdkV2dDZHE0T2NGbzVSK0NuK1FxcDRaeWpnbk91UGVMZnho?=
 =?utf-8?B?UDVvdGJrbEh4MFBKcG10T3ZaTkYyZHk1bFl2bk5pcGVRbEZvWHE1WEZkZUpo?=
 =?utf-8?B?TURtUnIyL3JRc3RIa0VGdCtjcFdWSmtpb3BkejZTd2NmRGRTemo2ckNTdWNK?=
 =?utf-8?B?TWFOSkc1R29ldHBBOVlERTFUQ1NmaVNSUi9qM213Z0lrRkFJNWxWeVBvUWYy?=
 =?utf-8?B?b0JUYW9oM2RJUG9ScEt6ODlQUGhoVTdtNndqc3I1RUg3bnlBeGVCT0NDNkpq?=
 =?utf-8?B?clZxVFpmSEpzWDZXa0VtK2FsSi9pZmREdnU0NGwxU2ZDVkxnN3hwUXc3M0Zm?=
 =?utf-8?B?Y1o3Z214NENLTGx1QXRBSWhRdnExSXA3Sit6cWM0YVR4cnJYRStDQmNRaUs0?=
 =?utf-8?B?M1p2TnF5ZHYzdWUzTmpVMmdCT1RxWmJmMVYzRjlKS0VyZS9QOUR2NTJqNG40?=
 =?utf-8?B?aWdvbEkrRXFPM3YvRzlWaWhpanlHcWNQTEp3ek9ZMlFOWDYyWmNYWFMyVk5h?=
 =?utf-8?B?VmdORUczQSs2MjRtWTJDWXJKYUM2M1QxMnRBRHluY1pzV21lNEtCR2JYb1Vh?=
 =?utf-8?B?cGhnL2NTWDllUDBhdzFRZnpMMXVyQ3VnSjl4N2VyY0k3c0tCWXF3RnVRQzIy?=
 =?utf-8?B?WUhxWUFEOXVERHdMays1QmFsTnNIMTdoOG91bUhHZ3I1S0xmOHJFN3JGcWZ6?=
 =?utf-8?B?WDRNMDgrQ1loQ0c2MUZuaWFHYjFDWEFxdGlEYzFvckhqclFmYU1JZUpPakpI?=
 =?utf-8?B?dU1XN3ZtTUxUSUFGYmE0YkhTb3FJOEUySW56ZEowTE5udEZFbFduaERua1Zo?=
 =?utf-8?B?UW1haUIvcW5vcEtMek1qZ2grZm5IMFZnTzFNak1TVXNBc1FGQTlqV2JVb1N3?=
 =?utf-8?B?VmJnVFU0Q3RuMW8zeFlHdU5vZzd4QVdoVC9obGtYQVRhUTRJSE5yNGUvbVFW?=
 =?utf-8?B?akFOeG8yb2hud2ozdmhRK3hkbWFTT2FWa2tBZmZBWC9PNlVISm16VnREQVlj?=
 =?utf-8?B?cFB4d0I0bWlPMFF3cGlQN3hhYXdzSC82Qk1hRDU3MlFCTU5WSmFpaXdtZ1cr?=
 =?utf-8?B?elRLVGFUVE04d1NCWU9sYzBxQ0doSWxubE1NbEVtUldqMk9PVFBpV0U0ejNq?=
 =?utf-8?Q?T7ud006ojo3JJZF+jaDpNpyjkHuLDq0risajFMfSL1Hg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36528E9AABEF98468BADEA1BC80A93AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77251d5-3a66-497a-7f4e-08de25e85460
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 14:48:11.1367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5g2HrvJn/3r082jC8z5/K+Grgs7xAdA+NScM2lYrZHrhiMsbgVcn+HwcFoDgcQE+cGKDYQl7oYVy3wocRJEd4+PF9cF/aR7fhThAXf8aCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgaW50ZW50aW9uYWxseSB0cmlnZ2VycyBwYWdlIGZhdWx0cyBieSBh
Y2Nlc3NpbmcgcmVnaW9ucw0KPiB3aXRob3V0DQo+IHByZWZldGNoIGZvciBib3RoIEdQVXMgaW4g
YSBtdWx0aS1HUFUgZW52aXJvbm1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVf
bXVsdGlfZ3B1c3ZtLmMgfCAxMDINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IGIvdGVzdHMvaW50ZWwveGVfbXVs
dGlfZ3B1c3ZtLmMNCj4gaW5kZXggMmM4ZTYyZTM0Li42ZmViNTQzYWUgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX211
bHRpX2dwdXN2bS5jDQo+IEBAIC0xNSw2ICsxNSw3IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgInRp
bWUuaCINCj4gwqANCj4gKyNpbmNsdWRlICJ4ZS94ZV9ndC5oIg0KPiDCoCNpbmNsdWRlICJ4ZS94
ZV9pb2N0bC5oIg0KPiDCoCNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiDCoCNpbmNsdWRlICJ4
ZS94ZV91dGlsLmgiDQo+IEBAIC00OCw2ICs0OSwxMSBAQA0KPiDCoCAqIERlc2NyaXB0aW9uOg0K
PiDCoCAqwqAJVGhpcyB0ZXN0IG1lYXN1cmVzIGFuZCBjb21wYXJlcyBsYXRlbmN5IGFuZCBiYW5k
d2lkdGggZm9yDQo+IGJ1ZmZlciBhY2Nlc3MNCj4gwqAgKsKgCWZyb20gQ1BVLCBsb2NhbCBHUFUs
IGFuZCByZW1vdGUgR1BVDQo+ICsgKg0KPiArICogU1VCVEVTVDogcGFnZWZhdWx0LW11bHRpLWdw
dQ0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKsKgCVRoaXMgdGVzdCBpbnRlbnRpb25hbGx5IHRy
aWdnZXJzIHBhZ2UgZmF1bHRzIGJ5IGFjY2Vzc2luZw0KPiB1bm1hcHBlZCBTVk0NCj4gKyAqwqAJ
cmVnaW9ucyBmcm9tIGJvdGggR1BVcw0KPiDCoCAqLw0KPiDCoA0KPiDCoCNkZWZpbmUgTUFYX1hF
X1JFR0lPTlMJOA0KPiBAQCAtMTE1LDYgKzEyMSwxMSBAQCBzdGF0aWMgdm9pZCBncHVfbGF0ZW5j
eV90ZXN0X3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnC
oMKgwqDCoCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiDC
oAkJCQnCoMKgwqDCoCB2b2lkICpleHRyYV9hcmdzKTsNCj4gwqANCj4gK3N0YXRpYyB2b2lkIGdw
dV9mYXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiArCQkJ
CcKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiArCQkJCcKgwqAgc3RydWN0DQo+
IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgIHZvaWQgKmV4
dHJhX2FyZ3MpOw0KPiArDQo+IMKgc3RhdGljIHZvaWQNCj4gwqBjcmVhdGVfdm1fYW5kX3F1ZXVl
KHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdSwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmVjaSwNCj4gwqAJCcKgwqDCoCB1aW50MzJfdCAqdm0sIHVpbnQzMl90ICpl
eGVjX3F1ZXVlKQ0KPiBAQCAtNzA3LDYgKzcxOCw3NiBAQCBsYXRlbmN5X3Rlc3RfbXVsdGlncHUo
c3RydWN0IHhlX3N2bV9ncHVfaW5mbw0KPiAqZ3B1MCwNCj4gwqAJY2xlYW51cF92bV9hbmRfcXVl
dWUoZ3B1MSwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2
b2lkDQo+ICtwYWdlZmF1bHRfdGVzdF9tdWx0aWdwdShzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpn
cHUwLA0KPiArCQkJc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJCXN0cnVjdCBk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICsJCQlib29sIHByZWZldGNoX3Jl
cSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGFkZHI7DQo+ICvCoMKgwqDCoMKg
wqDCoCB1aW50MzJfdCB2bVsyXTsNCj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGV4ZWNfcXVl
dWVbMl07DQo+ICvCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBiYXRjaF9ibzsNCj4gK8KgwqDCoMKg
wqDCoMKgIHVpbnQ2NF90IGJhdGNoX2FkZHI7DQo+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X3hlX3N5bmMgc3luYyA9IHt9Ow0KPiArwqDCoMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDY0X3Qg
KnN5bmNfYWRkcjsNCj4gK8KgwqDCoMKgwqDCoMKgIGludCB2YWx1ZSA9IDYwLCBwZl9jb3VudF8x
LCBwZl9jb3VudF8yOw0KPiArwqDCoMKgwqDCoMKgwqAgdm9pZCAqZGF0YTsNCj4gKwljb25zdCBj
aGFyICpwZl9jb3VudF9zdGF0ID0gInN2bV9wYWdlZmF1bHRfY291bnQiOw0KPiArDQo+ICsJY3Jl
YXRlX3ZtX2FuZF9xdWV1ZShncHUwLCBlY2ksICZ2bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0KPiAr
CWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1MSwgZWNpLCAmdm1bMV0sICZleGVjX3F1ZXVlWzFdKTsN
Cj4gKw0KPiArwqDCoMKgwqDCoMKgwqAgZGF0YSA9IGFsaWduZWRfYWxsb2MoU1pfMk0sIFNaXzRL
KTsNCj4gK8KgwqDCoMKgwqDCoMKgIGlndF9hc3NlcnQoZGF0YSk7DQo+ICvCoMKgwqDCoMKgwqDC
oCBhZGRyID0gdG9fdXNlcl9wb2ludGVyKGRhdGEpOw0KPiArDQo+ICsJcGZfY291bnRfMSA9IHhl
X2d0X3N0YXRzX2dldF9jb3VudChncHUwLT5mZCwgZWNpLT5ndF9pZCwNCj4gcGZfY291bnRfc3Rh
dCk7DQo+ICsNCj4gKwkvKiBjaGVja2luZyBwYWdlZmF1bHQgY291bnQgb24gR1BVICovDQo+ICvC
oMKgwqDCoMKgwqDCoCBzdG9yZV9kd29yZF9iYXRjaF9pbml0KGdwdTAtPmZkLCB2bVswXSwgYWRk
ciwgJmJhdGNoX2JvLA0KPiAmYmF0Y2hfYWRkciwgdmFsdWUpOw0KPiArDQo+ICsJeGVfbXVsdGln
cHVfbWFkdmlzZShncHUwLT5mZCwgdm1bMF0sIGFkZHIsIFNaXzRLLCAwLA0KPiArCQkJwqDCoMKg
IERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DLA0KPiArCQkJwqDCoMKgIGdwdTAt
PmZkLCAwLCBncHUwLT52cmFtX3JlZ2lvbnNbMF0sDQo+IGV4ZWNfcXVldWVbMF0sDQo+ICsJCQnC
oMKgwqAgMCwgMCk7DQo+ICsNCj4gKwlzZXR1cF9zeW5jKCZzeW5jLCAmc3luY19hZGRyLCBCSU5E
X1NZTkNfVkFMKTsNCj4gKwl4ZV9tdWx0aWdwdV9wcmVmZXRjaChncHUwLT5mZCwgdm1bMF0sIGFk
ZHIsIFNaXzRLLCAmc3luYywNCj4gKwkJCcKgwqDCoMKgIHN5bmNfYWRkciwgZXhlY19xdWV1ZVsw
XSwNCj4gcHJlZmV0Y2hfcmVxKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAgc3luY19hZGRyID0g
KHZvaWQgKikoKGNoYXIgKiliYXRjaF9hZGRyICsgU1pfNEspOw0KPiArwqDCoMKgwqDCoMKgwqAg
c3luYy5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdCAqKXN5bmNfYWRkcik7DQo+ICvC
oMKgwqDCoMKgwqDCoCBzeW5jLnRpbWVsaW5lX3ZhbHVlID0gRVhFQ19TWU5DX1ZBTDsNCj4gK8Kg
wqDCoMKgwqDCoMKgICpzeW5jX2FkZHIgPSAwOw0KDQpJbmRlbnRhdGlvbiBhcHBlYXJzIG9kZCBh
Y3Jvc3MgdGhlIGZ1bmN0aW9uLg0KDQo+ICsNCj4gKwkvKiBFeGVjdXRlIFNUT1JFIGNvbW1hbmQg
b24gR1BVICovDQo+ICvCoMKgwqDCoMKgwqDCoCB4ZV9leGVjX3N5bmMoZ3B1MC0+ZmQsIGV4ZWNf
cXVldWVbMF0sIGJhdGNoX2FkZHIsICZzeW5jLCAxKTsNCj4gK8KgwqDCoMKgwqDCoMKgIGlmICgq
c3luY19hZGRyICE9IEVYRUNfU1lOQ19WQUwpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgeGVfd2FpdF91ZmVuY2UoZ3B1MC0+ZmQsICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCj4g
RVhFQ19TWU5DX1ZBTCwgZXhlY19xdWV1ZVswXSwNCj4gKwkJCcKgwqDCoMKgwqDCoCBOU0VDX1BF
Ul9TRUMgKiAxMCk7DQo+ICsNCj4gKwlwZl9jb3VudF8yID0geGVfZ3Rfc3RhdHNfZ2V0X2NvdW50
KGdwdTAtPmZkLCBlY2ktPmd0X2lkLA0KPiBwZl9jb3VudF9zdGF0KTsNCj4gKw0KPiArCWlmIChw
Zl9jb3VudF8yICE9IHBmX2NvdW50XzEpIHsNCj4gKwkJaWd0X3dhcm4oIkdQVSBwZjogcGZfY291
bnRfMiglZCkgIT0gcGZfY291bnRfMSglZCkNCj4gcHJlZmV0Y2hfcmVxIDolZFxuIiwNCj4gKwkJ
CSBwZl9jb3VudF8yLCBwZl9jb3VudF8xLCBwcmVmZXRjaF9yZXEpOw0KPiArCX0NCj4gKw0KPiAr
wqDCoMKgwqDCoMKgwqAgaWd0X2Fzc2VydF9lcSgqKHVpbnQ2NF90ICopYWRkciwgdmFsdWUpOw0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoCAvKiBDUFUgd3JpdGVzIDExLCBtZW1zZXQgc2V0IGJ5dGVz
IG5vIGludGVnZXIgaGVuY2UgbWVtc2V0DQo+IGZpbGxzIDQgYnl0ZXMgd2l0aCAweDBCICovDQo+
ICvCoMKgwqDCoMKgwqDCoCBtZW1zZXQoKHZvaWQgKikodWludHB0cl90KWFkZHIsIDExLCBzaXpl
b2YoaW50KSk7DQo+ICvCoMKgwqDCoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKCoodWludDY0X3QgKilh
ZGRyLCAweDBCMEIwQjBCKTsNCg0KU3RpbGwgbm90IGNsZWFyIG92ZXIgd2hhdCB0aGUgYWJvdmUg
aXMgdHJ5aW5nIHRvIGFjY29tcGxpc2g/DQpJc24ndCB0aGlzIGEgcGFnZWZhdWx0IGNvdW50aW5n
IHRlc3Q/DQoNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAgbXVubWFwKCh2b2lkICopYmF0Y2hfYWRk
ciwgQkFUQ0hfU0laRShncHUwLT5mZCkpOw0KPiArwqDCoMKgwqDCoMKgwqAgYmF0Y2hfZmluaShn
cHUwLT5mZCwgdm1bMF0sIGJhdGNoX2JvLCBiYXRjaF9hZGRyKTsNCj4gK8KgwqDCoMKgwqDCoMKg
IGZyZWUoZGF0YSk7DQoNCkl0IGxvb2tzIGxpa2Ugd2UncmUgb25seSB0ZXN0aW5nIG9uIGEgc2lu
Z2xlIEdQVSBoZXJlLiBQZXJoYXBzIGl0IHdvdWxkDQptYWtlIHNlbnNlIHRvIGV4ZWN1dGUgYWxz
byBvbiBncHUxIChwZXJoYXBzIHdpdGhvdXQgcHJlZmV0Y2gpIGFuZA0KdmVyaWZ5IHRoYXQgcGFn
ZWZhdWx0cyBoYXBwZW4gb24gZ3B1MT8NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KPiArDQo+ICsJ
Y2xlYW51cF92bV9hbmRfcXVldWUoZ3B1MCwgdm1bMF0sIGV4ZWNfcXVldWVbMF0pOw0KPiArCWNs
ZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTEsIHZtWzFdLCBleGVjX3F1ZXVlWzFdKTsNCj4gK30NCj4g
Kw0KPiDCoHN0YXRpYyB2b2lkDQo+IMKgYXRvbWljX2luY19vcChzdHJ1Y3QgeGVfc3ZtX2dwdV9p
bmZvICpncHUwLA0KPiDCoAnCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdTEs
DQo+IEBAIC04MzIsNiArOTEzLDE5IEBAIGdwdV9sYXRlbmN5X3Rlc3Rfd3JhcHBlcihzdHJ1Y3Qg
eGVfc3ZtX2dwdV9pbmZvDQo+ICpzcmMsDQo+IMKgCWxhdGVuY3lfdGVzdF9tdWx0aWdwdShzcmMs
IGRzdCwgZWNpLCBhcmdzLT5vcF9tb2QsIGFyZ3MtDQo+ID5wcmVmZXRjaF9yZXEpOw0KPiDCoH0N
Cj4gwqANCj4gK3N0YXRpYyB2b2lkDQo+ICtncHVfZmF1bHRfdGVzdF93cmFwcGVyKHN0cnVjdCB4
ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gKwkJwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1
X2luZm8gKmRzdCwNCj4gKwkJwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNz
X2luc3RhbmNlICplY2ksDQo+ICsJCcKgwqDCoMKgwqDCoCB2b2lkICpleHRyYV9hcmdzKQ0KPiAr
ew0KPiArCXN0cnVjdCBtdWx0aWdwdV9vcHNfYXJncyAqYXJncyA9IChzdHJ1Y3QgbXVsdGlncHVf
b3BzX2FyZ3MNCj4gKilleHRyYV9hcmdzOw0KPiArCWlndF9hc3NlcnQoc3JjKTsNCj4gKwlpZ3Rf
YXNzZXJ0KGRzdCk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgIHBhZ2VmYXVsdF90ZXN0X211bHRp
Z3B1KHNyYywgZHN0LCBlY2ksIGFyZ3MtPnByZWZldGNoX3JlcSk7DQo+ICt9DQo+ICsNCj4gwqBp
Z3RfbWFpbg0KPiDCoHsNCj4gwqAJc3RydWN0IHhlX3N2bV9ncHVfaW5mbyBncHVzW01BWF9YRV9H
UFVTXTsNCj4gQEAgLTg5OSw2ICs5OTMsMTQgQEAgaWd0X21haW4NCj4gwqAJCWZvcl9lYWNoX2dw
dV9wYWlyKGdwdV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9sYXRlbmN5X3Rlc3Rfd3JhcHBlciwg
JmxhdGVuY3lfYXJncyk7DQo+IMKgCX0NCj4gwqANCj4gKwlpZ3Rfc3VidGVzdCgicGFnZWZhdWx0
LW11bHRpLWdwdSIpIHsNCj4gKwkJc3RydWN0IG11bHRpZ3B1X29wc19hcmdzIGZhdWx0X2FyZ3M7
DQo+ICsJCWZhdWx0X2FyZ3MucHJlZmV0Y2hfcmVxID0gMTsNCj4gKwkJZm9yX2VhY2hfZ3B1X3Bh
aXIoZ3B1X2NudCwgZ3B1cywgJmVjaSwNCj4gZ3B1X2ZhdWx0X3Rlc3Rfd3JhcHBlciwgJmZhdWx0
X2FyZ3MpOw0KPiArCQlmYXVsdF9hcmdzLnByZWZldGNoX3JlcSA9IDA7DQo+ICsJCWZvcl9lYWNo
X2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9mYXVsdF90ZXN0X3dyYXBwZXIs
ICZmYXVsdF9hcmdzKTsNCj4gKwl9DQo+ICsNCj4gwqAJaWd0X2ZpeHR1cmUgew0KPiDCoAkJaW50
IGNudDsNCj4gwqANCg0K
