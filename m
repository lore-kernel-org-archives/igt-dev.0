Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA88E98FA8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD3F10E0DD;
	Thu,  9 Apr 2026 03:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE8dynO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3810E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707069; x=1807243069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bAmuaGgQUR+QAv9Po0couJBgFPY0Wi9q9Odyga0FIBU=;
 b=DE8dynO4oTW/fBSdynk+7CuiwjwFp1IvjOkDIaleKPzs/rnOkfCjM+sw
 E6eHEWXypWXfc8HS1xQdDCbAEnO17zqGG3b55V7m7DPBwWw4KIVCAkyN2
 BzMoitUcADWfa7rVUvWUhWsx85ycfoH6i/wSbO2ui84lDlg5Xfcw8Z8bZ
 cM7aFzV5u6tQ9aDtNHmeA0T0KsyWF5zgssuHj5ZRW1EPqsgK9ANE3VOY5
 NM+Xy7DQ0mqlxwzDu3KktHIdAYQn8HIZtzSmWVTvbFd15yAMyOe6i4IEL
 lMsUoCluoqC0KUKtRL+OhsLIVahSDBYJ0idIWoU2Ryvo1gaQl4VE8OiCc Q==;
X-CSE-ConnectionGUID: y5T8HshZRxuYZifdzU3chQ==
X-CSE-MsgGUID: yW/xK2SySKeetuCmO2Lvbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102155489"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="102155489"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:57:49 -0700
X-CSE-ConnectionGUID: Phx+Ras9Q2625dIx0CRefg==
X-CSE-MsgGUID: wzymocYJSdadKChbuWLWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="225883377"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:57:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:57:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGFpLIVnKTNZAlnv7gD4dMgxCKXPYBX27/oI89/2nhpjFefBGDR2L4iO7YooqluxJ/Vdfzqs5NH1Uo28ZRAQnrbcjhyy+NoZtJE9tIGh2fEbNy5+kVnuhzayqMgo/u6BViGVEr9KORFFHYNYF83AEVZJC8tNLM5YjkJRO8GyCMUpBb+lahAx84yoAOqllFpKB+/8jGVgGWrP5c9ZL4D2iSnagb52mrDpUwb58aOJPNBqsIjNdYJhPA0vH9paM2p6R+9NcVHOtg1dtAhBMkE2Uu7++7K2EV8jqWx3m3BD2K67a6oevlmLr+ZPaWgcBBlzUP5rzRHpfLwrKK8uwlHjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRaitY/MbmrVT4ukygrVm4DmnWaY2bWJCT0IErtec6I=;
 b=Qp/sMrIBr+DoMEtKu54nFZbVz+MopeCrAkPE9qiZ4KYydvWuqX/i2A5sxNvoXvTN1gCT4z8XaRlGN1QvQqoM5yg5hdpMGbxWGS/5gsM9h0mLeTkvahv3Mtc+3eOzFFMf617iEmzBoU3s2KzL12SFb14NVeNTRf5eZID6SCnwQGcABEXSNt99z70LK00DMUDmBdnhLrYz6UK32Mk435XFkX6nDRhmBrwEoB5yi5OrbxPhvgQwC8Unanfbim+QjQfeI4Yln5OYFItCnxnuTQ+1XmjITMAb2kAZouHW2lS73253JD8ZlUioLvHRQG2dyFul8YZFTKenJURacsTgIQPxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by LVUPR11MB9785.namprd11.prod.outlook.com (2603:10b6:408:39c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 03:57:40 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:57:40 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 3/7] tests/intel/kms_flip_scaled_crc: use
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 3/7] tests/intel/kms_flip_scaled_crc: use
 for_each_connector_mode()
Thread-Index: AQHcx5VyH6L9RGOSIkCm+v4TGhKHdbXWGsdw
Date: Thu, 9 Apr 2026 03:57:40 +0000
Message-ID: <IA1PR11MB6467E68B2F32820F491D69DEE3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <7c82e4cae3069983ae5678208310339c65289568.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <7c82e4cae3069983ae5678208310339c65289568.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|LVUPR11MB9785:EE_
x-ms-office365-filtering-correlation-id: 220b1e3e-e301-4fd2-c077-08de95ec258a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: zxPXQCnsGIc2JFGFwq2fceUgFTd9fUr5sFFgq/G/lUKDaKxMhIVVMxCXJhy7/mVhnzY0qv67UYs2Rg50g2UWDK4c8DUNCZ7/9M/prCt2XUnA+EsuhJyLTMh3s7GpqNfAFT/+sg9Zl55yAvY93idPiAlWq5XF5072bFxoBQB9cxUoaPEantg4+vRf9nbbmnWz5ttRenS139cFv8pJqDA0isSydms/+sfrJLVFM2RLF8+nBtBGZNwFPASzKi7ZhIniSbgMMw2w/422J9IBvMB5iWkQR3N3riCsDVhe4k4i7jlNkJ6Ybq5fEkGlf5anrGhdQ8uLG10QRL+rD+ueccUrjft7XBAIBJHaa7bRzof/Y1SVzdAs8APPw0nS5oJVeEKDlTwzgvDAR7XyhfvYlf8MGCPXpNo3YY6rreMawXDv42uEgtr/N8TKsDirPcFivd7JZs52yuaCwScG+XbjPU731Gq3UBLCFJ2mAVZs6jTBU56KmJrvmvRaJYkq0imQeHsk+6TV6Cce1Eih/5vEA2GQI08WJIyhcJhJxfkYfPac/ydyB+ABFdzX476Z88yUDZm0xkz6lIWBzJvTtuIvIdzG4ErGtyGpxOEiRX8VRtOATWf5Aj9cb6hk94fO/n4AMKibuAdTo2/cUb0B5Xlt9HlHFF7HnpOCNSzSMOGr+nLsxxs9OdOoB+z4gBJSLUfUT9vIvyX9JlxOTEyRg71Q2IniygCMFjiOaK4gybaugo94rbp8ZArm89+lY6QvUoJ7qZZcFcPqpAneRahEB6MnQRlRyvmEb0wf8Wbrok4COZ698cI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AlYUyuM9mrcuCtXFEFHk2eMhV8d829KDevpgVMV/VzthMSdaBpAGRNwLpF8a?=
 =?us-ascii?Q?TG34aNWx4eYN9MZHlPeRNGVqGh+FCBEi8WpHAeY7slnw167y2kGy2TAc+LiM?=
 =?us-ascii?Q?pv8Pov56AVb8+UsrFhiEFrTIVwHh4JfCTH9dmlLSg1rc5+lwzcaEUTArWz4l?=
 =?us-ascii?Q?i25gGwF8fmzgvc3EypYTKLbWAvGf6CFYQIWECMxw+PljdokWXbmEBsecI/Gu?=
 =?us-ascii?Q?R79qjSqNMQodT12G/9b8/nBeRuAxmhCIKTB7rfGYkzr21BbueyhQiHuR8Ea9?=
 =?us-ascii?Q?uc0p0VlsDt0ZDdqZcU1dk46tDnFkj+w3VHH7PuokBIWR19GQi4T0oKvDG6m/?=
 =?us-ascii?Q?57tvtP5AuxtPVRUyG+dL/g49PL69ZubRWWeNJf1GwYD2sBd+C8RMdJb7iluM?=
 =?us-ascii?Q?PxIMLSnR0zmZrLueLfU0IW/EhCRdk6Y1hqkvwQ5XZ+iiu7i5w7MkwnqhZ+ZE?=
 =?us-ascii?Q?1bk2BmQN2qBSumWTFmVrGwMjC/NonUiSczkoUVZNu7U4LP5x7r6UggFdb5IZ?=
 =?us-ascii?Q?6uOkq7RGt+VJfohnETvu58RjH6fir00MLLRYGv9BeMJjELYnc8pjjm6Z8VH+?=
 =?us-ascii?Q?CQGd9bEWstnikn4GpQlNAuih7xjmdSDLTVGmzvfAhpJgUG2njBd4PJM2OT5A?=
 =?us-ascii?Q?+IGfSmofyfsZHrvOpqci63D3V4W7R/HY6XnR/r0GX9GQUs5TAh9nF6lra/aW?=
 =?us-ascii?Q?P4SFJyi1BE6KOOpRpz/PZSgo5WfHwP0oJ7B4ERQAydbF9wTvU7+/2+tEScMB?=
 =?us-ascii?Q?npUWrYZog4/7+8Ly9nLdJwFvROhQMui6mOcTY/m1zA8dKpR9v2wp6PQouNrI?=
 =?us-ascii?Q?+KS55Uc68mFwM/Ufy2YZVYypfR7qUvdk5Md6glMRoVCd3vGjYisVMAB6EOcY?=
 =?us-ascii?Q?fZd5BlNXVvmkb9N2TfYp1rsP+WA3aYebkQfGmOGyXrI6WFxG2wr7Wjqnh6k5?=
 =?us-ascii?Q?5DJKOND3WRxG8p6RZ56Yc+esebAMWf92sqNp/GQh8JvM5Rg/B/xEtUtcWcc4?=
 =?us-ascii?Q?+IXHimNQIGr/j1bWAKpdrCTJVMuBvodKH2n8B2NcbzK/KkhqoWwxho9X4MOg?=
 =?us-ascii?Q?6JHwK5I+nrXK92iGna6YV5aUz8aUc661sQmfD6YStF5sUmG88PifTyU5hRI6?=
 =?us-ascii?Q?bkN8nECFBGtVa8GWmphEHvg6CulCq2bsqgQt66eKcdB5UpbGdJk/evIHXg1P?=
 =?us-ascii?Q?tWmxHIEzSLHufUQdBWK8NoppVPkUpTG4Yyb++QuQeQoWMrx3vfMjIxGx9wY1?=
 =?us-ascii?Q?/mqz8PrYGO52pre7TtoMYudtNopauGq+7fY4IMhtTyHczlFY2l04dW3ssfwC?=
 =?us-ascii?Q?kuHvAa8aA9xzL4nQ2AQBpmVql0lQUQ6wz0rW05HfNvnXJObuxOMNRtcMmagJ?=
 =?us-ascii?Q?dCBJ0x4qOjlx3wztF0ESQ8d8avbpEc2WdVsgW3NMq0ddEoCjKUlhC9eU6gYS?=
 =?us-ascii?Q?63oyrY2W6F+a047HlYbcVJCJ3dAwWNXABi2Md0VDZTfAs9asTtxQz+Q1durq?=
 =?us-ascii?Q?0GGTnBjw6DngoVKF2aJhtjBDrnPNdzXRheQHYAhR9yrNCUCuZdqU8ov2M0UE?=
 =?us-ascii?Q?fIk+UEC1m2iu0YpkRYx3I7WMjcUr8R4ozmOKTdM6w9LCSXZRhB7sJoVrhur6?=
 =?us-ascii?Q?OqnXomOYqlbajQGbvKIEl+CTN/3sd9Jkcy3Cy5NdCTeljnPV4Y3iO+FZBAky?=
 =?us-ascii?Q?VAMADIk7xWsFGWUKlJ0u3uklp/xFpZWyMV97lwktjPlKPi1tdWo/eErMlEOw?=
 =?us-ascii?Q?w6QZAcyUxQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vx/SUhYpYIihKNiyTZ8Y0zz09KImJvq9W+yBUE+OPBqePbIP7ZwL9xw0tu1cvgcPtbu7zLqMmBDN8FyMIf1DBDygUSeDaLVz4uZmWSlW00Jgx2XPMDClIN9tLHT0X5AfPkWFWuLYcGKsVGLawMg8Pwmt3J2WvhAbHTb8SwXp8PliYgPGyE3Mq7bHaL9d5zZw3aTo+fFzGfjtTWBFcoeRye5YI6e6e4jqgshs4ifaAyJWFpm+S1/usX8kJ4g0WRpXkH9/sWuuEIJTbDkulZd/CSmy2uEYTsk9OABwBzSpHUvrhGvjyiMDfQ4dzh6n4tRm9Dxvx8Ns3YTxEQxOwuwYgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220b1e3e-e301-4fd2-c077-08de95ec258a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:57:40.7745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fz8giE3S8L/oBy8oDHS9LMUSd9huzALa28QC4f8XdSPAveHPkUlEDJOygVWE9Wrm6YJZBUJ6iK61Nc1GD7gcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9785
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jani
> Nikula
> Sent: Thursday, April 9, 2026 1:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH i-g-t 3/7] tests/intel/kms_flip_scaled_crc: use
> for_each_connector_mode()
>=20
> We have a helper for looping the output modes. Use it.
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c
> b/tests/intel/kms_flip_scaled_crc.c
> index 18e7b4b5a44a..944dfeede84d 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -836,15 +836,15 @@ static void test_flip_to_scaled(data_t *data,
> uint32_t index,  static drmModeModeInfoPtr find_mode(data_t *data,
> igt_output_t *output)  {
>  	drmModeModeInfoPtr modetoset =3D NULL;
> +	drmModeModeInfo *mode;
>=20
> -	for (int i =3D 0; i < output->config.connector->count_modes; i++) {
> -		if (output->config.connector->modes[i].hdisplay =3D=3D data-
> >attemptmodewidth &&
> -		    output->config.connector->modes[i].vdisplay =3D=3D data-
> >attemptmodeheight) {
> -			if (modetoset &&
> -			    modetoset->vrefresh < output->config.connector-
> >modes[i].vrefresh)
> +	for_each_connector_mode(output, mode) {
> +		if (mode->hdisplay =3D=3D data->attemptmodewidth &&
> +		    mode->vdisplay =3D=3D data->attemptmodeheight) {
> +			if (modetoset && modetoset->vrefresh < mode-
> >vrefresh)
>  				continue;
>=20
> -			data->mode =3D output->config.connector->modes[i];
> +			data->mode =3D *mode;
>  			modetoset =3D &data->mode;
>  		}
>  	}
> --
> 2.47.3

