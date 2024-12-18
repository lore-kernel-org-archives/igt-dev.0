Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A233E7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EFD10E43A;
	Wed, 18 Dec 2024 22:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TinflSc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A193710E346
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559481; x=1766095481;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=viclwb1rD9eWO74mIsXZ+JDUufscVqQo9zXgq+2QrgE=;
 b=TinflSc0fO1qOBX82oIHdvnwFNyqQqsBeXOGv9whYZp6dmApxHSZbiCk
 igI2i64Tye7binCVJQWl8lUKVsl2IwDF8BL0Q1SAmI4rxvHs3l3FgRWBX
 X2t/gJqzvfZzJ6DJ+0ma5R4YVwB0KpNlHKPLAF69+IgQx4hbICWYpaMcv
 Ad8ZMrQF0lqo66/ZhidHHrpgFclT6AL2a4rowEGjNTtlqIGMfwzS8s4F1
 nVVTqeMsJH2dAXSVijKLexxf6CWl/yVu15oMnmtJMvkt/5EVm+iYQ8Z6w
 cC46+u/BRyGugrOMT4JuCMJO7/5eGj7SNXSKQNwaTuEyo/1NY48/HFtES w==;
X-CSE-ConnectionGUID: FwgM45fdTZGJ979MUFRajA==
X-CSE-MsgGUID: Heol5JdhSUKWKHezrcvODQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34938869"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34938869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:04:41 -0800
X-CSE-ConnectionGUID: GpYJeqF5SNigzJfQ29eVEw==
X-CSE-MsgGUID: twg8HJSoRsO1QKGKOPMqIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98471431"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:04:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:04:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb2NiwBlpvyg+qmvTOwTpDzCYEcYsV6SIYE5Ci88ibPRzRTSmtFB1p1BIn2eIB+z0DMSJVKnSm9WOnaq7Wvi38UE0xx/SIrK7FtvCeg5bqF0Q7Nil7I0z+TFYX4QIdD44WCY17/VTdZa7+e9+VN750vp27IrIHsV0bXCCK5TsXSdXDJACKRbUChyjMgIFm82BRVelwcFruIh8Z6hbKJtPcgoqBMDK6IDlRFXyesQq53+qX18IMHBxk3U8fD7/syTRxh/qdRbelaplpUBC9ZAahIjti6c2c1BXux1D554CkziUnQdGmf2e6iD2AXriFwiFzf5lAXHd9Uf/lyvguICsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPxmiVdnASKw4QBMjVx9oewXavd3tr7x0rWfyQohz6c=;
 b=E4hie7UIG0NsJwEjmAO4x1oG1Eb+p4cLCbZnwHNGrbkBGF9/ssqueiMKAAB8b2t7NifG0fUpKv8d2ETMQqkP8uOAmffbbQIS7BrZVT0LJMDku6HJYP22/6Q5yap0mg/I2yf6/ZALkZb7YRkkn+loxvshtf/wufSpEFNfzHG9zsfeD6BEaCuB6PAu6Zt2ffPh1XFbasRn2Mv5iihfgqDEuyiy9uvGZ0Y9FkRg3NbgYIaiXBkV4olGrNLVdXrFgmzPwy8NZS/Kdga8wLHlopwuz14A3jfMv6pn+A3Q8j1BgoNBigGgChbpOlxE31WUhnkyF5iBjdiJLc3jppssZsdfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 22:04:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:04:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v5 3/7] tests/intel/xe_pat: extend for xe3
Thread-Topic: [PATCH i-g-t v5 3/7] tests/intel/xe_pat: extend for xe3
Thread-Index: AQHbUZUDuYOlBvu1K0KbZdAMeVhjKrLsh+Ng
Date: Wed, 18 Dec 2024 22:04:24 +0000
Message-ID: <CH0PR11MB5444CE94821159F62CADB38FE5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-4-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-4-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 7c293d24-d29f-4955-1cee-08dd1fafeedd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rbFtOYKg5rmPqW6AKkvpgdezA4/CV2VYQ4beVH9lIAmh7eyN1B3D+Xyim3nN?=
 =?us-ascii?Q?SWhOaG77ch3txwjhRBVezLxZTya1Esd6Gv9g8SyZ2N5Sj2GVmPf7Z6iIponL?=
 =?us-ascii?Q?euzqxNLAGPiRWddElpeIm2OWuVCgL7juCTlF2Zmz+ysP5sFoC3j5utTSk6u9?=
 =?us-ascii?Q?dDpkBFGgp3S2bv+JN7DOqv2OWTSWxaqw59w3nyNZbrUoRkYayDco9xE0EExO?=
 =?us-ascii?Q?+tOJ5uB0s5lOwKZN8gegy6eRvUbcOiI8Lw59h1ckRf7zk7CaAiG+pThCHrxT?=
 =?us-ascii?Q?GtTCX2LxydI800vUcjUPZ66KbpReZ5Z+bIFJVp0w/b0487VCk33Ncdgc/rdN?=
 =?us-ascii?Q?x80H/RNMM1Zt4QDRbYUk9AeyS/RMiO0S4yc9nWn3VS35P7B934TxTHuARVHQ?=
 =?us-ascii?Q?KH0VOzKqaI5nYUC6kLhk/8e0t2fTzyPN+t3ecE4AO+TTNLbyIoL6P2M6gz7R?=
 =?us-ascii?Q?Ek8rpd9VAsttIMSZthyoH+D7Rj6N1brKQhJ1Plmt/5/GY4CY4JkDeDr+1DOb?=
 =?us-ascii?Q?gJ6ljZxCHSMIyI7vLUnO/7NrFeTXIpEhBR3sOhNa3B3RETtfdCWlk//UpZ2X?=
 =?us-ascii?Q?1C+uvEa2+yjoARCi4DnVS9EiV6M0K3XYTi7n4hk5DIjaFc0lU/k1w+bezSqX?=
 =?us-ascii?Q?OdQT4YpbdB3dq9/ZaajcRhwRlf3eqJFro+rvntxisgic7BNX8Vq2Blh3jqPu?=
 =?us-ascii?Q?3ybSQnqemvc5n7rV9NQAAAqKA+kJjupx9WdW+nBbUGpNvLuujHpXDrflsAbn?=
 =?us-ascii?Q?Kkw0VCw2D18Wk1s3GB2QiMxp1/PzYwGPz9iz8VWqBUxfPctbO3DXU9I0Spm7?=
 =?us-ascii?Q?UaKQ/asIUQgqbAc5x4xbgND1DA0RslaT5HA+oNglXyBURUGlOpkBjtgRmL0p?=
 =?us-ascii?Q?gLcKIVfExbsT66Eli9GDNCMdIu0to0uW8o4JvN4Zd1os/jcuZhZrJG4yrmKb?=
 =?us-ascii?Q?HTpk12AABLgoLAUESDp9G/Oo3t24iIUrpYQaJzh+fp08ElMC6wSa7kT5RHbW?=
 =?us-ascii?Q?fYFHUN+EB595EwGUYR2queE3mdX+l1q4hLBc17FYqA3p/J2WH15Kf43pgppM?=
 =?us-ascii?Q?rjKDs5c+9oLx/maRCdIGgyUK1BOHXQ6N4IEM6qKeoYqYOoJglO+NxxT1p47d?=
 =?us-ascii?Q?CNlbBRt6zx0bsaLBunPGehJncjQkFrNOXwGHFQ/QMySPQUpM7UsB93R635MP?=
 =?us-ascii?Q?6aAlkEjCoog4OI5eh+jpw7uybPkFeUj0x2fC0pvbOnW4DF1wV1uzqFMdhF1Q?=
 =?us-ascii?Q?2x6SvleziZbAMFEzALMYDbSZAv6/bICTPrLvJnVhHDrmQa7BjY6TI7O5h8OS?=
 =?us-ascii?Q?Msf/IrclzfqgwLgG10pnZ59HS+wN1aTvyLUO4RPHKxb1tAC8pjaU2A9n0ggz?=
 =?us-ascii?Q?BvdOLks7upZm4QB+HWeG8sVtkFwNaAotUvDaaeLOYvEVlxiTDdT92YSKkioI?=
 =?us-ascii?Q?amTBJ90xaD0q2JP+3ufgGTWzH2GGihX0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CwM9ojYazx1acGpN9cQ7o2BM8vm6i5dIKT3eZf0b46/c7XlFpUE3Sr1zzUyo?=
 =?us-ascii?Q?nDQhpYl+TgUXJJ8c7oWj8NP71eLPv9xXpog4dEon6KLrMPXCrfdjWtZSLm2R?=
 =?us-ascii?Q?KRMrCodeouiVzxb2Z6/B7CWfrf90TYSDBrPW3Lo2AJ7xzbgD6GYdPGvutDMd?=
 =?us-ascii?Q?5iCI9TmD4krW8xY9zSpvP+d37I5ipVDLBvY/G6mAMaWu5EN0ETEUweufutF+?=
 =?us-ascii?Q?Ih4/yjtCwdDzIKOwmcckVjX4r6mxU2ftCjhmQJ7S+cBDB7lQRa4TeqdGU4TS?=
 =?us-ascii?Q?AKcGFG9a3JF8RWKfIwXkufaG+wFpszM8eAWKVEInEewFmctVYQd/N5HNnhoB?=
 =?us-ascii?Q?o8dZHkQzLtn0jJ6Gv4W+qsN2BvZvzT+dd9eY6UaQRy2hNFingIoGS55fK3aY?=
 =?us-ascii?Q?k1d6B4a4V3Kh89te0W5hHvhstfY0dxhfsi872zCXbtUa2mcQ72p9TJbXrsFM?=
 =?us-ascii?Q?XflrGQmxwDsJmU9H729dY/cOqK5uJqBc9movdm4lIdEa+W5GHjoB1gg9es+e?=
 =?us-ascii?Q?aCRUsd9ofUunPDPQhrIgDMnhl60GadXx1e5W1rq3liSGuzrbUm82JoaFW0uu?=
 =?us-ascii?Q?n4l8R3x0KghPcenkcHxkTKy0VxvMLABfQGq/as5kqNax6MqJ+Up5DGlQnDsk?=
 =?us-ascii?Q?qwVNCZ7FgQ7VAQ1p6Y7wxOa3zO0LiBVeyHeo50XvUXqMk2gSUHgVm9gf2k6y?=
 =?us-ascii?Q?grNLCkUTuXWXXpGsDYHVJv7iDKRZHRFaNaq1Eo+7k76xtO1xVTX3iHVcdmRC?=
 =?us-ascii?Q?LdpP+yy5uP2bWs3yA87RA/TDiTKj/J8JAFvuasdzjbslb7bYVC5YChPuDOn/?=
 =?us-ascii?Q?Ch2nYpA6Li+aQe/aOnGD61A/LlJaI47bCl0Uc308jnoyyH4XkYiHnRfQ/EzZ?=
 =?us-ascii?Q?KnRcw5gt3v395tXosJqT2eZZEIcjib95r+tb/ZqYkp3ECcaTzFtRKpSRu3u0?=
 =?us-ascii?Q?Xglk/IRqDa0YsgUPL4aomseZKNse9iHzeejCoDnGSoOWSz6mVq1Nbn8kwwzQ?=
 =?us-ascii?Q?cgcxgr4aXJvq0poPBIBQiI5bdKS9ZoKDYcyTn5Wvqv8SzY1aaYkhs5+4Fm4q?=
 =?us-ascii?Q?55OBkZsQB6dBuN4szkOkVuM8TXQRTtMSBT+fBV0Dtjl4xyeCPB+YDKJNIwzi?=
 =?us-ascii?Q?HBmmYLTdZxfmLbI7HSOuBF3jM4Y3L+oF5EmFuyoZRDvIdtHsXZ4qupPNaS3/?=
 =?us-ascii?Q?by66R0NGK84l1yn9HwHdbNUWLNn1e1BW/a2sZneXofB0V1Eh9ofIMjYlSAfq?=
 =?us-ascii?Q?A+nAi7V5cUOzORyJU2lceE7YByL72rA3SMABb40qwkfLdF6FVWnYY3g3mh7I?=
 =?us-ascii?Q?l8vVlAf5XxLu1I2KZWt7SH6PnPIpnqck9cd8aQ1rG5ppxrQlYrqOBWpe/s7Y?=
 =?us-ascii?Q?O3jyCQyWSj1C4albvHCRnuVNwDXQL/gPxa46CzbtzLIvClVTqQlRAGSWwXOf?=
 =?us-ascii?Q?e0erOmXpijw2ypgaN8KDw78uAQ6lG3EGXCydlwQK9lp9x/JXxFwSuQCnpGJP?=
 =?us-ascii?Q?3BRur+h9/gPtPNaEjovDm5E/YXgkEVmvNOmSDi63oLeTVOsUqHt8Mdl9OzxT?=
 =?us-ascii?Q?NCzcRq+wqIcEDZTYejzoZJD9qr6mOREKEh3HlHos?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c293d24-d29f-4955-1cee-08dd1fafeedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:04:24.3187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/0xbMJ1P/rJH7uvatF27mkjwmxu0YkF9k2KRrQkllbGVbe99j3TgsCXZuwsnr47BVgmSQjqT7pvylZzc2DlLUuZJbg4Vm9qUf6PKaIeNP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 3/7] tests/intel/xe_pat: extend for xe3
>=20
> From: Matthew Auld <matthew.auld@intel.com>
>=20
> Same pat_index modes should apply as for xe2. Matches the kernel.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index b0b3ad8a7..1322df349 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -110,7 +110,7 @@ static void pat_index_all(int fd)
> =20
>  	for (pat_index =3D 0; pat_index <=3D intel_get_max_pat_index(fd);
>  	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 20 &&
> +		if (intel_get_device_info(dev_id)->graphics_ver >=3D 20 &&
>  		    pat_index >=3D 16 && pat_index <=3D 19) { /* hw reserved */
>  			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>  						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> @@ -854,7 +854,7 @@ static uint8_t get_pat_idx_wt(int fd, bool *compresse=
d)
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
> =20
>  	if (compressed)
> -		*compressed =3D intel_get_device_info(dev_id)->graphics_ver =3D=3D 20;
> +		*compressed =3D intel_get_device_info(dev_id)->graphics_ver >=3D 20;
> =20
>  	return intel_get_pat_idx_wt(fd);
>  }
> --=20
> 2.25.1
>=20
>=20
