Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5A3C54756
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A510EB5B;
	Fri, 16 May 2025 17:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og+X4Fmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0410EB5B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747418360; x=1778954360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=XeV6ADjye4b0p9ZYbmdiNZCz7FIaysvFQAW46TKtLnI=;
 b=Og+X4Fmrbegobn5AacoEGfKoigN9as26yNrJ5JDbWAyNM/meXJ+l83tY
 Z+khcbHSMeJNHLwqMgIBlhWUKHYEp11Fhl9Jl5Zp6I0k5mJCsV+Uw8qLy
 VPtq66Y+a68hIkda+P5Z4CjR0oo94YaGtrZZoFtI26rgbupg+uFJJp2BJ
 GrYBcc3cH2TNBOrp+g3sErtKnQkIQ2er/RSbAIR4WB5KdZ9wvyMiy5B4p
 x7sntCzkMvpUgDOqLFNjEpT5/77Trml1xrNd6fQ+EERTligntvxObmD5u
 c4NfdMv812dwiwNw/PT0zaaCZSJ0tTQo6lM8RRK0ugWedrVeBnEk9UYOC A==;
X-CSE-ConnectionGUID: ZCiLpeSxSLuAxKs7G92FuA==
X-CSE-MsgGUID: 5ru3Lk6/Qe+g1+VzHKidtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49538792"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208,217";a="49538792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:59:19 -0700
X-CSE-ConnectionGUID: zXiGEeCFQcaGfrhPqNTa6w==
X-CSE-MsgGUID: O4UPPmv7SSu5olFOl4llxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
 d="scan'208,217";a="139285739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:59:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 10:59:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 10:59:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 10:59:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMonkaJdLwS/z863IQ32luTdiWbYDnsLbXYvTJr1hWIYoEE0Yu65JluMuWQsSCix/37d4VqrHB7kHx8gPiuB4G42AQn5JodsmG82UHNcv1BEpPnaJL8qp0lXOfFyz1Whp5ZJIdOa5ynghaz34+ZbAztBLolPFoLw90czuemgFrj3jy5Qk6min0cOJALcMsfz0XW6BSSMx+f+quOw9siUi2a7zzXS2zEJdZwZWKhVXAiCe+jKMmJlyPcX4dUjcgD149YluIUY9F7rlISogX812o14N0jKII93JN8lCCD06i46IO8TAFr89Y2qvmHNM5GdEKYSm43cCkGcOtUqvl/LLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeV6ADjye4b0p9ZYbmdiNZCz7FIaysvFQAW46TKtLnI=;
 b=cI7n80w5Nt0mOAX05fZfFQABkr5eWH9KlnYBqUpohZB2xRyVBl1AvP2O9ILaX5fnZ6DTWkvFliFABXyAg1oAsO/yw66g3RtxF+uZfck/KTlMHlay+aP5ArGyWE2xCOvkHQdqdCJw+44mqsCvjI32lHiNR+wXtaj+EGnhVK8kSNEKywLXsi140IojeZb1wm98jB49p00DA+wPXsF+M6OLOco+efbCy2X6voO88tw6ctswXPsfrJDtLTF/X011Ite94ukPxL+pcXGR2OuQ5THyCnRirgGykNIHZ8U4X9YP1iq4ln2n6xRjlh827kuReGBHqwehnJp1d8XXssGrqKDHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 17:59:15 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 17:59:15 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Singh, Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH i-g-t v6 02/14] lib: Include local igt procps, glib and
 unwind header for Android
Thread-Topic: [PATCH i-g-t v6 02/14] lib: Include local igt procps, glib and
 unwind header for Android
Thread-Index: AQHbxnx81p7oPx7WDkC5+hMO10lxRrPVf2aAgAAFL2Y=
Date: Fri, 16 May 2025 17:59:15 +0000
Message-ID: <IA0PR11MB735343A41841DEEF416F8652ED93A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-3-jeevaka.badrappan@intel.com>
 <20250516171557.mqodeykooid2b7ju@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250516171557.mqodeykooid2b7ju@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|CH3PR11MB8413:EE_
x-ms-office365-filtering-correlation-id: 5e2b79e1-7185-42f9-0866-08dd94a35f6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?3lIXSRCGJD3L1oC42r/68P0h+JnA6bAAP6I5Tavmb0vYmptNyyZZXTgNkU?=
 =?iso-8859-1?Q?rIKHR8Ei11MVB4wkekUCgTJw+bgcPk8Ttw8dWaLZyZafjBGn5sUECSqzIy?=
 =?iso-8859-1?Q?OzChTGPL+w6qYODju4DzNJNDFsTdlV8iH8gr6wmi2QW3xAGV2H6KkqZBVm?=
 =?iso-8859-1?Q?O++zPhjsKGmDP03bqf7LEPoD4ebpPbm5HlMwKjwNw6gm7YF8akInvTJTC1?=
 =?iso-8859-1?Q?w7Ym3HP3ogpwkxS8F6YKCFogqJ043/0m/15K83+ylYgeiQ0KkCJbawTI4J?=
 =?iso-8859-1?Q?YfP0XkadT0RT860bGc4shAkWjG79nlVkV0Gta104ipxF+lS6ohnpdpqXNM?=
 =?iso-8859-1?Q?cKSQwaJNYtKCnYv2emRkYLFp1uRQ8vnAtNUnsbmTLTJuX2oLq6m8wyuh3y?=
 =?iso-8859-1?Q?5tjJKZ8nVkVGK/4qHFJNM1SdkHW0HzU8TQBQjqqomT+lAm+qQT01vQjs7V?=
 =?iso-8859-1?Q?KKm4xCLwQdgOtj8zYXnclntKRpM3I5Q7jS2iTRrC1fkaEQ4eEzn3Mo3oid?=
 =?iso-8859-1?Q?KPy3RMyo6DfFw8dLb7ghOPFUPHOQy/uYlqQ68EwxwZduBstvFoT4bNej5I?=
 =?iso-8859-1?Q?CX3CzEGe9TGlZ8bbYt5DXPrmlT5omq+V+u5R6mIY6IVRrshyCfTeose+bI?=
 =?iso-8859-1?Q?kL0/ksc1P1Z2AJ/gmMXkNEK2wWYe7XF/WS5h9PMDfdnpNTQpmJ+9xQ7/fa?=
 =?iso-8859-1?Q?wZ5aQPsKtoeJhFhiqrULtyGOfu8hbtuVy+A2Oetih550MbwU2Hxq/y3X+Y?=
 =?iso-8859-1?Q?LhWgQjd2Dp+re27zsTAaM9s/hD2CEUTbkfh2vPHFalCES/4NbjJZDGONoP?=
 =?iso-8859-1?Q?WoWVflBsb+WglFGth6cgTYUBw1v3ic19DRItPg707saXHQvuKaV/0Tr6Qu?=
 =?iso-8859-1?Q?/UDBn5OZXa7jeAT/vWlgNlHDsv9JxXz8xndcYRX/5btYjpqwwyGRNvctYd?=
 =?iso-8859-1?Q?jPzx4hOqbgIXrNylQzHfJe8ueG3zq4Bixn/Budb/DR/2tl/H4FwbratNpi?=
 =?iso-8859-1?Q?xoYZXuDlUSBMfSbmy+vRtOgabwlH7MvLgLzLDCblCFRhiRh/5ieZLCna5U?=
 =?iso-8859-1?Q?2dslcxd2lJDQng3RUz4nh5yawKStVDorvi/pSM0WGgjl0kmQbf0053lx3I?=
 =?iso-8859-1?Q?DjWJPilESjQ3X8WjobehJkHHrqEgX76d44cUxugZQw3iZwoB8iiivjSSae?=
 =?iso-8859-1?Q?g1Qr7GFvZdmWoEXXgfYO2NEqNL01xuDKXy41+fBT1TudRZITkaioYWlero?=
 =?iso-8859-1?Q?DLgHIod//X5tHZSoQz6sIDkvI5UOUOhmckInzVlJa2PI/EmeVUgxEeiN76?=
 =?iso-8859-1?Q?Eb/ULYCv0Ky3Cv8X7uw6LqxxQnN/0Rgfe6sJZMRrlqPTla5OLt5tzzcfoU?=
 =?iso-8859-1?Q?HOwOCmCGubZk+hOEi/pBmzxGL56gwCwesaUkFxKDAl7oFm4xSKsv2s9ER2?=
 =?iso-8859-1?Q?W+7MMRBG0ft1t0+Q251/jKh2gyahb9H5z8AP9s9SCBnPGn89pUn973Of6/?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PH35UMDOR7FsncSvP/LYUwv1Uj7OSJKv8t2Fh2xSTVJ+52WHEQL9mQ5VPn?=
 =?iso-8859-1?Q?deIodzM6ZtcVT6BTkZaocZRyr1EJJYac3u6TRfUAUj90gPy8FGlgQ1Z9r8?=
 =?iso-8859-1?Q?TMe5LBS7uzwCWoBoa8DNH75J4fkx51r2zzsEbNfNdtSF5rP7VLLn5yWFcG?=
 =?iso-8859-1?Q?o8fGE0YD7Yoh6BurdEAyjdeGr7LQASLO4b1Q5Xyy7uoq9YIblPF6HPdDSA?=
 =?iso-8859-1?Q?wSsZokRV4wMBwymFQnqAoL/QZfxk6E5L7z+PxGcoenOSwrGtDwotqj/bMA?=
 =?iso-8859-1?Q?HDLtTghB4RFWwyxGDwXfcu01dIgMHkHpnD1+uK40lQYgISsQLkYLnA0udt?=
 =?iso-8859-1?Q?Etg/Q6KeE1pLCl7Bp08/WIbisjmbcR2ZgZRfLLiSbMRvUxP1dB3duMY2c3?=
 =?iso-8859-1?Q?vZVbJvB390cLPzDCTUF/u0bbQYFhiVeCQdx+bDhDaZvQsl4RzX589qDJPV?=
 =?iso-8859-1?Q?m78TIQspVrvvY0PLGqBfHS6gUR0soUcFahradUgv9uwYgReO29sACRzHhz?=
 =?iso-8859-1?Q?Y8WjOub3Fzf8DUWsXkUUGmmr6mN6BtjklTw4wq2FvwvIebBJ/YaZ7VJ+H3?=
 =?iso-8859-1?Q?QQ7Qdvh8TcCM7vtjjkRwi+OTAUGnxl8HylUzcgGElZowDX/LNEkZnhAER3?=
 =?iso-8859-1?Q?Ho5z0ovqqJMq35qwH4hHWo9K9fkOd9wpJ5jU0NGhHoZ4K4/AMnB/rS3+OS?=
 =?iso-8859-1?Q?zSyMaRr7K8tqHMt9iizH/bVjGUH4GHV5u4k+Zig9D0XyrgIPpnAvtswk/n?=
 =?iso-8859-1?Q?uYTUI4AXFqUJcjLCF9jKkO/b1K5HLMKZigVUhntTGxVKoiHf+OTrxnkcWF?=
 =?iso-8859-1?Q?Y9M/WGV4VAAxpChswY4gZh/Nm24YlWmsLlBqzfsK0wkhxNnuLG5PnAq29Z?=
 =?iso-8859-1?Q?ICbDOznebmX6QmHEFSgXhEdhbkId690EVjJdcjaQhVoOPqP669ISgb4qB0?=
 =?iso-8859-1?Q?nY3WGTR4C0CuS08zgMD3rsKqzKI5QHw7LBPr8Ff61sJW8PHNWISO5/PBMz?=
 =?iso-8859-1?Q?ktE+Dq0f8LNUR96wqMIARwiSOHSo3lyWqCCMeGC0ZE+TOdaDLjY31V99jX?=
 =?iso-8859-1?Q?LkQ9sHTbVU0rsn67Y6Bl3sWA6aMz8DTV2+Oom1pYFVaMuxroNxuGw8ukNp?=
 =?iso-8859-1?Q?EnqlcRLP56bobzNl/P4dUUxVzPtN7OXRbECUuwva2/NgiuH2SW9FALFKxG?=
 =?iso-8859-1?Q?EudmfhJv46FwWe0IG62A9cC6eX5wBnMeq0fdb1CiLM0CigxCFnmgvg8JUx?=
 =?iso-8859-1?Q?x8q6Loal6u9dXIHYnQ7cj6iRHu2BBQa/e/sLR9fFuz0n2OB5TrCLcCYvjO?=
 =?iso-8859-1?Q?b17S37mzzjN5ePgYy2ZFvxbNN6BVgCn2K8Dm5k3dQuLnbQLCFu5JodlfDh?=
 =?iso-8859-1?Q?pdVht70rlA96vSelslCixILIJVp4+tSTozYl4Zd2pBtqlM5qNU1sUk6g/L?=
 =?iso-8859-1?Q?8HdYhF5j1IUNH1g0IgGChYylVclUzOVSll8j8Sn5FQ+eTErp7XPCOjc0oo?=
 =?iso-8859-1?Q?/hAih5K7xkJJEOKZqOJ89yzO3cxlcbKEvF3AhQhUam6tF9wWD8o0scICJI?=
 =?iso-8859-1?Q?OoEUbwpHJYItOrqCf6mXWDfHXhgKZW1kX5p3Ob0jeHV+93M2AGZbfJt1sI?=
 =?iso-8859-1?Q?3Se2UcarkgCJkd+pLw0JLzevNTLH2A4p6L?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB735343A41841DEEF416F8652ED93AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b79e1-7185-42f9-0866-08dd94a35f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 17:59:15.7430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HY2VqReCsKNhFWPlYqRAboV3y4xIHEhdho5dsyAoxW/4SnSEXPNWsd28KXtfaCQfa3/jQ6ozawa7cnh2SipgaWTrBqwSqs6CT3q1wHHY3cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

--_000_IA0PR11MB735343A41841DEEF416F8652ED93AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> you need to add description to every patch.

> From subject:
> lib: Include local igt procps, glib and unwind header for Android
> it seems you do not need unwind here as this was worked-around
> in other patch with HAVE_LIBUNWIND. You could add it later if
> anyone will write a replacement.

Got it.

> Can we replace glib with other alternatives? As I understand it
> there are uses: hash and regex. Hash can be replaced with igt_map()
> and for regex why not using pcre lib? See
> https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions

> +cc Petri Latvala <adrinael@adrinael.net>

Can we take this up in new series?

Thanks and Regards,
Jeevaka

--_000_IA0PR11MB735343A41841DEEF416F8652ED93AIA0PR11MB7353namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
&gt; you need to add description to every patch.<br>
<br>
&gt;&nbsp;From subject:<br>
&gt;&nbsp;lib: Include local igt procps, glib and unwind header for Android=
<br>
&gt;&nbsp;it seems you do not need unwind here as this was worked-around<br=
>
&gt;&nbsp;in other patch with HAVE_LIBUNWIND. You could add it later if<br>
&gt;&nbsp;anyone will write a replacement.<br>
<br>
Got it.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
&gt;&nbsp;Can we replace glib with other alternatives? As I understand it<b=
r>
&gt;&nbsp;there are uses: hash and regex. Hash can be replaced with igt_map=
()<br>
&gt;&nbsp;and for regex why not using pcre lib? See</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt; <a href=3D"https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expre=
ssions" id=3D"OWA44c973ba-21ab-6cc9-14a8-1adc9fd31754" class=3D"OWAAutoLink=
" data-auth=3D"NotApplicable">
https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions</a></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
&gt;&nbsp;+cc Petri Latvala &lt;adrinael@adrinael.net&gt;<br>
<br>
Can we take this up in new series?</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks and Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Jeevaka<br>
</div>
</body>
</html>

--_000_IA0PR11MB735343A41841DEEF416F8652ED93AIA0PR11MB7353namp_--
