Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BF4E6C60B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 06:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7D010E90F;
	Tue,  3 Dec 2024 06:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glQbMqNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAA310E009;
 Tue,  3 Dec 2024 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733208223; x=1764744223;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YdzOtvQU0S0VUs6TFVGpZDvVQSiJXRHT1XXV195gfds=;
 b=glQbMqNzZmny/2p0wQ/XrI5L4gFePNLUebQwXSfHrWYQSg5Lb/eARH/2
 gepAU/l8WAHZekwt+YcrePBlUlai1kDUJCOZNRdP/qUEcO2W2KqxA83b/
 fYzctoUkFEFodQvHSeqrkVvsJJUKRz/EzwUZE5m419pHM2t/sg5FbM6rG
 Tzf1xY9i5FIh8xvHjU/JsLzSNmFuyQlYtp6IKVXL9Wd9Jy68H0g2oUA1B
 EvGHD/VglqrnWtGo77Q5Nau4+bKdDdO651LVN22V2xa8lDRC1iA5wLCU/
 Post4QgV8lhFFFpQOE17H6jaOS81tW+qS4cAxlNxyeYOzyUph5JdgpQHh A==;
X-CSE-ConnectionGUID: KI2d6clXQbCWf4yPP3ccuw==
X-CSE-MsgGUID: pF3hw7rWQV+9hKpU2wmHyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44791213"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="44791213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:43:42 -0800
X-CSE-ConnectionGUID: o5fYfixMS0G7qbnkb7vnCA==
X-CSE-MsgGUID: fGabFZquTZGQQmWlA9xm+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="97404100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 22:43:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 22:43:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 22:43:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 22:43:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxVUCKrhB848X7Q3PMS6RtRE4KQYF18HohNnb8dXeh3DPBz2+vPgL8eB28GJGhYMcRsUNM7K/wz9Zg8ZzdSLW2H61CPzwapADfGrA2Tkde7DyLRy1DON6AH6+zYmhSnH94d+w/1wAkIPZMpzHd+yESnWUsYBzaW/q+fzfhB0VBQwi1Bm9cbabEXsVx3twi4C+Gh+Q/E/Bh/LVP3wgSdV2dfJbXsgSeTXQnvV/Xdetds0he7EBA16jS+MYgD9xx9XBwb0rrMYM6A2ki5kYG8D86g8w9QXMGvZYIg/pS/w86bFuHufgMepHR7GsatISX5Rze5HGfbk8CGrbHgCVPrieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdzOtvQU0S0VUs6TFVGpZDvVQSiJXRHT1XXV195gfds=;
 b=VfHk47BfnptaM45Ih4oq2W9DippPy+pulBQ/7cSvoeXDGISBNb/6R9Gm6oP/9EUQI2Dqg9SH7iy4B+lNgu6mLzyuQ3irpJzPtD+9ZNrsj5d1f491GA9+VqFGUqMpnbyj5PZRI5ikeiD2NS9Jws0ltn5B5wOrTcfXJA02zxPHLkCtraqoe+Z9bSqPBZIQVqY/VrfqpA8uxUv9P8CxQKOLD5klu/cErni1E3DppDRyBh+nstDJgSVPJ0gUibsHpDm1hJXjF5V9G1cCEitGhLkcLKB4yswE4kUeZi1vjfWDBVvxwv3xLs7ANWraE0cPyQi745ndGlrD26SLyLlmkvUg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 06:43:39 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 06:43:39 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIg?=
 =?utf-8?Q?fact_checking_(rev9)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0?=
 =?utf-8?Q?_checking_(rev9)?=
Thread-Index: AQHbQoQeNKOkLLVvbU6bPXVXbAkboLLSawoAgAGqweA=
Date: Tue, 3 Dec 2024 06:43:38 +0000
Message-ID: <PH8PR11MB6753A551B08D1E43DB8ECE02F2362@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173290129168.355976.8281068319435410321@b555e5b46a47>
 <330c7c7c-553a-4c86-b44e-61651a67f3df@linux.intel.com>
In-Reply-To: <330c7c7c-553a-4c86-b44e-61651a67f3df@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|BY1PR11MB8077:EE_
x-ms-office365-filtering-correlation-id: 75433c80-33b7-416d-bcf4-08dd1365d1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NEZ0Njk1QUJqZXZiQk1peUs0NTc2M2ZkVGx6MWM1K1pBdWE3ekE0OW5wTzZu?=
 =?utf-8?B?ZTJPNG1ZYlErdjdLWnliME9IVmVLY0lpNklZeDc3bS9JRDVRY09RVDlMQVhL?=
 =?utf-8?B?Q0oyQUpUYldaczRJMGxDREFHd2JrQWRUYlZYZFlXbTFjVnJRejREZTVJc0ls?=
 =?utf-8?B?MkpJU010NUJJUi9BOUNtbWRpQ2x0cUkyQzdpL2VIWlhMTHBzZkw3VkJGV2lG?=
 =?utf-8?B?M2s1TnpkcmlvdmE5M3luWmdyU2dJQU1NcVRUL3RwYzZLV3d2YVNLbFJWeHJq?=
 =?utf-8?B?cmhKZG5qV1k2VnZtU2ROdW5Pa0dqczlGbzNkcTFPSkMyaTVYUS94ZDdYc2o3?=
 =?utf-8?B?K3c3K0JndDlmNzZFeE82UEdiaEdRbjZQOVlpcDFEQ1JKd2FaSkVRSDc5ai93?=
 =?utf-8?B?VDRMdGlPZlp2TlRDblpWYWpHMFpHODQ3Z2FUcGdYcHZGRWQ1MEg2U1J4d2V3?=
 =?utf-8?B?SUh3cUF1UkpVa2hxcFJtMTV2ZHdYZ0dEV0FPZ3E3alA1N0pIS0ttdXBPalVF?=
 =?utf-8?B?R0oybWN3WVNyZnNMQ1pLWGVxZHFxcVR1dkg4TGFJSGZ0cGVENTFtS3NTWHFC?=
 =?utf-8?B?QTNqVXkxSFRwam1yeXhGUkptQzl2cEo2WHpOLzkweUZsZFhuaUN4U2ZKUklu?=
 =?utf-8?B?OCs4a0UvSUE1SEdXbEJiRzhmbkJvcGdRRktYbE9aa2NZU3FEYTlNSUdmdnJT?=
 =?utf-8?B?NUMwaUkxYUpib2tTZjJPN0hFbGRyUXNLUzVEYkhxbng0OEUySkgzREZmc0pn?=
 =?utf-8?B?ekV5VVp1UWovT0Q5dU1XVzVxd0MxeVlwNXFtVENsY2hXYi9yTFFKNFdMSGtY?=
 =?utf-8?B?dnlmbGFZcmRHUXM0VWhNRGJDV29RbXJvbUt4U1BjaXRaaDNjb3ZWOGpFR2lt?=
 =?utf-8?B?Wm4yVnJzaFRmZ0hnbFZvbzNLWDE4WTkyUzB6RHh2alZ0V28yNi9CbEtReko5?=
 =?utf-8?B?RXlUUUhybVh1eVVDYXNrNTliYVcwamE5RUovZmVybkZmUlNzVGtWTWc0UHdi?=
 =?utf-8?B?R010dUdTZExKcHJNRWhIU1dWRlByYll2SE1jbEFYeFFyNWFSTkI3MElvam1I?=
 =?utf-8?B?ZmVaNG9hOVJpT01QWmZ0UTRsa0FQOGY4N3ZsaVM1dmxyV0Jwbmdhc2hnYks4?=
 =?utf-8?B?OENTTzBLY21WTU5VTURGRnlnUjZiNmJyb3NiaGVwZ3lVY201RmZzKzBBTEE5?=
 =?utf-8?B?eGpzVVFYR0VGMVM5RndKU2crTXU2WFpsWHlYaDRWcUsyYmg0UDdxM0tXV28w?=
 =?utf-8?B?MDdSQWpXOHJxRUUwY3A2Tzh0NDJxUkZhSTgrWjZVUG9BSHBudmgyY0hvSFJs?=
 =?utf-8?B?Y0N2OWduZTlRNmdjZjhSZWR4SklMaEpsbStJWU1kT0VpUVhHQUdQemhCM1lr?=
 =?utf-8?B?N1drUElSemdHK0ZSeHY1N0F2UXVHbWg5NGU5M3BXWVdOZ3VBVXFTSVlQdXpU?=
 =?utf-8?B?cXA4R2NrNkp0b2RhbHdoU1JqM2FtWC91amNiL0NaUmpENTZlK0doY005SmpU?=
 =?utf-8?B?WWpLQkpNVWtnU2hoY3p4Q3UwN2g5cnpRRlVLVEl0UitTanhva0JlVUt4RGVP?=
 =?utf-8?B?c1dSSWxnZkZzQlJURDRXRHU0dHIrZGI4WFNWWVloaUhlVFlJZCtod0dMK3JT?=
 =?utf-8?B?eXlvc1R5VlZjZUs0aG9ORzVINUZnK2NTY3crbDBhSjFaVkNxL05MY3A5VmN3?=
 =?utf-8?B?NmlPbjRraGlmWDlaR3FkZHhJemlMcXBrQXQzaG5pR3AvTmRqODJOd0xvT1Bq?=
 =?utf-8?B?NDNXcEw5LzNSZ2lwYXUzT0dyZTEwdktQVkNrMXZmZXB1d1RaQllxQjV1YStL?=
 =?utf-8?Q?Ca3H/rtRC545NlXGeEyBQqDmd8DSt9bchtmEU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFN2Q0VNa1d6WWxuU3VnUW9MVXZGOU5SV2VPdlBncXBPaEJXUUg2Sld3RG9J?=
 =?utf-8?B?ZjVISnFzZFlQVUtRT2cwb215SVErem0zM2hsUlh1WjFwSDVlTXk1ZjhtdVAr?=
 =?utf-8?B?YVhPZWhqV2dFdDFLaldlRWYvYVhPRGpZbkp3SVltbkJCN0IrWVNkbU9ORkdv?=
 =?utf-8?B?Q0psSm5EYmVIZzNLNVRJWERVNm5vTEZZM3dscko4L1N0V01sQVJtZ3NwNWdl?=
 =?utf-8?B?VmVocVlRYjFvOGxZVWh4VDFqa0FOR21qZWdaU3RZeFQ2RXpQM0RxZHlRQ09W?=
 =?utf-8?B?c0UyTXN4YWcwMXZvVGtteGRYQzM5aDZBMWpEdjJaVHBFeSttY3d5aktXaElJ?=
 =?utf-8?B?QXpsZ1JUTFQ3cXBsZ005Vy9sQ0ZwZSt6TmlCc3BGM0VHYzE3U3VtYlluUkN4?=
 =?utf-8?B?UGhZY2wzY2MwemVVdzZsOG1SSjFDOGx2VEVFTTdzVVoxM1hUTVBpWSswN29i?=
 =?utf-8?B?cisrRDVpQUFwS0ZKYkZXV2ZnTHZ1T1BjcE5RM1duVEFSSzNUQU9HYVp2UXdO?=
 =?utf-8?B?OHprb1djVllmSHBpUnVBNitmSkM4TmFNN2Y3cysxd2s4a2RpR2JHQ2tuZmdQ?=
 =?utf-8?B?MVhjM0xqa3p6RkQ3K3lXbk50MVFERGVHNjRSNkZlekdMNjRRSDhWdFNVS1B0?=
 =?utf-8?B?ZjNQbFNBa3VlOU9IUHA4ZE5WSjgzNmh6dzl5ZFFBUGo3cEExRGFXWlFFaGpM?=
 =?utf-8?B?U09zZ25BVXFRNGtmdDM3WGV1OHI3bVlhNVZqSlF2KzZ6dUhreURQT2QwYTIz?=
 =?utf-8?B?MXRYejZYeFdxc2d3bDVTeXF2bFJURjlibWQwYStIT084UGdxV29YZGxpZnhO?=
 =?utf-8?B?ajRsdTIwc01wQVZwa1JhM3ZHbFI5b3lUTHJraUFicjdsS0VWRUNiSzNsU2VU?=
 =?utf-8?B?NWNLNjlKVGIxU2x1VmFkL2ROU1F4dEpXRVRKQzJjSEFsUGd0My92dzlIOHNK?=
 =?utf-8?B?MUlzUGFCUHZZN1BxVFpCOGM5L2YrMXg5N29pZ2JxaWZpcWdNdHg4OU9SdkNV?=
 =?utf-8?B?dFF4am4wdyszNzYrcGlOdjRORW02dlB6U2MraXI1eWJRYXpWZi95cWxNaHVW?=
 =?utf-8?B?eXFES05mSmRWOFViREMwRUV6SitER0lGRDdybkNwcFVEWVhvRE1kZEY2dkF3?=
 =?utf-8?B?YU1NWHpjYy9qRDJ1aVBKbUtmZmVXazB0LzhlTXl3Qy8zVHMwMGlQRTdyNmNo?=
 =?utf-8?B?S2w0dVNhNzNvR3lYN3pUZC9QNTBVZjNJRHBaZnltekpHZ2FNMTR4VWJQR1Zh?=
 =?utf-8?B?TGtteVZjMVFnNVBPQyt2L2tNdTVudHhrR2NodHZKVURnV2J1QzJLVnRGNzNF?=
 =?utf-8?B?cTFLL2ZHdXVJcWJIblNGUFltTXZsdkRYZ2ZEZktOWmU5Vm1qR2NKWnlHNkdW?=
 =?utf-8?B?bm12YjNLSDBhYUxYcGRsaG9JWE5nL2xSVHRSa01mMldyc0JsMDhpWDZjM01Z?=
 =?utf-8?B?RkhTaTZROFA1TmxxK2N5bFlnYUdUOExmN3p0SjNHc01ZRHdCY29IVytjQVQv?=
 =?utf-8?B?NlJwTlpyalptYzNjM1poQVpCbTBmdWxBQ3Y5bFlvWFR2dXIrTDhCOGNUYnk0?=
 =?utf-8?B?bDdNUDZHVVFkbFAvVHk5ZWlmekpoVjlRdXJ5SnNoeVg5OEY1aGlZR1R4RWtk?=
 =?utf-8?B?N3ZBOElZWkMvVFBocnVTdlFwMFJIRUs0am5qMUJIcE84a05xallIL2tmZWVC?=
 =?utf-8?B?U3ZjRnBpa2xlWS9PU3d4SWpabUQvQlRjRFNrazVaZXI5M2FXZmk0L3JpeHZz?=
 =?utf-8?B?TDJhaHpWalJYdWx2ZGtFTit6UEQ4UC9GRUlrdW1HQzg2WUorOXVmRGlaMXdq?=
 =?utf-8?B?V2oxSStHR2gvbHp3OGt3eUxXYld2K0ZxdklvNW5YS2RlOW00T2Nza1FXSTkw?=
 =?utf-8?B?VW40K0VxOWdla2tqcGM4YTBiSTBCSnQyWUdRZklRWFNDN2VjVXVvQmFLZlhC?=
 =?utf-8?B?UGltZ0tHakZFOUMxbjRUa0x5bW4xUGxQWHJVdi9QTEU1Tll2djlDQ3M4TzZx?=
 =?utf-8?B?bldEZDJTV0g0b2t0ZzVJcHVNU2tZOFp5aGd6ZkErY0xrQ2d5bUV4ZE1aZVUz?=
 =?utf-8?B?d2wwakxiZ2pGdFA2ZUUwUWhlR2ZXd1gzLytKdmZiYWxVejVLNmMrWFB1b3Qv?=
 =?utf-8?B?T0FRUUN3NXVydWZiTXpudjRHc3ZZcTVxY3IzVzRlMGMxSVk5dncxODI5dW15?=
 =?utf-8?B?R0ZBc0lrMVB3MmJLVmo5V1dRV1B4WkM1MGorRGZ5VytweG15eTFWU05wVVJV?=
 =?utf-8?B?azdKQmJpN3o5bU9CSCtRYVdDNEhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75433c80-33b7-416d-bcf4-08dd1365d1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 06:43:38.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bW6WpPtH4vWDLaRcNM6mU0GArO+yl5OW8ZZLNgkxnMZdt6VxX1Lx3MpH4thJkoyi6rDESIO69BcSG6uN3FFmq/rvNuZmFTMyLKk2LpWlkqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQwODQxLyAt
IFJlLXJlcG9ydGVkLg0KDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5u
b3QgYmUgcmUtcmVwb3J0ZWQuDQppOTE1LkNJLkZ1bGwgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtz
LA0KVGVqYXNyZWUNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1j
aS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiBNb25kYXksIERlY2VtYmVyIDIs
IDIwMjQgMTA6MzcgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1j
aS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5G
dWxsOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZhY3QgY2hlY2tpbmcgKHJldjkpDQoNCkRlYXIg
STkxNSwNCg0KT24gMjkuMTEuMjAyNCAxODoyOCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJp
ZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBpZ3QtcnVubmVyIGZhY3QgY2hlY2tpbmcgKHJl
djkpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8x
NDA4NDEvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kg
QnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTU3NjFfZnVsbCAtPiBJR1RQV18xMjIxOV9m
dWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+
ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTIyMTlfZnVsbCBh
YnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJ
ZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMjE5X2Z1bGwsIHBsZWFzZSBu
b3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcp
IHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdo
aWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwg
VVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MjIxOS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgxMCAtPiAxMCkNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFy
dGljaXBhdGluZyBob3N0cw0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkg
aGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTIyMTlfZnVsbDoNCj4gDQo+ICMjIyBJR1Qg
Y2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4g
ICAqIGlndEBnZW1fZXhlY19zdXNwZW5kQGJhc2ljLXMzOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAg
ICAgICAgIE5PVFJVTiAtPiBbSU5DT01QTEVURV1bMV0gKzEgb3RoZXIgdGVzdCBpbmNvbXBsZXRl
DQo+ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTIyMTkvc2hhcmQtZGcyLTExL2lndEANCj4gZ2VtX2V4ZWNfc3VzcGVuZEBiYXNpYy1z
My5odG1sDQo+IA0KPiAgICogaWd0QGdlbV90aWxlZF9zd2FwcGluZ0Bub24tdGhyZWFkZWQ6DQo+
ICAgICAtIHNoYXJkLXRnbHU6ICAgICAgICAgW1BBU1NdWzJdIC0+IFtGQUlMXVszXQ0KPiAgICBb
Ml06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE1NzYx
L3NoYXJkLXRnbHUtMy9pZ3RAZ2VtX3RpbGVkX3N3YXBwaW5nQG5vbi10aHJlYWRlZC5odG1sDQo+
ICAgIFszXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTIyMTkvc2hhcmQtdGdsdS01L2lndEANCj4gZ2VtX3RpbGVkX3N3YXBwaW5nQG5vbi10aHJl
YWRlZC5odG1sDQo+IA0KPiAgICogaWd0QGttc19jdXJzb3JfbGVnYWN5QHRvcnR1cmUtbW92ZUBw
aXBlLWE6DQo+ICAgICAtIHNoYXJkLWdsazogICAgICAgICAgW1BBU1NdWzRdIC0+IFtETUVTRy1X
QVJOXVs1XSArMSBvdGhlciB0ZXN0IGRtZXNnLXdhcm4NCj4gICAgWzRdOiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNTc2MS9zaGFyZC1nbGs4L2lndEBr
bXNfY3Vyc29yX2xlZ2FjeUB0b3J0dXJlLW1vdmVAcGlwZS1hLmh0bWwNCj4gICAgWzVdOiANCj4g
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjIxOS9zaGFy
ZC1nbGs4L2lndEBrbQ0KPiBzX2N1cnNvcl9sZWdhY3lAdG9ydHVyZS1tb3ZlQHBpcGUtYS5odG1s
DQo+IA0KPiAgICogaWd0QGttc19mbGlwQGZsaXAtdnMtc3VzcGVuZEBhLWhkbWktYTE6DQo+ICAg
ICAtIHNoYXJkLWdsazogICAgICAgICAgTk9UUlVOIC0+IFtJTkNPTVBMRVRFXVs2XSArMSBvdGhl
ciB0ZXN0IGluY29tcGxldGUNCj4gICAgWzZdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjIxOS9zaGFyZC1nbGszL2lndEBrbQ0KPiBzX2ZsaXBA
ZmxpcC12cy1zdXNwZW5kQGEtaGRtaS1hMS5odG1sDQo+IA0KPiAgICogaWd0QGttc19wbV9ycG1A
cG0tdGlsaW5nOg0KPiAgICAgLSBzaGFyZC1ya2w6ICAgICAgICAgIFtQQVNTXVs3XSAtPiBbU0tJ
UF1bOF0gKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgIFs3XTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTU3NjEvc2hhcmQtcmtsLTQvaWd0QGttc19wbV9y
cG1AcG0tdGlsaW5nLmh0bWwNCj4gICAgWzhdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjIxOS9zaGFyZC1ya2wtNC9pZ3RAaw0KPiBtc19wbV9y
cG1AcG0tdGlsaW5nLmh0bWwNCj4gDQoNClRoZXNlIGFyZSB1bnJlbGF0ZWQgdG8gbXkgY2hhbmdl
LiBQbGVhc2UgZml4IGFuZCBydW4gYWdhaW4uDQoNClsuLi5dDQoNClRoYW5rIHlvdSwNCg0KUGV0
ZXINCg==
