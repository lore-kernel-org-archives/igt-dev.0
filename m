Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842ABC27C75
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 08:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14F88F78;
	Fri, 14 Jun 2024 08:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IstmHhMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A4510E229
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718355415; x=1749891415;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h3WQyy2EsBi/3EgT931TtQ8N7AJdFVRWjHnjp0EsMzU=;
 b=IstmHhMU3ZU71Y//u9rtxbQWbLGeY6Y7MEY5P+lXmQBlMa36Dk5aQ1Y1
 TsafUqxzHJXdq/6Ijd9rHevyFQxoeMKlwgsI8crdJTU4igmrRVAh8/MVq
 DxknW6pmtZzp5zzgzXqtH3WpB161BprdHyliCZC1xccxL6dLCLTwE643s
 wGTR1g2XqIzBo5GUk0domU7ANp/IeorpkFfY/luzUY3RjA3IB4FNiU46q
 oMypjk9mhvkM/7nmnkhc5znA99AFqiqaF04LDryXLyk66JhTEC2rzzBFG
 vL5xHk3prY5B8nTYzgM51n8F5wYcsJqNTO4wsy14QZ6x+WzXEQl/J/fuq g==;
X-CSE-ConnectionGUID: D+Q9iljUTsS7KY694+vN1A==
X-CSE-MsgGUID: f2+exK/iSd2b55l9dUN+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15381206"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15381206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:56:41 -0700
X-CSE-ConnectionGUID: KM89jjnBS2K2Tw8tL5nzeA==
X-CSE-MsgGUID: OYXJuUIKQ6G2VaxNBWlFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40327586"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 01:56:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 01:56:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 01:56:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1Hny4r/tjgvCkI3POesaSwNm35OzRXlsxV5UY1snKnSuwh9yr1IMQol7B2Tw9Nc/x8obzs83noryVXjIEJC1m24WKZxO7st2IYzuP4FvwNf2Qs5/5htdAxq6cI4JvHoZ+uH1R07SjbpLxsuwcQ7NWak6YqU+0kf3chx7CqgLfa6iKqEl2w0s7bIKSow7XZPsmasOrdRZ/PHfcxbiRP+CBvnyWZXqu/+5N2sX3r2anK4jcd2ZZJM6Q53GbdBjuX5OsM1QwgG5nkvSCGKDikKvNsis97vG4/rvPFc4GroTXFA7jX72u/QrBNBJmnKcSRZT5LJ25Gv4WrwvmTiT3VO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH6laHME7/w552BDSVP2+M30cGKgMmWVpTeFx25+uEo=;
 b=NegZ4PYjVnHfzErg0SC0WmRRmRefqCjcpVPlki9KD0Curp6ENLRZMqk2D/rH4iAcm6NRtFsmbY5Q9IFuqglkXVVwunEHN3JbRQOFU+miy/xvl9QinF0E+IDqH2FHzwxf3d73fB9fTUodDLBCscumeLwxXyqHI93gEqru4zL9v1m43WR/Nem39V4SMq/PjLLBw3n79O5++GI7XOBNqonlXVOc4m5bazrhU0/m2CQnR9r0t4q/a3ArtphUxUF+2I+BHiDY/iNnDL0Z3BQtqIg39+xP3nNedhVBzwQhlL3SMBWNNbonu0CWsg+iWnmT1c3Jc4VxcR5rpy11L4zaNLhYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.33; Fri, 14 Jun 2024 08:56:35 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 08:56:35 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V5 2/8] lib/igt_kms: Update force joiner debugfs check
Thread-Topic: [i-g-t V5 2/8] lib/igt_kms: Update force joiner debugfs check
Thread-Index: AQHamhXqCmLV9wfB8027NavdwJsGRrHHPVAQ
Date: Fri, 14 Jun 2024 08:56:35 +0000
Message-ID: <DM4PR11MB631201546A939D05577CB1B090C22@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
 <20240429090930.1905110-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240429090930.1905110-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 303b7e69-35dd-4c9a-6557-08dc8c4fe53f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?XvFQaCWHVFAOCwyGXd+4S+wMqIb+L90kX3ShEil3Cm07+ALnYrR49zKYU5r7?=
 =?us-ascii?Q?Iazvlm58KcePpDEKj8ZVwGclA479bT51Xn91THuih16pV7OoauAJWxsJdT/f?=
 =?us-ascii?Q?8PTVZcfbt332hNntl0LdxUCs8duvMe/NonTukKJf8J/AuuD/USK9ZlISmbJE?=
 =?us-ascii?Q?CZCYUKF6mCTComzIxo32NhWgVlWKfyCA9tlvH8MVADbSJlqOza2dIpZ3ltFw?=
 =?us-ascii?Q?6jvEwlWQYF653inkPavAfOAeWQI6T0zlbRaMdBKC9du41yppIK7nNiA8okll?=
 =?us-ascii?Q?m1jr5xeL1WtU/0m1RcdjLXGlI96an40i5dz6YE07KhgjM/grSkX/1ZxJ6sLY?=
 =?us-ascii?Q?pt1B7nlOnN572xiZnnjd5Fa7CSjuwbfBL8xvUuUcg3rv7EfCd9W038pQhG61?=
 =?us-ascii?Q?D9+RoXKoXRgajOL/bJ2qaj9dC4t/0JshRrRgVIL/UE2CzHXASCpjiYb15HkW?=
 =?us-ascii?Q?O2pMiBquYOj/EX/43pDXu5L18tDzTn/xrxUoxMXdyxbpmp5OTRZzm+lAnf+b?=
 =?us-ascii?Q?Gl1RspyZqOkFFz3Qrd+2TpNtsVGokanmZMPyW130Zlo1F/pjNpiFGsg/Bi2J?=
 =?us-ascii?Q?jdsVfcTaj9S3nS9/53OkL73GMSrCbfAUtrPYkYCleOEATqUcA8uZw2BdK2YA?=
 =?us-ascii?Q?+0H0cd3niThd+HkQx3ZMeelMYlWfhrai74+eRu9pOamAkBmCHuAA9ljWgW9o?=
 =?us-ascii?Q?QfDaWYBQU/0JCTFtCNyZrNn4CuGFH5WXUv3iO3bnKn5BObOoy4SCK08xqJUh?=
 =?us-ascii?Q?ALR9+pOQLKPIbhFCAjtGJDBQH5vl1QY74xHlTcnc3/TCPjMl3YRd44ZJS3R8?=
 =?us-ascii?Q?QuZNHUl+HDNtxSqryIMGlld4FoavSe+p7AE+i6BKrLdp0YIW2ACT4ongJwBw?=
 =?us-ascii?Q?SerSixBk9FWNGC7A0/Ec6uczONZScASVvXfF/6Jl8K6ZhuB5m2HTQChM3Iva?=
 =?us-ascii?Q?bI6L8qKjPWE3ditORSo7MeRPUxkCyWzDduWNjrGoaprWDcC+IM9N0fiERbz/?=
 =?us-ascii?Q?1tYboiB2IAdTH6lTIn85ULL5eA3j6rL0RdLx+rbfctZLOhI1hqK4YbnIUQIv?=
 =?us-ascii?Q?WYAcx0stEaSBr1LpNppnwALCgG9VXZ0WLopg8ylKv85KQnrzRtAd/w7J8HKP?=
 =?us-ascii?Q?EnPkwR5hg72kRFQpEi7sVUtbbC6HSoMOReLYNdsHVdZbOSe88g86i7rJGezV?=
 =?us-ascii?Q?c8HmnaSLnaXHtcBy7QMdY008LGzjLbuT0R1BF3BbquijDphgUDeL82MwZLkC?=
 =?us-ascii?Q?P+52H0XRj/XTUCkB44ynAX2x3oVmkLKb45I4FnpdR+4MJ2OZQM8W2bvB494q?=
 =?us-ascii?Q?aWQ4/BjJ/PvuZuCgY4Dq5MMvVnnR/oXQsdJ8W+tkcjGoYfYzyGJeRmDQwfLT?=
 =?us-ascii?Q?yWZS1Aw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/8RuQNJnHqCaQrBD5AJt8pjWmMpvzJ5JX+2xlQFh+LRhBDIoWXqaYwchoEz/?=
 =?us-ascii?Q?xrSrDSTGJv72b99aR3kHnMqwHYVVTq5+hSRuQ+fZG6elFlYivNq2vN7UhDpt?=
 =?us-ascii?Q?lE8iGxgPd0QFZEPO1AvPlCNDVjnnn65cKpycyiNOdRbIXNGFV2xZB1676Fvq?=
 =?us-ascii?Q?TW4tCvkJbFMyg1fGxXZAeUhoNBDEUmz3I76WCWlo0eQPgVN0Uxooj0npdNyX?=
 =?us-ascii?Q?SM1UCQ84kqQKjn0hOK7h5ZfwKf12HYDMb2yPJ+Z8Yue5foFQLTbOb5+eE0oy?=
 =?us-ascii?Q?dG4OobcJq7o6qIMpb8RB1z0FEyawvtcpSNeK11mNqOMcxeSAavC+KPV/bKcL?=
 =?us-ascii?Q?hAOTTbl7M3S9kaHyeF2Iiokdd8OlmGebtICiyHlKvTO76346qwHVSStNu3I1?=
 =?us-ascii?Q?r9090VU8oyzi1aRNSfOA8RNJBeD7Y+1Is2I4zPHCq5tpagDaHmPxG2nmC4a4?=
 =?us-ascii?Q?DGxXvTIPUY64Mz9hjHz0IeLgaRrGEeOF/l26f9rNTzKQgbAs578lDdcj19GX?=
 =?us-ascii?Q?i23Ne3nC2m1m48KkRoiE5s3JtSmYUf9HLwcl7TdtawRew66ejrj97x7QuDA4?=
 =?us-ascii?Q?0bCcJaGOPwn8x/RtVCB79//duJWUCdl7OMLImDulKtAjEwS4DQ0vswEArCPT?=
 =?us-ascii?Q?P4/I5Sicf78/96Dqrqxw4NGLu7h0UyJ9UlraCHwylrqIfSEe4Cuwirkuop/I?=
 =?us-ascii?Q?I51jbTGUgc8z6sDyIbjbW43HBNd/+5lsv31atHCHLGXWdTVb2n0C4f2sJJDg?=
 =?us-ascii?Q?0iDxEdDyVlnQqJ5eepxQwz74QpQLgICclPnDqVVjlphM4nbpKTaWjHkd8cqZ?=
 =?us-ascii?Q?ijpqer460FntlgdFKy1vUL0xkGTp+YQWUITpSKN7bWHZhdupUPdlMLiWQ+gL?=
 =?us-ascii?Q?F2Y9oz+aSmMm/m3Vlz/XqEzfQn6sZZWgUhSrV+qABRuif7WJhlaBFf/d/6Ey?=
 =?us-ascii?Q?kfdCvgfNuEUon310N7LMMgsqb/vUCFL76qoKBxClTuQMT/WA5WncPVKfRqIh?=
 =?us-ascii?Q?8W1ZiME9xUF7hC6am6h4B15l2AfCBCN9G+m97/5YqnipVZA4lOLlmeiR2aLv?=
 =?us-ascii?Q?9gey+xgH2iG/kJK7byGPjjfNt9nMFvaMcQLC3U855afZLOY+LVjyc2T4H4gA?=
 =?us-ascii?Q?n6cCMZTjC1RmQT+clLulXli05JrMIdeA3yk1z2npCM5XyJMhYPWKgfnyQBbf?=
 =?us-ascii?Q?DzknEYadeM1PJVxLwZjDadfPLyujxsdO1E1q7nwB4MDn4SJkkplCvy9HMo4H?=
 =?us-ascii?Q?Q7xTaSZRrYgrPyBhMZkU/NP/mDS1z7t+WXVEnA34ObpmIbjncIwxMQ/Ug3FU?=
 =?us-ascii?Q?QtIXRMq/r8Eg7umbZoB/SLJpWTQ7YC/EGmmnMjRt1UBOPm0WIWJUIapwVx/v?=
 =?us-ascii?Q?c9n7LR7ea3Sk+cvHXOxBnd6mEFjlnyxY0RCX6nHAKpqe1flOHChEUIh6Z6qD?=
 =?us-ascii?Q?Vjfq5fZt5K/0CzSfIeNRO0yzYEvahHizXcej3fJimAZK/wHPcmxfFvVrwxSj?=
 =?us-ascii?Q?BbVqYkXJTOuegw3U2XobzL00+2JTg2Q45zkIQc0BEZdf9oMBU/uxp54iUjTX?=
 =?us-ascii?Q?YYt30DH47odMoa34auRHdINsYYuRLF6YMjda8TpD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303b7e69-35dd-4c9a-6557-08dc8c4fe53f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 08:56:35.5994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4Ru+8TGUa2jtUfuNHZyH6tdo22Qr5hzdbiSIcEvLwJPud3grz7+R1iHoOayLkOPl0yDhXrEkPXLDH2sOIpqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 29, 2024 2:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V5 2/8] lib/igt_kms: Update force joiner debugfs check
>=20
> As we are using only connector name in the API, no need to pass the igt_o=
utput
> struct, this patch will update the helper accordingly.
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c                | 14 +++++++++-----
>  lib/igt_kms.h                |  2 +-
>  tests/intel/kms_big_joiner.c |  2 +-
>  3 files changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 6a41b535b..743650321 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6306,15 +6306,17 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,  }
>=20
>  /**
> + * igt_has_force_joiner_debugfs
> + * @drmfd: A drm file descriptor
> + * @conn_name: Name of the connector
> + *
>   * Checks if the force big joiner debugfs is available
>   * for a specific connector.
>   *
> - * @drmfd: file descriptor of the DRM device.
> - * @output: output to check.
>   * Returns:
>   *  true if the debugfs is available, false otherwise.
>   */
> -bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
> +bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
>  {
>  	char buf[512];
>  	int debugfs_fd, ret;
> @@ -6327,12 +6329,14 @@ bool igt_has_force_joiner_debugfs(int drmfd,
> igt_output_t *output)
>  	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
>  		return false;
>=20
> -	igt_assert_f(output->name, "Connector name cannot be NULL\n");
> -	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, output->name,
> O_RDONLY);
> +	igt_assert_f(conn_name, "Connector name cannot be NULL\n");
> +	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, conn_name, O_RDONLY);
>  	if (debugfs_fd < 0)
>  		return false;
> +
>  	ret =3D igt_debugfs_simple_read(debugfs_fd,
> "i915_bigjoiner_force_enable", buf, sizeof(buf));
>  	close(debugfs_fd);
> +
>  	return ret >=3D 0;
>  }
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 01604dac9..979cf1300 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1215,7 +1215,7 @@ int igt_get_max_dotclock(int fd);  bool
> igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);  bool
> bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode); -bool
> igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
> +bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>  bool igt_check_bigjoiner_support(igt_display_t *display);  bool
> igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
> bool intel_pipe_output_combo_valid(igt_display_t *display); diff --git
> a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c index
> 4979cac06..7c370bc60 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -323,7 +323,7 @@ igt_main
>=20
> 	data.big_joiner_output[data.big_joiner_output_count++] =3D output;
>  				igt_output_override_mode(output, &mode);
>  			} else {
> -				if (igt_has_force_joiner_debugfs(data.drm_fd,
> output)) {
> +				if (igt_has_force_joiner_debugfs(data.drm_fd,
> output->name)) {
>  					force_joiner_supported =3D true;
>=20
> 	data.non_big_joiner_output[data.non_big_joiner_output_count++] =3D
> output;
>  				}
> --
> 2.43.2

