Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB025C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 05:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E95A10E18B;
	Wed,  5 Mar 2025 05:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw1X+49/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C06810E18B
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 05:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741153410; x=1772689410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EySiKmQRq2YFE0nE0eb5T4GmwdGZA+owJSlLJbWxD5Y=;
 b=Pw1X+49/kzyM8RnN6WytHDXmLKz6R26Ijff5VIouNzfoyolT54ogILKT
 YAbjP30f7gN+j4caJ20nD3jmlmFz3dFz1VsCNJSewP7KUlfyyIVzDvksS
 NCdiHCccjeppASCerzgwNQ2dE5WFPZVySsNeZGhcMlgQCeYrUIgr8oNXo
 Vrmb/7w07gjcBm2ZOSSwBSqJzF85f1z0MsOBs9bp2r/nh+aPTXl2hxFIY
 lsekQ/TLKa5QnGu93hraT6h5mFv6aJqtD/xpn47sHawiThgB5LlgvXyoz
 BCV1cFijxAUKOr41ZluvSgsB435K8/4Kqsk7FGeuCzIwpXYx6JCjoC5oG g==;
X-CSE-ConnectionGUID: c3prnjufRWysS0OqLHytrw==
X-CSE-MsgGUID: zRC2FQnMSDa4MKnScLoahw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59644214"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="59644214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 21:43:30 -0800
X-CSE-ConnectionGUID: MeTl4efYRESY1LfYkQtfmw==
X-CSE-MsgGUID: JTAGNAnlSW6aeAi58DEHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155779393"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 21:43:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 4 Mar 2025 21:43:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Mar 2025 21:43:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 21:43:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMO8ahJUnT/T2/G7n9CgEejdxyX6XUPgZ5P/1WlwiYshSwTdRvyFaFRO/wXdjao357YK8BNEBkVrzfw+Cvk/sy3hVZdsLpVrTjdFgZPmrRrOvtq2fQMU/Fq9lSGu2FT2MYhym8/6xYFmSrsPBhlpyg68Zn1mmoIZYK51iuB6nA15xaB6rIhQ6RbnHxw1QSuoyZyi7qVeliPcCZzUFyzBgSw4LFQ4Wx8WDVr8EMXFJ9NQpcHEKKvvgRoed/gXY6dod0hK87OiI9Q83bNvPjlI75ygZ1WgxhnLsbOq5UwjBored4QLOlxLR5vv20n5jTPedRs+tqROaDeGTRGWz7x1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z3d1rDxetLNEd1CUYqHel7JvjC8gni1oIUPBjpYdm0=;
 b=yJO7YuRF/JayOYVVFNACH+e0sX/Vqn8/rjLrk3up+gA6CDHMbJlrunUWqUOiuOZ1ln24if53gvVZzrpy6swbmQ8TVh0JroHiR5u0OXGj8tq0pXa8Vg17C9eqTTWsl+j3aSZvYcfInac1EEUIVtm6dMJFGykOXZv5GQm8KsnjxI1my1NVnBSeKJMXg49DB8OdzDOiLi8xtzeQbuR6R5zSsDIioVMoD4SHPVeZDiNDhgFad+bZ/KuDXzrT/zHugfNXqpIHhoZU1vKBKZmQRFU1hRHw2gbqNMYoUP0xTa11czrN9SrVKtuuMLJo0s/iykmqLukpv/88NgbAHUU8z54myQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.16; Wed, 5 Mar 2025 05:43:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 05:43:12 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast,
 Francois" <francois.dugast@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH v4] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Topic: [PATCH v4] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Index: AQHbjY+qqeB9Ypknu0SsS6/EflEJBLNkB7DQ
Date: Wed, 5 Mar 2025 05:43:12 +0000
Message-ID: <CH3PR11MB843449B5644CA73331DCD4EC8DCB2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250305053852.324282-1-pravalika.gurram@intel.com>
In-Reply-To: <20250305053852.324282-1-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: 2f9383bc-7f0d-4f2e-91ad-08dd5ba89e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2IVyMA7gvyMMaFHQNxGCfV0eFHeFJ/CPUmu9KX6X1j2kDP+x1UpvvOtJghTe?=
 =?us-ascii?Q?sPdrxQ5oir6s6xVwm4/KQcqwUfQeE1SoaVPWsf7YI3NEaR+8hRKlvwsaxm+b?=
 =?us-ascii?Q?3M9Yq4V1IRL2AWpt7ohN4d3rT7ADiPVZtjSXKkV/Yi5DW1lXVVIk1VboVhYi?=
 =?us-ascii?Q?wioJrNP6YWCILvtCHnwY45vSDXZTb5i14F42/aYkUZ8n8Lj5M7WzOtp6eZ1H?=
 =?us-ascii?Q?8T6aG5gfV1nBO8WQX3Lxa1LrgYxWfrB8QFANFXBabScN3GxvOfHiUoP5M5/m?=
 =?us-ascii?Q?5JMBFASOA/OYINhoR/gV8bM0jS5GMbfBMAsW3kNVESCtwDWLkU54zdqcgc1I?=
 =?us-ascii?Q?qPkCIEEpiwaK8uQuCLYI/2O2x5j9QV7/Yz0PNUVaRL44EMmqfCEdVaqcfAPA?=
 =?us-ascii?Q?pIp6xu94Zg1BIUUHiYFW7yuCmwTQlFJNIJLciOdB140hDOVbsaIlEIxpdrYJ?=
 =?us-ascii?Q?P3IduoT57fX4LXJuuWhFA3hgrCDoeHUK+s4yTJMWPIo7jO/SRSRhM6+8a3en?=
 =?us-ascii?Q?XbMNoDftKYTzV45ztDzQMdQVYyM/8zbO36X4MJFDhWbXVPVkYdlixNnuZhku?=
 =?us-ascii?Q?k7AhSdPIzxAm6FEWiPIarZ8p/cvti0QN3DYETZIQMbDvBxLI951FzK3M9Y22?=
 =?us-ascii?Q?db69j+/+PA8307hG5sOuQNhSwNj/9fXL03GGf+KEOhUqm3z2wBSI3zn3iPOQ?=
 =?us-ascii?Q?YKWTOE0PTWFrsDqEeaW6U8HHbcybO4Ft+SyTWd3EtFpjyRPkeu5i/tZzkWpf?=
 =?us-ascii?Q?XaZwB2kc9Fmj3FIGo43rgmXkVKnWPrmAhVcJKoKCKO9ARiYAQjfM12oJIAH1?=
 =?us-ascii?Q?ygwI5O2pp/ayzvIG0rrSBURovkWD0ChlEf02GNyM/zcBbQJ51IQr9pLI7JmC?=
 =?us-ascii?Q?kWEdIC5gij08EojPpX9FzkqXrRlK/Xok8aODlw/oaU1s+w0MSO1kJGObU6wn?=
 =?us-ascii?Q?iMzkGYTuxOqxrrcccJFNOadmh1d8nbjeJWLgPpTrHNbICCrPmkimYiNM/9b7?=
 =?us-ascii?Q?KJxiQH1kWuYFNTsRvdT9NPoMBKwhKO79XYJ9vVg/dsFDQ9rEsKZKEI8QVQ5T?=
 =?us-ascii?Q?MBIJvBFZW9QSWw+gM/lpx3cfkDpFU+lQUdBDaGcNOjS5QlA3RqkkroVrcbj0?=
 =?us-ascii?Q?CMF7PYWnDmOCAL8Kzgi90IEGb8b/0JRODnolgvruEt0V79NNpja1s7Tt55DD?=
 =?us-ascii?Q?aFfpPStr7Xt3Wm1iLHfXLWoXVTsu1CyX1Hg8viq0z/9McXpbTDtwB0Bl52Cu?=
 =?us-ascii?Q?KFdY71njzjJfMoseFY3UmaEmKzAoPaZ9KfJO1pez1YXT/x9oxlUiU7Ok1Tcr?=
 =?us-ascii?Q?+I1VxMgGgAqOzNZ3hqUhq2+kClIJSMHP+0kd38fn7sOCent4GeQupKAJSGiZ?=
 =?us-ascii?Q?9cBu8bsV+rCZMWkeBWOQp8K1u2efffXA6GyX3U1dRR09NKuAI4v0JS+tM667?=
 =?us-ascii?Q?gYteVGHJfE8rtIEP6y5HbsPKFMchCkJk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2OR+lsP/QyEqe18lQjwUyXAVsFz5GxAVXIfVqZmICoIhHy++fb9LLBy2yZI3?=
 =?us-ascii?Q?cQrxJWHKjq1w8+NDJfhowWmaMww9TPgdm/276uod7DkFBvqPIc3s233zA8sC?=
 =?us-ascii?Q?244IdlVhpI19w8jiB5+Ikkr5DYSD/EdXbt3I5Ra/artxjMUmXwZY1DLfay0w?=
 =?us-ascii?Q?Pe7RCnoMK6ed7CAuUyM47MgdB4QlRDlgD1A2DBfuXTANSMXqjb52DBt9fGiL?=
 =?us-ascii?Q?HxmVqVWEnKhtKqYwkRqdy2pDpLCGJVaUjx5Iwc3SSioCfWVz3NL9IwUNDSIM?=
 =?us-ascii?Q?ZMCWUkFmXXSwzuCmRvOorxVOLctqTChHVXKcsTTPEb/mNWTL3GbWMKM/Q+Vm?=
 =?us-ascii?Q?9mGjZ3KX0bENRJJFHAOYpuT7Quu7y57cUj9t6PescVXa7X03oAbrf5zKzNk3?=
 =?us-ascii?Q?hxQeBiDuTG0/XTpG687DBQaNIxR6a0GSpzwGt+iw/hGXta6ZZTHCvl0l3dAL?=
 =?us-ascii?Q?4mPrNcb0i+LX/IaB/AAJWZdYjglANnuS+F4aCbrCjOB/sKZ7HXPGdr3pCASI?=
 =?us-ascii?Q?qszbvuw81FNOctcfKnDGf4JcCg+hILjQJMfFBVHjNmMmS51i9RQRbpoRTi+c?=
 =?us-ascii?Q?D20HJa91kJa6SimN9KfX2VsYWWyz35RuOvherd+aCWhjXa8iCtlvp1k/NlTw?=
 =?us-ascii?Q?6tkYPQZWSh4PXfhVsBvXN3Vm7vAJTkpBvIxfdVLBXEzbCDOesjkn9dFCjf49?=
 =?us-ascii?Q?Zd+QAfTwFFb16e7s3WjTzYYL4hh6zL3DO1wv8IQk5VcSRX/qhNb1ci9tyvz5?=
 =?us-ascii?Q?n4oDNU9jwAJi5dTOLnkjPe7Fhj+bb77T86eg1r+HRZn1OaPATHsyagZomNeS?=
 =?us-ascii?Q?WqsEMC+OhHw6ujIiFLeKV5URy2NcjXnQTvA6jasFpa3UyUzmEiFdHvdSSoju?=
 =?us-ascii?Q?XRyGt0inOU+Uj0KX9mKKVuPcBeWGdgYAgE85efuLj8A7XGptqnWKVK12u5DX?=
 =?us-ascii?Q?QF8/3ZQ3UnmVhW5WvQVqa8bJphYtDwWHrU7cikUN2pU2gwyFqlBLmKZ7FBBE?=
 =?us-ascii?Q?dECee0Vn/IWtXVB22DKwicODI8Yc5NikyHGb+EdRIg5yQFL2hywSai9mEAJ8?=
 =?us-ascii?Q?Asa+kOiOT/Ns28pQxYYVQ6sSK5TrgkRVDAYkMkZeFRF81mgneE+4+DUmpSdn?=
 =?us-ascii?Q?Cb8e8N44F06z9+MaivAON7Z01UQG1DsUylUSW7GQtxty71/d8e9ZBp9q2/wb?=
 =?us-ascii?Q?OVIaVwo8OQ+yTRyJcY5KHlYKSmnWLFeTGEcW0ZPWfPCYG+iF4um/3I32yEaf?=
 =?us-ascii?Q?mkDCdpIYqkm41D+aM6h+jvRQOgSia6jyCyyWdkBrBI65G/jv+KkmALIAyZiJ?=
 =?us-ascii?Q?OC+sJ+XvM/ccR01KlEOGPMhbAY0SlOpQyiLBcPkAskwmv2gl2cPmB84pka6V?=
 =?us-ascii?Q?l3nwCch14BFLHvpCsgdMRfJYoSOZu4i8QbaXfhuqzX5lu41jj3N3acIEJscp?=
 =?us-ascii?Q?mgpoch7qOP3SPhnDPl7Y/cy/NRzsECe2Pm4QzDWWnpnRy5yWx1khifomN7/c?=
 =?us-ascii?Q?aHQ5ru9T45e8K/lnfFSniVVgfQoq8cUHXDtDzwLbSMAskm8lgXdKw0eBUJR0?=
 =?us-ascii?Q?9LpCq90lkB+16UUDfzNO9QD4QShXT0rQf5XaT/bOVzNngXV71/zFvVdsjdFE?=
 =?us-ascii?Q?lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9383bc-7f0d-4f2e-91ad-08dd5ba89e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 05:43:12.6238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L651t2Xdu7IDWpsH6j87Y9Vz4JbPhP+a8ZDJHDLvfix/WlgoACnIK+GHT/O7zUK+apRbhnbiN7bFOOA+2pgcNZj7rsVTIv+vTAejVwWIOhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Praval=
ika
> Gurram
> Sent: 05 March 2025 11:09 AM
> To: igt-dev@lists.freedesktop.org; Dugast, Francois
> <francois.dugast@intel.com>; kamil.konieczny@linux.intel.com
> Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH v4] tests/intel/xe_fault_injection: Inject errors during =
exec
> queue create IOCTL
>=20
> Use the fault injection infrastructure to make targeted internal KMD func=
tions
> fail when executing xe_exec_queue_create_ioctl() so that more code paths
> are tested, such as error handling and unwinding.
> include xe_exec_queue_create_bind only for VM_BIND engine class.
> xe_exec_queue_destroy_ioctl() and
> xe_exec_queue_get_property_ioctl() are not considered as there is no
> unwinding code to test with fault injection.
>=20
> v2: Added separate case for vm_bind engine class
>=20
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 56 ++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 7ae941367..1f107ec93 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[], const ch=
ar
> function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);  }
>=20
> +/**
> + * SUBTEST: exec-queue-create-fail-%s
> + * Description: inject an error in function %arg[1] used in exec queue
> +create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_exec_queue_create:                 xe_exec_queue_create
> + * @xe_hw_engine_group_add_exec_queue:
> xe_hw_engine_group_add_exec_queue
> + * @xe_vm_add_compute_exec_queue:
> xe_vm_add_compute_exec_queue
> + * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> + */
> +static void
> +exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance
> *instance,
> +		const char function_name[], unsigned int flags) {
> +	uint32_t exec_queue_id;
> +	uint32_t vm =3D xe_vm_create(fd, flags, 0);
> +	/* sanity check */
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id) !=3D 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id); }
> +
>  static int
>  simple_vm_create(int fd, unsigned int flags)  { @@ -283,6 +314,7 @@
> vm_bind_fail(int fd, const char function_name[])  igt_main  {
>  	int fd;
> +	struct drm_xe_engine_class_instance *hwe;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
> @@ -318,6 +350,18 @@ igt_main
>  		{ }
>  	};
>=20
> +	const struct section exec_queue_create_fail_functions[] =3D {
> +		{ "xe_exec_queue_create", 0 },
> +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> +		{ "xe_vm_add_compute_exec_queue",
> DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ }
> +	};
> +
> +	const struct section exec_queue_create_vmbind_fail_functions[] =3D {
> +		{ "xe_exec_queue_create_bind", 0 },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -333,6 +377,18 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>=20
> +	for (const struct section *s =3D exec_queue_create_fail_functions; s-
> >name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_VM_BIND)
> +					exec_queue_create_fail(fd, hwe, s-
> >name, s->flags);
> +
> +	for (const struct section *s =3D
> exec_queue_create_vmbind_fail_functions; s->name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_VM_BIND)
> +					exec_queue_create_fail(fd, hwe, s-
> >name, s->flags);
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
LGTM
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1

