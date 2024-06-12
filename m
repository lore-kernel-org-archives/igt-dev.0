Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB43C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B21B10E182;
	Wed, 12 Jun 2024 11:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBDXgb0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4710E035
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718192055; x=1749728055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cj+FscjxV6yaKxy2d0IF8XCImC0bftcIns2/zOrR8cg=;
 b=lBDXgb0ilJnAM+/JhGamYD30AXKrW7JjKWGHzhMRjZfIGkwtpZnp5SYF
 plv0ErpuYeXxP7zowKK0ZzESIHvZulNe16d79QSp3pPac4Z3TT02fnI4V
 efCwMy9Xm8M6QxDO8+UhKQzU99BriTPpRTme4kvrYrhDaesFLN1LYIw8v
 evcO56PvBZDziox0cACowJXysQcIa1BrZ+cflNV2T8K60Y7+5V7W/lBbh
 kviSTRx0VA3+VLGpKZASxepXjcVqgq09UYa8tH2WVq9IKFZOWOgfzSoak
 ex7iA/3MM9BosmfjUDvJBXpzQeiQv/cIk8wg2epHq9ANClrH4Hb0SPgZG Q==;
X-CSE-ConnectionGUID: D8cWLSbiSU+iV2wbYiujIg==
X-CSE-MsgGUID: ZSL5exKeQL+xPaZaMcwsCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26370499"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="26370499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:34:15 -0700
X-CSE-ConnectionGUID: D0R5REevTamPCarxwrCmbQ==
X-CSE-MsgGUID: 0EFHRjgKQUCL5vor9+z17Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="40236644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:34:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:34:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:34:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBqQ+z7aaeNLOGaWobWcijbiJLx8UfvqC0IprQLdjl2wdOw5u2hfx++r1lcgKLu25j5U9/n5ABXWk2ASbG1PJ+Ub1EmVbxdQHgZu68ok72mavGjUHBL9g/vjtO6RwZbK8rAHroEK0a7ve+PQtsA+nmUF4wMHh1OB9NDaDzNijOfvg2R/LUG2MsXHe9bJnoU75hAjWKVJHezMKLiatLTzCMNqrc657ZT4myOZGp6/0bCSmXs5qAzvVPr0WS1zWIUEJf7ELrgQ//Hf/55bYDFkAT1NBOHiAzFnGurCIrReKUpNypvSvWVXUBC2DLmCBE7YuOXd1bmsaoOEEXjbUHLKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFkCh69Db3QSK0yUbd7ePUmL5wV4mQYKgtZPueQugrA=;
 b=MqHqGhy657WRb39XlNNr/UoX+T4iwiMcCgkF6kctCH3cs9u3U5Lr5SRhlDc8BeFoTTyxR4okNI++IF21oE9eWD98u5e94vc64Vkzg3eHOWpHbRbgZ0QQRTfW0yX4aoV98e/g7rui3jfnnV6mYjnKS3hY3ptLuz9mZAWaKIQ06VoDjWNtCwH1j6djtlUh2h0GscWQ2G96Gmdtjw1hSQQoQdnhcTDK2A0koIsILcKVDqTKiRbiDsYN+17ra9pppN2jeW3efP+RrP1iJeBrhvH6so7sfXRSjCTAEdAVkrtmKw5DLjAJdJl/MQfXNWyC3L7t3avwlzr43zlxNb+f1JRyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:34:07 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:34:07 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 6/8] tests/kms_tv_load_detect: Test cleanup
Thread-Topic: [PATCH i-g-t 6/8] tests/kms_tv_load_detect: Test cleanup
Thread-Index: AQHau7yAVKA51eeak0yByK5WbgouabHEAUog
Date: Wed, 12 Jun 2024 11:34:07 +0000
Message-ID: <DM4PR11MB6312E16051FCC6BA41C7EDCA90C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-7-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 46c0fd81-3a91-4d31-af6a-08dc8ad3923e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?9VtFqDFG0aGXwFt4GpmiasPgdx28dYckcK1mDCO8cgrbkWNQ+qQmgHXedfAt?=
 =?us-ascii?Q?Yw04d7daJXe4l0HJDP9dduQmNCAUFu9FlwhdzlY4fdBEsgsrtEKV6nW09Xx/?=
 =?us-ascii?Q?vBTNnp1BLRBTtgth0BOiayjh4LHqVGC9lZKtozlSp0otExmihFMycvoinu1W?=
 =?us-ascii?Q?dRmE4uXVjtWM5ap6oNgEOWieG9fh5ppNr5k1tJyHz+Iwtin7LNzPffcNbaEe?=
 =?us-ascii?Q?1bHlLDo70Eszqur5ZTENdhfXuCycKzAOjCejFNX3/sBk4A78FEoq+8j47/SX?=
 =?us-ascii?Q?5lCkzukR2QQ8U78OsrCNDLSzNygzOR1gSU72fFk+ZLM30KR4bmrdka35AhPs?=
 =?us-ascii?Q?xsL9u3DVfQB+1lkh0m15A6qVdNZBXVN3mxs8oGUfdALyEz9vWkiobuT9clJr?=
 =?us-ascii?Q?EFJITkpmHVwlUPT3h6Jk+01p+3+/M+9hQ4D5PZUNWVMIMOHCSUpiDOlHW+A0?=
 =?us-ascii?Q?CIR7QC3euDQfECRKzt6LA0yec68DQsbtJ9VShAAlrg8GRjGkg1Ce8Tld0Srq?=
 =?us-ascii?Q?bPAOKgLjUp/l55Lr6JfUJVZXyCzSWNBDteaefZvnPjwU+vh08sFQGDsB/Mjw?=
 =?us-ascii?Q?4HuQVLjBMMN66/ltVLRdBOkxzbTcJIZehwfk+IbUSkMmjVXYZOsBdR5umwkY?=
 =?us-ascii?Q?p2irDuATAU7SYTbiUrF96iKd3NEGYSqmvsfbxgOg2cOPAoTiBMY8+Q838f6e?=
 =?us-ascii?Q?aTaarz0/8U1lEZZkQA2OcpvChCB9XORyX0nO+ffcZ8/DKNnpGMbAbPe1+TgV?=
 =?us-ascii?Q?uMFpImBFky21rBTFpkBIc4/gx7Ou48gBclVQzh7CGtXRgidtKX/51C/0GSWg?=
 =?us-ascii?Q?86gHKjqVce0pwfmyrZPotTckEdji7H4l/ReeqvxS9cWijAcYd3u4o8wDb5tR?=
 =?us-ascii?Q?b/be75BMdy6zro6d2GQtHTcz99uhjC+HkD/xuTZ3KSv6YaCSf37jjzM4+s9m?=
 =?us-ascii?Q?MHCI13A35n+GCd53LXxo6ptM14pDbQN/aYP0AVKIyC4SLdwq9WlCM2y88trd?=
 =?us-ascii?Q?VBS6DSmx2YQBiTpw4vgbqUFbR/UatC6sH+Gfh7T1Rf057h+Ee69LK0qVQ09s?=
 =?us-ascii?Q?aouy/aHncN8oycw54lQHe+Pd7gAy08uHIAfHd7XEVLDCd/XatW+YnqQCxwEl?=
 =?us-ascii?Q?SOjKsSPO2DRMANRIF6gxoBZSwjIv7+VTmQNw6AlLqRyA2Rwe7C0G6Va4IjY4?=
 =?us-ascii?Q?Fw/lJhjHVO4CJo6UoiU19tbuB9kcxD3aI2oDpEgI7BQyI9Mp+rUIUpicUUP+?=
 =?us-ascii?Q?W+lHqEekVaJhJ7FSaXxfPmiVtqWpCnCc715PFPZdfO0sHMgKARU+VE8SPt4l?=
 =?us-ascii?Q?v7VkAxU2rPqLwXg5fVPX7JGnJtix5HWuPSdGMgHol5O7dXt7b38S63OYimgq?=
 =?us-ascii?Q?k3fSobk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nPOIFrjwhA+m0oeeVq9+QhDla0zs+dn77DW9I9Q2SYZEj2zb1z/RzETLIOtF?=
 =?us-ascii?Q?F+GNyZGWnLU13HIsBJnAiuwBdIZ0Zo3hXptcuGLgy4Pfa3ppeQluRmb7gvtm?=
 =?us-ascii?Q?czasiha7CEskotlL/haQHbohAJXKw3SLOtQjG8TxQSDfDLm84eQ5JdGzWHGr?=
 =?us-ascii?Q?lYCSce8ia8U2Zgppz4AvNuw0iPR9JSmimkayEZ1zgzcP0tZxCwc8piCRwmfy?=
 =?us-ascii?Q?KA2rjcPdBBPZ/dd0z9dbq853JngbUGz6YoSEbOF/Zd6OwfydNvIr5oYHRG1E?=
 =?us-ascii?Q?g7dS8Bn9WvzY7ZWGd3tKZ+s/yJ298luOpOqd15Zs8brQU/k73KC4oFdDVjbu?=
 =?us-ascii?Q?UVmxOHjsnqpg0wrUu5vz8WT1i319rAQ6wkHNoJIYyOZWzxPjcJ2b0u2jAgba?=
 =?us-ascii?Q?1YpaWQBbb9diCFOAqZCstguzc5zJWhftpm9PmkfU3U03MlXTUXUZBIomW/eL?=
 =?us-ascii?Q?tWcSacs7AeJh43KVP5ZvcFMdwVN1nWeDoQtu/eDNKGh+nWCkIUgGlszgxE77?=
 =?us-ascii?Q?O02PGghGgHHJNrPJWCcJRXSqUTnlljeQUNh7ciuxiSXI3TYahwqMs66cFEZ4?=
 =?us-ascii?Q?fpXygT2BlBmphxdLPz/z1Qy0GZZrqcMKCYZRcX8ZdjAH8me3QZyUWiIsHDiN?=
 =?us-ascii?Q?PybS9gbXbrleNE1lZDSX01H8yJP4CKsHKEHZzx3INUd243MPkRgB35rjAWDO?=
 =?us-ascii?Q?nCPr+rK9rp0e3mrb0K2bAC4+tHZ0urGMFT3pzp9+OqrIZqld3oOcwPyYjg1p?=
 =?us-ascii?Q?muu4GnVCVhyT4zL2X+K7CjHvUWlffKTo7mYKqijEeRKIvzpjshn8klSABGCv?=
 =?us-ascii?Q?oONcthgUB5pT0CWVFzaH0HQza4aWiDCsixkC8IQcyZJNBdSzV/BX6H5sTd8t?=
 =?us-ascii?Q?yJg8MCywD7egZtYP8/wa+BCHzWNnGw23ZQF5lKuJJAHIrtxR8PjyTml/me3N?=
 =?us-ascii?Q?uBZaGtYs2kOcFvV/LWIL9gj+Esq8hlhjSiLYldjYr/qPDlLTcTBuJ50Zrz6c?=
 =?us-ascii?Q?+wdfh3MAktELKFwrIof125+8XfRQ60Zh8irWNH07vlviu63hsEa1Cj5HoxwA?=
 =?us-ascii?Q?cbjUNsorUaG4WF0gK+UzbXFF/LXsVTv7ofBVawaSpGwaI3ezFhXbBYXBrFSB?=
 =?us-ascii?Q?gkzM2elXpLtVtEjOydlQwHhcj6i4VUS4PuzrVq0jiOLRZBMQYuermZlcbEbJ?=
 =?us-ascii?Q?URFAiOy4WXojR0sT9Bj+K3tAF1dhkhHk6mzjfr5nDn7pPyUICtCMME3GDuAP?=
 =?us-ascii?Q?BQ9E/Z6fASnvx7xtcD126CGELgEMvPOmkf78tF6MBEMaCEQy7KgwOFqW288H?=
 =?us-ascii?Q?nH16h8Vd30yYOL/dskle+q6cA1Ed1ATaTY6LfgviQ5RM8jBYuRSliJPpFV0o?=
 =?us-ascii?Q?6nIbNdZ2ge2X+w23MimEXV9GVzVLrP/dNbY4XJnZjtDsQ3Pv5rt1pwBTMKqz?=
 =?us-ascii?Q?KoLq7ItU/TFEv7F6Te6FoveLIMeJLYc5NhKZHFcanbPm/mC064q2uSldyes4?=
 =?us-ascii?Q?c7ShfUMHIeN1Qk1/uLpRolvThlgy4eb/IlILWSJeRDZzql3V4klsaJ29dSwI?=
 =?us-ascii?Q?JC4E7bgX9CMuP2a3hcU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c0fd81-3a91-4d31-af6a-08dc8ad3923e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:34:07.5872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8PlYUo8vP5TFcbZj/uYieSNoX/QkG9ktmqqjGEbIzEdh+whAcytiiF6kyFdvFh6K88Pv+nb3LpmI2LCpUMkMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 6/8] tests/kms_tv_load_detect: Test cleanup
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_tv_load_detect.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c inde=
x
> 8feed385f..9f6f4071e 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -99,6 +99,7 @@ igt_main
>=20
>  	igt_fixture {
>  		drmModeFreeConnector(tv_connector);
> +		drmModeFreeResources(res);
>  		drm_close_driver(drm_fd);
>  	}
>  }
> --
> 2.43.2

