Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DEBFD2D73
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 13:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0BB10E2AD;
	Tue, 10 Mar 2026 13:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7Adqtgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0023E10E2AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773147704; x=1804683704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HUDp4T6dtFRDNrWWuH4FxOQIwWQ0HBYoYCqrvEcVObU=;
 b=K7AdqtgvqziJJGHqW535v0U8C0MZVuoWkgF/3fcZkCT0X//N51efpVnC
 9Mx2siJqFKiGnxhbD5kX9MJ6eqBj9PzGOWHNwcLrEFitKX5VfNvo8nZS6
 7y3uHFMgzVu6OircC9ugxXBf5xmNuh8E/bucFJg1b6I3s2aYO6Gg1PCeK
 ccEyhftOaQjV6xK6ldXV3W+zFCkIEP3S1WjvrXwvT8WkkycFdjfA9fo0S
 rb3YtOkY59wH6bMmGNn5KWpWGVcIbOX7Qgpl964zjopnQdUtDwrozBTb+
 U7HLeqBz5DDVEp++orN8q3staNfFVNUjTd31Fm34ac3XP3MRbJCmzcBqi g==;
X-CSE-ConnectionGUID: tjYP9vH2QBeDjCVVeGv4XA==
X-CSE-MsgGUID: nVMiJujSQCquUSHXB893bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85280065"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85280065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:01:28 -0700
X-CSE-ConnectionGUID: o8CwOZdTTY20g466dKAf9w==
X-CSE-MsgGUID: nPj7lyofRKKvoo8c7xKzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="258023258"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:00:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 06:00:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 06:00:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqcKG7agG7xZGkvfReQHP5y8OKsM2FRMqGdfZFo5wgonzGv9cDIil0RzBeJ6rCLMXp1JNu+LqYjrjb+a9VoxYs077Nh/WQ8sZ8B8Mak1dpbp7z+ATS2HOBYvgJvg6Pnfy9iMD0f9Ml0zWORFGVQXIeb8zrc4SMWErRklMXoMoL58xL7YEhO08p/E/jZkveUG86yQM8Ci2eEHacvQ3cAA310rXvNrwPRL7J3sIfzokCwONgZ5AzCcIDUS2sIF+ZrsxE/HI7WzjA9lrXGnLqAo9+Guq8W7qz8pgak7tQ92PqPrv5bzLqGijQcdGDF4wa2m8TfU5fPfO61/8jBV4Zw8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRku3owcInCFM3BnLJzscXFc/2g1tTMDIm+aTJIApfk=;
 b=nL81sYkObm3TjOrRjfcNMcuYmykXI13iRiMkCswtMfGOzg+Hiq+mWNiCfbR8pm3+ROXfx3rCqPlNDQjifOdNV8VmhwHLwslMmz9fQHfhSml2kDlQdvhE4VTK7rDEcPawx/Fgnhkn+s0VQxv0PgtJ7aQSnG0SkPDTfeK1wpP29/o1qqT1mUekUc2wfKpsKQK3drqp17h1zD3SB0y8ARWH9CEtc/jDM0DOwykHNy/jak33KRPRX7N/EtW7jfZvWZjA038arEV0sKeZIrlcX9fgM9JSGrOBlAHee1fQoolXdYh1wbBLuRK3va+IIO6FcoJXfWU/rHP6yyp7UN2IIO0hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:59:32 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:59:32 +0000
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v4 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
Thread-Topic: [PATCH i-g-t v4 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
Thread-Index: AQHcon7496EttRMNRESfq/JpLGCEY7Wn1mkw
Date: Tue, 10 Mar 2026 12:59:32 +0000
Message-ID: <DM4PR11MB81798DA6BD6F907EB69C18289446A@DM4PR11MB8179.namprd11.prod.outlook.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
 <20260220153748.210381-12-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-12-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5234:EE_
x-ms-office365-filtering-correlation-id: 60150c01-8dda-4746-a2a4-08de7ea4dfaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099002|38070700021|7053199007; 
x-microsoft-antispam-message-info: frqLf6VMvBObAecrJ1+c3tdMN08z775ahu9iJXlZon+Ex3szV9Yq/vVVZnqCn01jRPGE62No83EVMtYIRyrWbA0uL5i7fBvKhI6ZqZq/pRmg6A5ZQJiA+m2h6GmpdtXZXtzWnDQkf+wGQG+70Jgj5eGaQJp8kNfp8j2I/Ya9lIu+yjzQIX/zJDUVo+Ix/52Mr6Tb35Lb2mkz1ipjKRIFbGvVY6FE5qkhR6TCQv5lO/ipxLIoMeJDbh3Z2/jorWYSkoKHs44EW1fxmT0xoHvq/h9MfPWJtHx3Z9Lw/qk4JAzyYnnClvhaHNapCieE5T+xMS6lKz3kEIQcre+aHFfR/xnm/mJzPRYK2UVGkQuyUdtUF22ZUTVQC5aNPdaMjiUdG/JUOt0Y4zy/4EZOeXJWj2Kx473d0U5kF4r+BtLoRCPW6Zp4MEiBaXN2yMYput21fV6WmH2Azr939bkDYAKezFqrwTm34tsx7aRiJc5GQbU7wZAZKrrEG+i6kipjwsbdXwci9Gbq37kUPJM5Qg8uDY0u5heoC7vNDUCrRDwTLfWxD9yhBs7eUeHVRkBLnsuJsKVgw1eAAsZzWnwFwB7dQqCku4TjzluaERDupxbjsyWRKL4B9vBta7nhUj39TJYewu7HNRSA82VjEbXWwKetIPgddij+xu6ZPn6CfWYpXHHU4XL+uRUaaimATpdhxw06UYqlNcTWS4Ehcr9aGFnNG3oh5FxOLNCyjLavZKH6Qo1X++juZmLJd+u6gEuTKEp8odb+mUgGZMSXUgO7fLBBTewSgKl88h0SWd+Mi9YQhXw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099002)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0zgNhWJQA7cFB1pfsVUbWYm5Tg+c4Jg5khi2i1MFSFBQDXdOrHTdKF53FBqO?=
 =?us-ascii?Q?0Dh3fCVLnyMO+Da20XHOfkM/BY/3cJiiMNTETXmXZFvHA+fyH8f4Acfaeo9g?=
 =?us-ascii?Q?Qc+DaYa4yytgmMq6QvZMbBBGhcl1FI//T+cQwEYjh7S+/p5+63hXRRyJPNlG?=
 =?us-ascii?Q?SlfXbhxCT7qt7hpmUA1P6w80PZ8MwkCuErwEFSeHqa7E52l5XK7yOp+NSapR?=
 =?us-ascii?Q?Qo0ZFY14Qwd/bWYzw76MIBP4+n9vanz70brryABI2v+6Xa+QkGaGxLRTk4HL?=
 =?us-ascii?Q?p4FoVaKx8OHhC93Q3JBPAGV4lNuJdVXBUfHG+xYbnx06U/DCSa1/DDtFBAbM?=
 =?us-ascii?Q?lhKBBUfLk64NYxJZ+AbRy3Mmss7dD2qyqVm6fJx3DfLb/5GH9LNabe2C24Vo?=
 =?us-ascii?Q?dQxO1SCyA13ZrMdsj2gnrCaq+6KiO+zUjswsxiH+g6B0kga8IhfvErQ65Wf1?=
 =?us-ascii?Q?xUbbXK6iM+93i6siCQz1zF7Ea6s7oyQvQJSntEWEcfJ70WMZ1stADfsu5UCO?=
 =?us-ascii?Q?+qk905+s+HpcI1h+QjXYH+vYn+4YkoOrKPf2va4F7Yy/bxRigmYL7iWeDT6A?=
 =?us-ascii?Q?WjiS956PsnDEPsm6UVquBYwGGA9ls5UJ70N/4L7urTzKmLaCDAAad6yPhk05?=
 =?us-ascii?Q?1uQSqedsUoJCPZwn7JPYVgualH3ZcYYugZLjRf3tBs1niDaHk6rnqP33Cq7M?=
 =?us-ascii?Q?imt+msxWH6THF+GanTSjbXYUrBHDYyPoW5eWiIQ1gW3Fj/wDutCsjOJ3wgSr?=
 =?us-ascii?Q?naGV5ycr2+ura9XfIq10D84abM0fIaldDQylvW/I9vvr2oYhL7k6Edn6tWnr?=
 =?us-ascii?Q?2cWZEk7JW7Wyv9kqPSSaGLxe2NEdiVt/gHiXHYAtTvktgjFyuJc1gw5BtaDR?=
 =?us-ascii?Q?1cVowO1rtp5FtS2yy0A6YTsm1GOUCp3amqgn+ax/N+BZZKdI/8A4vn12Ie4b?=
 =?us-ascii?Q?pzY7bC443RIxI11ZJDtIpTn4BQwb1lLwQP9AwfHLFib7ViQLOHWy0ZlU941R?=
 =?us-ascii?Q?EHD29szNBs9O2RBntSwgwDIydJf8/uwpaJYYrTxiSJmlLo0kXPpLoG0JjeMU?=
 =?us-ascii?Q?cepBDvDSC9x/OoQltERhBN8GQk2Je3c+Tqk+9U+0r53x5QVHQ7jKYsrNwPra?=
 =?us-ascii?Q?Wm0OxVchW4XVHF1WooKqKTqvrq5gcKYzAiW/u3WOh2fMkDJnwMIBA7fYEonE?=
 =?us-ascii?Q?9Pgj23k9sIKUWQqdyWXk3HERzqGYuNGyjOKzJQBBxdDGAqgrzF2IA0Vkpgkr?=
 =?us-ascii?Q?s1MxPNoBeLENfU99bNAYgF257nZoa5VWoaGkiDzbKChygoW0n4CtB41uzeUp?=
 =?us-ascii?Q?YosB7z9U36LdDSRub+3NtIJxtDMxnXE/PEbqgUfLbYTGFEgGJ2vZeOlxmmkz?=
 =?us-ascii?Q?N788N987E7OyCdcl6J9laxstR+ChDYdGWuz2zlWbtOMkBbuVQ2zxeJVA/jSS?=
 =?us-ascii?Q?bep9InzW0VPPsH0pWhotw1/REMljygr6cGS8j04qT0NB7IJjtYde8WYJJhQj?=
 =?us-ascii?Q?id9KKxp0EIuWejdbk0k/GharpdZSOEdctX4vHU0b2kYvuw1XZjOwiVsXJiCy?=
 =?us-ascii?Q?nK5xKmVhO5JkLeaqvr35VzMKTV5nJnFMDZ3QJ2jAbwjTkFx0lVxvvxySPHN8?=
 =?us-ascii?Q?1gBe5F07YM01Nm1SuUnp8on8kZqnsNYNLqDcIITlz5pg0zfRe/rtVhvHuxi8?=
 =?us-ascii?Q?ssEaXKpC2QM3KmARbjnHFwHKBsQB/s+qA5IXQpH3X7sYMSmVUcrgIOqqLCSM?=
 =?us-ascii?Q?C8P87p9zTQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Yw3g+ctxhRxF9zloimehcVY3U5ZUiZUpf67e6H5WfarTUlh6wJRgOQosaBK0nKGi/CrWCS4THldlw+LE5pN0ANgx5j0qOtv/WhlfAa9ddch3Y5PZ1uURjTMVDMu95fkuqo1cY+BGpHamu7TyGmmnClZLEc/5OVTQLmm8MyCU0RKAzy3QlNX6yu28wkLnNFDxJ4dxdLiho4qY9o7f1y10TU0xDrhPH3MKWrHZq2p3+mATKAkNzeMKLQv1Kx8mJUuUl1hZBOW92zQMYWYERumnl/9mw2crHmi9ryUpYWDaBHEMfspACSAaTXRT3BCNHlH3bGquxtyPb/QHyrzOP38ddQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60150c01-8dda-4746-a2a4-08de7ea4dfaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 12:59:32.4619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfKOljQsx2txnjnPcxHmpqOBaCKci6VOErhaJl9ZA3IfHh4j8N2Rl17i82tZN39R7j9B7baDiCt7rxMbhM7Z/ROW8Zi3AIL3YgajEDjAI+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

LGTM,
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Friday, February 20, 2026 4:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Rudnicki; Rudnicki, Piotr <piotr.rudnicki@intel.com>; Piatkowski; Pia=
tkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t v4 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
>=20
> Add helper function to get the card name as defined in the:
> '/sys/class/drm/card<N>' path.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 40 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> a0caad2c3..37ce1e2ac 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1901,6 +1901,34 @@ static void metadata_event(struct
> xe_eudebug_client *c, uint32_t flags,  }
>=20
>  #define EU_DEBUG_TOGGLE "device/enable_eudebug"
> +
> +static char *get_card_name(int fd, char *card_name, size_t len) {
> +	char sysfs_path[PATH_MAX];
> +	char link_target[PATH_MAX];
> +	char *card_start;
> +	ssize_t link_len;
> +
> +	if (!igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)))
> +		return NULL;
> +
> +	link_len =3D readlink(sysfs_path, link_target, sizeof(link_target) - 1)=
;
> +	if (link_len < 0)
> +		return NULL;
> +
> +	link_target[link_len] =3D '\0';
> +
> +	card_start =3D strstr(link_target, "card");
> +	if (!card_start)
> +		return NULL;
> +
> +	snprintf(card_name, len, "%s", card_start);
> +	card_start =3D strchr(card_name, '/');
> +	if (card_start)
> +		*card_start =3D '\0';
> +
> +	return card_name;
> +}
>  /**
>   * __xe_eudebug_enable_getset
>   * @fd: xe client
> @@ -1962,7 +1990,7 @@ out:
>   */
>  bool xe_eudebug_enable(int fd, bool enable)  {
> -	char sysfs_path[PATH_MAX];
> +	char card_name[NAME_MAX];
>  	bool old =3D false;
>  	int ret =3D 0;
>=20
> @@ -1984,9 +2012,13 @@ bool xe_eudebug_enable(int fd, bool enable)
>  	}
>=20
>  	if (ret =3D=3D -ENOENT) {
> -		igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
> -		igt_skip("'%s/" EU_DEBUG_TOGGLE
> -			 "' sysfs attribute not found, EU DEBUG not
> supported\n", sysfs_path);
> +		if (get_card_name(fd, card_name, sizeof(card_name)))
> +			igt_skip("'/sys/class/drm/%s/" EU_DEBUG_TOGGLE
> +				 "' sysfs attribute not found, EU DEBUG not
> supported\n",
> +				 card_name);
> +		else
> +			igt_skip("'" EU_DEBUG_TOGGLE
> +				 "' sysfs attribute not found, EU DEBUG not
> supported\n");
>  	}
>=20
>  	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
> --
> 2.47.1

