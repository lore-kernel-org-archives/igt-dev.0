Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB5CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1D510ED12;
	Mon,  8 Jun 2026 05:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qm2g8Ofz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7E10ED11
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780897170; x=1812433170;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=ndIv0dQCXj/BvoMSl9PsKmvTfd727oiD4EhHdbaT1T8=;
 b=Qm2g8Ofzt7WR/1JU2vlJIldP0U/GMkt3uvXscl+rOd0p68bOosM1Ijsb
 z6paKKkWlLkzFm6Xyp/WiDLPoGEXX6QJCfboZIRa9IOJTdf+13SaafGFW
 4u+yY+NWure15YZPk6hMvabXeKzeJ5ztoKNS6HUpqIxjrPC188ruG0vZd
 +r57a7MmaKtr/O17162i05QQ6G/78esz3107GQlpkIII8es9kmtQK01Ir
 BZMS/lGjukLTcEvn31HYPnUIPwAdTfJCuW4EN8lNZ6IzsPJS0nVV4g1s9
 MOd/49I1RQlg/MaZeAH/z8grbdlTXc4A7Sk0aXZ5Fc7wmmMQCdxMagSaV w==;
X-CSE-ConnectionGUID: p3kE5niSRFCYFd4qxGYmNQ==
X-CSE-MsgGUID: Rm7upawtS1iufjiOdnMDIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104283611"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
 d="scan'208,217";a="104283611"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:39:30 -0700
X-CSE-ConnectionGUID: VwYTo/oMSe+63jniVanqHg==
X-CSE-MsgGUID: IcAFbcJRRk6IHOYopQBDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
 d="scan'208,217";a="249754151"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:39:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:39:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:39:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2R3pHkvoiETxT/8YYGmBxPGtYhXHjwnFZfa8q8IOVRVIw/5FOFaDAmvB0idQeSsRddSZsyfU4Ypm8nl66g3RqDmuTNKC8ij/mgPqI6DmE4wpz460i86hmBrSLCMzOZL7SM8ubPibZM13Y52fIsW6KcDs95HRWHtRC2/leWfuIefq6sgP48und6hgym3i8KFmJnInfIWDkd/rwozvnH8sJ1TJt7HNZP6BWicxu9CZAKvUTZrtv6/5g9Q8wuqD8uBphRkGd4zgrjZj93ZzJCMU5aguI+BIfWlhhcXzs69VZ1ZDMLgzsMtJrNQyKz/3f53Zmn3N3HrTBsuqjZ3E4eH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2aiWIRfg2tY6xAXAJLXVFKABtNtmecpxxRgem9nTC4=;
 b=Z7OLNEWy3X9N7L1YXeAvYnW8pQYipTjnn2Etau9h5qkfN3uwjmCE1wZAoP6EskosPpmKPGZS8y/lxrJk8n3iFNdoxI1escKuDV2WA7wSj2i0sWFmoqpYyzL29rK3ISSPQDMrnoiZWQYsAZquq6Bbv2F00NClTp42Zes/vtMcbGqFYjHVWtJTKCpkBz5okJAmUjr4U48cR5Eypv5P5DX03h/Ecwv/VwWFph1Qf+JK903pai/WKRxmku/A5ltfnTJmB4AO5imp3nBftmQlE/fVHvMgoSHon7bRbap5gm/ISjdVHM1HkETR5JCufTzw1g+nxb7Usut5HXA7zDe9xy2l2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:39:25 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:39:25 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr
 on INVALIDATE
Thread-Topic: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr
 on INVALIDATE
Thread-Index: AQHc9u0nXyoHaZHdeUCsDJDaj1DjJ7Y0JEGk
Date: Mon, 8 Jun 2026 05:39:25 +0000
Message-ID: <CH3PR11MB843487AA84A423234AEA142D8D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260608021802.1051933-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260608021802.1051933-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB5310:EE_
x-ms-office365-filtering-correlation-id: f4840705-def7-4cc2-478f-08dec5204cc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099006|11063799006|6133799003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: yZTktflhY8iROa2m6aLmow7Z/+OPwO3j16OSU5cjsaC6cxI1BxSHy4jKhAU4fHy3kzcnaNb+aoHEoqyHSgOsUy2dQ7ZUzeMozB6Izx5fGqSY1n58YG+rlNjTyRVzTRAYUOSC968JeUkshWSwOLcZBu0/q0tXzMvYuNpCH1uNHyOJu5pWVnNl2AZpu1U/NDeyEdaqMSZELIxl8qsErFeeaQsXDdq3A3JDjJ/iIoNZyPrOI2lNE/nBXh4A8VGvl2tN8dEcOqQbzxN7Hq24Mzr/zvycpezYlQoUz4xHDeNp+5OwWnkVcFiIXLvjPiaLFhcMmybs58xjUruZjUonqpveC9Z0AQP65OBnnHmF4YQSh5cxJUyz/TCw+8qbBd6L8oKj5HfXruTd/i6YX0RrtK0Tg24JN6H/9d7fVnMxXdFJ2pyg5Ze9pFAxIHeeLmI3WBIjTp2PWlmEdikKNzggs4SMiS88XLl6yu/71PgztNM/6pEZi1JX2zq/MlTTrakT9Nm5HPTdjGPBZb0u0XdoISi9oK++iex4WtikIn2BzBj2By+3mLcB9aj+op6guZ+C0m4SHa/ImlpDHZcHmgJPgd90fX8SSDgKqd7seH7szf7gy6n92cBNpz0ZgicDS4sb3t1evgF5G44yQdPpgTcONZS922mR20GxOoNcwMYhuZREC89x2w1+Is1VmH12Wdqxk+iAVRm1Hvtd/h3uUMkKuqCymi74sv1lJpl2iuTlXXQmdDWYsYBKITh1ScRnucL9YFMm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FUEg8NxolnMPuD6ScsX3XFK0YR09AoFueoyHn6KHee69QrrVnx9rlbvP99?=
 =?iso-8859-1?Q?BO9Lf+ky+X+b2lL22djbfznO2NWrXeHzvtP/Xo7is5OoYiYZXidHtxVB65?=
 =?iso-8859-1?Q?NM5HN/W9g8FS3LseugENuQFmV28GJVVUpGITMQ4Tbrbvj95Ew7BBMnHB2A?=
 =?iso-8859-1?Q?CTQ0NLZJ8Th8g3SEXbDUQSRtqa4WsANpjCl0J70fz+w3ycyVLickyifzmC?=
 =?iso-8859-1?Q?Zo70foJe21RGhYuT+gcp3MJ5H7YCADHfk7HCE8C6iM5jbNSM3XRMtpjTww?=
 =?iso-8859-1?Q?DhbzWtEqoMOWRO2n6uIs2bOgBpJhxQ+PH0EX00mRO583mwh8eg0E6BbuaT?=
 =?iso-8859-1?Q?2LQtfgCcJWn1wlnG/nq136CNkXdzTcYZHlfp62TTs3JRSq8fYuDlgsCzKx?=
 =?iso-8859-1?Q?/C4U6Gq7Jp0VpNGV+qoOxexi9868u/HODdxSMup/tg8MAhw9tM3rpOEEuR?=
 =?iso-8859-1?Q?dG1KFtoydaZmwyemsRwzqvduVpD1tWqJv8zAEtAgAAkuWVt6I+1womAS6H?=
 =?iso-8859-1?Q?119ccA51JC4+t1XgFoaDynTcj74f+g/OC95uo/Ly6TGlHWdLUzpIbDfui0?=
 =?iso-8859-1?Q?8UdhMpmTGuVa+HvFQDrFr1jGdi2xub0kVLDPD0gO8t3p8HFWRZPRYGrqm0?=
 =?iso-8859-1?Q?82Ejn3j9R7GMuxcniEaS26V22NVQIWKi54SNVfVk7tBekm4zOBzuX8EpS2?=
 =?iso-8859-1?Q?C31MK5ezwXIeX+i7K+LfaeG5v18SAn5IJYmrGYJwey/RmLjPusovJOjtCF?=
 =?iso-8859-1?Q?3JnYJioLJuTciK0SdTJ3i2vLl9S4zV+OJP7RVDysWX5rusQMGdMWJM798m?=
 =?iso-8859-1?Q?t6ANGmUXDabQAcBD06OJs2bXVPm4IoS55prAKNEhJ7nPCQCKRFJOTG/+5j?=
 =?iso-8859-1?Q?4Pe8GAC+/wv99bVRaRElXjOgohikZCjQJPPa7OnJd8md8WeLOfUauZHJk0?=
 =?iso-8859-1?Q?/ev4GuYlFA6vjWz9hyzvLJIy9ctRRIWQHbVQTdVyf8GWvrdWkSsNypmzmx?=
 =?iso-8859-1?Q?U/+K7b3h6kXkbzyAs/rgMMb633c2r526Rdm+NOqJDPXt2juW93Saqi1Jsh?=
 =?iso-8859-1?Q?wJyK5zjjbkB+yz3Ct9bGo92tHBqmwiMCO7aujB/osIMldcQwTFuHMRcFzD?=
 =?iso-8859-1?Q?T8jncpcSbGhRmd2yCfBzsAd0Iz3sTBt6diacKW83fSNISj1fApOmbyAezw?=
 =?iso-8859-1?Q?X/0c7kNebCpphwmwH4hEXorjFTuGQODVUbaE8PqZ3EtINDIWu2t4EfNEOx?=
 =?iso-8859-1?Q?ufVb9kvGjNeOSuj8n5nNrR2yVSoJrDcvlQobR9O7KkIWGFmZjUUS+l9JvF?=
 =?iso-8859-1?Q?Dw8wDLScZstNwjBLrpB9T/ySK8tPRafmYLQThndAN+4WVaMyQNOclU9ENh?=
 =?iso-8859-1?Q?vfLW7iOrKr98BO79BG1v8NEd7HdZStTyeSg6bKwZQ8x2b6fRHnZzbtaM3q?=
 =?iso-8859-1?Q?gF2EMPfX9uqSQ2fHGdTRqWru6x9NTqJw0eCUmh9MDmAVdPRdDUp/yspPCG?=
 =?iso-8859-1?Q?GW1mzB+83A4EPfLn5LPCRceSpmUwi7K93zN5rmjA59iJ0RLXKjS2yc2R+g?=
 =?iso-8859-1?Q?aPIxLzN9MqaIupVUUj6CecF0S5AMOabdK6LeUcKbUonLITEIq3VPPg8MWp?=
 =?iso-8859-1?Q?dLH8gK01TGhvWtow3c6ziimr/4IldsNLLgHxvisNV6GXxv0bK4tF61sJRk?=
 =?iso-8859-1?Q?hDLzFuiOs0cdY7ZGLeURwCi/jHCTvVlMPRiJsi6+xYj/Jz0e76PlHiIKfP?=
 =?iso-8859-1?Q?OwZMn/6QmodkbSj9qtwXIjVwCqH5pHn0hUvx8caJ/HSTyXpgFI/H6bNfb2?=
 =?iso-8859-1?Q?CLps4ocuSw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH3PR11MB843487AA84A423234AEA142D8D1C2CH3PR11MB8434namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s+3GLYYybhqpVjujgx4dpVStzNMnm3iNxfs2xyQYRAj6EZghasn+UhOU5y9UHAVVTwwFqCJvihM4QP8KIEciE7ev3+8f31QMOXPNFuoTQTwurm4N2Le/aLbLV0imYdSzvOvewhdAhNWdCIaqlx620Dlvj6qRvSnHEVUMI5szCmTbstZuE+xmWhGXYMDm5zOOqBv0guwLz0CDBvVGwA9NW+QzDkazkD/sL1XXqBRNQzhC6ucRn8KSuRD9R3tqSErI/8TMaeMkB11lWR7Z5hQ8Jb1sGHmFfC0EsmPepyPItm7fPKjtOhksJGW+zEy5l7rJbT5nuvViRajFpoZ1YKGlIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4840705-def7-4cc2-478f-08dec5204cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:39:25.0472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmdUkglQgYk63/QSmTDN1iWr17cP1o3AxI1QAplyMcOGhq3YDdEsIML/hWqr+t8PABp6c10v11HEVaX9WRspWQhDksnuD3go7sjjm+FvAb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

--_000_CH3PR11MB843487AA84A423234AEA142D8D1C2CH3PR11MB8434namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Niranjan=
a Vishwanathapura <niranjana.vishwanathapura@intel.com>
Sent: Monday, June 08, 2026 07:48
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Subject: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr on=
 INVALIDATE

test_preempt_mode() and test_legacy_mode() re-mmap'd the userptr data
buffer only when 'i' was non-zero, skipping the remap after the first
exec.

Always re-mmap when the INVALIDATE flag is set, including after the
final exec. The trailing remap swaps in fresh physical pages and
triggers a userptr invalidation, which exercises the teardown/closing
conditions (e.g. unbind and fd close) against a freshly invalidated
mapping.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>
---
 tests/intel/xe_exec_multi_queue.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_=
queue.c
index 6f90c3e4e8..d9d648b022 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -746,13 +746,10 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_=
instance *eci, int num_plac
                                        fence_timeout);
                         igt_assert_eq(data[i].data, 0xc0ffee);

-                       if (i) {
-                               data =3D mmap((void *)MAP_ADDRESS, bo_size,=
 PROT_READ |
-                                           PROT_WRITE, MAP_SHARED | MAP_FI=
XED |
-                                           MAP_ANONYMOUS, -1, 0);
-                               igt_assert(data !=3D MAP_FAILED);
-                       }
-
+                       data =3D mmap((void *)MAP_ADDRESS, bo_size, PROT_RE=
AD |
+                                   PROT_WRITE, MAP_SHARED | MAP_FIXED |
+                                   MAP_ANONYMOUS, -1, 0);
+                       igt_assert(data !=3D MAP_FAILED);
                 }
         }

@@ -915,12 +912,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci, int num_place
                                                 INT64_MAX, 0, NULL));
                         igt_assert_eq(data[i].data, 0xc0ffee);

-                       if (i) {
-                               data =3D mmap((void *)MAP_ADDRESS, bo_size,=
 PROT_READ |
-                                           PROT_WRITE, MAP_SHARED | MAP_FI=
XED |
-                                           MAP_ANONYMOUS, -1, 0);
-                               igt_assert(data !=3D MAP_FAILED);
-                       }
+                       data =3D mmap((void *)MAP_ADDRESS, bo_size, PROT_RE=
AD |
+                                   PROT_WRITE, MAP_SHARED | MAP_FIXED |
+                                   MAP_ANONYMOUS, -1, 0);
+                       igt_assert(data !=3D MAP_FAILED);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
                 }
         }

--
2.43.0


--_000_CH3PR11MB843487AA84A423234AEA142D8D1C2CH3PR11MB8434namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; on =
behalf of Niranjana Vishwanathapura &lt;niranjana.vishwanathapura@intel.com=
&gt;<br>
<b>Sent:</b>&nbsp;Monday, June 08, 2026 07:48<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Subject:</b>&nbsp;[PATCH] tests/intel/xe_exec_multi_queue: Always re-mma=
p userptr on INVALIDATE
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">test_preempt_mode() and test_legacy_mode() =
re-mmap'd the userptr data<br>
buffer only when 'i' was non-zero, skipping the remap after the first<br>
exec.<br>
<br>
Always re-mmap when the INVALIDATE flag is set, including after the<br>
final exec. The trailing remap swaps in fresh physical pages and<br>
triggers a userptr invalidation, which exercises the teardown/closing<br>
conditions (e.g. unbind and fd close) against a freshly invalidated<br>
mapping.<br>
<br>
Assisted-by: Github-Copilot:Claude-opus-4.8<br>
Signed-off-by: Niranjana Vishwanathapura &lt;niranjana.vishwanathapura@inte=
l.com&gt;<br>
---<br>
&nbsp;tests/intel/xe_exec_multi_queue.c | 21 ++++++++-------------<br>
&nbsp;1 file changed, 8 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_=
queue.c<br>
index 6f90c3e4e8..d9d648b022 100644<br>
--- a/tests/intel/xe_exec_multi_queue.c<br>
+++ b/tests/intel/xe_exec_multi_queue.c<br>
@@ -746,13 +746,10 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_=
instance *eci, int num_plac<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; fence_timeout);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_a=
ssert_eq(data[i].data, 0xc0ffee);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D mmap((void *)MAP_ADDRESS, bo_size,=
 PROT_READ |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; PROT_WRITE, MAP_SHARED | MAP_FIXED |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; MAP_ANONYMOUS, -1, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(data !=3D MAP_FAILED);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D mmap((v=
oid *)MAP_ADDRESS, bo_size, PROT_READ |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROT_WRITE, MAP_SHA=
RED | MAP_FIXED |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAP_ANONYMOUS, -1, =
0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(data =
!=3D MAP_FAILED);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -915,12 +912,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci, int num_place<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INT64_MAX, =
0, NULL));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_a=
ssert_eq(data[i].data, 0xc0ffee);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D mmap((void *)MAP_ADDRESS, bo_size,=
 PROT_READ |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; PROT_WRITE, MAP_SHARED | MAP_FIXED |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; MAP_ANONYMOUS, -1, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(data !=3D MAP_FAILED);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D mmap((v=
oid *)MAP_ADDRESS, bo_size, PROT_READ |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROT_WRITE, MAP_SHA=
RED | MAP_FIXED |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAP_ANONYMOUS, -1, =
0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(data =
!=3D MAP_FAILED);</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">LGTM,</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Reviewed-by: Priya=
nka Dandamudi &lt;priyanka.dandamudi@intel.com&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB843487AA84A423234AEA142D8D1C2CH3PR11MB8434namp_--
