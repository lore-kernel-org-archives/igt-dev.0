Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D31EE6426
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 06:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05AD10E01F;
	Wed, 18 Sep 2024 06:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA8LoEQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F2810E01F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726641881; x=1758177881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fS3i6r71XoO/lB0Pt0xcqOz7u8GTMbMnNRqBPFx6g3o=;
 b=gA8LoEQJqPpwjUqemtbRmAGGRXsb6SVP+6qKWXs7DV6tDglX5b6o71C2
 fZ26i4Tbf1Ldd1qLjPx3jBn6rE8FsuaIXY0OAgNkNvzOu3woqetTcmKLn
 HU0U9GelqB/7JYMskkKvlzQLt8HN3wUB2stmrv/5mecdlBaazWTRVaa7s
 Nyu41nWNX2mNuXVdanv2NS7KIsvdS91A1qQDI33zXK2dhijw0J0BGpz6V
 jncTU0SLgTef7HDENWtJrzEe9eFYAis4P118zGVVSgNdCTe+2UZC3AvZb
 9mC/IGW5LEnUKH9yldsIz8IxdHdHGBNt6Thay9jXztnKf41VEjoe5wUfk A==;
X-CSE-ConnectionGUID: W7RPql69Qa2iwuxBBTi3Nw==
X-CSE-MsgGUID: ng2lh1lmQNmysqz3CGjSVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43009337"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="43009337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 23:44:40 -0700
X-CSE-ConnectionGUID: ExM973JVSIaAlS9kG6TyQg==
X-CSE-MsgGUID: n8pKYfYKQ8GMHrnccLGoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100125069"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 23:44:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 23:44:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 23:44:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 23:44:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 23:44:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfe3em9WP+ISysn3LOYEdLneCw8H/rc+9HykQ6jS0FTPLmHpmaaLdH6cmdZa4wnZcWAFYyFIB9t//TT5A/hlOo+MjYsEdQ32vX2PKIDwK175WO5J2FAyOgkTAF36mBkF4uPFwrZsHqZc2yV5+bmgxYMB/xNA8vB7wuxnMYVwc4NdYGiUv3nsGk2kblgIOhqUyHB8G7eEN0tBc+qiyQrJFHxFh3WDRqle7A1Rh8AGyWywXLOYPzD0/MD1XQ6DL8hwOG/OJ/+9uXSuJ91q5o3r7EiUvHrdaTibtByX/Jb1j6hskw3TKWp5YXNgKZZu9V70kkd6j0W+q+s+OQ46hiN9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS3i6r71XoO/lB0Pt0xcqOz7u8GTMbMnNRqBPFx6g3o=;
 b=UiQ3dVjeVDnAmCG1xIkhJBs2E2iG/pHFHKtr4rlsvOgyEkee2ZSgTZ5jJfBL5rcfTvAD6Xt0XM3J3Wwk17hLs/7nOMpk0DQX+oK4JmmOFFETYxRRNjyczWYwuaEuUt6D2DodpuuZnWaBv7/0EhH1+1rZUDcsYAO9Camu0hxC43imRBTUUHq3RAfRYxbzXkL/gQ9DHr+6wzPyCqV8U4Y9NeWvuVQl881LIce5BV3xHgSLbm3deAXAWgp++djCtxb020Qw/G9dnJhJ2cZn4PjnPfQAKW5J29JDPdEkScz3ns0pcdl+jQ5etOMKrfruJz9At1YFDvbH87qbL+OOnYuyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 06:44:36 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 06:44:36 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v6 16/17] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
Thread-Topic: [PATCH i-g-t v6 16/17] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
Thread-Index: AQHa/3YkQKiN+DZHYUOxWuIRM2CjWLJVpCMAgAbOHQCAAKCKAIAAGrsA
Date: Wed, 18 Sep 2024 06:44:36 +0000
Message-ID: <de331d9a8268938a25514c90de43669600f84788.camel@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-17-christoph.manszewski@intel.com>
 <20240913113902.pdjcijg3ra6ej7ec@zkempczy-mobl2>
 <dc2e936b96901d45b31b15f77e4e9e69f6483543.camel@intel.com>
 <20240918050854.7f4gs3vjt74nxr3f@zkempczy-mobl2>
In-Reply-To: <20240918050854.7f4gs3vjt74nxr3f@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MN0PR11MB6160:EE_
x-ms-office365-filtering-correlation-id: d1676a48-3f69-4003-e7b6-08dcd7ad5ce2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDFwYmZ1cEZ0WnZqZTd4bTNXYkNXdWpRTjdrTklNYlRLZXMyV1hIaTNMOXpK?=
 =?utf-8?B?WjNFTnk4M1dVUUwzQ20renZuSk5ORHRadXBmVTdEeEFOeUxicTVBMVJ3bURG?=
 =?utf-8?B?WldmTkQ1Ull6VGVkdG5YQmN3QWhJQUZhbzVFdm5taVYya3F5d05lK3FiNUtH?=
 =?utf-8?B?elZwazQzcU9tVi9NYkVRdDR4enRkUXNpaFhZcjAxZnpKUURGaVNNbC9TdXc4?=
 =?utf-8?B?aHFMZ3I2R3lFOHRDQmhYN1BaVThFUTdqcDF4dnNvcFpFZXpuR3RmYUlhQU1V?=
 =?utf-8?B?OXNreUlUdlB6dG9lYXZiTUp0clQxYVVLaDc5aUkvTXNmZHV0WWVKN0pvRkRt?=
 =?utf-8?B?cVJQTDFvZlJFVHgrV3lHaGUwNEx0Q1ZSQnA0U09vRms1NG5rTFp5bVZuWlVh?=
 =?utf-8?B?aFpYWTRORTRIcFpNTDdjcko5U3VJSTdnRVNPem15TmR6cHEzZWw4dkxQQmsx?=
 =?utf-8?B?UkNkcTkrYVZ5enVGRG5hYzdHMVFXSjRqVU5uNWtJSGhmekZ5b2hHbU9seENp?=
 =?utf-8?B?S3g0RW00aWZrSWpIbFpiTnpLNnZRb2FFQUFuOUlMQzhROVlDNnNUdlRRMTlQ?=
 =?utf-8?B?MlY0WEpGRzRDUEZzVEpOSGNnQkRpQ2dnRzdnWlZNc2VvNmhiSnNUeW1HTVFD?=
 =?utf-8?B?UlFqd3EyS2RaMDlZc05EbnI1dnA1UHdHSlFleU11K2lpVkhzUS9wVDNNYWpw?=
 =?utf-8?B?WDB3WHhsRXpIQ3NERmVFdEhzZUpBK2xkUnRpKzhkbHJuMGFzbkx0VUl1SzE1?=
 =?utf-8?B?NVduQjl1WmxrTDdlajl5OHFGZHFyOW5rSGJCRFNSOUc4a1BxQy9FN3RJZ3Bz?=
 =?utf-8?B?OVVua2pORVRDUG9RdlFjRUpBR200K3VuQUo3U3BpU1lPa0RMK3JROTFJZGQv?=
 =?utf-8?B?UjF4d1FkcUU0Z3dDREk4T29ROW1tUWtzZTV6MERIK3lmYStLc2xaaTd2U1pN?=
 =?utf-8?B?V1pjVWptcVlvUm9YVm1mek5FNENwZjRzTDNpNko0emRXR0RLcUUySnRUWHBT?=
 =?utf-8?B?bG9Pc2NTMi9TalphRzR2ZFdiL3FDVWxxa2U0bTNCZXlvUXJoSldFS0xSME5S?=
 =?utf-8?B?WUZSdDdTaVdDR09JTWlXRUJkZ1huYXJ2N2dYYXdCZDhUanpxZ2JwOTh5MEcy?=
 =?utf-8?B?QlE4TW01eStwekdkRU5oemZtQ1NYUU5WWDdUNlNRYk5mWHV1dUYrRjFzdHMx?=
 =?utf-8?B?SnZYYndRaGNDempFQVh5VHBoTkZUcjlaOEJzd2U5cDBnVmNZRXcvMExLL0Fi?=
 =?utf-8?B?ZGVuUHFXR0JUQXJaQldCNXZRbXZxdXdGYkZSdzhTeFlPRHdkYncrbVl1SjhK?=
 =?utf-8?B?M3pTR3U3SmhJVXQvcW5sOHZrRlIrSTlTakRwLy9iRldibDFDOTgyQVpEQnZI?=
 =?utf-8?B?UDVhZENsRytOczNwRkEyamVjWnR4bnNCS3ZIamwrV25UdUp6Z2JzcUdSY0RF?=
 =?utf-8?B?NmlQQk5PV3k0dFoydDhYc0RZV3hTeXV5ZzRDaVkrS0ljSmNQUHM0VEdBd2hS?=
 =?utf-8?B?bFo5eDd0aVVibzdpRDh0dGxhMCtmSHVJOWk4ZnZNdDZNUkoxK1U3elNXS2ZM?=
 =?utf-8?B?K3lXOFVTVE1sTzZZODRlN2FxeDYreEI3b1ViU25NTDZQdW5ZMTQwdUczSlRE?=
 =?utf-8?B?bmxSSEVISi95OUQvV2RvQjFRNVR3K3FQNlFReWcyZlhzUXk5VnZ6ajMvUmdq?=
 =?utf-8?B?ZGV3em04T3R6MGdOMHJzL05Nb09YQitpRzRuZ2FIT01oTWs1OW1JWnlWTTVX?=
 =?utf-8?B?WnZPYlYvRWNBdzRsYzRtYVI2VURtUjVFTzhURHJlVmFVTHBMMFExbkpxZ09s?=
 =?utf-8?B?U3VxTW1LZHQ1WHFOVEFPTk5HdW9pcVZrLzVKUkdONW1EMmVQanUyZ1FvVFpw?=
 =?utf-8?B?THJQaDVPMEpxUU9GdWR0RkxFUzJ0TytsYjA1N2drU2dKelE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUhrV1hOMGp6SjhOeWJuOHFWejgxSzh4RnR6ZmRMeGw1aCtxczZiL1pQdnpz?=
 =?utf-8?B?dC9iNlhkTVVYOERmTWs3b3RVbFR2Y1R3MWJXLy8wOHRUYWJKaXNUT2xrdHdt?=
 =?utf-8?B?SW1SQlhjR04xaDhOdFZQMEwzMEN1QVhKOVJRQ21aWFc2NzhQVlg5ZUZmTlJY?=
 =?utf-8?B?YkkvQ3pmVi9tTGp6RDJSUGJBb2wyb1NCSGtSYUVvRUxJdU56K1lXQnpNWWhj?=
 =?utf-8?B?RHhNaXpOWUt2Vkl3b0dXOWEwRXZvMUxzMHdVbzNHd3VjdndMRVNVWXVCR3Ru?=
 =?utf-8?B?REplR3lyZmU2akNvd3JVbGxSYlh0aEpZYXRNV1FMRVUrVEVWSUpqaFkvUW0v?=
 =?utf-8?B?RVhUWldrQSs4T2tRNFgzODBtdStzRU95K3VlWlRHMldSRnc5NGl6dmFzak5H?=
 =?utf-8?B?OSt0MG9HMkFFODh1ckFuSFlUU213VlNYNjR2Yk1qQmQ1Z2xnRVJZRnJ0aktX?=
 =?utf-8?B?OGZxWXpQUjRiK1U3bDkwTmhqMlNtT0hrUjZQNXBoWFIrYTU5ZTlPWWlnT3Bo?=
 =?utf-8?B?OEYrZEpHVHdFejc4TEZoTFh6NjJ2M1IrSUJJTmpLd1MzK3d6Q1JpUFVTM0dG?=
 =?utf-8?B?RWhYNHlFWjFvRk9LVHRNK2wxcDA4MW1IUThhb3BJeXZSYSsrYitvV1hUTERR?=
 =?utf-8?B?UGY4YXhEb1dQMStnQW4xLy93dzhLQWZIQ1RPZWJiOHdvV0IrNGpDc0IxaWRi?=
 =?utf-8?B?ZEtybGZsaXVxQmJlRUN6VTdQSUNkZUkwUFpFNzVUK1VCcFhkeE9nc2VCb3BN?=
 =?utf-8?B?dnBGZzhrZGY4QnBTcVQxNnJYUkNpMnFPSHpiSHZUUHQrcnhZNnZsUFlIRHQ0?=
 =?utf-8?B?WmNFVUlvOEYyM2JQMVVsaFVLUkl5S2VGOXIvL2J3NThsdytITGxVM1kvTkZW?=
 =?utf-8?B?NjV3bFV1bklsOVVtVTBLNmxaeDhWR2pFSWJxYWtZZ0JOL2NpWXM5anlQb0I1?=
 =?utf-8?B?Y1ZYbUdQdG9qZDduSUF0RHNSZVdab0thOUd6RFFoUzg5YnNIanc4YWJzUjNy?=
 =?utf-8?B?R2lTMWNVRVFNaktnTHNwQkgrMmpia1V2d2VBMTI3YjFsYVZyWEVMZ3l1RDVZ?=
 =?utf-8?B?RDAwcGRvSW5SWTVLZlRwMkE3ZkgvR25nbUZRNUZQcC80RXcrV1VCQVdRcXRK?=
 =?utf-8?B?NUh5MWVCZGF2Wi9rVjhRR0tuMS9yQzN4WnY3M0kwclRsTUUzNitPNWV6b2RM?=
 =?utf-8?B?bExTUThDZFFJTVBsVnNkQ1hZNHNZZW1vQllRa1M2ZjVqZEdXcTBrZkcxbGsy?=
 =?utf-8?B?TWF6eVA2WCtyZ0FRRGJKRTRrODN2ZzFrclFldStHZ090c2svMFJEc2dlNkZ5?=
 =?utf-8?B?S1Y4SXZQTm0wRzlpUm8vOEVIaHlicEVGdWNzbUgzSWtPcWV3TU9JdVo4aUk0?=
 =?utf-8?B?R0svTkY1Rk5scXQrQkFjZWNaQnY4RnFyUllpL2p0V3JrcjhydlBSQkNMaUdF?=
 =?utf-8?B?RTlQSldKR2NuQlYvbjdUM1VJTVlTMzJvb2VuQzdHWlZLVHRvSzBOVFY1Y1hx?=
 =?utf-8?B?b0NEb1IxeThjc3k4V3grMWVIYVBOaC9OUWhVV1dkT3ZCWGFGa3BnYnNrdlND?=
 =?utf-8?B?SDdtMHBxMkJTalhkMEQ5blRnbnEyRHVZVkdoVGUxc3J3cmxVQnptTlNoOTFH?=
 =?utf-8?B?a3dlVGFNRndwQlFQR1NZeEwwZ1hERVAvdnlKcHI2MTlhUmJrSDhBcGhGOGln?=
 =?utf-8?B?LzlBcWN5UVZlcitvQ0E1NmlqMVQvNy8yU2wxcFJFVjdELzFCSk9WeW12MUVC?=
 =?utf-8?B?ZkFFenVGc3U1ejRtK2tlNEZGVkYvdk5BMDRwcXg2TUowUkw2WEU5QW11RXRJ?=
 =?utf-8?B?dkEwalVJZ05Ybjk3UjV5VllCRlFSUVJxajgySE5EMzM2OXl2YlVpY2FXZlBt?=
 =?utf-8?B?SWlHS1MwTXA1dGdTU2lNR29RdmxjYTZxV0lhMFNSYithRTlDNE9CL3BqSzBT?=
 =?utf-8?B?R08xWlRNUmNBYmNsMFpDUFU5TzR5S0M0MEJUV1FrQmpLUzNWWEF1VnFScFF5?=
 =?utf-8?B?V2Eyb0ZkNDEwMlpZdGdkOHo0U2hXeHhXRXhZMGJYZEdTWGh5UThZbEJEa3Fv?=
 =?utf-8?B?cUVRdzhhT29PSGlmWk93QTZMb0grYUJGMWJ3NEgyVFZqd25kZnFTNE5tdHk1?=
 =?utf-8?B?YkZ2dWZMMVhFTkF5UFdEcVZPOFhMNnViVjAvTEllanRURjNLN3E2NXZ5Z05r?=
 =?utf-8?Q?ahQxWB6hQfeB3YRu7XWmxwI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69EEE37B8334314CAEE07EAFC3879224@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1676a48-3f69-4003-e7b6-08dcd7ad5ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 06:44:36.7392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKwnuIT0X1tHT/+Z3fNRN9MnFVi0iiTdsFD3HwAOuJ3Gg4ZsMN3W+cXgg6nWSZr7khD7Qg35Qzc+QA/zVG/JW92LqVAJsfNgPKG6qFwRMXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
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

T24gV2VkLCAyMDI0LTA5LTE4IGF0IDA3OjA4ICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IE9uIFR1ZSwgU2VwIDE3LCAyMDI0IGF0IDA5OjM0OjIwUE0gKzAyMDAsIEdyemVn
b3J6ZWssIERvbWluaWsgd3JvdGU6DQo+IA0KPiA8Y3V0Pg0KPiANCj4gPiA+ID4gK3N0YXRpYyBp
bnQgY291bnRfc2V0X2JpdHModm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSkNCj4gPiA+ID4gK3sNCj4g
PiA+ID4gKwl1aW50OF90ICpwID0gcHRyOw0KPiA+ID4gPiArCWludCBjb3VudCA9IDA7DQo+ID4g
PiA+ICsJaW50IGksIGo7DQo+ID4gPiA+ICsNCj4gPiA+IA0KPiA+ID4gaHdlaWdodCgpPw0KPiA+
ID4gDQo+ID4gQXJlIHlvdSBwcm9wb3NpbmcgaGVyZSB0byBjaGFuZ2UgdGhlIG5hbWUgb3IgdG8g
aW1wbGVtZW50IGl0IHdpdGhvdXQgc2Vjb25kIGxvb3AgbGlrZSBiZWxvdz8NCj4gDQo+IFllcywg
SSBqdXN0IHdhbnQgdG8gZ2V0IHJpZCBvZiBzZWNvbmQgbG9vcC4NCj4gDQo+ID4gDQo+ID4gc3Rh
dGljIGludCBjb3VudF9zZXRfYml0cyh2b2lkICpwdHIsIHNpemVfdCBzaXplKQ0KPiA+IHsNCj4g
PiAJdWludDMyX3QgKnAgPSBwdHI7DQo+ID4gCWludCBjb3VudCA9IDA7DQo+ID4gCWludCBpOw0K
PiA+IA0KPiA+IAlpZ3RfYXNzZXJ0KHNpemUgJSA0ID09IDApOw0KPiA+IA0KPiA+IAlmb3IgKGkg
PSAwOyBpIDwgc2l6ZS80OyBpKyspDQo+ID4gCQljb3VudCArPSBpZ3RfaHdlaWdodChwW2ldKTsN
Cj4gPiANCj4gPiAJcmV0dXJuIGNvdW50Ow0KPiA+IH0NCj4gDQo+IFlvdSBtYXkgaXRlcmF0ZSBv
dmVyIHVpbnQ4X3QgdG8gY292ZXIgYWxsIHNpemVzLCBub3Qgb25seSAlIDQuDQo+IEJ1dCBpZiB5
b3UncmUgc3VyZSBidWZmZXIgd2lsbCBhbHdheXMgYmUgbXVsdGlwbGUgb2YgNCwgdGhpcw0KPiBp
bW8gaXMgb2suDQo+IA0KPiA8Y3V0Pg0KPiANCj4gPiA+ID4gK3N0YXRpYyB2b2lkIGNvcHlfZmly
c3RfYml0KHVpbnQ4X3QgKmRzdCwgdWludDhfdCAqc3JjLCBpbnQgc2l6ZSkNCj4gPiA+ID4gK3sN
Cj4gPiA+ID4gKwlib29sIGZvdW5kID0gZmFsc2U7DQo+ID4gPiA+ICsJaW50IGksIGo7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZTsgaSsrKSB7DQo+ID4gPiA+ICsJ
CWlmIChmb3VuZCkgew0KPiA+ID4gPiArCQkJZHN0W2ldID0gMDsNCj4gPiA+IA0KPiA+ID4gRnVu
Y3Rpb24gaXMgc3RhdGljLCBidXQgYWNjb3JkaW5nIHRvIGxpbmUgYWJvdmUgSSB3b3VsZCBhZGQg
c29tZQ0KPiA+ID4gY29tbWVudCB0aGF0IGl0IGlzIGNsZWFuaW5nIGRzdCBidWZmZXIuIGNvcHlf
Zmlyc3RfYml0KCkgaXMgbWlzbGVhZGluZw0KPiA+ID4gYXMgeW91IG1lYW4gZmlyc3QgYml0IHNl
dC4gRmlyc3QgYml0IGlzIHNyY1swXSAmIDEuDQo+ID4gPiANCj4gPiA+IEFuZCB3aGF0ICdmaXJz
dCcgbWVhbnM/IEhhdmluZyBsZXRzIHNheSBzcmMgPSB7IDB4MCwgMHhmZiwgMHhjYywgMHhhYSB9
DQo+ID4gPiBJIHdvdWxkIGV4cGVjdCBmaXJzdCBzaG91bGQgYmUgbW9zdCBzaWduaWZpY2FudCBi
aXQgb2YgMHhmZi4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+ICsJCX0gZWxzZSB7DQo+ID4gPiA+
ICsJCQl1aW50MzJfdCB0bXAgPSBzcmNbaV07IC8qIGluIGNhc2UgZHN0ID09IHNyYyAqLw0KPiA+
ID4gPiArDQo+ID4gPiA+ICsJCQlmb3IgKGogPSAwOyBqIDwgODsgaisrKSB7DQo+ID4gPiANCj4g
PiA+IGZmcygpPyBCdXQgYWNjb3JkaW5nIHRvIGNvcHkgY29weV9udGhfYml0KCkgSSd2ZSBkb3Vi
dHMgc2hvdWxkbid0IHRoaXMNCj4gPiA+IGJlIGZscygpPw0KPiA+ID4gDQo+ID4gPiA+ICsJCQkJ
ZHN0W2ldID0gdG1wICYgKDEgPDwgaik7DQo+ID4gPiA+ICsJCQkJaWYgKGRzdFtpXSkgew0KPiA+
ID4gPiArCQkJCQlmb3VuZCA9IHRydWU7DQo+ID4gPiA+ICsJCQkJCWJyZWFrOw0KPiA+ID4gPiAr
CQkJCX0NCj4gPiA+ID4gKwkJCX0NCj4gPiA+ID4gKwkJfQ0KPiA+ID4gPiArCX0NCj4gPiA+ID4g
K30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHZvaWQgY29weV9udGhfYml0KHVpbnQ4X3Qg
KmRzdCwgdWludDhfdCAqc3JjLCBpbnQgc2l6ZSwgaW50IG4pDQo+ID4gPiA+ICt7DQo+ID4gPiA+
ICsJaW50IGNvdW50ID0gMDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWZvciAoaW50IGkgPSAwOyBp
IDwgc2l6ZTsgaSsrKSB7DQo+ID4gPiA+ICsJCXVpbnQzMl90IHRtcCA9IHNyY1tpXTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCQlmb3IgKGludCBqID0gNzsgaiA+PSAwOyBqLS0pIHsNCj4gPiA+IA0K
PiA+ID4gSSdtIGNvbmZ1c2VkLiBJbiBhYm92ZSBmdW5jdGlvbiB5b3UgaXRlcmF0ZSBzdGFydGlu
ZyBmcm9tIGxlYXN0DQo+ID4gPiBzaWduaWZpY2FudCBiaXQsIGhlcmUgeW91IHN0YXJ0IGZyb20g
bW9zdCBzaWduaWZpY2FudCBiaXQuDQo+ID4gPiBTYW1lIGNvbmNlcm4gYWJvdXQgZnVuY3Rpb24g
bmFtZSAtIHNob3VsZG4ndCB0aGlzIGJlIGNvcHlfbnRoX2JpdF9zZXQoKT8NCj4gPiA+IA0KPiA+
ID4gPiArCQkJaWYgKHRtcCAmICgxIDw8IGopKSB7DQo+ID4gPiA+ICsJCQkJY291bnQrKzsNCj4g
PiA+ID4gKwkJCQlpZiAoY291bnQgPT0gbikNCj4gPiA+ID4gKwkJCQkJZHN0W2ldIHw9ICgxIDw8
IGopOw0KPiA+ID4gPiArCQkJCWVsc2UNCj4gPiA+ID4gKwkJCQkJZHN0W2ldICY9IH4oMSA8PCBq
KTsNCj4gPiA+IA0KPiA+ID4gRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0IHlvdSBhcmUg
Y2xlYXJpbmcgb3RoZXIgYml0cyBpbiBkc3Q/DQo+ID4gPiBJdCdzIGV4dHJlbWVseSB3ZWlyZCBj
YWxsaW5nIGZ1bmN0aW9uIGNvcHlfbnRoX2JpdCgpIHdoZXJlIGl0IHNjYW5zDQo+ID4gPiBmb3Ig
bi10aCBiaXQgc2V0LCB6ZXJvaW5nIG90aGVyIGJpdHMgaW4gZHN0LiBPciBJIGp1c3QgZG9uJ3Qg
dW5kZXJzdGFuZA0KPiA+ID4gbG9naWMgYmVoaW5kIHRoaXMgZGVjaXNpb24uDQo+ID4gDQo+ID4g
WW91J3ZlIHJhaXNlZCBidW5jaCBvZiB2YWxpZCBpbmFjY3VyYWNpZXMuIEhvdyBhYm91dDoNCj4g
PiANCj4gPiBzdGF0aWMgdm9pZCBvbmx5X250aF9zZXRfYml0KHVpbnQ4X3QgKmRzdCwgdWludDhf
dCAqc3JjLCBpbnQgc2l6ZSwgaW50IG4pDQo+ID4gew0KPiA+IAlpbnQgY291bnQgPSAwOw0KPiA+
IA0KPiA+IAlmb3IgKGludCBpID0gMDsgaSA8IHNpemU7IGkrKykgew0KPiA+IAkJaWYgKGNvdW50
IDwgbikgew0KPiA+IAkJCXVpbnQ4X3QgdG1wID0gc3JjW2ldOw0KPiA+IA0KPiA+IAkJCWZvciAo
aW50IGogPSAwOyBqIDwgODsgaisrKSB7DQo+ID4gCQkJCWlmICh0bXAgJiAoMSA8PCBqKSkgew0K
PiA+IAkJCQkJY291bnQrKzsNCj4gPiAJCQkJCWlmIChjb3VudCA9PSBuKQ0KPiA+IAkJCQkJCWRz
dFtpXSB8PSAoMSA8PCBqKTsNCj4gPiAJCQkJCWVsc2UNCj4gPiAJCQkJCQlkc3RbaV0gJj0gfigx
IDw8IGopOw0KPiA+IAkJCQl9IGVsc2Ugew0KPiA+IAkJCQkJZHN0W2ldICY9IH4oMSA8PCBqKTsN
Cj4gPiAJCQkJfQ0KPiA+IAkJCX0NCj4gPiAJCX0gZWxzZSB7DQo+ID4gCQkJZHN0W2ldID0gMDsN
Cj4gPiAJCX0NCj4gPiAJfQ0KPiA+IH0NCj4gDQo+IExpa2VseSBJIHdvdWxkIGNvcHkgb2N0ZXQg
Ynkgb2N0ZXQgZnJvbSBzcmNbaV0gLT4gZHN0W2ldLCB0cmFja2luZw0KPiBwcmV2aW91cy9jdXJy
ZW50IGh3ZWlnaHQgYW5kIHdoZW4gaXQgaXMgYmlnZ2VyIHRoYW4gbiB6ZXJvaW5nIHJlc3Qgb2Yg
Yml0cyBpbg0KPiBjdXJyZW50IG9jdGV0LiBCdXQgdGhpcyBpcyBpbXBsZW1lbnRhdGlvbiBkZXRh
aWwuDQo+IA0KPiBJbiBhYm92ZSBjb2RlIHlvdSdyZSBjb3B5aW5nIGZyb20gbGVhc3Qgc2lnbmlm
aWNhbnQgYml0LCBpcyB0aGlzIGludGVuZGVkPw0KPiBQcmV2aW91cyBjb2RlIHdhcyBjb3B5aW5n
IGZyb20gbW9zdCBzaWduaWZpY2FudCBiaXQgc28gdGhpcyBpcw0KPiBkZWZpbml0ZWx5IHNlbWFu
dGljIGNoYW5nZSB3aGljaCBhY2NvcmRpbmcgdG8gaHcgYmVoYXZpb3IgbWF5IGJlDQo+IGluY29y
cmVjdC4gTWF5IHlvdSBkb3VibGUgY2hlY2sgdGhpcz8NCkZyb20gdGhlIHRlc3QgcG92IHRoaXMg
cmVhbGx5IGRvZXNuJ20gbWF0dGVyLiBXZSBqdXN0IHdhbnRlZCB0byBrZWVwIHNpbmdsZSBiaXQg
aW4gdGhlIGJpdG1hc2sgdG8NCnJlc3VtZSBkaWZmZXJlbnQgdGhyZWFkLiBBcyBsb25nIGFzIGRp
ZmZlcmVudCBuIGdhdmUgZGlmZmVyZW50IGJpdCBpdCB3YXMgZmluZS4gSG93ZXZlciwNCmJ5ICdm
aXJzdCcgSSB0aGluayB3ZSBtZWFudCBsZWFzdCBzaWduaWZpY2FudCBiaXQsIHNvIEkgZGVsaWJl
cmF0ZWx5IGNoYW5nZWQgaXQgdGhhdCB3YXkuIA0KDQpSZWdhcmRzLA0KRG9taW5paw0KDQo+IA0K
PiA+IA0KPiA+IHN0YXRpYyB2b2lkIG9ubHlfZmlyc3Rfc2V0X2JpdCh1aW50OF90ICpkc3QsIHVp
bnQ4X3QgKnNyYywgaW50IHNpemUpDQo+ID4gew0KPiA+IAlyZXR1cm4gb25seV9udGhfc2V0X2Jp
dChkc3QsIHNyYywgc2l6ZSwgMSk7DQo+ID4gfQ0KPiANCj4gTmljZSwgY29kZSByZXVzZSBpcyBh
bHdheXMgZ29vZC4NCj4gDQo+IEknbGwgZHJvcCByZXN0IG9mIGVtYWlsIHRvIHJlcGx5IGluIGFu
b3RoZXIgZW1haWwuIFRoaXMgd2lsbCBuYXJyb3cNCj4gb3VyIGNvbnZlcnNhdGlvbiB0byBpbnRl
cmVzdGluZyBwYXJ0IG9ubHkuDQo+IA0KPiAtLQ0KPiBaYmlnbmlldw0KPiAgDQoNCg==
