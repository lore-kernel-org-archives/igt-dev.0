Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D81D58D72
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 17:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240CF10E6D1;
	Mon, 25 Nov 2024 17:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uh8ufJHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DFA10E6D1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732556181; x=1764092181;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgJRH6DnUkamrcFh9MuUCKptmoJ0JCJT4KwjyD6vfKo=;
 b=Uh8ufJHMvIEJnSNZQt4F0I6RgRPCXGl804aZykwd6Skfmi1a5vZVv4sd
 DlASytXyoiJTXfYuIbGlVP/dCh/X1n9nPBb1eJU9EiO4prpoF52vb9+iT
 NhF+x4XcDgHFaYlXNJFlAIfXF4hcOfpO58BIWEUbMs3pOgdDmp0IZd3N2
 TzMh63Hp8F6YFWY59lWW89AK/mEEQYdxyaT311zWwIFV5eZ2HsYwdy1ol
 b7FxFC78ryU0Zl9nSo1A9lzzBZNoBtTaZ5Ut250JBwnSO0mka5rnBVPuU
 WOA1CpL5Znt1Ehza3eMr5/6QH4haaTfMIgyyDrqnOmcBVzoitOpInEBZV g==;
X-CSE-ConnectionGUID: zgssWCjoQ0CSDHndGHrxfg==
X-CSE-MsgGUID: 6Nu5MziMRmuunACHaoEWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43745116"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43745116"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 09:36:21 -0800
X-CSE-ConnectionGUID: GhC9DHzlQCWV+8T4qSDLvg==
X-CSE-MsgGUID: vYb7o+4lTrSH1NK5thgNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91800003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 09:36:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 09:36:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 09:36:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 09:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRq3+lmcuPiO3mo3gwPydq3yzXrkCdQPMrae40XZLBsRBfcomOl2RLUKcp1eXKVNtnNaM0lGAv0lCanNW1vKV1dmrF2E6mlQvqz8TF0TTdwpX2NDY3yvHG77RgpJzkKKn0QEPcgooKLlJt6bwE5pbNG1E0nYkDc/ksGN+XnG0EnAOD1WUXLFxWKAdNz6/esNmhdBZilPvJEd7spJWH9Ynrq9gJ99ZkNHQfuUeoNOTZlR2NRxLnEvpoYa9wpu+p9npKk9jmr8LcTfeMyQ9CKvC2hoTzavwTZStKe+e6yJ9pgqvYX14PAK3jcHUJuqORWkePRY3feaUGeOb4RMXvmA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY9nvYEbTOAQ5s40KfQdE63NmWFnxQGTC8rja0VnHig=;
 b=j6G0V/1xzUd93AcN9K3mXzlaLNehTre4uNmfSortWLRRv+JOpuBP27wkLuEMDP5pzVCrwv5wDewJcCCqhQ8W03fpA2S+YEbUvuwF0lppd9XLbitvVbCIBQhkTDldZ5lt1KM+PnN94davhH8jAj0PmzfuuYL4Ye6tg5mWujQGRX7NZYRSEFlI2STX6O76SV5N+jfbXKSzRCjH9ICAc9tcChvJZ1iarpakCMKO2R7gv7Ohl/8wbOOR4uhrflLoKqkyi3uHLaVr3Kd/f8CzfOCD5ErnUm/pGZ4OndY3fF+5mC2DtlmDhtfb2nWaasGYKRMrBStc6DaHXFO0JIaSOlxg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.20; Mon, 25 Nov 2024 17:36:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:36:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
Thread-Index: AQHbPulyFghHsqTczkCG/+X4ODSTZrLIOEZg
Date: Mon, 25 Nov 2024 17:36:16 +0000
Message-ID: <DM4PR11MB63120680914E79DF2142B6A7902E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241125032420.1945935-1-pranay.samala@intel.com>
In-Reply-To: <20241125032420.1945935-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB6681:EE_
x-ms-office365-filtering-correlation-id: 8922f053-6eb4-4c2e-ac46-08dd0d77aa7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?frfuocnstlZKnUSjnsHyAE12LBT/MBd3aiLD7QIk1QIDuWeiLlERPjnZ1dqm?=
 =?us-ascii?Q?+d47Agjc2oYel6WfF5LYeKAJWKHQ6magCOpYcFt7NQDxi6cqGASxiXQUXy4l?=
 =?us-ascii?Q?WEu/mJRSgJGkK2L93iYUB3who7pxKV4MjiFFqBNCCejOp/ubzLDs+HPvCEE9?=
 =?us-ascii?Q?dWfaPvw3q6LBYjFmOUz+oiIDOOxcg6TBLnCSNypUiHJIqk5JZzA9/rLR0Imw?=
 =?us-ascii?Q?HCzqeafAfUrEFCE8RgK55wA+D+lcpadUlAYjUbMsUmkxUDpBTr2cqpiY9zez?=
 =?us-ascii?Q?0Dae1Nyyhh2C+a0wh9nGZVrFpuAk4ESQOFXD5KJDDCK84gl+vJfDUqTWo7yT?=
 =?us-ascii?Q?OM4KrPgjsri8dWqv3DrXTmi+BGfPEIZZXEXOfIdSGiIWwrkiXbwgF8K4/pZD?=
 =?us-ascii?Q?OkFtc5o4AafYG6bBeQUnSssv6XG0UFQ3rNV1XpDqQCNfK1v0F15ZJtmu80F/?=
 =?us-ascii?Q?gzlm+6EcwDqJcsHFk2X6kUmIzcspHiMqDYo7M5MkfiOkITh5drEY15SzKRTa?=
 =?us-ascii?Q?qAcjMhfnXpB87ZjZsqkLvfZ34bPnUiB9NqEkbUIiI09a/kuQwHqKd2Lt6nqz?=
 =?us-ascii?Q?orxIZSvngk4qYn9XmZQLohYayss70wVik37ZD4pTn6NXaCthHuqtZz2Cnmb3?=
 =?us-ascii?Q?hPeRuMtCRbKI6CYoUdcSTDxx8Mi7a9/yJTe9D8lLxBTVsx+rgHw97gpu08WI?=
 =?us-ascii?Q?M89iAF8gDHakuKOCL1hDguA3GYSLeH0BHcJcCCVNPmk2ULcQ3qBl1gONV/HR?=
 =?us-ascii?Q?NhyCV4PyZ14CcRwhNSbcGecR4Hmew5b0SVdi4h6sqGa9m9kaK2UlQijsI6h6?=
 =?us-ascii?Q?fCS1ESIzg3SLUt/l+9E6YQn3vCgUvxV2WQ2TIKaAB9v5mu3AoELeGsdYSfKm?=
 =?us-ascii?Q?XpfaJwmARk4CugMyEh/9L7EjBKwbw+zZ27tfikHEWri8h+8o4E9pIJkBtir6?=
 =?us-ascii?Q?mtbjcSTqp2ovgxaRaRRTs//+GD+RQPNfWA+kUIR3oqDbdyZ9zNaLr4gVcZtI?=
 =?us-ascii?Q?t0qVIegEf6/3/GpZ0C8ZOkNLuEHGKtFBcYB0NqsCWndp4yV5GGvkHWPRxrNQ?=
 =?us-ascii?Q?yF6nIvcMbwPPAJlIHTahfHQvdkNSPYmSYnQEC7kLXTbaEdozAlAGcDy0/bEX?=
 =?us-ascii?Q?a9U1ottWERZ0bek+yHr2k7j2UCDk6vcfOAI9QKTVzF7RRqDeHKzMm71lhi0a?=
 =?us-ascii?Q?J5viWm0J8xlpMuCvkFuindbFl0dDOwokVV89Me2Uktcpi8/z4t+V5J6wreyt?=
 =?us-ascii?Q?PJrsPI+oYwwG/baFvVXJSddNXaVc9RCtdnmHqW83PmYsunxfV3d30uizStar?=
 =?us-ascii?Q?EXpPyOZsorEWmVIk1Rgeo+flbERirFJRJfCN5vBHUDCL5FtKqGZGGJA+/2uM?=
 =?us-ascii?Q?IUzppVeXONrnZ6Wazne12aUt2KO8x1rCYrcqdjV0/VJLB9tb+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TjvSzh2dBpwr5BDnjYO09ybkhN7fc9yBRxGfyTDCbIRRTFO4tqiyTZgqupLV?=
 =?us-ascii?Q?Oe3kx85lomHbnFuD5pXZeZedMqFg/OXIQWuR8P52bdgpHJio51mjalj3bxiV?=
 =?us-ascii?Q?qN1eL3wCNAp/1UX7il60JDKe6MeTD86jyerhML2fvyNLLi80PZ3jfZfzH7VG?=
 =?us-ascii?Q?9mh3Ae+AMJe2Ou5RxjLXXoHxqgfW5CbLgjAHeJWx1U1lpoqW/uoVmSvKoW9v?=
 =?us-ascii?Q?apI8B97MqpSTjOG5DK07Q1betCuHS5dnZ6/rMcQ82dl8fMLV3aleyNkJqxI9?=
 =?us-ascii?Q?x/tJmnV6oLIU7F4epUlPym3adnwlmE47DMK5OFafyEff8droJaXpwQ6wAeES?=
 =?us-ascii?Q?QM08jvmp+yA6G+vrBNL0E6rcFVnh+/e1KGZem8EwLfnzWqfCw8B4eHeXHWnu?=
 =?us-ascii?Q?4/kDPAWY4GZnwdpCW21ATgpa39up9iiIXlwoKg5ZkG+0HjH5vQshyaYgPLXz?=
 =?us-ascii?Q?bu52WfNqV+k8DQE58EicsI5/ssz5Sz2aJCmEU7Rdfu259OpLG8eTzpJ+xhhf?=
 =?us-ascii?Q?c5sOH+bAsOZ/xUQLJvNi+2uPQ7FHG4yUtyNKip4i0EnkP137n7UFH8ku6/4v?=
 =?us-ascii?Q?FiKmujml2ROJchwf7vwyzTV9QKUXXRfiClS0LgPFl7CX0Q3Q7rKjoI9HO5bY?=
 =?us-ascii?Q?2mWjAbFBCe3gGiod4kSF3376DBsHpWCe3N39XRm7sDy41hxTMzaiLu9ZbYON?=
 =?us-ascii?Q?IV14rAkk5GyQoY/MsXcw+aaqPB043BKkR32fVD5ppRyj1gaiC8pjS/67Fhue?=
 =?us-ascii?Q?gsnOLo1byaxAtXTkSvgjYzIduRgeYTYkZ1LlQATu07Wmylq9XcQWB9S0YE+5?=
 =?us-ascii?Q?0LH0727bjIWrLaWAa/k/5FIRUBM17NswMJ2ApWZ1pDcWnjdfsLwoDNwuKHh2?=
 =?us-ascii?Q?WAtFvmSkVBL4muUZfDle3O3291MtyiWo9zrrntJhCqILVKNMZxmEUYd5BIzL?=
 =?us-ascii?Q?SDEhnVrJ66FhGAQIie2T3ZnkQQt3QKsRe/NYQ168SrWGMES14Rkbobtjrp5W?=
 =?us-ascii?Q?wpPT/BdLY9ZTyohyhXj1+1ZlSomkIRIvySKM27mVT1vIw+w1qaaUaj0dCp42?=
 =?us-ascii?Q?5rgnRnXjsr0khXyogKUcSinSMGV8j45mx35SmTyxAeb0bR9OzpXXjtnGxq5N?=
 =?us-ascii?Q?YEAiwoSgOWEaNYuMWwiFF3FVBsxq7tPXCGZPMfgSA7TCHvnU/ooyfB0t45RE?=
 =?us-ascii?Q?ZW+NSBhILDD9ofQXgOGDizemjyzF5/pGvMLbHI9LXZwAKSfQcTS1J1/5z7KU?=
 =?us-ascii?Q?63LfdpFIqAAs5F0QJy/bljPA2j09epfv2WusbpZFIvTHZTbioAgYY7RQtaDZ?=
 =?us-ascii?Q?QXkX1w/TniLZtSgKr7/UeDJR1uMiTJZVDtoekAISmc54/Y5euaVpGr0ak57E?=
 =?us-ascii?Q?wO4L1x4fafksZ/KXsJ6scascVNpgdzUvHAQV8v2laQyUzdohvyr4FRbZJzdK?=
 =?us-ascii?Q?2TItzryvdAwOLYAjCt5n1R6zl5wVe8q0sq1OgoZqh+ZM17KoCpZtfRRZjiTr?=
 =?us-ascii?Q?eqtDnmctUazoz1gUYF15761pQxgGOGEEKDOlxGwI34Ogiea3HIXKcm4XkezZ?=
 =?us-ascii?Q?GjN/qcnO/ALglvwDMIyuh+4hgLjLxeKDZoA8OHOJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8922f053-6eb4-4c2e-ac46-08dd0d77aa7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 17:36:16.9018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gr3CFmP03OO2CYYDI2r3fG+7kLr/cfqxOSWs8u2q93+8puqGx1CjPt9rM58ZUFUZhgHdKBk19uTZd59UAjodjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Monday, November 25, 2024 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>; Lattannavar,
> Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
>=20
> This patch adds a proper skip message which will be easy to debug.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dsc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c index
> 9b48caf76..65b0d262c 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -280,21 +280,6 @@ static void test_dsc(data_t *data, uint32_t test_typ=
e, int
> bpc,
>  		data->output =3D output;
>  		data->pipe =3D pipe;
>=20
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output,
> data->pipe) ||
> -		     igt_get_output_max_bpc(data->drm_fd, output->name) <
> MIN_DSC_BPC)
> -			continue;
> -
> -		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> -		    (!is_dsc_output_format_supported(data->drm_fd, data-
> >disp_ver,
> -						     data->output, data-
> >output_format)))
> -			continue;
> -
> -		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> -		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> -						      data->drm_fd, data-
> >output)))
> -			continue;
> -
>  		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>  			snprintf(&name[0][0], LEN, "-%s",
> kmstest_dsc_output_format_str(data->output_format));
>  		if (test_type & TEST_DSC_FORMAT)
> @@ -303,8 +288,27 @@ static void test_dsc(data_t *data, uint32_t test_typ=
e, int
> bpc,
>  			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
>=20
>  		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data-
> >pipe), data->output->name,
> -			      &name[0][0], &name[1][0], &name[2][0])
> +			      &name[0][0], &name[1][0], &name[2][0]) {
> +			if (!is_dsc_supported_by_sink(data->drm_fd, data-
> >output) ||
> +			    !check_gen11_dp_constraint(data->drm_fd, data-
> >output, data->pipe) ||
> +			    igt_get_output_max_bpc(data->drm_fd, output-
> >name) < MIN_DSC_BPC)
> +				continue;
> +
> +			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> +			    (!is_dsc_output_format_supported(data->drm_fd,
> data->disp_ver,
> +							     data->output, data-
> >output_format))) {
> +				igt_skip("DSC %s output format not supported
> on pipe-%s\n",
> +					 kmstest_dsc_output_format_str(data-
> >output_format),
> +					 kmstest_pipe_name(data->pipe));
> +				continue;
> +			}
> +
> +			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> +			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> +							      data->drm_fd,
> data->output)))
> +				continue;
>  			update_display(data, test_type);
> +		}
This introduces new dynamic subtests,=20
LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
>  		if (data->limited)
>  			break;
> --
> 2.34.1

