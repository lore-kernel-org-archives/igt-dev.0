Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36758C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 09:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E180F10E24A;
	Tue,  8 Apr 2025 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhUYmihA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC3710E24A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744104789; x=1775640789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SCcYKsq3pkKylv+QBCNOxpFF7BuHJA/llEAAA0w9AjQ=;
 b=nhUYmihARHHLdEXK7LKi0d/6Z0YDa0WJzVBuRKj7drQsO17ZU/ja7NFa
 KPi1oINVuQP84Mpc5aHAY8ugx7/p2XwfGeES6e+W94oWh/6zpO3YyS84Q
 NjgwFe9qudv4Ak4m3DbOZvZiMYKVLylqCC1obCbpGvs8OtYTNxJBv1YXx
 3sTNlVftmhdtORXOs9Nk+KC+x+Yrbk5epvGJmNKUdyiIvp08scFisCqX9
 g7qyz7fdA7PUbeV9XZslMWlZjPa59RnD26XWDAQmhaNkiJCJcg58r/x5e
 WjKhnkoBw7LpdsjKayrZxbL4Qyvx5ihLLsOZQvXNuwLHneGrhi1oqbVmW Q==;
X-CSE-ConnectionGUID: h5/wg2iOQI+V53g82iB4iQ==
X-CSE-MsgGUID: sTNXzlPeSHCB8jACpdtuVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56506396"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="56506396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:33:09 -0700
X-CSE-ConnectionGUID: xxTX1KCnS62ZVZPm+oqa6g==
X-CSE-MsgGUID: 9AyDletsTiOWH/wI/v+Nng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="159206159"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:32:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 02:32:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 02:32:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 02:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGLyVO/roJT48OnDOAfrA+kjKmvlPJtCjxFR2qgom77H21pktuYlZ8+duT41BOcduR9HC+ftfI7QcWt+J4d7iHRe0Gecwiv+snNt8zgHArVTzstB+6awgjun7O3IcwAtb1ayrmD+zq+L0A+DtYmMyg2ym4uV6bEo5f5W0nnZWAQCXIwV9l6/vBzfMsfqoG3Uxb6yX+R7Nn5YNr02myg9B7zz/vwP/62Zgc5A7dji9GOWgBUgN6KJALAVMA7mQEAEPl79/38SV/QcuUwWUL1OoWgUcp7pdTxVSJgfrhcr0HkEXr8pBGXIJpP2GMt7DGIxesvR9zQn2hs55HJ9jWOOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tovIBupbhGaxgBioSdlrwUsGfskbZZLKB2L62+isog=;
 b=pbGqXOhGLoHcVuCIwLWyZSDq8sVw9tHFreEbhg/iqZT3gKyVfs6drxtzfqPj4jC3hs/C+ME1IwSrt87h5roTnILPdp77FsT1gWTPbfiYrictWvWg2npkLp9ClBtSF4W4z+qK1AEpvnxyUNgWtb4SXdMDsVdYnoGNzkW62UgvdKzlKwbvhN7J/Xtjvsdnp03z8bnTG5e3zgkv8dO1/v4NBnVPwKi79lQwI21Y0WfyiO1EnuDuNlcBZkPVkaQzyeQ+nbx6kC6NR0hbk9mVSG5lyx4nMRFrbjQlj/ycrLUHaT59pYDA6AUDdpLPwN+T+/q/7juy1z7oc7FYFVEnUXNwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.46; Tue, 8 Apr 2025 09:32:02 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:32:02 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Index: AQHbqD+T4awS/th7xk+fnKU62tV2XbOZaDzw
Date: Tue, 8 Apr 2025 09:32:02 +0000
Message-ID: <DS0PR11MB7264E40F7523F5BF0023A786D9B52@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250408041848.2264963-1-sobin.thomas@intel.com>
 <20250408041848.2264963-2-sobin.thomas@intel.com>
In-Reply-To: <20250408041848.2264963-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DS0PR11MB7213:EE_
x-ms-office365-filtering-correlation-id: ba7bc9c5-3d47-4f41-b1e7-08dd76803821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?rqyx966ZOgb3F08/PNVj4tgzP8EGwVTTV5yCl6zfgqUXQmZaqXe+kTqNci?=
 =?iso-8859-2?Q?Zs6UPGm9cl7Vj9xxgPYDoy/wEzi1k49xWS4VfVbHY9ZWq87BVRSHjzJiux?=
 =?iso-8859-2?Q?FD+Qtcd3Salzs/PpD6SthnOHTvsOvoXkyhwVGqbl5nJgohjFytIqES9s44?=
 =?iso-8859-2?Q?EPUx06Tmq5PvPgALX3WQFndgEnXRnYsdAt8/0y9URzuRmuGaMC+ph80gjC?=
 =?iso-8859-2?Q?W5dQoWr7QR5u4/bYDeUIPRuKUV7VsWhNLdIgbysdMyoiaqa4efZXgybiAI?=
 =?iso-8859-2?Q?0kAJXGWDJiXw2aw5mUmUpudGvLTtn+/8dR9IoslSAuQCmORFE5bHRhONb5?=
 =?iso-8859-2?Q?Knxb1mukzJxGIQFKg4v2r1GqBb0vZtt9U0KZ+0SEwwtzg44O7YHYrovRu5?=
 =?iso-8859-2?Q?TjLogD9dmZ8QUhzkLYWjAucq0MaGiuVOJC38TQ0aNDsywAPM9h2GOW0zoO?=
 =?iso-8859-2?Q?NOQNVYwfTi9KS/gbxMnTerUYzvn++YEBH0rXz7FbGUNW47fLyA5wHtIvWX?=
 =?iso-8859-2?Q?TXqEQpRFLfbZjeFnKVLCUqoOHYh5EEH2Nk6unVtAnuanBWnidywRHGiVPm?=
 =?iso-8859-2?Q?8TBhPOcsGQQE9MWoi0t6AE2IbuHJ60UFdL3ilOyos7+EvxBIKqY5OFP1iV?=
 =?iso-8859-2?Q?FU799YM5UNtT/MjMJRt80qRZoPIuDgyLJH1RBzZzNFvHWcYVHT75p9YuNg?=
 =?iso-8859-2?Q?ujvWjqPrSZB6ka2uCWMCORm24HBNPe2aKsLeoRZYt4gCZdLMbVK7yT2nkJ?=
 =?iso-8859-2?Q?oqS4e4OK0tmy03CEnXTjKQu9ltIxP4QdPRYObZfSHqDVAz+cW78yt50wbV?=
 =?iso-8859-2?Q?D+AvXPB41ZH/HKZCxUU0HlIZVbnvFGYg9UpEqbd/LKyDAnR+VGvXNs0yE1?=
 =?iso-8859-2?Q?ZTtA9Oh6tuThQz/zd4h076AcUGXn7IPB0vnWRUK0HT8gf05sFfhScZNAD7?=
 =?iso-8859-2?Q?vjJXatxtA+OB5qg8wz1J7cST6ie3y0nizlRo6i0oeK5ja35Rx+gSTTm6WG?=
 =?iso-8859-2?Q?rPZYdIqKFFsKgv66RNMmBigwlwbK1qtNq+m+V/AasXavYK9iyCIj7KUViu?=
 =?iso-8859-2?Q?IJNYymFOTJvJ1PYJ/t7OxVxkbT/oE2g1IIarI/DaxgW+IqAQ3X58OcWgeO?=
 =?iso-8859-2?Q?6CSrLSO0N0k3DopFu2qJth3CkIk1HtiZSbZmyf1/s3iVajPBi7QTw3WwzA?=
 =?iso-8859-2?Q?ggfqlSOsWuMmjYLDz9AZGXqTw5GQf8lyAuE58KNCAKcx1qGHAlnPM8Fqrl?=
 =?iso-8859-2?Q?w5kZuTLczoH0oRkM1JflU59e8loV0NN8YSa0e5p212ZBwKZZ/JzmgiRIXh?=
 =?iso-8859-2?Q?8g0SocAba4yMLwv6gcxVbkIlYONpj9WSEQIwvWxaPD1iZipxQCTtHbQ/T4?=
 =?iso-8859-2?Q?I5bQeajthNivlhcA1M8h9U68iqx4asDikgBwpgZTaKWB6UHA84oue7TUOK?=
 =?iso-8859-2?Q?vRHpIea50orhSMKdRSfDDJFG/8LboQCmQv1fNpDtdSUp36qbwyRzrxwCaU?=
 =?iso-8859-2?Q?pwd60nDAus10jEhk4oAUGj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?//YORdwLHuECof0p1wTdU2XhTg6PlPRh0pC5g/BwYEXK6Rv4rQWIfGCUKh?=
 =?iso-8859-2?Q?uJWzWMC6ylUeWGGUpnD7xqGOBgi8HpwG/i6u79ONhHKMaQ8PebeKgVEk8c?=
 =?iso-8859-2?Q?YvXLx/lWiW9teKXi9ewdORYcf/Qhf2N8TBrMmBcEJZn34vCUBdCoJ3oeD7?=
 =?iso-8859-2?Q?HftKq9nCwaesqylg6RRT3gb9Urhuj2jgaThY/Y5qUvYS2HGFcjoJT74SOD?=
 =?iso-8859-2?Q?KYDVpZN5w2xJMLVq/Fp/Lppdm/PvQF9BRki0ay0iLF5mxxzoxYM67LDD9x?=
 =?iso-8859-2?Q?ZD8/4wj+y165/QXt8uMtyFBIt+whVqbpDBuVz0vvAoRp4Vw7LGLVx8NXDD?=
 =?iso-8859-2?Q?9TfAgyNTD2NQAyRGeU+mnX1u56jezjhLWbyOyaTP+7BtOXavnJJMUgGWz3?=
 =?iso-8859-2?Q?lCAjeuLQKDqA6dVo4991Cgwg6qorjF42Gt5yIs34Nxq4B749/R3gVm66qP?=
 =?iso-8859-2?Q?cOO9aytml1V1s22pKoF7ZGAcRslxEIhrLWQAKbeNVoodzWXWvnncSC1v7R?=
 =?iso-8859-2?Q?AiSPmZJc1AEhoixhJLuEHtcp7dPojzsxHtEEix9Wv8M0KSb2T18KYmejKs?=
 =?iso-8859-2?Q?98xyUVRX6fT1a1/NC3NyyJNppfMISjI5J6rZvl2OIb1mcSlJCKrEtR+cPw?=
 =?iso-8859-2?Q?VL7fL5W/ZwC5xZQpWtNVXFeA+wR2MhLWBQZ5yJuYsM9oBa1t4fK1+eP+7K?=
 =?iso-8859-2?Q?XYOWv+ZXa8xKMyWgVQ9FBQedr7aatNmRmNCeLW+oZJDYdlutfBCsijBu3f?=
 =?iso-8859-2?Q?S11zO/lT4RL4W6uvjnjC89smvYdUck6g/xdjJ8mmA8pemOEn63A913509G?=
 =?iso-8859-2?Q?JjHXHg6pd9iMNY5/lQcO0rX5bwRpQ3kcUm6EBIqaYi6WOIAFAgKVD8lMDO?=
 =?iso-8859-2?Q?TTa3ACCcqAsZi90ufj8YkSUS0j9XhdTtw4Ghvopp02poLASgeqIXeqdwnJ?=
 =?iso-8859-2?Q?HW42K5/VhSoCmlpdARbFG6QvcvIeOsfpyGrD7l15IVtinN+gXP96aJpvg7?=
 =?iso-8859-2?Q?IBuieKGEzLCCR0YgdizGDU/0dOxuXqZ8lCAOxS90Um0dxYFY7hRCTTkppG?=
 =?iso-8859-2?Q?NlHzpZ0XpOORgez9qxzOO8x6zxm/1vvqdJhtvZ2BVj1O31EmkeBA2++oot?=
 =?iso-8859-2?Q?2ckhp7tRyJeL9Pvga8LAmMlz/N7aMpALRof1TInDFiEJnCmwZAsQd+2w2x?=
 =?iso-8859-2?Q?qdShIxO0BsA1zGFySujUaI6LDmg/onc3pSQGLdc3DXEjAGNBcv18zeSMz8?=
 =?iso-8859-2?Q?nJnTiim/MwWFNzOGZWvU41Tw7vLla3wqu1cQETIOC0ZWQ03utCgPBkzJ7+?=
 =?iso-8859-2?Q?eXnwou1Sq/YpJTTeXHbrpmcBCh226GHMa6FIQdfgar0L1FoRaxc4lUUuW4?=
 =?iso-8859-2?Q?bqvoy6sx/3ouuN9G2gNDksYB0slv0Q7d6RI6aUyMTtXY+gu7Z6aTUzPa+o?=
 =?iso-8859-2?Q?wPoJWsYxcHOGXpDtvNOqQVTnpGXXXQ+oVu88s+VUx8CdEYY4E7DMZHWHA9?=
 =?iso-8859-2?Q?bemqBtMdoGGtXaCbOOcIBKPpX0OKs7NTTKYx3vuNV/w6iB4mvxW9rvX2Yw?=
 =?iso-8859-2?Q?6TbPTp1zQRKKFSnGpz8dG7dXzQ80EFNUPbLgaJRMFAGK8VkxpnsQu6+g2y?=
 =?iso-8859-2?Q?aD6/5jzzpxLJ3ukEF5dCvR8dnfy/TXAbRU41Ey5fdK7woxvgA+ZHifQw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7bc9c5-3d47-4f41-b1e7-08dd76803821
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 09:32:02.6006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjeAMcZNHAmHoLTtj+kN02dJSXPDiCkj8vyRErbSxtYszUevT2qT/TLjPx9qFBzjh2748yQh6HhjagQo7MuzxoPd889Ca5SPf6eaouvJm5szJRX3HAVfR6pU2pxt7wop
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
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

Hi Sobin,

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Tuesday, April 8, 2025 6:19 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid st=
ring
> test for engine sysfs properties

Please remember to add version number to patch subject.

>=20
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
>=20
> v4: Added subtests to test large (4k) random strings (kamil).
> Replaced igt macro.
>=20
> v3: Fixed the test logic. Fixed the tabs
>=20
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
>=20
> v1: Initial changes for checking error string.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 98
> ++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 4fc764f82..285689778 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -15,6 +15,16 @@
>   *		unrepresentable intervals.
>   * Test category: negative test
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		invalid string values.
> + * Test category: negative test
> + *
> + * SUBTEST: %s-invalid-large-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		large invalid strings (4k).
> + * Test category: negative test
> + *
>   * SUBTEST: %s-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for
>   *		min max values.
> @@ -39,6 +49,46 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>=20
> +#define STR_LENGTH 4096
> +
> +/*
> + * generate_random_string function is supposed to generate random
> + * string with more bias on alphabets than numeric this function
> + * provides random string based on the output of rand() and can
> + * sometime provide same class of characters if the output of
> + * rand() is same.
> + */

Nitpick: this documentation could be improved. I propose:

/**
 * generate_random_string:
 * @str: pointer to string buffer
 * @length: length of string to generate, excluding null termination
 *
 * Generates random string that will always contain non-numerical character=
s.
 */

> +static void generate_random_string(char *str, size_t length)
> +{
> +	int type =3D 0;
> +	int digit_count =3D 0;
> +	int max_digits =3D length / 4;
> +
> +	for (size_t i =3D 0; i < length; i++) {
> +		if (digit_count >=3D max_digts)

digit_count > max_digits will never happen, but >=3D comparison will still =
work.

There is a typo as well, it should be `max_digits` instead of `max_digts`.
This causes build to fail.

> +			type =3D rand() % 2;
> +		else
> +			type =3D rand() % 3;
> +
> +		switch (type) {
> +		case 0:
> +			str[i] =3D 'A' + (rand() % 26);
> +			break;
> +		case 1:
> +			str[i] =3D 'a' + (rand() % 26);
> +			break;
> +		case 2:
> +			str[i] =3D '0' + (rand() % 10);
> +			digit_count++;
> +			break;
> +		default:
> +			str[i] =3D '_';
> +			break;
> +		}
> +	}
> +	str[length] =3D '\0';
> +}
> +
>  static void test_invalid(int xe, int engine, const char **property,
>  			 uint16_t class, int gt)
>  {
> @@ -121,6 +171,52 @@ static void test_min_max(int xe, int engine, const
> char **property,
>  	igt_assert_eq(set, default_max);
>  }
>=20
> +static void test_invalid_string(int xe, int engine, const char **propert=
y,
> +				 uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	static const char invalid_input[] =3D "999abc";
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +			      invalid_input), 0);
> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +static void test_invalid_large_string(int xe, int engine, const char **p=
roperty,
> +				       uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	char *random_str;
> +
> +	random_str =3D (char *)calloc(STR_LENGTH, sizeof(char));

You can use malloc instead of calloc here, as we will fully overwrite the b=
uffer
anyway.

Also, one very important note - you're allocating buffer of size STR_LENGTH=
,
but the generate_random_string function modifies random_str[STR_LENGTH] and
that is a buffer overflow. You need to allocate STR_LENGTH + 1 to accommoda=
te
the null terminator. This needs to be fixed.

> +	igt_assert_f(random_str, "Memory allocation failed\n");
> +
> +	generate_random_string(random_str, STR_LENGTH);
> +	igt_debug("Generated random string: %.10s...\n", random_str);
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +				random_str), 0);

Please align this line.

With issues fixed,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +	free(random_str);
> +}
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -129,6 +225,8 @@ igt_main
>  		void (*fn)(int, int, const char **, uint16_t, int);
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
> +		{ "invalid-string", test_invalid_string },
> +		{ "invalid-large-string", test_invalid_large_string },
>  		{ "min-max", test_min_max },
>  		{ }
>  	};
> --
> 2.34.1

