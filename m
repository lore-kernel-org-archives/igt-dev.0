Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE083109B47A
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6236B10E393;
	Tue, 31 Mar 2026 14:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDkb1HBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08B10E393
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774967480; x=1806503480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5dzxlFXju1OqfeAmo0bue1UMIhoAcGabEEw89jjTPOk=;
 b=eDkb1HBgcgwMw2ZIOyU19N3FlhWQrNq2r4+SZomWMS3orMDvDFR8ALxQ
 76YsGmRAEl/ivhuMMFSxNj+L2ZpgtVJTAl87siiNVCuT00VnwCsUod27G
 3H2i66KuVp6ZBsDn9Va4ZtznNSHVgdwn2YvzNl+ggXUL2gLzk/Y/cI28c
 DC8NhUGaHhIeeJUXNYDuurS6lkANfRZxUSXByRBAW+1Liy8yxo7nWTKfJ
 2CbOFyPvltanxknDeiY935HW7SwJ7farNu37c8dJH68uPqaripPa1e2nE
 1gTtdcbd7oRZp2/F7lNqi4ouDeKjvXUPKKMxSChj7uluwFjEg//wXkD4m Q==;
X-CSE-ConnectionGUID: E2In7AvTQ/mb367vCzVSww==
X-CSE-MsgGUID: 2UQF8GI0SMuxkluRaqxLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75868315"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75868315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:31:20 -0700
X-CSE-ConnectionGUID: V7glWzE+QxOmzw/JVGfkNg==
X-CSE-MsgGUID: RWdL457BQLaq3WS8U4HL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="249594661"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:31:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:31:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 07:31:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWOGTHHa3GiFbijZKd6XVOoIjptVTju/0kb5uO1wu+MR1hlERH55GAirt7sTy6ovpMeZjj+9e91+XBqGQEWGDxnJnwbOjPvfhlx+ypYw0hDC9TXcwWYTnwDtcaekFLsvih67xYueoIquC6uWfGWGytDqB+rxEM7P5J3JpNSFaCnykz5uxGLkFYX5J0nZefudIM1OeKN6szp6LZ/vDJTaW4x+8773DsMFaVfb7I5WVC9aGIloVY8ILQ41uiPknNdqY3QJm6aBImIRVipeRI1vGAe8rsw0uAlLBINhasgAXs7V0scE8cVl3nBS1w3NXRo9Nq8/K5eqrtPQH7l7hBprmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLIoM2P0KXJ+MXZpzP74D6FUPwYn2ohJUt34EnoKZcg=;
 b=aaIRsBFZBGkb34ZMa+Wrh/7X5ogyL/J6qFJqbAWb70xEZEbvByUYNEDEN0lhd613w6YFFSv72NFGWekGY+fS8Qj05fXNArdAa5+XRsfvzoDBWewM+XxbdMxuvvcZMBdpfGJ5061Rf9B6aNHGoNaFhD7pOz9PojEPNVIEXa59+wlDeX78vK8c2tB7s7PxKTi0CiIzzipWBw0uKEvNtZp7UyHYja1hbFzwtdKdmiLs3L9BQqCp508LAHqJFG+sFmXCVXDW9Q3iAvDPUidBxl+15ytvuTVlI9+mfJWX3/sjQ7UdKoHG2pWwQIQPmymWbzbpbYQarZbfA7zD89nTrk+EwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 14:31:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 14:31:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: RE: [PATCH v7 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
Thread-Topic: [PATCH v7 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
Thread-Index: AQHcvJ14qu3n+2ei4kS3BJDeFy1eTLXIvHLA
Date: Tue, 31 Mar 2026 14:31:13 +0000
Message-ID: <CH0PR11MB54444CF33F17502B193F6A30E553A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-7-jonathan.cavitt@intel.com>
In-Reply-To: <20260325212208.85743-7-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6564:EE_
x-ms-office365-filtering-correlation-id: 77fcb768-6155-4bee-655b-08de8f3228f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: ocG72XsphfwMM43XbNK5mmEFPIET1URu10JikKnP/S4GMshaVucO2uGxoLUqRN5KH/whb/QO+fMQilNQpeHyTj9PZHvFvxziu9bP04h2JDcOY44jBSqraBSpZzRqltscKOQHXyRp1peGA6P6nWsLKlMtQHg4uR2A4BWBYWLzq5R/Lsw3Q388xd2QVOA0CgsTeZV4OgiJCJczB7i1pg3lmC9EHpxCZLr9+R6OCDe6Jqg/XW0Y0Y4uV//vNq01EhLAybXrXGT8FM7y/v4SjZJdOZkdDIgCDU1blsijphQCM4ZNOpaW0yE5C+y5o4uVuIyMu2p19VIk1Edj+bTT1rm4P/rc1trOsvn785DRtLzfcAT9K/78fY7R9MwRYliZrdDZipaMef489oXlFJuX9barlzTexnBcRhhqi7RxaK6XQaEWM3Zb7+TaV5yOl4ZvWqKqeDSzgBM//sfdzCRBcF8Pi0DWgRwlw4hESKAHRg7Pp8TDap8R9g2SgXDn9Oj3VrnT0ibkzBmCUZ9SE9WHxxiBBhBWtXYnqimpVgOEOuYqEw1xMvH1ezbikpK9ximW1doj9lIZgXq9lEP6iKMxSCGMGaQiDFCjwlNKGbhEGkkDdcHh/UbMsDOZkD2uf6NI48wpkZIOELIRKkRH2WM25DucbhHJQBGGlY/jppbSwuLXBgQqa6D5NVTfngpYbq9R4JmoR609IE2gwBIjKm4VWMMSahLIw04kdid2GbOkgeGdi3o6HRdZssISrhsF0IDvo25VJEYCTXdV057KoDj119M/kvZuRYAGvYlRiwH5PJmoA9w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wIgu6yCaa1mhVTbuR+pq4fOrBtWv6/bhsYMUSAQC5fbPYOaG4pvbptzmKsC7?=
 =?us-ascii?Q?EtW3/NwoRAFgeiRXIDO4PcJ6hIWcI/CHlSS5gcQuq/uAVfeMuDrmg0hau7X4?=
 =?us-ascii?Q?mjtzUHlQPIwCIC00b6Z1oNmWNHnNw38WobBYQnTlxMB+0eI0uQiTDHF0nDkJ?=
 =?us-ascii?Q?QbO0lFq0wsN7Z+EzxRicLepHHkY7ib+RJG9lioaTrW9Mx2HW1GqVgrBJzbRZ?=
 =?us-ascii?Q?Dbr8BY6pw6eE3NsN5CZXzajAPG4yhrJnS8359kxRlnAbdZjslkoJm9TQyXBX?=
 =?us-ascii?Q?1hEOuMktyX/kOr0lPmNSCWK9Uxsk32wjq+ChTCNLUI3mgrt8w1IAQP1zvLzX?=
 =?us-ascii?Q?1P1+BmcdRHUfaI+bWSNjD65GAS41ZurmCceDLqWbZHr/OCXJDHp8t+FMmyHa?=
 =?us-ascii?Q?K4NEMQpNHn0RCrX4gj3sTjC4RmLaBQ54VVuM/E22zOHO9ciSCR3PzzBQzNMj?=
 =?us-ascii?Q?KYx0rtbyuimKIEFk2Yc8/UaeyKjQTliFEyqIEunlW0O2P+R885HqwA/34vLg?=
 =?us-ascii?Q?+KKfbER5sK0XupoxWhgiN5CBx21xqNkEyWo26DNDpv1L2owrojoUW8c9zMpk?=
 =?us-ascii?Q?dCZn5J64V0rhY2i4p6fF6FTExyz/DZajutR3AkezqNEQYqKn7iSAJjyZg9Bm?=
 =?us-ascii?Q?AvUrectSQLdelBdm1S1VJJRw/cskFv3bvdE2cXAs+dq3IuRyE+5C/TO9rrc9?=
 =?us-ascii?Q?/suMMTBvwWJSRnkqTJ0aAG64BnzT3u2YM0AcDevOT/h64+9rinf3fyW+llFM?=
 =?us-ascii?Q?OW7643/wa+sS03Am8N7XPBGr82npYidL8ZdEejsISSTlbUqQWzIGQ0H6RfxB?=
 =?us-ascii?Q?AbpN4MW9jAoXb9zPlkqDC1M52/DpxSYNFwiZyonYrWJHJRDuLoBy8+6nt88m?=
 =?us-ascii?Q?WFz6GdwUCp4YMEGsY+CSBFM/MlD1pp6tyjtLLofkee25wsolPZAp8D2nvXqQ?=
 =?us-ascii?Q?SfN1IHxj4HBO5RKz8FMGoyIloSSXI/VTxOLeka9rn7XTLH41HkbLdVwDLUND?=
 =?us-ascii?Q?FLdlC4J7x3Dy75J6LWhU/nS1tLmhzQABwRMXnvBXrjcJUUIfW4+/VKGrM5PI?=
 =?us-ascii?Q?iZ/2LSe/2ENPWC6hONlAhh5F1Hey6u7veEpc257STHNkJ2XmwisewRWGiFfV?=
 =?us-ascii?Q?iP4VcCzWfmTYJeO+LAKugdVC5UzzCe03F55fYSsmuHq10jQAhGtVNs74D0h6?=
 =?us-ascii?Q?BzRzMWCLRK2w1LNS6y82jZH8SZDOASD4+I4LviFd6WZsfkDhFNTM9r1Pgfwf?=
 =?us-ascii?Q?7FqEONxQ+xAtDEj9PPtEiIBoWxuVZZwX2t30nAVmlQZ15doaeMIj7g6XexFy?=
 =?us-ascii?Q?VWauOHxoZOko6NQ2QrvSk84WZ+oRTwfdj4D6iE6RUTWukmXa3cS+vKQHVFFq?=
 =?us-ascii?Q?IU2nd6Mn1bOIsKf7BbqfFLdSXqilHs51mWwM4CEEJ0QtZjwyuxBu60B5ukRX?=
 =?us-ascii?Q?oCvlEzd5ooD0w1szYmMBJs6sTZyyeHv28ehLTRRJ4upUb15xRE89gOxNfoxX?=
 =?us-ascii?Q?GbsNGyBv8FhyHsCKxcyH0sPBdtwEd7wr42BSZAUbL3JpRn0P1lXLUD9n9IS4?=
 =?us-ascii?Q?+t3+1wjIN6D0VWf1k9fYS86AGNzX2lTbbSDADMML8yIuJk8si4LSbPDLeIyu?=
 =?us-ascii?Q?knLQp4RLtz4/8lyy1W/rPrx0GDwvjVajtnCDGxundFIF3N7006ejoLmLqsor?=
 =?us-ascii?Q?LzFh/h0BSjMCf6BB9fXIFtz4DX6xqmQ9t3wEIyfNMxv5LSSZwu7mexUbmTiN?=
 =?us-ascii?Q?ZuI1ExX6lJ+JoDNtS81eby8IU2pFxnU+wp20cZzLUjrUup1K+nAMJo4Hhdb0?=
x-ms-exchange-antispam-messagedata-1: D37hWJcwhThAHw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HyepKUaK6UEk0e4llIBTw/eVB5fOgvgu+eB14Yrq7rcXo4mmQNrvQKWl4TJOlqqjj6JoY1qLINy6T7t70+sP0BVOF47v5uuTE2KLCxAPYM797cDuz2JniReQT+YZIosIAFeEnDvzpPHZMpqMO2KVTo/OcFG935ByWRlY7yKd7UF6u9W2r0I0z382fzVt6Tw/BMIrfs7c5QxZ5InUxACyOqheR+AZNuUEMn299SjJdtIGCy8bAhcBuS06gYX3J6pBOrtLrDydZgYbrEYPHvdz5NbkihhS1nALqq1/9MvqSIKuSNR3GtwUA/ZTmVc8THmohXeA9JlWvTUVoblIMIVVLQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fcb768-6155-4bee-655b-08de8f3228f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 14:31:13.0636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtjpfpHvsOaqwzGrlH6vS4P9g+JCWDGvDPdn6W36Et7dNJ9wtiefvMBMtA8jp+c+B7JfguJd5QaNTqO3FtnRrF+tilw65oGywLBVuW3icmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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

Forwarding to Nishit Sharma for review.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Wednesday, March 25, 2026 2:22 PM
To: igt-dev@lists.freedesktop.org
Cc: Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.=
zhang@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Lin, Shuichen=
g <shuicheng.lin@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
Subject: [PATCH v7 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
>=20
> Align with 20250403173614.67195-4-jonathan.cavitt@intel.com
>=20
> Add initial declarations for the xe_vm_get_property_ioctl call, including
> necessary structures and IOCTL macros.
>=20
> v2:
> - Remove engine class and instance (Ivan)
>=20
> v3:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>   Ivan)
>=20
> v4:
> - Rebase (jcavitt)
>=20
> v5:
> - Clarify canonicity of fault address
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a682..f5de148257 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -83,6 +83,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
>   *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>   */
> =20
>  /*
> @@ -107,6 +108,7 @@ extern "C" {
>  #define DRM_XE_MADVISE			0x0c
>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>  #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> +#define DRM_XE_VM_GET_PROPERTY		0x0f
> =20
>  /* Must be kept compact -- no holes */
> =20
> @@ -125,6 +127,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE=
, struct drm_xe_madvise)
>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE=
_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
> =20
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1249,6 +1252,89 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
> =20
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FA=
ULTS */
> +struct xe_vm_fault {
> +	/** @address: Canonical address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +#define FAULT_ACCESS_TYPE_READ		0
> +#define FAULT_ACCESS_TYPE_WRITE		1
> +#define FAULT_ACCESS_TYPE_ATOMIC	2
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +#define FAULT_TYPE_NOT_PRESENT		0
> +#define FAULT_TYPE_WRITE_ACCESS		1
> +#define FAULT_TYPE_ATOMIC_ACCESS	2
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +#define FAULT_LEVEL_PTE		0
> +#define FAULT_LEVEL_PDE		1
> +#define FAULT_LEVEL_PDP		2
> +#define FAULT_LEVEL_PML4	3
> +#define FAULT_LEVEL_PML5	4
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERT=
Y
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PR=
OPERTY_*,
> + * and sets the values in the vm_id and property members, respectively. =
 This
> + * determines both the VM to get the property of, as well as the propert=
y to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for t=
he
> + * requested property.  The user is expected here to allocate memory for=
 the
> + * property structure and to provide a pointer to the allocated memory u=
sing the
> + * data member.  For some properties, this may be zero, in which case, t=
he
> + * value of the property will be saved to the value member and size will=
 remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requeste=
d
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from =
the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, s=
uch as
> + * providing an invalid size for the given property or if the property d=
ata
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS           0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_C=
REATE
>   *
> --=20
> 2.43.0
>=20
>=20
