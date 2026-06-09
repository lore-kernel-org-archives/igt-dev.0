Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8886CD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 09:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6159110E1F8;
	Tue,  9 Jun 2026 09:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ts+yg0M0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079D810E20C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780998512; x=1812534512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rAMbXnxLhW+nWtrPn+ySuEQWZzHdJx6VW/Y8iRiwGXI=;
 b=Ts+yg0M0edb8hAOkS/+ZoyhuvxTDy4euhHbh6q2vMMF9PaaRqGGaLPEe
 6DkbUFlrZWCzqB6CLfxOyRM4BCXCBbsYMgk1LMHGFCViLjYiFPOuDMiQB
 CL0luigakZ92CcNP0B9WBIvHhYQkuM4fr2Ahmki1RZOFXUGtwj0FKBep5
 4EG5cdOT3aB1J6OEnd4HIoBNKB+SnlWSYf45bHAG1faRWtwPDl1LpOVih
 4vPv4aHO8SS9DfwF3tsUCUF7S0KJ9yZK1vHLEVm7I3dRsjgAtQ2wAn56Z
 FI/M/hNIFUdeKiU0Erb1PdwTpwIj2cIXYI3z2SMiqgl7cFxSeMSoDSNWv Q==;
X-CSE-ConnectionGUID: IoxmR7xCT8ir7suqDrRl9A==
X-CSE-MsgGUID: WnLHCnLOSXGM5CumSSmUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81865354"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81865354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:48:32 -0700
X-CSE-ConnectionGUID: NHN2j4zNSL+IvxkgGJVElQ==
X-CSE-MsgGUID: YXQC6pncRZe0IqeQOFo75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="276002788"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:48:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:48:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 02:48:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/pAxp2kzbmdw15D+qriyVTDdcj0MGxMdfk3jWGtx9VvIYy3oqyXcXQb4DFYRQgzPDXi7biIaFvw30QBsA18B0eHmjrD5hymZtWTCAU3QLapUelpHrhbicJeXB6a6GIX8A/kmTdvWVhAMCcb532ZrneUbX6QkzcbzQeSf04pRdcp0lkvF6TVSOnpx8FdukpfhD0VR9dFx1bZrZCtwAJyJOfnF/9ZbJtUWlq9e5Q4V5KnJbH+8XPQfMx3QZO+Hka2qzt557j8nB4Sui+/Z+48ng+SO61eKera6F99O8cj93IlDjwGm7GajszWplAnnDIC0zS3UGFLvV/Eztd3T65ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWBjD4kiDaqCWTT6gbNUYUSTZONGwNHndSqVUEYRJLo=;
 b=B6eOG5K5KXu8E8ZDtAZIlap9ebCqR5fsWlPifFPdvfoOEe0kiKy4qc5ED+G+85EPRhIMEUaetjxwmhm5SrVTalnsKygk4sgZrxI3SlpHfxITRY2aVD2wnQMZLPNOkWLJ+eL9cUFEMWvP6oiLTEmY5A2hXarkA9oYIEVIYWX1p8hDIqHnDBn6Go/09eb1JehYs9Dwq7EXlwYcpGXnT22VOzWeuOTdJ0O46pdkB+/Q+4e1GG7lR1T+eo3dpSoLKQCsNGKAYFCxLUUtwwgpnWp4dwcKXlqkvNOQFLq+32cWdF/zofPsaHl0z7si1TFE9Ej5QSnManfSZkkGihz/DavCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 09:48:27 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:48:27 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
Thread-Topic: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
Thread-Index: AQHc94CuPw/VnhSYZ028lc8uHHgmg7Y1+hTA
Date: Tue, 9 Jun 2026 09:48:27 +0000
Message-ID: <BL1PR11MB6050D1973B1879B585337E70E71D2@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
In-Reply-To: <20260608193807.2616777-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|PH7PR11MB6956:EE_
x-ms-office365-filtering-correlation-id: 0edeafea-b892-48b2-d747-08dec60c4162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|3023799007|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: qbxbf/YdjCnPhryZ0QGNBtTCS+GKEsAW5jUbL1R79stQVUmrAwvAaI0lmMSr+ZPEIIRzmKkU3AYnKTpQNCT1M82mzC28NKxa6eT1+yIGYUA3/H94sX8m/+R5cOyT6u4aaQtG1/iqODNVDExCuWZrtGog0TWDcjZ0JU/+OUAAm+XnwOoTtnyl4QehSEKTqbqiVzMc15Z4QhY/XqZW+03uJ1E2BFZOWoX2O+z6aqacs0u2/J/DHibiy1WIyEOfmO306TLN5w0bqNJW7KKyxPLBvSqxZ4tQY58pmGql/JrfoTgBCU7yd2/ybR2FVcIgkJUVv8pEsEhyCC7dGtUMdT2/V1hNzum9Xf5GNbJ6juhJwlYIRT4rlkpsTYWiYYWvxSPcXFAjJPLDKIA0b78nR15e/QIYszfpK7r6Uw64rr/3WtX4rmDmaJGc0uQ0IDD/j+J45EVNp1yA8OkMkyKtu8sMe1H9pmW17agzEf9Q2fIgwRvKiILXgeL3//Zk1smy6GpVbfDr8lPR09F4gmUoGoAnzlElq7y5NusjUmJnTUrN8dd3D6qwnRBXmQhePVCYHy9CJj3UlwJT+cwssPKKW2/vzLUU58g1B7pzAhIKK5m5jzIQa734Q5WLqN9JSt9ttgpeHlZWa/kGs59F+pNWn+w1uiXMA++UA79kBDBCI92f7CcD9bhgNAum6gEV9TJ11fgeFdo70/1k1x0QLg3f8j0L8tBR62LXCIHsAki3IFwEYjgtFW/xPNoy3Vwt5z9R/uoJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(3023799007)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ybVx3UVSl6JHc5AhpLN52PPdCcr+xIbF7c/ck7bFIPDans1kykn3yYttv6jO?=
 =?us-ascii?Q?0FflNxcZwQXFaVBwBHjvKyCMd8yR2RWtw0Dru+eFpXbptJIjKrxqgKx3n5tU?=
 =?us-ascii?Q?Umtfgu9Ml8N7SjriSA0U2JBer/MZDygznvemxDbAQznvxAO67etRD1kT6m6h?=
 =?us-ascii?Q?By4BJWR/0CSLckbJCrCo8JJ8DQWwDdoiMtQUIdysD0ILsP/EIDJiO1NzdWxh?=
 =?us-ascii?Q?+u9KNXdbR+2dx8ijI66iG1403CDdFbXLkivdlD3gdpWOD4wkhdo9uGv9QaIv?=
 =?us-ascii?Q?hX+K6HtR4PCmCRVI62XIdpj2YDvR4zLEpPaOe/Hrgpn1IC50uFR0oMFY6z5L?=
 =?us-ascii?Q?eqXUreL3mK6lqUK3Dq89HkzDf+lmsOqKhjetnMuTuJP0mvEFn1iAqR3BmX3S?=
 =?us-ascii?Q?wn+TZ/dUponNX1Jeh7V0N1rB7WvXu6g/e/V10F/zMRs85ng4hVTD2vbQ8k78?=
 =?us-ascii?Q?8GjoqOJoTi0QTjaihcGb1R76ADeM5VX9V7SM64iIAhVCw+DZ4vg+SUmm9d2y?=
 =?us-ascii?Q?t0baq3Z+0gz9WWBhWvTCZ3WDTFWe6J9pNnGp3QblFUZKnlCbS4891p2WP32C?=
 =?us-ascii?Q?52AAMAm9l6m4p8j5ggIZW5Yu9pY/h6GpClpDZKa8J9Nr9QqOIMQJLdGfd2tr?=
 =?us-ascii?Q?zit75UECOpP989z0HqLNB2cjGV3FHBTeciZ9JB0DubckgxG9aTV4AEGz9VxN?=
 =?us-ascii?Q?FICst7G+rHFs2Mr74amsT1GeizpuvGsRehmEfUHxe3prQFGLXpFa18P2TxXP?=
 =?us-ascii?Q?MAHndaWkCzt0cduocCWhuUdPY6PvfYDdL1s/BCfquCngp3MeJUhaOrzaDHcB?=
 =?us-ascii?Q?hTIVsIcB3qmRa0WX7BFk/sPBedSXagD3YbTgQumLMwSmIVdJ3DntVw0KqfTQ?=
 =?us-ascii?Q?CaovCoGUNMGy1tBbbcSGZMb46lWigHWihBMnqenfpyfL8wCEjDycSXlHabAF?=
 =?us-ascii?Q?OiV1D9dv0l3EViO5M4x8W8B7u7iAkKytsjCDG93z5x7YZnFfViBswQe/Nfwz?=
 =?us-ascii?Q?A7v2L8d5xPRC+gAIETSBR/fYikSsDf9YZqsCcntlHgFRObZIM1uz7rHGn/8G?=
 =?us-ascii?Q?l7jhEgTXJRIvFm7RXbmhllGUkfJ4pFsFC1Ht++/KntyNMWS3o5am4qM9TU+L?=
 =?us-ascii?Q?go/FgXqLfPwi5D1Yo41XAvNAWwOPv4zAESsaooej3Zd7chCPbqwbDmrbu2pI?=
 =?us-ascii?Q?9iX5bYU9rS3yxVRQ9EyGYkmc1xMkYNkHyxx9eCjop+3w9QR2Fs/0sxqMw8si?=
 =?us-ascii?Q?9oz+lr9HXvFWFVimhNeQi2ldWw1pYEHT7TMQ56DQ20HQmojGgBwPzxYF/m5f?=
 =?us-ascii?Q?nhwN2gghKiPl9O+cfIrnU5MWb4Gvma3xG/y9s8uADFbpohoOsZiHY5sWJGmc?=
 =?us-ascii?Q?KT9w+3qpgqCrZx+BlljScywGD51UjOxClqh4CJ3AGXHJmtJhwSDJ40Ef3We7?=
 =?us-ascii?Q?SefU2spviBDX1yIWWa7+fVQshTcKcpVZm6ukonkEe7fFpsnZKi5hf9X6EkU+?=
 =?us-ascii?Q?qP6QMXQ8GeiXSw2eOONoERU8Ftm8zlzWOOocnbURSfskhSKD7Ng1CueZ0hTh?=
 =?us-ascii?Q?gHqgNyHqrvW6epQPZA5QUgF2rKVCJVOVB0AX5mpHpEoNt2bwQ7mRO7ImlMNT?=
 =?us-ascii?Q?kh518yA5heF7imm1fx4kHUW0zxVqst1VoJmW9u6DtG6F8UemG9zBi5yRpcv9?=
 =?us-ascii?Q?prXLMHBIqly3ujaBB1Y8fwZLicxwgv4Er0Qo/I4HI2yaVDCrV2hgj1jymBOj?=
 =?us-ascii?Q?gNXDUEYruQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SjAue0pPunU760yYpYLzuTnhk82GwUQNrtcchwuvCpGHCCe8k2WJylqagmipz/A6LTeC3rTNdkx/LRu2ydDTAB+XyxmHHCg1QyUOd6xxvHJkQhOH+fDlBVflwQ+rqVgn8EVFBs1Gf2P8r4BU/B6lbZ7NzDde61xXuG+f+El6fpLCbFNQZXor7hgskJqFxKvT8jyyayZz7+SbUfKS362g8yDRZkpfZp7Wx/9JYTtqRdAfJooTsR4yciIN0DDwn0pNDpS8BIT36te2Yr1lnjC/DZc7NVeArTgnD9QHn+3EbZ1WUqB6uDLwMQdoxiuD9YZVghzzaHY7UCUVpwHGVW+hJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edeafea-b892-48b2-d747-08dec60c4162
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 09:48:27.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JE428p3pi6/nw+TCRq1s3HJJNF3wIyVQUJcoenvXOWqk1VBpIbqgY3PuS+63SpgbUjVR/msmrbH2ITGEqiZdfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, June 9, 2026 1:08 AM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in finis=
hed
> messages
>=20
> The exit_subtest() function always printed 'finished subtest' in kmsg and
> trace output regardless of whether it was a regular subtest or a dynamic
> subtest finishing. The 'starting' messages already correctly distinguish
> between the two ('starting subtest' vs 'starting dynamic subtest').
>=20
> Fix the 'finished' messages to print 'finished dynamic subtest' for dynam=
ic
> subtests, matching the starting message convention. This makes syslog
> parsing and test hang detection more accurate.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  lib/igt_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c index dc3ac5304..a0d9c9d7d 1=
00644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char
> *result)
>  				*subtest_name,
>  				result,
>  				igt_time_elapsed(thentime, &now));
> -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> -		 command_str, *subtest_name, result);
> -	igt_trace("%s: finished subtest %s, %s\n",
> -		  command_str, *subtest_name, result);
> +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
> +		 command_str, in_dynamic_subtest ? "dynamic subtest" :
> "subtest",
> +		 *subtest_name, result);
> +	igt_trace("%s: finished %s %s, %s\n",
> +		  command_str, in_dynamic_subtest ? "dynamic subtest" :
> "subtest",
> +		  *subtest_name, result);
>=20
>  	igt_terminate_spins();
>=20
> --
> 2.25.1

