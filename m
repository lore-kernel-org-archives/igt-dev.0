Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13029CFA759
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC410E7FE;
	Fri, 21 Nov 2025 09:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRLg/blC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39F710E7FE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763716025; x=1795252025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9+Q6oBjcZmtXL5y8KFpXVeHK1BLaFIPnONd97a32ACc=;
 b=dRLg/blCjmW6WLulQUprgFK0CvmzLgFUd1BQcLAqxjq9zhgeauIYH7X7
 WXitB4jBFC0IcSD742EzJ/su17Q1fxl259sh51WsZGPuV36aiZHZ4yxd+
 Q7qjM+eguoF+rI97k3Tg512D4coX0WbIBQOfZP1vRwt0whxikTnzadYtM
 a/Af0QriAw49JZyMs4ChclA/XAq6QeS2LUM4PgtvPnhREs+tCMxGCaoDJ
 MN6YPvCf/V78HxvAyywPbyQ0jk7VXS6CgD3AC0sNkyY6NuDo79LgRN7rI
 JxgNijtN8CZvyoXYnbCIj+XGPRn0PJjjLi9Fpl2q6VG1/Y6hYxnbOUdvv Q==;
X-CSE-ConnectionGUID: vXh5N6TiSemERU2V7o9vaA==
X-CSE-MsgGUID: /k3Uwz18QV6wMjJY2CJ3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91286362"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="91286362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:07:04 -0800
X-CSE-ConnectionGUID: 5V657bFMSZiqdHuJ2rOxYQ==
X-CSE-MsgGUID: V6T4oEl7SmKvsgSFWpgMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195807848"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:07:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:07:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:07:03 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:07:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttBCMk7D3Ea1pJcvcEN3s3f4tMJhN8+vxnIl8pUtxJBnNXjoznGqORbeypcPGeLNLoHuBcWCQ3xByKaXoAZanqCWohWdROSiErgpiTBG6Gmn0zmLeAZXvehHztynsIao5JfrtXak30Tp3M7zzrtdk9IGBFRerl55A+x/ilp3ycAumrE3G31GH6pBQ7MBYqvjFwn5tRA7teWjBqAsSDiQx8T/Y9AmywBevTxeQLaQCrZcloJzRQGL1b6leGNJloCFiZATg+9dUSIeeKqaplG1z8XKL3yfEfX+CgYU2cfqxZpydc8uMkUm4XDVUm4duzRu+GZyuUEHWdAVL/fRrYFDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7LZdXupX3Z+FB4A1HqyjEPbia74eaSpB9dCG2t/pio=;
 b=NLDjKTZSEaq3IpsmLGSLs2fzEwLYHpMRDDb5PjI1Y0SRFYmgvbfQESldB288maJCWtrC7V/4xI4D6wM5PfoGFaHIvPQbCkPVOfcy1lzutwskt9dQVAcprBHUmcqLnveiHzhhYsUEMMcgiQh+XI693iam1hT5bjG48bwuyfS33t8oQJbUohlw5w/K4627sUNEFN3rNt1q8aKyxc+//ZVTbe0rivo3GFy2Znf66nNBf4K8pkbi37oTcltot0umxHe9dlA2BuROBHWArKsd2Mka3JiUr8MfUkg2m69IRfdVsPxFXor9KaeA2oeTAojSGWBUyfs+7txxbQQ4C+Of/kSUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY8PR11MB6938.namprd11.prod.outlook.com
 (2603:10b6:930:5a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 09:06:55 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:06:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 06/12] tests/kms_writeback: Add utility function
 for shared logic
Thread-Topic: [PATCH i-g-t v3 06/12] tests/kms_writeback: Add utility function
 for shared logic
Thread-Index: AQHcWqlvZOMMEUn3CEWSkYjopK01FbT81g7Q
Date: Fri, 21 Nov 2025 09:06:55 +0000
Message-ID: <DM3PPF208195D8D13907076F82D97416C29E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-7-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY8PR11MB6938:EE_
x-ms-office365-filtering-correlation-id: c7a90d61-b1d4-479e-f6b7-08de28dd5194
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?LPYspEoGmD9P84wpeOVW2vmM+esnpr7enM59qnOWie7sY7hcpCu5cYVwCZou?=
 =?us-ascii?Q?nOPQA75SGkygfcC8yJqe42SRUdxRQ0+REANe2GHumdCBcszfto7rhG2KQhzv?=
 =?us-ascii?Q?fI88Wgf12J49efRexKfRaFKdUZ/yB+sKGK4UtEmltPzYagjr0WueuFnkVccf?=
 =?us-ascii?Q?k9zpybYxXK9LUNGhv0XgyYf3/vy+3nfVCMyNNWOZEvajDUMGztWkU09viW8t?=
 =?us-ascii?Q?KkWnQrD6VGsNYDfCuYkqph4aQ7Ws9mXKUuUSG8nADQBC/H/u2Pw2vTnz4q38?=
 =?us-ascii?Q?ls1/Lm+ScqpMBjxRvgpJ8hMDHgqBg8iixPpFcN7o3rT3dJKIWD4uyEmqe5cj?=
 =?us-ascii?Q?EZ7H5vtaa3ANXp5YmFHp5PfgeGbwUWqm+4d4m9/VPl86qRWEEVn/slznHC4q?=
 =?us-ascii?Q?n3eSGSSWCgjCCLpFH7NF7Aw2S3BDURYuM1akBJ9BcZnEcGMPZcYV5QjQWjNy?=
 =?us-ascii?Q?K1aJaaCld08LRpsrlyx5y1Cjb8miSpHKSQeickvn/XdnMRvwwTeRSw72OZCW?=
 =?us-ascii?Q?ZIqCPHr+M6hy45SOearM9BGx9dn+2q/eXTX5k8CkT8deTRgWbuGXswpedooz?=
 =?us-ascii?Q?MInh5tCRYfLhNz88BfIsAqkTYemBOYtZrCxCqgR0yomlTGAFjT90jUxDT2w/?=
 =?us-ascii?Q?PmCnm4jA73JgPjY4R4NWeNpXRhgzzZM081G7JDM/t+2Zcxxbv9LcuVqgwTT8?=
 =?us-ascii?Q?nSG8/F6s3Apll1+A6tpH6llawEhiHYrH6C/mgLn4B2WKcDJQey+BmPrBiOSl?=
 =?us-ascii?Q?GlC8Rc28m5W1XSx2OhIGIsjHNR6Epxtc4Q3myXX8nUmkBp6QE84jPes9QfZ8?=
 =?us-ascii?Q?MBt5ZOfnW82XSctO6ZFJ5Y1pBExwMENu4hTt5vFh8xTviJPxvF2BDol0+0lG?=
 =?us-ascii?Q?rVMfNH3BG6iff/BECMmFY931PA/pLH1IKa9oO8c2Hm6pkkPyTZGg8dX2FaK7?=
 =?us-ascii?Q?vEIZTm2nTxf15W9RiPPqoG5RlOjIxLvuYntxTaBICG1IxHkr3OukfNwbyqaF?=
 =?us-ascii?Q?ReOK2v/YffIAtZJEjpeIdt89fGUpY3aLtl7I8/9W6EYPtKMFRnpGLzDmUosp?=
 =?us-ascii?Q?6dJPx0j/tYgP0LgmOe4+rVkcPE5QwpLziSRU16YKm/pyrAbqVW1QrZ+9tZ1M?=
 =?us-ascii?Q?qkvQHbgQpYLMyDAgRSpVazz7vh4Zw9ktr5U540tLpJlNoRWjj4Da4H0oMfHS?=
 =?us-ascii?Q?y64VpmsTogGq/ZWy9CGTOcsfCCoSa19A3XqEk+nfn05p6ZikAwmMfXW+Tjd+?=
 =?us-ascii?Q?qz0qeD8QHFTI5hXCrEbwccXIrvt/i6J5hkHAThNpztXmAMHj84LZnvnyUYP1?=
 =?us-ascii?Q?QezzKF2gqeoALpjgyA5+7I6eUhmfGzQhy/BLxjkHfXrRY5fO/Ds8NmwWZLq+?=
 =?us-ascii?Q?JfRjaY60HvQ2sktCoSilpzFIvec6TAOF9saqGlPXGXTM+1rszDdG9uOys5pt?=
 =?us-ascii?Q?xZ57GsU2P2Q6K2Fa4UGNcNvBCXZd87UjYfwj07rBRqdQOe2Qvu35lma472KY?=
 =?us-ascii?Q?FXlF3XcPTpWqgbRtQ8A97museTsFC7SZbgzX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dhtM0TInliBU54T38loj039L2zB0Kja+Aqcg/t41zhA0CUWnErR0soe58G3m?=
 =?us-ascii?Q?wIpzzEhXJDekrcySoahndpHrs4RK3TwSyOnNYkxUoeLvAr1wMu2FBKJwvtCd?=
 =?us-ascii?Q?am+vHptWdiqkn1VQssWVOuxPYLocNZhd4PwGczJdGmrpBR10BSEJTdfI2l+J?=
 =?us-ascii?Q?xvqRJlRlkqh8hrL2KA9LsZn+/vQpVvYxGf0HbhWprFdIpM2HVZPgFfrTHl2G?=
 =?us-ascii?Q?K3OIavlR7tu1cBKV03whFlq5LBJmRJ5st3yKgFi8FFX9j2i+trznznq2T+TP?=
 =?us-ascii?Q?s9+HbSilLWMFOi+2amRGErgQ2Xi1wiLEQYKpW+u/t6u6TszuynMRj6/+ZdvW?=
 =?us-ascii?Q?OY3xunQSROD2Jv2JrkkQW5kWLHeU9rNuzewbGp61TMH1NViSa2ms1h9f3v/u?=
 =?us-ascii?Q?SHmyyieE+s+e4GWndc3U3lqvRsW6f6j8L1lJEWt5pV1mi4abJPxaz8ynwfGU?=
 =?us-ascii?Q?XdHLWMsExQZyftV+I+ktGd7xRT6NLwfekH9q+uxwEKPkfBc9qAgwqllCSiRp?=
 =?us-ascii?Q?eAdZ3FtD1+jCISlSZul+NpEQMSWXth8p16WN90cm/Ikp8ncpFMMOBfcQds/J?=
 =?us-ascii?Q?4uT8J17+WUvYqPCxBTHfF1MvZ+9l0vyfjLTGk6AjZVxJGlxDTXPGr7VNSgEz?=
 =?us-ascii?Q?I0cmIxWbQvdV8A8yzRQWSt9lRwA9qw6Ph5KrVyOVvKMWA7qbjM1QKnLRS2oI?=
 =?us-ascii?Q?mMBIv+SsbcZ7YGuia5qJGITzfjO3jdUs9YngnKFhomF7d6zRUjQQBFOvDbME?=
 =?us-ascii?Q?tHFSrr08NOjHqDopcoVe/K6WZYoC+B9qegymV4IQt+6IO8f2HHQv03ss7Vbu?=
 =?us-ascii?Q?dn2QPw//KPS1j3Uypq7s2jN+6icWBzCn7auOWRIJ8gf0xHgutHO316jzs/u7?=
 =?us-ascii?Q?R+mRP/Uik0qzkre4tiYPXlar/u2je+nP2jI3+TE7zPHSTgEjZiJZqJ/zfhyY?=
 =?us-ascii?Q?/YAHhbKGTQGhnl1lFJAE10Cq46Q8id8N58MW9Bi2ldJWItycac03Oklpb3+d?=
 =?us-ascii?Q?O0FD9yGhpbSFLGjQ08M8ulHDLaafz0Osm4K00SHgat5t8Zafqg9FATwyS+e5?=
 =?us-ascii?Q?CwObklscQu3KMQiK5Ntv0iQ7u25v7DM5PFXEvFi4t2698y5ppb9hKtp3/RTe?=
 =?us-ascii?Q?zTY3Ny3gCjQ+BMpD/1c7vv42GhRQAufaYDXirZ02rIDN3LhQF3oeIlLc3jHq?=
 =?us-ascii?Q?+FwnKjK6zAl13umXwWeEa4N/de4xryYBSU6ZCzwJfxdn0MO+e0dFWci4dPLs?=
 =?us-ascii?Q?cv/Kqd6Mp1MqD2K5OytME+2ABRdsXwIoILjnQ69quFDZh7bpDaWCo7FEjdXw?=
 =?us-ascii?Q?1gh3zbPv3+Q6DeuzoEZ7RJhX8OgTg9jqZ82uwUn7hLSpSUpRs0AWWlMF4hf5?=
 =?us-ascii?Q?kxLwWc0f+NaN6aZ+F0KlWdtNEFX3FH2Qbcw7Q6a8FU0sUGgexwK1E8PiCWps?=
 =?us-ascii?Q?td72twBn6i2ctXH8ewgccSXnY0hWtGcl/LNI77X4OCkeWmaAT8eqB7le8UK6?=
 =?us-ascii?Q?P9uZTyTNGFOCFjyDCIkGJhm1LwTQN/N70/9pKStF/4l6g7wAiUQK2gRejXeu?=
 =?us-ascii?Q?OrfRZ1P1yeo6rFSy7yDpTF5E2WBfrVvy6C8EK7OU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a90d61-b1d4-479e-f6b7-08de28dd5194
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:06:55.4667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6GnWdCwr9IqFuFqis+9XKya9J6cIYCFiytbAihytLZA3DJs0KQAYy+JqG6bnygjv17ltSdbXqrjWESdk9xuzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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

> Subject: [PATCH i-g-t v3 06/12] tests/kms_writeback: Add utility function=
 for
> shared logic

To generic this should be something like Add function for input and output =
framebuffer

>=20
> Extracted framebuffer creation logic into a separate function to enable r=
euse

*Extract ....

> across multiple subtests
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 46fada8b8..d031a9f54 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -508,6 +508,25 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	igt_remove_fb(display->drm_fd, &output_fb);  }
>=20
> +static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_f=
b_t
> *output_fb,
> +		       uint32_t format, drmModeModeInfo *mode) {
> +	int fb_id;
> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> +			      mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      input_fb);
> +	igt_assert(fb_id >=3D 0);
> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      output_fb);
> +	igt_assert(fb_id >=3D 0);
> +}
> +

Please use this function everywhere it can be in this function itself

Regards,
Suraj Kandpal

>  static igt_output_t *list_writeback_modes(igt_display_t *display)  {
>  	for (int i =3D 0; i < display->n_outputs; i++) {
> --
> 2.43.0

