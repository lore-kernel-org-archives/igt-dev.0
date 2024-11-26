Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD8D5A6DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 04:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603410E0B7;
	Tue, 26 Nov 2024 04:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzQh+wss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67610E0B7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732596688; x=1764132688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N5oWPOLtTQhU5/6RnfjRrjF9W75KC57p0gSWstE4Q2s=;
 b=YzQh+wssoLgCfYns6iDbunaKRG4PsR3TquMXn+vNcMxDVrD0bvrW/Bv+
 amWCroCshAxsaQdcJYwEBiq4XGzc+UEk/XyXM4yCPLw+5FH4XY9p1hrtX
 ciiU1x19K/6hvn2qso32mPNc2ydDmhtrvRuEh6LaP7/+hJoZ16aZm+/ZG
 m+rQZG7ZAPsx5jQOMs30yj1XH1XfmsZtKVZUzlMmyt1qdtSL0OOkknOde
 rEzUMBH6aBcjyOcnvhwzjEgyghHelKShzNyrIs6XwpNVRQCgsgjYBGY4c
 CRLldvFyz1FkD27g9uBaUDzntTN1Y8fWlLH7ycI1UcnRMjSOr+u8l11aF Q==;
X-CSE-ConnectionGUID: J83rVztpQA+g9QMMy6MswQ==
X-CSE-MsgGUID: IXp7SL1PSuyz9oqRl2DycA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="35589090"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="35589090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 20:51:27 -0800
X-CSE-ConnectionGUID: +c8jgGOUQaC/pdjEiLMTZw==
X-CSE-MsgGUID: PbOzjQPySxagACSMsHlYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="91900920"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 20:51:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 20:51:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 20:51:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 20:51:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFM1/ZQtBLpCtt5rWRcCYWdP+vAkquBmF5qo56G0O1PYAdTtofbYJOW+KTukaznnES2HcqhveLwM88roAEwXEmbKNSrtGLudGUAqPTPjWAcVBkhe3FgEbqzALEi5Nj6S8wC0At6p0zaFeUpRwMcckXwOLWjGCJchFAXIyDvZiP2KlvmTE5p6PVUSy58nWAKWiTvW60XjrLrt4SXgoth5objKgLOXGhNfn+FfifKF+LTyg+jklOXdVe0UU2JKpf8VGvXqv6qBiiWKSqQzvhqOPE9/TKVK8b5/XmIuB+WbogjpLbujYcgYcy8Us0NSrNNylwrPLLUhRrpmTMIUD/xZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8hhTmfjsHU7LU9nzROoym6GpI7V/Q8ez1CTB6hHNa8=;
 b=ozXshFpbPR0zk05hMrp06fFlEc2VwOUZ79YccWNPFgGc4OXUtzYuOyFPprOlePcGnde9OtBrbrOtPqP+0N2eHFvcAqm0HbFy1buF9wz0KGPG0zUXbhLyu3gD6jy+R3jmKv5LdqU8xKZ59qCnh0hitTDk5LdelTZGVETWrjSDKiSCf1m9r3G92WYlkdQVXYcklO7PXAczQQhXeSg183v88iE/JtpPO7sCYibhXxM31i1PdFtQQ4pyRsw4gxehiLRoxTt6dffB8vS9THOXmClj1z5Z3GkEsAhRqaFDTzAzyUu29ZjHMXAna35p52rn43y8O00hpfp8vSxW8drW6h84oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.19; Tue, 26 Nov 2024 04:51:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 04:51:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tests/intel/kms_big_fb: Intel display
 version 20 onwards doesn't do hflip with tile4
Thread-Topic: [PATCH i-g-t v2 1/2] tests/intel/kms_big_fb: Intel display
 version 20 onwards doesn't do hflip with tile4
Thread-Index: AQHbPKAcJJmieQB3o0SiVX0gys4kdLLJBBxQ
Date: Tue, 26 Nov 2024 04:51:23 +0000
Message-ID: <DM4PR11MB63128C87D28C796AF64D570E902F2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241122053400.1931176-1-pranay.samala@intel.com>
 <20241122053400.1931176-2-pranay.samala@intel.com>
In-Reply-To: <20241122053400.1931176-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB8161:EE_
x-ms-office365-filtering-correlation-id: 78b0142d-dbe1-4813-7f43-08dd0dd5fa59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DG7N41/1nk4xY7NEz0737x5vEbpWIBOV8h0XIGYTJrjmIsj4VMheu96WJl4h?=
 =?us-ascii?Q?T2M5LiwRQAJL27NBaLpE+qVJw3yqGQqvlZLzvonynW9j4H2S/Ppi0FNeuvJH?=
 =?us-ascii?Q?qjbrKJyegrUK4aO8RKhjcTlxUoDDGmiXF+mCua/srOI41w9Z8d8TvlkVzOGo?=
 =?us-ascii?Q?B5klPi3uRFM7CLbMOkizuvjWaxcYOydNdbCjzyH9Y/JZJ49wkHd56VuHXR/N?=
 =?us-ascii?Q?ZJpAR/xOt6i+uq9uqlTlUnYQM4j/EatX5DcN+o+xsxGL5B+yxzgT7/SFrxQ9?=
 =?us-ascii?Q?9RXXkxCtPtZx2XOjFjJJ8mZh63i+a3GkJ2fNB7d5qhzS0rPr2KCiXg7oe9SJ?=
 =?us-ascii?Q?RlgiJQcVf0wx9xt9xhXY0lFwCXbRZeHoV8hg1xeTu+06d38K6HftrtKmN5vM?=
 =?us-ascii?Q?hvArfBGmLPyhQlWzj5qC88PmpS7FtuuY+EIaSUDJhotFR7qLnk2mhm7F7FNs?=
 =?us-ascii?Q?9Vu12cXX/4LVoCmGfUF0aSQYq94BfCyIf7CQlwmS/ykNFVZt+9OTcxkhv9ka?=
 =?us-ascii?Q?fQgTQg7NQSmSiZf6zZLz2FbfxW4YGCmiOOfhyAwF+9yEusL0/mWt2KTdBaub?=
 =?us-ascii?Q?k45EZGmbDr9rqztxRzpOrMux4l2M7YB+TVWKTdoUSBtDJZNwN/QZWUeBZyT8?=
 =?us-ascii?Q?PuPnIZEUzBYDGPakJtMi7DahO5rMKXDbOPeENjrI8humJhbYJ22fd1xXEM5x?=
 =?us-ascii?Q?OyWuCXNogF2P6lMHS3o5Fl8kixKpnyIm3KD7e/TcHGAhsqkhIdAuvwXdoStK?=
 =?us-ascii?Q?qmS57JFVLldoCkuG7TwnEeXjUCNqM15REgPZ05NWKPnt42dCKH8Af2+NLt7W?=
 =?us-ascii?Q?bWCh3x8H8vtjzSUmrOypmBa0icna1zUd+PSxIAon+VNrWa7+Mx8zarsa+km7?=
 =?us-ascii?Q?Ijhp/ZTtoqCHKrfEsyIK+7WgP2k59f88DY1hkGHsnCyTvmHa0JqQ3Js9630y?=
 =?us-ascii?Q?rO1I/zS63y8nLEBpqtu7zOP50wiSFYGWl32lOO4CuqTh1np22L4FSe5X3Vzc?=
 =?us-ascii?Q?/aQz6CAw7/eC0D6qFApcssU9NO7oHAacqK+/rWNGIH/ahyfNE9mEE/Y1XJE/?=
 =?us-ascii?Q?jU50BV3GL+itiK0FNLStX3zlGT51Z//tEyKvD1+Ae7syKV0nv2oE/7Y3NvcO?=
 =?us-ascii?Q?nddDEodZpbL6ZqUWRvjsurN/f9fKLBE1rU1QaYtqR4WayfjMotvcmjUHhd9v?=
 =?us-ascii?Q?U65s91JunE/p5BRI6L+gTkgl65+4BFEmvQy/t/Ucak4U9rsQWPPJGD5Tav5C?=
 =?us-ascii?Q?+Kg6U+b4guQzv852gHEUGMaFdVlcbfqLkaDZXAIVvP1A/zlKEOxaF61DcPK9?=
 =?us-ascii?Q?PhbcA0LKDaVrA4GqaIK6vkdGteY3D4GsG8j8lZxKPdYjNLINa6sM8por6X6N?=
 =?us-ascii?Q?Zn/IXzSYAdm+KWZfLpZQuOnBz9kbxM9mQICJU7Ut+qEkQCq84w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CYknSi7qGeJQz310Qwd32ybQvAQvh3NtRJW6PbDeZ7bX7SxB8cG/Pc90bUPb?=
 =?us-ascii?Q?lUjAy3QRe2tnj59IN3RTgKOqmx22+2GhIAPrnLn6AE2eGSqDVfIujZJ1I19Z?=
 =?us-ascii?Q?2O3k0QYjSzn2/e3jaBH+foEI1uz++KxAbNl9CtzTJQzoSUd7a2yB/faFnRgT?=
 =?us-ascii?Q?Gol832jNNsNp0NCenSTp7dqZhoMXYFxXSbcJxV6oQEk10boKRaKAcR5/kxCd?=
 =?us-ascii?Q?EBUvhJCtOyGakvAZE6NgzWyi7jgiMPfoJG8svbt7sCJKuNcl9148o/LniSKW?=
 =?us-ascii?Q?ugtWJ27izK5NaJgeU+FPDoMWDf78kLh4b0zTtBPVLgT/WojTD+/1k5VJCe96?=
 =?us-ascii?Q?siW0atj4ENHw9mFQtrA0rXhmcIbX/+M/9s1KUkir3JrJbMYFKjV6mUwF0/HR?=
 =?us-ascii?Q?hcdyJ6ia+KjrK0uZX0pAzM37Og+to1yAdAZPPpcjYXq6wwcoqSapxjRhMsWv?=
 =?us-ascii?Q?GsUvj1mntCT2Vo5RLjwARBxmFTT62E+u3DRCQfkHisYUsCwsXvKKBxmLqNH+?=
 =?us-ascii?Q?bp7obwzybWVh+jVczvC20j+hoBG4HQmILLMEtGXZVeCcCeHzxFGKdNBYIvjN?=
 =?us-ascii?Q?R1RwpO2fryJYspRKll3zh1/4hxUO/ZJ0ugzxtHx9ObT2siSM2xSVKaOL0pz7?=
 =?us-ascii?Q?rVMt6uvbkWHT2NYJQrqEgwRRuHRHZaZ6+mmkZBAnRsvE3mZrHCUpXrJMIs0j?=
 =?us-ascii?Q?8D8fiqySl8m1eromUQtjuNOynC5Jf8WNH0Eqe4W2ky4bPJwQpBTGK0+jQ5AN?=
 =?us-ascii?Q?v0dAfTxxk/A4OFfM8jbwmmGd7F8Fkbic3XPQ1d8hN9JAW1OHgDf3uQ5fXUUO?=
 =?us-ascii?Q?FiL9SctUC+ZBQY7NiwiVKbaQuiCNstedTFCs0z/ns/isZkKPTkfaNXltPsju?=
 =?us-ascii?Q?S1na6bs6f5/4Om/yzrx8uD2YYBZZ1xqDiJ6CX62lzWRH+q7ZelmjQBgQKe1y?=
 =?us-ascii?Q?VNWusaiXmC2CC0J/5vXs8JX2aDdkxQ082eoXBURmzSK4F3iVz5I0AvHJcGdp?=
 =?us-ascii?Q?zYsCQ4lAY5baURiH8lUHPTeJ/Wed8VIh5K9TKM/9GFL1osvwdT0ni+7sNgoQ?=
 =?us-ascii?Q?FgJ8o/gC8W1x8HpMR2UMyXWPI9YXmvlonuDxOlZ4G5cHwIfAAFjDwMZoJNNj?=
 =?us-ascii?Q?Ex+M1nEK++NOZfvU7n1tN3wLc+dC25WWjez9eQaC8cnaj1cOqqzQ6/S1foam?=
 =?us-ascii?Q?TGjjMu/EDyOPSrQUL+84iVGzKFjXLG6WaUXGtmLFJL58VI37GqQspbcVM1QY?=
 =?us-ascii?Q?gcPoTbXwC7cDi+c6tUdi9lU2wLBBxfB/VJXhuqD5XFNjKeYpMzCVnwylbFTg?=
 =?us-ascii?Q?5P+SxNvkGITxxKqFU/SpM2vBEAG55YfvLunUQV3qxaGA0P6YvBeXlY8oBIdJ?=
 =?us-ascii?Q?r5yLuNJxLwm4YQkTQIVs6/kYbd2M1cUSQHTdeD+hGn7gFQDwdmCLbvH5HNFq?=
 =?us-ascii?Q?VBYLuWKB4KSpiDUNSiYOd3AeWHDEswK2iEeIpfmk5rTcwQc//gegO3wq6Px2?=
 =?us-ascii?Q?YOakcHXe7pj/rYDG+F+pGq1EzeRtyxCeylCd4vX/GCA/BnQhNqiu/Vx7qYMx?=
 =?us-ascii?Q?tBz/d/QsbCCTl+IcRKY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b0142d-dbe1-4813-7f43-08dd0dd5fa59
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 04:51:23.5286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJIuyqUqGGrcjwtep/iFy9gxRnOycGaVQ5Tn6osYSuspxXJpNY8tgXjIZySWWWakao6OLpgJ5eafVWV6TyKn6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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
> Sent: Friday, November 22, 2024 11:04 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>; Lattannavar,
> Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/intel/kms_big_fb: Intel display versi=
on 20
> onwards doesn't do hflip with tile4
>=20
> Intel display version 20 onwards, Tile4 no longer can be used with horizo=
ntal flip.
>=20
> Bspec: 69853
>=20
> v2: Fix the shadowing global declaration warn (Jeevan)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c index
> 7da3d12d4..67ab85852 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -965,6 +965,19 @@ static const struct {
>  	{ 0, "" },
>  	{ IGT_REFLECT_X, "-hflip" },
>  };
> +
> +static bool test_requirements(data_t *input_data, int l) {
> +	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
> +	if (!(!is_intel_device(input_data->drm_fd) ||
> +	      intel_display_ver(intel_get_drm_devid(input_data->drm_fd)) < 20 |=
|
> +	      !(fliptab[l].flip =3D=3D IGT_REFLECT_X &&
> +	      input_data->modifier =3D=3D I915_FORMAT_MOD_4_TILED)))
> +		return false;
> +
> +	return true;
> +}
> +
>  igt_main
>  {
>  	igt_fixture {
> @@ -1123,6 +1136,8 @@ igt_main
>  					igt_describe("test async flip on
> maximum hardware supported stride length for given bpp and modifiers.");
>  					igt_subtest_f("%s-max-hw-stride-
> %dbpp-rotate-%d%s-async-flip", modifiers[i].name,
>  						formats[j].bpp,
> rotations[k].angle, fliptab[l].flipname) {
> +
> 	igt_require_f(test_requirements(&data, l),
> +								      "Can't use
> reflect-x with Tile4 on intel display version
> +20+\n");
>=20
> 	igt_require(igt_has_drm_cap(data.drm_fd,
> DRM_CAP_ASYNC_PAGE_FLIP));
>=20
> 	data.max_hw_fb_width =3D min(data.hw_stride / (formats[j].bpp >> 3),
> data.max_fb_width);
>  							test_scanout(&data);
> --
> 2.34.1

