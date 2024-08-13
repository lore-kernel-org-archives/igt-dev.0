Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2932AC52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 09:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB67710E2CD;
	Tue, 13 Aug 2024 09:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFkgB9tj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A341110E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723540921; x=1755076921;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NA7PcQTw6X5lWzPD+9AylxR8Qg98f6t5/shPF3ool40=;
 b=jFkgB9tj5M0YeUgDbdeqeqHSWpuhiJ8ite6Ucd2HGd1xF9RBgUZfbL+2
 oOB5fxyeK9LC+buz7gTJwTakBSNZ1NqjcNuy45N8CDp8sscvrVp86qopY
 kWq7tCNd29KwzTyHqsmlUfPg04qUcq/CGqBFfoJIc2IbHHp5DBX0duvGe
 p9yrr608rI+GG6hK3zK1Ex885zwnXyOsHv1wihJv+xXTmxyuwUQg7U2tj
 ARVOYyQChMeDO45OeOl9hXhxpdu9wRjQKhbZ+4qC4VGETFZZ3D6grx5Gf
 OhpadsLK2BCsY3ZzO3q3aKn3vqqZTfphoriIlhpavbW7YysB54Sk/06a2 A==;
X-CSE-ConnectionGUID: YbW2gcQETtqizc3xLPsWuw==
X-CSE-MsgGUID: d9bQss1VQfO60GdfOvKlbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21664487"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21664487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:22:01 -0700
X-CSE-ConnectionGUID: ciODszrKQaCPYS3ruGw8tg==
X-CSE-MsgGUID: 91x+Pq6TTp2cKo/+LZtPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58290700"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 02:22:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 02:21:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 02:21:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 02:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwyN46qY6609gDCzE4m+bxVri0rHipQo/e2wHu54OY2xRUzbe7y7wY1os7s3++KlTPTIIjiEYtCR88TDBK/PWxay+EBtyKZ57iSl4em+QvxCjf/KWmdIUnCOEVAzGDzN+quA7QDzHI3XRs8GvNa2a/8bMFlL5kTFQ7N/zz14GBeMmPxdf8NKRRJ+G7F1N1CYEyvnwVhSuWvPTCp7rT8ss8KS143XqM74KhikLpTaYBg6alEiBxKgps742xc8LW+ZtCoYdWuodIePoT3GptfSbEtlfHW+twpx2spa8KEboDNJAsIgvg/3AwrRzc3T5Oq+Fm5Elnm4R7qViuAUQuM6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMa/Q5NjneJHrEphj6cZTNorcNt+vzD5qpZXrBEvSL8=;
 b=cuQ5xRmkZ6KnNYeG+vqJm+Gv5TTo+FZvBCp0FiA4zOmdv4ue3jLBI93K4CdngGaqMXimdJzDl7cSPJ8sfXSPcdh1H/HiUK+8JVEZq3ixmQffoRK0v34jIU05B3sbB80T/l/R4pO2ubyvRlToOcX1nOmVuGRl8fG8JCklBN0qrFoolt5qSXMB7REbN1neSgwpKmqBmA5ghG40DwHZ+oBWjrEjSXiHNfFx1FTOJYuyFDe32DaN3PH3cfhlvKbSRQv/dvxP1RDFt93yD114MJ9PnKuwMxlDfLmIV0mS6f87tw1zpDOHx695LUFDgcZz4qTatDlErJphRabnha3rRHeV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 09:21:56 +0000
Received: from MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430]) by MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430%6]) with mapi id 15.20.7828.030; Tue, 13 Aug 2024
 09:21:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4 1/4] tests/intel/kms_pm_dc: Update VRR handling
 and eDP output check
Thread-Topic: [PATCH i-g-t v4 1/4] tests/intel/kms_pm_dc: Update VRR handling
 and eDP output check
Thread-Index: AQHa7CmyTVC72gdrXEugRbS+q5r1tLIk64mA
Date: Tue, 13 Aug 2024 09:21:55 +0000
Message-ID: <MW4PR11MB6761D96F6DB05E33E80E2902E3862@MW4PR11MB6761.namprd11.prod.outlook.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
 <20240811200359.1086166-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240811200359.1086166-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6761:EE_|SA2PR11MB5194:EE_
x-ms-office365-filtering-correlation-id: e5100c21-f53c-4f7c-a3cd-08dcbb79603e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OXyB9szF2KAjXIG82I5v1IY8Uxvs4ivThZarqI6zWgZSbigr2bsVbtHuLUOv?=
 =?us-ascii?Q?RtR6nLQUdaYPWxcZvBFIRua+cQNltM9UFLpYCDOUTyipvb8F7AVjFRmSE8yo?=
 =?us-ascii?Q?Y9UVRDBx8J/Knz1KuNXRcjNhmhDF2wx3eXS33toSDV+IiQEd65FCw/cTzvxy?=
 =?us-ascii?Q?01OZ+KINn1bEIaXeRC6g7lRa7V024glqEqQVyxV4BgujYM56rb7Cz/iK4fsI?=
 =?us-ascii?Q?FWC8vT3IkOmFVrJ2ghH6OOQ2RZHpriego//X0qbpGs9bHdkJgrlasDR5DuZh?=
 =?us-ascii?Q?bMMwiqhF+PNpq2UmRCl5FwEUU7K0jQqQZa/rgFyyJyMCBYN/ylNjtwvxpAg+?=
 =?us-ascii?Q?w/8Gw6MuNXABUv7JTN0D8jyrmZWvOrEIu6QIYfxt8/9K7JlN14A6I7kM82Eb?=
 =?us-ascii?Q?pQYYkhfkZMesuzFXA6+YXn/tuNKHHP8JJDrnyYaWKkQDf+DkFX+ZF7wfDQmQ?=
 =?us-ascii?Q?8woGnp+FI1Fm49uz34oXxuUxnk/BwrLdFl6uInA5agMeH7HTYqAjgX8i7Ncc?=
 =?us-ascii?Q?LRE567a/3wSXpV7RCX4Z5bxY0cvQtTgxDjvFBWfLcee+ph17teOfn67LDSZH?=
 =?us-ascii?Q?RzU7mzhZSq5lHZDE7ikUVM85lSa0XzJwtKxPdTYkxie+yDOZ5danC7bJAXAA?=
 =?us-ascii?Q?9EzEWQkJS50nIjjjnEWx95NgUpHlAagVTw6sCpIe/572LQx9OgO0jCZcAp5G?=
 =?us-ascii?Q?Nq6TEAxd7NWywRe55z064FQdr0sh4QbPFhuLeG/IAUk7AZH8PcXDLnn0PvYP?=
 =?us-ascii?Q?yXGMnoMw7iU06ypqr+Qr78QA8/uxLOHSuJZ7B1CZlLzczSbkUVQxhabwOoM2?=
 =?us-ascii?Q?x2kPO5hqZNMhMLgsVAt2ziKsKApleZgDvPsbeJ8/k2xQwQJEOltHv38hSwaD?=
 =?us-ascii?Q?Lia0+haF301nfepKCbG+AOzbqCPQdolO0tBxWGh118fCFPI747i71w9zmRz4?=
 =?us-ascii?Q?Y2nS/4GONuMg9dUECs6ifjypj75BWiWHnzihGi9tuySpYFqqvyO7HaN8K8sy?=
 =?us-ascii?Q?aIObZO9Gf0CsRwUHwraXKdzxADvAvLW5acYofkVEWiFQBv78IwgxDz5I3Xy3?=
 =?us-ascii?Q?TA36RQnS3iszi1npUR8gAJvPmPQVOxpc0IVl8VzYOk4UfGz//MausG8qUX1u?=
 =?us-ascii?Q?vCdTGjGVymyX5VkbCmTCYQwXWwdLPsK3MYHPKjHiZYmVV9AwY/G2xX++0erv?=
 =?us-ascii?Q?8sLA8pql2i+aXSq9HldRNwljkEtj78NdgS3D2QEPF3bJZacCdqPqhPVsuzHF?=
 =?us-ascii?Q?657iMGDGzW2NL4o0RwzLdY5NSn5IUe+zJ6bJk8LkrTvHEgPJEBFq2douEYOR?=
 =?us-ascii?Q?PgSznQQfCOv1da6Gcl9GN3shxwLmDgDG9EszvotVjhCucRB50WDuIQqSjYnQ?=
 =?us-ascii?Q?SEH5vQ9CRxVmmuUSLXkRl1u8xMW4T6M6rPTw1cMN5/rMfpZg2g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6761.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IO9a4QizDu27IVJWL2+1N3iIn4Ze66dROaY4sE1Ig04bXTk/Q7M7IejR9b4W?=
 =?us-ascii?Q?9KV/6IjbrcrT1E0sGZeXYhWd1LaOn8irpyFS44Smg13fdniddPSDRkD7XZkW?=
 =?us-ascii?Q?kAJUnYJz7hE01nPJO0OQJw3gSDGAIIWfXrYdrXZKAsOECDjgPL1dcoyM2C5n?=
 =?us-ascii?Q?KvZyoa9Uj/U4Do5+b0HXomQshx20vexWz/Tfvz3RA+Fom1hxwd8YbYDwMwCG?=
 =?us-ascii?Q?Ce5DrjsZLXvG/TQvWyhxz33oQO20K7mlgb4cJzxiZQW5cIMXP29qAnkQ1qNU?=
 =?us-ascii?Q?3ZEL0HXu7l1FEk+x+vfSM7v4elbMUTjbuhIR0W7irNfbcFCNU7H4o0O1YK1N?=
 =?us-ascii?Q?84EGUHIh0uEPpFvnk9P0m/S7Wo2Q2L7o7fRoMjS89+Zt6mbEsRNsQO2LcxCE?=
 =?us-ascii?Q?//ebrYVPRuRtqtmC3UoozlgqNbNQ3EjR+Oi++Lr7iTEoEtJrcQrRZUopRdBz?=
 =?us-ascii?Q?lPQQ85JamszczEID2lH4S9gHYYwnwXarsTezVG6NctKEaLxvO7ls8JF/Fex+?=
 =?us-ascii?Q?vBSjHMqQF5Js1aS74eomfYSHILOzmzi1vVx4b1FpZCoeJ9jgShafWVGcOi9S?=
 =?us-ascii?Q?M3VRnbir9V8fEmKdVnvmkk5RVCy/izZ30os09un74ZzLN6x1O1oOhYmvb+KC?=
 =?us-ascii?Q?eTwwM7+fn+E4NF5tW/5NzRIXmVcobt4OqpVu2D57zBg6YanR+ajOOcZtzayN?=
 =?us-ascii?Q?OxXfQnnqei9+A+91eqqkvUe5uNsIIaBUf+QvEru4k+Hz4qpoXuoe4Ha5hOce?=
 =?us-ascii?Q?Oq+xqynEBnZjZZCCqA5yNGvV+ammSNLevnXY5nzSnXdpLiAk18wMqdnRvYeI?=
 =?us-ascii?Q?jQopmemCAhif+XF6q2X6bHUqWcZzs3yI4pdOif1vOvlTnHVCL4bqoy5dGXDQ?=
 =?us-ascii?Q?qnCC3gnpn/5pRnnMHzfkdm4wOtA6NQisbDcqc5j3C3Ozh+FltMjRCV3t7nGo?=
 =?us-ascii?Q?kaSoqGsayIe5ll0iiiuNFoljlefzsp5wBRLFKhHDtovIZ/03ZDH1PwxLDK2v?=
 =?us-ascii?Q?Q5cfuVug4DDNeMEGHFxpNIofEL7fGtCVtpAn6FZ/y6W+Nh1vI+mg04i4AViY?=
 =?us-ascii?Q?yEqEyQKeupxVHHsWgICJhdgqafYBfArf0pwdJ0Ous8N2gyOJvF7R/C/zwjzz?=
 =?us-ascii?Q?WL0UNcjlqqChqtrDSM5SDEy5sSVjKbueGaTkdNy+KiN++f7/KsEeCLxet79N?=
 =?us-ascii?Q?MiRTz3zK9OIgyQiv6qW1LN5IJ3FtlhRqgN6vRBv94lInNKhZx7steGRBLpZS?=
 =?us-ascii?Q?CqOqidfNVI7+Pm4Qi7REgrmHxfR/M9lAj7iXfIVJxy4dmf/YqyEgFf6yMXvs?=
 =?us-ascii?Q?ccOYldsCB+dPM4qmJKsQtMg353Zs9XA9kh+pLARj71sfWlxpKhAeyUbWgTYM?=
 =?us-ascii?Q?hS6zwQJoRBQMqdmDQlmY7njCXyFh46OkTpQvbIjAvhpmXx83fVMseaK7Bllq?=
 =?us-ascii?Q?Zg/bH9cd33YuQs+cUi1/dEb8qImA45KRBYHF46N1nhWTLecb2dvCYOO2+Z3Z?=
 =?us-ascii?Q?HrYCS+yed5o/AUZ2lc7YQ0mxZ1eQttJU/qYWLPBnTnChxAADndYecJd2nIqb?=
 =?us-ascii?Q?P+XLQysMAYbfXZqNlJSkAVjUNVsQt4uq64p+UCTK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6761.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5100c21-f53c-4f7c-a3cd-08dcbb79603e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 09:21:55.9562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +thEafKbkPE3HDXBt2iiWSlI+BYU2XIxp6DdIZCAsgLBTKkdaIKgpDLa5ZLkEU2MN90FOhqbwMAApeYHGjD0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Monday, August 12, 2024 1:34 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan <jeevan.b@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 1/4] tests/intel/kms_pm_dc: Update VRR handling =
and
> eDP output check
>=20
> It should be enhance the test_deep_pkgc_state function to include the fol=
lowing
> changes:
> - Removed the unused variable `vrr_supported` to clean up the code.
> - Added a check for the eDP connector to ensure proper connector handling=
.
> - Updated VRR handling to disable VRR and commit atomic changes.
> - Modified the delay calculation for connector modes to ensure proper
>   vblank time.
> - Removed redundant VRR capability check and skip logic.
>=20
Please use imperative Remove the unused var etc.
Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> v2: Correct indentation and update comments. (Suraj, Jeevan)
> v3: Update Commit subject/message. (Kamil)
> v4: Update commit subject/message. (Suraj)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 1aef1e02d..367bf4303 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -594,36 +594,52 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t start =3D time(NULL), duration =3D 2, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool vrr_supported =3D false, flip =3D true;
> +	bool flip =3D true;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
> +
>  		/* Check VRR capabilities before setting up */
>  		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported =3D true;
> +			/*
> +			 * TODO: Add check for vmin =3D vmax =3D flipline if VRR
> enabled.
> +			 * KMD patches still under review. Need to wait till KMD
> +			 * patches merge.
> +			 */
> +			igt_pipe_set_prop_value(display, pipe,
> +						IGT_CRTC_VRR_ENABLED,
> false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +
> DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								 NULL) =3D=3D 0);
>  			break;
>  		}
>  	}
>=20
> -	/* Skip the test if no VRR capable output is found */
> -	igt_skip_on_f(!vrr_supported,
> -		      "No VRR capable output found, skipping the test.\n");
> -
>  	igt_display_reset(display);
> -
>  	igt_output_set_pipe(output, pipe);
>=20
> +	for_each_connector_mode(output) {
> +		data->mode =3D &output->config.connector->modes[j__];
> +		delay =3D 1 * (MSECS / (data->mode->vrefresh));
> +		/*
> +		 * Should be 5ms vblank time required to program higher
> +		 * watermark levels
> +		 */
> +		if (delay >=3D (5 * MSECS))
> +			break;
> +	}
> +
>  	data->output =3D output;
> -	data->mode =3D igt_output_get_mode(output);
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
>=20
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> --
> 2.43.0

