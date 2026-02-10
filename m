Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF597EE6B73
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F3210E198;
	Tue, 10 Feb 2026 04:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbQqOcDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EA010E198
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770696714; x=1802232714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RF+WtH33RDU4oeI6fDqJjmT4wadAGuYioWWeaepaRcU=;
 b=KbQqOcDs3N32+tMS9YGW7j8Y8gtSlgkBMt1JKB6RpvvH57P8XHEAeY/U
 l2H8ZFQ3J2ePV7H2RoaCLc9Hofg3c2OoSnJjeVm6g1n8/2uNOTvhlYAVw
 9KA6KGvByT5Xm2evBvbuXHsdjg9VzGdKCqhbEPkLYAIeTv3+VXyC7k39j
 mND+ZpfJM8kg4IOYus29b7HX52fO9RWG/SUCx1nPptfcLfQt4U9ns9QJK
 HTqm8PHQzISucpNOIbUypQHO4JHglOzxXxAg81Uio42TneWS+cGfwYB9J
 YZKhVuwPRgplu+qaHiwwfE9SEjAkH7YsxhHt52Dv+qPbop/d77+CTD9bt g==;
X-CSE-ConnectionGUID: ziBA0f+DTOSkXDiA5z8vAQ==
X-CSE-MsgGUID: ZrgXjxsbSLm3zUAYYtejWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59383840"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="59383840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:11:53 -0800
X-CSE-ConnectionGUID: YKIwLWUGTpSgdvtIV+QUtQ==
X-CSE-MsgGUID: PwFu53QYRqasoFowmsFMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216298188"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:11:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:11:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 20:11:52 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9OKSTi/++YGXmeVrCAenSMs5YnJa674anbI9PZuD+RpxouoJJsl4xlLOoT4srkUhsefQGJ6HtRv3asmnj29QO8cdR6go4hkAtD6Kpdl3G56rJoErWjHM7GNccUHQ5mKdqVHVpEqqgT6LB7nk1eQWv+e+v5fti14LEKPGb+o99gtxuL7YspYmZDf+Crb/XN38zWekO9EMD5IZv+9YoGkNTK3O8VcaxgEKgBdZ/aM19aRiOxV+f76wBChZPFkXXLmpw42tdkL0BijP399rHC2RK5Gy0kZEE4HYQKMksRrt0mU2p6ucp6G0/miFClWh/shs/ZiQ7cyeh2Iq7MK+zL/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a30bs4SsRBpoZpHKFnZ4UTs5To5M73k0y8/6IERvBZs=;
 b=oWxO/SorpyZokrDNj8vxm3kjq7QmgrurLDTqREmIUealAp35kSlfXIEHWqHlA4tp42qi6AYHFcRAsIQX7jX+chazH9PC9GpCZN+LkhCsHFt0q9yNVH4oPV63dn9zlDG2YMiVcaq75IJJQnyew/v2dZ/NXUv00Ic/AyIgyynV5eJckuXohBGD1f2wfy/jHS493Oyz5LggRRrurSmWloMTgdc+LVS93y7liCBWBeuNns2uu7luElrASzAVc/wvdW2aJ+KmkToKtFIEFAJagVpgWzHpFErsr6+iMFBW/bxAupFclzAo/gsXuo14vOlqC5Sp+Mr/8JseXV6hv4hp5LZm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 04:11:48 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 04:11:48 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for
 source clamping
Thread-Topic: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for
 source clamping
Thread-Index: AQHcmZ0fHilm3JjSQ0G8xluWGi/EYbV7UzFQ
Date: Tue, 10 Feb 2026 04:11:48 +0000
Message-ID: <DM4PR11MB631251F42BB8E93FB42A82F89062A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260209083148.1088533-1-pranay.samala@intel.com>
 <20260209083148.1088533-2-pranay.samala@intel.com>
In-Reply-To: <20260209083148.1088533-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA3PR11MB8045:EE_
x-ms-office365-filtering-correlation-id: 6cfbf63b-78f4-4095-7f4e-08de685a82c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lKiefo6FbbdKJnsGxr/8TZFDp/09ApaAZW0X2stPRUTEyW/ULmb0Ko5aQJO0?=
 =?us-ascii?Q?Cms80QqnuGg8TLY9qph/drqhXd1Q9d+eqjRd6Kob/tyFDZaimHhaXNng/PET?=
 =?us-ascii?Q?D4obERLCzKaEgJll051LvIIyd3wvOV/gBcLbu7+1CNbgPZUW7KVPtAYJx/pV?=
 =?us-ascii?Q?lJRLEyE2S8KVUc144jsXA8ubPeu9YLZukJPkYzVI7DLe1rmr6LjnY4CAuZPU?=
 =?us-ascii?Q?gO9KLEsODxPDYeiPIuGltabLTcuGnz/FjdZxvMqmjmqnjYtLbz1ZzjFoIEhl?=
 =?us-ascii?Q?5ct8Be788JUgq3WNPpPUfDqC/H517EBOGZe3wh3gg4F3//+FFgpcezdch/WC?=
 =?us-ascii?Q?WqdT4cAsBsoi2IkqK++PRpYlqHE/7Uvw85Kf8sSeA7kgczTgkxJQpV5JMDRY?=
 =?us-ascii?Q?8Qfj0UlwmpN63skoyzh9NWLCZdP9nq13eYQFCiuojpffYiB7X27CYhAK2jJa?=
 =?us-ascii?Q?f3E5JgYey+/35j1rBms6/w02jaD/OmJ6CM9pkmk8N/ENlZ4Xktrot7syZH+U?=
 =?us-ascii?Q?kBDSUn9SasfXbnkFX7dli/aNMtx3JV1WIMzWz0oIYWuQF5ILiW4zMrq1/kPE?=
 =?us-ascii?Q?N30YJHDzSicwM97e8AsaXsjoQNijogrkfAv3S/0wj0FdRom8JUh8ntdiDPld?=
 =?us-ascii?Q?2cXLSY/p7E+ydx5xLEjFaWH5oRtEfadBH3rkcyWi2bBQu4h6Z6ONvN8ruOe+?=
 =?us-ascii?Q?AOt0iEZ5cCMKTJFTXfSWCx/VO3/NOuUOPXM4f2XrvcK4nRiJih9IXv5Y82Id?=
 =?us-ascii?Q?TNQniCZJ5zHHNv6ChKCq/detsctMmolmwWHiXKfYY9KHSRGLTVPxNqyifCbl?=
 =?us-ascii?Q?Y3ub3/tmhxMHwbrrv8Z/nMdnMWud7kovc9g7v8TR1ZiBEHANIve2j0WEd8J9?=
 =?us-ascii?Q?Qs1iodypomAMpZOEbVnpYMogAqjG66EMTTYvRVyv9+K4UBLVSOIx2sgtDrup?=
 =?us-ascii?Q?thAuyITEYDyIXgxiy3tzEObs9XZynF82/V/GLc1OLC7mJvAUKW9U3L9GRTn5?=
 =?us-ascii?Q?d4u+vsb1xG2SbH65IR+ftZJHPqFkietMWC9lpWj4mtXVu8N3xgHzIqMLcIx2?=
 =?us-ascii?Q?Q90wEvGZEUQn1jUtqyZgsaB98omUBw7rKTarV7nlhcyvqhcbrXyKs355hmSZ?=
 =?us-ascii?Q?YEgNwGB1rWkUkvPL2/+Q3+4byKJj4q+MkxKsA45KEOTKEVVXHroFTU9oFQGd?=
 =?us-ascii?Q?Lw4SElbZLcTXtSxXW7sN83t9QMBGBy00NZWspXqQ7QBQdMFLNOr8zVeu4MJo?=
 =?us-ascii?Q?FKx6V7Fx4oga8KoKebWffvrBrxEJ8n38o0xDzj8fKmeAgL4mPBetffaSw/1s?=
 =?us-ascii?Q?KDEBkRA9EQBw9sps05iFr8S+Z5GGNKTLU6gTyY4XvzTzMKvYgvq7700625X5?=
 =?us-ascii?Q?1RVy7FrmVVa1wQzK1znQda45Uy/k2WUgnXi/gz+7ZuF2ejd/BMCHaQovdB0y?=
 =?us-ascii?Q?WhqQKd+4RbfpJ7bf6rZky2stnMkMQhwpRi7+Su+7aZqa0F/VzIxwbL/zcSzP?=
 =?us-ascii?Q?GPlRUdXOg9tWmGw+8GD6piDL94PvY7uf9RE5iDVdxDol60tbeR2303T4Y8sH?=
 =?us-ascii?Q?OmS5brlnY+RdURs0+KFNK6zgFDvvQelbnuJiDeJdPl0UgeqavSxdcOdb0W7I?=
 =?us-ascii?Q?N61go/qV8Q8kp1tV7glKuek=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bxszilkbfWkWV3L7oHh6BVMv65UkTiCEpmDVFbsX8tUG0e4rGk0mSdLiRVKc?=
 =?us-ascii?Q?KduqZlSkkNfil390vsZDT5SHO7Y9XFYl09zjGv5Pda1GuEKFZuqOpteiS0H7?=
 =?us-ascii?Q?mmKUiJDCGhXO8vvf0LwvhmCyxyS1FlznN6YQn2YP5YbpNyxmTePa+HAujitQ?=
 =?us-ascii?Q?RykjgUTrRAYGrp6rYQ2aFgjOLfde4HgCaN1vW2kFuxygd8MCTedqHRhA2jA7?=
 =?us-ascii?Q?hG46wkI7Uqfv/3WHicWHu/89KN9q13GubmSXsLGi0u5cZyMHyxRndeudl9GF?=
 =?us-ascii?Q?aXcK2tjcx3aJF4dAXft0Q8Qu1BFMHn0AnWTm1ahrLujA8qwKPcG13SdpYNa1?=
 =?us-ascii?Q?SuQLEUbGpfUJKywQhpe24/1zrkYSspySw+Y22QJfXSZAfqi2+5PwE3L54a3r?=
 =?us-ascii?Q?axb2Bp0qQjUdJuXHqdmH7tWncMrqujFOZ//j93ou/A/XGdYSBGGdH/t+aOW9?=
 =?us-ascii?Q?xFtX5ExO2pEz4TJGKycMeESBejA9FI/idCEevUsF81Vxh/axA4wUxRV2ijeP?=
 =?us-ascii?Q?I5nGQ4qjU8ESvrcf4VUH4tuIEny/6XY+XGPtIB2DtHfuw75OjTPGOqh00Tl5?=
 =?us-ascii?Q?AQk5ge5tNMWt/9sa37v2mB/c9POAhfoJKYQG8CmV76cDMUEODvKRzmfSNecD?=
 =?us-ascii?Q?vsF3ef80RxKgaLSyVzrjlfzUoauaLot8A9ZJkslzLVArtLSzRMeFsfTyL9Ic?=
 =?us-ascii?Q?T2tDhpVLvkJ1D/kR3y0swx3Udoq855nydPKw+EmC3ORUHtPsnflmzV7tx65R?=
 =?us-ascii?Q?rhR6r7Jp9ijZpfTls2IwWkwQxkY1joadmR9flwcotLbt3oXkn+2P4OS+QCP+?=
 =?us-ascii?Q?opXu5w99axBQCJWPBmtv3w0L1wE4TTP1IR9ej1VWm2Ooi/rD+0hGIA3lGzG2?=
 =?us-ascii?Q?/7yVbeWZV2zCxsZFpGZnD/CxCrIMZPZF9AZHoP9hsp86ybiTgYXNjn64ccap?=
 =?us-ascii?Q?4UyEWjiD6Lv4YUoT71zF8NDCw7T8qo8csiERRH3LrVd+oQqG8aDX5fDz9vgJ?=
 =?us-ascii?Q?apD/g8CFDZXCx3UYNPq8g5Zl5+JHxOWDX/ivThM5hRBb3FA00CE9IdgAKx7a?=
 =?us-ascii?Q?/XONSlCH3b8DKVPs+UJnxThs2V8KamrDveejaroooM03jE8kEDntDDcQMTD2?=
 =?us-ascii?Q?puT9AXyC5GQT40p5ZwWkIoOTvNYzCkt2JIAj8B4KLcwxCaYiHjkjlOi8C7fm?=
 =?us-ascii?Q?6H0htqfrP1lFmV34O91UFGTO6Bd9EHYu0I2P81EHzt9zOiwTAdlppL2krrNd?=
 =?us-ascii?Q?CX6nFybiq920/9Wt9qASENteRTo1ZxiM40OlEfOjbEZy/dbnytXrkdsl+mJS?=
 =?us-ascii?Q?DYKqnuIYs6DKdL8EWKXVMnC3Y0z5B5DdxdPQmAUS0N1JP2scUAwr6elHrLjg?=
 =?us-ascii?Q?e12Khe0tm1OM3p2a+deeEMrFi+Vfx6u+ZBNqvg9DF3ECGGH0CMOaEXuIc2U8?=
 =?us-ascii?Q?r5+Osy8GxHuRIJA3ybKyeiVA6JAbRBMvcbFudCxIW9ORxOCF5ZwKzFqpj4mX?=
 =?us-ascii?Q?VHPGr0MIe+OgSvGeSjbYt4uGGjyBt8vuI0Sr1y6uG56SoqZAGp/XUlkTtpXu?=
 =?us-ascii?Q?LgxLvqYOYDlkkhzD9afIUosTBcLrka9k/L9R2eiCHZFyMH1WHcjafndfRSA3?=
 =?us-ascii?Q?bDflXAO71W+IWjeyDyrv/qlb41fdfW+q2l4Q/+BIPEsohxjGSFL2PAgicM6Q?=
 =?us-ascii?Q?/b4DTwhwiAam3OpOR+JoTuA9fzeeddfvXF92hhtC7Z3KmP/W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfbf63b-78f4-4095-7f4e-08de685a82c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 04:11:48.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ttQylfdAauPP8KWYjYUP5w+gSLR0pa7O7U5Dpzht19B7D75loLEMMXw3Zm54M5oWACBteQexm1ioZLny06o/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Monday, February 9, 2026 2:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for sour=
ce
> clamping
>=20
> Avoid running source clamping tests on cursor plane, which do not support
> clamping.
>=20
> v4: Add a short comment (Jeevan)
Please make this v2: no v4.=20
With this change Patch LGT.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_plane.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index
> 2be10f032..22c45ae5e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum
> pipe pipe,
>  	bool result =3D true;
>  	bool found =3D false;
>=20
> -	/*
> -	 * No clamping test for cursor plane
> -	 */
> -	if (data->crop !=3D 0 && plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -		igt_skip("Clamping is invalid for the cursor plane.\n");
> -
>  	for (int i =3D 0; i < plane->format_mod_count; i++) {
>  		if (data->mod =3D=3D plane->modifiers[i]) {
>  			found =3D true;
> @@ -1288,6 +1282,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	for_each_plane_on_pipe(&data->display, pipe, plane) {
>  		if (skip_plane(data, plane))
>  			continue;
> +		/* Cursor planes do not support cropping, skip generating
> subtest on cursor plane */
> +		if (data->crop !=3D 0 && plane->type =3D=3D
> DRM_PLANE_TYPE_CURSOR)
> +			continue;
> +
>  		igt_dynamic_f("pipe-%s-plane-%u",
> kmstest_pipe_name(pipe), plane->index)
>  			test_format_plane(data, pipe, output, plane,
> &primary_fb);
>  	}
> --
> 2.34.1

