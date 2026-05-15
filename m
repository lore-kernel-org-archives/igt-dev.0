Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57203CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 05:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477A10F3D8;
	Fri, 15 May 2026 05:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyPIIFPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B06C10F3D8
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 05:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778822823; x=1810358823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TTcbAud521oQY+Rj00SQBY/0n7Yj2KIrkk/B148Jmss=;
 b=XyPIIFPLJwhCIFH9829IsNxbhNFHwmwUM10uG++xr817pBFnOeDy0L87
 1UzC5y+MooeqSQdhILBklP7c8JVneZIt/NMCZYa/mkcjYEpYF418xa0XS
 TAQleW2uXNz1tERzKjNoC2d2TZ5GisJ/MHkbHV1+NeoKVfyF+VjZgZHrX
 zIDdiPSUsf2u7WgL2f4NCtV+DZ1Eyq23nLRUn19WICNPCoQPiNmTU7HdM
 ZpXs8EZs/1aks2HxvTYrd8LH0B2006EofuY4qK4mXYcQX5V+bpMN1A1cb
 WHccEexPg8XWdteilEwGLuGqPJLDB1dXw6snh/W6P5L0EsXkMkqhR9A9m g==;
X-CSE-ConnectionGUID: 6ZekpKB4Q5K2n2DmZcmPqA==
X-CSE-MsgGUID: N+GfXi4dS3+fXtFP4H/Ecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79490052"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79490052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:03 -0700
X-CSE-ConnectionGUID: sOgY7nz5SfKA3q846ZOvDg==
X-CSE-MsgGUID: HWJQDoEwS+y/4yqm45PYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="237602514"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 22:27:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo+ggckZfgswUyWXr9Kfs5z8bpBieOLk2f77YqEB9jW3rnPgErGMaQWJMwqksR3ex2zJJMHQho2R8eXDvK5Fe7PDMTXI0UqTEIyR0y9CzQRCT0WSWcxZYzKE52Ypb06A3wAhYI0BsbYkz/9U49yVFpSAofa/fG3moZQmpWduErlLSfCUp/zOv1e5a8ykGqysJ5iKazla2IqRUawVkFicnIU9qTpg+6tzCPi45ImibxXYdbcUIpQWu0gMCw0cFVzC8tAawQt/xLJrneRxFBzimu46/9ffeg4xOKtv+LyhKEC4JhRa0l9wt/maiEaunK4CB3OQP6v35B2XYCmwBv7wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnS8iCRwShZlBHAWfQEdWF91etRPwJG/UzUkZ9s7JsI=;
 b=RRgRG8saNw9I63GOnUZmt3GBXO2reKingifEvzpiv9nSLwYPh2CY5iudhj0RxhmfhD+Lb/pDpOf3sBcP4DKFd89+H08S/e9GDf4pRRIXFz26isVvkt7HHK0f+hny7mHesxAZP8nUdVAUgo8TdTdGuzCPkzETh/VJGX/TiWwlC9DZrf+uzeDJJ+7YhwCYGh3TF19D2Ea78W8qm3Dse9/roneqGL0HOpmtOtDNjdiXrhXmEhEGdPzwZwSffcBBeF/hHV7S+1g0gvRUULMtSZmlYiIlzVv/enho3e0aWqNm0+DlqjXjMdvXQvVJ4lxM1zBJpHpT8yt8O/WQnZvcuPolRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6429.namprd11.prod.outlook.com
 (2603:10b6:8:b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 05:26:57 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:26:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "jason-jh.lin@mediatek.com" <jason-jh.lin@mediatek.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "fshao@chromium.org" <fshao@chromium.org>, "Navare,
 Manasi" <navaremanasi@google.com>
Subject: RE: [PATCH i-g-t v1 1/3] Revert "tests/kms_content_protection: Add FB
 cleanup for MST tests"
Thread-Topic: [PATCH i-g-t v1 1/3] Revert "tests/kms_content_protection: Add
 FB cleanup for MST tests"
Thread-Index: AQHc44XTEJiiapdIbEqySK5dY+0ym7YOj7MA
Date: Fri, 15 May 2026 05:26:57 +0000
Message-ID: <DM3PPF208195D8D5E3E21CFC4B55F121ABDE3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
 <20260514093510.688396-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260514093510.688396-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: 82089445-69d2-4ad4-7074-08deb242956e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|38070700021|18002099003|3023799003|11063799003|22082099003|56012099003;
x-microsoft-antispam-message-info: WM8oGbI+Q1/tCQVGa+EUACGC/kgYOVjDQfq/Ge0bp5WhAmbQG85BHcUEkXCGKWFkkk30CXybCtWx/liFoDQCQSyz7l0t/vV34JKo+S9QnZN84r8u/nlr6QXrLGId3aIfLw4qp9dYbTJH31EM+zmTxO9b9w6GZbZry97fk7CMO0FjeX7sVqJMzA5ix5ou8fwiKFV3IEhCEfmmjEa4byUEkojPcYcmOTUFlSyrlKgiBsE799BvhzqdsscHRjOjH9mPwyhgL1YikHi3tm3b7eFq1P9Xu0xNvFqtBbuQVgqsRyMavdTSI5tF2/lt68yFiH1JDDZeBBXtyaxMDuNyNVMpCtgqB6kWcANSHKfSG5EMlMLYgdfUKbLipgxLvoxCuB7Y218H+NBUou57psiJFJW1VkMvwt+VEaR2mFhhFHcJydayWHtAR1DIeyByYpjd6lHSJLnL35boOVFbqRimz8P7GoGUvCZgXEs3JT8MEMq1mfbKCDnTQ4zdUPf7hFOnEeSa9SLLSeX+GrJsoEPAU5pThYV5ccbevNAB6uoUJBtdB+GnUskW3+QEBnIhyFIEWRzU2kJs1wOKcgxlvrW+iV7Y8FobNlLKQ9ihhGsCxAD8FjNK3H9yitgkga0Ctt9r5zo7fBMVIH64TT9A/iSnn4DMWkpivJmXoQNQRak3D45am/nFi0hDM2JOcks+jDwa1CU4HkJPku24xuSyNAMNq34Pcfu/HrFtQfxE86FjfKUQe6K+uJh8X5CbnFZJQDDTUo9u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(3023799003)(11063799003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lVZK7aAsoisMhVNS7vakTrRnAo1lIOQ57ORGrIYGhVlm5Ze4ec5LhSKBC87n?=
 =?us-ascii?Q?8QMawrjoeN3WIvChez9KrFK4OF+nXdAAEZuIoVtZhyQRhmP+FwJEyO+LZaqr?=
 =?us-ascii?Q?++4OOBveZbTeTidtSt5WFj89+rdD03++7e5mzIaS+t+qYdiDz/X4EsrlwTZ5?=
 =?us-ascii?Q?0KYPDYnt6GzEUMB6mkv/SvuAHSRflg3prTWuI09+zfgaHCdaV2UBOBNDjlNA?=
 =?us-ascii?Q?HGQIM6xAsG63Bz6XbRw+dQNiGbGuPNGBebg5Fao/2w67KnlXBdRkvCdouIAa?=
 =?us-ascii?Q?Pi8lHFyLHeAAZlr7Vb8+PeGrLb9cWJ/cmgDYsbyBAfVBEbwmKRBSmxYJcY0A?=
 =?us-ascii?Q?a0xQc+w7ahv04OiVQzVXLu0Ch59xOHQPbg4pahbf/Vojhm5dOYM4QiYLXzUc?=
 =?us-ascii?Q?FSIUGJP9gpktBsU6MBdJVXj3pWb3rHA8pAyoLjlQkN5BTNTpFbD3Jyu99Yo7?=
 =?us-ascii?Q?Em1dWdFMcULF3tmEfsvcRJdjF4zBBTwlCO5mINY+lvGfKoCMqIQYHf5I824+?=
 =?us-ascii?Q?l9J9/pjpyUrvj7WtU6qO2qk7SvDCGRMdM7sUen63JVwQ4qDs4PC7XLL/hev0?=
 =?us-ascii?Q?CCCseG25lU63obP1fgDuKz2YyKNJXeMhHwxDRek4F68Ng0H6RPNaBtVJ47zA?=
 =?us-ascii?Q?z6FnwF6vjgLIUn0Yftrb1+r0AVsgiV1tOlTCSm4D1OKMpLiUQqJhDST+yaZC?=
 =?us-ascii?Q?C0/eFFzgLGh8qytM6lxitM/DX+elSnF9goQrd28/boSJYG5CElpwfco02ujN?=
 =?us-ascii?Q?MJssQAGkNYNXCE9/YNBWJN7GDh+jhH6VYdxtRR45SJIa0v2UMBAPIr8eoU3m?=
 =?us-ascii?Q?rt0IWpoSefCxVX+tPB4/eu0qM4rdv0SSLe/eIEzqXCaf9pZIQryghIoXJ23v?=
 =?us-ascii?Q?lX1Qf6Q6nPstq0G+9m/GvfvZoxqJUcNlvDT2qmfGJaa8UIvo6M60CCv+0eWl?=
 =?us-ascii?Q?Dw3pEKgl88zE+/rkcXyTabIrwPTPYX0fX2uA0b3XeL8OpU/D0Va5vdvoBaa9?=
 =?us-ascii?Q?3gNUfmPnZl/aOeWMhgZL0D1NCTYrzYsGU5jpA2o68vO2HErqN83PPaFEl4zh?=
 =?us-ascii?Q?dKF2rdlF85S1JtLu7FbyiUw+5RNjuCFcWyQkQ0+Ux3+eLBNC0c4xFvQuiTnU?=
 =?us-ascii?Q?uqhonMIcDbVOkwuV5s8GSpt0CNDMr+9nyokPUslqc90FbLn1AaY6ZYLXZ1iK?=
 =?us-ascii?Q?RsE2H1q/wYOJzLr21Ot6V5IkTuYrDZGTokwjEDbdQ90Tfhpk4zBk0pQF9eBP?=
 =?us-ascii?Q?ah/mAsYH+rH+AjUGgSTjKxt/6xN28+/lgoCGbZMbAqdcwm/UGSUoXO/U3hTW?=
 =?us-ascii?Q?9bpJcsbYjaRvHvT8w0SCRbxjhK6FlZdh+AefzRzxG2OtGMOgqzzWqcwC5sXR?=
 =?us-ascii?Q?nb2I95zxnTnwz6nUx9UJY2fZcYcm8fw+JWNb4oaSLU24UsMZNPBTICHazmy/?=
 =?us-ascii?Q?7oQ5BQvoG0kNPZcydwuagwemkg11PpmJiV2kfKpx6LyAYYnerIWc8fSr5Pkt?=
 =?us-ascii?Q?tILD0FK6J49xcqV0giDjmHVGAUipsKcSEGquOQAVwJJqSu7zXNoLLw10BepY?=
 =?us-ascii?Q?RWkZoPsd9X4J2d7IeAaFnKuuzo6HGRoEx6TaaFUUeW2nDi8N2FXJHZkrjyRY?=
 =?us-ascii?Q?koFnCDmWCoilOwXtu3jscGDPbdObrB9/gIFUu88bFCLcdlouRBigV/OFgDTu?=
 =?us-ascii?Q?wcBtuD7ZmXQY7NEtxnTwNkthOBh0o8Sr2MWsNlo1sl2x5P0I5Fuq2Sxme9J5?=
 =?us-ascii?Q?nn84bkJDEg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jYCeFZjQyKVaH0Mffv9Mwaaz81/0Hb2UGR9tqFfGSCjNGuR3rd4WaxaQzuf7GKb/xjHao3Q5NpsEchwJaNIozsUZ06/QRNEHEZmQablxD0KVmI4WQjBuwEAZES+kaf3GjYTQuCb/IiVGyPh1QVFvJgBwhsfjYUCYpEDV0RW2Jm0CP8WFYKNkj39yZUHm80kzIjDzfcVEIItt24+wx6bxFnzLQGVum+krNDybQ2c2GaoV+GzeYoAf8RwXml8YNajAXwJo7qHtI4ktkh6HGQSbNtou2QAtM4FwySC4JjeVdhTv+e4ya/SXF9I5jUdz8SrZe1JToMFB1pyt4Fg2Jxl8NQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82089445-69d2-4ad4-7074-08deb242956e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:26:57.7256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMh7NPfNY26U+FZ85O7+T7x8QAJeP7Vp8AhOemv89Y9BBnRCLrIz8tbueSZm3VlK5t8vgma6bRIAJTD1VRsusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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

> Subject: [PATCH i-g-t v1 1/3] Revert "tests/kms_content_protection: Add F=
B
> cleanup for MST tests"
>=20
> This reverts commit b4036b1a0f1944b6149e479629ef0b10ec9bd520.
>=20
> cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
> cc: Fei Shao <fshao@chromium.org>
> cc: Manasi Navare <navaremanasi@google.com>
> cc: Suraj Kandpal <suraj.kandpal@intel.com>
> cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_content_protection.c | 44 +++-------------------------------
>  1 file changed, 3 insertions(+), 41 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 36879c192..cddb0b6da 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -945,33 +945,9 @@ test_content_protection_mst(int content_type)
>  		bool found =3D
> igt_override_all_active_output_modes_to_fit_bw(display);
>  		igt_require_f(found, "No valid mode combo found for MST
> modeset\n");
>=20
> -		/* Detach planes before removing framebuffers */
> -		for (count =3D 0; count < valid_outputs; count++) {
> -			crtc =3D
> igt_output_get_driving_crtc(hdcp_mst_output[count]);
> -
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc,
> false);
> -		}
> -		igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -		/* Need to re-prepare after mode override */
> -		for (count =3D 0; count < valid_outputs; count++) {
> -			drmModeModeInfo *mode;
> -
> -			crtc =3D
> igt_output_get_driving_crtc(hdcp_mst_output[count]);
> -
> -			igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].red);
> -			igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].green);
> -
> -			mode =3D
> igt_output_get_mode(hdcp_mst_output[count]);
> -
> -			igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> -					    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> -					    1.f, 0.f, 0.f, &data.fbs[crtc-
> >crtc_index].red);
> -			igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> -					    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> -					    0.f, 1.f, 0.f, &data.fbs[crtc-
> >crtc_index].green);
> +		for (count =3D 0; count < valid_outputs; count++)
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
>=20
> -
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc,
> false);
> -		}
>  		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
>  		igt_require_f(ret =3D=3D 0, "Commit failure during MST
> modeset\n");
>  	}
> @@ -997,9 +973,8 @@ test_content_protection_mst(int content_type)
>  	/*
>  	 * Verify if CP is still enabled on other outputs by disabling CP on th=
e
> first output.
>  	 */
> -	crtc =3D igt_output_get_driving_crtc(hdcp_mst_output[0]);
>  	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]-
> >name);
> -	test_cp_disable(hdcp_mst_output[0], crtc, COMMIT_ATOMIC);
> +	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
>=20
>  	/* CP is expected to be still enabled on other outputs*/
>  	for (i =3D 1; i < valid_outputs; i++) {
> @@ -1010,19 +985,6 @@ test_content_protection_mst(int content_type)
>=20
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
> -
> -	/* Detach planes before removing framebuffers */
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		crtc =3D igt_output_get_driving_crtc(hdcp_mst_output[count]);
> -		prepare_modeset_on_mst_output(hdcp_mst_output[count],
> crtc, false);
> -	}
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		crtc =3D igt_output_get_driving_crtc(hdcp_mst_output[count]);
> -		igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].red);
> -		igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].green);
> -	}
>  }
>=20
>=20
> --
> 2.34.1

