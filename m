Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944FD109C027
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 14:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3CA10E20A;
	Wed, 25 Mar 2026 14:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPS8Ojh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BF10E20A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774450160; x=1805986160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+WwKUiIlhSB8VIzxbiaF8675DaV6YaHrodL5SalrPM=;
 b=cPS8Ojh/SDSsSl0Y0Ee/Vx1tMGLoT46hx6WxBZL/bsJiB/D/UaWZsEXZ
 pcxX86Qi/ba64rAidz6aTgoH+8EHjcfn/IM+nuQRfTJ9PyUB+MyyycRN4
 KFHcqJLc/EeymPaRCVz0XaIbyMS8+RcySn0YIallsgltloXbfEo5Dt5/i
 ko4L53yalEFKIKUQrKBKaM9S5EXJOPU8mAY3ImlfPlJ5h0TkOMEvKYXhL
 B8dfxIe2d1/RhzW4oqvau2kCGuI9hsm3mTBn5l7HZtgenfGWUnn5/5KsP
 UXX7R3qZMAC55XGVG2JtYD6413tAcO91Yfb4gikHy/2uqJLzG+m5tcMYs A==;
X-CSE-ConnectionGUID: V/VUmr2mSmGQk3qO7eO9Tg==
X-CSE-MsgGUID: iNYK5h79R4Cfic9wO53SKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75605711"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75605711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:49:20 -0700
X-CSE-ConnectionGUID: DbTXT/HJQmq3Ke/kopO3TQ==
X-CSE-MsgGUID: 3z4LDjBcQg+8S7RaQEm45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224655567"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:49:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:49:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 07:49:18 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnVpnOfK+yOP52psQQcQRhEyl+UpygeWRIgNwIbrbSO1mm9uTkkk/GqPDk1o52GfYoBhoB75MVWBhiQR/gJ3us3P9TQi0PxTtHVTRFky+xA8iybn8OHGuFM5EjBevYhc0mnmBSgXRSpQPTaoru6LXMW/+LZMMs61LL3K/aRE3hDg8XO3GDzZ0uoB3eZIxdxl2Vv7Y8iyBmJNoQtujuxSbajGJi2EdfblRFbRbHEeCaWBleepJveMIbE++tNhNGpL/4s98NmNmAGOg6xmj2FQaTEjk53zhqDS6hjhYAkYCbpT7DK/6bNoXsjGfj2Ouy6iQ5EtpGo4GpZHEoCc+ZlsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOTbrkUBD3mVvhGqxl7HMDxMVZDQJCakQ6cfMS5Dzqg=;
 b=kotcFVhhRAJ2iTS3kZ2gRWroGsVhDuLFQtgc8sjdTg6TfTy/TMiYvvLzLBUtBIzIySHmun3fHD10zGOs2Y6tql45FztDKaipOSrGk8+78i5sn82WTCjhmDvVHw+vi7POuqPPYyisuaH0uBJJtkT5dvvVxvCP8ol/EngOPO9ToEnD+8FX3PXuqZot/d7sEPKnmmPkh9dfo9CuM6ymXZNWdTS7ESeri6KbqOr18Hr3po2uXW/5bLT8hiMfBfFzpcnTb+FJZvnQrMo83ghE1OaBRfRT8VqijAuaQd1T0tgd77ecezXKXXUdu/WT2inFpuvdG+xqFqdXrA22bjyzOUFniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Wed, 25 Mar
 2026 14:49:10 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:49:10 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
 unnecessary PSR disable
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
 unnecessary PSR disable
Thread-Index: AQHcuqWMrlagEcjQHU+Tb2mx87iwP7W/U1aw
Date: Wed, 25 Mar 2026 14:49:10 +0000
Message-ID: <PH7PR11MB60537107B78B57562D3DEFFCE749A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
 <20260323091205.100585-2-jeevan.b@intel.com>
In-Reply-To: <20260323091205.100585-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA1PR11MB8802:EE_
x-ms-office365-filtering-correlation-id: 4813699b-fc7a-4cf2-16b1-08de8a7dacc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003|7053199007;
x-microsoft-antispam-message-info: SJmjhcKR3dZNhZKn5BdOIAHGXIiY1Is+qwX0rG6NSjnlyw2uBruhEUZElQT/Mh8AwVVFu95m3AmH6zdCV1jws0RtHnfDi32fesz2Ht+zwZ7/ceOhila/XFvFcYC9HaRf5XOb3k1VkFsSviaGexHGpaj14Su5/eHBQOoBj5fDf51osOdSV5HaSaQeGlyCUz6Qp0omWBY78SrU7svSQFGkeiuDdgZkuYq9f9JOt823uPo3zO30ZFEAVN7Yaw/F72Hb5UHBHzGerZKrh7jPKuLEfldgbtrCcc/7XUh9hGRgM9tLRzOkMN1FyN4SlVWJfZD2pXmkwKVNYpRemp7AHQ6veFYsorW+cXVTiYMDeO8BRWrm+4eHko8vN4VZ1WFVZfXHLuq+oFpbQzs4rl2dGa8gdZ1/EU4FCqleecG2H9g9Olih+ViIiwZwpvm3TE6MSXN7d7R1We8aOQ3c6DjNzIvLoQ38/boAJ0Y4MkYHhh/QFqCIdi9H5NR9sYrtnfyhIqul3GuzadD8/1rr6/iJtQJ+uD86KpT7gKf56daeaIasVK/DXqi++RcHkXV5JWx41KRVeEXuBaxHzqkrs6r/GxSZz6DvPaigWHmnX3HRcNRbgb8QEZtUe8ZhiQ0zc1dHex70vCIOkqyU/LppPNoXBVaEoyT3UvYAJXrzy3GomTxsdUSHfkqZogbTLUDGmWTj8CKuKe+7rOMgDKRWyIOHW2cK/mjZgLV7aJExuTTasjYoeG9v2Owu65W+aAyC3iuMHb8oksciOoeyDkF/6hTfjit+TncZskPjFkZK4c/k9692+C0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+PMGj6YQbKT0IlK/yZLL0ylZ8VSWLw6r1DfonQN86AXo4VFUw1yL1OCK17u?=
 =?us-ascii?Q?sCCsDxw1WHxlYbg0axFoZcCt0uozFJyrwyxudZxox8Lq+9/jgveutC38g8Gm?=
 =?us-ascii?Q?J+shD2sOsRqyCd1XuQluLoR2sCX9m8noenvTVuxMAmuBC+mTka6OEymjHA9B?=
 =?us-ascii?Q?mW0pP2s42a2zYN8McIrivUxm9vti7Z2r7lOeRYI9hULZg5R23iOQFGRjXBK6?=
 =?us-ascii?Q?959h0y+hpfyX4YPld7j5thXBJOAP8WI2lsOisKCs2q4y4E0yZTyqQyhMAYEk?=
 =?us-ascii?Q?XH5oVu+JSdgZatMmvBjfNyCp6W1UKxkdhkGIxweDnfGITmZqVO64aH/69Mgk?=
 =?us-ascii?Q?0EQSJ+DrJzXS2xpfRaED5xoaeD+rG66HYtlwAZieA+djYN7rol1mC7n3W+wW?=
 =?us-ascii?Q?OiZf81K2Yv2Gr4LIgvTarBLG8nVXEcvXTTTtxWEtjGQ9wWZfabrJ/Sav72X8?=
 =?us-ascii?Q?OwQXDqcn2v6L2H87A6oPG1TofctWHZW+be4Hu2ojuoSSfcBK54WwjemVraiY?=
 =?us-ascii?Q?5lJXVENLpzGb3btxV9s9funL1hRHaWkv2mGGc1cR+RbZURkqbkQu3bpnZIFb?=
 =?us-ascii?Q?TtaW9ckz199YPX3JHqCuXoDtCtnIVpvXBYjrxHnF7/x6gCokN/fB6CJkvxvt?=
 =?us-ascii?Q?EZ2B7OGtjTyO3F5L/Uo3ZV7Jz8znCZ41klxxeIDb+0UOjdq0s1NOarVOYU+y?=
 =?us-ascii?Q?ZI4f1zY+jKOy+QIdXjN4q2pPt8l9N8jxwfuys0oJ6LoPuh9wAhHONQf9oai2?=
 =?us-ascii?Q?fCkvnraqEKUrzOrRsRHAme/SPrJxPh04ZO0jzjaoQVQzxu7y0uO6VDo+tByR?=
 =?us-ascii?Q?o1RI7JMhOaCKeH93mXGwJQxQ3DVS9fOSlsvcOdTajZf754mwug/F4Gd0XgNl?=
 =?us-ascii?Q?iHgRHDcy6PSuU4jbCpVwOWWhjiMbUhDEU9EF6XzQOyiylG2s9ll/P25i27+U?=
 =?us-ascii?Q?nIBFuMWHEevNEWP5BmlhnsGNECSDcXBe0mqvnHUjfsu6HlmHMvi3ZFFlpe8J?=
 =?us-ascii?Q?JRLYVOs7A75MmIFyCKQXj3KGMKc44/ls0M+Fl3TjQLiI+hmVRMHQBMBvD87X?=
 =?us-ascii?Q?fvtF1c84y43zdm5RxIBkUFG1sRnFmvbZLo5xHWZTo0BCwTnG896wTbwlLP+e?=
 =?us-ascii?Q?CSHiWlYWtXVMcnsFUa7uKNBh3L8GVoy4ebjwcEZrtnm+efBGDB7aMI/ViDZU?=
 =?us-ascii?Q?ZwPuaG9hRfxz92rZpsQcSakPWykdEvplyY5QZCupLfToxw9EpvsVWh+oGly6?=
 =?us-ascii?Q?J+5pzHic1qXub59sq74dMTmcjwW3D/KUm/UHm3I+FaXeTPLVzR3dgCFsNNYp?=
 =?us-ascii?Q?DsvTfPYz507vejgSAJEuNGJGXeWIeuLOpph+g2vUAvJY2TDgHD/A32nQLHnS?=
 =?us-ascii?Q?eJMXlLManhfx8kTnI6QEFCxyPIk6wvwOigQs9o59UQSiCebd2YgLs7WH+rfG?=
 =?us-ascii?Q?epKEeQAJ7acMLQdNISu+qromv+lGReRxXjMRfK5rIHxuP4EtwHu+0CfV9fBR?=
 =?us-ascii?Q?lKuSA/mjsqxddkHaT65709OsbgGF0oLm+mgNIYl4AgH30g9gFmMnaZa/nevW?=
 =?us-ascii?Q?YAmkxoZRM9UgVGa73+PSeHcGYW8m4F/yS1jO7uBDKIc2eCeshQgndp0IWTtK?=
 =?us-ascii?Q?Bs/t7WvrkbwTCvuIGtXdfqLznQ06cnDy3DobXjqWGLk3jdMxomHbFrtX5hDf?=
 =?us-ascii?Q?mNQygAbPmQoruMa8ppXT3iRKdLhMdLzNHLHGNXL5eIBrhoq5a6l6xVvv1DVO?=
 =?us-ascii?Q?zlt/uvBxSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gLFH+TnlCKOym0Q/326IQQmlQKWs+7Cjgvnu64jgjgGvbA+NkLL8BnZiInFnptpEhA2Bpd6xGL3au/QdzCT4MWyoloACQgFiGSLHR/9IMiEdgx6IW2BvvBeyyqRiGygrhoPDw9yT4wN/7wgecnsg9LtGkza89eYuvZSPDiiS7TfcWrJwNM4SzkuWMPOR5CF0OGmN6CNc6pa6/ywTt/fIJNQs+yLSs8LuegGs/K16i7oURLrwchukCTATMN7byHpcRuOT+du7ZMvCPRGzFyMXnrI3JZ6Gbm8Tfv7ifZS3Z99v51sY5H+DoNq0MPb6Spq8SD1HrhMq1ABiwRJgGEPTgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4813699b-fc7a-4cf2-16b1-08de8a7dacc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 14:49:10.6637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuqUnyJ0MDkGE+Kkv1JhMmHEz+ESnsk66iJyThAr3xvvUszZyDwEYZ+d1ljeoEXOt2nuJ/A30TjX3lI146xujw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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
> Sent: Monday, March 23, 2026 2:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid unnecess=
ary
> PSR disable

It would be clearer to highlight in title that these change makes the PSR c=
heck=20
per-output instead of global.=20

>=20
> Pass output to psr_sink_support so PSR is disabled only when the sink
> supports it. Using NULL performs a global check, which is unnecessary and
> can be incorrect on multi-eDP systems.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_fbc_dirty_rect.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index efbd46985..e7634dbab 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -414,9 +414,9 @@ static bool prepare_test(data_t *data)
>  	igt_require_f(intel_fbc_supported(data->crtc),
>  		      "FBC not supported by the chipset on pipe\n");
>=20
> -	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> NULL) ||
> -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> NULL) ||
> -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> NULL)) {
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> data->output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> +data->output)) {
>  		igt_info("PSR is supported by the sink. Disabling PSR to test

Should this log message include PR as well? Since the above condition=20
checks for PR status too.

Regards,
Pranay.

> Dirty FBC functionality.\n");

Since the check is now per-output, consider updating the log to include the=
=20
output name for better clarity.

>  		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
>  	}
> --
> 2.43.0

