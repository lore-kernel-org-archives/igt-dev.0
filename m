Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C549FC531CA
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 04:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100610E52A;
	Thu, 23 Jul 2026 04:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxtnfNnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D691A10E52A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784779485; x=1816315485;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EVvXMMeCn8yA6ZTmgGNKVgfbgFyUWtD9xUHlgEEsIlA=;
 b=cxtnfNnUeiz3DC4GtfmyaSUy/QuaAVE1U+1xhjwlJN15QkVrnjnX95Ds
 BXQmvaVB2F409qEMeC1KQc0NbdX5UFJEEsMJ3KxlMcidu/ayFQeO90rXv
 6V5uPea0l5UzRud3oEXLdlK9O3q5LbJUXx/tyL0ZT+Qfxw1dDIjTBIrFc
 wE+xX0AJf3FRJ3EjP8Kv0LvDK2J/5lJiCMFBxkzqw62hW0do0e8vNMmsO
 KApGB2unWtshYgQIUYJi+iJR81+64mApQF6REzCqMNjIFL26UKb1fik+p
 7xW/+5UElVEfgpsQJ+H49gWCglVxMIhRRl5wnVNTjv5pOrKfPLLRtetlT w==;
X-CSE-ConnectionGUID: 13IUWS5ATUq4v8IwMnu2ew==
X-CSE-MsgGUID: IBpoJebfQVGjD+F6g9Xg2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85369551"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="85369551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 21:04:44 -0700
X-CSE-ConnectionGUID: KHywtrQVS2SOIrcidk+Asw==
X-CSE-MsgGUID: zKWg0MXKRZa0SPj7AZG+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="288293130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 21:04:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 21:04:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 21:04:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 21:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXfyZuyXWZ+OeLUsIO3AUOz0NP+5m1zkTbuYebY6lXaXAHcDUqlMppbk0Bxp2RisxvCT6cTH90jhT4b9fw7bYe337S2fCufy2HHZWW6QVfiGKalyNxxotH51QYmRCRLteyE+o3YKTXkSgMWZi/2XcdkTdqBCydvTow4z07J1ysA3meSI7dc1pVhGMd6Mjz42I8u79Ht6XCFk6hpPZ2JUcXbil8C/TDqVV/+GdBfmHrcxgDDa52kj2G41cyH97XjqZQ7tkfyrB7Sk52U5Wh4B8WWHFG8cN0QJNyFn8cJCOKJz0EW13Hzs4uD5iiYDA7z4kqOZPxbt3N8uhHAy4FNi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m/Ld0tqquJ1yw3nVh96mF10/NyT33Q088TRhdt0iFk=;
 b=R2A1XciPqN0IbApwvgFYZUxEDCPVr8yhKFm9QVdyaZGKNk651HyTz80djXim7t8nUW3zROX7rKA5DOJOwpv+Rrrn7MEMwTjWK1xmcqKug/ViH+bGnBJqfrAkxCz/ce2dlNPwMtYrypXPZUPblXSBJlQQvZWoFcaGvT8o0SEkmu0oDUaLId7y89E8wvdtHH1wOYwwx0GBQ1E8x2xpN6qaSdXK1A5cR5fMbFfiObcrDkOnrVTee5bgvlYXQvd8WT8s+9b6F4oo1lQru2mYUjxqOE0sinko2YzqCQ//DU4A4NJvdxenld9Ua/GoPHmE4ankI61h3WiXVD05hkbDtWi3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:04:38 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:04:38 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Thread-Index: AQHdGkuW9Jp9zrET00i4sxwBd/qb3LZ6e/Xw
Date: Thu, 23 Jul 2026 04:04:37 +0000
Message-ID: <CH3PR11MB84342F8F30C8B9BF556DCCDF8DC02@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260723023251.4522-1-himanshu.girotra@intel.com>
In-Reply-To: <20260723023251.4522-1-himanshu.girotra@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH0PR11MB7496:EE_
x-ms-office365-filtering-correlation-id: a64d57f0-c21c-4984-392e-08dee86f8392
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: oT1piQPpsE/SWGL03we8c6dEe5LUI384IoQsilZ7cIPiW19yde0c8cFxq2Ee/dqkukSusSGYhKe0zofx0FnE8PNaXvBNl7UzpdBisxoypjBRfBP7yC1goQ78+Cqv2E6R34+SMSp9tZXRjSmN/IAXaffOzLeuZ7JRQjKa7qg0Rdkujoi0eE6vny0eZn1Elob7oTlJt8OWKKmTmHv/LFOOek2yEb6fV57kFFu4L2f2VsEQNUm9ClCSR9M164ObUOJFuw6dqALW5WV6TFzjRPHM21W3JKMcumDRnHP6Bk238TD+Cbq3Mih3PKgGWT1D3I08I18PxiROGXObGk32yskjwA6UQdwSj3QGhl6bWAL/8J7d0XEP10iK149Qx8mjlu7d/U3GJOlixKnQnIX8JADdQrXuspeI3eEeXKKBTGJBkjXIC50p6FNIdong9gumBuFdjAPX27Ok6uetWaO4po9RlJlhjicGaFI3I2yiVQmzHIqsXeMxENDZWmKizoD79R/xMTvu4ZLJ6NI9RUVA3DXcJAxd2CTGbQkNfswVDBs1LapqwKZaLh319SfQ+hxcykP61VGTj6KG0m2bXvrOuo4gYnVZZmLJkpiaFyUFbH+tEOAHlPBa41+ZYOTGUjcoKxVHodn/fEw2ZqmcITUPHpujLoTqWgzb1ShNySBTveZTqtjPs5JjJZfyxAh2TWx3erpBrNarqcT/sHT63DRMSw/O7at/nGOVtKTcINgMTk/+Trs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D6gMrmhfndno9sg5DYWSLxiHRDts8HS1EJjCD1Za0bF07WhCaRNDDqr5JBkL?=
 =?us-ascii?Q?je1OMGdHcxdLDm0dD7Dr4n0Y4ofwxnyXM+6fnzdy+nEohoXT2DWS5/+qrFTB?=
 =?us-ascii?Q?KcHxdwYIcLwI7/G+MYGF+sb4zt1nR6T1lYpuFT8sfxbGXUtXUfXNw0KtSAse?=
 =?us-ascii?Q?Sfxe2u6xf/10And6bU5QSaGjAaIGjmXMjfV8XmaztOLMzaSK5dN5Zn8Eil7V?=
 =?us-ascii?Q?+h/rVlP6WdyEsg3fIHtyq7++w2X53SGlVGC/qzGX8syYuvXPbyGV5aZrGC7T?=
 =?us-ascii?Q?w87PhsX2kq2oCrUQsythjjfDPrSYZSLBrb0kfuqYPMdhLCH9iaIJQVtenxIQ?=
 =?us-ascii?Q?7g0I2ZoRGnQU4czzuVJwfILD6rey5MM7ThzKkznlNrQy4KD+btOWf5hrgfBt?=
 =?us-ascii?Q?3OMO6iVU5XTsQoldQEYGnFhGo0pWkl5fXT6TqNQBJQFh5VLOjzD9rwJQsLkr?=
 =?us-ascii?Q?h5cP+WiwvqLq+hkkGFA8q0jJCI5iVmmvoMVYdAJ47+PB29AY2i0Nw+TS3xX9?=
 =?us-ascii?Q?YPPk+xZ5OSH7n6h2VM9e+/N45rOyRphjoFLZCpC1/K9zCUYg1IhtHdO5Hi4R?=
 =?us-ascii?Q?/14D4/PkbpQ1ZARYfbjvmNUbNoZgugV4+T4yDVu0yQMMzUOkKhoqGvPatAbC?=
 =?us-ascii?Q?w4fPpsei0iUGkKvDnmWqv2rW61wDiD7sNmODfvgMmcvJBm3ZPGVIuSmo4AQk?=
 =?us-ascii?Q?mHbL0kTke6ZYNIEyIfOB/Zifv6t4HLjCMRj1DWYMYk0X40MjQrLGcZlfraox?=
 =?us-ascii?Q?8AS4S9TM8sTkZ6ywyhhODy7ezeefJX852/sfHf6G7CnLw8wQ5DcbN/cgdIm0?=
 =?us-ascii?Q?4ltive5XupaNaNJBX4eF5IBxiifAFAug/yAmNURXbTfg8XGkOXPVK3beHTp6?=
 =?us-ascii?Q?o4KsjD2bBJQ7Zh2/jGhmeo0DuaSfUFqGxqWTxFuCP9jpskExoeAQmSeR3egt?=
 =?us-ascii?Q?A4wFI+XqcBjsQdY/Iroim8kPq90ITBnLwdwpWN1yautjD3iAwSVeV8PRNQrm?=
 =?us-ascii?Q?4Uj3mszM23mqfLH8bSzJVZR/wUCPsKR4bPvU1FkGUSkwszDAa2RggA3Cj+Cf?=
 =?us-ascii?Q?t3cRSPqJrkY5ZSXUvsZRlOskF0iwEmDQEZYNeKXvR38wLs2+ijc0UZyAmUQ7?=
 =?us-ascii?Q?pl6dvm4FI/fVb4Uugk6nKjsIFeL615qjUbHUjGPdQdP+nV0mNC+PDyCBkAkZ?=
 =?us-ascii?Q?5gPrydCgEX4k0HxXp3nJI17PDubrEskELjUNbQ0acjk3x+XTlErE1vzcembU?=
 =?us-ascii?Q?13c/HhBry0PkWq5CZmQbCru7PgwJ42b0+DEnVE12gcxAvDgpQlOkGhu4w0Lg?=
 =?us-ascii?Q?8KZOC9t3n5X4HDrRnvGVc0+9seM0pxKTUwAGcOaOUz9D7Sm8KQPMpRTlza6b?=
 =?us-ascii?Q?yg5iTvkGKFgD8i8vv5feIEaedrAekEFPI9eEqDy3UNL79M8IhzYPzrcEB4/g?=
 =?us-ascii?Q?xyFvM7b21Vf1dna+Lq1cje7EESXLpsmG+9ae/WE3aHftX0N3VE0em/GFObJy?=
 =?us-ascii?Q?B6y3fC6TdUXyyXeXFEJLdAG0Ews2fxQ28O9hXlxonSJk/uzkSyXva4S/wnwM?=
 =?us-ascii?Q?C+e1fNGWCAiJANk2mkQBzZsgyRyVaOlQNoEnsLpsq8eSw0pM16GjP3nu/USS?=
 =?us-ascii?Q?MVzLxarkD8TMjkseqGGVmkCAokxWG1gusIUtOJIaXx0W2Yv8sdoh5+LWMFiI?=
 =?us-ascii?Q?xnFSw0cSSQmVqCrOQmUvHeQ0Hamx58SGPUP1n9wWaYewS/Y/A/G9yT7s4jqo?=
 =?us-ascii?Q?9izkcGBHqbY47bEYd4ldTikwalv/crc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: od0RECbEZiBrumZD+slypikPIwxo3J32esxNSy+XZJfWn7S15F0GUqVfyGiJLpd9rTyp31ximNOd9akMdqI0v6n2lyJxrMivJqf9UcKwvMflwSCVthVAOVerK4bm0LOhi3Axy3YoOKmQVgCFEhdwLZgi9zZVPFe62xtcohhstkqtpQOdBgO0Gx41I2rXzcI/KwGUWDdEx6ytSD1Ofpqpg6yN6MLcu3Bio8cE2wLo3+PmC4EWyJg5kOj2+pYiHRkrzryOab6YkQIXVvFIijrYgzhRYFzyhY7lZkiHNyunxbWUObZjJoKchFcUzw0ShnoAKNygYT9bUA/ZkZt1EygmKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64d57f0-c21c-4984-392e-08dee86f8392
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 04:04:37.9546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZY8aMl1NvRCgDv4uNfJws14CE7QT7a9BJYkXUiORoEhorSkgT7Eikhag3kYiG3vt7vmCPC4a49k9v4btS1n7cQx31wj9JmjGsXesrEE/Kdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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



> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: 23 July 2026 08:03 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
> timeout
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> The hang subtests hang a queue and reset to recover. Jobs that were queue=
d
> but never started are logged by the KMD at warn level as "Check job timeo=
ut:
> ... not started".
>=20
> This warn is expected, but CI flags warn-level dmesg lines and fails the =
subtest
> even though it passes. Whitelist it for the hang subtests.
>=20
> v2: Rework description and comment to be generic (Priyanka,Kamil)
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c index
> 0480df779..2974fc312 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1468,6 +1468,16 @@ static void threads(int fd, int flags)
>  	pthread_barrier_destroy(&barrier);
>  }
>=20
> +/*
> + * Hang subtests reset the GPU to recover, so jobs that never started
> +are
> + * logged as "Check job timeout: ... not started". This warn is
> +expected;
> + * whitelist it to avoid spurious dmesg-warn failures in CI.
> + */
> +static void ignore_multi_queue_hang_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started"); }
> +
>  int igt_main()
>  {
>  	const struct section {
> @@ -1735,6 +1745,9 @@ int igt_main()
>  				igt_assert(!(s->flags & BALANCER));
>  			}
>=20
> +			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> +
> 	ignore_multi_queue_hang_warnings_in_dmesg();
> +
>  			threads(fd, s->flags);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  		}
>  	}
> --
> 2.50.1

