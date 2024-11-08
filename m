Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E4D5C0ED
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070010E9EB;
	Fri,  8 Nov 2024 15:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yndfjymg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C610E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731080302; x=1762616302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YTFlvducQRy3XV95rGRS+yepGb/ikSd57yh5/cGbXck=;
 b=Yndfjymg8yxfEMUI8mDi8SkAt0z1OYMU3MqO54qQH+WVKXGUX8mVS7kU
 Y6Ky/xjlzthQszS5zD7Us/g5tX4f2gTdX9KwwpvQ5k5V+kgxjqH4X8uuJ
 DkWrV3Tp6f2vvCorzgx4I4e1xSFo4+O2121HBETfg6G1TBLV/nIvt/f54
 V+mvbPIw2QDJzxXTYUcVxHp4ly5SeTkv8IztwXCbLKZkPKNQdAEDDny6d
 fWA72i5AwSPVnz2U2x3tynyJzx/sH187Sg08qjYYnADa7pHUDKR2Az8Vb
 W4m4J43YAhAx4Msxj3gYa9WnXKpU82iMSvpi4LwuZi6vQ5yaC+gl2duHr A==;
X-CSE-ConnectionGUID: 6kALz17/TLefMmJKaFjDCg==
X-CSE-MsgGUID: p8A+rwAmSfKmo6A84m46/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31195785"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31195785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:38:22 -0800
X-CSE-ConnectionGUID: F60EIOdrS6mCcHFkuAhHqA==
X-CSE-MsgGUID: Ql/tjFVBQuabRQl2AfAkWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90155115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:38:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:38:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:38:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv7PLRqFZ5oqH0FhYq7OKOhl27ezyMx5XuPCBsa8XkUMjW9mIRPAJKOTdwJ0XnGVdWToQGxJYUlqgSEgWyM1jeG8oefo9PhAdT4iquqMqk965p+F9e/UNfxp+bCXrVBDW750SmJvD/mq8hVnZbSJfs+Yc+RCaRNd43lkWfGXjmb4OcyUGOks5a62o5AIfgsI8wpUKhYMZ/DJCZhgtAZu11b3mJqdwa9iEJ2DwSQsqInJ699pXnxtbtTHD2I0ZgSS5qoUJ4BL1WqV/tvMqG1iI2AX52z6qfeldrt9rvYdIGwMOulw5wTnpHQN6eje+5bnwScs5NW3X6khUYkkOxmjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPosWDIKoXT4eCrniCE/GxHV/SIl1XkIyUWwpXI9544=;
 b=wUdRRU8qp+krJMdbrV1FC6HB6VR4eTAvxOOEDNTbfdDgdxYPzBWEcrMnoFvsebQukWcJg+aFfK+ji1Rp/QeJqaVl4+T0q0akzd4GKr/7w3tvjM9aj8OfNpBX4EjsYaoxpnEusFmHD7MxlQ7YvDQ7bhyCA+mcUdU8tXvLX7kPlIgY9DNvnR9bOrwHnUukuqA7TZk9G3ICzin4f4grC99w/1OgVmW9oKjpzioc7cPkApgskp/LGgA89TCMDEBBKmF6X4mItwe5sMGh9QE21NFqjzPtESQWkNPTiASoojrZgYX6ICtejCA5FDf9GhcEaJws6AHaJmt4/KQEbPd13gbD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 15:38:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 15:38:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Thread-Topic: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Thread-Index: AQHbMaFC7Ys0MtfR20ul9wanC5TE0rKtg17w
Date: Fri, 8 Nov 2024 15:38:17 +0000
Message-ID: <CH0PR11MB544479E1389A6F958D9B6C6DE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108054350.3484532-1-lucas.demarchi@intel.com>
In-Reply-To: <20241108054350.3484532-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6030:EE_
x-ms-office365-filtering-correlation-id: eed1737c-6e4e-4af5-a084-08dd000b5e1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BO+AdOYTV2zaVKONk8ZdNtW92lZVOl1L550CklzrjQTG9n7KQqH8ifd+kdX0?=
 =?us-ascii?Q?U+9KD9fsSQYeTdiGymp/6ETalkSuQWjgi9au7kWEAO9YnGhDdQtXn0J405aL?=
 =?us-ascii?Q?RwhuiKOtHqiYVWDKPLR3juQgVW0ZUpxR+nQqOUcYZZrV8UZSjj+pycjsP+Gb?=
 =?us-ascii?Q?RIUmpzHvOORFZ5dm+AVuSVRY2NfO0oRgJvoaqO55bkL57QgjfHHQ6Rse2bHE?=
 =?us-ascii?Q?kJtYfzln8iihnOFXwCnN6ljJppHJEozODWF7ITuXiUUOxDyyoqaZ33mbIrGi?=
 =?us-ascii?Q?4YERTAqm/vX/FVRzN7/hHeElveo2sAFd4g1D+eyr6W80hRmhZTwecd2yUdrl?=
 =?us-ascii?Q?4ksfqcS2PPsq8bc0jQ80QbcwvpRH7FSVPdthzkBKqASOSdALS05XqOQGZUpN?=
 =?us-ascii?Q?Yv4mip/F2TZonI0twVH+FlglSXOQijinsuzV/xhhwERsfxbNm2mljmtFKuQH?=
 =?us-ascii?Q?gLEHrd1IhhBNs3veVexyH5EGV9Yj4YvaTOJHDne2ZqacM6dtAKBC6HTyN+tk?=
 =?us-ascii?Q?qvugnU6GN3wJKDf/H81oG0duh12JkZLN+rBcrKMyo4/Trlq/M1wwlblpp2b3?=
 =?us-ascii?Q?fOnoBraY00Ukw49JzhCyBvkS3mb2OnfU/oNW0sZeSr6hgOeKgthmQVDsp678?=
 =?us-ascii?Q?ixuleAWzhEIJDCQFF3iBKFRSd1+k3RxHhPxiH/DecQGh0dOt4lb86vCOZlGx?=
 =?us-ascii?Q?+0stMwG3sKjcGllqcq6PEbA+Kkg8XBrR38Xuut3hiCrRJidhEUc+qEQkktIv?=
 =?us-ascii?Q?ZKPx8/AODvVYb2M/ICi9e6oDxhVd+C39fOqoS4pE9r5+Dtnc6NYXmr6Y82Op?=
 =?us-ascii?Q?SOVZp2Kevcu5RuD1vKjRSK3nk3XHFOvMQSgPOF0MucppRsDbFHi4HTIpyA7V?=
 =?us-ascii?Q?2+dAgX725UdmNzpaX4NPegKb4kDJ7R5fbX9pZY1YPW9BEeQ62C6u84tYSRLb?=
 =?us-ascii?Q?JjinWx6Qb7ynwJrbNCGuSow93RdjgPWyfqp2bZ19LQoEH7cziuRvAcGzv2Wm?=
 =?us-ascii?Q?rdH3eYfjeh17y2QRgl0+pfHMHptn8aNUaP5DMwZ90+0lwBgjd9V7HKbhLbv2?=
 =?us-ascii?Q?7r39F26+y5xjOIcuW2fpKLATnQkte4LcTyZXW1PPpLme2ehT4Zcrf/GGMBac?=
 =?us-ascii?Q?ABikQBzOjccYGEV23WzH7leXdn88HeixDatoPTHkdqWe+BaLHxOAYlfbXe3k?=
 =?us-ascii?Q?uFp9BoJ4hUarT5LTJyu3Sc7gOIh9c0rOa+e+pBktcqaLajhWUsjBMZ0CoA2J?=
 =?us-ascii?Q?8NyJNh1XxgXkN/vzQSU7lSQVeEKeTIaOi/d41iM9+G//8GQAPKeaSHaIAC92?=
 =?us-ascii?Q?lRCM3JvezMc2b3gju/9+YGbX57wxzno3lBouSjwFrbIrcA3ccQGrHZYuqyAA?=
 =?us-ascii?Q?E82ge6k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Efm/6+2viMhpA927A2ZAM2wUM+PoPzKqhFX6SOUA4RgqCLQT/+pfjzeCffZX?=
 =?us-ascii?Q?GirgmSD6Z5ekrlneY3uZsKvAVD9Mx0Iibg7ZzdXtSOWnxM6tqgTSwEM2/KDM?=
 =?us-ascii?Q?5IYJbuLFZPCq181mBkwl3RdqPRUHpu9mDAdP1qQN9/V0/iXKZ3WsNvAN+LC+?=
 =?us-ascii?Q?FDMMq39aGAPootOonXKK/p7AKVlwU3/y4yxbIqibULDJGRJory93iXFxyxwO?=
 =?us-ascii?Q?BeR3lftl9oGu6G5Gb272O/EMVaO7OkZId/uFc5uRqy1HK6gb0K7wL4V5zBHQ?=
 =?us-ascii?Q?susUwnErcQ/cERSKAFuKLt8Z7qPdYEGDwTqzq7wVbVwQ4D7bBCp1HA5rOcul?=
 =?us-ascii?Q?8ERZjsj6QwLPUxUJXkIO/6KDukKuKBVaMxt7QqroQb4YRG4VhWPetEMi8e2S?=
 =?us-ascii?Q?yPURBi+BqNEgMyibGGu3/derN7PIUaB9Dsb3igCxjs9WfPZCG4R6aPEWOEHi?=
 =?us-ascii?Q?WPNblhxrKZRKK+CwbBpbPieHJYThn0mUaO7M0lhNuDBa5dzVkpRFCEqURPKG?=
 =?us-ascii?Q?qmxKN/GU5e3rZV5z0g0xjyVtDvue+VbY/dB7Kr4Ikk7Y5rtPhZXdfcFLyKdu?=
 =?us-ascii?Q?WpmYYoFG8j1GI5B3iepnzfFgEG0OVIDC9uhCW9RYRHp1EXTNISsPq6frDHOC?=
 =?us-ascii?Q?hGFRgJxMvxJcmEtgX+CDzEqwL0yfdepTE/U6eOZUFkE+53YZ1thyatHdmiuT?=
 =?us-ascii?Q?YbuG8o2+rQpHkqP4oNiKlSpaFzK9JWd4NWhyQ1wUes9AODzRTQUJ8kSKQZrk?=
 =?us-ascii?Q?3aEiKa9X6byAuHPoj0gfXyFgpt5fVqdoqimxLmEJWT9rcbbOmY6Dd8h31dCz?=
 =?us-ascii?Q?WTz9CifBGBle0DLacM1x82fMjRVQjo9PU7Faxh55YSHZQwS0knT8KJDeJzIq?=
 =?us-ascii?Q?HqS9BgMExr+zFu5J79AA27TiAYaI8U521vVGwGAxNIezymo8u3S6KLdv930Z?=
 =?us-ascii?Q?P/Vozb7x7Aw7QWtgz9vGqixh14UmS8XLQWF1lLH0tSPs4/SGs/RJiZL06GeO?=
 =?us-ascii?Q?zwXBhIdxmzcuOXL9kHJetGrVI73VcmR5/7NWSU7VAZ4ptRJVIpy1l2rl1Y+U?=
 =?us-ascii?Q?DhQvzpFDTWK0f/cBCUK1G1FD4lgsUPWCl3ILXzjHq9xrKGA19//eF4uQzMEp?=
 =?us-ascii?Q?o0p1P/TpJlRXkxqlQxeOXl/dcv8WalPLTV6bjOne3k4J+htaffp8CBryyvlf?=
 =?us-ascii?Q?8DJGuD/pY8CoFYqgU/vrE+BD2z+mlEZT9T+wLQRZK6KgJ52BcaH7an9mWjDN?=
 =?us-ascii?Q?GAToUnABZlt8kI9dR50KjNdZurKGvnhUAOyklpWw9/I8/E0kL9qMR5qAIjyE?=
 =?us-ascii?Q?pFBenPfm08Inf3f2kyDF/53GPzFbdWIjbo0dc4VauZ/k5tUWRHietp53DTk6?=
 =?us-ascii?Q?4G7b3+IfWa74NxXXzpjT5Epq7EihkplCJ/fulPGN2KxD07CUUWiPez8fmtYd?=
 =?us-ascii?Q?QEAnreYrWFCArwhT6JfC4LYeKD082Jv7PJ5PwOSQg8yUP4d6Q0EieqeXucI/?=
 =?us-ascii?Q?PZIvrX0v4r94Tmje3q2Tkry8Fuf5J3m15+yLzThR4fvUOlX/lwP0UUtSNbiB?=
 =?us-ascii?Q?Ch57E0sU8AwmzEny3aGI9bScR16JYM2MeX0YYlbz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed1737c-6e4e-4af5-a084-08dd000b5e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 15:38:17.9688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooXKzBqaJdEJ92mBlkaiqFA0prsnVZsq1EC0jfJPDWXPVXzuRvTBGePIB/xBDZU/n0hrtugqNMI2VzvHVMwMsq4pDKVUVqbgxfvZBT9ZMeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Thursday, November 7, 2024 9:44 PM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
>=20
> This reverts commit 4f79f059766c ("tests/intel/xe_drm_fdinfo: Half the
> execution time") and goes in the opposite direction, doubling it.
> Although in some machines we pass consistently, others like LNL
> show sporadic failures.
>=20
> Even after changes in the kernel to improve it, it still shows those
> failures. Also, the failures can be much more frequent by stressing all
> the CPUs. Raise the period to reduce the error introduced due to
> additional scheduling delays. This shows a good improvement on LNL that
> doesn't fail anymore without CPU load and fails once every ~200
> iterations with 100% CPU load (vs once every ~3 iterations).
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_drm_fdinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 5fd7c0416..ef9273e2a 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -82,7 +82,7 @@ struct pceu_cycles {
>  	uint64_t total_cycles;
>  };
> =20
> -const unsigned long batch_duration_usec =3D (1 * USEC_PER_SEC) / 4;
> +const unsigned long batch_duration_usec =3D (1 * USEC_PER_SEC);
> =20
>  static const char *engine_map[] =3D {
>  	"rcs",
> --=20
> 2.47.0
>=20
>=20
