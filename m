Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C00EEF371A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF1C10E145;
	Mon,  9 Mar 2026 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2sJSuUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7127B10E145
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773047229; x=1804583229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=INs7SzzvYwITbKoU5zxxlR+OqVm6M/5lQeILPwB2Me0=;
 b=c2sJSuUO9vfRu4RU+Y9jyJatTZDqyM0Y0TkHtuAsmuh+RWhriL+/WWL8
 0NaULY/AWK0K8C0b+Hi9hFaKmKzGubSrHS/jxlBW2sWUPAJSqQ17bXjR6
 cK4N+HriRFaWDUb6eGKfz0BLWxDXldxkn24GPEyAa9wLGgMdRY4R5Jocp
 nZOMeyiWwWBBRvvep7mUW8cIvSs4FZSTIE3wpOFcJHkHZvMIAzukKzVn1
 W1ELWqqZ2KstYXstqbP6ebuXfgDPvSBboUthTEYTm3opwtlmRss+K9GID
 Fwtgx4FWlC8yFysNcGTNUEHA1FE+8KDslNvbGmtnt87cYgpF1VoOFC1FT g==;
X-CSE-ConnectionGUID: LoX3NcqARMalToW+wNLJsw==
X-CSE-MsgGUID: Noeo075oQoaHy18EWaAq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77666873"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77666873"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:07:09 -0700
X-CSE-ConnectionGUID: MwvkcH+HR6uFIRB9qOdTjA==
X-CSE-MsgGUID: 392/LqtrSm2VVWgALWkoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224396166"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:07:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:07:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:07:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:07:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJU5Ka+REJNkMK9YdSRAoVMi6PsbMu+prWjlao25EuPfV1fgcXtMwDcsZNOybg2zXi1CN63OGextHohsdWmO+SpZElKojnzJ299wLwI0GrIW+VWAS8hEhSo1aM8kVRkKitdyrqgu245iSrkExvEsKn1EMiWXhxFcapqgqXS2EqMC4XnawmS6T38cqDwmLfenh/U5o9LeCzHwlwvK5kSV6zGMAHXKg/Pfr4aGpvsUxq+J+mZuf/gGB5NRGDUq9y2/yJ1WrQCKbjBfj5kkMaGB6/s9jONi1ruJAFFJqWgQWD54uGY+anWDt3e3uf8RD0wuH3KbsmHg22z3jEapKfCI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmvabLaKsO5bNaUBI6Kwc5a0M66TaU5TMtSOHA2q2LU=;
 b=au9YMLL/gAqXsVXacrJkB6yE9L3SexH1LoZvzzsDsJDmYeI5xaL+MxJUyu8kpUPuyUiVfYqdgS2FVhp6iSjOGfo/h+rWHIUYDl1bg0+C/pkFjk50Er72KquyufR91OVDS5t5v8DZ39cGzJ98su3vDcShtz2uSJc9ttBhUDb54rLYANkRi/Nidx5ftPEmtDE0TKe5l4+fIMjnc707tLhxg9oXmFeUxCcWZKS2DvnOq5/cH6d6ENQNJo3u1R46gmPq6Q0k3qtVuLK3k2XKGKCjmSDvR5AtBVtFvP9hvqJHDFnaPC3BYkjhxsBYcmXlf1cuG9Fp44FbdL+3+IHcGyqS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 09:07:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:07:02 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 1/2] tests/chamelium/audio: Fix ALSA handle leak on
 skipped audio config
Thread-Topic: [PATCH v2 1/2] tests/chamelium/audio: Fix ALSA handle leak on
 skipped audio config
Thread-Index: AQHcrIMesth9dX1Af0e7XnYC1eN8EbWl7o9A
Date: Mon, 9 Mar 2026 09:07:02 +0000
Message-ID: <DM4PR11MB6312221C682A0A5E82382DC29079A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-2-mohammed.bilal@intel.com>
In-Reply-To: <20260305093025.3107101-2-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY5PR11MB6486:EE_
x-ms-office365-filtering-correlation-id: 421dd46d-7fc4-444a-6129-08de7dbb3a84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: qaOynvettVqC3Qp2ZWgP70fnBCOlPytVDYQKy5KykGi0F5spN1FE1oE3gQ4hms44FfNjpHq5ZdURYl0+jH0LSlRhY3laoPNYyQuagq7Lcog2j820JZUEDq7dzhe010GV4aPlerlgKzJ1zdrtIvgdp8/ovNgCsDb8z/K9XRtox8Q+fSE2brYlS72+2A5uovF6XY6c8O5O5I6PZvZF66ZBO2P0pHf8RCFMU0z8UtVzuv28NvDnZECjgVFN2uxD1T1Pf+x3yW3i1ItWZ92AtfnLaqkbMo9ymh6giRIj/1vtLL4nGuA3ahUrq4aukGbasGKGU0Rz7k4sG/IvkheR8PWQ10T1r21pV4xBOW3LLNU8dE7/RnOKVoHVL5fq+Q4vdT2zEscwmEQylssjNcXkvANvqgtgSN/tfG2OrW22PkXdQhLEHlTd5aL9el7PzzO7pWhSreP+BHsUQMOSFaDKfW+gHjsNYpd5dxP2v6ULtBbis/IRJA9uyN4CXffyc8n+bxSOR7aW/3LzDPxs53b+UfzN0vHUuStYNIAVJBpY1QEKmUZPY7s3GO91hQXfY2CUenVDiLIX5BBnitlPZ8r1R7LP7z+XXdrxqVassMemmRa3Slrk+EC1nEStvjQ8v/3HTymsSxWViJvmimHSLJjIopS3be9XkpD2AzBIK3AP49NKeNcYIRS9LnAg9aQG4GpIu+97jUej+p+aaf5U0KSe0l4IxaVEFPHMg4qZu3YPBUgODaJ15LI7a3yb0scoLQQ7pLLiJSC5gNtu9vLD6ZZpueC15hq/z8TQI/d/dwYSQxRReug=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FoHw/xjCEubPxe0CUMKxPEld6xaLJHDEYdBtr/eegL9ME7nXr91uoaRpNq0J?=
 =?us-ascii?Q?cpFEHUb2HEje2SIh/oSMGmyMhkOPw4b2IaSeY0t4F+Z4k0V/XtmpVDJHiOkK?=
 =?us-ascii?Q?kNFn5hV+pa/Ry5O+xkDV1vh0eevcn9pEhDCilSRAQVJgYjPoU0CrVs2Tkvf1?=
 =?us-ascii?Q?6jJwq2MYO1kuYMKNPNl72GHK2nvz3Nsy7ODQT2nAjvIE7sbDBnQDe2UJNPAb?=
 =?us-ascii?Q?rcLrywWdCA4ISXJTbERO9oP1saOHAeA4t11e6B/jeufUbgB4VRib/M4z+NAC?=
 =?us-ascii?Q?W6mP9W3HKSu9kFYt8vhopXk32PeRqTJOAybvGJD3yLaBAdyPC1EC+bYQ/btE?=
 =?us-ascii?Q?x10eqXyIrgzYi5wONrKzLo7rujs15DLeMEyTljsDJTwsEcfFrscYjLVzK+xS?=
 =?us-ascii?Q?DICueeb7n6kpF6lwiM78qd9N+AeZWkHomVGWsnABKb4cN402s0FhCZMVWCnT?=
 =?us-ascii?Q?o9tcw/GeAqfh6rTIvSWdJb3D1nPfwwDEJSUsoV+ZR7Lf5XJ8t2nCPGZQ+aq/?=
 =?us-ascii?Q?bUSc8Ym/2EOWXf+o6diMzbhA34e+DcjgvVxxnnk/n8WPP2sMMWH3U3lxY5V0?=
 =?us-ascii?Q?Z7ikrsqo/LIcxrWIu7wmod4X3IDTxl/sVCgET2NEM1no/+FUzVnIU+Iqq0az?=
 =?us-ascii?Q?tWM2cNA6nv698Zu0WVNxw3wjIGDwqMk9gWkDyZ7gwtoZy234MxD0ZW0UHiZI?=
 =?us-ascii?Q?8Wk9sAQHJyWWAiUWeRh/ptPB5+q3NWmzMyk/yWxKF0BqLaWk5z2LQ3n8nGmS?=
 =?us-ascii?Q?CAgXId38nV6U/0XGJz+tsTOcKuobkRrK4IZQF0+u0SKEaqiJvtzjDD8VDlws?=
 =?us-ascii?Q?Rutf6FC6W7cAYjhvPYG6mBl6FQHlkgw56mz5FWW0piYaL20WLBEYTy+tFidh?=
 =?us-ascii?Q?67uM0mJ1IPF2wW/t6SXC7IJFcVbNfx+92GadMsu5GNVLuEN9hoyknk28PsLq?=
 =?us-ascii?Q?IfO+qej3u1zwJVBUBCPSnfdKRuktteSatozMJr5fopJcyPpV+OqQ8pVJvbbP?=
 =?us-ascii?Q?x7Fw66c8y6AItuJSy7jzbTBeXLlH906pMJ9nFUmFl0n3ibWrjzXuqh1Ml22t?=
 =?us-ascii?Q?P9ZhHemMOTVhltiHjEpVUMBpyC6sJ+fTKtNLEd9bGP3v2f9lhqJ8nWBqkeLG?=
 =?us-ascii?Q?7nMvXVxyb+ixy9UEZHjuC/4VuQffEBdvT1C5GDNJX29gnR6nqOGD8z+pOgEU?=
 =?us-ascii?Q?FCOKBt9Obij7E6N5nK9wELIBebZv2FcQay70d+cWD5L9K5B3fy8A9gbS8ztb?=
 =?us-ascii?Q?C0N/ka42gVo0s00GupI+7V9Q9wVziL8O1FgPIRxuSKRjMEWozevg2XIMdvIT?=
 =?us-ascii?Q?bh2HZNtULNI67FpqcmGlGzcfeMRy1pAGcdgvFrQw5edNehaS418rLprwpBjx?=
 =?us-ascii?Q?WbZXeuu9J5XFLovGu2fC5v9eDu9kh3QHHpWV7tuup6uUlwcCdL4+KoGT6t0x?=
 =?us-ascii?Q?kV3wTb3YO6ZkaMhLEjlBBqujElvKgn+gWx27+ttxd99JdoCQafcPwaR25Z8x?=
 =?us-ascii?Q?Hw/OBAH31TylHg195R/MgKDMN6VKd1tSP5jIYqR6pOyM4wLUfJlQEPT8ksxu?=
 =?us-ascii?Q?838Vw3os4Ud8eceVN9qKutYBLOszhQ7Xud9S/id/twLSZsnN1lkHL57aAelI?=
 =?us-ascii?Q?XX6Ourm/nXtp4bYVx4qiocCX4MqJBhy2FzWfd/cUYxGTk5cBzrIsLKSdL8uk?=
 =?us-ascii?Q?cs907dK0wEel0UsIyxl5ArYm+tipfGSsl9Euvfy1llFtOGL6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ajw50/5fkwaOy8tpCnFvcG0Zvr0E63Fl8zZQN2srG3KEwa31UVh/1uDL+OuOKK/v42yEP1sXoc5Fd67E95EWwPcNwOBNrnTeTcHA8gg1aASlOgi9XMejjW9no9nk0W2+sN8pcCUUhY9ukqIv0VSKZbAzRsSZrc6L89lCIfj7JmG3kt5zgIT/carMsP45tgfnWW3wcqPaQdRCcCGGM+ns/rpe9fmsuKj0skyGJIFTjjSSBsEIycAveNOi34O5QP4EMUb1pGKBHqy+0W0PJZZoUycAO8Gd3T7mXCLjTO7s9EE0hwCWuQRgBNPjpCyWGhthw+1BQbj24QfYFJf5e91HgQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421dd46d-7fc4-444a-6129-08de7dbb3a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 09:07:02.7184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8Hv6LvXByPU0GoMPUcT4+Qr9c+DEyclJOVmMSJeJa8Uec9MgSMXeLIg//hc3I9qCc6yZ7+sNrrjLvvX5YoYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Thursday, March 5, 2026 3:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> <mohammed.bilal@intel.com>
> Subject: [PATCH v2 1/2] tests/chamelium/audio: Fix ALSA handle leak on
> skipped audio config
>=20
> When the audio configuration check fails, the loop continues without clos=
ing
> previously opened ALSA handles. This leads to handle leaks across iterati=
ons
> and may eventually cause file descriptor exhaustion or configuration fail=
ures.
>=20
> Fix by ensuring the handles are closed before continuing.
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..2967e3c50 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -762,8 +762,10 @@ static void test_display_audio(chamelium_data_t
> *data,
>  			sampling_rate =3D test_sampling_rates[i];
>=20
>  			if (!check_audio_configuration(alsa, format, channels,
> -						       sampling_rate))
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
>  				continue;
> +			}
>=20
>  			run =3D true;
>=20
> --
> 2.48.1

