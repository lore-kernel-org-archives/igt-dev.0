Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10911C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 05:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B59310E05D;
	Tue, 28 Jul 2026 05:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B20QcoQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E47B10E51F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 05:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785215140; x=1816751140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=elmikDYkzCLwVKWJl7XLgh7W53uVhNk7sbPsEG6Gez4=;
 b=B20QcoQU//WctJl1mhe1d9V5CDA9VNLR4vKBzvzndy63q1GD2niB46dd
 ePVwJW683m+MrM+mZjWlfFefDj2NFpQdUkk6F+nrhRuKLCQ64KJOHxnf/
 lNIVaVewlxoaa2VlZob+ksPjeX9+1O/EJPWUMBnWvni+f4yccdBDo45TY
 hXTA4cAZsSV+4lfxvJPnIWcBZGMfRvDO9AlekN2mchD2ou1wj8BVyQYEY
 WyQQwKvvIUD7lreqdmjyx3a9hXtvnY4VP6kirSvptizPSNZX9I+VhwOFt
 99eiQ1nCVmMO73AFN6d0Y6cc0uV+SSyb60Rh4ng/vVrkCT3iPgP1+HlY7 w==;
X-CSE-ConnectionGUID: 0gNxg5FoRQGVjAhPoYCuSg==
X-CSE-MsgGUID: 7hA26c1bTqWjuD60vBtiiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97167283"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="97167283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 22:05:39 -0700
X-CSE-ConnectionGUID: QVU6AoaUQ4ORKKueqTa93Q==
X-CSE-MsgGUID: unjvaBV4SM+8PeIjn+xKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="255659349"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 22:05:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:05:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 22:05:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv36fKBtRxnj3bYAdB6ax9CfI2njMU3e+dOgNGrD5T7uQTDS+kUeEh9AC6qCqrbYUpt92JPQxqb9vgX9mhROaa3V33T+Ra3/OSXtJqt/mQYaXW/9wnhn5UDe6ndzEmFRSb4Qeb/9Q1O+k6zEq5IO1nH9r0kzA/zxYG63h1SkbFCh/DiWg5tgwq7dxxeTDaanla6Z5DDvkuAybXcnhccVAzw8KwceM4yIJXg0JED88ZM9l4jMmNTBsY82Hqao2Dsr1oAWa/ZUSxOJMFjsq0UcYjHfUuJo9pIqFiEXSuhJO83ZNpHK+Jkjyx1KF4Z04TYJ25PItUAJDPd91HmkQlymdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95cpXSNH4F+ZiJWq9JxLHhh+WwW7Sou3g+QHeo8VGHo=;
 b=t73yTQ6aPcaHhqmvmBy/YT7fHudbcCq6zt1Qo+a9UeETW8I2RQOp4w4R56QYI42woLeC52OGgoxKFhNnwUWE++Ss9PSETR8y0YawgVfMVLsqhR0u5PhaCii40Dh/2wReAMgS6lJr9xC3I6RikkrPKx+XM8NT4lX0G36DFBOE/rvpWxPkdjbNo9ie3S/6N46lwlqUkcTz8/4Q7WfiHJSWy0dD7j+c/qdlgKwWH076uK9zrrYboN56DAsYv/fzZUeRNdhAMxsX9gWH2I9sNOj+pJG4jFqHmIXWErNVF8PxX4F6Wu+HHmftMbMNk2e5L1XJ5l9mzoMCiXx4TLd32B2TbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:05:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:05:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Allow low refresh modes with
 identical clocks
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Allow low refresh modes with
 identical clocks
Thread-Index: AQHdGt4IK1BuZZgsBE60e8Vu5qxXFraCZ41g
Date: Tue, 28 Jul 2026 05:05:34 +0000
Message-ID: <DM4PR11MB63124ED579931ACD962C6BA690CB2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260723200101.3944213-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260723200101.3944213-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ1PR11MB6106:EE_
x-ms-office365-filtering-correlation-id: 2c05a36b-41c8-473d-4968-08deec65dada
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info: nlsr4AbnpPbNe7u1tkphWLbtl2XUZEVsdnEkzJh9y7C01Z4VGvy2GDBo2Ff8WLfUcBV4a6scwchK/75n4Eaj80tGISqK5XpU2YeVaVuGNZpbUy5rRHv2O5wXHvtkPDJ0VL5rZ25kpAQXBWyjF28r9jCiWDg27bs99c7m/wGfKO0saUVpcL5uorFvGukAPqwOhDrgVBiHSFG9BRcWjso5r7tRoEEOAaIyO0FvBT+Ohs9LXG761K7tBZubnY28J/UMcCOU6Y9YMygQDUIJVopbE6zjavOoAk+p4GGysNnANlOWshExykJv8sk8C3Ih9SIOO6WfKyZRLE12wZwpK3WQ2PK+sa5mfJ1nSRjaZmYo/TWnLoPqNlIDGqCg/k+QWJGQD080ZSj0BQ8517Rb/Xc/roUj+CU/X2UX/L2o2fQFHcjYUYIRfqF+1QVyziID5nmOgsZLKuqWvTGF/icQXvUJ7vbIdutFUL4cI14CBwsGxKj+44zqGcGH7bj3ZjV2SYKInuB6osKhR/xIqNS9JyghLlYcMxkG3dUxyhjbzu4SXLl9L66VZ4b2443hZBAOnw4QWdR/2nJVdodvsUyLMrLxr3OLvqmSIf8J09hos2rtNHT+pRivh8MmZJR8KAwVLqtQFIJhLUBPEImvJbAJ8nbsAii/dPbxfoM3XvACIldJ0q4HfA0fRNLou06HHSE87PW3d+5nO1mXvT1q1VB21Rrfs+KuBXY5HESD5LF6ksQdVqE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6CMpJaB5cw6WXIyD/GOmdUnnnzjp4TrrZbKQ2d6P+tpA3LcStFiG3aLEGfr4?=
 =?us-ascii?Q?Jq8nZ5be41lW/bnQSTdEWDTEvs4ZrgCfdfcNPqcIkZPARycUr14/KSX8NbPT?=
 =?us-ascii?Q?Oa4uaPmJyW2HiCTXJLHU4sDMj6JF/sv5KnLTvKKl6xPgFCptN59LlWQ1zq8e?=
 =?us-ascii?Q?i9xW3cPaQTz94QD0f24xclPsAauD8HR/+eZE8g5JkbUlJ8ZZF7ND0pUtd989?=
 =?us-ascii?Q?3DmpM3XN9XcbFrHkg2GoM22xETvPNbS0RRTdHJooXGongNS7VIBuyHaWXN1x?=
 =?us-ascii?Q?cOaE92CS85smuvTrn4Yq/X8ij4u3Rrm+LwMXTo9YD4xH61FcqX9Nvj+O2jFs?=
 =?us-ascii?Q?/BsWLDFpB8kyZtuv/U8UgpJR0VJ0CcGQprXpqQ5HZN75eWCJ1pBLpYShmxzz?=
 =?us-ascii?Q?LMeFlNGvxms9DMLcFjUAikIiuNZ48vwz49ES7th0HP3Dl6Ikh5dOZmUTrZsw?=
 =?us-ascii?Q?2Ix2ciAUUtmXrOpvPBhCwTaPwSYqmgqfvnWQEpoM5Y14h4bHxUS/LdFv4/qw?=
 =?us-ascii?Q?hVoFXnEbUIBScNaDQELISrJTfQOCx2JmCoVqKLhdukOcjXM0pttMHUJwa58Z?=
 =?us-ascii?Q?h1AVvu/pc2opZTcRSbkPdPdnm7OHTOOzIMHQzOvXcThOq5+Lij4kDC3tQ7CN?=
 =?us-ascii?Q?Rm+gJ1jkOiTdCQ616Biz/N/8+8STsv6ckoqR/KmM8SMTtWvWqYlMwz5YFdDS?=
 =?us-ascii?Q?T+EW5UiYUpz897TnHGBLiZcypsZgg/p0wAM3WfSoJK4z1Y8jfOeWbmIOpMOm?=
 =?us-ascii?Q?5/eVzjIQ2eKpRvcoqr+Qf9NZv/cPg4OF9dHeIp9qB37L+I7M3WZJWJ7e/FRY?=
 =?us-ascii?Q?Nw/lo4EGLUWgO92tSGuM6fnycQysSMaOzdFn7KCK0+kVe5ANYD3sCWxdfC3+?=
 =?us-ascii?Q?omPyi+dl7t6krOy5p4+z6ZGFpwfg7oI0oI2ckMObL4ULZfzzkM/tx74T3Znd?=
 =?us-ascii?Q?J16+VNO+jU9H92Qj4gPWalBWcTdq0wN3g1FBChBIfUI3xNj4cf0iYsDeSxtM?=
 =?us-ascii?Q?nMb824Efb8AIsqVPXoOIGHpJ3PSSF3v1H22ybZrTLWeyVnevtFTMj8lI4Yrx?=
 =?us-ascii?Q?gwBQlLa6IT5yEGBX8RMI/d/sk08X4toH3Sx/Cbb/sZA096slOAFofvprmlQf?=
 =?us-ascii?Q?ZmU1wyXdknpX251i7JxmKh+KDVbEwlg+htz6HTe+2JGbP3MQWEwHrsiCMdDO?=
 =?us-ascii?Q?yUhG50y8tCKj6TE273nMbadvEzVza/Ld85FyM7Pz0gdklrDEgCvfwwjGp3en?=
 =?us-ascii?Q?GEi6kbvB3uDZYhVwPdle7QjgR3xskMPAtfbTg2NwW0Y3cR3YJe8gzmdMrg1O?=
 =?us-ascii?Q?0j3Qfyw7yvNyh5p/kwOPBIfojnnAfaS2WXk5ld0oHMedBPWIl9F3Ze1K+G9r?=
 =?us-ascii?Q?3Qjn8y7jvdg0IJifQ0dv2dwFtkF4WWabqG7h37hDhpF40r7TTq6c6dy8JCC+?=
 =?us-ascii?Q?50nmVCRq1dkVMXX3qy2rUevyMLPwjaHLGTqsr1xXxmu1aqvznBmGNMvNsrhq?=
 =?us-ascii?Q?VsODJDQ5ZK/FKhpk63kxgrySkwO3LpwLCSUMRvoi2JrPROPQ1p06CScveJXC?=
 =?us-ascii?Q?Q6bWYWddoSEwShd/cl8CHJmRwkbZmgWRAvQF1F2E4zu6lhZ953geaOLAR0Ti?=
 =?us-ascii?Q?rk6VF9aZv2mdmr+Dj/Yi7Emlu5nuWpCXbmhUnDu8UJL+KWBGpSVYUhjT2xps?=
 =?us-ascii?Q?kSZrjz0u4fl/gumbmSrsVTS9MAwgexVeLiTkL7zhHqM9z/gi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YmArogQWduVgMUXq9CDBF7lxeR+VPu6v5UBAIMAUwyTMew2rqM8jwgR9pYzuGVHLsYI+v4kN7RvsEjGA8oJtTidIExynKryr90VPRir3Q/rNAwZvL2L5wNW8256yvrkM2T95NEU2AOiWhX6BlB4JgKMRDSl27eRQmxxdLXvgeoDhojPHxgx/puISnTaEOBGHoMvrSvJ1kW8YbSUHm6KqL5ljdz7KKW8xc4wRfMMPx8RhWI+Owaamu2JepE6bk9jj5kS9gDbqwdysovJZ5xCC7A0+QFQyz9jr2SlZ6CxJHqjr4mURQQG7XWyXFho+rjKBCIxdKng2ciGvRP94TPQCbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c05a36b-41c8-473d-4968-08deec65dada
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 05:05:34.0653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S26ukWOxel4nQO+sSi7+z9ejfM1pU5fNfppEGdAj38Sm30tSxVb3I1J/1Nrof3y9C82QoL3Uya7X944uk3QzOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
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

Patch LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Friday, July 24, 2026 1:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel=
.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_vrr: Allow low refresh modes with ide=
ntical
> clocks
>=20
> Some panels expose multiple modes with the same resolution and pixel cloc=
k,
> varying only in vertical blanking timings to achieve different refresh ra=
tes.
>=20
> The existing selection logic requires a strictly lower pixel clock, which=
 incorrectly
> excludes valid low-refresh-rate modes when the clock remains unchanged.
>=20
> For example:
> "2880x1800": 60  678528 2880 2928 2960 3040 1800 3711 3717 3720 0x48 0xa
> "2880x1800": 120 678528 2880 2928 2960 3040 1800 1851 1857 1860 0x40 0xa
>=20
> Both modes share the same pixel clock (678528) and resolution, differing =
only in
> vertical timings. Under the old logic, the
> 60 Hz mode is skipped because its clock is not lower than the current mod=
e.
>=20
> Relax the constraint so that modes with identical clocks remain eligible =
and select
> the lowest refresh rate among same-resolution modes.
>=20
> Fixes: 771fcec0819 ("tests/kms_vrr: Add new subtest to switch RR without
> modeset")
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 82eb8554a..27f18e8d0
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -231,7 +231,6 @@ low_rr_mode_with_same_res(igt_output_t *output,
> unsigned int vrr_min)
>  	for (i =3D 0; i < connector->count_modes; i++)
>  		if (connector->modes[i].hdisplay =3D=3D mode.hdisplay &&
>  		    connector->modes[i].vdisplay =3D=3D mode.vdisplay &&
> -		    connector->modes[i].clock < mode.clock &&
>  		    connector->modes[i].vrefresh < mode.vrefresh &&
>  		    connector->modes[i].vrefresh >=3D vrr_min)
>  			mode =3D connector->modes[i];
> --
> 2.43.0

