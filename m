Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005ADCFB44D
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B482310E213;
	Mon,  7 Oct 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0Upr1S0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1FB10E213
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728322325; x=1759858325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vskig4ufhuIQa8K4jKz81FK5MSIAYXR4t0oJ8T5bres=;
 b=m0Upr1S0W3N6xKn7yeo34/hTMSmuygQZS3GfL61q+qGnxkMV0RlTAe/9
 UWjmU+m85mQcV2PgyzpYGVnmVsN06iDmtGR0uxDSiauHvAL0qySDVhKRa
 dXA5LNeHo9O+DgVXoDvA5MYeiDycKAbUglNdka17rmBeh7AIgHGl+M06P
 okblQx7Spw2ZN/bkeRLyOAa8kQUzUMjoJZe6wIE3m3LjCgy5urllPROjs
 WRX2DhNhyKXH4DsGbapoKe5Dx4HxHZugPV7bkaxhVS4f6O5KzGmBFZhy4
 DT0GWKlqHG96wesMBRnBnSvkHxsooxOOsP/cCnI+I99YUmrwtMlGwY5Bo A==;
X-CSE-ConnectionGUID: tDx5bDXjQ0SGsBr2DYnbhw==
X-CSE-MsgGUID: aGQlgp8/SseZAkOK3h/rYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31372750"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="31372750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:32:04 -0700
X-CSE-ConnectionGUID: xG5vujT9RR6dfcyv2uOK/A==
X-CSE-MsgGUID: 5N3m4cxXQnuFyJeToQGzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="98873022"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 10:32:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 10:32:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 10:32:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 10:32:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNDAqqg7w6KQ4v1IJyPraLsqeRnEdF3nRSC4ywIpsz+LKQJqoGiiDAosbsAZZcIvSrAiFevqMaiAeWi2FiHALDlSd6Z8Wv93cM73Ook8/+WLkpqZ7iRaKnSEVOe8eLzi7VtOMuPX/e47nKvh88xGJilW/ABGM8pHKH5IBrXw7IjC65Q8+v7/Wgo6uG+8J3BkLTZL9TKzHDqw5sAXdqaXSyrjD2Wdh41Um5enrcdx9Lk0GYK6RDz/PjNo53BXYaUWsl6tSDwh4FOuH7cjKBn7PFiiq54jj4+23A3FrgX9WpTSqJMBxOEcgCqFMoRSjzNzIjU0b+FklvuAYxqddtcezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd+huXzlLOOxE+kFRvCuF4JWvIYgk0axtAntDgjYTbs=;
 b=VAIyemu+qacqZmyvH30MPN68gSuqKnGZMfZyZ0WUfm/tiBqbiYv60REmLiP13TyF+wlGUy000QOhdI2kW8gL78xQ9S4m4CBJtsP4ssjSc+2JWdjwaOgoT9Qgzwb8NRHNBqKAAQG1pP1BjrwbMVabNtohtgltn62r7dtbpC9jUeJK/SjTcken8Pf+Z5+cAN+0SGRkENMkfyjWOIW/lsdWb+s/nY/R8vOx9qzKy7VXEKR8YAwGy6+3zNnPfiC8/Ab3BqSZmj2eMTm9vOaB3HeR8tMpUU8RWnR8hSDi6dfTh8xeK+DatIYKMDCGElDulKTu9O0ESYZmc5D46MxbXoPGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 17:32:01 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 17:32:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep
 time to 50sec.
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep
 time to 50sec.
Thread-Index: AQHbGNsodNIA85Lp/0KowTyeYaxbWbJ7i8Gw
Date: Mon, 7 Oct 2024 17:32:01 +0000
Message-ID: <BL1PR11MB5445B1317311741B69A8BAB8E57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: 26726906-0974-4060-b441-08dce6f5f3ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/x8ckErFmv+wTN6n9KIncHoW7mW344rAreYhxpwewgzHNx4bx87nVe5QnitY?=
 =?us-ascii?Q?Ajrqv0quHhrXLm2w134/NsVaj8loXvedaCjBEZimJ9RcC3sQJip1+RyDnuRm?=
 =?us-ascii?Q?j3EcfoBGWsPfY5I222t8dFrob2y94qgje6kX8UKZRr6HEhTP3BWgMwhJbuCZ?=
 =?us-ascii?Q?BHPDwH9ZEmzsLWZ19KFeUvNmi3NVWRO+5+ggEbHjfRq/4v/2+GE3zoeoWqb3?=
 =?us-ascii?Q?EEMcvu9cVHfz4vO5ORMTe+BQzShcRTGdYdTHMU9yIA3LeapcoA51i1zi+KTe?=
 =?us-ascii?Q?YLCfe6m4l+nj+Tvf1afSxmXyncjiSp4el/TMfL3akSEE/PBixLuZDcO38d1E?=
 =?us-ascii?Q?eLNz0UUgWaK0XLA+TUvIIt+RwggKLBxayz3Ao6Rd1PVIwAYCeRG+SYBcU40Q?=
 =?us-ascii?Q?hTInAwQmX0iFfY9KjCYLUMEy2EF164UBe72SId85+0HepW9U7jxK5dRZBH47?=
 =?us-ascii?Q?QmwBrCBPkpd6eYW/NSyQEOa7A2T+P6Vh9DtEI4vlSKMpYmEXz/hH7pkrr73T?=
 =?us-ascii?Q?LrtzVcS2cqGKAg/yy4ulw70ptaSoxa7+QCDfSbMEztR8OPDKbXMBYdwSLLzf?=
 =?us-ascii?Q?CK+nAXbJo9Sz1K98WSORCg6uMm8Jfu7DcY31ond+8bj/ur7LZgE6qaNYVOko?=
 =?us-ascii?Q?J001eTKKZc3GaXMuMIjGhJ5CJHM6atxlVZwUZODAm613NfrNf7vtQew36KG8?=
 =?us-ascii?Q?JhQmUNnLGso2moFeRrWNuR4SRw4Glb7qm5irMUNrOWk9PTpzdzhl7Ud8FN+R?=
 =?us-ascii?Q?oq9ODC0Ae6Ac4+JUAp2IHUAZJYwJLMAxCD4zkB+9hbdqgahFuuA5BS0NBrLV?=
 =?us-ascii?Q?GrPfhBAvjiAsZRFrXCqttMTEhYO+h1uMZ5E+W71ngug9eicsXEzIHsu53R2p?=
 =?us-ascii?Q?xIQoZ6O7m8Dn3Vk1VMAy/N3oGCoQ2+WDVuVqN6tUhqfZt7MXSiqvmp+aIWl8?=
 =?us-ascii?Q?cy8SWythZBVpQKsU2FnGBwhR+n3x1i5cCWOiWHwkzI3Lq14qtieGPADBJKjl?=
 =?us-ascii?Q?cE7MewuTJ8kdV/c19dd3noOZ25OEEr3iZr63s09LuULUhtG0SeBJnWyn4rJB?=
 =?us-ascii?Q?8cUUe8YHWEtdZaUPWkkqmFbBGyxK1gPbeUN5uBiec0WJmuJoI577UX7LNCdO?=
 =?us-ascii?Q?Pb4s855CWijjZzK7AD6hTZir6XSwsNDHG9C4duDnK4bFQ8I3QxVjPxKdYViE?=
 =?us-ascii?Q?hoOBjEZHk93Mjlgh7Mu2i1dzdpDkoaEnXe50s2WD/9c67McYYFPRs+EVoeTU?=
 =?us-ascii?Q?uMjfc60INKGQ2qXpx/CN7yxz9Vob5kWzVv4sDhPxAoCO0lVglU0080RIV970?=
 =?us-ascii?Q?xQdNudt4JVujhSxTtKJRqe5qnpcmxe3NnJj4T2bKKMhvbA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jRz5D1Qf1UIEl/Md+98Amge+jodQUXWKm5nBfnONIDP2uUBd9BaEMkTQXw7R?=
 =?us-ascii?Q?jEjwdEnD2y6SB2tmdK0qDg9uPsJNEtLkZ3/RcNnU68obkv2kwJUMPJlZtf/E?=
 =?us-ascii?Q?U7T92n0Nw/A8iM0f12IJqpg1qeVbyy+lLa2POo2BgW1aJlRHTXFfBXLKdzLg?=
 =?us-ascii?Q?5od7izHO5/oSnXnup5a+EyO3iT50E+oygnBdmUZfickP5ozQQtlL9aJEXMsR?=
 =?us-ascii?Q?Rb0tDLc1S1Q0bTjNdCQNRBnILNTbZTNvq8Fxyhp6Er5adRpZZ7QuoJaG/l5n?=
 =?us-ascii?Q?9nrqYIlyLC8Pypw/iqWn7ChuaHSVq/8r/YQy62q22kvITZ3jaoLT4U3zfsDV?=
 =?us-ascii?Q?Rj0tqka5e0A+imuL/hKb+4cqJ6fbdWAfaAzgdG+mu9OrqJkTVGkUnnL6vgzS?=
 =?us-ascii?Q?j3A4mqw+r5VU4WXrypteXZTWF/n+js3rM8Dk41Bemc9pXb9RXnZ3rrvPEZIt?=
 =?us-ascii?Q?9j36PmmVAao+AWINMSYo4CnDQJ1zM1+Cir7P9ucDyNBiH+r764ulEbc95ofN?=
 =?us-ascii?Q?fUF52emlKNi6luH/tqtdwDSCeHbY92rZuQXMAE0HcuVmXmpXSCA7kcoI2Ykf?=
 =?us-ascii?Q?j+ThPO9sT7VuDxhxeiw1kAd2lEzZRiu4WwU7C5IiohXB2YD6csGO2UFjvKU7?=
 =?us-ascii?Q?ZjC4VSaVVVXI49wpepM9TJkO04NJoOeMA7JQYbS1hGtNXJPg+xiPIStqKt14?=
 =?us-ascii?Q?nZ7C1n9L/u7TadLLYny60LB8hUm7h8aR7teq5YeOB1heJYj7Z9DbMDsDp7DS?=
 =?us-ascii?Q?QjMlqCsDqxWqTHW2BVojkeR5TOKlbEV/BYXXZM1pPKjFXFZ15RrXxcPZ0SOU?=
 =?us-ascii?Q?FtPm/jN8oYUJ0wWU7AYQk91E3sMgswqPcYh51Lg0KCt1TQ2BWYsqzoviMoQ6?=
 =?us-ascii?Q?L1BGQXs4VDTnfy3/fJG7KNrqvoKtOQCZ8emnZV/K3NHHyifiHsAiQ+60XPHx?=
 =?us-ascii?Q?ZneQ2mKWtzvkN0TDQeFqkHZ1x/DCOh2NxL15lrcbXFX8NgdPZrVCgOhb1cux?=
 =?us-ascii?Q?iInUbvXOUBNwhX/g3ZsnjYSPIQy/uZyY2F8/jlcon9u8Jed4vOVYFyikM52T?=
 =?us-ascii?Q?38RNfAdHSav2cKmURD5EJKMhg3FyqQQ0W8lCpVoNCB1yfECJcptGVu/rqC5Y?=
 =?us-ascii?Q?+AGhZLaVt/rpHKpIKM+3/E6vcBOrRoJp/8u9lsF/6oNmXiJYc48QoAWLMETe?=
 =?us-ascii?Q?Hk47iOprM9tSyU0dqqROqBGDBs2LAp8mXpTMo/+lozrUfHzEQLvaoeTDTsX6?=
 =?us-ascii?Q?BzLWVTnzEABoTKf1gEDY7MmdsOQPa11oG+jzaBCmhbaV4dCWwhf0mdcYPlTb?=
 =?us-ascii?Q?Wa0riakz+L0SKT5q9Dqia2d5Re4pXvjPWyqZDV+18t7AlQSihmzsyPKyNLDG?=
 =?us-ascii?Q?LyZqd2uNQ324coQ/JNS3WPu/AfW/3OX0BzzVj+LNZjAr1zxlAlbK5aPbKw1J?=
 =?us-ascii?Q?LJizbEQBD9f/1vGY1B1JRPphnWD5tOtrvOoUNiRVVhxmjvvcJiunHNz48kPu?=
 =?us-ascii?Q?kx1yS5ptcBnxJH3F12uOrTi/tv4CbqoV7hnp4t1taqFNZVkOBKLN8PQrLgxG?=
 =?us-ascii?Q?fzOwBHIj30Wc8eBxQ+PNQVJsyDwg7wqyAuR/Ainc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26726906-0974-4060-b441-08dce6f5f3ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 17:32:01.3375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ens+MQAl139+mBPkm/N/V/TiHEhKfebKlIR1xqVn6KskdUbrH7d0ceXzGOalPLhiuz8qUBm61LUFjqsvbV/nFaKL2edK7XbO9S4TkqQU86o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal Pr=
asad Ghimiray
Sent: Monday, October 7, 2024 10:24 AM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>; Taur=
o, Riana <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com=
>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep ti=
me to 50sec.
>=20
> There may be an approximately 1-second delay between xe_exec and
> xe_sched_job_run, which could result in the usleep duration exceeding IGT
> timeouts. To address this, limit the maximum usleep time to 50 seconds
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Seems good.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm_residency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index f4d05889c..a86107eca 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -150,7 +150,7 @@ static void exec_load(int fd, struct drm_xe_engine_cl=
ass_instance *hwe, unsigned
>  		 * Execute the above workload for ~1% of the elapsed time and sleep fo=
r
>  		 * the rest of the time (~99%)
>  		 */
> -		usleep(elapsed / 10);
> +		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>  	} while (!READ_ONCE(*done));
> =20
>  	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
> --=20
> 2.34.1
>=20
>=20
