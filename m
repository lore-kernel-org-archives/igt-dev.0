Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAAFC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 04:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A86E10EBFA;
	Fri, 28 Feb 2025 04:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi4dB3Ay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5042C10EBFA
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 04:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740718223; x=1772254223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ekr4dVXiKjcUVjI6mWTuEWivtBNW82af608dMVUPIxs=;
 b=bi4dB3AyErpDjhqXrhF34RJK70XXzhHy5Y81N0BGkotdTUk02gCqDy58
 p2SZkWVdH4gR27emTkizQ7KBCeT6d/o1K6nZe2nD0hxrSu9ygtgIxY/jV
 SeLJ8pF5ju85/EEXbDKSDliMtdOuc6vZCLa8hGN03ziqn+XCBIIKYeece
 OOhRQrfsg8IoROCUyTrzxi8ZJY5XR2/27AiQmSfubepKLbL/O5w+SP9EK
 HOAIQbUMQ/BIJkdoi5uuhzzwP1dAFRnIDC3Cf/2M+866OMCjZ8OkqKvBW
 GGictTLQwX0VxFcBCtsTz7DanUdWe5r9TyF4KL2/CMXv4/LcRTvUVaZiX A==;
X-CSE-ConnectionGUID: A/XxXiSETSmZBHEQgDghuQ==
X-CSE-MsgGUID: 8CDDDsjxR8GIY9/QHd1rcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41485136"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41485136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 20:50:23 -0800
X-CSE-ConnectionGUID: j8urGYlURVSnmJZzeaZ6Yg==
X-CSE-MsgGUID: muJySe5YTJmY7EXWDl4Gxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121356044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 20:50:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 20:50:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 20:50:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 20:50:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5csyUu0HQFIcxh+Yed2vHm5ZFtKlQ624b0EjniwNgYe+tEa/WB/3ssfdHoWRT8KiurnKTDLmLP8kyc1VCjqmY9Bw+Kb46jB/+9i0MTOH55uBYYvN+wIBJHt18A84a4kntXJjdktcBD0eQW4TIaCubakk40HE2t4Pg6IqHkhULsTUPyKd+JRlVqeIqNFXwVetuqpuAvsA6AT24j54jNX1wt02JY4UoFBS3SpeEf9M41Dyc5ncXG9K9xERAAYIcWN31Grh/aQpUty0ZPEnnvDa2dXXmfuDW8kgEs02DWG5FigyrWhr+JE5mEagM2fMo3G/FXe+R35JPgcZ05GdSBAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Myss850MJIzrEFC0lI/1NwAnIScf/WyD26pBSntSS4=;
 b=WwfRMEGAogZw0TTibDBOjaF//Q9JEuPRV2p7+Mq8AVkJEDVXLU3xZ7hdpQmpH4ZC4SBHvUZu4sppxt/GnKmSyk9lQGzGIdxGjy9PgHYWQ6HhlG+hlYRRctKllfLvRJJ8xrtJOZ9CN27a0qjNh6BV2imcn3KyTBmktDP72jPixNkmDJKwjxfqq7EwcOSZW/VHgDeIGKqB+7t3Fgm8WHkldRmcGJ/CwZLSbuFIuzckz2OzWm8tMVWY/QIeUvbNWKqkfRGDqbbrC/df4Z+sEQsuteqEIRBphGEviwu31nsV7aS1roVKWrrbbu8oNPaH6jxnF7taVwadVC9Uv2IWVgXxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.19; Fri, 28 Feb 2025 04:50:19 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 04:50:19 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retrainig
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retrainig
Thread-Index: AQHbiRFGWNqEyQD5REaeLeOFKJg2XrNcJjaQ
Date: Fri, 28 Feb 2025 04:50:19 +0000
Message-ID: <DM4PR11MB63124AAF248EDEB0AAAB3A5490CC2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250227123039.2933330-1-kunal1.joshi@intel.com>
 <20250227123039.2933330-2-kunal1.joshi@intel.com>
In-Reply-To: <20250227123039.2933330-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB6447:EE_
x-ms-office365-filtering-correlation-id: cdad7188-f2ab-41fe-806f-08dd57b366d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Z+GHfLT82MzJlOuzqR7h9Byby+/U1a19pWTRx8m+aYxPn7lyuqYXiKtVXqOU?=
 =?us-ascii?Q?8IhMZk0fgOaBiKMXk6tdP2WbwoRrfhymr8s2zYqwlrpiiwFKfSrM0uOlylJr?=
 =?us-ascii?Q?PwbAtg7BOxoQ9ukwfQfp3kpy4ACKVL890RiseyxKAqd4+t7eww09u9mps57i?=
 =?us-ascii?Q?MaNlgdqE3QJ0iEi8VSbwDiq7zOuo6RNkYOsSknJTY87YY3TXM6W8t+YmT+hv?=
 =?us-ascii?Q?JlrTQHn82thY46waPvhcOS/AwjLZNosX04IaSvmH1KgR/+m/yq37BwZjzMed?=
 =?us-ascii?Q?QjMMMGDUOb3/6VupZ3Mj1PD9nLfg8U18U3TzG+/SjqNfJ+cO3G8/0en6LB/w?=
 =?us-ascii?Q?vZuMLKqEnAU8c93BQdx4m+TW0Wl0EswCIjyq6IxODmJx0G2GriRDikg5lIUp?=
 =?us-ascii?Q?Wvp2q8aJZlQowv4CECMaQYxRFgi0j+cdp3boPxpdpTn3X1RM4ocw22sxyiFl?=
 =?us-ascii?Q?+jGkhJFIqzDuECKaEkW5i41QTYQNs44JWo7HcT3AfLFLlv1vJgsaS/SezJKA?=
 =?us-ascii?Q?E7SG8bV7+5UMMv5eFf2l6OFrNrkNzN3ZnMnpDtYU0G95frJKu7g7f8K4J0TE?=
 =?us-ascii?Q?fuq02RTQU7gZWVlu0a4fScR+/9HuDpmuU43MAxjXJZpLcNTTgacVLOYYauBu?=
 =?us-ascii?Q?/ZCA9Pw1JCSBz7xKTdW1CTdaFKVumn3TPiExT64vWS5/ocJKsMpIFPSLh2RD?=
 =?us-ascii?Q?uim66PU3ldbb16VZmjHZEO2gSRXsNHj0nK9UevvNeRZ5dwXWM2+Wom0kMmSC?=
 =?us-ascii?Q?Z3Kx83bAWHR33ISGMggDJG9MXXLn2RjiQ7Fla7NSzgyjakQfsLnfzHQ0bAyD?=
 =?us-ascii?Q?rKi0OO3ZPEvgykElEPyJomjmR5faZsCI1npKnS+Z0kMV3oih1U4fXde/IEMM?=
 =?us-ascii?Q?lCmNRjBctdUrt9oko882/aaZY8YH2bkdq/1nvB4LYSkaqDn0tUXt81keAi5m?=
 =?us-ascii?Q?s0khcRNgpHM+wHfNombFfyhvRAAZHHqG6j65+pPMFhHuzpfkrXlOs3VCnc8o?=
 =?us-ascii?Q?n4O7i6rwZROizKUEwkSHirgMXVwp17d3C9XVzIuKUPucfqHo7oVrxZqlOZzn?=
 =?us-ascii?Q?6mru6CGRMqoxTV17OkPSpi+jIT8+Uhh5aJjo5RvEkQh/HusOsSRIKS9rcYWU?=
 =?us-ascii?Q?+gAunF4S1QEvOp0vkfD6XYmHBTi5p0RLb8Z9V+Tsqh36vy72IU8PTVmn6m6v?=
 =?us-ascii?Q?ztzD9Ykkf7ZlMcLFrjVWZcu4//TSd4qVtUIvYaDTeEEaDSJfAgf7kZ+b08KE?=
 =?us-ascii?Q?FfLvxVUvBSUL+HT2lgV7Bc0FlQBTyXV2qnwyqKmi+FXZ+jo/k59EJUwTP8PG?=
 =?us-ascii?Q?6ooUu3+tKs4wiScmmRujwBsn9WNB5suvXU+mG0XtTr/fN1oTJMO1nGmknc5h?=
 =?us-ascii?Q?jt9naUiwIAaGZ4yCduWHfGS10TthcUh8fjj3WgmrruRenTfKoUw4qru8Nt8f?=
 =?us-ascii?Q?ctN4j30+ZnVynasLKzxJfo7FhVchM+93?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XM9bxniNFma4RJvV9Z/fuZ1y+TBlVz9eO2Ezy83RSB37q64iXvevT9898l2L?=
 =?us-ascii?Q?dnVcP5I18kowqnPrhjktImyYcJ9Bcf6xVmET2LuwHu1FUGiz8vyi6tORW1Uz?=
 =?us-ascii?Q?xGAu2sxWrzG8UM2xYVk/RMOiIm3XU8Zs0FVnQAlrhCxYG4HBCyqfzlOWdyzS?=
 =?us-ascii?Q?CCQ7n7swBswhCrri9fTvZIxvsjYgbi2b0udrE9fZAbJGyIHLe8DLhr/UJBxa?=
 =?us-ascii?Q?y5Lv616nNDgQCo5+kpnj3n4dbn8LsHPmZUCjxOKQ/TB5XPpmIQTYlmKXTGMJ?=
 =?us-ascii?Q?3mBFUQip580aM0o5nI99HJfvzc4EBdxfNnoMYOxaSTYmybfhkEezTUwrhwt4?=
 =?us-ascii?Q?lk3kHfWkFrGuEu4s1CLudPyDBxwdvMfxkdauBriILfJeTnjoBWhX1NTO+V3F?=
 =?us-ascii?Q?3qj3dQ6CbDPea+fqh1Jwen3cUdKqjKCOIN4hUTbSvvy1S9Nhsk/gX49//tYj?=
 =?us-ascii?Q?drMNUMPgnqcoQG2X0asCmupXrgmnhNWp4vgfFKyI24SYKEOe/rzjKkcKnbZY?=
 =?us-ascii?Q?iwZhRtFS4qnR1PwuDxkxvy3fNwO+sYsl/zy4YloOg6uFcRdbrUIvim8uxJ28?=
 =?us-ascii?Q?Yh7L2XExb1Nn8ESTqmdWTiTJyYlVuv7wgQoSiAF86p7+BNG9WVs2Z+7c+BgT?=
 =?us-ascii?Q?ZKWQ6GzvcQJLLMtz0T+0MpEluVPW2/sEm1IOeP5ZOlpgVerbChpwTP3Wb7eV?=
 =?us-ascii?Q?TibsK8G40Huy0em3qRW+wjPRCvn8XE5Hc3Dw1iXppJpTMKmxnCDcj9h1LBTy?=
 =?us-ascii?Q?R3ZA+m9JPLGEEbAt9xsxSKVpw9ojofw2NeO3L9RgxTel+Byv9IRQ8osn7EE8?=
 =?us-ascii?Q?A36U8v6oMq9+9cT9qt6SyEDaeZL7vYx7+SiFxkUJu9G6rf1zxod17bAO/9Wv?=
 =?us-ascii?Q?brUwaKRuT6Ue7+A+j0W9fnl3VajbehOztIjwroR2FWEDxSIwSgwMdiDdCZhf?=
 =?us-ascii?Q?o9eljgMAdNdO7g4ama3SkvoW4pGd1+/Vb7fZ6aUEEVLbmibjnyEHcE4qI9OA?=
 =?us-ascii?Q?+krCPu94E3X3HYdfpUW6w2bfYYld0FdT2BgoebOPAsIpm30BoFL9jG2nKhFn?=
 =?us-ascii?Q?XBgFdberjTHa17TlcPfMfCIce0lswVkGEoNswmua4arlaHBuKEtUzK9kZX9Q?=
 =?us-ascii?Q?S0RdfcFpNU/2T5qg7vsbhOvFoFzkhACOdV6FQ5BLB2izN2naaB+DVgfnZN3R?=
 =?us-ascii?Q?O88pgDxx1pbVilaMrm4TDOy2rBm/F8YfKhANmoFwLIO4EvCdG067Av4mQ2cp?=
 =?us-ascii?Q?7hOQ5gvCk2ylXJRCTUcpMkIJUkMasWTTUpNVUI/hA3uo9BtmCdNcUKX6B4ZS?=
 =?us-ascii?Q?lxtGlibFLJm29lE0UXr7vGuAZo/lHydnR+wzv/85cSRCXymgowPvj8BDOjaV?=
 =?us-ascii?Q?1hO1cJkMP5u6l491kDv8AxgEZeQ25RnX5xnj7qpVt6YnFO7VIstutLstcA3P?=
 =?us-ascii?Q?A88pOcDw2TUs9G+99YY883lLN2puN9qBg7x4nNufs3AFovV93alU7eh6ovKO?=
 =?us-ascii?Q?9A6NrQOdgLQq94IettcAilyqkys0r7fx2NHPH/LZxvU6ndKvlOxCYNofIPYq?=
 =?us-ascii?Q?EMn15g+3BvFO40nvJz8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdad7188-f2ab-41fe-806f-08dd57b366d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 04:50:19.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNNlvgDBdKcWZt1QzUp42uhGYPhD9zyxmum6TXj/YsOxQ/8G9KQsq7cFsk+ZLvmRekU1wX0ErwHegycVtLyOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Thursday, February 27, 2025 6:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
> before retrainig
>=20
> Retraining can be done on enabled output.
> Fix test to do modeset before retraining.
>=20
> Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index f00376614..33e690a60 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>=20
>  	igt_display_reset(&data->display);
>  	igt_reset_link_params(data->drm_fd, data->output);
> +	do_modeset(data, mst);
We are performing do_modeset twice any idea why ??=20
>=20
>  	/* Retrain at default/driver parameters */
>  	igt_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
Here also its there.=20
> --
> 2.25.1

