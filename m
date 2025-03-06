Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37D3C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 05:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BDE10E84A;
	Thu,  6 Mar 2025 05:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm80fcxi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6B110E84A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 05:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741240002; x=1772776002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b7dxcRrw4hqKsqcQ6ZXWYsyC6AY42g9kT65yfbRQeyc=;
 b=fm80fcxivwqXWMfhmyVJmFlZA+gVMEO0GDjqDpGgMW7Cx73JZ/ek7Xek
 t1wyIYHzxeuGtFCL93PuYCoZ/E7dECAkVWMRsRHDjq1GWLelgOJ7sS55s
 H9IjxVQafJRg4wmEPMGeLDFNfo6wFjUlEwQSHyUqlqHkK+h5rx9oW7jvz
 K880MaJg6E5Wr/eHZLI0Kz2khGouaccdICckZXW+4+2P6TaJPvnIxUlQP
 RyNkcY1NwAXLlqu+kG2blvnAn2TPh1UE9lFZNChemjcZD57OVrVFzUEV7
 yZ1E05hzx/AG2wmakpfJ/ohF1ntQA6+HcN68Dy4UYrV5yJsQP7HrXz+cz A==;
X-CSE-ConnectionGUID: 88ZSRfNoR4WVmUE5BZzlcg==
X-CSE-MsgGUID: aTVsofCJQtmLJw8T3npBkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53219120"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53219120"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:46:41 -0800
X-CSE-ConnectionGUID: C+dduS5xQleG1DA8Rw2mvg==
X-CSE-MsgGUID: PmsUJ6+nRTmuOZKw35wLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118634366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 21:46:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 21:46:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 21:46:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 21:46:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IROFZwHltgSu2Yc2P2TmltUTCHUZPzPENEeko6CxgS+audwj3+mkfM1g5vO7r7bAmXJl4XAsbxh4UqDCK2zpuYCg0vTqoJD9QDjtoXja/y6AyZCPtc4cDyBJwit5/JLPJcOKLdtTL33cOccKpN+8zZxA9nyQYDbl+EaxC/4efsYtl8Wn/O0hmCor+S3cBafb5PQcJymO9fbwlRoJkr9ECL0sEaCkcKVMgzrZtQrVpJnU1KMVjVwv/cahiBG3NU7/tEav1rHhTvQN4nQMvsEU8ZQN2MVocz0KhzB4veM/Skiu7u+hrBZPkHHiiYYo30SlNiKAJl+oUXsu0xsONWMCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEppgmHX4+0SvDoW+D5MO3avaVaS02aIPZmoPsewVmQ=;
 b=lRKGvJZHBJbr7WpoUAWFw0jnB3QiFbSfTqhf30MuWIWmuAz1ZuqfKnn2caPuD6qEi3H68bxPjAoOvhNhF0SY4kVLlQWMPxQRrBy/+Etma01cQ9P9rCB5C8s0TDXXwrYtV+AnQ0P36CbtWcG+umGRcx77JG3TGzc2r73Rcca1cozwYg2rw2a9zMC0IhaRgwB1y0FEjDFkJWvJrPy4kT2EyCkMA+4yrSeXlME1w91ZsYRgK7QPSz077/dnGjWYqgr/CbP1QwcFYZ9YF+O2MDBGQ21b5CA5XFadwW+K09kP4hLcxHVB134GrJuuNOML09yJhed0JjyL3Bpr3wCz9AOGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Thu, 6 Mar 2025 05:46:05 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%5]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 05:46:05 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retraining
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
 before retraining
Thread-Index: AQHbjBFWJksZhqGTUUuki2GkNNxAIbNlncCQ
Date: Thu, 6 Mar 2025 05:46:05 +0000
Message-ID: <DM4PR11MB6312490A48EA152E218B7D2F90CA2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250303080842.3194642-1-kunal1.joshi@intel.com>
 <20250303080842.3194642-2-kunal1.joshi@intel.com>
In-Reply-To: <20250303080842.3194642-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB5201:EE_
x-ms-office365-filtering-correlation-id: 22b812d0-e6f2-48d8-8541-08dd5c722fb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iNqMbG0zat2rZeoAqYD03kEhbyZODcJnaYWymSSG7bgey+/t3ef2hz8DH7Xw?=
 =?us-ascii?Q?NQlIoDHZObro50GHVk5Pp4p1p/qXSn686qgrGlUm15tZuDcMo4vUH7xvGNuR?=
 =?us-ascii?Q?zANJj1RnNZDUvoytE2SqvhTTt19H3NcqeRVPM+9AL62sRANH/armhsL2LCJa?=
 =?us-ascii?Q?uloWU1dwVWtAaik0dT9OhwAcXm2i1qugrqToCTY+Q0UUHX2iNZ4ozPJCTm6g?=
 =?us-ascii?Q?lNHUYAId+SWoA9UMLIqktAcjBCbtU0bhUiTBDncSJeOqfNxJpGqJBiTzew+C?=
 =?us-ascii?Q?bQXkh6fSIoVKLkreuiGsk+Ik5A27UJUHywlGt59TlgzKjOEKZNH5M9uJ3fV7?=
 =?us-ascii?Q?TTql2kwUHv/CBLfyb/PZu3fveAjiAHHRs7Hbz1XteatliB+qMKUPGFHZCEYx?=
 =?us-ascii?Q?JcUbst6cKLhPYnq7E84oJ+aRv7qPD4fSvgoYpxqb53Fmp6p7PmLLCw6pwZNW?=
 =?us-ascii?Q?Scih1pnPx3E7czRlf4W7S1JY8yeEIWtADQ7OB7nsktM/TzC+SM4WtoLk0tGw?=
 =?us-ascii?Q?1q9axeFYXgOiWJl4hzQCtwv8fViDssCsVOpRni7CLw5VfRWH0y7Br2jTBmYm?=
 =?us-ascii?Q?64/nfFhYry9SJqDQ8DvKF9O/PQKgto2lm9lAzfo+fRYUwvVjDvV6klZtstDx?=
 =?us-ascii?Q?E1BkZqhvV+oerkDCTTGQUJfgPOUf1ELNIPev0e7aHaqVbuX49sgdn+MpoPBd?=
 =?us-ascii?Q?B/3Exrjr63cecWHnzuPjZ5HEUwkoQ1qMYbZ2ibOcJ/TIgLNPppEBxzP6bc+K?=
 =?us-ascii?Q?sbprVvwFe4YtEH1YlSyJQrGFUjjlOapSkiPRqP5NjQSe63UnA+YLFXbbhE5i?=
 =?us-ascii?Q?tQwR6EapJU38raB1yk0k6a3yKSfTS1eE69z8o3ylQIuZwEUcSlKM3h23x3WX?=
 =?us-ascii?Q?IAEA05CfBYPQfG4teQQhUh9Ct9BxbuqD15cm7CDAO27+tNtPbPet54qBAJOj?=
 =?us-ascii?Q?CKs0QNAaAms48giG+GZCWsbNl499XYUG9j/PhFirI5EdxYp8nuQrO6wAvh8g?=
 =?us-ascii?Q?/t2Q1mlq+wKD9SaQWyj/If+wfar9nyqdmp4+2/5JteUMAMhWnhklRy31s6oI?=
 =?us-ascii?Q?fbb7XZkbf3O2IPLJDucyw27lxbbuc4RTwaJgX8Ws9q/qcHfylrWQfbRBTou+?=
 =?us-ascii?Q?XCd0u+h4tWA5ByaLTJG2DubLr9mk6+19LqA+rFz8dSgkvwp3a13dACH6D1R+?=
 =?us-ascii?Q?h7zDRJvA19WxvV7EGOPWyckKhoKSjMrntPP4fvI2BG1Drpd1Fz/a0c1h8rir?=
 =?us-ascii?Q?WYXraHhA5AlTYfc0TJL4gucYw/XwFwAz2uVoehrxYOcgndJi8Nn8/v24tr5S?=
 =?us-ascii?Q?76DdZMu35CvF0bMGJw4LqQHKZ1OQUFDaHqAgCSI8yk2ooXvXT5NjRR8rzJmB?=
 =?us-ascii?Q?aZaUrsRgCYBGUPSlEKRzWLODi1zcvMlXTpXPTYh1Su3LjM+XtYm88sROtHs/?=
 =?us-ascii?Q?82xr1sybq/EFUidl3UzJ5bc+RCESaMPw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Qm2MACwhp/v3ZY0VhEK7np36gj7pmewM+2iS0RANK1qWY4xASZxiP9csMjZ?=
 =?us-ascii?Q?CJA6d5q+UcJTryYNyZXRT/B9yL1JJAV6uDrp+IXBDU9QQzBo3HfqNA5qU5xI?=
 =?us-ascii?Q?A/oxGYVQ8D2pK8kVZdGZkdk56m3IsoNM+IIOQSkpmeoYCqJUCRBVSAndf8Xh?=
 =?us-ascii?Q?6KBC4iMyq3IgaeNpVX4gXaN4yyuE1DpwRlmoGjYD5uYRJY0btGGlyMD3U+/V?=
 =?us-ascii?Q?v8q7NTNKXDR0sea1rRiS60QHl94Nl/49+ETU1hXX4rFTpzSrcGT1RJt7K1bA?=
 =?us-ascii?Q?9h0iV1v5JC8BP3eAiu8hrSnld1sDa4ez4RbKBiqMLXG7bxE/1N2XDRAy3K0h?=
 =?us-ascii?Q?PcJ7Rx/sIMmmv/qK0HI99QAwt0cYOP92FPBgbaomgUR+/MzoqvK1DQUAXRHB?=
 =?us-ascii?Q?7GCQSyKT0bdSj9ldPWSwUqp6IjfExEv0H0IqaSSmKSdH84rFhT2vKQ7k5sfy?=
 =?us-ascii?Q?rn9XVix2JEoCzn07r/Jg46yo9qAGTfz2yKAcm9syupEUmCkjspmmZSMWj8a7?=
 =?us-ascii?Q?tof+SviDCOZky3hq3gHHWe2kK6hrdddxP3+4CpoOfFJhi47Klcctv4rLcKjT?=
 =?us-ascii?Q?OOT++deawjf0brXGCvUwlZ0iOPp8Xx3YTi91aa2xBRVDnz5saW83rPnwUDNZ?=
 =?us-ascii?Q?9fU0/dCopztWClS55V54behgDrqSr3g/XOYK+8wclys+CIPZ+LuTzYGkEhUk?=
 =?us-ascii?Q?CoTfrHN8FlgJ3Ey1+3Sq8GPIv/SmhtDGz+er+GPmeplPGChM7vIxiAv/0Usp?=
 =?us-ascii?Q?KmajtWb7z5Xs4MPbK92rx7XGVwBKAJzoCLZkkwylBNtcmJdTJymw7vVJTIT+?=
 =?us-ascii?Q?b3kUpXniv+yChOsEdpasjUu0ms7FCNoAnqWD182FHMNOgqFxjkugi7y5XAs7?=
 =?us-ascii?Q?DITMuDTv8GB7IaJqvbp5O2/e7OFnpP8Krv8es1myydD7Ey9gq89U7a0N09Qb?=
 =?us-ascii?Q?LNCsntoyzkaaw115M8WR5Dqd4d48JGBWYG+EBkPQFKECqRr3hJXfZbGSb/jQ?=
 =?us-ascii?Q?jBRT1UvRDqwtls8DoHUSzM4cq1GjFpk4UH2FjgYKMdX1UQP+sQbcS51OeSeK?=
 =?us-ascii?Q?pwtiVciqvHDdGdppfOXGxqIqs/uMI0ZG5DRpUxefS0SK6wNUeedHwKh1aoUy?=
 =?us-ascii?Q?H75qDM8MNhESdf7BxVySpl/EfElEgsXW0DQ3ngK9O+exWJHgXc5Mpxs85iJW?=
 =?us-ascii?Q?voy9+lGUxLejiT1Ou8TQh14A47k/yJRHvoDJUY4V85fltTIrqHUcHnZj3lC9?=
 =?us-ascii?Q?HbVxRXOjPpHop4Tk3xNoPlBNQPY7Z27IeS3+yeOeULscYcN8/4GW169OCSE+?=
 =?us-ascii?Q?StL57ocAMm0zJfPc4o4GHg8i8jSUC0nelTc6f+gxGK/dd4DaIpneWSKzzvv2?=
 =?us-ascii?Q?kK6cXK5K7TF7wBeb30043gbUX0WqaUUSSI5l1biPS6k9kIugx13iIRXZGeb6?=
 =?us-ascii?Q?Tneam3dgbq0AeiiVcZZa7PELdvN1bEJo5oC4zOl768lf+EYqOtq99wIj+Ys9?=
 =?us-ascii?Q?nx2tVToovNNNrq4vvL9ErE2pstyB6QQJ+uPRKFyKVIkR7JQr3YlqgO5i0G1r?=
 =?us-ascii?Q?GdUQxPleKzENzYyFMzg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b812d0-e6f2-48d8-8541-08dd5c722fb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 05:46:05.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rDq2qZLqgelZOi6y/zpZJI/1vpzze0QcYjh5RafyrqhLHpDLxDbY+PmkeQrdkTc4/L/e5ClhsV1xwwMd8URypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, March 3, 2025 1:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset
> before retraining
>=20
> Retraining can be done on enabled output.
> Fix test to do modeset before retraining.
>=20
> v2: remove redundant modeset (Jeevan)
>=20
> Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index f00376614..e218c9839 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>=20
>  	igt_display_reset(&data->display);
>  	igt_reset_link_params(data->drm_fd, data->output);
> +	do_modeset(data, mst);
>=20
>  	/* Retrain at default/driver parameters */
>  	igt_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT); @@ -240,7 +241,6 @@ static bool
> run_link_rate_test(data_t *data, bool mst, bool uhbr)
>  						   igt_get_dp_pending_retrain,
>  						   1.0, 20.0), 0);
>  	assert_link_status_good(data, mst);
> -	do_modeset(data, mst);
>=20
>  	/* FIXME : Driver may lie max link rate or max lane count */
>  	/* Read max_link_rate and max_lane_count */
> --
> 2.43.0

