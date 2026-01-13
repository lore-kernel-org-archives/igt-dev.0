Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08992CF45DF
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 11:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9928910E282;
	Tue, 13 Jan 2026 11:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CINXHWzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7340010E282
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768304897; x=1799840897;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x3zH6Gb0w0oWnREw1JpBfDueDMHTrrhlkWrdycWsc5g=;
 b=CINXHWzSvJE5Qgx24fIs3FGOgoH4UEbD4r2RVgH0FR2oBHDB8GeYkzH0
 /E5PZrhCDwKCrs6ttAPXMZb1c/qa0ZOPE604s1bUg0uW8kxfMz1ofKilC
 T0WRmN0AIYO3xO1YIZQox5uc+SSANqjDvFM9nEmsPNuUJiL0OfMdmowjB
 kPur9f45n2QGIlqK3PWFHu8chC7zjFrHsg5rLqw1cIz1YQtThapSDxUkZ
 ilyWAUyx4fMAYHEiQLYYutC14PC5z+6nDVdc3fZUyh69ZLXdUYExEOfF5
 EYVDFn0d60JmA0m5Uh762v5zX8MTsr7uKtAinZ9eCEiASU8auBPRp8OKG A==;
X-CSE-ConnectionGUID: BQYcF5MIQlyJ5/5IySDftw==
X-CSE-MsgGUID: 5uKx9S7XSa+IYmyyqf9nlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68592693"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68592693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 03:48:17 -0800
X-CSE-ConnectionGUID: fxyyGb+2Rbqh+gVJE+yl2g==
X-CSE-MsgGUID: STeqU/XpSryGphOE37THTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203994855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 03:48:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 03:48:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 03:48:16 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 03:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ytf0thIf3DDxJ4VuI51kE8Qel7U8VFAEOotWJzuHhxdmJk8iZxV7ULafamUmAHWI4C0GPNyTY1Kq1ePV4Noro2wi+tf3pvgjg1sEaMgWGGzhWpzpXayZaS4/flIdOyLjJD3l0ZKRgMnIsF/tHcnE6/JNMg/RUlHs+v2sJGKNLGDX5F32nnEtrQGkLc4Sh50JjpoQg5SfXTQDhi0mz47Md7d4mIrTKjZDXjNQ29egZFXuS+Wooqdp6JOaC6n6+YGNuD/39UGac6w9PhJf0xtfTqHYkBlZgV4tyPkfhMU89bp9BUNazHvgoTj+xdVxQPgx1xo872+SGFO7blltwsIsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF8fa00jI3S24lafZZLOFDD50UJZF9Gld4I4MAhT1NE=;
 b=mOd9vzrHa/xsCxLa4lKTsh5VwYu/VW7TkN1VaF157Yh/YEzrM64cXMeM1Zq69/2LXv+A1mwIyjgZ0MkUPgkCCnnmxpQu26Ygi8oP4x0eBPcQfAnaL7MM3VpWebJBxtokITmHNyA6JGLZGs7/s/hwlyrw2OBUne7/ZT27cDyVoxLQj1V9nF6ISMPmwsCNeOJ90UTOn69RFJn2q6KXKKt5BHYHUhaamJYCkarKrBtMVbkp5E0tXjDqF0PWvnGxQDEr5/dWnKby2QZHnvVq4B/oL8A4R/bsKrNgywXtTJHM+rnvK9mSkzZlqjyQfEoesCWznZFcaXg0g/QobXnXK6TyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 11:48:14 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:48:14 +0000
Date: Tue, 13 Jan 2026 11:48:04 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Mateusz Grabski
 <mateusz.grabski@intel.com>, Ryszard Knop <ryszard.knop@intel.com>, "Ryszard
 Knop" <rk@dragonic.eu>
Subject: Re: [PATCH i-g-t v1 2/2] RFC: runner: implement dmesg reduction for
 successful case
Message-ID: <pym7gmoix6tt2x3o7j2w4mji4b7uilqt67klf6gkboj5xfh7fo@wohcrpqgykdv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
 <20260112165006.237964-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260112165006.237964-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2f3891-8d0b-431c-3fc1-08de5299a2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0RVMmQwU0JHY0tkM0k0blVscFc4UUdoMkhGWU1jSUVpNjlVbFlUWDFvUW0x?=
 =?utf-8?B?enNWUTlXbWw2UzBycTNGenJZbTlYQWlTMEFVVUlaa3BLT1VOTmtvRWd5bHdw?=
 =?utf-8?B?SlNMVHdPZHdwZ29Hd0tKZzhMY21tMWxXZkVYTTFRVzM2aGxxUG1QaElkVUZF?=
 =?utf-8?B?b2t2VGMwY3I0L1NDbG1PeCtjSlhYeVpQZDBDSmZuQUFtaldDUExvTXpCSnJG?=
 =?utf-8?B?Wi8yK0VnaDBZTlNjZmpSNUZVc3pKOUdFTlA3Z21Qdm9PY2dVbXBLQkhtd01T?=
 =?utf-8?B?b3QwdXIxbldGUGZodTFTS1oycjhFUUx1QWVxUGdEVU5aZ1FxS0tPaDVKQzJs?=
 =?utf-8?B?RDlGOWQ2NGsyWEN3OUZwRnJxcUVlcWp2VG4zTVJaMGpjdnBwQTk3Rzc3Tm1R?=
 =?utf-8?B?Mmd2dmlaM0xoU08wNDBVenpwU0x1Tm1VWC9NbXFjdUVKQWVDODJMN3dUTDNz?=
 =?utf-8?B?YjdtVGxoNkdtLy9mVFJQeGdINStON1ZhQWlpdHRnUEhUZExLSG0wLzBVUlRk?=
 =?utf-8?B?UVYzNFNkNWhGWW9yaVVZSmhrMFM1ZlgyYXI3UnlJdHZFdkZKbWU0ck8yNldU?=
 =?utf-8?B?c0Y4V0RRVlB6eEMveUlhcG5iUWVQZjVGeEY3Z3o4bFdzekpSY3FldC8yalJJ?=
 =?utf-8?B?Zkx0Mmc1OWpqMXdnRXVYeFZUY2VXd0V3SkdHblhyMDZKSW55MGhKRUdRUWdp?=
 =?utf-8?B?S1dhME9PT2c0SXVUa09VUmpSN0VBZ2J6U2p1ZTlLMXd1eXFXbFA0V2cvZTFw?=
 =?utf-8?B?OVN6RFlNTEs3cVZVdUVnRmVnS216cjc3UEJlR0Jmd3lSK1RLL05zWWNGSEFG?=
 =?utf-8?B?Q3BvR0dZYk84WmtrSGJUR3dNY1dyaDNSNGFXNGtSNTl6eVJ3VVZsbEIxRGx2?=
 =?utf-8?B?RHpNZU1YQnhUMnRrVkVPeDJaRFlXMXEyQU54T3NvYWFuSFh5eVBucVFIOWZF?=
 =?utf-8?B?dmU4d3JxdEFvKzdENWY3MDdweXMyS3lJZ2U2NHY0cUl4dGU2cUtoQnhQMmpJ?=
 =?utf-8?B?K1IxZHZpVVpkOFFtQ2NiNkRJd0p6cTU2N3ViK2s4NTdmcmNDckN5bXZNcGxh?=
 =?utf-8?B?RGxtaWlsRDJGOHgxb2VVZEhEemhHdnVVdDBnaVRjYkI2VURsNk9Ca1lKcUNZ?=
 =?utf-8?B?YnNaTXNjZWhmVloyVU42d05jeVVtNlhrNi9ZTm43TjJXU3pnZTFSTC9SVzZ4?=
 =?utf-8?B?NTBRSXU0S3BFN1M1SmZoQklHSXVub3N4TittVTV4NEZOU2t0V1JMZWI1WVJp?=
 =?utf-8?B?WDVLYklHZ2I4UXZ0cWwvaS9iU01FUzZmaERNbWdodHJlYmhMUkVya3FETlgr?=
 =?utf-8?B?dElDaVFFSGkraWp1dzhGdmtOZENUUFo2cGR2Tzk2QmFseVBDZHlKVnFKRkRN?=
 =?utf-8?B?bG9hbStxM3ArWlRLbHRZaE16dzdnZGhrNC9jM2IxN01KVzVOZXpNRFRPTmVC?=
 =?utf-8?B?VlBLa1ZsdmhtSytkODh0U01OZHFkT1o4S0UyYnV1Z0xjazFNeHYydG16L3M2?=
 =?utf-8?B?WlVFeWZkZ0x3ZytQdWdjbmE3UDMyNC83VFl5T3RBU0tWMFNWdFBZUEtCcnZD?=
 =?utf-8?B?NU01TFBnL3FzNUxWYjNSeW5hY3lZL09PcVM2SjJpWDdpMnArVVVjamd0SEZu?=
 =?utf-8?B?cnB3cXI3dUJPK1ArVVZmNXVVNCtXMUdXWWkxUjFuSVVJWWhKYVdLb2o1YlA1?=
 =?utf-8?B?RHR5aDR4R3JZY3NKR3ZqN2tISkdLOFlSa3VHcHR1aEFpM3FXY3YzdWcxelEv?=
 =?utf-8?B?elZxNjZjNUtyMGVCaThRaUlCM09uZEtUVmhwd1hzTDQ5enBnb2dQNDBid0Zw?=
 =?utf-8?B?RXprREdmci9KUElqc2JXZGo3djZvcElwSVh6TEZFUko2QmtEWmZxdFlpWmhp?=
 =?utf-8?B?M2dIaWxlT3JrbFcxWjlDaUo3SVRMdnpQb1l4V2RGZnhWSDQxUHNnYzg5Snhw?=
 =?utf-8?B?S1dVdG03WDJYT0hjTUY5d1ROQ1Qrdkcvc2ZvR0QwUmN4OGFMMW5Hbmt0dzZk?=
 =?utf-8?B?M0VaSUI1L3BWV0tmTmsyVFlQV3BiMUc2b1NsOEtiYXphRmE4cmR2NXdGUXJn?=
 =?utf-8?Q?E+BH/t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFhaENUcGtvSjc5RWFSSEx0aVFLNEZwY2ppZjVVTnJ0MnpGTlA0K2dSa1Ux?=
 =?utf-8?B?MThxQ3g5cmN0Z1V0U21zdndaNCsySHZiVEx0U1hTUERpYStxSkhXdkU3b1cr?=
 =?utf-8?B?WE92Y05Ud1RQQnREY3U3NExWeXBMS0FqaDVEZEY5ZnFwZ0ZiNkJHWHNqdlN2?=
 =?utf-8?B?MG5FMG9ucGhvbVA3NFg0N1RBaXpOVFNLci9ndlJWd1F4MzVSVVgyN2JFdUMw?=
 =?utf-8?B?Y3NrdmhidC96V2R0eGFVbHBpZnpCSW15SEliUGc5L25wQ0dFcWU4bjNvZFFj?=
 =?utf-8?B?WjMvZFhtcG1wQXJrSDhSR3NIUklOdlZ2OWJvbXgzbThWTkJyQjk5MUVOSEdR?=
 =?utf-8?B?VU5DME80ZENnVUltRzdPd21aQW01ZTdMbjI1R3lQblE0QmJpMk9tZ2NGVThT?=
 =?utf-8?B?TmRzWlJDOU5OanNTYXAzT2pFY3BNb1UxSXdhSVRYMGFXUXdSWjUvdkdTaWRT?=
 =?utf-8?B?dkdDbmIzUmd3TXUxcm93Y0NacHJDSWM0YnhNMUFsZzVmMEV1THp3VnFUa2FH?=
 =?utf-8?B?dE1CWUk3R1NIanM1S1pqM3Z0WXF3TWdRUUJJSHlxbW5lN0VMZUlrRi9DOXVo?=
 =?utf-8?B?dEV6WnZpL1ZTeXdpWURxaUsrckpQSlhRRmExcU9hTDArNnF0aXVobHRXZTQ4?=
 =?utf-8?B?Qkh4dHJ6ajVrT3hzcGZvZDA4eDExdU9BZlI1MFZsQmtmZ1dKWHZmZGl6NU1J?=
 =?utf-8?B?WEpQZDF3aXREd3h3eXNDM0tLM2Y4UUQydHZyclVkOTM0TWFMZmJOSzRqemVk?=
 =?utf-8?B?eFB0TDg1NlJWNlRYR1o0Y3IzcEJsalJhOHI5c1lnV0RlNXVFT1JmTWFOblpB?=
 =?utf-8?B?ZjB6M1M2aU5wclU1TXM1QmlndmtDSkFnUG1Ea3lRT0kzZUNjZXc5UENrUXhV?=
 =?utf-8?B?TUVxazRyR0poWXIzRDQwY05FNnVIU2hEUGZOTnJOR3pJV1Y0N2JoTUFycWMv?=
 =?utf-8?B?UjVnbVpKdXNLOG5MbzBaM1lFMTVEMlVXTjEyZ21CWExpZHdab2lzWnFYU0Vu?=
 =?utf-8?B?UEJYY2d3dWVaK0F6amJETVIxa0pxaGg1RnNWOXVoeW92L1ZYaENqT1J5WERQ?=
 =?utf-8?B?RVF5Z1cwMkdUMkFmRi9MYmw4bGRJYitCemZBWGFVKzFBaDM2d0lJRFNLRVl3?=
 =?utf-8?B?U0ZJc1UrYXVJV0hWZUJWZDVmWWNVcXUwTnFjLy9RV21OMW5EY0c1Y2dXdEtI?=
 =?utf-8?B?Q3JKR3ZubW1ldnBMVG9BZE1LWTVnLzNTampCUlFMME9tb2NwbGNuQ2ltZzlp?=
 =?utf-8?B?MG5pUGlOSUdBbFFsMGtQRTNrdmJpWXROTjFhS3k2QWNZbjN5WGlsTnF2WWYr?=
 =?utf-8?B?Q21WRTBWQWllRWF1cUxhMHRIa1dON2FYKzBPYlorYzk3VVJGb2VzQ2RUeGM4?=
 =?utf-8?B?ZFFLMHVENndDTGFjWFg2d2NaOCtyckFTYll4SDVLVnlpclQvSGs4cjc4VitV?=
 =?utf-8?B?NzlGRDNFdmJQWm81cGhISEMwZEsxWFUwcVVwTHhTYzNpeE5scHBibFRnS3N2?=
 =?utf-8?B?N1hkV0hlRTdSd09PZS9jd2NsSENXcEdGcytDbzJpckd2ekwxYkdpMlp4Uy9T?=
 =?utf-8?B?ZFlIUlVnZ1NyME9CcTFWR1hHcHl2bldLMkVuZXhETHZpVG10TGNBSVpOWXdL?=
 =?utf-8?B?NW1BcGJRMHhlQVJ6RUllcGhGMTZwQzRSMWk4YjRZd2lBVWYzazZqN0ZYTlBo?=
 =?utf-8?B?c3JDR3V5aWQ5UmJGbnhIY0IrNnBPVDAwMG85TE9xNmhLRjlNaDFxcmNyVk8z?=
 =?utf-8?B?Um14Y3FYWUF0TVNHQlFBNTEvb0xpUnZUN1U4cHczRm94blZWaFZYMlBsZ3BR?=
 =?utf-8?B?cmc4cEVQeTVZS2xmVEZiemJTMi95TnZPMG1Bajcycm9XZ0lldmNqdEMvai9j?=
 =?utf-8?B?OTREaFZuUW9UaEd3Tk5Ya2tCRGJLb2I4RStPbmcwMGtYVHcvQ2lrWEVwbHN2?=
 =?utf-8?B?Qkx2cU5hclFoODAwWjRCbTBCaWVPNHBNN3oybXNLalc2Nlp2cWl6eUxPMXov?=
 =?utf-8?B?SWlUcThwa290SG9vWEt0VEhORHJ3c25vZWdwTXBOK1FySTlPMTFRaEJGeElv?=
 =?utf-8?B?bnhBSklOek1JRUFJU05hc0xwQUNETlhIbFV6OENLMnFrM3poUEVUVmo3UDZn?=
 =?utf-8?B?Tm9TdjAvQ3hhVWErQlc0RHNUbjZoVkN2eE5lb3hMVEpsbGoyU3h5eGhyMUg3?=
 =?utf-8?B?Y1lrTUdqRCszRytqR29xRXlJZ3hHTzZEV2xNUjVaUDZyZHgvNmZGUi81dnl4?=
 =?utf-8?B?NmM0dSsrL0tqWVg1MDR6VTczdmNzQXBNb3NEL3B0R2RqOEVZRFNQN3FPK0Nn?=
 =?utf-8?B?SEg0Q2paQ2IzU2p0YzF3c1djb0ZOaU5zUGNrTW1meFBpekpzQ2pZRnF4K3VX?=
 =?utf-8?Q?5eivCCY7hel7Yksc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2f3891-8d0b-431c-3fc1-08de5299a2b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:48:14.7935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di+0Carph93pmzrFbAcd2bS3VjH1lCTJVRrhnho71AYp62fPepNOXlxNqrE3XTXuSZMRcurVZpCtC3q9Tt1ReIIa7WE/t5qmfBqPMzNM3ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

Hi Kamil,

[...]

> +static void add_dmesg(struct json_object *obj,
> +		      size_t reduced_dmesg_size,
> +		      const char *dmesg, size_t dmesglen,
> +		      const char *warnings, size_t warningslen)
> +{
> +	static const char *middleinfo = "...dmesg reduced\n";
> +	char *reduced, *middle;
> +	const char *p, *lastp, *end;
> +	size_t len, lastlen, rsize, half;
> +
> +	if (warnings || !reduced_dmesg_size || dmesglen <= reduced_dmesg_size)
> +		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
> +
> +	end = dmesg + dmesglen;
> +
> +	rsize = reduced_dmesg_size + 256;
> +	reduced = malloc(rsize); /* +256 for last message */
> +	if (!reduced) {
> +		fprintf(stderr, "resultgen: malloc error, no reduction\n");
> +		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
> +	}
> +
> +	half = reduced_dmesg_size / 2;
> +	memcpy(reduced, dmesg, half);
> +
> +	for (p = reduced + half - 1; p > reduced; --p)
> +		if (*p == '\n')
> +			break;
> +	for (; p > reduced; --p)
> +		if (*p == '\n')
> +			break;
> +
> +	if (p == reduced)
> +		p = reduced + half;
> +	if (*p == '\n')
> +		p++;
These few lines above seem very convoluted to me. First, you
acquire the middle of the message buffer by calculating "half",
then starting from one character before that point, the *p is
moved to the beginning of the line and then another one, so you
move up to two lines in total in two loops. After that, you may
unwind everything and set *p to the middle of the buffer +1
char.
Maybe instead of moving back and forth, you could also include
"middleinfo" in "rsize" calculation at the beginning of this
function and either delete or keep only the line that "half"
points to?

Considering that the full dmesg is going to be available in
dmesg.txt anyway, you could also mimic "tail" program and print
only the end of dmesg, which would also limit the size for the
sake of CI reports and it would be simpler.

> +
> +	len = p - reduced;
> +
> +	memcpy(reduced + len, middleinfo, strlen(middleinfo));
> +	len += strlen(middleinfo);
> +	middle = reduced + len;
> +
> +	for (p = dmesg + (dmesglen - half); p < end; p++)
> +		if (*p == '\n')
> +			break;
> +
> +	if (p == end)
> +		lastp = dmesg + (dmesglen - half);
> +	else
> +		lastp = p + 1;
> +
> +	lastlen = end - lastp;
> +	memcpy(middle, lastp, lastlen);
> +	middle += lastlen;
> +	len += lastlen;
> +
> +	/* add also last message to inform about reduction */
> +	len += sprintf(middle, "...dmesg reduced from %ld to %ld\n", dmesglen, len);
> +	fprintf(stderr, "resultgen: dmesg reduced from %ld to %ld\n", dmesglen, len);
> +	json_object_object_add(obj, "dmesg",
> +			       new_escaped_json_string(reduced, len));
> +
> +	free(reduced);
> +}

[...]

-- 
Best Regards,
Krzysztof
