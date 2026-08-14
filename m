Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F599C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2310E17F;
	Fri, 14 Aug 2026 16:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TklIXHPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA210E17F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786726059; x=1818262059;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TBWah7jg/jc8lVEq9LuJaVr17N/s81F5bl1pF/3AYAc=;
 b=TklIXHPuWSi5/zA1FKQ+sDxpnANRcuGT/UXRDsIjaNEkHJ1DWIM1VN2q
 bt+o+IG2I5Q//TkYCNLW7GmZfQ8wL35tizItNwrphOZKHHjEjGUTyKUqP
 VGjFP5Fr1BUXb6FlUftbGsiEhZxjxx3ZSuGL4/T8jT57YADjU2u7iX+1m
 iFpCdfMF3cO2VsBNAoMNHSIJ4iE2x3ATQ+9ONWxMKQ9tdt+9pOrInnr0B
 Z6VbyHIa7h/jTz36frAUxouNz8hU2TT757Pcv5z0L7YipvHKlEf0fYivC
 whiJqM7Oq2oGkivLmWn4EEnIWlJn/U+nwwrgRMSWy+YFbIKkhct9fe+cp Q==;
X-CSE-ConnectionGUID: EJQhD2piTJiwTqyGTO9Osg==
X-CSE-MsgGUID: M3kk0LlLTjqyTQH2Stvn5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98821778"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98821778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:47:39 -0700
X-CSE-ConnectionGUID: igYfgxyERKet8Mtu02q0tA==
X-CSE-MsgGUID: 6e6/8N3wQsW4K6VqefSp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261627562"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:47:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:47:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 09:47:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5KGfC0FrB6h1Qd6kdsUjBIvjs45A12w3MmAH63mXKZ2PXeV1cNP2h4QDH4qB/XoSnU3iyUacJfjExNaLYCRChN5wTDrXngM9lVHaA6hzRfr6TOPk5NI8aOnYyCDvt+cE9nwfNrMdnwCHkC0mctTDRPdCf3sRci57R9baXkupNHp3IOAy+DMoFaOOeoKTpK4kckMVkJLSs3Drcwb7RNYhSCQYFwReKaa/yOEafJbJRZEFYj2novecP6YwcUJxawxWEsgQBI8X90X/F9rdwhL0GKv3QX7+07PyPHXV1VwZpZsq2MsJqUFAvzdGTOxBpe60XdhmJx4hMlSptOHz4GOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JvmmVlVqnSDHaFZ6EeKmhjO87VpiQW1HrJcwy38QCw=;
 b=pNcMZ4To2lgoPTXluYEKQwn4yqIf4HFpTtfjWe8g6bMtatjUvLWoX5vY0qG0qxPljznuPwdMsRBeYb/EsFnbDkB82HlVxBFHoYEykMBZ6CNVsFLyUXRioDUFm3DKcCuTRqpz1T+oXo7tmAkHuUXIEUAElbjXpH6N5BOkWP1lJbXruPiiz2f/cqEyqcHxZo/OcLzG+csy2Vh/bsmD741VvLP/XtkechW5uR9g7kOaJmSVGvHlzZSVyu552bJVrvtr0PQZnzA2fwVWbDQwaN054To8seUTNqG2f+ljFnT7zImi/R3l2TtTR/gjV00aT/0zJbJCIMXqBC2EFGCZtOQwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 16:47:24 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:47:23 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] intel-ci: Add xe.cri.core.blocklist to
 config.json
Thread-Topic: [PATCH i-g-t 2/2] intel-ci: Add xe.cri.core.blocklist to
 config.json
Thread-Index: AQHdLAbx3bi68RnN0k60LbLvw9lQlLadwRbg
Date: Fri, 14 Aug 2026 16:47:23 +0000
Message-ID: <IA3PR11MB901356FAE86786D380A368BA85DA2@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260814160648.19715-1-himanshu.girotra@intel.com>
 <20260814160648.19715-3-himanshu.girotra@intel.com>
In-Reply-To: <20260814160648.19715-3-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: 20496e90-85d4-42fd-6095-08defa23b747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: kbF50k1+XlKlrYASR096JS0uCFvfQMx/iMytYx6/6hS074BHQaXqN2HRn602fp79J7zKj3veMHFWY5FYiSZLNkBdtPg2BdRqfvW9eG5+uLfUvnAsbGMFQsXl4pazCVJf834hHH47/66/5+wD2QqkUs/Qnx/UDnGjCjLXh0fBla3t12nJppGGYpHOFPVBR/XpFjNOMwZWGEvYm/aPF6Q+yOTuoTbQIsmkzM5dkG1Sa19InLAtXdjC3uortcpviGqHw5SHamep69aBeMka3rk1C5ctJETyMSb2ONEbIauB6+ANR8fYcjxFgx7o0iWQSJXeTmdWj3iEMFlMzzxLVNyq/iQQgMrY8NkZxTfsq6Dc8ivQbx0As3XOvUne5PmbSXh8YMm7maOz+0zlqgArXXbJCOWpoyuYO9cfiiyDaAcuEZy/EDGnOib6pqb+VRJeQwXs1p59Z2m2VI03vj6VXd9JLrx695Dh0iHZlTk+Iw6fC3pmv7Aak1bLDQeOhDPHaHcpWkuNCE7RNHMVRGTzfXkh+tI/9aKmOPMPhoWHMZF2MVmNO4kr+6jNpAXBBGvfa3Gr1MEewkKZjnRNhKNNXV4qtlTpcb96u1eZ0li3J5IRQYY22YutZdV2BrPsEze03rYulWa/WAyIgjHakeoX70svTeJB7N+PFDtnPRgjTiuuvW8DNMAmKfYhbzv0Qs12iBm8TRwGFGl+LRzgFSJlJQVdtTckN1ZVi6blT7DLXr3i8ZY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FQpwRbJUPEgfstdJqUcrKwyLWFGtrtqEFmXBK3pxZBt+RdKvM56RTCYvQXkE?=
 =?us-ascii?Q?1ut6f65lj2znWsG5EqqCMTNAwrgo2PW5A5gW55GvM8AWLwZ4yC8eOJvb30pn?=
 =?us-ascii?Q?g/+6CnwF5W8wiz/RonK4F+zVOHdaX/MORzkynSLK7O/BNaRwiCmYyhddWuyu?=
 =?us-ascii?Q?gFcnKh4zdj8anB49Ho3SPoFa4NsbNYjqHBx6s2EbGDj3fYDzcsrDVHXbCnuo?=
 =?us-ascii?Q?7ybFbgTBmtWAzEIsVxbV3ZGceqPBjV5S1bwB0pf9FPLQ4DJDKdgpissKJDO8?=
 =?us-ascii?Q?ag2JDTGI8be2iqSSeSUzskJy0umtN8DpfAOo3yFy7/QyP+TCDHf8Y0rhyMPS?=
 =?us-ascii?Q?h1lUOrS2baZDiBO68ifEcMlly91XdByUTtm9ALGu9C5RyFvU6//+6V0Lv0TZ?=
 =?us-ascii?Q?/cU+nI/2j/lVlHE74eedVNiaXqUc1mWrPP8S3sHj3AvSU4LGAPCFTiTlOJjI?=
 =?us-ascii?Q?RrkWzLTb6tzq+qFr7a+yrzVVP7ucNufvauv4X25L5KkRNsYd4pL2V/2D2k/Z?=
 =?us-ascii?Q?H0UMFiWLw8zBhgr/a9FaCzxTBP7jKiCGcTe7fr5xCrJFpExeT4Yixg0Lm3oB?=
 =?us-ascii?Q?GvqHnS7/jM5F/3Gt7T0wWIOw+CoG7/d2fAWNGNoj8y97uD/KxPFaRNx/wHo8?=
 =?us-ascii?Q?thpOjHLcCi2uwjbAjvbHEVbs3zX0jWAZvPgq8y/7yUYuaSWpumrqeC+dcpkl?=
 =?us-ascii?Q?3x3q2DUwIyoBOg7iLTtcfjoa2egQAM9cNGfdwVRaI3wnZ9t55KYoF/zHmb2w?=
 =?us-ascii?Q?Oz0xaSsDUrNEGJ8KuGxH7yLDlXj5pZilc1y34uV0ylkglMoVr8E9WOBC02Eg?=
 =?us-ascii?Q?V9ISLljf6Kmd9eX1oL0UPprVKolIYWnqvNxUA6qvnt1WzN3/GdeKgv/iv4P/?=
 =?us-ascii?Q?hZhreM9g9fUKP5wChoM+iTrWZGEn9s3X0BU7Gk2wxs0PrIzKxFtL/iObu3IQ?=
 =?us-ascii?Q?18xAQ1AgOBaQYH5fdpCCp88+I+bztpRl4sZw7t1+v/Hcal85Q4XDuWDHSI1y?=
 =?us-ascii?Q?v4npI/IRHkQ5bgWna9QdIcT275RszvxA6WsEF9jHk3HgCTWGCCDDUVZ2kcCj?=
 =?us-ascii?Q?UchXkIvdXg7+cDouDTqEzD+/S4uwaWo6CNrbcMpMceV4qHCAYtdU9tl+utsw?=
 =?us-ascii?Q?2XWtZm2vuJUrGScFS6BzVSl8onZ7zBYS6UqOh27JbQafRrvyugsTiJfwiXIM?=
 =?us-ascii?Q?0Kkzk6YoujavNPJQbLHjmUeY7rLAsQ13rrA6qxE3WGEBDP/k8mqZNcr+l6Ps?=
 =?us-ascii?Q?Cod1DyoYiSiDOh72xP9mgNofTShS6QtrLkHrcGIB2oLPLLUNGexc5HtfNzc5?=
 =?us-ascii?Q?/jRzJde1iteRtK4mT/sr03mBMQ1uWpclFtrpY20cbmM176VfKB2ho/f88Tc0?=
 =?us-ascii?Q?W7B8G4Jh2IAuD2cE6Ul34ZjUfO7i8TpSiXNDkIDRypa8OT07/edlfrwzyAnX?=
 =?us-ascii?Q?dmf5dPXymoaxRu2Oz/6Ht7amEy91HkUizzGiYK0pgoaeQXPavxp1y3QNi5HZ?=
 =?us-ascii?Q?NBci9UMbIJJFjXVedjQ9a2J4OXwgrwJFSfm3CLJhPCgw6DS7gV6FKgj9anKf?=
 =?us-ascii?Q?UJtPqE1ZuFv9JE2DYjYjozNWHGxIwscZVjz/vKLBeMIZWUKf3C6H6F0NJR9x?=
 =?us-ascii?Q?k28j4osRaAeU1P6ZLI1PipHiGuk5PvQtms3peuvNa8j/lcLRSIKe2aP7nPKF?=
 =?us-ascii?Q?os8eHwRkxvpx8oEn83fdMOHfXsiFDqex1F4rGVPKq4Gto5E3p6C8OruS2gOc?=
 =?us-ascii?Q?vptZtAIugQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I7b2ky4pLwvstdPrgitZFRsy8+pT3JAjssSIpkFVAMnPst1O68cP5TzyRwQcGT+tYj9VWLscbVs9OMQ/amUFoE8D6HdaJRusQI9y0apMfBKhAEyGP2A3L7dwUs6I1lHrC3+IopDPrnFdtvIS+kYriiRe7BCuO5A1on9epDXhUNtWrbKt2tBSYGpnmkYmYbB6d4IW6qej1KuNho6PJJXd6X7vENZtnYypUAH+A8Vn+MmuKurYP8ixY2MkU6KC/WYoP8kfzT8CFUOj4GApKclrRRexyHkOOpB6lvmbuCpC1wLGO7foFZfRBjpDya68piS6LNuDCr8lEQc1/QWjwdUI8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20496e90-85d4-42fd-6095-08defa23b747
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 16:47:23.8818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D3tij+W29e7qJeCw8VE6iHAQ4+wR/D3U1ZcZQAWsTlJgiQhao4f0RpAbJq+NsZhrKDZC9xRKeiGvqmzW0HIW6PTfhcTJ6mBoTKmoC8Bp3mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Friday, August 14, 2026 9:37 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: [PATCH i-g-t 2/2] intel-ci: Add xe.cri.core.blocklist to config.=
json
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Add xe.cri.core.blocklist to xe_test_config.json file so that core testli=
sts can be
> generated for CRI for CI execution.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config=
.json
> index 55542655c..43c758f5c 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -79,6 +79,7 @@
>  		    "include": [
>  			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
> +			{ "CRI": "../intel-ci/xe.cri.core.blocklist.txt" },
>  			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
>  			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
>  			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
> --
> 2.50.1

