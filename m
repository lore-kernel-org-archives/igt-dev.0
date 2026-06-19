Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C04CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 14:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339CE10F624;
	Fri, 19 Jun 2026 14:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlSLbVz+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A57A10E082
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781878273; x=1813414273;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=V5fW//mZlXhP+Dp5+KcrAfg7n9av4ytjKbUVgyaho9g=;
 b=UlSLbVz+PQ5rjcynAEfhIn/mEdzFnkBB23UXElQpNDt+I4/UGTF2aSen
 jo774w92lvFrhApbAxUdOQibEggGQr1zNKGd21qWfK4tljPwy+ZQdBiFa
 bBrMOc1J1ebpNHgS1AMUQV2+ZVmm4imKwuvf/JIMT7KRK3V9uAZ8ULWeF
 LFQbHaPtQySsNGmPMWyFCZLCYs8VVyI7nxmbhp+KxA38ktJG4ww5SL4q2
 Q803T1sabV52uHdQt9hOKBgLFQMNfgg44M5pOYYut5dCWecrsyukT0+ZF
 3rXt0v6RwEEgaLJ/RmPACIDTfXYc35GILw9dS0skkdc9/eI9/XU6ORL9o A==;
X-CSE-ConnectionGUID: TS4Rd5NZTLSAxWvDNBbv6Q==
X-CSE-MsgGUID: t1rP+naVRYObFCS1BIvSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82731128"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82731128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 07:11:13 -0700
X-CSE-ConnectionGUID: WPaBJGr+Qo+vtb/p8Dwf8w==
X-CSE-MsgGUID: pnX7HY3sTCqiU+j94WvH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="242264664"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 07:11:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 07:11:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 07:11:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 07:11:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMV/9E57KkoGOT7O0vXK/daaoO40jq9KRXQQncOsHH2anpvXpwK2kjDiQ7BOVpjdSg9rauH+zMMtPs0m/OcPCNuTdbtwbP9Kgq8vPn+ne1K0FyxWv1rfVOns+r7+E9kXKlmgoRizm9qrgWW5t8xZKZXHtz0temDnQpy8tbZFzA9sRU2K6ECWp5eOOSKlyFW9PY3K9szy4Nx1qEmtPyzMy/QoPuFJj9MTbhxS0GB240xDp/AebOWlLP8bPhXxG5WIrS8WywyifndxyQOC0Yh6/MNsNiD9+IR/b14bS9r51eRxBD2a69PLbZuJJpJBhgclXYjrCBsRM0SHVlYkSdSwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu+iLh90j7LZmW9fHmEHpRqqX+aWZOk0i0KGEaS5wPE=;
 b=vDmGUU+LAm3BXTi0BRlPNi6kcTi9vdRsxBHA4z7EY0rhZzh1mbZBzuVt3jUSZ1Na+sO5y0glTJEHpaGJ4nLK87mKSunCDIGDxFz285FaZxdHbiAxbrhMhgr9DXC9pIeDJpZz66WhczgHrvCfxuwpUm2ckBSefazA2rtNk5vQlVJKwyFtJi8tQAn2o6pqKkk3Q+UE48xYapi6DkJG/SMfoi9fx/tZXC9v7PFcYRr1BJ10x4iivepFt1JI/ZW1K+Ilfx9EqO0siKncsITpJIOvMG/6XysiQLNSWa+LpUvYgkEY0GR+/5EYWDQOYGvmvQNp+5UGM2BsLy8oFYshMPeJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:11:09 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:11:08 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
Thread-Topic: [PATCH v2 i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
Thread-Index: AQHc/0GbczpmTy7YVE+qxsd2EiHJ2bZF7Duw
Date: Fri, 19 Jun 2026 14:11:08 +0000
Message-ID: <CH3PR11MB84340467D4A8AC4AF7C6AE228DE22@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260618164245.20139-1-himanshu.girotra@intel.com>
In-Reply-To: <20260618164245.20139-1-himanshu.girotra@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM3PPF453C3BEC4:EE_
x-ms-office365-filtering-correlation-id: 69d43987-f2a8-4863-45b0-08dece0c9c33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|23010399003|38070700021|18002099003|22082099003|56012099006|11063799006;
x-microsoft-antispam-message-info: ey2GQ6Dd80Ld8hkkOfRchXjQB45+puy0KsZXSY1TZCS5pBfIX1YMefc0OmLf+c08pdqqoY0wb8Dm94Zl7CtrFHOZdCyp7INuZzVcxOgFoBvZ4cquDk70r5hW4uRyl5XiBLp3lwrlpAgBPGRholuLUy6JQ/s0GSLXouff5Hy8QN561I2m+8+ZJ17eUo+KeHT3AkRN5EgNFNe/SbNOXi2O1v2WA1MLB3EceD+81+3RnIp1IqftwBW754i0pZkb25n+9KF00IKO6gQOZzlkZJM8EXZYcmZC9s4xqmxj5CAz2l5Xp8f0Lci0dFesR0yrbMUH/gy9x8aueMQuAHeeYzVa+VRbfXBjspUywz9/NGbOT6C2c4DRN9cmNE1PqgqSzwQbz6dKXqZQw0g6e/A2DBWI3fVXF3KkPgIVOHkzigbKGuxN5309K8sXdaihjJlaNeLlTr4ofTv+xOeyEuiCIniyqgYunuUo9FfEBxu8ilOU8/iaXzLXH9pHMuoyhLPtaBgSLme5GELV4psdgY3FkLqN4VW8EMXp8619y0mbS1IivaWvcAKvjOEb+ziK+VMKvGDD2pMXBLqo2NkYv4Wd3sUeQEsFP4gLf5qkRCBRFKsBz+oyQ8jE+XkjGp2aM/iOqzDy77as+0yBaC7XLHpeY41ycyPSw3Jk4I2LsSKUsSGL1SHuD5EJkh0qL27iojOgk2N+rQ942jKGUBnI/rbDsJsBNPjtVjXiosZg7Ih9EX1l/dQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vpBx8lQPnFo3DTvSCVAQz+a4aWeEdY9D5sV2oqV+t4jE7v+Im5A1/Xw2vFty?=
 =?us-ascii?Q?G5vKvlZKXxHwYhLbe9SXsl/D0V7R+/t8D2RACiIHfTMJnAiIrIAK7L0AjDj+?=
 =?us-ascii?Q?iZBfjlyUAqambyXWfnAS2PCi6c7AUMeFJIXmIzD2eGApMIdiWEXrYpP0CYP9?=
 =?us-ascii?Q?1ZigPCzvTWP+lV/FU03jjigSs2SROvucoKAG+UrlF3tZwEbpOZCYVqL91E77?=
 =?us-ascii?Q?ivxtf6gAO2Vw3xL3oksbLftwIwWcZ1ICwptmj1HPWczyZ6AmxdG2klKKUIdD?=
 =?us-ascii?Q?0QT4dU4q7hUQNQhn2Jq2k86U4f56ZFNroNvj5/RVWnVIcKSea/w46mo6cLVi?=
 =?us-ascii?Q?1hWfeFKBVBpfDFHNvU8WM4H27nybTqaUSTaEnOBATblCJOwcTPwoiWdpdKjd?=
 =?us-ascii?Q?vyYLr9hFa4gjb0yHiKbEl+YmVxXpbIjJq76JMU8nc8SGXLjDpYU1tsN/uO+L?=
 =?us-ascii?Q?Xc6SwRJbUaIVjq68Zbz+sz42uyjsC0Jc89w7iQUhT4hmwbM0GNZcAD3hhwUx?=
 =?us-ascii?Q?x6jX85uCdmJqCHaJ4eE2l2qw38r1x8Co5oVekWvNsV+92zgv+mEeQ12hEcOK?=
 =?us-ascii?Q?34Lt/HM9jsZojw8LqjQn4FsAubsexkXl6XNJv42MIezRFuq+xTOmxf6ovGv3?=
 =?us-ascii?Q?HuG1MXBZOl/GraWDqBggbCYDeukZwlpI2llBxyYCpAPODM0/m0g1aIC9Js2q?=
 =?us-ascii?Q?pc9iYPtB0QkPrO8ISkIyGg0g4bo+MOeOPovCWWBr9GtJockDO7epqqH13RnJ?=
 =?us-ascii?Q?V/vECrT50X1bDZlAHUVJy5eIojHM/f9V36N1RWe+PCI/cNXRbX3hmLQdZySR?=
 =?us-ascii?Q?5lVdJn2GD1q+A8Oh3B2Pb7HyZ5boXGTNgZ4FrQIRT6SHmvqR4NGe80eKajaG?=
 =?us-ascii?Q?PwFQqzvFYFBz0V2/MAVsmNPp0+2RhSF4nT9943i70J5OcI8O0sUIOzsbIUgf?=
 =?us-ascii?Q?SbFKWGDFxlc1R7PsZ8NtW47On+DEnnEeI3FuCJpmY4KLe7R3BpATqLGc6H+D?=
 =?us-ascii?Q?d8omz9yeNaSVQFYxpZ04AeaERovSxAGfq2gekP5zidMQNxrryRNSex3j8rJj?=
 =?us-ascii?Q?i+qf60kEXlvSI+D6x3wEulwjJTQ7xCSTb3rbqDtBe+wJLYnvvHn5I5vGpcN+?=
 =?us-ascii?Q?FsFH3EPPsBjTP/w0+C1khEPhRVQffpQZSSI2/1if/pVIT3N9NwVZoTMiJ4MR?=
 =?us-ascii?Q?AcyDRUQnusgomOfcLHXIGmGNQ8h5GD4xvOLuThH6cmtIf4KWMj0w921BJ7Hk?=
 =?us-ascii?Q?UH85SwJDUbGD3zwbuAM9qSmN6ebhO/5oMO0m4+5Txz1O8XlvyO61ZSzZaPHs?=
 =?us-ascii?Q?/VN/4PPVQLQDXRVNeZLeRxS8SPTJW776m6rlEz0FzEqJBOrHV3vDynZvqqu0?=
 =?us-ascii?Q?f8Jd29K8JyknpPo8ShnQvZEvHn7MZTc6mFNQmMYgrLIWOTTT/USJPrIWYI/i?=
 =?us-ascii?Q?3mEeQ7OeK92zT63uuaCBlWwSRoyszylZI2CcuXJ8xATRPGifiBaYxlH0OwgY?=
 =?us-ascii?Q?KgG9ESqDSyf+71kJlPQ+RpOh60tNiXrp+w0nQeM8SffooSu/mIsXYekaqlEX?=
 =?us-ascii?Q?3X9Eyh8E15FnjGoJ4mXBgyZ05BwR7aIZg1zQLZKPvse1hMW+8RY4ehbDEsUH?=
 =?us-ascii?Q?Ge2y6ao82PoL4tsi/3JP4mhldKepX0RRf6czikXoPdr+/dSddac8c1oYkhcQ?=
 =?us-ascii?Q?Mcad5Ds/KYPxJnT+Bigk8ix5tEb9Nh92Xtdns99cbDHAd87itGwy/IREi+S9?=
 =?us-ascii?Q?MuScxD1xTFCwfEql8jmEhLoJ1W3qOpVfyS1jD7oMJ0GbsL6q3ZOcn6GUNA4b?=
x-ms-exchange-antispam-messagedata-1: P4j1mrZ1uPDDOzpTONNrFh8hnEa5kc2XyEk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Cc5g9GptQE/swgOiXimLNxBTeiwJq6tDJfbwmJnyqGD3xM9eyTDgwfG6nt+oEDCvegP0CQDaG6YBzdphjQkoWN3NnFFZAFIZi/ePv9yxvgfG5tOBSThE5iCgnkeoRDvLME0y6JkkGZIgy8kr2FtTnGSCZigxkipFAwted+s32gzka4VfgZQaCYP4pW6i8yLMkH5VUZRm4PnjGucS4Gx2S4lokPS7igRHeolpkX76kbhj88X/On7kpK+XdQWwUJgg611E20/VijKOLAr6PHHkzpWbVf2aREmrKovJu/Y4GnoUwdrmdJcOyehVSLQhNmv4htoyC3yo+enRLZpxQHSj1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d43987-f2a8-4863-45b0-08dece0c9c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 14:11:08.8188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8tunHPt4B3YdlDPLPFS8Qcr2YyV7OCrX9hLT+IRqKVTLrQc5kGWdx4jaVVNkanunW+uMo8+2XYUsmv939FJriorBSQvvI8VSLVB8riYrcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> himanshu.girotra@intel.com
> Sent: 18 June 2026 10:13 PM
> To: igt-dev@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>;
> Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v2 i-g-t] tests/intel: Enable survivability tests on disc=
rete
> platforms >=3D BMG
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> The survivability mode tests in xe_survivability and xe_configfs were ini=
tially
> developed for Battlemage (BMG) and gated with IS_BATTLEMAGE.
> Survivability mode is, however, supported by the KMD on all discrete
> platforms from BMG onwards.
>=20
> Mirror this on the IGT side by replacing the BMG-only check with a runtim=
e
> discrete check combined with a graphics version check of at least BMG
> (IP_VER(20, 1)).
>=20
> v2: use is_intel_dgfx() (Jani Nikula)
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_configfs.c      | 5 ++++-
>  tests/intel/xe_survivability.c | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c index
> e7c797eb7..9ba8f94ec 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -11,6 +11,7 @@
>  #include "igt_kmod.h"
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
> +#include "intel_common.h"
>  #include "xe/xe_query.h"
>=20
>  /**
> @@ -379,6 +380,7 @@ int igt_main()
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
>  	bool is_vf_device;
> +	bool is_dgfx;
>  	const char *engine =3D NULL;
>=20
>  	igt_fixture() {
> @@ -387,6 +389,7 @@ int igt_main()
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		devid =3D intel_get_drm_devid(fd);
>  		is_vf_device =3D intel_is_vf_device(fd);
> +		is_dgfx =3D is_intel_dgfx(fd);
>  		set_bus_addr(fd);
>=20
>  		xe_for_each_engine(fd, hwe) {
> @@ -410,7 +413,7 @@ int igt_main()
>=20
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(devid));
> +		igt_require(is_dgfx && intel_graphics_ver(devid) >=3D
> IP_VER(20, 1));
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  		igt_require_f(!is_vf_device, "survivability mode not
> supported in VF\n");
>  		configfs_device_fd =3D
> create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivabilit=
y.c index
> d5d7e048c..0b3121a08 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -16,6 +16,7 @@
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>  #include "intel_allocator.h"
> +#include "intel_common.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -217,7 +218,8 @@ int igt_main()
>=20
>  	igt_fixture() {
>  		fd =3D drm_open_driver(DRIVER_XE);
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_require(is_intel_dgfx(fd) &&
> +			    intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(20, 1));
>  		vf_device =3D intel_is_vf_device(fd);
>  		igt_require_f(!vf_device, "survivability mode not supported
> in VF\n");
>  		pci_xe =3D igt_device_get_pci_device(fd);
> --
> 2.50.1

