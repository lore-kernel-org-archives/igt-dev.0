Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFF6C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54610E258;
	Mon, 15 Jul 2024 04:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ3PUza9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A852810E259
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721018908; x=1752554908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ZD2W/vEkP5bQR/kb/Q7NxYPzde0Cdw/rKbyUsdJVRg=;
 b=BQ3PUza9jWy3gojVnkvLPaeG8hx0fO3dWeopnLXqFNdLDu3SFDmVCSdT
 EwrnvmwqB+wZ7s7C+6SMZRmQFJ0+0HHZlu7gGbBmYGfNnRU6BiztpNHSU
 fWJCwnYSeKJr2vtJvGSEyTAOMkvd4YA4chzlHpjiFo2he1qQsrWGHwKsH
 E6GGGN5doJzvXBWKeKC+2C7Rla7RyDRc2XnnE3WCGjLO797cUwgoD0hCe
 9KHow3o1og81U7z+Yv/fjW0uED+mOQcoc1MjLlAmNPW8tC20Nf57vdEF4
 90HLSERXzGX/jAWKHJMyPmDXvoHe+R67289K7Yv1Ehdckoxy5O6xj9evj Q==;
X-CSE-ConnectionGUID: tQ8EOM+QTrmbP7NQQR9pzQ==
X-CSE-MsgGUID: tK1f5fRGSyq7RdvgmsdVYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18192174"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="18192174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:48:28 -0700
X-CSE-ConnectionGUID: myxPw/D8RmynwfdOWp0/4Q==
X-CSE-MsgGUID: 6oE61X7JRjm0MemqlxHsCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="54668997"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:48:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:48:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:48:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:48:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BN6wZCZpCPiTaisKh12WoE05UkXiebvLGgk/TB1CF+2lfSGAv6QNijJU+IXQroW6BO6thAzOWoQBYEgqpXS/gZAO0tFcqpa6nW0pgNQCNAeamSytmnENXnh2xt5WKSLPJCESfycarMLU+jNTtQprw7ShQQ8LLKk8Aa9hy61KFkL0lPcv5jeZcRiiXM6o1L3utMQ+r4es9NJ3zWiRw0IANZBQY7TsI4Y8X4qTvx3sqPRTMjToweEc9mOfAGcJXmm9oRI1KM6zEHd7ixTRU/xf6ny3ThMcTd5QNSzSz20Q5sNr0BQNs422vMGS2KhhixJ+ckyQlvzuJ8AJZ791w6Vz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFN9f/FA6I2eoKkCfavQ8Kl+MPpmUkG78JipRkv360g=;
 b=l/Q2WX6arDg0kgNE1HILcC/j8QmrIDthoRKAf9N/phAy6CNw6iht5YUVHPW+3d3CkAEb8hvCQiIzheFgbToSzNDYL/UqfKeLSTt+mLOny1iHqC+D/80q5a7ZpKivzxhg67sSrWE1PNryTlB/6+gMWGSqy5XvzQCRJcqGORBGXoI/SQ86VhfcBei1c6y65nsllLMlL5Cl9Fkwlj/gm5YR6wB910fzbSdKd0tfgI178lKpeBXOtN0BBsxivX2B55G7gn8I08F2XnxqvE9oO44ySMMv8e+oPiU7RmCbvGliw4qeAqaWRniXNrVx87alHDMRRfkgKu9vz2Cb49iE7Oxo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 04:48:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 04:48:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Index: AQHa1PV3YSM99yBbjUCh4W98zqXxnLH3OjMA
Date: Mon, 15 Jul 2024 04:48:23 +0000
Message-ID: <DM4PR11MB63125E5C29432B41FF08FA6490A12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
 <20240713072646.551590-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240713072646.551590-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7092:EE_
x-ms-office365-filtering-correlation-id: f459c351-80e8-4182-78a6-08dca4895bdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mYjNuQkKpRw4AUuXGITYV6t/aygUbc5sYbCBlye0003BfZS6IZehjtoMIBPq?=
 =?us-ascii?Q?skWHPM/Ukc1ZK7J+0ZJz47SbWELdX/WuNtPtRemb/ODik/ktlilhTG2DFd+/?=
 =?us-ascii?Q?IFo+pW+bECJysBB+Ac0+dIkzr1ODQQOYZxYURNwyTpvWcWNgQJAotJ9Os2wG?=
 =?us-ascii?Q?JSuFdeVVPQMDDdKLbbNpIbGwa/qkLWeW7L5gc+tAsUOgixZSyQZG9tzAFsbw?=
 =?us-ascii?Q?UV4K/ymhvrm0cjBPYAeN6yMczUd1PQYJHaV2j6xui+SykVkXtgc7axgIasTh?=
 =?us-ascii?Q?3jSr82AYIQlioNiDOZA4DlAGd9gK1ABUYe90ZJNLLK3NQ6nN8vIb6e615IXp?=
 =?us-ascii?Q?yBFXL7TWl2utcze//ti0LpaphCGQoVW3w4NPk/vO2SzA/I+mt8TexjNbwUWI?=
 =?us-ascii?Q?JDEq3o5wcmKlYwKkWsSLIuUbL397B4zpCuTawg4mwRcYidhNFHch6u808Wvu?=
 =?us-ascii?Q?tHf5Kh9R04+TrRfYfLvqKcaC6xr5MgT+dOAV8WVxfapHHo1eNY7hZklvggtk?=
 =?us-ascii?Q?5ZSlcWcMsRig0IgAbqaYNIdyBXcGv1s23cz+8faGop/ZHH3dN7h/rMJqOQFK?=
 =?us-ascii?Q?lOQ/0gb5ygrOJjsoPuvpChVgEWHqrzEVX5hBjSncKeXqnYF1pBamKbzF41Mw?=
 =?us-ascii?Q?NLlYncjcwhotrdUTQXuSfw73Ut3W8VgcMS1NdV0PYlk9ox6Q/ABYMViiDXQ8?=
 =?us-ascii?Q?86Fnyeom0EFx1WaYrqjuH8nSjEq8CXnRwhtkCNX467x3b54P5XFzf9FdvNmv?=
 =?us-ascii?Q?4XoDNw2Rkdwz4Ip1GUt9+upwYIf1u7pylfwADPU6TOHsZLl6PrpDELCykqjK?=
 =?us-ascii?Q?qeobibywtJUH+ZfVU9Vy9kh0gxgoWGM439wv6MrX3pjkAqSuh8ax1waaGtoa?=
 =?us-ascii?Q?g3IXRoMcBgfa/fDQXVNMSm/qgW/qLXRkvJ/iaPC8TRY0EEum4do8PbLd7Kip?=
 =?us-ascii?Q?oI2OR8GlabEzQUyaGUDRUUfCjeX0w4cScGANpOmfWK2TvjrMeVmWHSkwshTr?=
 =?us-ascii?Q?6xFOyeteniP5osPlLCl3VV+VSBHSaiDNhIx9IoCGebFCiBKdf4BFLF67xiqj?=
 =?us-ascii?Q?Mk9GfE7CE9FUoeImgLbiU42oQOsPU/tsDZS7nJhVWXZdnh/gYJC08Uw8jSlm?=
 =?us-ascii?Q?vUerPa0iLmeuZ5S87Dc7HAXhIEoA9xXTb342TgeCTDtrRk6KYmc243A/Vl7m?=
 =?us-ascii?Q?PEreKAU0OmPker/cPoY5ecJCzoTtJTPBOWUCa3uqI/Py5UcbfLJzyjsVuHMw?=
 =?us-ascii?Q?1/jgd1ryFeIYOHDVQYVvn9FhJEH7BAXGOSBKTKPeqmOGbHCFjYt/NNt+nVuJ?=
 =?us-ascii?Q?Qg5bTGmIyXvHrrILhc4OwodPjmZ9YzJraLNtyPxLANuOqaM12StM3QptaIEB?=
 =?us-ascii?Q?TGBUpYoYIvtiozgfy4FL3w4A+lQleFbApq3omc+2PuT1xzDZXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F7OzRjoftUovu5wCR4KjF1qT91ZGcqyXGClkMwNtBm6ChK8WoNFNq2FxDGwh?=
 =?us-ascii?Q?KFGCa8ahY6gBR+++3Wa7jPWC5fAVFFRGOBrlkYY7ZyoU8nTHlskuFU2XqNTi?=
 =?us-ascii?Q?l1FUETfj6ix9ykbwiJSH34veReKQNAJ6X3kapB41VXnSR+rKCo7woCOPGYnm?=
 =?us-ascii?Q?PbvZIIzpH+O9je2wFbp79W5mufQyVYca8s63w5FIK66P/5ELzQRnmuncwpQo?=
 =?us-ascii?Q?NECh4Kkxii4h8kW8YiiUsKi7Pu4+pXnfza0ULVUJw/OumPw01OaP5Azm+Fqg?=
 =?us-ascii?Q?QYT0f0/SCeXLhJ5C/sh1XdK6UmnS/JdsU85mihal1VfXiHza55a3bloQwGjX?=
 =?us-ascii?Q?3aNbHB3rl5cui2Zqy9R4LuW1lIMlZtPu7drpB2oH90tB1GbWSoWcxNnRkgTQ?=
 =?us-ascii?Q?v3cStquswa3HP2vfaxQWWoVVf1eg5BE82BbUtvplAdoQDrdR5WOpGwl0uY3H?=
 =?us-ascii?Q?EJlSJQNbmofNDigyib3B4sgutXEu+VzM88M5oSd/y+NU+yHx/0LD+zCsD2yi?=
 =?us-ascii?Q?CF+7z0ysRQ3lrKIC+XyvMUMP1gvHELdZ2GMuwMxHPk7kQwvMp5mRdHzfLdhM?=
 =?us-ascii?Q?F004/rnrk9chvg6YMpz315LjgGKGvDa9fMlx99MGmS31q2/ib7o9ZzXCCbs4?=
 =?us-ascii?Q?CiIdjbUjTaq2/hTlXLCLgl0uQpB6if4kuRXSwZe1OLg+4HyEK+ClqXvTNU3z?=
 =?us-ascii?Q?6pZ/Ivg4vvaIMftjJLqU7p08YX8qYDTFsMfb97zbAP1ySPh22GFAVDtWdvBD?=
 =?us-ascii?Q?wgZsUIWYN8Q5jRL03JTU01JqoZElQlCt2huh1mKPIzx7Mty4dEdtqd7lLjbQ?=
 =?us-ascii?Q?/1nii7duCFtkyXXSA7aZFe54rnk0NFSf83ziFakiDZ4H/VC1df+estSBnOcz?=
 =?us-ascii?Q?no/qqW6KBINiM3283Murfl5RDnuaZOcsx9EdbqXWWTXINvvHZhyl+miJfp9Z?=
 =?us-ascii?Q?N2HziI1iif5NR/k8o1z5PT1vN7Fr/oAa+w7BK1ztKBMbWg8l+/xYppIv/GEm?=
 =?us-ascii?Q?p44fTm4ity8UfY9g4CAY+GApEyzoAdThrll+9GG5EC/Y+k6e7XziE0owdBS3?=
 =?us-ascii?Q?8+gr4JeEFyofpJgAN5HJ0VDVWAMa55Nvi8fWcRFEiMage3nRN4GS01liZhXM?=
 =?us-ascii?Q?zyt30q/CbwXH/mza/i9p/nToapmmCIiQaFE0ohzKRwxWfXX8rFUROUDmnJ7q?=
 =?us-ascii?Q?Z6BjS7YDPVX9wNcvozMJw6R186+44bE3iPwIp9e9ZZMKhsf5XnD2wh/b7V5h?=
 =?us-ascii?Q?M2H1sEPFnEvg0bwBfNC3gYuxKvOKPHmBSj5eI9cIz11htfCVTb5nYsmi9wuR?=
 =?us-ascii?Q?fyCurXwLb6bzuxWQN9lRSJ+1CmCwQbFN+IrG/+HMkVWdfU+GuhhIq9ECWi8i?=
 =?us-ascii?Q?yBFCTsASfmpPeXM3adrzxK1wk1vtXzL9g/76u+AmxwpHm9/PVXphg32y9Txc?=
 =?us-ascii?Q?f/xXTm4Z510tdrK0rimKh+R9ZKtNEYKrMaadiLUXeTCSXGEmAxhno/zunzC3?=
 =?us-ascii?Q?8jmGKbazawgCu2NLiubgdOGN3SpTt7ofnENwyJAV0v7PHaWAfF39ARzpELgw?=
 =?us-ascii?Q?2RKrh0PGZG78flvGZaU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f459c351-80e8-4182-78a6-08dca4895bdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 04:48:23.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVgWmsR67F6BLMv0wjE5+2/r9H9MzxPbzlPiEHOCa5WVJa10GRS9WwAGkpXuXxPh2/x+vh5Dw2KJ/DC9CSXz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Saturday, July 13, 2024 12:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
>=20
> Add tuned delays to check deep-pkgc pkgc10 counters
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> bca5bfa58..2155b4625 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, vb_delay, delay;
> +	time_t start =3D time(NULL), duration =3D 4, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true;
> @@ -618,6 +618,7 @@ static void test_deep_pkgc_state(data_t *data)
>  			igt_assert(igt_display_try_commit_atomic(display,
>=20
> 	DRM_MODE_ATOMIC_ALLOW_MODESET,
>  						NULL) =3D=3D 0);
> +			break;
>  		}
>  	}
>=20
> @@ -638,23 +639,26 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
> -
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Waiting for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd, data-
> >display.pipes[pipe].crtc_offset, 1);
> +	/* measure delay for half frame */
> +	delay =3D vb_delay*0.5;
> +	usleep(delay);
> +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>=20
>  	while (time(NULL) - start < duration) {
>  		flip =3D !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
> -
> -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +		/* For every 1ms polling for pkgc10 counter change till 1 frame
> time */
> +		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd))
> > pre_val,
> +				vb_delay*2, 5);
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>=20
>  	cleanup_dc3co_fbs(data);
> --
Please merge the patches into one.=20
> 2.43.0

