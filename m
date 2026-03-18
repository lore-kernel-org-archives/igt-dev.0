Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143DDFCD0AE
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 05:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FDD10E634;
	Wed, 18 Mar 2026 05:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ssk7sF95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9410E5D7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 05:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773811061; x=1805347061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QsLci0xGHLtbdprLGAJmTuOdIN87JZmItQgwsoBFUDI=;
 b=Ssk7sF95USEyggC6RPad2NYAlV4ac6WfTJFRXmC1l+ehOiO84xaytVxa
 NLMXLn38LJJgFYkICFMbSDIBz4NDlzdqdVghkbuUfswQulDpy4crhZ4wN
 YIc0VgNB4ZA0w2BiW33p6fThnfyI54KV4POCiBl1gdTWsJkd4GEuSJTaw
 gy1s4xQjmvszEXqf0cNMUN5zHMGPXp60E3Y12DObWp9EcvtrobeR11Tzh
 MQDyddSOU+UmnJ4vZkdnqeP5P6lXai/5OW/2rqWwxCtSWGDehRfMWWZ90
 tOL+SG/+zC7tTyuEM3hxVFur9jFixePQOaVEzr07GkTR8lKd3HrlpMjDY g==;
X-CSE-ConnectionGUID: mNac1mFWR5SpeczbXS6Aew==
X-CSE-MsgGUID: dpSClpRYTJa/uaDGd/P1Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78467009"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="78467009"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 22:17:40 -0700
X-CSE-ConnectionGUID: TVCmwKDqRcyyi3n76jWlbw==
X-CSE-MsgGUID: Fflv5vkBQdyN2P+X12ERPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="218551805"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 22:17:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 22:17:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 22:17:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 22:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY05E33J85vnxCRT2cioct31eHznnQSQnqfxZraEhhu1+9ZuG9oII7L8QsBvAQ76cLokaEgWpdLQGK/kMPVPRKV7qr7KpMRP0oftyhgpNZx4KtTgO8s9jDCCjxpvpeArUq6HOw5h2SJHbaS4Yq8n8QxaNNZoapaAlupmT8xiqdPJPPyeDMMHpwpcnDPfS1FT/RtkysqxVAn1p+u4j0AhOVxzvrgSLCAT1xQPkk9wxsdZoXGhL2XAummRtxKt79/OSn8+opWW3YL+0oF4oh0K6+sBXHETb3hrXZ8eXIgPI1dsXAvvG9TtgpqiSPXjRdY6PK3+nHpmN9QWUvyB7H7BCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZTcW0N8qQsRRdYS0sgLd3PT0ONKOVfvtqhySPdEGoI=;
 b=Yvsb3Ptl508QV4SivxllPI+qFVvQlVPyWHRVI6QFeW7uyAqdpWtB3vpawXvXGhFcN2VBxb3ismEZqpBQZv9KUeDRUMEECuwx+SDYHSfrHU9Ss9auWg2VvyyPSyIqOyzZz2EWupV0g7A4JWd0FJlf9vbG51sgySTOAsBfWvBaJPdLrSiJqPCUsBePvOBf+ddDLeWyyUo/1o24vi8qfIYlb36bLjZAitITP+qejF3RgTq6xMur3T+P1ulkCYANyOZ4zJCgmNgSkKluXA5+Vh49nkKGSdNYM4Lf7FREOu7LtePB4OcSlVkqprMEnbB0R0cmVoSFNwKinbB5bN5bchydMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM3PPF9C026D2C1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Wed, 18 Mar
 2026 05:17:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 05:17:31 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Index: AQHctoVH1Zi65qmXS0y5kL5eHlsICLWzvsSw
Date: Wed, 18 Mar 2026 05:17:31 +0000
Message-ID: <PH7PR11MB6053731DD661F60E71105563E74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260318031205.70655-1-jeevan.b@intel.com>
In-Reply-To: <20260318031205.70655-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM3PPF9C026D2C1:EE_
x-ms-office365-filtering-correlation-id: 2cfbb944-2d7a-47d2-543c-08de84ada7d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003|7053199007;
x-microsoft-antispam-message-info: pe6lq82HEiETk6hL9HNyAn9VRZGsIxv2ajTLtWY5e0pUWQJk/3Uan3frOltn+u0+QuRhgEo+JvRc70oBJlHLT9Yykin+MBRQHRvNd7TGrRpQDt3mMI2aLLb43Bgleu9NcM3rq+MFp6ZIA/C/pfuax/vrd0aDGB/AsplH5GYH4ZNRaeU49K30s+/oiSN0z08e3OjDJZTTF9v5ZElNk41/lZcSeqFCMivua7hKsUuoJcWNvOl+j+AMvA5kb9uFVVAMOsXAwZil5i+2MtYAZ4NTWfPCFIgJofMz7wzKEyEAnyONl7ez8svBkzowolrdC9cQyglPav3kKU6wpHO1iILx/Cy5ROU1lBxfuMiREXybG4TNN5EvyzywxA5B4Fi/BiQbpfSeiaTuIF7iTP5D1k4gqJAQ9MT751U3kERJLic4wu40uzAyq5uMkMdGzbuq7vOuJ2MW9/y/yevllOcFP9S/w5jZntwfeXG5hiGb3sb4SDtWwBKWy99BV6YRtuuxnLrzHs9FwCkPI0bG7UE8alTF7ChHu2IczE72gpHsuROM8hiQxYpPOI8C9QamzgGdXryXPrUc75oCRF4puOtgSQrL2o35Z9lqfD2DIktGxHPY5/Jf1y0tL0Zlfu9eKoiH8/HmqYyGenMmOxUIyn+HFG83oUNYRCXHII3pEisCJjswhb+AqSwVFyK752LFupH7Dq1OfoNc7ELO0KfaMeV+PG2qkebcTc3Ruiidna1M+Vn8P8hwUIBaaXKUkB9r5qMYsvjP1c4b/LK27Idou9mojWo/mYRgNdo1qzNCJybCZ3C9rZE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EpyZl+zVOxZH4sHGHmRURUC3oVp2YKhAEmIAl+7kn8Pm/lw2OIQAqA913MOU?=
 =?us-ascii?Q?LbBo/n0P9/XgdNtmv9gzxnBakPD3QVP6L4gaYv326aZ8/7I50aTxjRu+sDAt?=
 =?us-ascii?Q?B+q4ZdXPL5fbkB99/ZwvPgi8xj9LnajOPXmmqkFwlAsLKBLmhzwth1tZORaT?=
 =?us-ascii?Q?hBDvP32eILgMW7SWYkxV10lo4ja079h7tuvCtjUKvcy43Cxi9PybnRPqUsRe?=
 =?us-ascii?Q?2IfdGq8twvYqfJRFnVKM1Xyoq/TQruSdg5P0NOykth/PqDuDuSS3aF9wBzRf?=
 =?us-ascii?Q?uf/qk2ym2oRpPXUHc+zMjk1SP2eONVzxWTqwOWHL1O+3AecUiCPEWRM0yIO8?=
 =?us-ascii?Q?K1wPSTgcfLnxcbYZYGaWZuu9pAo7+trK2PeHRuYFVEiRocv+W1Dgu48h7xQS?=
 =?us-ascii?Q?6nzcw7Ln8ICVm3DnkCpJ+N6EWSMhw88sIHAxUcdYaCjk4pIryPnUIhFh7cS0?=
 =?us-ascii?Q?/2IZjEkki897Fol+OF6HNxrQZYJKuud2vEmKwYrIE8l3n6qzEs8Bmq1vZcKA?=
 =?us-ascii?Q?RITM+C3vHA/8IuIAyOncZkhO+N5mAmr7nyZxfjytSRHUX0pUqr8+oWAsWMTl?=
 =?us-ascii?Q?UNiweKIRWpB21sSf9Zh5bIC3yjzUtjYZDvuGWpiejJkB/D5p622QGzCqEJJG?=
 =?us-ascii?Q?rVAEri9dngP/cOYv4Pqy7JXtaakPaELfIZ6X2B7NCmlMOIRDQ8ZWMGzd7g09?=
 =?us-ascii?Q?hYkSqYYXs013ZLYSa9RQKq2VFwZPCOqZkkC6kgPqW4BGav5I8TcIii/V8gdO?=
 =?us-ascii?Q?gpuj8r+ZJrk3ZcwLimkAtHAN6vDwkIHr3J8ZET8AdtEWZOwYKqRxMqzzqhV4?=
 =?us-ascii?Q?IOtAWT29DWScKKOQH1/Hq1vJP9HaHnpSJcGkfeWFmgtZf2WFclufdoVuzJ/X?=
 =?us-ascii?Q?Fak0JeMPUmHgrtww1VATuKHxoFljRJMGO2fjPsdYmMnrXNpX12FZTAvjC5o2?=
 =?us-ascii?Q?wwGmaC/TMOPsca8DaB1H2mT7ayaG6Mcjw0hgQ/oK+fGmU/iuB5zgv0dYLs5F?=
 =?us-ascii?Q?ucXqjbBP0iforFe/LsTHrYv00rkukgBj3TZAv8Ix5ItqLLP92LxcGoSHrZw3?=
 =?us-ascii?Q?EFm174Bec7Hvai4S2sMoOCdjcSwtOk/EE/HaLIGiRLyX/vo9zHQGb+wjXnjD?=
 =?us-ascii?Q?00/fKdxheXmnNYcZUCRi6t1/NWkqrRgMJFiSQ7DkYxsku+kYqhaGR9fU139D?=
 =?us-ascii?Q?UHdC9EgHtnkkq9/Jkfuhi7Pk1lIphPbJsqmpS0CCuaVSF7oMIq0a7T+5D/4a?=
 =?us-ascii?Q?hl3oSeFUAPJkDEwt9r3hi75GAux4yWB9lQT9tSB5Q9GAMfujOmeoI2uPjJY5?=
 =?us-ascii?Q?NB28lPTe6ARHVeamOC7AmIOxOnh9EoAx0EUhuTUuKqttTH+2f/NdRMYdWyMr?=
 =?us-ascii?Q?bLW2dPA/94r7coeCdZ2ovMQPHMurqhcrmXJdCwghsv55nnaab8WL773j+Yfs?=
 =?us-ascii?Q?PtvsAyRehF+lE9L7np/xJSTYwM8yLbGGw/OrkNUyaBBAXNshAmHI20o9P2PS?=
 =?us-ascii?Q?E8VLwMAVZNe2n8ysnPbLnVAC173OSvHWw+ZCq+BM4J4Hzg/tk3OSq8dUoFHQ?=
 =?us-ascii?Q?NV96zomj725BHccF8+iz2AM4nTcDZLvixBu1rliMNnkYYIoSmlHDl3Xx8O1k?=
 =?us-ascii?Q?eATnIyCquXEH0ilRFER40Rlzkagdbk4NE3XKoh4Y8Q/L3ETNlkfvR070V22L?=
 =?us-ascii?Q?NerC4J73A4iEswS/XSYsdt8qFcNc2D6aDUY6fLgM7KgbZYFVF3TjBq0ogNdA?=
 =?us-ascii?Q?8ggH0QXSTg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qUrmC0FfiJ0X5Rrywg9cC2TdSrJiOjLX61cjxa6PTsbs+a073fj/O55t9vRCEx84TcJXTwPt+BY1ROei3Kq+OYHHVnNiV2d9Wyr2WU74/rpBd10oMCRvU4Kl96BYYDoKepi8ztcAYwWhgEtPXhxNRXmxpMhmfDFy8W71PZSd2Br+83SQDEACLZ58b+XzyvYeEj8O46OSv++tumJ+cfgvcr6/aZ7W3W5YtcFwNAqrEHkNGhemlEhJDzM75dCbiiZ5G9rBcCGTIj1MbzB4LudFri+hUKkMYB9IQ94TxRdr1ViA3BipZ7OhkY/oJk1z111/Htloc7sEcEWsDpj+UFmr8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfbb944-2d7a-47d2-543c-08de84ada7d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 05:17:31.3041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anQNl533EfZT8nKV2KFKIunsJaQ4PcKRcxNWFl3KmcRq/GhR8TEPwiSxw+rnQllSFsrEesYFK7ZuIsN2IdzoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9C026D2C1
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Wednesday, March 18, 2026 8:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helper=
s
>=20
> Replace NULL with data->output in PSR function calls and update the log t=
o
> include the output name when PSR is not supported.
>=20
> This change ensures correct behavior in dual eDP setups where PSR support
> may differ between displays. Passing the specific output instead of NULL
> allows PSR checks to be performed per connector, ensuring each display is
> evaluated independently and accurately.
>=20
> v2: Replace NULL with data->output in all PSR helpers.
> v3: Update commit message.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c index
> b85e09346..b5de63350 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -120,8 +120,8 @@ static bool check_support(data_t *data)
>  			return false;
>  		}
>  		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> -				      PSR_MODE_1, NULL)) {
> -			igt_info("Output doesn't support PSR\n");
> +				      PSR_MODE_1, data->output)) {
> +			igt_info("Output %s doesn't support PSR\n",
> +igt_output_name(data->output));
>  			return false;
>  		}
>  		return true;
> @@ -150,7 +150,7 @@ static void enable_feature(data_t *data)
>  		intel_fbc_enable(&data->display);
>  		break;
>  	case FEATURE_PSR:
> -		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> NULL);
> +		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output);
>  		break;
>  	case FEATURE_DRRS:
>  		intel_drrs_enable(data->crtc);
> @@ -173,7 +173,7 @@ static void check_feature_enabled(data_t *data)
>  		break;
>  	case FEATURE_PSR:
>  		igt_require(!psr_disabled_check(data->debugfs_fd));
> -		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1,
> NULL),
> +		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1,
> +data->output),
>  			     "PSR still disabled\n");
>  		break;
>  	case FEATURE_DRRS:
> @@ -217,8 +217,8 @@ static void disable_features(data_t *data)  {
>  	intel_fbc_disable(&data->display);
>=20
> -	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> NULL))
> -		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output))
> +		psr_disable(data->drm_fd, data->debugfs_fd, data->output);

Passing data->output is clear for psr_sink_support() and psr_wait_entry() s=
ince those read output-specific PSR status.
But for psr_enable()  and psr_disable(), impact is limited today since curr=
ent control paths are still global.

Regards,
Pranay
>=20
>  	intel_drrs_disable(data->crtc);
>  }
> --
> 2.43.0

