Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192B2CCD1A5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 05:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD88210E0A0;
	Mon, 27 Oct 2025 05:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZAQXjeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037810E348
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 05:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544395; x=1793080395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aNr7xCdh5bFTUwCj6aeNMJ2pJsCrrCrMf5agEDCERq0=;
 b=GZAQXjeTWz682YaCkx3ifqa3PPjTjOFovpQVXcAlu/CSjgleInF33vNz
 /OGlI+DyH33qqjhnVqcu7DzY3NSUXh/ZQqf7F6UIczkyFRzVhF0LysmpX
 c59Ua7rzIYE9Yd1uzqf6BW9Nx++jdTd5hxETIJU0au5TPXedWzyeDHyRJ
 pJYomwoGQzEhAdD4Ea6K6r3Ct4yYTUf5l47m3oxwK1b+ebUMUOYieYNQB
 f6Q/lg1uLh0+cyXjnA9Im50H3r+EBboVrDrvlxbC789o7d/SgYPh+4Dch
 EYZoxPumd1Q6IgwutRZ7hix6my6tWVuDj/2h/9CHhR/5vmrw9tg+U20/g Q==;
X-CSE-ConnectionGUID: +DOcfndyS/+HejXPqYA9hQ==
X-CSE-MsgGUID: 5mhfY/UrQo6xsiig+Co/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66233318"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="66233318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:53:15 -0700
X-CSE-ConnectionGUID: DiD8SZefSv6Fo/aqKTjVrA==
X-CSE-MsgGUID: jWXk/SxOS/S4CsliYE9ReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189266775"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:53:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:53:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 22:53:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWoty9cOiQ4O+Jh+hS3W4CoACTDj5YpSrk6U9EdD8d73FaSCu/pC2JsNKBv4aTbgh3Hkv8VloWhivQFxVQesD7lfOu2c35V0fY/Mj0zMCEZEMoUslWSf7+6IoZt7oTTV2LUq/HgziTJ/Jnb6l8rPfyuPj/zYjNEKNiB5WNwaJUVj1BXXAH4Y0UVwYzbwRt059aTOqhIupejXCbLySOYdA74Am61jDTnxi5nVbdEBkVWW//rLZSThc0MEDxa12YWaFvhIu6aGmCpKip+biK6A8ogIpOeJG1clOj8aAfuh7MSbDoBoMuINhqxfxmPB7QgF5qXT0o3RfaeaiN2B1+R+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DePSSb65PZZ4DS2qhV1rxyvpD2jykWlFYjSP0FZODWQ=;
 b=jyWUy8fRqC/eF3wRK7VEqMunhfTnJelMSAJD3jhLEB1Vs4n7uuIXTrPmv9kIrc8Kqe9iGLZgM3mzBkCrmOdC9yD/yjLHCcCb9/yGlq6IxSjPT3WfwSKxubD/7I58hsY8O2q1haFQ2DRPHoHQqmyU+N5rizgYfOnpURMo0z1i2vZI7qE+sEi0dRDif+R1xeOudjnxvljmRq7q6r+CjCNhqfAnvhri8VmOu0Kbup6UHXcYmlcHafO9vH1zlGVi8u6O+jS7C+8TWuxp06gs+d12yL2mDpBXk4SHm1gUBANjId7ZAO4Lb9HEAL4NSn57wAGC6XP+8aFAy/KglXqnNWM6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 05:53:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:53:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t 4/6] tests/intel/kms_link_training: extend test for
 eDP connector
Thread-Topic: [PATCH i-g-t 4/6] tests/intel/kms_link_training: extend test for
 eDP connector
Thread-Index: AQHcPbraW4lyGxUXhUWquexsYa9/ALTVkF8A
Date: Mon, 27 Oct 2025 05:53:04 +0000
Message-ID: <DM4PR11MB631288C444B5B17B92351D9390FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
 <20251015101759.3982477-5-kunal1.joshi@intel.com>
In-Reply-To: <20251015101759.3982477-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5912:EE_
x-ms-office365-filtering-correlation-id: 49b1fe66-3c4f-4fab-09bd-08de151d18d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i5HFpBn8pxmDvnZZMUEBS1qgDokZahOX51osllmYu9COZE2BV6SAmx+BJ7e5?=
 =?us-ascii?Q?BrnlJlTrBSmYhJgwpsSkJysDZqDjcVaGHZfaT2fKmF3hYKQH0g6myJLtbh9o?=
 =?us-ascii?Q?Tjwjm6kwwxDxihYy/i+LcFhTS3dT8pxnf9qFPB3ePmqjTsmmdJKtiYJOF3zu?=
 =?us-ascii?Q?OwgzkR1Vf8uCerzPhYruuqUJiibYPceRbPp5oE5IIKU0lK1Rj6BD4r2vU4IZ?=
 =?us-ascii?Q?TVxce3QGK+NHO4MbSgVGrvtEH6kTVgR3FcQU6X0kp/X9YCkUwQRLlIV/sCN/?=
 =?us-ascii?Q?LhdxsrlsrjNLAdBMfzbs5fLH3zvi1IvN2QFk/tgY5JOEZZZgm42GJEYLQiin?=
 =?us-ascii?Q?uJACmHf9XDCPDUOf874wh1l4lXFOxMOGvcOvcJhL3SGD0Yfh+/64xzf+Cfd2?=
 =?us-ascii?Q?szxBxSXEMUQu/FqSBzAkQ1IR5kfbrKHYAxj+Ul/iu4qXzCw0xfVtDTDnoR5A?=
 =?us-ascii?Q?yqjZDGSHL4nDsekWoIk/+5dTtv306flcgAMZkCWFi+XFtRHpzomtN+Fnq3mu?=
 =?us-ascii?Q?Lc+Z8KufOyLlRLV6oJAIFynCyjpU25Sn9vJoK78wYmAyXpEtT4elFiDeHlnR?=
 =?us-ascii?Q?triRyWSipjJ+u8NmrnTqZpPYog5l4G23dh4wiTb4k1EXDiiPiFIt0ilw38rz?=
 =?us-ascii?Q?v1zeCI2sLY88miyk6viP1fcIjyeLdQylEOUJVJqpOu936yJhnoSUFrVTrYeF?=
 =?us-ascii?Q?qI5yWXdWOaN2dDtDx1UWU5BYTVS3qXm6gLVE9pyvOjhGBwNNnWOA4rd4QAGD?=
 =?us-ascii?Q?3qKdzPhuR+bEFTlvnFQ6LksaUZ7044tJouVh9nlHvY1vFX7xHYNq6J8DBdO/?=
 =?us-ascii?Q?/j9YkwYdmhm5IRmHlXIVVTaRw7BBTf7cRW5ODetQrzno13bMPa8s+MWxHO2T?=
 =?us-ascii?Q?bTvol4c87GE/D2mcp6MdlzFAmeC7oBvZ4a0zOLDhmEWzfGr0uchlVpTBm2sW?=
 =?us-ascii?Q?wo/86M8ASU9T3V7xVWg1EF0WbDkLEN2g2euxAGxIMuINHmZ7dTP/CNUUFWBc?=
 =?us-ascii?Q?yD232qg7o+vYDQ8S/B5nePYTYua0SMutOVU15Ua8KIsk3KvouIq9+ZJJA0ef?=
 =?us-ascii?Q?zUd2d+V1iDm32xAJfDE7wVG9zYWkUkbkpCeczLiQFaXlOwezeHL9rw12UiGW?=
 =?us-ascii?Q?xzRm9V9zhKTbgvHcYsLVxq/Ekm8ZT+qpSvS21m1WOVzMY+OHFlIOIGo26bIo?=
 =?us-ascii?Q?CmThvjdrpibbLfQk/Kni2/uCmjPcxrORU0uTLBCDFdtkVi1gzDOj1vP2zP/i?=
 =?us-ascii?Q?KdgCTdmxOrJKOtilow+7vNReFazBgPvLf7+YbuqNVUJbctPBvf+pmm+Szniv?=
 =?us-ascii?Q?e2SVNXdvAe9TI9V3pQ0AkMSL4DPHxouewHdS/pX2WJMWbIWMW1Faiq/owPmp?=
 =?us-ascii?Q?93OXwGAR/9Xd2eRZLdIpszpVD1YXOLTj6J9sHx7p1remvbsJFFzZyliVlZpu?=
 =?us-ascii?Q?t7GpOU5f84jX7EhEvHjmQTPskV+ECNtJxkvbn6ofz/mWa8Vp57Y7tBVhOHpH?=
 =?us-ascii?Q?QaIj07K1jyFl+jS3qH53QWVI96+jSCsEcaPo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RTOJOtTuvctXnEE94EHb3t9oVHnOlEckL6J3l0X8CQfQ1R7K85xzKothx3MO?=
 =?us-ascii?Q?Kj8pSYkA59T5loDNqaJ9+OlAd4OrXfmB45N8xNmoHIwiBMPTTZ4g/Hw7yD2S?=
 =?us-ascii?Q?1Zk/aUhTvSe2q/YbRBCg9uJAdhLiljmwAMHd0jsFCywPHFiXIqZDb61zAqlK?=
 =?us-ascii?Q?UbVSkFvLGs9uws+8gqAO7HAcUjNcncalf9MOp8UobfeXxrxPm/yJ5UHWie8t?=
 =?us-ascii?Q?WilaH+/2aynkf5g7LjfGfQ+Mu0of32l1xm4NHBhKJaX+guosUIneUUrWjXLL?=
 =?us-ascii?Q?K3AZB7vZ10c0CdtbgOJfr8qwosK2vOgBGpxeMSRobGwqijgejsgewCwzneNT?=
 =?us-ascii?Q?wNNJHEQoK2UqnjBetk6cDaoN5siYR48pTdl3/3WyBbNTtOm9dpefPwX6SKxF?=
 =?us-ascii?Q?L9anmpSJ4TKCYRJcAz8pUYObVIoMEJjo0BRFNfjuDp+eyN0/pjHyvEuak/UV?=
 =?us-ascii?Q?hnaO5GAqpKJkiohCyu5IaOkRuOZxaw/yHO7Hp8nJxV0zvWWP8MiYMdW/8xja?=
 =?us-ascii?Q?3GTPaO1z6XIkZm0NUtE9MKa9niBSWBFXYFHjR5mSwvCki1xdrExzP46GF8N1?=
 =?us-ascii?Q?iQLupPYm3Q56p6+63aXCA764nCBbAbhXQcJcPpBHg3vXgKQ6OdNXkl+LC8Jz?=
 =?us-ascii?Q?tNBjkyW/ifLbnOKhKZYLciMsgY3ezx7Zk+LnhXk3lCChizd5cdjRWqAwqRAR?=
 =?us-ascii?Q?BXm5ARyUcbRlH7pa3KZQIum+7Fx31dZu26NlwQ0/zP0Y08qooy02MzT2iIws?=
 =?us-ascii?Q?UAO84uxLiqrstrzONh7HfZurV7VQWWQ5x4ZwOC/Ez9NoV3M03teqpTC6qRr8?=
 =?us-ascii?Q?2f1mtlD/qK/qhrO5kjYFS6S/fqDcf/jjpuEy6HVCcel4tT/MdmExril/rRe+?=
 =?us-ascii?Q?jKBuA8ClSReCQhClHB1D+Ds3e78Sfn+v/8pdbggwyrD9jlOsExKSP+RomkV7?=
 =?us-ascii?Q?YsGNFpIAwIaY+R/TIgLtjo/zfd9Mv1Rv6KtffX+QoUrk3/ZOaC7Afijz4YQz?=
 =?us-ascii?Q?OzIKnwfGsOxF4kR3vERNLZ5XhlpsId1+paYImddj3o67ePt0l4msCbkwwcal?=
 =?us-ascii?Q?gIy17CZn2zI6kGeXt9bww8U62dOhaaYXeevVEVsBpARaiOwCdrwxWM71KBAa?=
 =?us-ascii?Q?iVT1mGxwHdVt6tqAnhl4G0FOB+jATc3jYC4p/NZgoGcLRJbkrLazKmy3FISZ?=
 =?us-ascii?Q?pdxvxT5zQ6tb+mUIQj4Nnk9QZIc0/WZ+KgWQIVxa2u9EGDHS4lnYS1cKNkZ4?=
 =?us-ascii?Q?ze9cZ1JLi+0NxkdUQmONm1izRHb1Hx1tHZRkuW9VhoBgfuaPUCcyYcE37q32?=
 =?us-ascii?Q?aGK9gVETrLWg+wLi7FidyO14mY9bFhCk4tVBUiQsw89okh4xQwkFFNjr3Kd1?=
 =?us-ascii?Q?Ek+Mc6VWzEU7I9EBAbN+T7cLdNSZNbzPW7ezmGSOAJNvKxSkXx810y+DeBl9?=
 =?us-ascii?Q?LcX7oAKcIzUOvtp8PjzbFD87+Szq2I2M9RpzfPT++JleYJn5JZ2TDr3G6Sra?=
 =?us-ascii?Q?CRrtIP3S7i5ws/2EmqhyWx0ozl3Kq8hZLlxeFIxuvtytsRVyetvNb/NDA51/?=
 =?us-ascii?Q?emzDkEWH0O0ug0K62Q8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b1fe66-3c4f-4fab-09bd-08de151d18d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 05:53:04.7753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMs7XciaxSmzjR+A3ddt+o6vm3FPSW+o3zQ8SQ92onpa4MTKz945t2c+ZAS6s2VXnc0yQCAhHnFk1kN68QVO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Wednesday, October 15, 2025 3:48 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Deak, Imre <imre.deak@intel.c=
om>;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH i-g-t 4/6] tests/intel/kms_link_training: extend test for=
 eDP
> connector
>=20
> Extend kms_link_training test for eDP connector.
> non-uhbr-sst subtest expected to and skip expected for rest of the subtes=
t as of
> now.
>=20
> v2: use helper for eDP/DP check (Jeevan)
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_link_training.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_train=
ing.c index
> fb9b42608..4ddbd72f8 100644
> --- a/tests/intel/kms_link_training.c
> +++ b/tests/intel/kms_link_training.c
> @@ -266,10 +266,8 @@ static bool test_link_rate(data_t *data, bool mst, b=
ool
> uhbr)
>  		      "Test supported only on Intel platforms.\n");
>=20
>  	for_each_connected_output(&data->display, tmp_output) {
> -		if (tmp_output->config.connector->connector_type !=3D
> -		    DRM_MODE_CONNECTOR_DisplayPort) {
> -			igt_info("Skipping non-DisplayPort output %s\n",
> -					tmp_output->name);
> +		if (!igt_output_is_dp_family(tmp_output)) {
> +			igt_info("Skipping non-DisplayPort output %s\n",
> tmp_output->name);
>  			igt_info("----------------------------------------------------
> \n");
>  			continue;
>  		}
> --
> 2.25.1

