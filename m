Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E4C19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 05:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C80910EC02;
	Fri, 28 Feb 2025 05:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLjDwExE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C753C10EC00
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 05:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740719869; x=1772255869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ETQ2KzxNZyPLhPFTzondDFtNzfOtG4lBUijmjlPw/kA=;
 b=ZLjDwExEOaF8ROEGN7DCuOZJoyLa9THOzMvYX5A8n1UOJ2RT3T1n/p9u
 KeNO6rGeXmTtXYAnlMJCctXiCFsmgmsRO90snI2ewnRFNKXmzRkqxk2uT
 4d69H5ZpZEmlQmuO0aS4NIYguV1u7TZZhVJuEOtXB6mSZxT6XuV54atfH
 CYAWuMnh5L30CApkKOe7zaRMB0W6yLw1klY2cqeJ+0/EOTwcGINDx25pX
 1G/5yhvsTwFYvOmXi7tJGyv7KrQh9OhqvsnISsURrMI+2KXaSN6Gk0kYl
 xWKzhhWNQ0rBb+tLUCriaJtfm+IKKKG0xM/eOWjTXxBVCuax9gmqrF61i w==;
X-CSE-ConnectionGUID: Eaz6g1NEQzierECoH9+Lzg==
X-CSE-MsgGUID: WGuK7yQOR8WM7dadHlH6sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="53029931"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="53029931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 21:17:48 -0800
X-CSE-ConnectionGUID: 6MqCMbx7Tder3LTfjsASxA==
X-CSE-MsgGUID: 0JizU3PzTLa4CO3UehxvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118166296"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 21:17:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 21:17:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 21:17:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 21:17:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSyM1LZAx6Qnu38Ll8A5pw5qzqN8eDbP7eWkNjGhY5X542jdr18QWg1QiXkgRotg1u0xzP9SERKStb8lR3N0XcR3Zjij7lZKinxsMQ478MjeC2l6703U2kk1ZMl7ivIHUN4qzpOsP/qMtnJ6ZaAuVBmPs1vqo4Re0DNrxUg08bHXNKri8Nbx/8cl5kho78pMUjg9wz/ahT8jy1nO9lA8NGKwbwJAghsp0s5c6tpVLfhFiQgBSqDI+J0up8JNiNi3rrdnuNyhSVMD2LIuapAw620ik8pWFJCj5ZKog2US3JY3e+A/DVfYIQtxpsOyEXcTZLZGJyrIGP1nEzbhZfzlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRr+5w0xCn14MElyBl0F+epzafUSVGAgGBaH6oHeROQ=;
 b=quJmTFbCaJA1i9Qyk6doXhYnO+rL1LbafelrJ5+617+Qfb3efCQG/pDvUKw/3r9Y3uyR9f32HCgyFA9SRLyN3Sr7Rh0Cb02m9/6UizHHwT2170gDXBauveX6to9tqDvkUxVK1PSI/i3ZImctgNBKIKmKJUIa15pnTqCcc+ofA4tepbuveakQ6xTMyTwW9PeYDqWEe1CxoIJpgOrx9BGKl8VrW869UtdEf5Uafer0c4+hjUl6HlMw7qul1L0Tbyc8CnExSzOjP+5RxXXVNI9fXsDbLS2idxPkr+3xz9PIKVS4Ng/iOPkhIjLaHh8fZoNtlh6r1OpGdHIlgp4h0hCTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 05:17:44 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 05:17:44 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_dp_link_training: fix assert
 for igt_find_all_mst_output_in_topology
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_dp_link_training: fix assert
 for igt_find_all_mst_output_in_topology
Thread-Index: AQHbiRFJ1bEMiukz10WnlwOuBKKlNbNcLe2Q
Date: Fri, 28 Feb 2025 05:17:44 +0000
Message-ID: <DM4PR11MB6312D47411C99B4BB11226DE90CC2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250227123039.2933330-1-kunal1.joshi@intel.com>
 <20250227123039.2933330-3-kunal1.joshi@intel.com>
In-Reply-To: <20250227123039.2933330-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: 634e73a6-6dd9-4890-e03c-08dd57b73b43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pNvZ7tnuCZ05wTMrU2PlL35CNkh0DZXzmcffKGfOZWh99hZrxKTPeMOapzSv?=
 =?us-ascii?Q?29b+64i2VmxkoWXIMbUXwvsbsD41pqi7pmakgTXi0KjD1JZ0vpbs+9q8t28Z?=
 =?us-ascii?Q?Ck7NFZZpSA96Q5W9sdhrqFOucTYnwiZIdXWcavi7LbTZKDANo+REtjteXTyu?=
 =?us-ascii?Q?xtmQUA6zx6z2bjiU1aMYHCnrJobnNmzThDnUg+Vz81r4YEjATKNzDbjpdhrQ?=
 =?us-ascii?Q?8i1hSioy/kIYJUzsgNTD1J1pbTx4wjbBroWqAbaGK5twDvVl2PPSHWnFPGq1?=
 =?us-ascii?Q?mYOPCAAGKE9QtYtSrBc5K4SMCbMYrRh2t2DzRCWG3RvfM4HHcQKL39aBSSXm?=
 =?us-ascii?Q?SNwKPHj1brZE9hnfiCyL9eZSQQv5vmqbryL1OleQ+SnVVCSvEkYdROG7AZ3s?=
 =?us-ascii?Q?vJjqG/V0T2jzEqDzUyF9xe+wwaQoJH4uVvFvFcWF/c8JNwwLIgZAg9tncuxB?=
 =?us-ascii?Q?if1ge8nS2H7ViTOYqzoz+2bT2jiG4E4ei8RxXcFij9jla6NF7SmPj6NFe84E?=
 =?us-ascii?Q?onRLjQpTZ7B/sas6YwYGW/8xOMKK/DF1VQRL7DOYRWHZI1L3WH6o5UdVUmw6?=
 =?us-ascii?Q?ulvez9IgrUG8PLGmTZq+zf0nrSLJqCAgAO+BbjujrxFBI4sPivI3KTWdSaNT?=
 =?us-ascii?Q?A444+R+DfomYm8MZ+SSPm3AK4s5/Mnd2FiI+9k/ZVdRQnrznTU7483pQXtNv?=
 =?us-ascii?Q?fcvdYZypFDTX/TFGKjs+UPzYs1t9VAHfF4Jjaz393fF3L4G8XdT8NR30B+Qv?=
 =?us-ascii?Q?0bjDjaKtCN+iyq+tbijPPN0KZB5O3hzEeltAZgI3l8WJ8fZQwDiaSnSADZVb?=
 =?us-ascii?Q?HMIE/08bJuKLiT9tvv/AAdf7D6L5MVprKCPoRYG23eAseON713rq/7x6VyCd?=
 =?us-ascii?Q?HhpzwZZ6D8LlbtWNil8pbJi97tQbaoYiad9t2XcwaM7J2nw8rNQzv+VZeoN+?=
 =?us-ascii?Q?gzDTk7VO7wE24BC1RRhCjMuuVndbQ9uCFIW+s5WwVRSAqgpso7IIWgDLp+ff?=
 =?us-ascii?Q?SViIQBJWt5/Q/53tn3noIjgji8obSWbhxfjU+WAM3s4yB7Z3ExTFBS7E9knK?=
 =?us-ascii?Q?hQD7379MwVxisTRUr82sCf5Y19uY9vZbcLlOQVdFTvVEb0qEUmHXStA6Oyp+?=
 =?us-ascii?Q?su4+lGODkOXQE/8JhKWGJVq3xEkyYBMMEzBsUl9G6A0Ou7BLBm4yCwCIp3nv?=
 =?us-ascii?Q?j80GqAiEbaFTInZmsAL2Iu0E/zt7T55Gjb5ezR87P5szDRITDBFHfmE++JpM?=
 =?us-ascii?Q?aUilnaEdZV299TlCPZMRNPcg5lcpGnjUUGDtS4HiPRfz2UGaqnBL/B4fsKFp?=
 =?us-ascii?Q?mKiqobv+NtYOJpplRVsW8OJQZzwZ60bF3sEl+SxOkqOYLtv9QBUZyifQPtaE?=
 =?us-ascii?Q?99tQ4wD9/kCyVfsBqUGi+osVei7NNcoa1Vw+KOQxEbU+KHvBR5KLhZncasOy?=
 =?us-ascii?Q?H+w2LD69XBF7UVfoWA65CFRG1D8FNDQw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HqMqHkWDU+CCrLjgmJpjmYBkiqqF5e3g250197wBn8xR8RCH60boiwFxeHw+?=
 =?us-ascii?Q?uoSeddQ8xO9SzmcD9mnJKEi+Q/OWxT3k7fVFLm8fPhlaLcXIMhLvX9vYQBOT?=
 =?us-ascii?Q?j9pSY65Mi+kpIuTnq/gppbL3X/v7keCHe1V/Leral2UcuAQD2XxGc9N6cZsF?=
 =?us-ascii?Q?1FBZrnINAygVcIZRqYNxSkWXnkOWj3NVnVSXx0enDNOvBNDlC2YscfGQcgWs?=
 =?us-ascii?Q?OKCAdPA8ITjJytP/y1x7h371OMEwuA3al5jLWmVpUR9ZMODkJKFq4z14D88X?=
 =?us-ascii?Q?W2cTXnW7iP5zTYv3eRVJH2azZzUMh26nf7PAFKVSnCeAEEqageBHxzpMAdat?=
 =?us-ascii?Q?dVU7XMWjCcN/Cb2gWJqZzweSsmjoiguS4b4K827uyZQGL/zZJApeTMxkUr6F?=
 =?us-ascii?Q?/Tn3X0jBpyTHRTr4LbPwhYtKNr+9ry33gIeog4tWiHkBATEBUedute+XidEI?=
 =?us-ascii?Q?QVvGKe+jlxG5ezEL/IjIgbjf8jYf2ryULi3I6CZ1iZjgW+qs/qjvq+hSSBzy?=
 =?us-ascii?Q?2cp+v0R+/9bfO4QpUH0WmnAHgUnSEgDb4heGx11koap2PhnHWlZxn7RIc9zr?=
 =?us-ascii?Q?QCrvKMXhTz1XMttl4U7nvK2KX+McEaXGS5Mzlymja7EEhJIP/p6k1x+huUZ7?=
 =?us-ascii?Q?yspvMi0f77QZ0EcpZid1J617/qGjMX99y8EbRCmCahS5ylpozwxuZQDaoM3V?=
 =?us-ascii?Q?Sxb7Jrfts3few8r3la9Gvefk73ugjT91+rnBJbBI6hVV5akCIbfarWffuFgw?=
 =?us-ascii?Q?0ENEjbylWKcuSoDzWKUW6SxwWwjFAOZ1PmYg/AQtgMEOuFwkCzqq3RqmU2nQ?=
 =?us-ascii?Q?pkFuRbb/ahc/NOLopV7shqHXYCzpf/14UHATErrodP5LRZ14QVA5ZpePFU9d?=
 =?us-ascii?Q?jhSeDA9CyseSREPMy+n08ufQLzgPcLPxOyhnQjkx+DFuhCl3ClVr+uIMWsLk?=
 =?us-ascii?Q?yoJQitKNEX+FioM9Guo/vAXsi3eG9G0rgZ/kc78jC18MLIPJ7+cGpCthQsV7?=
 =?us-ascii?Q?2Q5B4wTtjuADEaChiv1Mm9G16yxS5sPwyEtU1O8TxTQ1N1kuUXK/tvw4AQur?=
 =?us-ascii?Q?Vm4QyRqJny50Dius7CDgScZ3oJo1ny8x7bkEl3AZ0w9N+b6WL8L8V3ZPNBgF?=
 =?us-ascii?Q?WTaL9m3rO1L56eUOkkXfp4byk9WBn1jbMUX+P/wZdyAeV4ehfVREgEGeF84f?=
 =?us-ascii?Q?GkmwJkAd+/UTSWpwDePYrzDDm9jejFeFELBhzXuDk6iD8cPhPBsYXYSTbBk/?=
 =?us-ascii?Q?nX7zg6JPgTx+2ywg4f0oHkbA2V/6reP51w7vnWAjN6IjFdEEx/mJaXIIwrq0?=
 =?us-ascii?Q?Co0ZARYQPVODeGzan+Qgk+QIXp/P3lSJyY79Yo05kmvGdfE1rADy3wkPSAgK?=
 =?us-ascii?Q?J8LyYQOWU08zdErok0gkisKe4YtkOqBtewDA6DFZqwfuV0mNvu54L8FFJAJ1?=
 =?us-ascii?Q?tOyJUBJvKpTFxpN88ilNikR9GnTO8ComVHe+Vb6kc9Lz3qA4dF/VRDDsm9wx?=
 =?us-ascii?Q?nGGalIQW6k2NxMVk12t6hj5DIYkavGuFOBp8cAPcwXE8QFBv+I2wCAOu6B6e?=
 =?us-ascii?Q?FTqgxt6tCiXWZDy9EcE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634e73a6-6dd9-4890-e03c-08dd57b73b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 05:17:44.1162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJrB4RqCKdmwi8VNGd2RaOcxDovf1V+pkpVpNCahczvS7nj40nyHCDkLZ7OKDzsTkTr8FP2sCOCM/YAsvaKLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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
> Sent: Thursday, February 27, 2025 6:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_dp_link_training: fix assert f=
or
> igt_find_all_mst_output_in_topology
>=20
> fix assert for igt_find_all_mst_output_in_topology
> as it changed to int from bool
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 33e690a60..94ae63975 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -95,7 +95,7 @@ static void assert_link_status_good(data_t *data, bool
> mst)
>  	if (mst) {
>  		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
>  								 &data-
> >display, data->output,
> -								 outputs,
> &count),
> +								 outputs,
> &count) =3D=3D 0,
>  								 "Unable to
> find MST outputs\n");
>=20
>  		for (i =3D 0; i < count; i++) {
> @@ -194,7 +194,7 @@ static void do_modeset(data_t *data, bool mst)
>  		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
>  								 &data-
> >display,
>  								 data-
> >output, outs,
> -								 &out_count),
> +								 &out_count)
> =3D=3D 0,
>  								 "Unable to
> find MST outputs\n");
>  	} else {
>  		outs[0] =3D data->output;
> --
> 2.25.1

