Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9097AC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 10:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BBB10E74B;
	Tue, 21 Jul 2026 10:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPGtpY5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C2610E74B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784630886; x=1816166886;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XLiW8svw8CHNoAQ3LE76UJfL74Mr1rLlFYMWN/Nk4YA=;
 b=jPGtpY5d7xZEmr0MEl3SI8689xeYQf/yPD7HEC9xZ1YBpaWqj06nyuVt
 XcW5qyq41kgcxt6gHREowXRZEBX4d7riRpbGQCdtUCnaZXIu+iCYHO83n
 RWFeQDquQin56H2f068fUasd64A9vtgEIWV/2jj7Y2TUCxdLwY1HRcy7R
 qWEae5AsmfIrrRTETEKFZ3KfD9W1P+CKDHPt4d7XWrcnt2FYm4uLM63LV
 qoO545f//f3V5zDMPVRHrDafv8hvt8JGNhf8PQEu6uQ+phCTELAMvlajk
 xNDCt1Phqn+p9omUCjk40cN77TQZtHSlhXZEUopFWWR/I1110TgFP6aMG g==;
X-CSE-ConnectionGUID: B0aQ45K8SduI5vrVSvLRtA==
X-CSE-MsgGUID: JEmO7unVSjqCadwJpRRapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85425996"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85425996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:48:05 -0700
X-CSE-ConnectionGUID: pqbZS5ZQSFmZN2ZWc6AS+w==
X-CSE-MsgGUID: kkV9pQCkTaelUVmqTpyxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="281001897"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:48:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 03:48:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 03:48:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 03:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+DHEnrL/2ITsOI8erIPgcLSdfJ2AX77KD9M7vL6mp9AI++AtNPCVNXT0uCSI8I26GvqjCFKm6F62Yf7W8QaslM1YEcLJ0/JVuBsDxydBvL//R+GhAopek/Uxl6zhJbPILx1xWXTzvMK7OtZZRUz81TJXeVnn1uY8cqGtjXEJS4DuiYyvJ2G4MPbC1Ptn8xpOR6jVRLRqhB3ZYSv5xMZoA+nTa9Lf2rpz0hd4oy7UIIFs/YwEoUoEtoNB/xoXYpMmlHBOp66QF12+WNWPWd2l2DTpk24qh0zMTM8B9e4FnZXvjqjYNE/PtCg4SW7PKjCKuwQuR2jsUFcyr7yHsvvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZKVkkdoomLKpoTvXcSU8HqWhvFCneZPXuoQtzB3VgQ=;
 b=el50dn129c4By45D7EDG5TzdQEX+PgEnuwU7qycweoFEUko8TZvTwVmc/SfUg9oFm1WSmbYokPg2KFR2pk39F7ywvgyXA5hWzeyILkBAAisOJRyUchr6xNUqqEUpSOBuRSzIJJ0t2/o9UKs0jg0Lgw9r/8h+oRMh1rrsS2bm0QRC/qtIoRAKXTVGSxYT4qBsjjz9+nJ6lH2FhWt5fBhpvPlUsWZbjwxUPxJtKokvQOwuGgORea6CtXsBEHsdCc5OupHgxn0yPef4pGGE/RUztMsOjeUF1tYLCoyNqeDOrLC5j8i+aczbxRIdge2P8dCFFoa6DSlyLY6aBjfK6m96IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:47:56 +0000
Received: from PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225]) by PH7PR11MB5863.namprd11.prod.outlook.com
 ([fe80::de6b:62df:5aca:9225%6]) with mapi id 15.21.0223.015; Tue, 21 Jul 2026
 10:47:55 +0000
From: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel: Trigger configfs attr callbacks
Thread-Topic: [PATCH] tests/intel: Trigger configfs attr callbacks
Thread-Index: AQHczYA2aopBd6omQ0iJ4MPYSnapy7XhhY0AgJbbqJA=
Date: Tue, 21 Jul 2026 10:47:55 +0000
Message-ID: <PH7PR11MB5863845C829E5978DD7DB6A785C22@PH7PR11MB5863.namprd11.prod.outlook.com>
References: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
 <a22ba6fc75fd133c9a6b24d728bb183c68dffa97@intel.com>
In-Reply-To: <a22ba6fc75fd133c9a6b24d728bb183c68dffa97@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5863:EE_|DM4PR11MB7327:EE_
x-ms-office365-filtering-correlation-id: 96bfa1d4-8a48-41ce-caf9-08dee71585b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|10067099003|4143699003|5023799004|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: EqPwTIy8nXi8B1Y7s69rlxjRj5hfWgMaNExW2N5WxtZEFa7c3hEbhuvzVfSAkFQBRWGN9V2ggiApf0faFYQB0gDG6bLuSAWnmRNn3jACuCDg2NXgTQBCpBZ5Cse6FzXNswEl/Z3v3ymVhhZVqqGa43GLUX4/JNRiwkQNM5qc61MG9I8ZOZ6RhHszoI9eEU3e9Ytbbfow6bTeow0ez6rjCs7+G9kFXBEuSPGmFMr0Jq1sNQReOpCXEbOugpSpVMCTjbKcv4cGnR/a2PSGLTQHNUcphLR8425CXQYzF3ztlfuUjE1zG4MUuju6I71S/HsWCczTYQmq5rnHMgkGsIQR/OkZDjyl3C7aiG2pEMzu1/4cwyxVdBaBl/1RlCKSBhzEQ5NrNLY4Utke15XrmoHWwwd66+AtUXQ0QoPr0u3QJIJhlp0gs9UZeNeguKdiqaa5KEAFqGPz/Iye/xZA15PCrAroI7mZbq2hqcFhFhc4rjRzfLPEaCS1W3pJ68okBz+aI2pk8aCxziS0X9dJzluyBoES7/eS9naEnKe0toS2r1gAQs7GGyAtf41RCqCJ8qL0tuLJX6Et8GZE/O2WtWkTBm5DCeRS2o29r/UGgHfaTTLgjs6OlEVrwoNcciLY3pq05xwnrjubxsA4x3zhBS9spTAGYdcIGsVRR3o4Z9arA0apM9tjmD/XUjUXo+emeI/tqHLw0QJYU3dfjWeb89S3Rx08PFjknctRg2zzNDVX7Tk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5863.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(10067099003)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oH/0YAu6bHMnTueTjw7K8Gn+QurlkDwI2BRsM9f2LPvIxVLfTeqdrR2z7vzo?=
 =?us-ascii?Q?Xnvge9IG4xjdHnrAlaXf2xo8usPtvzA12ysCuvgW2oNCc7/75fNzJCanGJI0?=
 =?us-ascii?Q?Yjvi+1vGwNfSiimzkh3E/+0QaNql0whye7InAdN8Jnx95ABlodxLLqqLELcK?=
 =?us-ascii?Q?pw5a7AZ41cNXBtRElD9OscU/yLrxa89OriDUCBBU39kxFynC1k1BanmyF6xL?=
 =?us-ascii?Q?LHeqYtHhhXwoeiVqoESol7F4E6GDDJR9JHI+EegyPfGJkVxl5sOmia+pkQ4z?=
 =?us-ascii?Q?+T3OaZfDIb5X+YmYKNp1+v7gZeHH+eCksprHbycH981O3xt+kwPwFWINHTyl?=
 =?us-ascii?Q?kxDGmQwo4uEWQpGsjddXHWQfwC0Xc+BKFh+3Wj3orHPHeXKKnyHlfy0oCfTs?=
 =?us-ascii?Q?0Ofb4L5ZyyvX0gSQINvkClhBGm8I+u31rDex0Q4wfj+XuqrtP/sVOfH9E1MJ?=
 =?us-ascii?Q?c73MlPgzUhBabSiYZJu6l6oPJisPRbw96weUg0DT+PEfaJNCcJMWYWlbwxxc?=
 =?us-ascii?Q?M35HFON7Gg1jf14lU4hZ9Yko/Ycod8cV2P1sQIN4aE0gCnwg/rbz6Y9TBRnL?=
 =?us-ascii?Q?pDRFgWapUNGxdUE3uiqxUTDn4h3Vf+SdghEyB5zemr6o8C80BJkKgUcrSZ1t?=
 =?us-ascii?Q?h9GJwVu+YnwjrZdoP0F4/kvPm7x6CdN7vky2CR4GAgNe3MULd2ZeecWYJQOF?=
 =?us-ascii?Q?FQM8wFS21A+pKemUQo4VoSV7b36CTbC/hbZzf1kgYfxoBUv94UbtPV1YurxL?=
 =?us-ascii?Q?CKt1GmfWaLvnoj7pudq+edsDklbmcNUoBCSPX8kd2nL6WXBhxUuRt7yVgrp4?=
 =?us-ascii?Q?XEUHiFssvgmGKuKvIS9bKK6HxnW7BRkYeYs6OCHp3WKcxovXjxxK4C1sbDAL?=
 =?us-ascii?Q?2F+Lqmd3upnLRhVopRll6sDM+z5lQEeseJSBzhS4Gvh/LT9AMkYukW1cH8bw?=
 =?us-ascii?Q?0Rdu358/t6owxzDpdBBHRmbYtKPol8DuDbcGoGZTbpF1dbAgrGrBl9e8deXB?=
 =?us-ascii?Q?K0ehZkeB8y7uj2mBbLOx0/3ZiJlKR0EdHvcDHVSwKRx+/3cuxYeo81G1iQrc?=
 =?us-ascii?Q?RL9wdEkYKBdoEV2sWUhLlStmfWACDKzmkI+iPiSFD7uEAgtip4myddWHaAru?=
 =?us-ascii?Q?mtm/woQkNP6F6EmF/mb+BifNqL9OMBgE77jhteUhK8KjplbjNeYAR2gyM9Ku?=
 =?us-ascii?Q?u7xYoHhz3GChuWs7V+8sUEvJlzd8xXd2z2L9XvPzYjTW6VUb3cvgarFmTdAg?=
 =?us-ascii?Q?AG/tebh7TqelZh0Dqofv3bakSzOfsIOW9peNPPzzX64FTuXj168VGUvv11lB?=
 =?us-ascii?Q?SD+RscT6XckKDvlEFcv62HKWfY1s/KoA9glFV5FXVufNluiEm4jGfNywuBmB?=
 =?us-ascii?Q?rfAfzWfTY8tnazAbmUQRajh/pdMWcdxXLJ/e6xFgIuCwfuhd6izzfxPJ7rj6?=
 =?us-ascii?Q?XWq7iRit0fT0v4nqwrjX5QnkhFju6ZrZeIVD+pWHaJ90TBh4yB3XJvbthmsP?=
 =?us-ascii?Q?u8loK8EWG4demmzKB/xylNgowGEnML1e6/0eGzL/Zzmv1Uk+5M2YzwI93906?=
 =?us-ascii?Q?S8UsQm0K6QU5VPmO1fjAhWn/o+oevLpGtTmHTxkNj/Zat7LsBTtTZ/ki15I2?=
 =?us-ascii?Q?hD3WwSaITQtCt9wvcOzXBsVSRPVl+6RHM1TX3crlsFwuHL5s+ujzI5EsJ8BZ?=
 =?us-ascii?Q?vIwKKEVte2aDBDKrlvT7qnJjobsgYiJTjsGs2Pfi+AdXhc3zm3L4WGlHym3k?=
 =?us-ascii?Q?CUyHwtJ6neahfOLzHJIZyOEEED0FEd8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cAECrXpKVDQAWOVmd4wxfqEoWPEgK2dUltp1ikFtXoMMTygk2MAHSRKnChIbzFZqvxfwFD1Xi3aLNk7iCCb73XE3UFlBuzPJqJFWZRYp4bBEp5BAIp05WCAvqlDI82LjeZN7ioaDfTZOb4zQVDh4bubRiB0CzQZEFlPo1YiXmjpP/NSnVO+JAtd6diwIQumkRPQh6oO7hVyhKdVelSXhazWf63CMSsmV0PsLVeISKdcWIyAp3HgCy11OvRkijnN3bp2dTtaDgI+LDWEJE+xlX7SEraBFT42QLSIkL9O/8fY67ITz0ZAl+L/KVvIgZyg3+1jIs7fRAVicdvM00Gk17g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5863.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bfa1d4-8a48-41ce-caf9-08dee71585b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 10:47:55.6334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onX0V3A+Ynde8lCu9WRvwaj3kR5F5ZuuaukQVY0eKMTBNFU9JRbFg0dNrlTQO9Cr1U72UFb/ob67dcunKO71H1Is89vnmcMMR7gp+ZM6+7Onerm2F9SniV8iHd98XIj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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



-----Original Message-----
From: Nikula, Jani <jani.nikula@intel.com>=20
Sent: Thursday, April 16, 2026 4:31 PM
To: Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>; igt-dev@lis=
ts.freedesktop.org
Subject: Re: [PATCH] tests/intel: Trigger configfs attr callbacks

On Thu, 16 Apr 2026, Smitha Balasubramanyam <smitha.balasubramanyam@intel.c=
om> wrote:
> Coverage improvement achieved by adding new subtests for show and=20
> store functionality of enable_psmi and sriov_max_vfs Enhanced existing=20
> subtests like survivability_mode, gt_types_allowed, engines_allowed,=20
> to cover show and store functions.
>
> Add a test vector with a partially invalid second command in the=20
> ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line=20
> BB is rejected and the stored BB remains empty (rollback).
>
> Replaced the hardcoded "ctx_restore_post_bb" write with the computed=20
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the=20
> invalid-case tests work for both "post" and "mid" variants.

There's too many things going on at once. One thing per patch, please.

Thank you for the feedback. The changes have been split into separate focus=
ed patches as suggested and the other comments have also been addressed. Th=
e latest version (v4) addresses this. Would appreciate your review.
>
> Signed-off-by: Smitha Balasubramanyam=20
> <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_configfs.c | 102=20
> ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c=20
> index 755524e7c..bde52e6ef 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -85,6 +85,13 @@ static void test_survivability_mode(int configfs_devic=
e_fd)
>  	char path[PATH_MAX];
>  	int fd;
> =20
> +	/* Buffer for reading attribute values */

I think that's a pretty useless comment.

> +	char buf[256];
> +
> +	/* survivability_mode_show */

Ditto. It's unclear what you're doing here.

> +	igt_assert(igt_sysfs_read(configfs_device_fd, "survivability_mode",
> +				buf, sizeof(buf) - 1));

So this checks that you can read from survivability_mode, but ignores the v=
alue. The sizeof(buf) - 1 seems like cargo culted copy-paste. The whole igt=
_sysfs_read() function looks difficult to use, maybe there should be a func=
tion to read a string that's ensured to be NUL terminated.

> +
>  	/* Enable survivability mode */
>  	set_survivability_mode(configfs_device_fd, true);
> =20
> @@ -138,6 +145,13 @@ static void test_engines_allowed(int configfs_device=
_fd)
>  		"rcs000",
>  	};
> =20
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* engines_allowed_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "engines_allowed",
> +				buf, sizeof(buf) - 1));

Same comments here.

> +
>  	/*
>  	 * These only test if engine parsing is correct, so just make sure
>  	 * there's no device bound
> @@ -166,8 +180,25 @@ static void test_gt_types_allowed(int configfs_devic=
e_fd)
>  	};
> =20
>  	static const char *invalid_values[] =3D {
> -                "check",
> -        };
> +		"check",
> +	};
> +
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* gt_types_allowed_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "gt_types_allowed",
> +				buf, sizeof(buf) - 1));

And here.

> +
> +	/* gt_types_allowed_store
> +	 * Store may succeed or fail depending on platform/device state.
> +	 * Accept success (errno =3D=3D 0) or expected policy failures.
> +	 */
> +	errno =3D 0;
> +	igt_sysfs_set(configfs_device_fd, "gt_types_allowed", "0");
> +	igt_assert_f(errno =3D=3D 0 || errno =3D=3D EBUSY || errno =3D=3D EINVA=
L,
> +			"Unexpected errno from gt_types_allowed store: %d\n", errno);

igt_sysfs_write() will return -errno on failure, number of bytes otherwise.=
 Maybe you should use that instead of relying on errno being still set. The=
re's the close() function being called which I presume will trash errno.

> +
> =20
>  	/*
>  	 * These only test if gt type parsing is correct, so just make sure=20
> @@ -225,12 +256,16 @@ static void test_ctx_restore_invalid(int configfs_d=
evice_fd, const char *type)
>  		{ .test =3D "invalid-engine-instance",
>  		  .in =3D "rcs0 reg 4F100 DEADBEEF",
>  		},
> +		{ .test =3D "invalid-second-command",
> +			.in =3D "rcs cmd 11000001 4F100 DEADBEEF\n"
> +				"rcs cmd 11000001 4F10G DEADBEEF",
> +		},
>  	};
>  	char buf[4096] =3D { };
>  	char file[64] =3D { };
> =20
>  	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> -	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
> +	igt_sysfs_set(configfs_device_fd, file, "");
> =20
>  	/*
>  	 * These only test if command parsing is correct, @@ -335,6 +370,53=20
> @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
>  	}
>  }
> =20
> +/**
> + * SUBTEST: psmi_store_show
> + * Description: Validate PSMI Store and Show functionality  */ static=20
> +void test_psmi_store_show(int configfs_device_fd) {
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* enable_psmi_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "enable_psmi",
> +				buf, sizeof(buf) - 1));

Again this just checks the file exists. But if you're writing to it later, =
you could just check for that error there.

And the comments are also useless.

> +
> +	/* enable_psmi_store
> +	 * Enabling PSMI on an active device is expected to fail with EBUSY.
> +	 */
> +	errno =3D 0;
> +	igt_sysfs_set(configfs_device_fd, "enable_psmi", "1");
> +	igt_assert_f(errno =3D=3D EBUSY,
> +			"Expected EBUSY from enable_psmi_store, got %d\n", errno);

errno is likely trashed.

> +
> +}
> +
> +/**
> + * SUBTEST: sriov_max_vfs_store_show
> + * Description: Validate SRIOV Max VFs store and show functionality =20
> +*/ static void test_sriov_max_vfs_store_show(int configfs_device_fd)=20
> +{
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* sriov_max_vfs_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "sriov/max_vfs",
> +				buf, sizeof(buf) - 1));
> +
> +	/* sriov_max_vfs_store
> +	 * Changing max_vfs usually fails once device is active.
> +	 * Accept expected policy failures while exercising store path.
> +	 */
> +	errno =3D 0;
> +	igt_sysfs_set(configfs_device_fd, "sriov/max_vfs", "1");
> +	igt_assert_f(errno =3D=3D EBUSY,
> +			"Expected EBUSY from sriov_max_vfs_store, got %d\n", errno);

Ditto about errno and everything.

> +
> +}
> +
>  static void set_bus_addr(int fd)
>  {
>  	pci_dev =3D igt_device_get_pci_device(fd); @@ -439,6 +521,20 @@ int=20
> igt_main()
>  		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
> =20
> +	igt_describe("Validate PSMI Store and Show functionality");
> +	igt_subtest("psmi_store_show") {
> +		configfs_device_fd =3D create_device_configfs_group(configfs_fd);
> +		test_psmi_store_show(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
> +
> +	igt_describe("Validate SRIOV Max Vfs Store and Show functionality");
> +	igt_subtest("sriov_max_vfs_store_show") {
> +		configfs_device_fd =3D create_device_configfs_group(configfs_fd);
> +		test_sriov_max_vfs_store_show(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
> +
>  	igt_fixture() {
>  		close(configfs_fd);
>  	}

--
Jani Nikula, Intel
