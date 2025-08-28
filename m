Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9ECA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 15:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6310EA0D;
	Thu, 28 Aug 2025 15:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laMctDej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6110EA0D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756393321; x=1787929321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0F9wihLM264FTZh7w0QSgXY4D0TEWzGHH/CSUaaHaYA=;
 b=laMctDejyeTS1hIgFTOm9MG46ZhN1Sfn8eHuzrbIDwOLf4z0oEsYGJzn
 GUs5DoCmW2TsiETdau71a7UyfjvBIeKnHAgZGNZqJnbQfYHtfxopNtlB0
 1IKd2Sv6HqPMeWiJ1vNOXTppHTydUKdROqvR/tqbgygOV/66+fczS1Sr5
 jMjXLaFT0mJK3zIREDVGyUdt6XwURSJ4VfqFFwfTU2eAKXy7Le8GxpyQV
 1UgZP3WuJYnegt3VlNcrRlcNtl/EcPkuPiVSWJH/xCs2t7aCHQt54Jiz1
 uAHXge2yOPTeKw2kkaBWPgU/d7oKhdc2PHhbkgJFcsSSc2fVeXy0DC7CK A==;
X-CSE-ConnectionGUID: Ijt2rTkmTOy4gFwZggAyHg==
X-CSE-MsgGUID: U6xqne8gQdaW+Nm5RIG1cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61297341"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="61297341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:01:52 -0700
X-CSE-ConnectionGUID: IqvDZ81SSSCkUAvklLQuUw==
X-CSE-MsgGUID: gn2CVmeUQ7ex1TwV0nYl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193796660"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:01:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 08:01:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 08:01:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 08:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvsScdZd2oUcZeVi4k0zavmlQ2H0Y2sFi5wZ1N7zr1hGFOQ3QQLbDLO6hMen1Y3clEivZQeenVodh5dK1a2sNiXweKdw59c4FU+iscF1iHAL4JazpyjTuvoDFCBc8OMSb8OgkjC+R+8wLVyx3YFQj4SO4rU5V9WX4nHlcYQawBdf7QgOhRY6/m4+sioZRFlH77PrcjM+4jL58egVFrhf37S2AFAm4TYkM3ktb0xozgpTRypR+CwTyEYyuSQZva9ylz/MD4/UEQd6g4VneHEJLA9AjFmVyS58ECRj1jSWrSmaY5n8QRHnBk9fdCAG9mr/aTv/6ElG4ZE/+wZ7rke/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kRAYXhhyZF9FS+1lbkyYapFSwLI7bSLGGcjzkLCyZ8=;
 b=NYycUsEl5QNZiqq4KpLYV4RAnVBhjPnKtOjftb2ZkK48LHAPlqx8M44YkUOGxwGuf0DwRSSpPMdWL0IAScDbNJENmWdfzYEPbhR6RfPeleALJroJkBAq+gUvXhrE7eCZ5f1+4qSuKDTHTn9xNbFK8UxfY0aGHmDfncZ3J6wIWOdIXn7zaPv3ZicJstpMWGxtGkGGPrZ03XQCl/D3NxYl5Gj6WOf+WMn2o8utlJLcLBp+I0AG/J2htpEVQ3keuCVECS+a1QSFSMhGFM5iQc3sv7TeBEoUgPIDRAGR8udmjm2aobAxlKiotOtLb+fVRHpLeZCvr8V6Onwav4gOBuGTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 15:01:41 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 15:01:41 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
 preferred_loc_smem test
Thread-Topic: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
 preferred_loc_smem test
Thread-Index: AQHcFmVPLlJRUlMAPkqSlEi7Nn31GrR4Kxcg
Date: Thu, 28 Aug 2025 15:01:41 +0000
Message-ID: <BL1PR11MB552550F84F2C430E92C2A254843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-5-nishit.sharma@intel.com>
In-Reply-To: <20250826084133.897768-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ0PR11MB6742:EE_
x-ms-office365-filtering-correlation-id: 0402159e-9279-4305-a69f-08dde643cbe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jW+buYflhj922xb0SeJl9tY/1/0tAwig72JYw5D4CgPq/f6wtuWzBds9Ay7Z?=
 =?us-ascii?Q?LxjAvuj+3fASIGfSew8+30DbjTbJv08aJ8rpefUEoN63XklVEBRms5e/I+vS?=
 =?us-ascii?Q?RZBek4rF+kUPWH0UELFlS21ZofkUeVTEA9J/zuPK/1YjFlQX8sDA5yMBQ5SS?=
 =?us-ascii?Q?D4bd875/uUgH6uKr0t3hGGZVQK3FR4lTQ8a/NOzOukhfmB8g+eLqVYoq2i2x?=
 =?us-ascii?Q?QdFxZ+SmkNWxgGuU70LaP7dFQSXyRZNVuemW0L+4P8pdgC4WQLqJIb1vqFQP?=
 =?us-ascii?Q?w04a2J7xLlP6fLk31oF4u0w3z+zN7DIk+IBCU4FxVa38Kji57gwoJkF4HvvZ?=
 =?us-ascii?Q?RllLIG61hjApReM7XJyn10S7ld4U7anDTUqXYbBqohe040pqQjxrId2rA6qL?=
 =?us-ascii?Q?AWaUBeX0Yyytx9y4YPOIUM4AsB2GTjyDW61fUWLU0xxOpRsuClo7Muq/Kj/b?=
 =?us-ascii?Q?y2lm7ycFKGpcZqRsqbhAQrDgzDQzlVSIXyCBC1B4DTWpd+V8pzgUmWVr9QtD?=
 =?us-ascii?Q?mafqymrI16Kjv7YYlLt2VYXfdk12DBa0ysXvSwEVE+5+rYKTIsuIM7ubzndo?=
 =?us-ascii?Q?YUI3cURwMMsBfjOgpVsPVKXUQNeRJeE939BHXm3DCz2Waki7JXQ5sS0QzdIk?=
 =?us-ascii?Q?Z+G3ruhEEeaI+mLkGocHYxmUpziDgVFhj7RsoJQiNUh7yvzlOhgmmhKJbAVG?=
 =?us-ascii?Q?Ji85H/cfhVlgkbYNmaLyBCYwb7GOlCGabMN38BICbL4im3HYzeUSlPVJqvLU?=
 =?us-ascii?Q?Xp5HPXxZXauNLygjZhMeA6zoiBvOGJCxl7hebUshhGSrw9raEIFA2bQ56tBy?=
 =?us-ascii?Q?oH6xszqBqB01ZAk4lHhYv0hp0ZNGT4NBQVPttO/eWPlij59hxNtnPOQhIpT7?=
 =?us-ascii?Q?Y6HlUh6x2cenI81Nu2k4VwR9oy7j38PAraIjv15ApbOq3yfly7V8JCvt8Vxv?=
 =?us-ascii?Q?8aJj1UynwsRZ2T7GuyP4KqvZBjHDfveZ2mOpzAMBMW5E4NpbwzqnooOngKl9?=
 =?us-ascii?Q?NMvxbiSy87mJE5U/4HFfhBJGI+03rGxAr+uyvVwKJH9xGNZY2Gb3TrWexc4L?=
 =?us-ascii?Q?1ZeVi9LlyJ5FVuCbU2+FO5gDJ1c9nlgKlx/Y9NOUDqNuypYDkDWIMTT4/6A1?=
 =?us-ascii?Q?htl4p+YnxeXPDODXkfcEdwND0fSHhhJcYk1eez+/DfWF285wHn0T6BbOrOct?=
 =?us-ascii?Q?jHaszikg7FLcPNm8DoORbnOXHhWNTEXXirMVpp0NS3gSzD1Z6qiMk06UiKIf?=
 =?us-ascii?Q?vgHvMiHVY9/hRxBfpZJ9VRnyicJzSdq1JOtwvBlkVH4XSTxlAEdkI4U/L/nt?=
 =?us-ascii?Q?rd9SMMGoe8QYhZ4wVTpedHosxspAyOozmamQDaxhSoEwmp/k2vR0rPAGIOLS?=
 =?us-ascii?Q?7cQzKX1xSGcngaK8RAHuLrIQtMzRZPj5ygpdg12KrePDQxIQZTR45v/+2TkI?=
 =?us-ascii?Q?S5hi1I+ubE+cZbP2PonYLTfKcD5QXdMADx0377j3Y5DZFHX+tkE3I9NjfKTy?=
 =?us-ascii?Q?3uja32cGZzA1muQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QEzRjYYtG6ReyC650fhr3LmaI+HN38I1LSpB+gdYSDxBYAKo0fYWXjazEhz8?=
 =?us-ascii?Q?8yaO53eyqISOkUKAfBGs1xCsRU8SDd4lvH+MctqHR9ZM2ylABzyWM+3ZqIG+?=
 =?us-ascii?Q?HLxcO6iUTGfcs6uZVguIrH+O9eVNTnFpUIBbhYPon+pI77XNqqy2oXhpYYAS?=
 =?us-ascii?Q?4O/vTnQZDosku4PouY2SY1zMTQvb+gI6lPMPISOnlQF0rE1jpxW1UyzEq8Q1?=
 =?us-ascii?Q?W2CWwtLH/Tv6o9X2sLOjuM8gDm7nGgnbOu/7w9iawZrmMseL5UAO71PwkceZ?=
 =?us-ascii?Q?C3TvmBqMNSETSdj7vAOdkAhhm/1fQ/XLXkPflgNMe52N3AHWmBWx0QD8qAqo?=
 =?us-ascii?Q?IwYZn8Wz6/jLwqQauqYTpOBwkb+LC5/1EThFroRtMCRc0We03wpmLl2KHcqI?=
 =?us-ascii?Q?0VobJ3xVvapcos0nElzv2iLlyYBVXXMJOf3d+d05LkqBZkfrqbjHmKECAS+D?=
 =?us-ascii?Q?gMjkHFTdaM/0b7OUyvavEr2DREy3HswlG3BSExTAhT8cvOvpTBvoQm9qVnnW?=
 =?us-ascii?Q?ed1zNM7hum4MD4tNY4pav0Od+uSmRr6AL+sPfUnrTH8ozYeuDhIvePzi9vrf?=
 =?us-ascii?Q?10NPVRR3mL968HIGOPfq8oZIf+vdVoGzFKnRgM7AE35TpFz1TOXfNb4vz5yV?=
 =?us-ascii?Q?TcjZplYpTjXq4/vAy81HwKcFexyoq4cRk0C5XqEcLcW8hHDbUwoobTomsvBP?=
 =?us-ascii?Q?+wdtefPJhY3qxTVANJNki5DE8ZdETqmDNvDNQjdJ1uoFHg55Qk53cAejBfNl?=
 =?us-ascii?Q?ZsU6AwVnSHiCrvX4dX5N3t5ZilUznBLqWeAOcLQDwaPL0Ar41cGDSWW9FjtH?=
 =?us-ascii?Q?0CznI3fydJyUJl5OYz4KOF+mAd7GSbUQ02pdsJpE7AQrCrtuyIJp9cqKRVmD?=
 =?us-ascii?Q?mq1vLOVL4sAkr2SkK6UCq6/rO55UqD0Yli/BWybzmcgEpSv9WldEy+tiv9at?=
 =?us-ascii?Q?Oku8YqbFTfKq0mmH9LDAZisuppy7zPJVx6wYAWSh5rQZ2pQWvD18EYKZJRKf?=
 =?us-ascii?Q?GvGMJOR61lcfKm3pA012dBr6y0kioZpqii6XuQwj28FrPq3ij7i1PWa7smiX?=
 =?us-ascii?Q?ORt74fJwpN3HDWNv5d9n3X2YHN3qfqShzw2ayboynHEK6oRujWhefEQT9n7B?=
 =?us-ascii?Q?yLOkSW8Tl2AN02NYNwhLJDQEfns2wz9+OQYpk3ffjsxfsi9tPIGXZu+aqsFE?=
 =?us-ascii?Q?K8KfrvOmhTbfg4MzyCwEd71jDsdgw4m+SCa7tu7FrCXIvCP0Dp50NOuW1Y0J?=
 =?us-ascii?Q?ggibwmf3civWCQSxZYhyfnCCySOh592ego8aCKePFg0HS80nXPoLPUkA6DRQ?=
 =?us-ascii?Q?Sxcc9+XpVxU2K3HM1Y1phOJWJy6FQEnZfuqJpk8qkumWGEOaOIoG92gv2V9h?=
 =?us-ascii?Q?N/hAJP5262WKXgRFT2HCmDjpdm6gueOENWkVC/0rH31zbXDhg/8sDduoRqtm?=
 =?us-ascii?Q?ZXLShosQnpt1czM/7ESsLvLeTZR2YjeHtFHTq3RBlPfbjPyZUfRJUMATJjyJ?=
 =?us-ascii?Q?7C7DlLCPIBpu9Lh77KqQPVMpTP+/cc7xvEB3PIugAPZbliJMard7XQ2NVddv?=
 =?us-ascii?Q?uyuWW7imYAzRTIf2IrtvNbTceXRXInzCg/S3Qlew?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0402159e-9279-4305-a69f-08dde643cbe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 15:01:41.4007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/TKexRqUryviqwPGDkpNuikQE6Y0riXk27Zp5tylNjoXk285u+uHNQ7JRHGitE0SzptP7OopmiQIhGvg8JHHpZKO2j124qkWjZxozQrvBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
> preferred_loc_smem test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added preferred-loc-smem test which is called in combination with other
> tests as well. In this test the buffer object preferred location is syste=
m
> memory. MADVISE ioctl is called with preferred_loc attribute and
> default_system system memory as preferred location.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 225 ++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 38 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 007d9bdc0..70ca5fc2e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -138,7 +138,6 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> -
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
>  {
> @@ -406,6 +405,39 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size -
> begin_size);  }
>=20
> +#define MAX_N_EXEC_QUEUES       16
> +
Is there any need to move MAX_N_EXEC_QUEUES   to start=20

> +#define MMAP                    (0x1 << 0)
> +#define NEW                     (0x1 << 1)
> +#define BO_UNMAP                (0x1 << 2)
> +#define FREE                    (0x1 << 3)
> +#define BUSY                    (0x1 << 4)
> +#define BO_MAP                  (0x1 << 5)
> +#define RACE                    (0x1 << 6)
> +#define SKIP_MEMSET             (0x1 << 7)
> +#define FAULT                   (0x1 << 8)
> +#define FILE_BACKED             (0x1 << 9)
> +#define LOCK                    (0x1 << 10)
> +#define MMAP_SHARED             (0x1 << 11)
> +#define HUGE_PAGE               (0x1 << 12)
> +#define SHARED_ALLOC            (0x1 << 13)
> +#define FORK_READ               (0x1 << 14)
> +#define FORK_READ_AFTER         (0x1 << 15)
> +#define MREMAP                  (0x1 << 16)
> +#define DONTUNMAP               (0x1 << 17)
> +#define READ_ONLY_REMAP         (0x1 << 18)
> +#define SYNC_EXEC               (0x1 << 19)
> +#define EVERY_OTHER_CHECK       (0x1 << 20)
> +#define MULTI_FAULT             (0x1 << 21)
> +#define PREFETCH                (0x1 << 22)
> +#define THREADS                 (0x1 << 23)
> +#define PROCESSES               (0x1 << 24)
> +#define PREFETCH_BENCHMARK      (0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +
> +#define N_MULTI_FAULT           4

Is there any need to move N_MULTI_FAULT to start
-- Pravalika
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory @@ -460,7 +492,7 @@
> many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t *bos =3D NULL;
>  	struct timespec tv =3D {};
>  	uint64_t submit, read, elapsed;
> -	int i;
> +	int i, err;
>=20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -500,6 +532,15 @@ many_allocs(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			alloc.ptr =3D aligned_alloc(SZ_2M, alloc_size);
>  			igt_assert(alloc.ptr);
>  		}
> +
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(alloc.ptr), alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D
> %s, vm =3D%u data=3D%"PRIu64" alloc_size =3D%"PRIu64"\n",
> +						  strerror(errno), vm,
> to_user_pointer(alloc.ptr), alloc_size);
> +		}
I don't see test coverage for DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE  which is=
 vram
>  		allocs[i] =3D alloc;
>=20
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size,
> stride, @@ -662,7 +703,7 @@ partial(int fd, struct
> drm_xe_engine_class_instance *eci, unsigned int flags)
>  	size_t bo_size =3D SZ_2M, unmap_offset =3D 0;
>  	uint32_t vm, exec_queue;
>  	u64 *exec_ufence =3D NULL;
> -	int i;
> +	int i, err;
>  	void *old, *new =3D NULL;
>  	struct aligned_alloc_type alloc;
>=20
> @@ -688,6 +729,15 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
>  	data[0].vm_sync =3D 0;
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				  strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
>  			   PROT_WRITE, MAP_SHARED |
>  			   MAP_ANONYMOUS, -1, 0);
> @@ -747,38 +797,6 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define MMAP			(0x1 << 0)
> -#define NEW			(0x1 << 1)
> -#define BO_UNMAP		(0x1 << 2)
> -#define FREE			(0x1 << 3)
> -#define BUSY			(0x1 << 4)
> -#define BO_MAP			(0x1 << 5)
> -#define RACE			(0x1 << 6)
> -#define SKIP_MEMSET		(0x1 << 7)
> -#define FAULT			(0x1 << 8)
> -#define FILE_BACKED		(0x1 << 9)
> -#define LOCK			(0x1 << 10)
> -#define MMAP_SHARED		(0x1 << 11)
> -#define HUGE_PAGE		(0x1 << 12)
> -#define SHARED_ALLOC		(0x1 << 13)
> -#define FORK_READ		(0x1 << 14)
> -#define FORK_READ_AFTER		(0x1 << 15)
> -#define MREMAP			(0x1 << 16)
> -#define DONTUNMAP		(0x1 << 17)
> -#define READ_ONLY_REMAP		(0x1 << 18)
> -#define SYNC_EXEC		(0x1 << 19)
> -#define EVERY_OTHER_CHECK	(0x1 << 20)
> -#define MULTI_FAULT		(0x1 << 21)
> -#define PREFETCH		(0x1 << 22)
> -#define THREADS			(0x1 << 23)
> -#define PROCESSES		(0x1 << 24)
> -#define PREFETCH_BENCHMARK	(0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -
> -#define N_MULTI_FAULT		4
> -
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] system allocator test only once @@ -951,6
> +969,80 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> unsigned int flags)
>   * @mmap-new-nomemset:			mmap a new buffer for each
> exec, skip memset of buffers
>   * @mmap-new-huge-nomemset:		mmap huge page new buffer
> for each exec, skip memset of buffers
>   * @mmap-new-race-nomemset:		mmap a new buffer for each
> exec with race between cpu and gpu access, skip memset of buffers
> + * @free-nomemset-preferred-loc-smem:	malloc and free buffer for
> each exec and perform preferred loc madvise operation
> + * @free-preferred-loc-smem:		free buffer for each exec and
> perform preferred loc madvise operation
> + * @free-race-nomemset-preferred-loc-smem:	free buffer for each
> exec with race between cpu and gpu access and perform madvise operation
> skipping memset
> + * @free-race-preferred-loc-smem:	free buffer for each exec with race
> between cpu and gpu access and perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem:	malloc single
> buffer for all execs, bind and unbind a BO to same address, skip memset a=
nd
> perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs, try to unbind while buffer valid, skip memset of buffers a=
nd
> perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all
> execs, try to unbind while buffer valid and perform madvise operation
> + * @malloc-fork-read-after-preferred-loc-smem:	malloc single buffer
> for all execs, fork a process to read test output, perform madvise operat=
ion
> + * @malloc-fork-read-preferred-loc-smem:	malloc single buffer for all
> execs, fork a process to read test output, perform madvise operation
> + * @malloc-mlock-nomemset-preferred-loc-smem:	malloc and mlock
> single buffer for all execs, skip memset of buffers, perform madvise
> operation
> + * @malloc-mlock-preferred-loc-smem:	malloc and mlock single
> buffer for all execs, perform madvise operation
> + * @malloc-multi-fault-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-nomemset-preferred-loc-smem:	malloc single buffer for all
> execs, skip memset of buffers and perform madvise operation
> + * @malloc-preferred-loc-smem:	malloc single buffer for all execs,
> issue a command which will trigger multiple faults, perform madvise
> operation
> + * @malloc-prefetch-preferred-loc-smem:	malloc single buffer for all
> execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-prefetch-race-preferred-loc-smem:	malloc single buffer
> for all execs, prefetch buffer before each exec, perform madvise operatio=
n
> + * @malloc-race-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs with race between cpu and gpu access, perform madvise
> operation
> + * @malloc-race-preferred-loc-smem:	malloc single buffer for all
> execs with race between cpu and gpu access, perform madvise operation
> + * @free-race-nomemset-preferred-loc-smem: malloc and free buffer for
> each exec with race between cpu and gpu access, perform madvise
> operation
> + * @free-race-preferred-loc-smem:	malloc and free buffer for each exec
> with race between cpu and gpu access, perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem: malloc single
> buffer for all execs, bind and unbind a BO to same address before execs,
> perform madvise operation
> + * @malloc-bo-unmap-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise
> + * @mmap-file-mlock-nomemset-preferred-loc-smem:	 mmap and
> mlock single buffer, with file backing, perform madvise
> + * @mmap-file-mlock-preferred-loc-smem:	mmap and mlock single
> buffer, with file backing, perform madvise
> + * @mmap-file-nomemset-preferred-loc-smem:	mmap single buffer,
> with file backing and perform madvise
> + * @mmap-file-preferred-loc-smem:	mmap single buffer, with file backing
> and perform madvise
> + * @mmap-free-huge-nomemset-preferred-loc-smem:	mmap huge
> page and free buffer for each exec and perform madvise
> + * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free
> buffer for each exec and perform madvise
> + * @mmap-free-nomemset-preferred-loc-smem:	mmap and free
> buffer for each exec and perform madvise
> + * @mmap-free-preferred-loc-smem:	mmap and free buffer for
> each exec and perform madvise
> + * @mmap-free-race-nomemset-preferred-loc-smem:
> + * @mmap-free-race-preferred-loc-smem:
> + * @mmap-huge-nomemset-preferred-loc-smem:
> + * @mmap-huge-preferred-loc-smem:
> + * @mmap-mlock-nomemset-preferred-loc-smem:
> + * @mmap-mlock-preferred-loc-smem:
> + * @mmap-new-huge-nomemset-preferred-loc-smem:
> + * @mmap-new-huge-preferred-loc-smem:
> + * @mmap-new-nomemset-preferred-loc-smem:
> + * @mmap-new-preferred-loc-smem:
> + * @mmap-new-race-nomemset-preferred-loc-smem:
> + * @mmap-new-race-preferred-loc-smem:
> + * @mmap-nomemset-preferred-loc-smem:
> + * @mmap-preferred-loc-smem:
> + * @mmap-prefetch-preferred-loc-smem:
> + * @mmap-prefetch-shared-preferred-loc-smem:
> + * @mmap-race-nomemset-preferred-loc-smem:
> + * @mmap-race-preferred-loc-smem:
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-dontunmap-preferred-loc-smem:
> + * @mmap-remap-eocheck-preferred-loc-smem:
> + * @mmap-remap-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> + * @mmap-remap-ro-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-preferred-loc-smem:
> + * @mmap-shared-nomemset-preferred-loc-smem:
> + * @mmap-shared-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> + * @mmap-shared-remap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-preferred-loc-smem:
> + * @new-bo-map-nomemset-preferred-loc-smem:
> + * @new-bo-map-preferred-loc-smem:
> + * @new-busy-nomemset-preferred-loc-smem:
> + * @new-busy-preferred-loc-smem:
> + * @new-nomemset-preferred-loc-smem:
> + * @new-preferred-loc-smem:
> + * @new-prefetch-preferred-loc-smem:
> + * @new-race-nomemset-preferred-loc-smem:
> + * @new-race-preferred-loc-smem:
> + * @prefetch-benchmark:
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of
> prefetch @@ -1020,7 +1112,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	uint32_t bo =3D 0, bind_sync =3D 0;
>  	void **pending_free;
>  	u64 *exec_ufence =3D NULL, *bind_ufence =3D NULL;
> -	int i, j, b, file_fd =3D -1, prev_idx, pf_count;
> +	int i, j, b, file_fd =3D -1, prev_idx, pf_count, err;
>  	bool free_vm =3D false;
>  	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>  	size_t orig_size =3D bo_size;
> @@ -1133,6 +1225,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	addr =3D to_user_pointer(data);
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1202,7 +1303,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		uint64_t batch_addr =3D addr + batch_offset;
>  		uint64_t sdi_offset =3D (char *)&data[idx].data - (char *)data;
>  		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues, err;
> +		int e =3D i % n_exec_queues;
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> @@ -1232,6 +1333,16 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size);
>  			next_data =3D aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			if (flags & PREFERRED_LOC_SMEM) {
> +				err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(next_data), bo_size, 0,
> +
> 	DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> 	DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D
> %s, vm =3D%u data=3D%"PRIu64" alloc_size =3D %zu\n",
> +						  strerror(errno), vm,
> to_user_pointer(next_data), bo_size);
> +			}
> +
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> @@ -1253,6 +1364,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			sync[0].addr =3D to_user_pointer(bind_ufence);
>=20
>  			start =3D igt_nsec_elapsed(&tv);
> +
>  			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size,
> sync,
>  					     1, region);
>  			end =3D igt_nsec_elapsed(&tv);
> @@ -1355,6 +1467,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				} else {
>  					igt_assert_eq(data[idx].data,
>=20
> READ_VALUE(&data[idx]));
> +
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
>  						u64 start, end;
> @@ -1429,6 +1542,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				aligned_alloc_type =3D
> __aligned_alloc(aligned_size, bo_size);
>  				data =3D aligned_alloc_type.ptr;
>  				igt_assert(data);
> +
>=20
> 	__aligned_partial_free(&aligned_alloc_type);
>=20
>  				bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1450,6 +1564,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				}
>  				bo =3D 0;
>  				data =3D aligned_alloc(aligned_size, bo_size);
> +
>  				igt_assert(data);
>  			}
>  			addr =3D to_user_pointer(data);
> @@ -1460,6 +1575,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		prev_idx =3D idx;
>  	}
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	if (flags & PREFETCH_BENCHMARK) {
>  		igt_info("Prefetch VRAM execution took %.3fms, %.1f5
> GB/s\n",
>  			 1e-6 * prefetch_ns,
> @@ -1587,6 +1711,7 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  	uint32_t vm =3D 0;
>  	bool go =3D false;
>  	void *alloc =3D NULL;
> +	int err;
>=20
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
> @@ -1614,6 +1739,15 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  		alloc =3D aligned_alloc(SZ_2M, alloc_size);
>  		igt_assert(alloc);
>=20
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm, to_user_pointer(alloc),
> alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +			if (err)
> +				igt_warn("MADVISE_FAILURE err =3D %s, vm
> =3D%u data=3D%"PRIu64" alloc_size =3D %zu\n",
> +					  strerror(errno), vm,
> to_user_pointer(alloc), alloc_size);
> +		}
> +
>  		memset(alloc, 5, alloc_size);
>  		flags &=3D ~SHARED_ALLOC;
>  	}
> @@ -1831,6 +1965,7 @@ igt_main
>  		{ NULL },
>  	};
>  	int fd;
> +	int num_sections;
>=20
>  	igt_fixture {
>  		struct xe_device *xe;
> @@ -1843,7 +1978,21 @@ igt_main
>  		open_sync_file();
>  	}
>=20
> -	for (const struct section *s =3D sections; s->name; s++) {
> +
> +	num_sections =3D 0;
num_sections intialization to 0 can be done in declaration
> +	for (const struct section *s =3D sections; s[num_sections].name;
> num_sections++)
> +		;
> +
Please use check check patch.pl for indentation.

> +	for (int i =3D 0; i < num_sections * 2; i++) {
> +		struct section *s =3D &sections[i % num_sections];
> +
> +		if (i/num_sections =3D=3D 0) {
> +			static char modified_name[256];
> +			snprintf(modified_name, sizeof(modified_name),
> "%s-preferred-loc-smem", s->name);
> +			s->name =3D modified_name;
> +			s->flags |=3D PREFERRED_LOC_SMEM;
> +		}
> +
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> --
> 2.43.0

