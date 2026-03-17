Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F52F506CF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2030A10E0E3;
	Tue, 17 Mar 2026 05:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vi7bzDvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885C310E347
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773727097; x=1805263097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YuxfmJ+wQ+PU3y3bFwbP13m+Qp1dGo5Q1UpMBA8AlIs=;
 b=Vi7bzDvBecwsyPyZVAIEI1x+h0Rb64jd4PmOUaBgppBu5cdDq+XkBH+N
 VmxI23SNkRpf1gWibxUYlvjrk8qVoKlQob/xgkF5ii5GhId30lliEok64
 /YdzkqcgnRoLtpO0LeQiM8sCJjMj2LB4zr/VGBrXh+Ouq5fwCMbYWV66G
 14mn/3leHJf9FuHMsYiqcxknk1zbSivifmZX5JHG/LFbMTIJvA8I9Lbs2
 qqdYu9eq5ek115fA2k3zPoBvQYt0l8AzLTOkzTQiu8qPK7BisAUZxJcTu
 vdsZhBlnTyz9ZNhpVWBO36333nCF4ysbye8ZyJN4GTbICwc+2FG+iqzJr g==;
X-CSE-ConnectionGUID: 01eOYMq8SkOFPcTpFc+YSA==
X-CSE-MsgGUID: vp0jL9xhSU+p4vFFKuEdgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85447625"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85447625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:58:17 -0700
X-CSE-ConnectionGUID: z+5GBSzDRqmru13AH7+QFw==
X-CSE-MsgGUID: we31bISYRAC5q9pNnimG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="219286761"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:58:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:58:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:58:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQige/3N5CsakKMpu8w66zaZnXUquwywyyIehJjkXxOgkvshud0MI/5MJM9swpfk7WCS2SXLsusN8a6gqF+kF9j2TVmvkkhEfxQAAat5n31G1LmEzovpfOajYvdZgIfFOkwXXg8CEaqr9hVT8O/xx+izBtMzjsF3GgsQ5GC626VeT7SFZa59xdDSpWjn8+6KtCzgXATeDWVFkboQIc2VgoD8obRjjr5QBeSu60+OyNqv++JmZuS3pl6eC37ADLcS0kkoRlScT/CEAVocjm77SSui8pc9RNnRNAKv8Z073wc4eooI10Qewg46rjkdsxQGijXcWUO9RgBDHyMp35OO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFmD+OBI6e5uVbZNiJ63q4OnQepW1UHbEkrEXRLYhVU=;
 b=RM3O3EI7wPvwIMK7DnLv/9wtvqIvWgUr2cRKZVn8FD8xBN82Q9tVYIkEnIsx092tj3XPnAovn8DNbd1KRJ0GofkTp7c8f9E9v3EbqRtsBct0eX5lpstWRusXlJ4uES+/EbUM3Jmfmyt9sl81ENFCkCONRh0gxhoW83SPyeluZf7FeTK8zl8SGvoOrbhdgQiXSEbdGs6V0SVlfRPmPFWCfV/hMQAzGYGyPAPD3ews3pfn52dbSeWYvCoVeNLnDQkuY1noShMQ5FbXcqV7uWE0kYi5rVOjwvgSFXHC3VjdpeOy4LJhWmmNpiQiZBRWy4OqUvfDP7yvJTwWY4r8ZzadIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 05:58:14 +0000
Received: from LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::1f72:3d49:b6ba:91ae]) by LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::1f72:3d49:b6ba:91ae%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 05:58:14 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't
 support PSR
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't
 support PSR
Thread-Index: AQHctc/z1RddFLJmTESf1htWaAdTBbWyOdgA
Date: Tue, 17 Mar 2026 05:58:14 +0000
Message-ID: <LV2PR11MB604595209F1B21D2B75BFEC78141A@LV2PR11MB6045.namprd11.prod.outlook.com>
References: <20260317053132.61166-1-jeevan.b@intel.com>
In-Reply-To: <20260317053132.61166-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6045:EE_|PH0PR11MB5176:EE_
x-ms-office365-filtering-correlation-id: 89b88166-f56d-4dca-9b91-08de83ea2daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: pdyNBee0AkkJup7k6rv9m6v9NJuVnY/WGtTHlMGvxjJLlr4gm2vEQ0HCfL5TuUIkI4YrS20ZumD09GxFsQYy0YhrIWZZFBDxTVI8BmNvuPmsxYR/Bw959wJ3ESUlT3/0THL+yIMuXvxjXAwfU6h4bE/OtEeDwvBaUI7YGj6YH0A29yhzfSS2Ne9939L66zwPmZsg4nWZneRnuSDNicRttXyBij8hcE3uopj7ar8aZeLluP1iXTCTOhtlviTAvp3RXHsSJQaY6DboqwPQh2bice1YUffJK7Icam771jeR83C6fevQymRgFYWjIH0MqynoRtZuzieQtp8dPTyJoVdzruWVnaJNm30yiEaWOEknUN0L7VcasXrao7DQ9RjDsS1AXS2s/MLOzZjJqqThO5bqLOxPD1nZgYgTphcGpsXYNYU7hDJKvaj5bkCk8xsn5zHHzoIJGKfD03cDkPLEtENaX8Q1jpQVR586bttN9rqqMi7fsTWjXD42lhnPEsVqiCMH7iOX2z2uYrXmVutea+d2l/mqS+QsN1Dqx5sZcDcoUBgF3fEJ8H2+9jsfAi0QTLjr2gmIIGp4OPKSrcHDb6uPCMf7KIShcP2xlHfxmY4DaXLGbvFRsTfvGsiSy4t7+0/KhynMuk9oc0SCB0K8gvnJpyjQPx765xvuxtGJfTbcaGU1YM6llLWyBEFniMqlakZm0uJNT+U2c19TurnLGCv12rqUObLPY3nQwPsbmSjDaLHbtPXP0An4XNluVLq/MVAIVilE3WkgCe08FD7m9kaSqaT87FiVY67skn+XLmYZkrA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6045.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M6TAMp50RlI1KUS23qLVEwcyCY8u/gKz8X4cK5GL1yECGC1zktJM6DlAeGw7?=
 =?us-ascii?Q?o2QKeqpwbXif6S22UG1y1rXNI4aAYMGZ5X0W7DW/50bLjpjetXpLE0Wda2TA?=
 =?us-ascii?Q?VfwhH9k9aDVAvdOrb8YDy6GyL3LzpPbh8mN5A8j1NlfuQiHcPRcE9cDedLwq?=
 =?us-ascii?Q?QswwmvY5MFzzGLZ6tUvarWUMP2ErAsT0qsyckSNBRei8r9i5eWX7BtP4/Lju?=
 =?us-ascii?Q?eJVFFVNkF4o+S1EHFG60yNUN6hCxhUsC8qI7ydutrIrWO1GKBOPAnNmbBZD8?=
 =?us-ascii?Q?8Uf83f/fzfj5DwMwlDLQXNE9AvNBcUgHlCRXpbGdcQujah3MPZMR8OQLJ2UU?=
 =?us-ascii?Q?JqQ47X8qjq0ts3ymcsJexXCs2nDdu55ZoYfb6vLTn0v4Ngv51J+slpQtTnX/?=
 =?us-ascii?Q?+K3XEx1R2dmUoPOeYDTZ5sPbMhmOhhsJiD735AoLDjKr9yuyTP0FyHPAjfkd?=
 =?us-ascii?Q?DCCWjwuKqXNY8IqTkxgrAxubqceX5B91+8Y/qcM1hQYDz463xnGfW0HCAGpJ?=
 =?us-ascii?Q?ScL+xUX42wVUChw0zehZebFpTJShXnkBQHaYJI1v0MP2ree6Yt7T/rGRGG1M?=
 =?us-ascii?Q?OZw5XoLAnezR4foMKKJY6rExUpp215zztI89kns8BLarVg+jJm/NNaDYB93C?=
 =?us-ascii?Q?duXgrKrFRn7G1PIlQdDjARjQv39pQC0RPsDoj8r9UjL8cKf+WgE9xt1QWkgI?=
 =?us-ascii?Q?IMFtgLw6Z4+5PCi1+BJaYhL4cF7FdxPHAwX0m7qiXuHvsqgBycRSiEFnmaa+?=
 =?us-ascii?Q?vloMZZtvpN690OCo0YwRjjuufzMv9dd7AweHNuOUusiv70mJdAlu1US8Pztb?=
 =?us-ascii?Q?I5zU8OjX/L2AFDoK2umDB5iE4T3sScPNzDTzyRrz3tas+JydN2xWIWnkTcaT?=
 =?us-ascii?Q?IcJDXzD1ewokx4dbxQRFACk8HBZnca07r3VpQ0rgqVFf8BozGg9ys2zilP4Y?=
 =?us-ascii?Q?6WTqqS6WLT0m1igeRFTnayRLogDRuchC3m8Plo34rEBy5LiB15Zm7oFSPxAe?=
 =?us-ascii?Q?QDcTSMK5c9QNnofmLr/N+nSvRbXLnHK+Gu9hrwDBXJ4I18g7IJocmZ/nw1X1?=
 =?us-ascii?Q?Nj7M6tGQ7rwSKE3vDfgwAOd3BEWMp07eAMue7NmROOnIre4FRnCuTW3A896x?=
 =?us-ascii?Q?+3h4o8FSDt8FEtoMQQpYtfEzYx+yoB210vARRKlG8nKHIL6J9iUSUo8DHom9?=
 =?us-ascii?Q?pfgbLOB3T0ZM7OHpwspvx1EDP0AYoDAaeWl0x82qwRdbZ8ALmV1oSuLVIEIR?=
 =?us-ascii?Q?aYVYXa060LBQTrAAyrSZMR4b2ganLJl2jw9Z7Aq86BrNpRkt54Pv+CnVmwLa?=
 =?us-ascii?Q?V90N+kB0cHANMj6e3j7oAKYAD6Ef2ssiO0HT2yIPhpDl1J9qhUplfZ7Cu4o2?=
 =?us-ascii?Q?8Q4FQudlTeU7dmusHwrAEcEuh4vKw9u1MpXG6XZYxUJp5LDEWNS9dEdhE6CA?=
 =?us-ascii?Q?Ua3tr+bMO6NQbY8egIK4uZWg46TS7fzu4BpIsP60OIzShOYdmKh2DtIf+SsN?=
 =?us-ascii?Q?KcEkMdV93YYhKeGxMRRMd93F+c10SPgPiMq+H8gK/20mL4ssVyYk+FCy/EJX?=
 =?us-ascii?Q?e6dXj/0dEtI034KRnp3y6bJTqg4yGNiNmC9cuLckER7ab17zGZmOql/PrdNy?=
 =?us-ascii?Q?uvwKLaFDS3JheUG0XvX4HpSCkvaUBl6oLB0G/J1CK9dLkDuAURyjGltTfDns?=
 =?us-ascii?Q?mwIoaHiAR2AxtKOFbVo+7XMDmikTSYkKbIuRSrehJIwiSkDXDIE9w9h9KYXA?=
 =?us-ascii?Q?oo5xz/zEeg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CtBlchT1gloHs+kg54rfaxbfPSrNYbRimnwnulgWvKXUigrFRaEKhQwCUmTyiWD6G94voTlnGC2FtjaymGFvnOdnL5mQGZscF707/Fs9pCSGZ06yxhSXCYoPDfD57PfbgbPEeWYLz4yF7lorJK0AFx3lvLGdFaZL6+wT8YT1JFgtfxP5zT3wy3tT4myEiU770IAG0N7qjwGag0nYHdxRAD4F3ga0lgvvc9HsnZIT+1xCdm/sPn7lvt9tKpIDWDsrjWErXaF1ik95R28Zjdd3zx3ahkoOiN3v72ek/RcJdHYP6speO1hB9EvZUnBmsPFlVcldsY+iTnsMXRbXe6t4vA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6045.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b88166-f56d-4dca-9b91-08de83ea2daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 05:58:14.5093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /tA0i1TjucjNeXY3RHdSWHqoCDau/9y5OWK367uI+c1Z2RCJVESAbdUM/o5IZFGGxlrCvd2FLiMeKsTtltE7UuUnNOPgfSCfJSUby/I4S7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

Hi Jeevan ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: 17 March 2026 11:02
> To: igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Skip output which doesn't=
 support
> PSR
>=20
> Pass the actual output to psr_sink_support() instead of NULL so that PSR =
sink
> support is checked per-output rather than generically.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c index
> b85e09346..36eee29db 100644
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
> --
> 2.43.0

LGTM.

Reviewed-by: Mohammed Bilal <mohammed.bilal@intel.com>

