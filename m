Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131BBC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5A810E08B;
	Mon,  2 Jun 2025 19:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/9FrSxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F9310E08B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748891459; x=1780427459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=3do+gCLUQeZcdkDkQ74+R2ZQf7Qeok4jUt7SnnqYhl4=;
 b=l/9FrSxkcif0pIHVVgHbeYV3sgccFV5E8k6gIk3ZXIiVmQ3R/20q/nmE
 pxFJWCnsFIU0vUweIfdbm77W+dZmBbU4jFPbfRnBkfI0XNciLgk3Xp43K
 KoW0XhGuBUoesgfnNJbOyuXfaFb6a463zP3M60Rfh2OwjMOhFGhFELcgn
 8hGA2wWZcEv6/SPx/avDMr5ZmG3PCZBJIpxDYOX/RwZJC5gmb78GSQQQS
 IYq4ViusZVuE8pSQyCU2mz3E0g9vOU0aXGrL54fZdSOQNCbTYy9i6Wz1j
 ycrB7wWp9TdZ2LYpTOl4XdykrVFqS2oyBUrefU2uPhDz6HiOaP3xaYfB0 A==;
X-CSE-ConnectionGUID: JDiaoxwpQmyvNeDaZKVfIg==
X-CSE-MsgGUID: I/aGMCAoRvqAz57fdS/ZJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50828295"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208,217";a="50828295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:10:57 -0700
X-CSE-ConnectionGUID: YYNsIMG8SWCvN9kWqoe06w==
X-CSE-MsgGUID: 9u0QJVyoQgCpJtHCUe/BJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
 d="scan'208,217";a="149896664"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:10:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 12:10:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 12:10:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 12:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pp4SHw64QN2w45qyGnqo4MA+A9p6KhgAktDQFRHw/XV22+LP4OeUYLNyszSCurPouafqcZVyyviU17/Ol3bHPMKd+JIG1zsqpLBMQTY9ShEL5DpWT3qWriy/LjSv85MElQ2iamntmgP1elTeAvbtEWIRTODVUJblzy+7+blTBm7hX2bQnrxPhPwxVEhKX84NgPoHmuyfU9IUNCKqlj4o2ZT9oaxPaeH301prdjtn9jvHpRDQ2AXRZIjIii9T8fwKGrKvmlAS9XwSzjKBsuYGetSfzu65QG9tHBqNPDZ1FheOvQbEeq/H2RfX/C1JAa8yXQkg+pwIROyYjr7A4cDQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYsWetS3blXCDgL1GDo5DqXJ03sxxbxTpsTbhhFTmw0=;
 b=tA22JMjA8MFyTV7Jtk0QeH+ZL1N1dfW6/Dz44cUq91h8u0ghaqw/g/N0Ulwc092XVJnaxMvYj7c18cL7ZxpZmrub7ubG826PwZ5MJ+hpAcq+j79GBJ4Kk//KyQN46BU8UrjZFRRQHhfn05icjTA4FrpTOT1kRkHNwzQjj8F+L4c7rV4JIR0FRFl4G+wiwNMD2wfn0eVcePZAJuF2xE+e9NNNlODMFemrxXQFeUC5I+c4ZLw0T4LBbMHv3vL8H/hu+6ykZb9pHcScvuLcXKJy82MuM1H4NnEtivUf/k3DLY1ThbNkIPivL0vi3HwbaOrQSPjFb3Xv37OiozDwVNlzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 19:10:47 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%3]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 19:10:47 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Singh, Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH i-g-t v11 5/7] tools: Include local glib header for Android
Thread-Topic: [PATCH i-g-t v11 5/7] tools: Include local glib header for
 Android
Thread-Index: AQHb0L0GlOEHZh6gdkKrDh7+FU3j3rPrgs2AgAS/I7o=
Date: Mon, 2 Jun 2025 19:10:47 +0000
Message-ID: <IA0PR11MB7353467A1AB9160BC5679F53ED62A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-6-jeevaka.badrappan@intel.com>
 <20250530183913.hs7xotbhraap2pi5@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250530183913.hs7xotbhraap2pi5@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|MN6PR11MB8241:EE_
x-ms-office365-filtering-correlation-id: 7ae396de-3af3-4cdd-72fc-08dda2092e9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?T2cSPuhuWHoXs+YoddifP4EWmRLpXnbh59QK69gfV/+73ITJIte4mp/j76?=
 =?iso-8859-2?Q?QlHQ9Bb1AY8rwfG+VIdilviEdC6/FGc9Z/dVK66O0msuYMlYdaofC0xAkU?=
 =?iso-8859-2?Q?zMPWHtEkSb7Nuatl91i3zdQEFHyprUtNIP3tEBonIGItmbEPOiUaIKINUP?=
 =?iso-8859-2?Q?3wrJ1FRu6tkUxydeg5sfRDlkwwXU92JuDGN0HHtnYDquGfq5Ukp/WEb8tn?=
 =?iso-8859-2?Q?mL6xo593XmrtME6N9zq3IkQ+CGEjs/iO+GPt/AZnQtBXU+D/p95aZGFwYn?=
 =?iso-8859-2?Q?Mo1Y8t8Ls7O8xD2OwPmgOspkA7sme1u89SvGNwmt4L+sT0wH9THiika4Vi?=
 =?iso-8859-2?Q?TLU1n0OZdr/JEAHVBswyOsNNqGLUw9ysb2Mvt9oF3KQr2+xpwL5xShuHRQ?=
 =?iso-8859-2?Q?eR5e92BtFchuvJgLxHX84qMq0j2YBpIR864Q1mpADhoLMwr3kdfEAPL3c9?=
 =?iso-8859-2?Q?oO1J9hsSzI6+9y1Wb0trxO/hpay/5iuAiRdbp89R9/KxO60lUmvXXCP7IL?=
 =?iso-8859-2?Q?C6I8HYDryBtdIOVcDjtw3oVlgkR/Bz9Fzuh0Y2VBh895hO9ev6Q1t5F5I1?=
 =?iso-8859-2?Q?rjRfZ+sAAuGqE9Jko2CeUSNmjv7C1QbnR9xIuZcB0YrDlRJIbkXvDsQtD8?=
 =?iso-8859-2?Q?7XRDlah/ofoQYcDsX2N5e1gl1YKlmOGLd3tGlTdBUGz3Yjo26rrU39RBYE?=
 =?iso-8859-2?Q?4J/sK9qBaG6aAg5bbzCcoQ6ZsKoP6IyEHC7v6K6Ycr5m9K18bo7TK4qe5/?=
 =?iso-8859-2?Q?yOTDCzwKdi1aAus6KaHxc4/GfNKdDTZMHD4chiuXu1gw/dfjA6AgfnNnVm?=
 =?iso-8859-2?Q?3oMM+WhsQGgukQgbUDQaxd0myDgEzqhTr49nYc6HqCueRtFYg2a6qfar9t?=
 =?iso-8859-2?Q?MvwxuszkqBEnML0EqtVQLOPxifbPyIPhitxl7IJ3zdXzIMm96c78mc9RlG?=
 =?iso-8859-2?Q?/T3fRFA4tg0+Up8HVNhu+ze1h+RCb/XaWjLK1XFQnURgxAN+hG8cJCHCu5?=
 =?iso-8859-2?Q?FBRoCt7gzCBuJDq28iUT89RYdg9r7pLn7Dgyn4kAGsg4jmBRJCqFDSkwIu?=
 =?iso-8859-2?Q?ate7mDfxXgrpnZQedaW4QaiwZbURqWI9uF/IYS/5ZyeQssIrjtxMuWFDe+?=
 =?iso-8859-2?Q?i6SRV+jMSeadAbzsmN/1qwS9P0vclwVgHMyaZJwUQpzeGX69ehDJxKG7eH?=
 =?iso-8859-2?Q?fSExY68PpHxHAL1hHOGPUhl0vNb1BATFYq6ewqyDVHYtsJZQ0NLEUHkzeT?=
 =?iso-8859-2?Q?sOJRUYLKpPlyJRI1gbfnTeii2gwXKn8WSvhCtyp4Jp5mtVVdQFAFydggt3?=
 =?iso-8859-2?Q?yTyXDeigRA+D1EdRP0K8kbPnUnr7B9jhAgEI0QSFOs+Q8E0IV4JSkDZKKw?=
 =?iso-8859-2?Q?9vWMI6W78n5TlTVaBkxGTirBAHftNVa4WOr4sEwsXvQD4ke5LZvo2caQZc?=
 =?iso-8859-2?Q?dd7GcrKtD+z6V0qax5P7WeoxGUSSNctb38QaRa0X8NY2l9ZwQHdro5Wxpf?=
 =?iso-8859-2?Q?2s2zEc67iQjry2HMHtCyMbBoj8oIw1Sl3ZXmzSwNfvweQZuVKDJpA57LF5?=
 =?iso-8859-2?Q?pK3FGAc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?X9Xb8QS0gwYHxMuTYWqJbuqhiUY+NAg05c1WNxN2ChtraluxppzUSbvkgB?=
 =?iso-8859-2?Q?iCA+AOs6v6cQR2pNP9q//HWWJfqibrzzTyi9FnrE756RJbd8mYzz6d1XwU?=
 =?iso-8859-2?Q?gr5yL7nx+Bci8Tqsbh5hAtoVsnLaH2piuuREbDHf+jNYPF13LTBrmVXuHg?=
 =?iso-8859-2?Q?4BjvKaL7/UAmRgKOZlYHcz7baCXdhNX/JQAYe0Qvmal7wIY6x9cdUjstRW?=
 =?iso-8859-2?Q?XK61fKMZYtDzVyblyCZMmfkFK3629U0tPKdl+oMJRbOMjDaAsoWYYw7+9E?=
 =?iso-8859-2?Q?c4/K1rWCBQZ8s7VZA9hXL1NUR+r23D/wEWfTnFieoLFhFWhkiMzHg40gSd?=
 =?iso-8859-2?Q?loQSWwtSkimQO/eHilN+WmcCgw1rzOb6LJlPAZ5RkGixEMAGLzBu7/+FFD?=
 =?iso-8859-2?Q?W8ttp62Ptz5+DQPZr0v2nyOSz/bLbpd7bWIJ1SQmt9Fc71F+d6F8XneOL4?=
 =?iso-8859-2?Q?GTftIBnXCdmBGdQAmu7lCvrRPvRPTYsXHLL5fl+Y1wtte2AJ6RPG85rdlj?=
 =?iso-8859-2?Q?46JQwKavPERGQrkOgMaAN9ly97PdohOsMRgah8UTv24S4fp2NdOuQclRs3?=
 =?iso-8859-2?Q?vFtXz50HiIa3JV+wWJrRTKwAmdbLT9W+DRKkElbrLR1lfcfEFzqhvkX79u?=
 =?iso-8859-2?Q?HrLS71gZ/qPoYak+5ArP/sRM2veHoV7ZU6p+TxdqiL1WELUzwdoWmZUGhc?=
 =?iso-8859-2?Q?xz507w32Zd02uBCJZ7bhvP/4Hhqtc3ymZdpDbCizDbalGRkt7ufszmgos8?=
 =?iso-8859-2?Q?qG2uSUTaaAwplLbt6OoePi2/gZSJF0max3tSt5XN32udZ8DWmPhQ+7Nu+s?=
 =?iso-8859-2?Q?B9z2r1sjs8ha1cT+OYSYqdQqIiwOKovaaSSYMs0wLqBMPt4Gako1juzKBd?=
 =?iso-8859-2?Q?56ui6hnXQGzEEdIGJeFumfoP4hIiMaxJGEJ1LMe14KpX2T/p1Q4UWrQh+m?=
 =?iso-8859-2?Q?OUNsUTFztZjnJhOmxdJAhr1c94aySWyV9+valsqYncEB6HIYLwrKcD6qML?=
 =?iso-8859-2?Q?iA+KrH3+uCBKApfx4QQby0l/N7S0gYK+SSS8oj2uXmsjC/wKehvbHCj7IB?=
 =?iso-8859-2?Q?qqf8/FWK0B3ls5l76b0YSEb7CU+RFd7n3/qb3puMftYP10WoNYqZraN0mB?=
 =?iso-8859-2?Q?5plhjYTkkikOT9uF+Mj9qkaYJNeQAii/z3Dt3JLTslGgBhJ47eZ8MrgHmC?=
 =?iso-8859-2?Q?JPVGf9JPyDxcSa1Wj5pQIjcbKBjBRI52lN+SC78oQYqJtZpT4diUmcvMLJ?=
 =?iso-8859-2?Q?8/1MWTeYMJAQaxqk5JplZW3pJWSZh5jKh3TUPbkF0OVvzppaZfy/gDz2Eb?=
 =?iso-8859-2?Q?tCBAhJCZopP56Oy3RqfQRvHyGlSUx0fw47ZuOfk+SDtgAjLN6H9sC+uFMq?=
 =?iso-8859-2?Q?ACWcjyE5EZNP4cEKaBmUx6E14u9Jigh6hByKA7np8wssmNLT4YNIeCQWsH?=
 =?iso-8859-2?Q?jVR2ZJc1Kfnv/bT6VB/hpGRzkvjvdzSxpyEdIiSKXqxor3uDbDwCHAWYOH?=
 =?iso-8859-2?Q?O678/lAXqkzgcYXnnOlsPi8dfpYlTwkYxtv4D9t+9e4mYajQRSULHkaZgH?=
 =?iso-8859-2?Q?OTEcQQcDEQ6eiXKTRl/jjkooCg2wgH5rQhv2aSxkxS6C8SyiWjaTZsgF31?=
 =?iso-8859-2?Q?yoxxajswz2XuN9JGA2WFatmltowLbR1jJn?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB7353467A1AB9160BC5679F53ED62AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae396de-3af3-4cdd-72fc-08dda2092e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 19:10:47.6693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUS47dgrdmr6VXELeVIL/7B3MA+eK+vO3Cn1ZUQcKuSAwkSpMAQqyrm3/K8EyeC4F8Us7EoSp53s7iIlhjqWDCvIG2+QuOGWgGF4y6A/qTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

--_000_IA0PR11MB7353467A1AB9160BC5679F53ED62AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> As glib is not available in Android, added local glib stub header to
> build igt for Android.
>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> ---
>  tools/igt_dp_compliance.h | 4 ++++
>  tools/intel_pm_rpm.c      | 4 ++++
>  tools/lsgpu.c             | 4 ++++
>  3 files changed, 12 insertions(+)

> Same here, add some NULL handling to avoid NULL deref errors.

In lsgpu.c, g_key_file_get_string is used and NULL deref case is handled pr=
operly.

Regards,
Jeevaka

>
> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
> index 5b1688039..226a13662 100644
> --- a/tools/igt_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -28,7 +28,11 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>
>  extern int drm_fd;
>
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 9622f0552..c1cc54b82 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -24,7 +24,11 @@
>
>  #include <errno.h>
>  #include <getopt.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index e68390083..6cfbf3142 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -24,7 +24,11 @@
>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <libudev.h>
>  #include <string.h>
>  #include <signal.h>
> --
> 2.49.0
>

--_000_IA0PR11MB7353467A1AB9160BC5679F53ED62AIA0PR11MB7353namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Kamil,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt; As glib is not available in Android, added local glib stub header to<b=
r>
&gt; build igt for Android.<br>
&gt;<br>
&gt; Signed-off-by: Jeevaka Prabu Badrappan &lt;jeevaka.badrappan@intel.com=
&gt;<br>
&gt; Acked-by: Zbigniew Kempczy=F1ski &lt;zbigniew.kempczynski@intel.com&gt=
;<br>
&gt; ---<br>
&gt;&nbsp; tools/igt_dp_compliance.h | 4 ++++<br>
&gt;&nbsp; tools/intel_pm_rpm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++++<br>
&gt;&nbsp; tools/lsgpu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 4 ++++<br>
&gt;&nbsp; 3 files changed, 12 insertions(+)<br>
<br>
&gt; Same here, add some NULL handling to avoid NULL deref errors.<br>
<br>
In lsgpu.c, g_key_file_get_string is used and NULL deref case is handled pr=
operly.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Jeevaka<br>
<br>
&gt;<br>
&gt; diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h<br>
&gt; index 5b1688039..226a13662 100644<br>
&gt; --- a/tools/igt_dp_compliance.h<br>
&gt; +++ b/tools/igt_dp_compliance.h<br>
&gt; @@ -28,7 +28,11 @@<br>
&gt;&nbsp; #include &lt;stdio.h&gt;<br>
&gt;&nbsp; #include &lt;string.h&gt;<br>
&gt;&nbsp; #include &lt;stdlib.h&gt;<br>
&gt; +#ifdef ANDROID<br>
&gt; +#include &quot;android/glib.h&quot;<br>
&gt; +#else<br>
&gt;&nbsp; #include &lt;glib.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp;<br>
&gt;&nbsp; extern int drm_fd;<br>
&gt;&nbsp;<br>
&gt; diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c<br>
&gt; index 9622f0552..c1cc54b82 100644<br>
&gt; --- a/tools/intel_pm_rpm.c<br>
&gt; +++ b/tools/intel_pm_rpm.c<br>
&gt; @@ -24,7 +24,11 @@<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &lt;errno.h&gt;<br>
&gt;&nbsp; #include &lt;getopt.h&gt;<br>
&gt; +#ifdef ANDROID<br>
&gt; +#include &quot;android/glib.h&quot;<br>
&gt; +#else<br>
&gt;&nbsp; #include &lt;glib.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp; #include &lt;stdio.h&gt;<br>
&gt;&nbsp; #include &lt;stdlib.h&gt;<br>
&gt;&nbsp; #include &lt;string.h&gt;<br>
&gt; diff --git a/tools/lsgpu.c b/tools/lsgpu.c<br>
&gt; index e68390083..6cfbf3142 100644<br>
&gt; --- a/tools/lsgpu.c<br>
&gt; +++ b/tools/lsgpu.c<br>
&gt; @@ -24,7 +24,11 @@<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &lt;errno.h&gt;<br>
&gt;&nbsp; #include &lt;fcntl.h&gt;<br>
&gt; +#ifdef ANDROID<br>
&gt; +#include &quot;android/glib.h&quot;<br>
&gt; +#else<br>
&gt;&nbsp; #include &lt;glib.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp; #include &lt;libudev.h&gt;<br>
&gt;&nbsp; #include &lt;string.h&gt;<br>
&gt;&nbsp; #include &lt;signal.h&gt;<br>
&gt; --<br>
&gt; 2.49.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_IA0PR11MB7353467A1AB9160BC5679F53ED62AIA0PR11MB7353namp_--
