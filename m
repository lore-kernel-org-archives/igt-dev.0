Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794B1C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 21:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC110E2DB;
	Wed, 31 Jul 2024 21:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAcm7TFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E9410E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722460616; x=1753996616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D0nGXoiPfs0Dm2RzEOsheaEUfuyxdqLarIsZM1MDD38=;
 b=fAcm7TFT3BIzAAuqUY5bJZDXfmAjoPNbENEHI6WT+qE+bRjxz+JOnGwB
 NXP53jOHtbGzDQ1gruW0AQxudkrxrYcWm1JO+YfhbkUoRj4OdQXAjTSdk
 4GyJy2VFwLJ7TzBbTbHtFKZv/Ns3hZwOGu67R0TlgxN/ONTDJRACOSfS2
 Qn7QBmoxpkIBtFLtf+sriKmTiVWTsYnusUKvj6kifndx+2xDJLAwN6bdC
 pcn/sdSO4gg4taj/urjQOq705LYapvWsfWFhjcwQoF/8vCKbz/S0Ejd5V
 HbZylCQj0Pa2giCHVxytH0ibtSF9NcKmncwdPSf7PnM16SzWHlBFQUmbc Q==;
X-CSE-ConnectionGUID: RBK0h9dFT/CZPlaWGVki5w==
X-CSE-MsgGUID: pQFY6MlhSvK/x0R9T1okEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20528091"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20528091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:16:56 -0700
X-CSE-ConnectionGUID: I+25Ut7RSjmQ4CCSSuvGfw==
X-CSE-MsgGUID: aESvPJS1RoWyVhgWiTI5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54707093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:16:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:16:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:16:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:16:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDTBRFP20bW6P304qYJIWM//Lbq/rsa6w4wgrYqT/iqqMLaz4Gfd6C+343m/kLpsQhRIHn2OPxhLScjrsx/Z01o+EmOH9MaL8BwrvdzHZydVt2t7EUviQ1pKfImHA0RU2qNFtKoCQoKg8acrB5At1lDfz6KoRYxvLMlt66rY6zOyWsMKGvgzkeo9L+NGkgdGQ2peqtlutYb4iueEHliCgEiS9/n9uq1MG/onYTNnbz+VSAaTyBso+VJ3vtM4ty3hFGksN4x0A12gADjKDm9ZOH13hC1wCYvdCpg+Ps6yxIbVL0D398Jh24UEDb1jilB2UcKHN20LXWLhSHGAp4RxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuHWg1uR2gMqy8pONLToXVxj1V+7FnN9vqswhH6NH9o=;
 b=QybyAn9bTHGUi/UerpyMQGMD/Uj+KXFiJNovI1LkCHYJ8FqF3r2gqK7pDr2e37kl12wxkk/Bea36L0ZGxfiitvuRdMW7/Ea0mF8QAaVfefszyLMUmhyGMsPI+0nKzCl5WfpS1XSKZVl/l4LZfOVQ1TA71hUm62NOpoczqiQbxFHqP/cFwPCTZGiYbiCQ/a/l9m5EXImORIFSMbEAl6vndTTkpGuVXuVTxk0dghOOGPDogIXKRDMkTt7mF8f/WvPxhLKWqjP2mSZmQfOp2qbzIWVA7+BQDWMYSpl31whZ/uaDiiHjCQPqdtT3yKHL7e/L0oEc7ByM6hc2fcwU4c9fcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7492.namprd11.prod.outlook.com (2603:10b6:806:347::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 21:16:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 21:16:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>, "B,
 Jeevan" <jeevan.b@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_vrr: Fix typo in igt_describe
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_vrr: Fix typo in igt_describe
Thread-Index: AQHa41n7T5xOVow4f0ywmtrb6z5blLIRVpSg
Date: Wed, 31 Jul 2024 21:16:52 +0000
Message-ID: <CH0PR11MB5444B9FDD3D2EDC9B267BEA7E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731150741.2952335-1-jeevan.b@intel.com>
 <20240731150741.2952335-4-jeevan.b@intel.com>
In-Reply-To: <20240731150741.2952335-4-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7492:EE_
x-ms-office365-filtering-correlation-id: 2efca304-57c5-4e01-3c53-08dcb1a61929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?soqIEik8OPegEsOzLfY79yXP1rlhIrI4Z8TIK9dxtEfQEkJWcoY0EtwC42Z7?=
 =?us-ascii?Q?6Lf1alDAJUYWXWGxguwI0iC0ZFBze2Xz916AsrFYpvRGC/YotG6qE2puHk5T?=
 =?us-ascii?Q?YPvwhExrfUZFfALLwrLcvMjxmd3Ru2PSap9UulruVqk9wdf9LJMyC0h7u01t?=
 =?us-ascii?Q?J+iD60Gnt8IRr8fuwTc3rcWsvbmhh40i+1ZB9gY8ytjBwduTMTNE7TVpgyx1?=
 =?us-ascii?Q?ZR+gIyGPKbf0UJ5hyAwMHs8MGhHMm22oHMuCUCe7GDBXHYrKqF+rRHsOQ6Y5?=
 =?us-ascii?Q?kYW8/Ps0gb8IledYzeikxo6fu3S0sClmRipt6UsJ5sfwD6DjPL3oNKx0gyxF?=
 =?us-ascii?Q?GRY9hZgGl+HlUPbMo1t1DlArhIHOEZyb5WoP840OyPUd+K/jkXb7i9+3UBl4?=
 =?us-ascii?Q?GeZQWEqimX9AureVI2urOV84jQKOr6WgT9019g9o3Ti85AanfbhToaywZbBf?=
 =?us-ascii?Q?xP+n6OGHFkXSUtlhXYQOc/qgXYfubV+ifMtvDLQmnYdzm7gNYLO+v2HTnsjM?=
 =?us-ascii?Q?lZZ3PoYqO3tbzKqRa0octSw7GUkXjmmGSYKgwD/dGzPgk4va5W1gWQXretSR?=
 =?us-ascii?Q?ELMsgremCoabagVvUjAbcdE3bltMuvP5ibtfORt6hRQKq5qJo9JX87Jq7C/n?=
 =?us-ascii?Q?voTm2q99Cq+mvN9Vb3AcPu2rsHTgtNL6z6e7AnCrlBw7rSkkquesXNe2+wER?=
 =?us-ascii?Q?4KdVaRrfa7Tb5I2WejZ/6rnLWa1041+uanZyLGdlb90bRYQp/mOsnrKyrAER?=
 =?us-ascii?Q?uD16ZWdes+6VpmKj6bylQB2EH7PvHZPjhX+enhb0IPObW1v/an/IbbGqLY/o?=
 =?us-ascii?Q?qdQ19coEK34EWPgpzEUh26fBUxJF06IwRXdiuNDa7bHfr0Cn4F1+Bnh5MJH8?=
 =?us-ascii?Q?3gVX8akpHuefgQdPjwcdE2bre+43d66xpD5Xbe+MxxeQmtfGYMldV3Upf1nQ?=
 =?us-ascii?Q?5enbxRzRIRnvffN4G8Haj5pDXBRxB/RjqnuBBWQ+8A1Z1F6UdvlgPXNsvBg+?=
 =?us-ascii?Q?f8hitoB3vPnCvFxPmmghWgS20d/Fq3ELxapW/MQVzxu6mas6DJMJ7TIHLS8I?=
 =?us-ascii?Q?6oHd19C3tHYaxPg1oKgOLghcm+7Aqkfht+1aK9LHeIBHK0wbG7RfD1eyiu7N?=
 =?us-ascii?Q?XRPeKdyCOZ8tx3jysR9zBQqGXtOBzGa0iSiHDitxMCGPNsdQ2N8r6biqn0wI?=
 =?us-ascii?Q?tWP/1QVjQm/aSh8Ewoe0CYUm1DYl2UjI1afyAxrmNyyBJHwdY75GnbyNS4ZH?=
 =?us-ascii?Q?cFa9NAue7XIomcgLhPAtQ/V4UkxwItatypST+5UD3wCIlUQCkOuRcwDHeDy9?=
 =?us-ascii?Q?EpE0GXt/nSXEIkBt8XhWEKRuNuHQEQ5ktMhi86zD6t4v+WSEITbsbJhR5Waa?=
 =?us-ascii?Q?EUYXliDekbNnoUhVF9wyvnvyOQnfb4F3LY2ef6yo4FMqlrDFXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dCXn6UP36fkc73gMsIXKEoBra3gsl1zzl9OtM2W0qlEaqPIKhpB9DATduRYA?=
 =?us-ascii?Q?GjLnMjtvXDa3JTTp4RGFGI+t8R5featVWNZbdO4fDrvhg78CdLdMBmzZf/1X?=
 =?us-ascii?Q?CAfGDyy2XfuBwUJwXDJ6JWRhIJcWBxXQNCCV2aQ74eTSmGOU6bwOb4konnXe?=
 =?us-ascii?Q?kPIWkosQIeViai4sehbXC7zX/qS72HNEs9klufhSBzUP6s2FP2vgkGAfLXKs?=
 =?us-ascii?Q?VnKv3VtbqSI+V838IqSZl0atrzAw+JpiEwbYgAg8ER+G4+UnDw+D14r/PD7y?=
 =?us-ascii?Q?+PiV7E09KnnTVMqdGLfL1M7OEPTaOmYPPpR3lL6c//E2QN5zlCNfkMR/IU3j?=
 =?us-ascii?Q?OSLleMA2you4JKAIR0IAVKiZO5unlxArsmSLrz7EJ0l9XddzHKBNuf7xPVBU?=
 =?us-ascii?Q?qHOrWdBSy0RoFWbULN4tvoqDRK84w5uAlB4I09tH/kWo2Que2vB4vnBE/IQF?=
 =?us-ascii?Q?dTcWEdeXGQtEr52AREr2op3+yX13XxorKOVleRTkMJbAJYsDp/F5Z5CH4Ge0?=
 =?us-ascii?Q?GGifLdu7Goj5aZoEg3kpJ0Kz1fmiceCiMRbzzo91vhrRp5WB0rmHwMTDy/4T?=
 =?us-ascii?Q?45+7er2M8FSHYJV8mrJ46ZMpk0Yimmb8MVsuOKv+JJMovQ2FI3WtiV8xqT8W?=
 =?us-ascii?Q?vVkq17JnQF2GebD1ILsd3+vlM97uV00MoYsQISVHd1J8S0El1KwG0p9DRjno?=
 =?us-ascii?Q?ovdsbeNDVNdVQeOs/wkmIrg2fKUDKlPvRRS0yTe1GJn1DQr2NuF60onAnqVF?=
 =?us-ascii?Q?KPjmlE456JyyPQ0RB8tfL+JVlIlOWgEj5KupKFnxP2epR6+rZYXGrJKF+SNV?=
 =?us-ascii?Q?62L7qayArSP30RqRP/tQkUxh3SEoItPNW4S8qQSZfaaN9Mh1oyUlyvbWXBTM?=
 =?us-ascii?Q?KabiImQe6QnpMAyaQM5FDLZuT7YuSvX0wh827E3kawLAyZBBndNRYIySDtWl?=
 =?us-ascii?Q?ZkV84tjXyl/pOhLRaNOl27OH7Q77T3Fu1rtBAH7V2XvNg/Hzy7eDPqLOtCre?=
 =?us-ascii?Q?cizn0oYqKdyP621ou9bGnJKFXemIm2sbK9gXlmGPKGScUKkIU5CVNjKJAVTP?=
 =?us-ascii?Q?o8WJ8SNkywU6VdtcNmxhry+9kpIWt8q3tsJ+8AYoClhx3eJfeyuYU11+11rO?=
 =?us-ascii?Q?9aFYlBFyLujuA/fPCq+vdenV009jgbRflWHBYhnCZAlMRCCCmJaOgLN/bxo8?=
 =?us-ascii?Q?QrD2A39YABEWoX7+5J+IZq0kETZUaA+Dxbo+NLMB6UangaZ9LCaza2CSOSjZ?=
 =?us-ascii?Q?hBQyOjZE0r93EsOqG7wZHjICpylVm4xEJxk2kzCU3WHiCrMxxbVD3N22qFrz?=
 =?us-ascii?Q?Xa4d74wA6VSzccE4mTsgvXjkLUuQHhMYjf+yue1LGD2pj6bqO3VXuDnjw0oe?=
 =?us-ascii?Q?ApM1AHWNWSJsP3C6jpqOqRuvx94ohBrKycP/B3jyTvISQAksv32p0+NOt5x2?=
 =?us-ascii?Q?kWrxX7xmZLLKuIfptzgC01b9M81BJHg7Binzo4C9kGSGA4ko8u1K4vTNjI8I?=
 =?us-ascii?Q?ABTLfS425PR9Rzz6mssShno1Es0RXpEKVdmINM048ZdMjv/svMpND4HUVh0m?=
 =?us-ascii?Q?g0qBHyfb1tkU/tdOgUDmxbW/wNcp5ICrF+/PBQ0C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efca304-57c5-4e01-3c53-08dcb1a61929
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 21:16:52.4086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDHAO2TQ3w1l6i8gl4O7XvNWqA+VTIHBJMiWOLC8egtYvBP+thM51OJjWVB6EpD9XyvSt1T/+gcm6X2Pn+VAS+tny4oATRpWmEAfhH7T9ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7492
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Wednesday, July 31, 2024 8:08 AM
To: igt-dev@lists.freedesktop.org
Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1 <kuna=
l1.joshi@intel.com>; Manna, Animesh <animesh.manna@intel.com>; B, Jeevan <j=
eevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_vrr: Fix typo in igt_describe
>=20
> fix typo in igt describe.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_vrr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 9ddb56cbc..d5df99149 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1077,7 +1077,7 @@ igt_main_args("drs:", long_opts, help_str, opt_hand=
ler, &data)
>  		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>  			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIR=
TUAL_RR);
> =20
> -		igt_describe("Test to validate the the content rate exactly match with=
 the "
> +		igt_describe("Test to validate the content rate exactly match with the=
 "

Suggestion:
s/match with/matches
Though I guess at that point the change would be less a typo fix and more a=
 grammatical correction.

Regardless,
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  			     "requested rate without any frame drops.");
>  		igt_subtest_with_dynamic("cmrr") {
>  			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=3D =
20);
> --=20
> 2.25.1
>=20
>=20
