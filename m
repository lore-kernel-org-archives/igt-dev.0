Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFFC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6708810E0A7;
	Wed, 12 Jun 2024 12:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOVUD+XV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2682610E842
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194432; x=1749730432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RY9fvkP5WVKNSHX1MhzcrEHssKzl+jY9rPK2lR/DPaw=;
 b=EOVUD+XVqPM2WhTVqBSws9Ktwb2dbkcLf0OQI77xd7U721ZT22F0VOyc
 6CVG3CbJU9ki3pxZMM640evq5AtzTq8QcktjbVo1RaEVxVQ7Byfbb3hPG
 d3XOjJLCrqWcOPtUSXj0CHM0faa7EZWaj6rAoOEFEZsaI40Dw75xvzzVD
 GfCf5xH3QKkCl8rQH9YUqW+nzjYbbqmLigEFEHiBjrMly9cr/OTi2tYnt
 RBqpSKtFP801kh3siIXIoj3DQutGM3FPvsunevmzFPRePXHjf+iTqvXEi
 OWFV2GnE+VnRxehxig0vdIEprIR4x0rM/THARkfuIMAH3yb+IL9b5GIkI g==;
X-CSE-ConnectionGUID: mmGjIeU5Qm2cWuf3J036Lg==
X-CSE-MsgGUID: KYsrEVJ+QT+k6RudoyG/Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15106859"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15106859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:13:51 -0700
X-CSE-ConnectionGUID: 8pBsVzxKTTaPy38FkM/1Vg==
X-CSE-MsgGUID: rmsdHnMFSMOuSgmMpxEg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="62952794"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:13:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:13:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:13:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:13:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:13:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bi3ijFDqXDrauLVE6vUqLPxxq4DKyuKX90DfqVADazVireMWPeLzKynkVmdXWpjXEfXkbyLfbkvFCVr5iw+yoCXLR+qlpdbE7a+n+oGLUWBx4NMX+Dd97kPcOu4FL0+ZYA6H72MQmB/wAy/l4AzunjH3zoK2yKbBoM22kpN4uZuZ1CtfgIiv1RXktk4ssZi+vBFZfpbcVQIRh8/4d85ZO1UGkvlJWzaRAwg2Cu5Xq158SGOM4QWaHSNFiC3YOx7ywrKlVfnpiL92mVflzSPOBCptGS+DUUgTYbsO6x3MZQh0/b2Z4MP6TWTkQzRzclfnMj6+WztKz6+aW59PnM4BuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af365VF7V9/iFs2YKZrY2TEZzvoMq6vKjZKFgV5SBz4=;
 b=eIuM1CwX1ve7o8Vle/9ePBSkKrx6E8bC+mq306Bc9PMbW9efn73jO5UpqaliTGr8CY9VIJFUx749IOxXnKGD0lGBasvpFn2SZo5g1YxmhnzrJ1p+hYSNGGXPJVLH0V4t4G/AYvDiDnV+E1TiKXpcgC7hSf+altlBH5jLlSRSPYRUiZZ5+yz2qNeVLBiYGYKbpz+K/DPEhUSJdiGdqDXKex9FIfdDxsihSWZ407Kn3C/rHN9+e1Ki2cEr36LOjmDNSfZRV4kC2NWh4ZcQfwQ6Ud2PJn3UYGif9pCzmI/44hFPazuWWCmJgNkgSkjsljEGiiDvM+emIRjVUqOvFxaKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 12:13:46 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 12:13:46 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 3/5] tests/chamelium: Use lib helper to check the
 pipe/output combo validity
Thread-Topic: [PATCH i-g-t 3/5] tests/chamelium: Use lib helper to check the
 pipe/output combo validity
Thread-Index: AQHaiXyda5WepYnqYEyz8hzaIHW9s7HEcPGA
Date: Wed, 12 Jun 2024 12:13:46 +0000
Message-ID: <DM4PR11MB6312D2E37B488955237B008790C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
 <20240408061221.291523-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-4-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB8250:EE_
x-ms-office365-filtering-correlation-id: 0b20af08-8f05-4778-a6de-08dc8ad91c13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|376006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?3uF6u8VWqPL3Sr5iC/zOt7gxVGmCtmZjJttsBkAWoUtNTsOmV7vs5h9O+B8p?=
 =?us-ascii?Q?bJqr64qHV6ZRGStvxTz5zaqoFDOUqQF8wattznObbuej5akdi2eoI21ydhyY?=
 =?us-ascii?Q?K3hOmESNTfzpVGl9qi3k79Z1Qu8A23x4eJGlGu/Jp81WYjI6oIFr/tiOQ8A4?=
 =?us-ascii?Q?AeRpc0Mxb1bQ7a0ccI2TWJrZth63M8ahbgXVQiRERBK/sC5DXuKWy1isYTyM?=
 =?us-ascii?Q?ir5lOBIKBMgjdokJhhsHXkbYP45IM8ZnDHtr/BVcdzehZ9kO7KokkvQM+1I1?=
 =?us-ascii?Q?I+OpVEOE19vGlgfGkCG2QaZbHOXX1uwGnkOgdRxQ69bSIaflrI5/MGcB4lFv?=
 =?us-ascii?Q?P51qpg22W5FqxD8vmY+fHpc92vNvIDIYIHPkmG0m4842KzWq7LQza29q8Svc?=
 =?us-ascii?Q?rZTlqnU2SarPZJu+tmtsTPSuRvP9avZrad6SpfmgCtm3+NaDeWd+XmfLN9sN?=
 =?us-ascii?Q?xNVgDOUd7Cv3G96d5KpazwGZFn0eIvBpSpypzUWgp9SRRKYPsYSjhoRMQ8LG?=
 =?us-ascii?Q?vsQiHmnLbt0r7RlSoTPQ+pdmN8bf0JmPEDJyM1r9KwQz6XaCoDr9td/qq7BQ?=
 =?us-ascii?Q?SIG6Fw2te2fU2ONeIz+dgXrTu2WlriAUC7H/BiI8AtDLHoxj4Pk0zdzKQvwt?=
 =?us-ascii?Q?xFUdvU+sQY+4wAZkIaNs/w9nbjHV8IQdrOm4MqBacW2I+zBjxUimlfrAaTnD?=
 =?us-ascii?Q?/fUIOhsbwqTBy4ll4asGH2z1AqvmQ99xgxgXj7J9vXC5ZTJZv0UyxipjLn0Z?=
 =?us-ascii?Q?CL5JO5JgWZNxcz8084tjDc1nl4duPvxXukmXW+RA1wTzQ53QOprE9SgHUTbL?=
 =?us-ascii?Q?iMLaw6KYs+B0WVY7eYzhkCLfw41C7GtAEdqyXr3FDBkEmj5NAkbI6BdVE5Sh?=
 =?us-ascii?Q?xrB3cX8wQHPqKr73DW/9rP6zNj3D+eMiK9D6FyxS7vaH1GbRrgXL4wh6NjFE?=
 =?us-ascii?Q?aIxFjWf6hhXwWi91SZ/iYWiN+/wUGXQBbjP+MiW359qt/6Zjn5a2xOy5baC0?=
 =?us-ascii?Q?z6zGb+ynuBYaHZd0O8lXTl2UFVNhH5dE4Ca+Vh0nhq2nnA/TIdwMfyN3UN7c?=
 =?us-ascii?Q?zbiCHe6a06CNbCCL40AN9KQNxj/YJ4ECdRF/YsZkLvGG44nPyHHk2GN/uOIP?=
 =?us-ascii?Q?v0PRkaTTQla0Wu6E84QLK62EOVZ3TIfeBjeXdT4F84EgJFmNk+EwRMAGzjip?=
 =?us-ascii?Q?8/jXvpjCAVSMPA/IhranZDtFMj8+/7YI6JnXz3m+lNt3qR+BsQsIcf1x42Qk?=
 =?us-ascii?Q?Yxn0m/hiP3purVdRkN+TL5JHMLIENxtjsRHfBiVg/3Haatp8XqzELsRgLkui?=
 =?us-ascii?Q?/N0o6+RGJkbrGY1vZfa+88h9y0rucsh3qevm10lPVcRwHGrbrOT+7c9J9U9O?=
 =?us-ascii?Q?g9DMxPU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(1800799016)(366008)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ZvRPAj+bDpVuuwjqGxNobjsqBCKkyvjE93ZpkRI/l/64QrQFZ9VW6ytsoEJ?=
 =?us-ascii?Q?IKRlTxgi/JT73lnYqQSLe1ggmEc8RBHh2E1b6Iv+/qx4M6/O7BNZd30jSStu?=
 =?us-ascii?Q?BNDWMtoxLphn5WlgGYFdgNcDBYJFmgV9EnPrv3WuI0uOAaT517wCmZfWM0DB?=
 =?us-ascii?Q?CGtiYvoAxxDG+Yj5Mtq5AvdtMV/6tWpBQp8cV9RmqdWGIaNgpmsc65SSwOJM?=
 =?us-ascii?Q?7HXAue1B2zJMMwwtpcVJn3ATyHd/GRqhPmmG3QGrwkI201+9+V8pTqg1Fk34?=
 =?us-ascii?Q?Uq2/UCuJDXkBOgKvJxuE+erAburCijyyDqYNdzx+ffXck2Jur+LNLTgqtI9N?=
 =?us-ascii?Q?sGprdq0qKvwjPRuNa/G4TQVscwzDf7rG1MRBMMllaRokTWhHRa58SGkaWMCM?=
 =?us-ascii?Q?9Nv9GQOq5vjr7E5WcrEtt5ndYl60E2coLOQ4e6L6BlfdRPYiXHldcbKbR3Vf?=
 =?us-ascii?Q?3W1rb+SVJPM9eu+TyUaN9b+7k1cYV1Cm9+5TQWq7bc76cdMPUPB0qER0Fh91?=
 =?us-ascii?Q?IHdCMaUebjqi6ur0wDFm/8lLl9TKf9XPygawHcz7bDcySv9GDZdrEyGeXas0?=
 =?us-ascii?Q?kBdrR4cY221tcRxQ86AGxGXjUTu5WaU1i5EIyHV4nfUe7UQtS1p0oVj6kzle?=
 =?us-ascii?Q?rAesWB4UnXixbWrrlIrPxJD8G67Pnk7LvJjCkUBl9zY1RRK9Dwln0a3TRsa8?=
 =?us-ascii?Q?ZGLVrf82cVyfZdp6Od2QEAeMR3ftCV1N5C89pb8uZxUpKNvOEJsvZlUeQ6k+?=
 =?us-ascii?Q?8D3cLOlOyWPUnAvFLFNFzkLdubm+gm75e1jPH0GO70h51ZuKrkty2cHaoNLl?=
 =?us-ascii?Q?6cTYm5z6QX2lMQJ7UPUICCdPoGcP5KKkmd3CWiWKQYD1EzMhUnZidkNgKzBf?=
 =?us-ascii?Q?PjEN0IRLgaVRCjA2B9Rnz7SZvNiqvRP0W+OgL96XF8B2qwkoFoMDlMxpMM2r?=
 =?us-ascii?Q?rkBHYW/tijZ44uI9QemdlH3PJMmfJSoO1SEhc+HMmxdvmKEIxz9cVg5bURO2?=
 =?us-ascii?Q?0uvCitQbEscSiR8MEVrYbt+vx1aKqJaqUEagbt7obDZicVNMH56P/YJXRobj?=
 =?us-ascii?Q?cpFsF+rKQeq6dz/Ltqp7907cqqqBGmR6P0t/wKLMjSqUgxFPYsYiRBQsAPVY?=
 =?us-ascii?Q?yEKW594QgmYAcyFzoaOjB46IlGKIaHvnZ7L9f1uboATSBHayZmmOFjUoSqk3?=
 =?us-ascii?Q?sAQd3Ho1ztkvHNxMeM9lU3AS3wfFZQd8x5HOMh8XruB7WmYcnbsyX4Wha8k6?=
 =?us-ascii?Q?NSnAqeL2HjJaZCuOJAuKGNOQ/Sp+sY6w+4t673gBjlnXp4DEg/WUjIeSHtQB?=
 =?us-ascii?Q?bqxSpU2Kb9y06HsSoYYQneOm/0TPa99vk5t+qzwYR/AXhKk3g6xo319YRGZ6?=
 =?us-ascii?Q?MfvhpL7eiE3zLwehCGNl3WAgm6E3wW5hAMQ3l44XhrqDZwqd3XKTenotUe5m?=
 =?us-ascii?Q?czPXehmtfgEXZ8BUfOWAXFCzHSGQoF85i0KoVF6v+OdW5Nb4n70gOki5rX/6?=
 =?us-ascii?Q?0f2oczZgXNtaRokOrzNY9E0uzA16HQBiBdSYD5Ubrq0ysGFsu0RFrj1VLSvw?=
 =?us-ascii?Q?K/MaIT+f6crcovFy6Xo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b20af08-8f05-4778-a6de-08dc8ad91c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 12:13:46.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3drAhBSehWOg5Vk2otSZ+CBByncpdrWcdRL/4RMWZhzV5FcxB2eQ61j14Z82efLuBxTSJkbivkljx5Dgp9J17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 8, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 3/5] tests/chamelium: Use lib helper to check the
> pipe/output combo validity
>=20
> Use IGT lib helper intel_pipe_output_combo_valid() to make sure the selec=
ted
> pipe/output/mode combo is valid.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/chamelium/kms_chamelium_helper.c | 12 +++++++++---
>  tests/chamelium/kms_chamelium_hpd.c    |  5 ++---
>  2 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_helper.c
> b/tests/chamelium/kms_chamelium_helper.c
> index 197d29be9..26c5f87f1 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -207,9 +207,15 @@ enum pipe
> chamelium_get_pipe_for_output(igt_display_t *display,
>  	enum pipe pipe;
>=20
>  	for_each_pipe(display, pipe) {
> -		if (igt_pipe_connector_valid(pipe, output)) {
> -			return pipe;
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
>  		}
> +
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		return pipe;
>  	}
>=20
>  	igt_assert_f(false, "No pipe found for output %s\n", @@ -344,4
> +350,4 @@ bool chamelium_check_analog_bridge(chamelium_data_t *data,
>  		return true;
>=20
>  	return false;
> -}
> \ No newline at end of file
> +}
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index 858c595cb..52e758087 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -345,10 +345,9 @@ static void
> test_hotplug_for_each_pipe(chamelium_data_t *data,
>  		output =3D chamelium_get_output_for_port(data, port);
>=20
>  		/* If pipe is valid for output then set it */
> -		if (igt_pipe_connector_valid(pipe, output)) {
> -			igt_output_set_pipe(output, pipe);
> +		igt_output_set_pipe(output, pipe);
> +		if (intel_pipe_output_combo_valid(&data->display))
>  			igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> -		}
>=20
>  		chamelium_unplug(data->chamelium, port);
>  		chamelium_wait_for_connector_after_hotplug(
> --
> 2.43.2

