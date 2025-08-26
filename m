Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A0ECA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 05:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3910E2C7;
	Tue, 26 Aug 2025 05:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVu8H3lA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B63510E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 05:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756186245; x=1787722245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PoQDXi6MJCQPLztq6CpYMbbaxA2+ClWLPBiV8Cr38nk=;
 b=lVu8H3lAwZAV6ejSV2JRoYZmqZZWgUyIBPbSQ4xZQanEA3w84wumN23X
 hxKdkaAqFQ1aDz43F6c4le5QGnRnDaoi7CCtjGHwO2JvL88XcwpS/ErPl
 WhXnZY++qIO+AL7tgQZ/VNzXoJQ0uvwMoFeRNzszdnPiP9ySyA5Ymq9DA
 4z18X4g7eJIw0CdB+AqF9zL7i8PsyGrvhaIFEMccOuiDGAw87M8bcK/qD
 Z4AURZS9RG5KU4isNSgaJ/U11t5Cnt5glmaixloIs/yMGUbGAw4Bi5VQR
 H6nGW6llJPn9azGeXJ0e8t7ph7eRHG6skvv5yf5dU4EzqMoeQ/t+gj9mV Q==;
X-CSE-ConnectionGUID: fwrW0MEEQO2STmiuv7P1qA==
X-CSE-MsgGUID: PCSBNwDMT6K8qoRjtomQEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62058368"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62058368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:30:45 -0700
X-CSE-ConnectionGUID: Bfz0t0sLTyGl6VrQ8lg0og==
X-CSE-MsgGUID: DzunDEVOT2azk4rLPOmwzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173789972"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:30:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:30:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 22:30:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZK8AWE5QMxIaroVBC/DUZ7LOtyhziaDoCtgzp86c9Drm6fnY5OskOwel9yJHvkVbcDeeQmcFIagDkLS5DERscWwW6VF6coVv0xmodwZLfFSHdLnifFQSqsw70fHLZmS48wqXT/ETGfAFvY3q6Cf6YoevohXEoyCpH84hRO0LCbaM770J7UUnLXO/PA9FRmVPgI70SmAqUuYCSQ6qYFWEkjsutOv49tPhT0VyxxoHuoNyJYVMloZqIY5gttgVxXB1Pbw7ja8DmNorhwRgdZCEMPCkQuXjBBras6tqwuOYDMUUm+pgjTPqH1RnWWRr1ZqXcXY9l1/NwGvYqdLc1mkKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWle5n8LwEfexP8Jw+wDKWfDwag8IxrElMyVHyFLFtg=;
 b=FUGwjg86csEDzhlp+59QEkklYSL4CbeSIFF5TOSBFTIQe/ep1472B5zqDO7SYjId6ppwWzX5G/cU9GiLms9PzZ1zgghzKJ3cpa07Klmo+IPrJOhRH1Wsg8qbeXi7N7AdDf81elLIBLYkm7PNl1BWI7vfKoN7jskEFIR1B/C3Tam+nt/ZAAxS94DVCxnw/S/13Rlb/93XauREGFcZUpMhjl2xB/Mzimduunf+rq+w4+Zv0LtlD6toxdpWFZYvkMOCEKa/AUzp8O8dNHdKMkr5URpE+rZKJPWzSh4LRU5i+XRdi1/ul1KSbepNttn9UVVKvHUGIK0uyHxCfh1/5cJIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.17; Tue, 26 Aug 2025 05:30:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 05:30:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Blocklist cursor frontbuffer rendering
 tests on xe
Thread-Topic: [PATCH i-g-t] intel-ci: Blocklist cursor frontbuffer rendering
 tests on xe
Thread-Index: AQHcFc6k/xags9V/rEGLhqNyTb3cTLR0aS8Q
Date: Tue, 26 Aug 2025 05:30:41 +0000
Message-ID: <DM4PR11MB6312DE37A794D12A09BA8D3B9039A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250825144324.1585829-1-karthik.b.s@intel.com>
In-Reply-To: <20250825144324.1585829-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7084:EE_
x-ms-office365-filtering-correlation-id: a7b203d0-af90-478e-211c-08dde461b26b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DkGpfGUZ7BhdFiTYVM9hl+sPEKvTcE2SWSWXU6wvtne0OMH3/Fwz9FlBmkQt?=
 =?us-ascii?Q?4ZFRjNsJ7w9BocEnWelfg54jTWBL+mnbwGVuRYYTMWBlM14L+22fPt8+THyR?=
 =?us-ascii?Q?m4T/bwTIIdn4+K+6nKuOmpvowLx9LHCchazmjEXh+I1+IzR6uBiysN95ntev?=
 =?us-ascii?Q?NVBKJOT5cZ/Wi19HS0Zul4h1r1llF6yhVRExxKoo5W/TODY26FLPfPbnZOTG?=
 =?us-ascii?Q?U3FplD2o+BI6+zkgjMPz6VX0P0gG5lyKS2MSUTyi6KgktkynPqp173O6eRjH?=
 =?us-ascii?Q?vqeDxruX+Ye8IcWIQhN6SglQ23bOskJirfb/b0h7QFKrpRMK9lw9OkIM3MNx?=
 =?us-ascii?Q?0hWwTbEH2hMZR5L4VMLz7eG5kc7Fw2rnoGh0mbS6EVge4SM9ocIYn+cNtfax?=
 =?us-ascii?Q?4k8WSjSCtmRi0cx+b8ddmx0ypC9eDmUyERj1Y0xIA5m9YHM/PbzGUTrim282?=
 =?us-ascii?Q?jMf72c73tv5UjVlL0fEkntLVHofcjVmoahz7BzNOUwBidUOcGAOBlMpIGGbQ?=
 =?us-ascii?Q?YVtBtzWW538mkOTDGUawm0LYwtHbpHpnUk4Gqjsv8o0Xmll612tnsTk9pU8U?=
 =?us-ascii?Q?SP00hDcl+8+qvSP0IEGyTYANAJ2hFLgRYthD8lifHKRCYUKdnPhS8aD6be6O?=
 =?us-ascii?Q?/iEAZnuG+hWHMyl3CQVq9XzvOxx28O/+JPWeVS0vwVXNogiBWViz/gPsfwUv?=
 =?us-ascii?Q?rZKO2m99bEw3PGZve15DiV7MiqOe2BEQ6hJTeZBtFxPkFfO2Fbv+NgyQJ2Ko?=
 =?us-ascii?Q?qibO295eaFTim2WxW9V89t7xHkHciBNi8knTwYx67g/DNsOixLg28ExM4r87?=
 =?us-ascii?Q?c6BjmCLtL2hxI73GC8jFtJnnYuUbTtk1oTr4VOeaqA3glwMT3luNbzQvCt3c?=
 =?us-ascii?Q?5V66Wd2gFhivBpiwKrjzYCQXgATSMjcVdiWUmjVMvOfGR6JJeQACzsLhooo/?=
 =?us-ascii?Q?HmiXjRv+4SN8RjKq44v77WRhF6Et+9odN6ESP1ZUEM72rUfwK5HTQKmL6BWn?=
 =?us-ascii?Q?RB4+hqmPV/Cqsf43t0ICgZC3CLQd0uJ77Zt/Ma0+Sp7LJ3PiQZvhGwpxNSBM?=
 =?us-ascii?Q?C4yd6MpeXUGaQxQHgewMQEgLh+kNq7yElJr8j6sedMRgNkfPgS/UKwT3qK7a?=
 =?us-ascii?Q?4YC6HxybHtCbWWBe+qnqKXBUnHMt0ftZ4SQx1JLMGB85CalQ6dbmFHli2Pfc?=
 =?us-ascii?Q?aj/YuoT1ZBFef2IYYvd/3fUH2Q2geSr9A5Si6sLEQ6c5uwziki0/s1Z72Ggv?=
 =?us-ascii?Q?UDSNWnfPRz/JHMMaOe4/QeFR0y4gZuh/H8RXs+bJRzRGNHFWMLEOE30CfTOH?=
 =?us-ascii?Q?BlQdM4nNs1sqm8dD9+eM0u+9TV4Sxawez/JhvzFsO55Kb7ymYwLhCQDk34ei?=
 =?us-ascii?Q?Et7JPi27glbIO/nkA6ANiUJ4H8UJ19scY9fkfSD0sESuT8GxqVPMiC7UCtl6?=
 =?us-ascii?Q?4609KuZxjA2Ji635gLyktRoj067JDFolqwhG8HwwADhqQV9Cnu0Fhg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gmyf+/aIUJddvH3NmcpkrPdIaTkZiWr0cIyi+34gH/A9BhkORVHrq+oOLt4M?=
 =?us-ascii?Q?y9WGIgs5ICifI+xUI1z4fCsqUTEnD2RoXgN/HdN62ALuiQ2jQyfNHu9nIBRq?=
 =?us-ascii?Q?+pksnjA4xiXmwCp6dp+DKPcrlaWd+/HSSYsAOC3dxjd8+cjSBgI+meXvrzjz?=
 =?us-ascii?Q?MerVq+VvM28byoBwpdNOYrgiz+xAO/8/J9poDdi9MCTje2Svsj5Qa49YYwwd?=
 =?us-ascii?Q?HN5k5dw69KB4fFQ9pZXfN6lI4TkrGy4IJogKSMMvx3+Zm5rzuie2yobMKJI6?=
 =?us-ascii?Q?+iq4Bt2ezKl0K7qCMdrhQYloi1fhW7xUu7Ix1KDdyZ25GBX/mzpl2XshRnRg?=
 =?us-ascii?Q?4+Z9hPNFotfjJUXSAuLOyIwAms14StCUMdlHc8M1yLWidsB3+bYGXvsSPP0W?=
 =?us-ascii?Q?0cUNx6vYB0tTf5Qgvl7pGAz3j56v7jRhz4ccbyw9SfkY0UdFST40GBJ03CX8?=
 =?us-ascii?Q?TLfPDumR85fl7jqma2QtXZMtqCmtLz9HmeGnSjy2x6klTcUqL8Y/IMpdBstx?=
 =?us-ascii?Q?o4FlhfbRgVWtDw1PJgoIsXA3Uj9Ns6FnBb6G3ykZO7GADml81YXXLtKERoWI?=
 =?us-ascii?Q?QAmbNXw6yJa+2E2Qg5v+iZnBNPfI5E4m2y1y1qayoL+OEyulFa26xaoST6bo?=
 =?us-ascii?Q?Mb2k4Ih8nIaGr1hAH4Sz6KPRmMNyptXmzbMOnXbHHIhdfqY8QICjC6gxC+yC?=
 =?us-ascii?Q?gHuFNo9F1fHZUK58ldUsd8spZn7aMosxXD3iCeM4+XD8U1EygWrEsACP0qzC?=
 =?us-ascii?Q?SjEKuWLNV3Yn3WqxiHVuaQvMCDJzwK91q8QlVpyNQdDXcxU4antg0kWaIbo2?=
 =?us-ascii?Q?+1/BpAgke9U5f20xNnR7mXEdFwVDyXAM6JSUdEnodJJJkihbtZKyAAQDWU9F?=
 =?us-ascii?Q?7pw8Bv+f3C/FppLdy4wbOjLinJSZujmXYftLEdZr7/kTEZi/PBFOLLB2sYT4?=
 =?us-ascii?Q?4jUkWJo/Jm1Di/U0mGS53BCeyXSmri5OLgy3izlu9rxvE+GeB0+TYR48QY4O?=
 =?us-ascii?Q?NQQmib7aTM+tNMg0n83Gn6z9na/3E8P8poehfyYTcHxDSvnJ2l6PzQIt4ogT?=
 =?us-ascii?Q?4g/2UsMife5J93wWm/5+pLnFYHgpE9UxmPJA50brgmZqEJGhHxf2/0L8i3pJ?=
 =?us-ascii?Q?YzbEBGCFtab8etaHEbhac1vNLcZSVJvPUVay16a4lQ/VF3Td1DAyMumL4YPC?=
 =?us-ascii?Q?2hyLgbmAdNpR63eH513x7i33ZgV35UGKWjCT0VgLOJarVdnQZbAr32fg6J9y?=
 =?us-ascii?Q?wte4ticGWCUQuMxgsp8qWrGZ+0m4NQmA6teDOpXj0ZiPXyH9vp2r1dM+xjyC?=
 =?us-ascii?Q?EdiJt/lhrT0maKRsZ8C0a7PbM6VBecFakjVilRjz/tpTh09XNwEjok4Lv7FH?=
 =?us-ascii?Q?KWwItsIp7Db7X4zMkf89U8ExX+bQ/+fEpOhppVir5UjDJ/BR6mZXsN9SVl11?=
 =?us-ascii?Q?uDCLV/Cscmu9tHgPb8inPQ7urHgqvVx0kf5Fg5qqTEQ3sSJcM3dXeRRMD8mW?=
 =?us-ascii?Q?RzAyS7+3c0zUACB4J8uTw+GMNGphMzMt4rGqdpsfQzoZcl7vkRccg7ZptogK?=
 =?us-ascii?Q?3rg6KtCSHh6k6QdoEfk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b203d0-af90-478e-211c-08dde461b26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 05:30:41.2235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7Ix7JZwZh6wGOVKJzuXOwyAQgToDIJ22EnO2M0N1ofI6P2I3+OGfypdqN86TSzZhSKYjmGW/BuTheWs4JkrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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

LGTM :=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, August 25, 2025 8:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Blocklist cursor frontbuffer rendering t=
ests on xe
>=20
> Blocklist kms_psr@.*cursor-(render|blt) subtests as these are expected to
> skip on xe.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> 2176764cf..14e0b9482 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -79,6 +79,7 @@ igt@kms_pm_lpsp@screens-disabled
>  igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
>  igt@kms_pm_rpm@.*pc8-residency.*
>  igt@kms_pm_rpm@cursor.*
> +igt@kms_psr@.*cursor-(render|blt)
>  ##################################################################
>  # KMS: Yet to add/missing XE support
>  ##################################################################
> --
> 2.43.0

