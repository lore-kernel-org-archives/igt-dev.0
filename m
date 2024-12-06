Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BE9E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 05:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4F110E3D1;
	Fri,  6 Dec 2024 05:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFwGcJfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA7410E3D1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 05:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733462080; x=1764998080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=liuM0OtnsE42/Q5we1OOi6w9NPGwDa7Jav26EIyqKEk=;
 b=kFwGcJfsZmImFQ/3P8A+CV8hSHNJ6mMKAdaXQA6qa5FVLfg8E2MjU/II
 3zPx9G+PHIpESTB++B13MCCFTmCMo3+a1yRs+SobGJoS2PHFuB6hOcUJs
 FaY2pm755F4DXKqZbHXOLZER7npmGFn7dR1i7W1sMjAQXCZbZu03zMxKl
 ElTe4Je/adde+Tc5MzpaDK9RNxYLw7SAZ6tVM/sNZ4MHf4ElYMpuukDjJ
 UodtFuPMyaSnRR3fF+NqC/A+g64qogOMqmBzTGeLUS9nGIiI1osi/JxWL
 PEKdJIbAk3ym6vAeClaTMiTqa2QfYjCf38NRdANMoSRnVY50vliRJvRHk w==;
X-CSE-ConnectionGUID: WZVyoCfqSKO9YKnNRnJgZg==
X-CSE-MsgGUID: ML1PYnZVS2WxmocQV0CXxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33155590"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33155590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:14:39 -0800
X-CSE-ConnectionGUID: ekCEgyVGSJmPRtS/DgjW6g==
X-CSE-MsgGUID: pbO4I2E6RhmgmKgAgcWnOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="98755315"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 21:14:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 21:14:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 21:14:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 21:14:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZwVG1kXhEYRN2bSBElvwv1SdoAjwJOsdZd14WxRPcMDLHTxtv13ZwD25U+MmKWaYA6EGDtgF72WFyNBmzdzzphc0RH+Gl2hIa8lXeOo9a9QaGg+e5DbHbjnFzfwRcBWWlenfysPA9gLz0qxP/aSh8vkHXz7k2/hczJxsMDMtingbJJHJTvZDxhTnFwwucIwh0AoJIqeFy7YH51sE5vG79u8/XpV0IW20inkfOm5ZyFLbJlYmq71armnkUqZA7YYeG+FjNGwHp3YF999W+0XdjeXkWU33YN8hR5C0mA8tzR3cnA+XrijpgSnysXg6NFZBGzBdMz94jdloT25gqKh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQoYgBvVlNmRtYwzBtq0HmlvzWbNIO3NTzM8hUYGmGc=;
 b=IUYrLTG9MTrr/6stRrMMchvTypIhcACbCDODiwaceLilQMXE7JD5/GnqDTvjnkfU2Qfiy6mSqEkioX8f9cpi6Lj801xqVxgkJUr54scdjY4vczMyMlrBpGcbXbvR6dn+Ckf1soOF2kIvwvFyUVeORIlu1iYE7rRPSuCJgZLVYjwT+O+fHGWJcqokMcvTU53o1rWScVPuSQqsS9+fQ+qeAFxBH9lAsiTOksBFxkXzKZyJiRJwRmQalJgLz8Z6qkPKmupupwTGavuAGvTztQeiFfoat88bG5fCX/nsDYMZI2aiVY5+BBsjSPcCktBoz9G7ceTKBtimPve2jJq2938ChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.22; Fri, 6 Dec 2024 05:14:36 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 05:14:36 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't unplug
 multiple times
Thread-Topic: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
 unplug multiple times
Thread-Index: AQHbRvfDAB0wiBI6BkWQBm8Dqfi5obLYrPWw
Date: Fri, 6 Dec 2024 05:14:36 +0000
Message-ID: <DM4PR11MB631212A8CD3376CD2F3919D590312@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
 <20241205094052.1259373-2-kunal1.joshi@intel.com>
In-Reply-To: <20241205094052.1259373-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5205:EE_
x-ms-office365-filtering-correlation-id: 395b8caf-45e6-4396-761d-08dd15b4e0af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jQkqbvOYD0nRCF50Ui1tbzig3eTM50dkoI+mkMyGGBqKcRNWJOmg/qZy5GLR?=
 =?us-ascii?Q?kRfMfRgbHVdXpPTL+pStTZesJjOdtnbCPJv9upIG2Lwj7pA/Wa/fLSmYC+Ud?=
 =?us-ascii?Q?4XKPgJG71XuwEkXCc2ED/vXdCJ4BqGB1SGLw7P2H1VHCOe2Xh7/49lNVLOR/?=
 =?us-ascii?Q?Oa0uqMHsbHFEs+iT4oME74ehohNUIQIXNzI6DWpEyX3Gwp4HBxOuttOLW/Hs?=
 =?us-ascii?Q?RcVgdf6jwr2B3fM3aDi2ThDudVNfIH0QQsGYZUzjEc31yvLPRZxrfGPppAlM?=
 =?us-ascii?Q?kyDJOE20O5bQzixNAqLu6jRpp8zfx2XZ+BQezmYBgWrw9cQ69DE/R+DTk2fB?=
 =?us-ascii?Q?Xblgxn1SxVac5qjfqRJX6fwagAFCvfWWCF9yMcHKgLdTSJTz+mYjh3JX8Dja?=
 =?us-ascii?Q?QjyLqF90SBl4LBJJMVVs1VuPxSBR2gw/wLf3IwAXw2WO6DZ9lf30IOaLK/Du?=
 =?us-ascii?Q?p/zaA0C1y4Rr0wlOY+7CVCThBIJGFNkr+L4iMSG6D6gUtM95jIbpj9646ucT?=
 =?us-ascii?Q?/+V8w4TJtSgtfRU/10NFlOmZ0q0krNjc0RqZVHJTtpeVtIIVLqRmYc/vdNbt?=
 =?us-ascii?Q?ItUH4uipInxLcGpP6UNGt/awplqDvzBeNfICT+wYoGXDrHFJprUrOwfk7zDx?=
 =?us-ascii?Q?YpsMYwe3ab4p9lGaxSmb0ODD/yYt53xbuvZU4UTfRet1JmtxgafWLc16vadw?=
 =?us-ascii?Q?f6ttDdcauNmH7AHhVBoMhroYSNunrZ5d1qs+9cYOA2KzpmMvnYz5rNX3cJT5?=
 =?us-ascii?Q?tkuoWdZFL1F1nNCKTQzYVe3AxpEKKzjCp9hVUenSX64ZvtRtD6bPa0q8VVdW?=
 =?us-ascii?Q?QnlQiLF0qde4LHMAuiIhrFaglHAW5YBwSS+nX8FE5iznxUqoa3N0joE7Rx6+?=
 =?us-ascii?Q?RmBBt/w3LFFo/xGXEr65X9jK3fsmHlC8r4lQq2lPb0RGj7j8l4hOJWNFYu+x?=
 =?us-ascii?Q?DavCgQnqB5zCJ1LiSJS+VIhSWYVDv2uo0bzVCfrutoi+FdAaW7ODIS/Ha7OD?=
 =?us-ascii?Q?hJoGTvgiC5d7zXRc2UuD4Z9Qln6Y8oeChzAKxVpIY8KiWDOuXlRrWRWBXYQn?=
 =?us-ascii?Q?7SZEdlQYpXVUXDrDLp6ZFwBZlV+kq02GAZZNcVpUPQmmoJa93zoAtPbgXQpE?=
 =?us-ascii?Q?pRU3eKeK0+CElt9/iXPC5H6UurbbaL7Bfwmk6/jYzk6aO4LaFrHsaXdJSp93?=
 =?us-ascii?Q?DkviJs7aJluvEwSsEZ5fy81/60fsDcGyi+jDkyo+O1pMvC3a28+9K/H2qnoA?=
 =?us-ascii?Q?YL9qoeyznD0F1EenZgWTtdFoa50PifU2XCcGrVMdUoB6m7dBc/w/OMI1efDc?=
 =?us-ascii?Q?rUXPj9o4Wqud9Zf2OJOAwEXzgBSK3rToCLdJ4f4cXfSCad06/0Uvix9FtKnf?=
 =?us-ascii?Q?4gLuJOUpCJRU9+lmgFtNhAx5f23VietdhNkDei8MhsZVQ3BCNQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oPOCyybOO+fwebWxHOsJXivvzGENkiLcB/xsY5Sw+Q+OcPdExHUDrXJfpPpU?=
 =?us-ascii?Q?2YmQSEaDU4vKOa51h/QJ3q5xNe9x7T2pEkccFoxKSGB0oKtgnOIhbqmOyTI+?=
 =?us-ascii?Q?+efBFyCxdUKVmkTrs9e5eMn6NC64/XMTohYSSUNxs2X/m/fIJw5XzUJyM4N1?=
 =?us-ascii?Q?7bc9+CsqzpopNlqk4KvdD/3z+csUMKivNLIVl+/OG17AODIoys86jNQ1nOSr?=
 =?us-ascii?Q?Ym2A6MoTsmYoLvc1wDqBhZlexQ7I5PWTvOLfZhSyRO11N6kuDwjXzfk+NO6K?=
 =?us-ascii?Q?HITa2XvIuBzcD00FjpzC0nPbHvcgJMW34/BoX28l5Z1lAvokZ31lC1C/lPmq?=
 =?us-ascii?Q?Ht7mjS0ZTlB2TNEhCfTTsw4IRjbeWgND2FhxVJnzBkEMDe/XXFV92AJv7YTK?=
 =?us-ascii?Q?VuN2Yc80IqMV9/KL+QYXJPqKN7T5Fi6Ll8aTanVv7qHhAxQoz7BOn7fPf97b?=
 =?us-ascii?Q?BRqa061oDy54bz3sM1NskUoqHhjnOD9U4DWQ7CQiNeszpJdhgSGCsH1tF+Q9?=
 =?us-ascii?Q?asKdxpTKyz9hWug69+Kll0cruhxx1h3tzl7CXjgdj5szq0jum4cPaAmZz1bh?=
 =?us-ascii?Q?noyXPsNDMaPnbFG3ihBpxCd4MezgZtg4EZT9DREPRg/jfqOQ3dXc3ZD+lw8M?=
 =?us-ascii?Q?SyKn1NVI1aGRxUo7FeJoFoAz1py48n+AnA+bWE+o/YVg5CN9+a245ztQuW2r?=
 =?us-ascii?Q?D/m0HqRh8qKlhi8EUKJB6r9SPUiXjkMjCulLB86IfNT+uqYLYE3pNaDV6uqs?=
 =?us-ascii?Q?1cHkmzes0OqNtg/d/hCEzvtRtFFrMaOCJen9HLS0nJB1OUowAEUADylU5RHb?=
 =?us-ascii?Q?/UJIhGCyuXDkinEqHJpxzkc2BXtMkU8Hp8rrFm+Q7QrwXvu/iG1GEyhgbHpU?=
 =?us-ascii?Q?VDw6903LoPMViD33ZAnBtjCc6BlyOsg22AyNNQtCQdJj3FEzCAnrr9rCXvGR?=
 =?us-ascii?Q?7EeHhps3yCiCEB29AlgoODceHdta0evlR00y/CBmPSQhrqXY7mK2LdgeHTQR?=
 =?us-ascii?Q?4bdiLMRsdS5nvu515aNtrJOCWFn4l0gGgDrwuBL3I4EQF3CjyT7Xcd9o9OXl?=
 =?us-ascii?Q?F8ILBfrpMB+EkVDP7e2UzANGKugfZ1/YxReYUu0GmqCcCfjqRCOrONxRkDA+?=
 =?us-ascii?Q?Px6mj26EE1Rb0k5S36yjX7Z50YZ3PnPnMmurdcmrQFv3opR/jYs19oktlVjT?=
 =?us-ascii?Q?CLnDsUv+FnbeSTLJ/YAf+YkVKA1ynZJqfZj7ldpSmrnzKldz5FACx++yZ+Wg?=
 =?us-ascii?Q?prauXbvJ6UV/dwrAir+jKot9xdmjJMNnLyUr8PuYwzTQeeMEsIvqcFrUu/jZ?=
 =?us-ascii?Q?BTSq68jczuscIKnNy4hpf8laBsnMpQgHT1TAQWcLpgwU1bllTV5Fjd3YchoP?=
 =?us-ascii?Q?KK8T/nJp0ocoTNtdEJJGy2LmSpgyBmBWTQPjLxrhQspeXmRAsI5lSUrHJEOy?=
 =?us-ascii?Q?F73sC4GbenIimmNWTG4V0JS3N9CiLpoSea3vNff9f7eOmBvXxy+h8sC2Q5C+?=
 =?us-ascii?Q?dTa/QHcEc1hrSCa7bz33e8vRj3ju1QX8kA01eJ4WScwiKPMFEb6ndOxHBHfG?=
 =?us-ascii?Q?Uqj8LfklTC9qMCA5SM8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395b8caf-45e6-4396-761d-08dd15b4e0af
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 05:14:36.3862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwguCu3onj5Q9kK2O6ND8LWGOfSH9o3v3o09bCOWfEmeXGjEcP+3b+F2TtQANy/wRl5hbyH+VgABfXpN6gU8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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
> Sent: Thursday, December 5, 2024 3:11 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
> unplug multiple times
>=20
> chamelium_reset_state will unplug all the ports, prevent unplugging multi=
ple
> times
If this is fixing any issue ?? or Just a clean up ??=20
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index 52e758087..76a691043 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -329,10 +329,6 @@ static void
> test_hotplug_for_each_pipe(chamelium_data_t *data,
>  			      data->ports, data->port_count);
>=20
>  	igt_hpd_storm_set_threshold(data->drm_fd, 0);
> -	/* Disconnect if any port got connected */
> -	chamelium_unplug(data->chamelium, port);
> -	chamelium_wait_for_connector_after_hotplug(data, mon, port,
> -
> DRM_MODE_DISCONNECTED);
>=20
>  	for_each_pipe(&data->display, pipe) {
>  		igt_modeset_disable_all_outputs(&data->display);
> --
> 2.25.1

