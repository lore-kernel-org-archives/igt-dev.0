Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1056C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC4610E230;
	Fri, 14 Aug 2026 16:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVnaJpxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BCC10E230
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786725525; x=1818261525;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=d+PfawciZ69fIXGeTlrX0dUKm4kRuqoZJ6CaAIih7xA=;
 b=bVnaJpxB3uoERCdVhWWGv0j70fSy+qXFGFI8snIfTzhcz1Fgax1DVFfC
 llDY+VVEDo9Wyfwi4w6TgnnPreUWbGSeLfpJ7i5sRP6DzrpAelpFxRX89
 PLYl3eqvTIkJz2ei5nNaimQN5SQKfWB92saw+WSNpW/3CZbupl/4Ii6y+
 ZI+xdmQoby5mCIt9U3VFKsuIXY56JAFmrEccU/D1RCu1K37vYK/XTcGHb
 qY57/woaaOvcoM2Ask5MUmPrFZl7KR4TeuuMuVDA3TE4P0lnICjjMhXJW
 ichN2WSpOyPyVrd9wiEXUzg0WCYpCq0j4Buf1oo6anMkWwOFRiMv0FFDS g==;
X-CSE-ConnectionGUID: xz2xdqryR/uLAVqi5hjnPA==
X-CSE-MsgGUID: jmzRY9vrRRGMnyyUjnGsKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97969678"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97969678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:38:44 -0700
X-CSE-ConnectionGUID: Ky9FXKy3R7aAHRpzty+Huw==
X-CSE-MsgGUID: DCKZVo/wQcOyKNpAdyIxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260480636"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:38:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:38:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 09:38:44 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZiXJbRVK/VWOpV5QsdizmCBvqon2rOVT5g+pgBTmRe6LH17bs+gfKyzbrwmEztA0GRUUqaDQ3tRx5vKvMHtCXNsenK7ZKN8eWgLlKfwac1Bybk8pzqEYY2n/Ej445zU3p2BFhJVK/k5o+tihvuXtjscV2rA5bla4jbRgJXfFgspkonjdR6hlhSf7al8xE7R03d3OuST3kQdozApUrq+w2DGL58INALC8r5VINIHefa8YaNX+Q+jd/rVJN0Pf6T48eynsHbkQGfc94Kq8WJk3L5TG97kNFxOuX0iLMy2QK923rAmuqtO4U7x1E5DH4OLtdkJqZnNsbZr/YlxAFlmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D3ehcawo0cGPxFjgVeR9CDr1fxqGRqBl4LTdd98D0k=;
 b=bRJQqAP1PHjz/HOzGnPqYphEj0uOl8LJrBKAkOojNpmvZdntkvMLCl06EOclW2zdeQTjJ4gCWyjkM4yp/mOIxraqjSeevG+b39zW7DzxuC0K/Z9TNgBT+lBWtU7zKpL1TfbXSH5IleMlPbbe0X64LDzcBTnaXvq2ClaJVT8VKRH9/ZlWa+HF0zEvUaGwlrMxnwg333QxKlc3qURutCjabGTePb7Cn3UpDEwPhdjz7T7pgbJ6tzB5G5qBLi8NOVowAUNfoKpaQisSavQ/Kl2EGKdZw3Y3sIw2yuH3o7cXdTJ0LmDeGxfSVWHXhP1h4xp2FOYtlm6hjSHPv48UxD+fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 16:38:39 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:38:39 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 0/2] Add CRI blocklist & enable CI execution
Thread-Topic: [PATCH i-g-t 0/2] Add CRI blocklist & enable CI execution
Thread-Index: AQHdLAbwkM2+vCiiXk+pyxl0Wtg2sradvn2g
Date: Fri, 14 Aug 2026 16:38:39 +0000
Message-ID: <IA3PR11MB9013668EFB6E0B35B8C8D88385DA2@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260814160648.19715-1-himanshu.girotra@intel.com>
In-Reply-To: <20260814160648.19715-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|BL4PR11MB8870:EE_
x-ms-office365-filtering-correlation-id: d6e3d944-569f-489b-56ea-08defa227e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|10067099003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: wyAht/S/EABoEqfC2+wzHyajkwcdZxXwyeHyBqZF0fM1Wr2VI6hJ3MK5q4KUifU7KOqOe2zReOFMk2mUheU1gSgz7edQW748lSLEWfnj8N69kuSucqG1uqXq2ik5WJT3RFC9kWQLMVw/oKzNmK9IBqtABnt1+w/g2b1DDJuOUJ6VjH7XrEZ9zg8iAzLxXBSADrbC1fQ55bx3M6I6vK8NPA9wN05MjY9zALsOqj65aRvMtbLnKVFp+Yvpdavb8MKqOPP2BmieVUg0sATJ5Wk00U6iYW/NPqxDJOP2O1RIsmE1V9pOLudwwRVMVgSZzQ4nxvPK9lVTuU+WlPYkSm/T7KgdppPtYA6dMNX2hzidlGVKRMl0aFUJDI2okbsr13lPYXdWrGZXftQa6/zRPTZOugidFzOUFYsAhUVeM7aPRBnZbnVGAgvjWSCiOL+8bdrjFiRWlV3uNXhHLhJh2wMFkCeTL8uR6aV0tGf5kjqP0IiV1OjuhPX43iYwV+kKpvm4lJ27cUpHsmT1Pup9Cba5JrWg5wWQttLdrId07IUHs+amUHrfJKg6SX4AjYrtCK8Yjgt9zx/shg0aPpUrN8cwKlehov7Rz4hIgozHsROJF/LOAqAU4rKTaTZ7oMrF0PmvLQ7QVPpIsE/qQ9LjWimGQpN266HWI8BCpjxOBff00h5CObvF2X4ljxKIc5EubfXBI0Us6KOxseo2tt7EaN0l7tTdUt6OllqH/sgiKcsEui0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7ZYLjehAeOYi382v6MYXiUtEK7PNEleU1DV8DlgOoT53qQHJz3/1f0nT4TxB?=
 =?us-ascii?Q?ZM8i4/74SE4XPVRA01GJAFbTd3UClcfsVyY8GC0Ebf6yvauEC75eMLCbDXWO?=
 =?us-ascii?Q?VfXzPI8mIiN3LEl2p1mLES9qmP3EWAZIVGyHbxxbElzPWsBm+6eB8rKZTFmZ?=
 =?us-ascii?Q?ehCmRa48F/+tRgQVGi5urqdpnqVQwVKn0qYwPpSO5I5y7JyrR8uJuujM3olb?=
 =?us-ascii?Q?g5kq4luseNqpY8Yp5IDL0ez2GS97AJ37x862tgSO9XNGj4afbJLv2VuGfKoe?=
 =?us-ascii?Q?OAs/h/q24xDqfKNUyn4XXXfozvYSRUqLXGUMVKJfaf1cOO73X0eTiqU3/lpP?=
 =?us-ascii?Q?v3yX/XGlvN5R0aGBKJt2VDGlKEO6bw0wW+BU/qX15cKKprspO+tntZMG6m0L?=
 =?us-ascii?Q?J6SE2lMeYx5JvHk8atUXrMzxj0HVsAe1GEtUwEaH7QxPiptcw2OskjylZ9JZ?=
 =?us-ascii?Q?r+4ZnbxyoePqyHR45WudX/dajJLzGn/PE3d0tBEfoUU+EHs6CdmX18ngrxby?=
 =?us-ascii?Q?d+BmVb98h3b9GrVSYnXgsfQRRLl7QZytbC08CIhdyNXMCBxPX56vLPYFAV4T?=
 =?us-ascii?Q?HvKmwI+ZavsdGfrKA6QqYb14DKlQV/3NcTtbQthL98qEwpK9/mu7hHhXvLtY?=
 =?us-ascii?Q?5XleeiEGJYr+07wFZNYa1pIl6gOVdAT4FsR15IYrY8a6biPIlyMrlMmNaADI?=
 =?us-ascii?Q?ylhgLO987iTKQbJW37KUP3NhiKB+HULvD9E9ll4OFJU507sHEvxV0+2Vh9v7?=
 =?us-ascii?Q?ltn1UxGvZEYl4kZt2m3Sn5lCMEmjwTQHXH6PfPLusE+6CV58HzB344PHm1J8?=
 =?us-ascii?Q?tV8MXt0S75s+8tneuzaJWwwZpm22bHfZcc457/9YgR7mr4Qz0HP0DqSxnE7T?=
 =?us-ascii?Q?xva1nmWO/q/CA0fseM13+iZLzN9Gg6cz47xWqbaVcdHLNgl1nP/c8TfGC8Lw?=
 =?us-ascii?Q?IVcbTGb0/O/bUFoiwj0Ghly4KI93lXK0BzImI7BsAvPSDcMowihaSicG2GhR?=
 =?us-ascii?Q?Rg5wh+gZ9QkRxJAjNOdXJoc/SEMRiaLYk6ebBJGOHAWL7IcfL0sASHtWzpGu?=
 =?us-ascii?Q?hpAGXPR3BdD4GUUvjTRDJOClNUlOBLFVF0eurlbP2nfB8VEYRGsxRWTy8Cfo?=
 =?us-ascii?Q?l/85uGcue9AKmglZaxvgyBggZWgbq3XdP4+qI+mYu0nZFl8SGuewXzvVms9e?=
 =?us-ascii?Q?LJJzKjv1D1aEiR9yo/NF6FMxj5CoqVB9Ul0Vv/pPoXQpQ1Atm6ELt45PkE59?=
 =?us-ascii?Q?cBZFsz5WXekv5DDL6zmpH0IOYVIIiImauew7o5NUsvLrIzJg8PC69rDvgLqT?=
 =?us-ascii?Q?yGpGEK5WkS2gmDoldqS2qtnxUgXofMlFfj9BHuDTngxIJ+mPNnl0PfeT6ZAL?=
 =?us-ascii?Q?p5GW3/pmJ2yl3v+1g1zbk8GosYIyXz78qL2VC+mlT7gSfz6Z8/85DFakKGrb?=
 =?us-ascii?Q?RmkPqLxFvVT9ADbPTfoXNHFos/LZS6GaC9disBm/zPh6w2/+TtFtWOn1KXeB?=
 =?us-ascii?Q?Ut+EHjK5HJIINgnh1m53FmSzNyM+vVj1QbiK1w6O2isvs3G7uu10GCrZRXK8?=
 =?us-ascii?Q?KvFXExdPThQifI6C10yONJBIwSJM3LaMYIxIzqqoJYh4J5vMOpr0aNE/EsKf?=
 =?us-ascii?Q?0WopXTyipOZAUsF7ktIinMyUnhav+oT7k6/93aed9vs2HstVo/clpQ+bIdHm?=
 =?us-ascii?Q?WRmoBDikAFjw4G/ylttI7GH5jqMTN+oCq8tkW6gBBZ4ixbtpNpYhLUzHNIgV?=
 =?us-ascii?Q?eMK6Iipbxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FyTDWA+ujoQx3iLblzc6DZgZEu6+ejDwWc0vgJtwsD5Nr33FfYB8w02NM8bOMEc7DELMRR1QE+3AOlsB8N7pTM80Ezc0qZYMpaYvkBE80KAAeuWxl2uPCiFthdggUHQzI1SCyc0HCvtxvGg1+RjQxdI9xIl0nO5dVXwl/leTMtFNyT8qxCaHX7jMHH993JfryV10CB8PK0cNTYqIAJ+6QZFHt+Y4w6F9GkJfDLe9n8nGuHVtCdj2F6A19j4wa1bQwzhWHytRX8z8tUqFypZdskwIu/iytg/DwCD6hYe+ssY4FiSxsq/vik1meQuipi8D3JUpnAZhcSA3v4HTiSoxsw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e3d944-569f-489b-56ea-08defa227e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 16:38:39.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1m4AD9P4soR0tOnXaCd0koUVWWNuF7gex8nTiL+TSqGOqLXIRw5+MGaMw1FvXuhpUACMpXGlh2m2puPbx9cHnakP5ZRlYBBCLxklWc7KQZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Friday, August 14, 2026 9:37 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: [PATCH i-g-t 0/2] Add CRI blocklist & enable CI execution
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> This series adds execution support for the CRI platform.
>=20
> Patch 1 introduces xe.cri.core.blocklist.txt with CRI-specific core test =
exclusions
> and registers it in meson.build.
>=20
> Patch 2 adds the xe.cri.core.blocklist to config.json which generates tes=
tlist for
> CI execution.
>=20
> Himanshu Girotra (2):
>   intel-ci: Add CRI core blocklist
>   intel-ci: Add xe.cri.core.blocklist to config.json
>=20
>  tests/intel-ci/meson.build               |  1 +
>  tests/intel-ci/xe.cri.core.blocklist.txt | 53 ++++++++++++++++++++++++
>  tests/intel/xe_test_config.json          |  1 +
>  3 files changed, 55 insertions(+)
>  create mode 100644 tests/intel-ci/xe.cri.core.blocklist.txt
>=20
> --
> 2.50.1

