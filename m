Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F98C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 03:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1D10E2BD;
	Fri, 17 Jul 2026 03:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRZfxJIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12710E421
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 03:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784258932; x=1815794932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xinu5GZcOXHGoIM4bPPeqG315L7jGj+ZOngfLb/3IeM=;
 b=fRZfxJIMI54EUq5OmUj5vA8ZtMduMkLRILAWRoOCu36AfORL2TmLFWwu
 +etcBo/Cg6+JHgUktfrH2SM4vWTWKfZ23VE4ErXc88Osrci45xbB17JoH
 4d7grAMh04M9ZJDl2uAG23mLslF1ATaRYTwkYALnMW+IrmsUlAEl5CJNm
 4+nJv0pL7K2K5wHPhvj+co805duTyMdYuIuZtcRUVqnOtFdNxczcUztwY
 BLTxM4Uy8TYXqKHZOXSPUTDI7wGepeuByd1JTrFxcb59fYyvwzBnZELZw
 DJKg+R8AzIT0+elvQBX8+oTGcwJdloTgelBJQkXAwDujQKxjuxEkBA4BG g==;
X-CSE-ConnectionGUID: 4KtleFMFRzGw70QWxcEPug==
X-CSE-MsgGUID: sGeDJaLhSDS3btO1MkgT6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95529634"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="95529634"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:28:52 -0700
X-CSE-ConnectionGUID: R6HBHO72SV+d2T2OMNKfwg==
X-CSE-MsgGUID: Ot0iMMxLR2GgPS9X7BruEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="260493838"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:28:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 20:28:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 20:28:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 20:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5pMKi8az9XAIHwagojacfCZkA2wGQ4QQQS2mY1U9hunOUDFgilZzgRsvyljXR/vNfErAUd0MUqt9uj/FEf+IQD5ZczqKBUVbtrMTn1J+eTgLUZeWxcrO6jF9rQQ6eYXvy4mfFi37MyZwilOjoGE3KrvM7rcX6M2/vfUKXuDHnnW/VP06cBYcDRA6Wql5ikAAlVqgbLsp29KFGmQCicXkYznXUqIVVOTnLHUB38me58QY/6ylZbSuLqB1W2AUP+JLrkub6zMS82nYfIFkMpCtjLipxqwO1xU9zTFD45IBfR6ehnDuoV5u1Er3AUzSYf0Zn8T4mTqHADqLgQGRaYp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+7Isf2MgSgXlKYOl3qH3uhlCZxE11oQlIL2Tutjqbg=;
 b=mfsRZX2J5sEGRoigNR+Ngu0/fC0VibdVQClvtK3PxGzvQaheRBe9lP2OF/tBAc7AFyGkl8kH+PFIAylC2gh3n2iEwS9mJ2jn+TMJJNioztQRxhr6b7pxkxhNVMvUrR5SeMBXOqlHGqO2OvgF/nxQTHdmJ4k8eRnOlivfLz7ZQLHaa4/Xo+ChX62GwqwC0gCeEQSpv7UabdqrSo1jwhP6eo5JkOoQoyeKDiaBOEYLgKev+HuxDqiDt08U2eaIrDZ321b8tKfOua1r0wGCe30upxtt7JdIfOYTSCtVglWeutGfREj64cJcvW/YhgszKS7E4LHMwlk+2rU4wUmzDUrwUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 03:28:47 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 03:28:47 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL
 blocklist
Thread-Topic: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL
 blocklist
Thread-Index: AQHdFVIH3tCGD+IPPE+SyhqI13eIZLZxDeag
Date: Fri, 17 Jul 2026 03:28:47 +0000
Message-ID: <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260716184422.3255515-1-swati2.sharma@intel.com>
In-Reply-To: <20260716184422.3255515-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5933:EE_
x-ms-office365-filtering-correlation-id: 76190d75-7b55-4ae8-0b24-08dee3b38342
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ohXFLgoUT9MnWnu4HmiEAKvjZtgeMcIaBMJeIr1ofE2TQV9lJkDhpBpUmQQFDtpDgMvPgbAto6JJwv1bfgGPcGzYl+kh6wuYfCbovQgPzdg8Jyll1foLbwGnqjzWNbwnm/JEef6nhZjSuz4fyOPCFzHV3t4env3ZNHRPjxc2oJL5ckADH5fnvrhglHICeMRd//LSJ75cINTM6NB8jxNF/VoueLc7ngXfO0DcIPXpIK/hq0YrwpH3SG0RbtzuvIeC8y4qIPgEMsZzkObU47JKLuK6tJ75a9Jr7NRaPaA9Z8EuEZ29j1lTtM6s+WVKmPLbpEefyYosht22w0Qd9F8PKDxACjawPYwK6CWbZPIocyDHOmjNXYVGARDViuS9XMy719lMPnmY3fBGwRtkq/m2/SzlmJ0uFxiRbPXC7OFsDeIRgFXIWrctVfoCH4evB/AU6EZue+8n/PFx8PZwOM4tO4Q3MX+IvjdeWUHeWllE32BPIjPxQZGSVDynzpOG/Wcz2fvqOxHkh9TND1C2XXyijxbmAugqXofFRjNRCcNClY+9ae+uaVnL9SGe6PzN5gLdWgY6/M4WMyRFTejWoEj0s/0l3Q/ptVd8O8qQ8JO2FgzeAlZUq9R0gevo2/4AdAwjrRIZT5MRr8yVgtBhu2B8WwN/80n1O0VmfK4uGnMU5eWm1dxe8cmj78f/Ny5td2J7iwqSgM4iEtxKPN9Ta93CKgF8Ilc6y9nUKlUHzCKmTNs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NEFFUT+YSXrNb1FG78L6huGP45S9QoZtFXBIn4tZv6bUic7NknHe5lrPEOAr?=
 =?us-ascii?Q?6hFqdp6L9L+RCTHwjfXmLKanBDqVy3oW1yib9xLHIYiHmx9YpOJQa8OvxcQ8?=
 =?us-ascii?Q?1jKBrA/qZHO4G/uL/fzPNUcPAS8qvAyR4qFpY/KAQcG5rI5IfJzDt+mvmpsT?=
 =?us-ascii?Q?fEGpT1UhZWjH4LdbEvZz/jy9NHZjWt5irqrx0pU3yg3JeDaMzfCKvCRmNyHw?=
 =?us-ascii?Q?pIvZvTv0WsrQX91nJ5gYt/2CwMYVrbdcBavLR78K3Ih7t1JUsvsdw+iNmN2q?=
 =?us-ascii?Q?7OQ+7qpZECfJI/JzAs+Q1TEGuhpA1JoDDf/YhuNvSpQ6yl3ve2DFDbdZ4gi1?=
 =?us-ascii?Q?JJD3+cvkIIVhMiU/cMewXZavvmphZ60/JOrAERynbjUeWEfxlIW6s6gVzz3t?=
 =?us-ascii?Q?0zBeQ8JuX0F9Zian8kL4LtrPGFff+tE3hjMxURahBlzee5CejV21Sfmt3eGf?=
 =?us-ascii?Q?CrvW9j0O3hJoG7hOHwrMNnnAlfl7uduOr6Y5KD9QWqiZtPcPWvhGeqKgtA8N?=
 =?us-ascii?Q?ax7OrBDCg46yef+yMxUbfls8/+sb23JJk5N3WzNEMUshG1RAY8lpu28Ptdv+?=
 =?us-ascii?Q?zmYHoDe4i3XVmhrzc9J1NUTPcbcY35NKXerZj5G0QnFpOmzqezw8hRXA2NuN?=
 =?us-ascii?Q?+Z7xbj7D2in7UL0HsREQHXmrON6hF2VLogTE4xeUOohXcfFYc/clPu4uRXPz?=
 =?us-ascii?Q?0jq0trxnrGAbOmAAW6aD5YiWnD5pCF3m/cFupARgxG/EH4m5/D/a+0DnNDGD?=
 =?us-ascii?Q?4t1x9+pucoB3mmuOyxXCc7f0fIECmbSLE0xlSN9OksObbHvSV3+MFCStgr+T?=
 =?us-ascii?Q?57SUXvfoi/Mlpz7nkLcwHjTnVOBlVh4eC7yDamq+T6MiFKG6mNdrQdk6Wbvg?=
 =?us-ascii?Q?qwsJKMCcMtsqUtBxUoyG8WpvXRCrOhPFS9df3lMQ3aXWVU968iHujpuUf4Lm?=
 =?us-ascii?Q?E4qSHsCXR0hWCiyoHcuX2MvpUSFdFAKfTqdr4u7VeTDq78AlG1pvephjwDhS?=
 =?us-ascii?Q?pr6gJ7DmK+I43Ly0sbeKxZ9RqYOxcKHT2wfx0g+l/gt8BAb+5U1XqR5Bgctk?=
 =?us-ascii?Q?4jOTCPjGmarrC/Hv5ZoUUAM/EGWmmPHl849vbR3011g8JwfrzOYn0TAOINnW?=
 =?us-ascii?Q?NFvVnjpzdhTX20ZCwz8/za0u9/xG7nDOxBCD4oAgvAcM+FbyllbN9a2MiusT?=
 =?us-ascii?Q?dtZt87lL0aSD1p1GQnqRU2e9/OG3GtpHKdSq+JJLDGv8b9lB/TYicMf0dltt?=
 =?us-ascii?Q?8iiNT7RIkZNqAtncB40A63TnyGdMJYzN329t9SrhFHzzOFlRDCamvlYFBo8J?=
 =?us-ascii?Q?45HP86NnMJwavGfntFB9PBklP1rLzIpj1LpmIE8FixViCxze0hZ1n0api6eI?=
 =?us-ascii?Q?Rqfc2pw+U56/bfUp0aPOtiHTvwrAYFw9V79dpiBxvPMbkWwTjra6ytXBmYrq?=
 =?us-ascii?Q?BDjEIK5jM+JOEcyNoqmZdGf+JHoZ+eJxmPidTBjTNkgbcR9gMH5OdfzOMHOB?=
 =?us-ascii?Q?EVzoZRiVfOKguw5wmJ6+tjdZIOgyhOJLYlb3ThptDlOEtHDZ8UBVU4vvXCRM?=
 =?us-ascii?Q?UjIeeTFxkkmPWT+ftSftbbQG8InN8ynmQr2Y3sePi7wyefSpkXtPCnDV9WPv?=
 =?us-ascii?Q?A0LeNWvvt5Hw7ipdAkKCokt5Frgiq6zK8Lixb5EWrdaxzgPswKXh+j+XVs94?=
 =?us-ascii?Q?eRewRnKblhrzqwGA9U+AfTxjm6h/Ai2R/ax2kbAlBd5VVXRh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GvRN405iJ4F575DS97sf6tvtWYvrjFCBUPyb987LldIjyDHa5C8FhA3jwtWyYS18eK1LpNPtDwgq2UJglmoI/aJI1LgieGycgM9qAhP1fyGLI3qJWLUgIz48oGxcM0NPZTcRbKrpIJypATvmyaTCakLZlrDLe2yw2DIoz8APbTiQMHObs2qG+EBVHUXFZKLql/9HKdhYfz5YLTLmWUioy4VOoeY2zaH5S2LWvExSHl44eh8cjKn0WMid35gYX+xX/nGeVxOvgLeCTH3pKcV6zgSFSs4blRSLm1qBzgivKc5IEsdXgocVbFNMQr2WdSmkAfeDgkYqXWc8LPN+BjbNqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76190d75-7b55-4ae8-0b24-08dee3b38342
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 03:28:47.3656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0kk3g+bBSbWjrqk5LXfGTaY7ba1dz4BkuChNEmrgmwlCyI5yTyNf0SzmGnvEQN3Q/b+oAZUY3dCoOYLEu03eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, July 17, 2026 12:14 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blo=
cklist
Update intel-ci to tests/intel-ci:=20

With this PLTM.=20

 Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> ci/xe.nvl.display.blocklist.txt
> index e6390d16b..d44c4030f 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -81,7 +81,6 @@ igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
>=20
> #################################################################
> #############
>  # Valid skip: Simulation specific
>=20
> #################################################################
> #############
> -igt@kms_pm_dc@dc3co-vpb-simulation
>  igt@kms_simulation_hpd@sim-hpd
>=20
> #################################################################
> #############
>  # Valid skip: Mei interface not supported MTL+
> --
> 2.25.1

