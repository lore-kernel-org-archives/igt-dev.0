Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2C1CC6B01
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3A910E04E;
	Thu,  2 Apr 2026 04:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIdra2ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65D10E04E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775102442; x=1806638442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qikvpbtN5e/xsGm4k7Yu/4FiI3oHlkHMDbuYEC7qc5g=;
 b=XIdra2udWyqxxgJSQXiT4bo1d6QYADCYxSbCtD4mqI9KE6IpY5xIshCr
 Jtlm0bg4Me8rUbyq1wqH823wEaWh0h/g64z8/dQs2/QVBeoJngF88T/mw
 iRtjKGOi0Uxlsb/LtDySFPq+Mi98fvGMOO3NGIGwlemTAn14IHTpj6HU6
 4gITrzKorW0/M/DGFNhvo2KE3tQAvcN4s7+DhXNDAmuoqfNaRIzF/QOaG
 w+xr3EdcX0wmL6SfIjP/4Peik/Xi2bdIjOmiiw4KeWXLWsvgH6P/F7O/t
 vPiSjP7r/RvuoxxlI9w2pANvm8wIzarXdZpXXdOPFfGXtotrb3z4R6u0l Q==;
X-CSE-ConnectionGUID: 2JVrdLIjTvyW7isdpYu4Cw==
X-CSE-MsgGUID: V0XekcIpQiiDiDUsTxBu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86457958"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="86457958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:00:42 -0700
X-CSE-ConnectionGUID: C7e6x47mRqOpUEIDHY1qAQ==
X-CSE-MsgGUID: jgA+ebvuSEGKL6i5tnY/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257336440"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:00:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:00:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 21:00:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl3wBKt4lg9ky/H2wOMwBpbI9OYRO1P4JplOhFRd5tbeDaIA87sCpJCnUpSxtovka6wmZeeW4htTzSZcuZtZBTz+w3ckrApNsn9k5Au+KbrU4oaVB+0wmxUaZqg673lHnhT7g3k8w8FPgbNM6vnHqBTEIKSJa1/ISO2j5zSk7+GeXBP/JcmjsTZS2My1WjA+NOWircZpNG2MIVb+vLU0rTexysKmIVumfO2k9O7aKBVWXlP81XXA9LByZVtt+syU0jqB+46CJEPLg9kzoiMbaoayerCgnPg7m4cd9ckUSgtmERMVZHEZZP4XCirMyM+mVeqznK0hj345nAjkVhgrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skk1nZ1/IyYjxLzhwF3gfEd1AL8OY3Xid74O8Quoxrs=;
 b=cIsTpcrM15SzZoefoiUzezMAV1VW/ACa06yVyxokjB6SUEmbHsN5jHBY0oOKRJA6KUG+7IvWKJXGP0+Tg7wTeOW6AZNZ2Gp1oG77OebFFLKGf9lzkqaqqzvOGEx6Nmk58rNYv1I1dUibmH+cRu8wFpzPbmFb5UdHDNmF8+sIMhTMojeXUGc46FElrY29NJ2NwrwkPoaXJsiUCXVuiYndEvYgyNRzPK8k8WVGHGJT8buVgHzWiwaMd/AUpiZPfZjlFEDvlSkyD+/NCbsVVegr5x8yAHlSdHuGbig1Ce2ph8vTfXMx4ey93wZKUdFyegEArgczSZ4hPUfGupElcALW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS7PR11MB6199.namprd11.prod.outlook.com
 (2603:10b6:8:99::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 04:00:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 04:00:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Thread-Topic: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Thread-Index: AQHcwe6kf2VXGlNnuki0W0pAJiHH57XLJgrg
Date: Thu, 2 Apr 2026 04:00:38 +0000
Message-ID: <DM3PPF208195D8D55ECFE3FCDB212EB2C8AE351A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-2-kunal1.joshi@intel.com>
In-Reply-To: <20260401160627.1338526-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: da494703-729d-44e4-b478-08de906c66b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: WfmRqyCx/sk0ikHwDDSrTgFRP10VmsV1RiuNbjZG/GFHK7vjcV3gsNHdwwn5DTbDBaTUd/qrzR6tGDw/KPODwGTU3qckY2NDe1cHTTE6SpWRN2WU492IgrFbD6GovcSYvLrfTaEQx/K5J6zGZDWCjmPr1Uodj8t5C/tKLbovf13RQuRvZo2OMhNUteVR03clGrq2Gkk5AmvfGjpTlRUgN206bs40S2y0sepAx8gB0ZOX/xqh75bJxcjMAoKSPwoklCKIvo4yfSiXTdoVYrYg9SaJBBRD+IkesziFd4bQXxxYW0PcB6QCWyUjJLa+hhHjBbYonJxwhHLvFCpQv4nBN8S54ZJjSBWiXGaAVGDIl+fARqzmukwIhpnE52on40xQ2ecjukybNiXU7A/k+EcIXBonqwqBG8WMsfSUYMGVSilcvKiRyIROSCZMq4mKWabmSZtJLwpGMuL+DapolVTG/0Ycl0HfExTKcI+BULl9GkwQUos9xutcCJeD5d8LJdBnXO5xWkFXohLTOJ3L4Ihwad502hKpMhgaUbIdFnubbjcN8dUHiFR13WGW8aljfWx01mV9ZIxN1VSXA4vUYtwH4VCRN5gU1RYoMIdwj8gafHfd9N9kSmVsIri1RThQeNo3kVzPTVbOTdAGXPmIZWErfXoQesAwOLZB6qX+c6Q66ukLlcIWEGRFYUKBL2pGgS0WXqaRS/fPI9wTpcN+SzBpEYjmkXLGt12UYbt2YWOPF8tuQcpC0OCT7/tHnOTJsPVJlHeFFNax1NM+/YRvBqFIJ84TyJygcT1XQUjeaemu2YQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Od16jc7H8WZ8DhKZH+4mn7c96TvE1cPAXKmVYPn1ly0SEwc9rt1xCV1hz99+?=
 =?us-ascii?Q?+yPOj/9CmRXW2TtcscdmpGnQyiyXiTJezXK6KmNBMwSl8YOyqE5iDsgGto8d?=
 =?us-ascii?Q?utKh9oVaXGz0mXMia1DIAhHqtV6Rr/6wxl21bdkuLfNGs3Zgzv4+SxVGzXUe?=
 =?us-ascii?Q?b/T7yo1S9n1rKsXAe+CQZg2Qhbu4guwCghTwvjfUs/m0QsPsFzHn7Svpnj6e?=
 =?us-ascii?Q?aPn6JD9otsoxBSHso7lnflFD9A0IzZy8XcCaIqyPukf9B+jJ8chq58WHUj8b?=
 =?us-ascii?Q?B4kldY0lyN3wS9sU9YbB6pVzTKKzABCYJjsL54AVkGkNSUgqXGvToeoFrrDz?=
 =?us-ascii?Q?X9kp/WFW5TTc9r6YumqMLn/uUbgczQ2ltSTxSXnUXQY/ibEQDnHlrs17tHXy?=
 =?us-ascii?Q?dk5VAB6QBR4oI2nJeb/2Y7sR94YdjrP+1fXsKelLM2hqCfnOU4keYQdzcTrn?=
 =?us-ascii?Q?q7QehuMdLzfIJDrGzhP6wyae/IDP7s1aCT+SMnuF+aF6CEGFJ3xwcUT1ZfCw?=
 =?us-ascii?Q?vWSNGRZpDamvBTf2OaqYvhAmIoaVz0cUEbWQU1IfcSQGCv99AdpfgC1Y/Gtg?=
 =?us-ascii?Q?BXqULlqOSEmQXEQuQi9h91k+dzW7a4ANHmD1JtxRzyR/qfabIoOM2LP1+/0X?=
 =?us-ascii?Q?ezOTdZldR3qt3/Y9tl8CcSMebMP/5cHN5GGu1j5tndNQC+ErMxXJfb4vm22z?=
 =?us-ascii?Q?gUvW5vhAG/eMSsAdua7QZjMHm7VCynfLCqbv9WPsKKBH1TpVTnvz/SwQ1vPK?=
 =?us-ascii?Q?4tTXP0yUE2y3y5hBigvecHZOefDz3TnRwi/fsb5JFxwzf1m11KzucpFiQqDz?=
 =?us-ascii?Q?ugg0/murTe3+g0Q9d0m01U8fDnRENQcsGCALd78f7NBYSRP4hXwJpy26sMzl?=
 =?us-ascii?Q?XelHF4Jf/HhNF9Gqabr0g8EOM16surR47xc2GelDgVJ+MN4vjtYtR4g1HQUP?=
 =?us-ascii?Q?7DKmMhuHDWjdCrZhT3mXTeYtYq+h8uqh+R72XhFhFkGniC6BBd7JT3x8cHFY?=
 =?us-ascii?Q?f6AqmkziCYm5kyDc4JuSCFxjeGOzuoOAQusOKSleBS7OAwHSrol+AkovpqRz?=
 =?us-ascii?Q?6PRM/oInrpyc0dHBBfaxdyJFssN/q0tQY2B1IBUj1qtIFBWxoKldfkguUK6B?=
 =?us-ascii?Q?MHGMf8MbbiGc6ii970JCKJfl3Mb1LwHDpF7VvjYMXWtYKodJauqGAVP9IHZG?=
 =?us-ascii?Q?ayP3s88aKW8c89J912VwhBycgWaG31+IiZeFBvreTeYAHwrhCPa9LlTUj9c4?=
 =?us-ascii?Q?gM26EFiX5lljh7REve7Je7GDvwbqYrVW23b7dx1O17OKvg4nAc3adrquykZk?=
 =?us-ascii?Q?PcouvYzdHUEZnnBaqPQ0bXq5291pPwIq9OMaxnAcZDSjEPcw+n8ag9O7UnH7?=
 =?us-ascii?Q?PDt1NLvjP0f8r500fgKK/N7GoogzSZHGbEMI/dkHq8Uwr9DsAnL2OZM79fO8?=
 =?us-ascii?Q?Tj2KJQUTMAL64D3vvF/PPa6kUmGdcniB9mLvAANxUgPqZnPDGYL/5a5sYdfx?=
 =?us-ascii?Q?PmAah/dm8lWfMhwnQu1gVf0efBX/vLrpWo5V0kBzSmrnN6+mKHyZ+tYfDCMB?=
 =?us-ascii?Q?UTVOgTNtjwsqlfWDZUX9LYDEr5BkXWQmrxgqiEhz1AR6rZSVUHGXGMNsvJnq?=
 =?us-ascii?Q?V70WTX8n/vNCBduWCZj3xHFpS1WsZc8HJfvRghduVo1ooZ3VH96eUo3PPhYn?=
 =?us-ascii?Q?NGiy4vs2B/99X4wnqh/kj9/VMkaEOevLIAgMQ7Xtta3YJ0/bqJ/SyJj0JrUw?=
 =?us-ascii?Q?ZDW+44fjqg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oMlgN9ZMKk5L+laDsDYYbZA6QbM9HzRoJvSwrgfqQQh/G9broN66isKkpDXDkEWy4h7ZHqdHiwR/XzLihgUzwDVOKVWNVOdovpR5GB+Tc2gZhvHNiRgNw4MnGR+DizL7hcY/HlMaGqVYCs9NxhYwp2n+dnYz4JEgduCjASjyf7iLhvrEx4PBmpmshSrYB5pIU6ZDE9qXozqs4RYEpY3d0e8xDp5w/NWOK4jfqrOSw6PTUpS3WloTRAby82j/bdPs8xX9/I5IytLiz+E/slTgE59yhnuLdKyd2dWOhNL4V79AuTejbuTA1uMGn5dVhaUEhhsYG6ufPIJZfySkZtIRGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da494703-729d-44e4-b478-08de906c66b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 04:00:38.6609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+OnOUa7Fqqaz6GOkRaYjg2AxQhgJRaj2B6pV+IA+4cFPNFofeuE3uZAm0QuQFs+asgSHSvnmo6QF8t2uNbNoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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

> Subject: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
> existing function
>=20
> Convert the doc comment on igt_find_all_mst_output_in_topology
> to proper kernel-doc.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_mst_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c =
index
> aef74cd31..38859cffc 100644
> --- a/tests/intel/kms_mst_helper.c
> +++ b/tests/intel/kms_mst_helper.c
> @@ -5,11 +5,12 @@
>=20
>  #include "kms_mst_helper.h"
>=20
> -/*
> +/**
> + * igt_find_all_mst_output_in_topology:
>   * @drm_fd: DRM file descriptor
>   * @display: pointer to #igt_display_t structure
>   * @output: target output
> - * @mst_outputs: filled with mst output of same toplogy as @output
> + * @mst_outputs: filled with mst output of same topology as @output
>   * @num_mst_outputs: filled with count of mst outputs found in topology
>   *
>   * Iterates over all connected outputs and adds each DP MST

Can we have the following way of documenting functions? This is what we do =
in kernel
igt_find_all_mst_output_in_topology() - Find all MST outputs
arguments like you have done above
Description of function like you have already done

Rest Looks good

Regards,
Suraj Kandpal

> --
> 2.25.1

