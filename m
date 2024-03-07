Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0665BC48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 10:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1B10E3E2;
	Thu,  7 Mar 2024 10:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpHnkvt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96210E3E2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709805621; x=1741341621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dtkFQDxxVrUPEs3mFWw2KNwoS+gDiUHGzgiDSPO5c/c=;
 b=jpHnkvt+44i4VDh/A3Z54HAeE1IUbTH8PIxqmTG6RYFh6L7XZQ347iAu
 pNGCyrFwUcMaKP1bk3rMPaBf6S9KE8WK+0PnrZyuwnoTuxl/NDbBWUtoO
 vW0NAO9Ts406J16o0P8NbUrFdA/2z1JO+6E+2S63heY492bgvwaAdJmNX
 Jd3v7ofvfRV4I1tpPWrhc9P7/drtHYE8Vzhbtgfi6j1FJ86GDP3Usfo2t
 albURC2Nx5lKTgiSFKsUw8OMYiQK0hiTf4ZTkINSVS7762JhbMPdjOCvy
 KnNYd2fxXkogc2rBsLbDjiKhCrYxHC326Z9q3tG4y+j8vCFVBTtFpuVb6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15903604"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="15903604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="10615163"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 02:00:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 02:00:19 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 02:00:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 02:00:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 02:00:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae/GtOkuBamjdBZtcB6iiLYRZp/95t34/9G3pRrMJMqTWQ7gWsjeRuJ4V4TVJ7SPAPFPCJuTejUZ7SdRC791zUR5f/+qt4h93E6akFya3Jw1JsHYTdDWxqLuDYigtJGF6xaavG045GKcpAIB+EDH2GhLVnxaNlEy6rBs4NTyQ07TMX2wk5P1s/R12W8zGD7CdfDDH3gKJ9v6QwxuICilM73C3jh6biLpT9oBQuFAj0Y/O6SkoEzhVAErJ8CEND1WMnWxFLnaCWXBpaSCHsa/ggCm+epYAHRTn908ocXWDJXFez/KAjx8teRXDlbsfPn+gvVfULT522qflKb5gKwWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD6e8XItkLyz6r9cc5zhT6GQdDmCGeooW70mHFFSw6w=;
 b=LYXoKyOxxe7l/tv7+Ry2zKlLD/tiA52bN1OSGgx9XxRuf43yLnSHcmtb78YKTf8MmJgO2SHmeZzWNHGyOQze1zq/nCHWj1pFRP3w9/1fPVDci3Wynvc12E2OUnrmoDAGE4Xy4w+oAW4EpY4rH5QJ3QQLxgn4VlEsVMWEJMRNL4rpLvfUE8v9+FJM/pyXkhqvRD+ECkpClDd3yZm/ZQNJF2r+q3bxtNY8qm1HrWfPs+10zRAu44pWex7ddzNcKmh9n1mdySv7Bx8B1ws420GeHoVFgGz2mVM3VUJcDXFs1fKkGtnadnzaqgNR6VCZa8TbDeBS9yCYZ4ihx9DhJLBLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SN7PR11MB8109.namprd11.prod.outlook.com (2603:10b6:806:2e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 10:00:13 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 10:00:13 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, "Argenziano, Antonio"
 <antonio.argenziano@intel.com>, Feng Qi <feng.qi@intel.com>, "Ye, Tony"
 <tony.ye@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 11/24] tests/intel: Introduce HUC subcategory
Thread-Topic: [PATCH i-g-t 11/24] tests/intel: Introduce HUC subcategory
Thread-Index: AQHabiWyffNO3kikVE6pVxx7hOpUI7EnsdMAgAReJIA=
Date: Thu, 7 Mar 2024 10:00:13 +0000
Message-ID: <IA1PR11MB6097037B9DF7D96C8AE128C086202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-12-katarzyna.piecielska@intel.com>
 <20240304161724.16c0dc97@maurocar-mobl2>
In-Reply-To: <20240304161724.16c0dc97@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SN7PR11MB8109:EE_
x-ms-office365-filtering-correlation-id: 310d986e-8277-4b06-7177-08dc3e8d6229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z81Cb4q9D5AQ9KcI0GjXNOTq13ZrDhNmJwCJnFH9/wMi7gaQAmV0Mcq4bcA4IuN27R/vgKfroFe9fSzWrcZ91ygPlmDSToGyqRJWWtydX15Z8iebE+XCdm0aV1X8IqZXIwd4AR8DtTKumv7KxelAD90NeC8xeb3xU3nT5s2ZVrGaoCmVgtEoJ5XAd7OWu0N75n9KddxchjCiF7PStwPgMDOJwnODVEPeTLQ1ljJaBWhmaH0fX9E11qY7k829Y28kEoNAgh5h3BWzCeHX6jL8q7dQGAzP7dntc2Xj4Nfvfya6VDYXUvawb08yd/ZSIcH2bWOluJ8TuVxTc9gktAJxAlWY2VR2MLOxoASazr98lcw01VO9uFBj4JkD+q2yasBSVOeAzUvz67tXbTAhYSrsBVafZGg3cTB9vjiVxNk81ZdfkulZlLWAEi2HuCRt1Y1eOgn75dToiTmp53OVU2Gjdd3OrMwmbz/6hG9caEpfI4wOLkG8o8Az3xQNFqm+zWAX3Guam2EVwn1rd03KtVUncSkBQ5rqgcrXtmRppRY83pzcBJ6yrVj3/PKEbaLm/w+UqTaxumO4HJmIg68WfxXwyovuUlSMDF32iDvp0XsdSF80nwRa8Y6yWKXDchAbaL8clazIHTLiTIY+vLa9Ly3+qcVDWO9tGDvPi+Q7/5/LgjHtY483aLFQVNq7qyx7mkDzmmCgmZhX5VSh4zQHb175IyhFEx/l3SL2x8knzytOPHg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fYg/syUx+3cbfUH2GtEV+ZR8/11T6ZqALPmpa9bxmXGMGwOmjGjID0Azvfmx?=
 =?us-ascii?Q?uRjihlKdFTAKp1XYAd9WrkszzsMfb7qejIDBPCNzJmmPhBaAx5eIb0rGuiNY?=
 =?us-ascii?Q?NJMmTSPKlpG6y0WAJKi9BS56D8xjBloqeJMJy8jXKGX6c6h6CUwCkkNFHoTX?=
 =?us-ascii?Q?/giNaq/YccvaHLwEcIlPf/trrFaQMjKY+WBYttwfvU4DF8afUHgPQvpGV8Vz?=
 =?us-ascii?Q?Aw2AGoP+eVVYyjqpEKzaSArLvY9s8YlQNX/mFjpRztWbz7cas0uMmUZADfbh?=
 =?us-ascii?Q?3a7dZoLaKj1a1VIV2jVXfjVfaH9A8gSb4j7gh524OwIjqpEeCETPNFU+QWV2?=
 =?us-ascii?Q?VtEib8ntVrsnrgMN22Ui3RShcO8CTdMyOawpnQBuPEJQbphow+EYOZJ8hDTS?=
 =?us-ascii?Q?U/+Y4zz6KMheUZdp7UqBkefJyuwJsvkmqhgj+lx+dF4hcGnVs6TEClgYnCXg?=
 =?us-ascii?Q?3u1k/qw/JU3J+xe5yX+Edn4buRnbdhCp4SiOwhbUaxJvOCeQzwo9JRceJGPQ?=
 =?us-ascii?Q?bXFShYret36K1YTM7wcg0ZP/zeE5ZXNYzZmohUMS1ybBLhFaNRyItNpg7Nfy?=
 =?us-ascii?Q?RU8BMiLHKmk6jIPvfAn5KcscX7xmFqQuW82669q1lJEIpHOuX+B8h1PYGu62?=
 =?us-ascii?Q?YFbhXSTZLJbPyEEZDL+U+4AzpCcNn0V+HaN8qycTwkAJkww20xYu2BpRs2WB?=
 =?us-ascii?Q?7Vbd5qYa8Baq+B5KRl06SWnMHqlZV6L+6HlCiJb0CTmIJcaVycWdPROY6nGd?=
 =?us-ascii?Q?oGvXFVLpzd7fMKrel6zL5QdiVGNPu7LHXUngwl71zXacOjQyrJZUE2v+BA2p?=
 =?us-ascii?Q?yHUwJWx4mp7UTaDNOL0wHWDJx1iGjBZx3vw+rjxq+kcLV3qxBaeYubl6K+DX?=
 =?us-ascii?Q?JH3IT+oxJ8H/ycmoAO9C38MBnn+5mQIqzOj5i87HouT+uz5lSbcsdnZk5/z8?=
 =?us-ascii?Q?yd2NJGXqGgY8HkBEnaPvY3caH5wogNkqeA+uzUI0ChnuXMa75if1ca9yHj4h?=
 =?us-ascii?Q?gsnOXV5kj1Z2mwhrSWt+v8ZxtnymTAA3PldAOlWoa5slKAyhAOwcNw9iP2bg?=
 =?us-ascii?Q?EOaCeIVbZ8wUps9no9d2Lk7uBKz1snoQpaidM0vy5vh39R2X2r5onyOcAR2c?=
 =?us-ascii?Q?Ty8m8K0gObsr5/YjIjldkiGyREUrKKCb3VQFkxQWCZOeV4GS30uv+yPrm4mJ?=
 =?us-ascii?Q?SeWssp8vxi/6wLGnEVNoO2q3pZ1VLlnIvLqRikwYr9IbEf2juI7ZyMGvF1oA?=
 =?us-ascii?Q?llpSn1v/IweBHKwrlmk/Pe8edLecwRl3obbClZ9knqAo0VMDNlBkz75XcjrS?=
 =?us-ascii?Q?1p3x8rxlBBWAFnm+msqwcCXShABuRSswePwyvkxEtectb+53hG4fuoRYQCRJ?=
 =?us-ascii?Q?r44gCqzRINOUdqKBcIYu1cx3mnYVOYnq61btqz9nGhm0ZIE0GrOMOJr1j02P?=
 =?us-ascii?Q?vwAMZBp2pZgx6iSnYoNlXPirW0XhjICGwHYwvDqgKMrG+v3c9rOvgQDNRKxs?=
 =?us-ascii?Q?TZwdANNgG5ipLvvNLNhiLUnMP2kJEO0WbNKxeldw84ctRtH2lGfvuIjZlKzn?=
 =?us-ascii?Q?mHlEl3Lxop/Z5uY04AA1hr9gQ+eKyTxCd9tVP1YcAf4zrr0S9Zd9mkHy6r4+?=
 =?us-ascii?Q?+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310d986e-8277-4b06-7177-08dc3e8d6229
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 10:00:13.7491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpnCQokulqzJhDXUTPwTdBiwJCvSZStbsMOT5Fsdo6ObteCECmAs1bw6lIYNOquOFKWOMAFXxZrEA3eepNEB+RoObZ5CPq6SuEzJWDjpLlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8109
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

> Let's put huc test under HUC subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Feng Qi <feng.qi@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_huc_copy.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c=20
> index 246fa0a8b..311c2fc59 100644
> --- a/tests/intel/gem_huc_copy.c
> +++ b/tests/intel/gem_huc_copy.c
> @@ -39,6 +39,9 @@
>   * TEST: gem huc copy
>   * Description: A very simple workload for the HuC.
>   * Feature: huc
> + * Sub-category: HUC
> + * Category: Desktop client
> + * Functionality: huc

Same here: huc on both sub-category and functionality.
[Katarzyna] Ok, I will introduce Firmware subcategory and put HUC and GUC a=
s functionalities
Kasia

>   * Run type: BAT
>   *
>   * SUBTEST: huc-copy
