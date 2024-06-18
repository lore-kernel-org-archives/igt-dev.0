Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D011C2BA15
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 09:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282610E5FA;
	Tue, 18 Jun 2024 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nH0cvbw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555FD10E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718702872; x=1750238872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K4EwlxmSh59P7UmIPm8c/VRTPYWnQIUIm5ZxPPAxRDc=;
 b=nH0cvbw6i71F83MbZ1KvL9VsRNiYAergd6wpKjBiloSklzacVRVtmmvB
 SHakC727cbIqXDkZXgLV8yrZkah+us4UKJrd3vmpJfzRUK/WEWnNnXxPN
 YzgPbKmzLQdf/GBRO+iyL1xyW5bJ7G6tcubEjU7B4MN3K3u3E9L6Tz6nR
 Hc/R1bJgcK0DrfX3CeA3DUHegZrv73d0iqXDFbwtD/k4Yx8AEhbXLHwz1
 VlgSOWEuwc+hjsovVfHrYPYSCflGfqcRkqxQONvSpPNjmYTTcVPV+3xCk
 vQrK6Dihhdc0CEFq9mjYQlrsICEJRCG2QJJoq1YG0/Mhsj763tXEUGai/ A==;
X-CSE-ConnectionGUID: CJ5509akTSqDZkZYu6Z4Hw==
X-CSE-MsgGUID: 305C8mMqSBGznYyTUP7W1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19386162"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19386162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 02:27:51 -0700
X-CSE-ConnectionGUID: sqd2bMeqS5SBTn/bRp6UmQ==
X-CSE-MsgGUID: Du8fEYG0TyCE3bOfoFsjiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46613944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 02:27:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 02:27:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 02:27:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 02:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyWYSIUR3Wvbq6zL/L9s3yKDy7OTD4Lyuj7UDBHJ8xRIJBrmySc602GzsrEGyTtegCD3kdUTL55IKFqsQDu1AC477qBe6UzVea/SLnszO2lWeB6YYHBUeDfsG5UQxOtPSRptfhiLUoOqArLLeRsGHiBdrWC4Dt40dFnIpjwmjpWdj9rJeVn2KyApLksTkjlcSmN5lhi1l2M7P2l3Ke5XG8MSHlj99tVZ9AVTnTl9p2lO8LnU9DdPw1ikEBNPIXM3r+kCNlo7pKUUHYOnLGuDUgJIyDgBGPIGqrxd/2dL5CF+UfwDQOw6WrNroQ7VXYNu1YMxLj9NN+WBQlS8mdsZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+ukXSURJP8OL/6l7URrDdfNVjHJZKfdswLleQK4NUs=;
 b=YWEIYn6IOGXEQR3rsXyubyV97KOAQ0WnsmcIlVY2lRu2inLaXY5AsA9oj3+5gbWSBpqT7JuxOZExYeo+5S5zWKlGdxQiEarIOQ0dm5WOZwWrKnW9bRQcgLxCtHl3VlE/kMWOoQVYQ4C1sGwhBihIfeHcnAGqFJvb8EFyZK7fAejA91I69Xdjc7sXIL/o8rjOQ2tt0GJ856xHlVid49wldWnth0D4G71TVID3Vwrgydb4k2PsRqXzdZU/bsQXzeNeyh3/zzdIp6XwtdqGSOCs+I4MxBmyD5JwDY9p9j5G5xRu7D5xEsixcJuhJZCyrjBkf2mtbRHCMjBT3Qz9IxvXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 09:27:42 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:27:42 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [i-g-t V2 1/2] tests/kms_vrr: New subtest for CMRR
Thread-Topic: [i-g-t V2 1/2] tests/kms_vrr: New subtest for CMRR
Thread-Index: AQHawVQ+EjiMX5x/okSdsZ3e/rZR07HNQDtA
Date: Tue, 18 Jun 2024 09:27:42 +0000
Message-ID: <CY5PR11MB6344E9AD40960F882F266F1FB2CE2@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
 <20240618074225.4047523-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618074225.4047523-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|LV3PR11MB8481:EE_
x-ms-office365-filtering-correlation-id: 52be1bb8-05b9-459d-f480-08dc8f78e7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?9luJlNLuX7E/0yOBOAyt/Go2VWKQ5NUllqqLECq7BNOX36N/1Iy/p7wAre6d?=
 =?us-ascii?Q?9rRpjxB9hJv3MyBk9zcCiFtMigZ48v4iGF/ldPBsZTAH+a7R/VqLkCokVo0C?=
 =?us-ascii?Q?TnqtqtE/apwPee3rl5xRTWdbMKzJSbjjv77Vlwy1P/H4HGWFIty7HWHwiyBQ?=
 =?us-ascii?Q?EE4Dtv1H35HmPvD1RToRDpCbl21U6WOXNd2rJuRrKTIDNzP9ixS6ug4DzP3e?=
 =?us-ascii?Q?lY7qrHqVm7oMu8ZR/kdZadmRpH/jdt0Jdkswp4RYtSSWt379QhvuUIvYWHdF?=
 =?us-ascii?Q?CX9VvrvmeKGFqCHA4u75JWcXMNnTXCO82o9PX027iO8Ge298B+ILVpixAw4C?=
 =?us-ascii?Q?M3oDsv52a8l7Ob1wlONkfXTK1n4/9WtAJ5oWyBXGknxWpxWAlIB4Wed205De?=
 =?us-ascii?Q?nUdqsheQiL5G7DDP2jSU0R7klN/hnoV4GislODHuDFvvkykpTb800Aj+fXHo?=
 =?us-ascii?Q?8nhf4SjJnw/uYclVg6Skx2dgsPkJFspzZAljuSTf725l/1Qvct9PRTUaCJU+?=
 =?us-ascii?Q?3J+rXz/Sp0Utv3+s96DTiE04QO0PSTl8vvZa+xc77ykuiwR+jQ2+Uu4y5NJ4?=
 =?us-ascii?Q?UgFAmvP5RBy54XphhHYHLGagdllFmgH6V0Ps/gEQTRUIn/pr9BJwIxC+SmVz?=
 =?us-ascii?Q?68IGGCbNq1PmX0i3ySc3RevHg+5Lib8hvR4l52QsQemOhZqQMZQXfngXWb1B?=
 =?us-ascii?Q?7RogC1wQiA145pRzvT1OHjz34OlOdFxPaxWCEL5GoM13M27uHD2a46px0jIZ?=
 =?us-ascii?Q?B9LFFa44c+i4s7r1zMLEoZkUINTvDBkpZjgWdnbP8vHc6X41YAQ4QHkiaUQr?=
 =?us-ascii?Q?BporfMyJogjqr1AxQ0z5wJ9dKqPoMOWf3aYgcNxbJ/pAQefNGoYI58A6KFdn?=
 =?us-ascii?Q?Yg3sqmES6KLCpFH8qgHp0E8EgWlYMZVDxuwaVLAgsrM9dLqMAL1W2/BiIK9n?=
 =?us-ascii?Q?dqrHMy6JFmZ798tfBCXVSPaZ0YrdaqgWohGtefzCVjCZitVUtsIfzqDMwOHN?=
 =?us-ascii?Q?DlLHsbsbAj9sNf0FsYNj6BiL78IAgjD+As2OICia/qSBGZVASzYZZ5gl5d+L?=
 =?us-ascii?Q?3IyviFAm/8H2Q1oinWAOeCU57NUr5SAgQvlCJRgE1PhT4IlpGQt9JV5q2V32?=
 =?us-ascii?Q?5l+70dABZhONFui3p3a0FeDVR0I7piEAY2X9fyupTwL2Alu7PJmxglxz6GA2?=
 =?us-ascii?Q?JFBVzMFZ866LlVMz7yfy59qACy8DnIKEuGOdmy+p2yu5p0zwLDp7sTEITMyI?=
 =?us-ascii?Q?6I9Sd+bRyut2n8BLYwdgRG4aeBYQMLdkXIlG8QCg4wYWnwLS3KT9DcYrlomw?=
 =?us-ascii?Q?UIs6tTa5YGNREwgq8srfSCJeQZv8npKK36DQ9LLnEgFgith32OLlpQgKByGc?=
 =?us-ascii?Q?seHuMRM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5PXReXSoXN/90tbPJKj4KO3k2icE9aIP9WjnjVIW40hqaoftpbaArQtjgyfs?=
 =?us-ascii?Q?NyaRWjqQgvDIeWq6ZhXpgTJc4svhh7PetKDE6KS8UGtISog8aXEqeSEBIXwY?=
 =?us-ascii?Q?I/iWaOuW6Ty0UxqMrKP/+MrCA3UNPJ3ivgiYuQCJSHWScUIgizNR/Dw9IyjS?=
 =?us-ascii?Q?ThKXhFbr7ZaEzGcEmz3KzlhI3wqAf0WdqQpNP8pJXjgL7YfBcej7MprNgy+C?=
 =?us-ascii?Q?f3TVOjMbHK7lps9MfN4URyOpDzw96TolTjUZ80Kus4z+hBvwMWBj7t2r1GYc?=
 =?us-ascii?Q?BLsgwX1c0mzpe34S7hm/wwXWKjr2xKdm3Ntmyc3P+XK9d0CAAnyQ9JtEcy+R?=
 =?us-ascii?Q?kKJbGLg15JYxgQpGU7u4oYJly5c9lyb/w8kISOOGBNBarOxjYYYD8aEGAPi6?=
 =?us-ascii?Q?2MkC2Xpdns1Jpu71O2dzuA57S5nZuic+obz9YYt+jPqX5J+HxH7zRgOMdPoX?=
 =?us-ascii?Q?cDo91gY8yty7HnGQFJm/EN4Om84UQi7utBptO4GGniE+q+6o4s2sNRqXIQSL?=
 =?us-ascii?Q?Y0uo/PUPPpyAMJzB404YhEQwFnoNnJva/T3KAQ3vJ/K4uYKMBPkew9EoY/on?=
 =?us-ascii?Q?4jt7FpImM+mVuSiDJWWn42TBWhLkAO+DoJllJjJCd7/QZ5jV4iPCC5rSvfhn?=
 =?us-ascii?Q?j4Imzp/lHwiDASXZ8o1FguNWGBhfQ/dLU4hRq7SJeOCzooRFmcTft0LJMMRY?=
 =?us-ascii?Q?7sZ9YR2MUJcA7VOz0bmqmGjanTGVUkNQZM0FjtGaKyHR0k/HO3PrJXFKbtKS?=
 =?us-ascii?Q?Lqrafgs2k0mBqQuZzaX9D3DVorwEkwVsmW+0IheK+B2oizdiAayEE3bFXWCH?=
 =?us-ascii?Q?FSwNj/9LtrjksAMN9SyrMQfnCIzL9VOqtkKQrW2NEfqrCU0e5AJfACy99IL3?=
 =?us-ascii?Q?86Lh63emrlgsdtaGSmlrKPnRDfviQ37kD/MbtdWVMc4jmguY96ZiWd4tCMFo?=
 =?us-ascii?Q?doy4c2PK/bZEd7zgBvWrXnqOgipgKNiEImaglJQDqXnE4iBjUjZH9Odoser+?=
 =?us-ascii?Q?SDrXvlN3/MLjAkZDxb6Jf75QtCn6h5jvt102yZWJcqBnoKEiMeGD+Pc4QSqm?=
 =?us-ascii?Q?f1v5Dl90WXIred/p5dfTV7zAfrk/Nldkj+l4YG5qgDN/ebPyQ18oSD8Vi0q5?=
 =?us-ascii?Q?FV9jlbSycQzBBK3sZnBGGIBlaAdPXEMe3ilYXzOadbCPWmBAIiYTVzJCPSFr?=
 =?us-ascii?Q?g8kyvFvq0YCzUjiTJDrxHt2ve9ExPuw/tfTSDfoZ4nxDK21QcbZQ4hkQSxoh?=
 =?us-ascii?Q?PTKOetzqmgTpPG2Myi9scUUtBHplHRA8v87GVY/fh7f2HAPo6KqaOhoOJyd5?=
 =?us-ascii?Q?TaCpRD9yG2FSDg7sPnGvKpNglowKpG4X1WLpjiW0YufA0TAz1pbGpd0AB2VD?=
 =?us-ascii?Q?cf934OGw04iZxI3d9ZPaip48CgYNnl9qkUNKmbrbxdCEpIX10JwY5kKjml1I?=
 =?us-ascii?Q?CHZCBfwPBz56Mly6MqaYsKotyMqaAKS2SSw4xCC1QSZq4Rp/YZo2KbrLvQr1?=
 =?us-ascii?Q?jODW7eKWfnlTirFdXmuIvHloqnayWAT7HruWuqoRjIReLIv9Q8PEgvijMswb?=
 =?us-ascii?Q?2C5wnuONI5W1sl/JoDjH2lwDD9Eqg5dPzi2TjX7CJ/ghpIetZyWWzoaE5DFo?=
 =?us-ascii?Q?XWgFni19m7XUkLD9gSq4CaM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52be1bb8-05b9-459d-f480-08dc8f78e7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 09:27:42.5153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RH1RASFM1/6TcKL0xhSzxBNhvc+6StD9bUFbh9i6SZqDnfYYqjJDGEK1O4bBIDhn0JPG8MYTD0rm+XfE78sM7rZy2Va7OzAhzTbNPQylIdnsHSBpxCZvYB4RVhTFSLa9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:12 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Nautiyal,
> Ankit K <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [i-g-t V2 1/2] tests/kms_vrr: New subtest for CMRR
>=20
> CMRR is an variation of VRR where it varies Vtotal slightly (between addi=
tional
> 0 and 1 Vtotal scanlines) to match content rate exactly without frame dro=
ps
> using the adaptive sync framework.
>=20
> This patch creates a new subtest to validate the CMRR as below:
> - Request flips with the refresh_rate * 1.001
> - Flips should happen at the frequency of refresh_rate.
>=20
> V2:
>  - Tweak the clock if CMRR supported mode not found (Ankit)
>  - Rebase
> V3:
>  - Read flip completion events instead of Vblank evants
> V4:
>  - Fix clock calculation
>  - Other minor improvements

With Addressed above comments,

Changes LGTM.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>=20
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 130
> +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 128 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 7f64d6806..ecbea1bc7
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -37,6 +37,11 @@
>  #include <signal.h>
>=20
>  /**
> + * SUBTEST: cmrr
> + * Description: Test to validate the content rate to exactly match with =
the
> + * 		requested rate without any frame drops.
> + * Functionality: CMRR
> + *
>   * SUBTEST: flip-basic
>   * Description: Tests that VRR is enabled and that the difference betwee=
n flip
>   *              timestamps converges to the requested rate
> @@ -87,6 +92,9 @@
>   */
>  #define TEST_DURATION_NS (5000000000ull)
>=20
> +#define CMRR_PRECISION_TOLERANCE	10
> +#define VREFRESH_MODIFIER	0.1
> +
>  enum {
>  	TEST_BASIC =3D 1 << 0,
>  	TEST_DPMS =3D 1 << 1,
> @@ -97,7 +105,8 @@ enum {
>  	TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
>  	TEST_FASTSET =3D 1 << 7,
>  	TEST_MAXMIN =3D 1 << 8,
> -	TEST_NEGATIVE =3D 1 << 9,
> +	TEST_CMRR =3D 1 << 9,
> +	TEST_NEGATIVE =3D 1 << 10,
>  };
>=20
>  enum {
> @@ -232,6 +241,21 @@ virtual_rr_vrr_range_mode(igt_output_t *output,
> unsigned int virtual_refresh_rat
>  	return mode;
>  }
>=20
> +static bool
> +is_cmrr_mode(drmModeModeInfoPtr mode)
> +{
> +	int calculated_refresh, actual_refresh, pixel_clock_per_line;
> +
> +	actual_refresh =3D mode->vrefresh * 100;
> +	pixel_clock_per_line =3D mode->clock * 1000 / mode->htotal;
> +	calculated_refresh =3D pixel_clock_per_line * 100 / mode->vtotal;
> +
> +	if ((actual_refresh - calculated_refresh) <
> CMRR_PRECISION_TOLERANCE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /* Read min and max vrr range from the connector debugfs. */  static ran=
ge_t
> get_vrr_range(data_t *data, igt_output_t *output) @@ -496,6 +520,57 @@
> flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>  	return total_flip ? ((total_pass * 100) / total_flip) : 0;  }
>=20
> +static uint32_t
> +flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe=
,
> +		      uint64_t duration_ns)
> +{
> +	uint64_t start_ns, last_event_ns, event_ns;
> +	uint32_t total_flip =3D 0, total_pass =3D 0;
> +	bool front =3D false;
> +	drmModeModeInfoPtr mode =3D igt_output_get_mode(output);
> +	uint64_t req_rate_ns =3D rate_from_refresh(mode->vrefresh +
> VREFRESH_MODIFIER);
> +	uint64_t exp_rate_ns =3D rate_from_refresh(mode->vrefresh);
> +	uint64_t threshold_ns =3D exp_rate_ns / mode->vdisplay; /* Upto 1 scan
> +line. */
> +
> +	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> +		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f
> Hz)\n",
> +		 req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
> +		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> +		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> +		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> +
> +	do_flip(data, &data->fb[0]);
> +	start_ns =3D last_event_ns =3D get_kernel_event_ns(data,
> DRM_EVENT_FLIP_COMPLETE);
> +	do {
> +		int64_t target_ns, wait_ns, diff_ns =3D exp_rate_ns;
> +
> +		front =3D !front;
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +
> +		event_ns =3D get_kernel_event_ns(data,
> DRM_EVENT_FLIP_COMPLETE);
> +		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f
> Hz)\n",
> +			  event_ns - last_event_ns, (float)NSECS_PER_SEC /
> (event_ns -
> +last_event_ns));
> +
> +		diff_ns -=3D event_ns - last_event_ns;
> +		if (llabs(diff_ns) <=3D threshold_ns)
> +			total_pass +=3D 1;
> +
> +		last_event_ns =3D event_ns;
> +		total_flip +=3D 1;
> +
> +		diff_ns =3D event_ns - start_ns;
> +		wait_ns =3D ((diff_ns + req_rate_ns - 1) / req_rate_ns) *
> req_rate_ns;
> +		wait_ns -=3D diff_ns;
> +		target_ns =3D event_ns + wait_ns;
> +		while (get_time_ns() < target_ns - 10);
> +	} while (event_ns - start_ns <=3D duration_ns);
> +
> +	igt_info("Completed %u flips, %u vblanks were in threshold for (%.2f
> Hz) %"PRIu64"ns.\n",
> +		 total_flip, total_pass, (mode->vrefresh +
> VREFRESH_MODIFIER),
> +req_rate_ns);
> +
> +	return total_flip ? ((total_pass * 100) / total_flip) : 0; }
> +
>  /* Basic VRR flip functionality test - enable, measure, disable, measure=
 */
> static void  test_basic(data_t *data, enum pipe pipe, igt_output_t *outpu=
t,
> uint32_t flags) @@ -702,6 +777,49 @@
> test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t
> *outpu
>  	}
>  }
>=20
> +static void
> +test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t
> +flags) {
> +	uint32_t result;
> +	int i;
> +	bool found =3D false;
> +	drmModeConnectorPtr connector =3D output->config.connector;
> +	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +
> +	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-
> %u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), data->range.min,
> +data->range.max);
> +
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		if (is_cmrr_mode(&connector->modes[i])) {
> +			mode =3D connector->modes[i];
> +
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	igt_info("Selected mode: ");
> +	kmstest_dump_mode(&mode);
> +
> +	if (!found) {
> +		igt_info("No CMRR mode found on %s, try to tweak the
> clock.\n",
> +output->name);
> +
> +		mode.clock =3D (mode.htotal * mode.vtotal * (mode.vrefresh +
> +VREFRESH_MODIFIER)) / 1000;
> +
> +		igt_info("Tweaked mode: ");
> +		kmstest_dump_mode(&mode);
> +	}
> +
> +	igt_output_override_mode(output, &mode);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	prepare_test(data, output, pipe);
> +	result =3D flip_and_measure_cmrr(data, output, pipe,
> TEST_DURATION_NS * 2);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> threshold not reached, result was %u%%\n",
> +		     mode.vrefresh, rate_from_refresh(mode.vrefresh), result);
> }
> +
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
> {
>  	if (vrr_capable(output))
> @@ -718,7 +836,7 @@ static void test_cleanup(data_t *data, enum pipe
> pipe, igt_output_t *output)
>=20
>  static bool output_constraint(data_t *data, igt_output_t *output, uint32=
_t
> flags)  {
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_CMRR)) &&
>  	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
>  		return false;
>=20
> @@ -906,6 +1024,14 @@ igt_main_args("drs:", long_opts, help_str,
> opt_handler, &data)
>  		igt_describe("Test to switch to any custom virtual mode in
> VRR range without modeset.");
>  		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>  			run_vrr_test(&data, test_seamless_virtual_rr_basic,
> TEST_SEAMLESS_VIRTUAL_RR);
> +
> +		igt_describe("Test to validate the the content rate exactly
> match with the "
> +			     "requested rate without any frame drops.");
> +		igt_subtest_with_dynamic("cmrr") {
> +
> 	igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=3D
> +20);
> +
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR);
> +		}
>  	}
>=20
>  	igt_fixture {
> --
> 2.43.2

