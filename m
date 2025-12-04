Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894DED1F9D4
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 13:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C310E93D;
	Thu,  4 Dec 2025 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEbs2wL5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B9E10E93D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764853294; x=1796389294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t9MfbvPwA9RYn7SCpnhapw1BHvPEfs6pXO3U5sPcX6k=;
 b=ZEbs2wL5SsVn9DCzrfmW4/2sUh+hkLUqoMx0BWzOS/osrNU88/OOGENv
 1QYFxq1supaiO+40AM55Zq5kWIFsyTmHJGK20ZON6arq6ErgsV2ZJe35E
 +P5DAVfFOrzSm59Y/UziDMC4erymwic3Je57Rkzf8xndRXs3C+U2pyyvi
 05RVeSUrsLqo2SolFdYfeQ6ydTrSRtN1376J24UabxJXPy4l6lCG4a3wt
 ubzVGNA9D6aDpdgcF4vMTtwBTKTvMB9dA2gvzRbgC1RTzm+9unlZC+q3t
 b8o4r9NbJghjciQ49cfHvBmMUATcG9gS54jRe/YF2FfZXGRaUcP00KhYF g==;
X-CSE-ConnectionGUID: 1MIRLEzOTuO+rU1ELkTNng==
X-CSE-MsgGUID: 3BjtKaCsQcmrhzlfAOeLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84472517"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="84472517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:01:33 -0800
X-CSE-ConnectionGUID: NPniASqkQ1+7YAxdBPn8Gw==
X-CSE-MsgGUID: RkaSUaNGQZuRgqMab50CqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="232309850"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:01:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:01:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 05:01:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:01:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8UnFMok5ccu3o/YriVvMOMrpcGIVMe+mYfV/71fEy4zOCYea1nWDM28M8fhZKmbpswRg5aKam+udD3WQCAHtk/FmumqKFvpRKW3bksKoFv4zPChcl/W1llTeWiDLYlahWzahSOE5QlEMTjGnkBo72JFrBHtTY/4+BC0eC35ra5J8kGyHa6H7VatSdJIDCMIvTGJtfzxy/W5mAOF3NQMmO/I8FrnXXOYaN6E6FSmsnHI29Ko2r+ZjTMhCsOMpoM5PzL2truZ77z4AEI41MF1Xj2zhFqEaPZ2f322JurqQBqQHzij6+uLjTkWWSesyS90Lywv76GjQRaU5i7zZr0XvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lipCgxfgtd5UZb/r4pIJRQHJG6BR2klhLD9yhLieyJk=;
 b=fgseZE7ySll/KBojQotW5VRKVeYsaGlDnU+eaNPPv3NcTyHjSWLX2nTKN3YXDSztUNuGLBAFU6G8YUF8j9AWgOuJBCjHv3Tk484PC44UMYX1H8eYNyps5eAOAIWfFHS6xg7FicQvS1+aRHcY4bcF+wt+S94bGQyplvl+6AumN6+n9Rsp5MVQbFmL3fgv4ABKW2oAc0ve7CJInAIzyVraoBQZ7WJejmAJykKbRT45yfHW1jdvjgUB4PRopaE1wJLWoT1saXDE2wQB7km1+Xbw0wAnDeTWzyJN2nUm2GLMBaGkRcEsKnmvTAYVBfboTmXzGLyZTnULaNT5hdQgKiRPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA4PR11MB9277.namprd11.prod.outlook.com (2603:10b6:208:55d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 13:01:17 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 13:01:17 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Anirban,
 Sk" <sk.anirban@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v5 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
Thread-Topic: [PATCH i-g-t v5 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
Thread-Index: AQHcX7VLISunJCPqOE2WMflyLowjVbURe0vA
Date: Thu, 4 Dec 2025 13:01:17 +0000
Message-ID: <CY5PR11MB6211A87AF28E3CB5C243996195A6A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20251127154807.2899369-1-karthik.poosa@intel.com>
 <20251127154807.2899369-3-karthik.poosa@intel.com>
In-Reply-To: <20251127154807.2899369-3-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA4PR11MB9277:EE_
x-ms-office365-filtering-correlation-id: 49fe00ca-c39c-4ffa-2345-08de3335367f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZyM11ePyr2ngT1sPtVN+1qHpFdltYatznVgtWIH34FRUMGrrzG4pa77LNCQ6?=
 =?us-ascii?Q?RejK7J58vGeG9MK/AQB/MbEyUNuFl55SgnZscE+0kaxJEjouke3oihbjB94Q?=
 =?us-ascii?Q?m6uB3polmihCA5XjIkiTXKtbYdtrTZGGTi/cCSqp9sNepfS0+xGPQiNxwrz2?=
 =?us-ascii?Q?4EnOvzExfOo6khNIbt2TEBMcRpiEq/DW8YeguMNb03DH/rhZMQvQT1gnF8Cv?=
 =?us-ascii?Q?N89VZ1sPMph/FPc6521y64U/d0seqqKoDV0VPSv3QTxDNp0m/W1U8Q4ivCHg?=
 =?us-ascii?Q?76P1dKdz+xWtQ8JODL9ydiiS7thn9hqFVik7Cby3a8Lu6dLMa6NykToAw5q/?=
 =?us-ascii?Q?NSY+JJqqC24nSF1mPr7QV9zsp445i3t9BnuT8GYeFERK7IZdQM8luO5A6+rf?=
 =?us-ascii?Q?VEDRx2l1LCU3+NT8K1EYLi1a1eRHit2szxHV+vpgHL+BB+bXTHbvyZhiPhOX?=
 =?us-ascii?Q?Cebw9VPut2BVmV9wDq2sa2R/6M0yEtD1LkxeVgUQ2Uoi4d5PaAqqOryhWwx+?=
 =?us-ascii?Q?hm6oq6s6EgRMn9J7WpiJRLRtjBaQZB5ShuUO4T+/XEB5Ojmi1UBjqGtluv5+?=
 =?us-ascii?Q?kzoFIAYEZEWgOrP7zY3d/2+j0LM3pMSMW6QAtFP1VT16e5aVSLusJwFlwHSG?=
 =?us-ascii?Q?iMfRqgvkwfPSAi88/QaNb3shnFzKt4Hf0uccUks6+urAA3ivd4cZX0lGi34O?=
 =?us-ascii?Q?p3ISovKZKeCG43eyaPAOLOzbq+9DGFtCFnY8AkDbm2jWfmsBTxFaMmcizF+p?=
 =?us-ascii?Q?DIWIyX1jFvVH+pmrKyxHkllYZ+/OSiYjdzflXA4ogNw4bGo/2AQj0qzviOH9?=
 =?us-ascii?Q?wDD1Azxkl5m+gjH5EEUgShm1DRIf2ox4/sDq7PIL6zY1wmXjSJg3FKnbMEh1?=
 =?us-ascii?Q?FVxH+3IJKDRXw7ll/aLjDcJpiNWzJZH9P92WKN435K3TFIXhbDs0deZFmrOj?=
 =?us-ascii?Q?V5eTGcISSo5ZK/9ugX6yW5zSTf3038YDaYp3niVTtoc8aGdSSqkCfDLBKjfM?=
 =?us-ascii?Q?BzOC95vyUVg7dTcOxFTQA2y3D7eccJzMW4QbucKOg0Euhofm6kkz2sGa9z/d?=
 =?us-ascii?Q?SgBi7lYLvQQgkmA3RYpCsDQZUoolMnTH+YuTB1wYkX+xwhNpwA56E69eTnZW?=
 =?us-ascii?Q?m9j+ZiFIPoECZN0HUSRre6NLp4XQAld5xh1hGr9rhCWJlavXHBTEmKPVYmDF?=
 =?us-ascii?Q?N8YoNwEnvL9ozBBN9IqSKZx/rWgdgeOQCDvG0vyL4ar3Y8IPXZZaXNVD5qmw?=
 =?us-ascii?Q?IOCsBa3+PwyWLE8+kH+fak7UvoHTMgPnrgb9VICKw76SDAVll7Y4/d1ArkkV?=
 =?us-ascii?Q?xFW4Pa2tvytDX/N2QBdFr0V+nIq+f2crkugb52PtTNs4nPwtk0vRt/5C+/Ph?=
 =?us-ascii?Q?xSasAL5QrFRV5RtmJ1dk+gQ8ZR1n3+bwu2ROqCxqVY1T+oYU8QVErg3DTdXa?=
 =?us-ascii?Q?QKuV6BcA7xT7DFyFfu8Px78Gn4mvLu0oGZKZoaxMwJk5t9sgOWJkHzYDU2kA?=
 =?us-ascii?Q?fd/AQtheDOWZGeRmGyIfDKqWGKbRnS//7XnP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Edv3EtuGjFqfOFP+IJieC3LTrXG7TzeWKtosqDtGt/FLepbchG7fbnDutimO?=
 =?us-ascii?Q?tU0NUT3E8Icxm+DfOt4cHMkbmIpL9Ej/OFEjYqg3P7qyAm0xaMeafGoDH0qp?=
 =?us-ascii?Q?+mHkzefN2m+Mmpg8KONx22lwJPEuhI4QAZ5LqjcI4Xj5YL8jo6M+Ohc612gU?=
 =?us-ascii?Q?0wcdNcOH7qWp/71Wj6B8IpGiMJfLj5jXCBCTh40zSzAZRs1DgPbgahaef+x3?=
 =?us-ascii?Q?3KBE/TAYbMj6Wa/M4lQVWC7qEl5H2gWX49rKNucq1IV4wC56UVTFwWPalje7?=
 =?us-ascii?Q?xs0Kf61+831cuiDWDijK+2yIU4t/h/KCzAh+rIyv9Sb2lEJrHHy/pcklkCTV?=
 =?us-ascii?Q?YoomFprqDWhkKn9ySckHLCnCzx18e1C2NOgwdbErvEwNWGa+dOZIdCiZECHh?=
 =?us-ascii?Q?S75IxVbpQqOQO+huE9E6zVKr9EN8wc3aoKVd+i6rw+Qlz4IdzLNt4JE7yvd+?=
 =?us-ascii?Q?igRDK/gZacm4njuMJvtqd6St7JKxaAfGN63NRI7EEvMZiL94qJa/nR9aLjJM?=
 =?us-ascii?Q?fpDMcOmaJ3/p3uav/GMHg1eZmW3VesvsVyPe7t2oLkq+nKCYMdYbIevn3ujb?=
 =?us-ascii?Q?tGLASs4Xq89SepLw27qmm1VM+CN1GipYQcFHcDeWEVTtv3ZfICFtPYvLMd5Q?=
 =?us-ascii?Q?8q5yzjtCmnHwhwYJrgE+sJcpgsfAqJgCTc71cms7WxjyWqHHglyh3QpnFkTL?=
 =?us-ascii?Q?sd8/L6wpziswcT7oIkNZYxvxNsxvC1T2ewsyJSVOPy+LNOlKDMYWz1vdeXCu?=
 =?us-ascii?Q?QwFlhvRirVRDHzZ4ecwN7dbtHkBe1ukgUr6Mevv/Iwqp5aD79xSJTnaG7Xga?=
 =?us-ascii?Q?+WKUvPmvohAyepo4z78SUNMq05XXrlmQb8/BLuVC9Z7SwCgnBJ2mnkSavmgj?=
 =?us-ascii?Q?LGnqsqXi58YKvXnGtmIjPPjps92tZ+mNPjQLDCW1dzBlYJ1bEbhTRIz4qW8M?=
 =?us-ascii?Q?4bw1tvgpk/GaM77zmwO78qSrFCnp3GDtW0LCOwxGlAG4DI5X9jvd8yfIGuQc?=
 =?us-ascii?Q?bWDFSjO5x/nmSGgE2cXc0CSZffTq+fm8m7NGQjWUcBgNgn9diRrMJYydiuIt?=
 =?us-ascii?Q?FfE2uFGyY5mEo8/9scl7mx0l/d3BsgHwII5pJTs17YLH2SiNXD012dX87FuM?=
 =?us-ascii?Q?QtEUM50BSIqIW4XW+ViMCc/p5tjl0X4tSlmOPlQBTMRR+vEGxxGQxylF/A/k?=
 =?us-ascii?Q?4wm/bw4YOCn8+z1y39BP7GxpVLaEj4RzU4L+69ui7TTfAutgXkABic2hJMIG?=
 =?us-ascii?Q?m+VLC8w8uPCRdduDb3WIJHrq3FAo8DK2P8tIRKYI7ap+vT3J3QX6rVlrJkn2?=
 =?us-ascii?Q?UnXh/JJobrsK9dunhEJsUhGvto2jB1n/q6JEq2JtXhKjqOxy4+GEJW6KLbpP?=
 =?us-ascii?Q?tsrFRnAl/QKCZE5sCb/ewlYzHmZdRrEQ3M3tQ6ozmCEcsFpNoNhcldd8Wsv2?=
 =?us-ascii?Q?UNpSBGCZOxNKHqwdn33V73gFer59MR/9XYjwsNgyPvg6eOC4vkKDXeQE1BMN?=
 =?us-ascii?Q?wXqJqxKsHY7CnD9lELXWR0pC472lqkQIFWZZqsqk7ng3nTW3ZpCBdUuXIDzp?=
 =?us-ascii?Q?TtPjaa2kG9iwCJTfK7R6AEgR1/Ob1U52chnu9MiP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fe00ca-c39c-4ffa-2345-08de3335367f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 13:01:17.3666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxAU/e8iJq3i57VPPVPRxYD85d/2gTEOg9bDv+dA0F0cMQAOWaGN81uBLXYT38MwmtD7S0rCi5DH942cWqdnHGYhfTUtSVYeI5vPdprf/nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9277
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, November 27, 2025 9:18 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Anirban, Sk <sk.anirban@intel.com>;
> kamil.konieczny@linux.intel.com; Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t v5 2/2] tests/intel/xe_pm_residency: Add subtest fo=
r
> ASPM Link state residency
>=20
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices =
are in
> a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residenc=
ies to
> verify this.
>=20
> v2:
>  - Add dedicated function to get pcie endpoint upstream port. (Badal)
>  - Read residency counter as unsigned long long int instead of
>    unsigned long int.
>  - Print residency counter before sleep also.
>  - Don't assert if sysfs not corresponding to aspm_link_state
>    is not present. (Badal)
>  - Run workload before validation of aspm link residency. (Anshuman)
>=20
> v3:
>  - Move igt_device_get_pci_usp to separate patch. (Kamil)
>  - Move reading of residency to separate function. (Badal)
>=20
> v4:
>  - Add description about PCIe ASPM in commit message and code. (Kamil)
>  - Add a NULL check for the return value of igt_device_get_pci_usp().
>  - Resolve compilation warnings about using variable as format string
>    to sscanf.
>=20
> v5:
>  - Use igt_device_get_pci_upstream_port() which is the renamed version
>    of igt_device_get_pci_usp().
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 160 ++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  mode change 100644 =3D> 100755 tests/intel/xe_pm_residency.c
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c old
> mode 100644 new mode 100755 index 1749d6467..36c120a97
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>  	TEST_IDLE,
>  };
>=20
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs [] =3D {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>  /**
>   * SUBTEST: gt-c6-on-idle
>   * Description: Validate GT C6 state on idle @@ -64,6 +85,10 @@ enum
> test_type {
>   * SUBTEST: cpg-gt-toggle
>   * Description: Toggle GT coarse power gating states by acquiring/releas=
ing
>   *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management)
> + link states
> + * entry while device is in D0.
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>=20
> @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct
> drm_xe_engine_class_instance *
>  	munmap(done, 4096);
>  }
>=20
> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe) {
> +	unsigned long *done;
> +
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe-
> >engine_instance);
> +	done =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> +	igt_assert(done !=3D MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	*done =3D 1;
> +	igt_waitchildren();
> +	munmap(done, 4096);
> +}
> +
>  static void measure_power(struct igt_power *gpu, double *power)  {
>  	struct power_sample power_sample[2];
> @@ -370,6 +413,109 @@ static void cpg_gt_toggle(int fd)
>  		powergate_status(fd, gt, "down");
>  }
>=20
> +
> +static bool check_link_residency_entry(int fd_xe, const char* filename,
> +uint8_t aspm_link_state) {
> +	int fd_debugfs_dir =3D 0;
> +	int ret =3D 0;
> +	char *ptr =3D NULL;
> +	char path[256] =3D {0}, buf[1024] =3D {0};
> +	uint64_t residency_pre =3D 0, residency_post =3D 0;
> +
> +	fd_debugfs_dir =3D igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >=3D 0);
> +
> +	ret =3D igt_debugfs_simple_read(fd_debugfs_dir, filename, buf,
> sizeof(buf));
> +	igt_assert_f(ret >=3D 0, "cannot read pre %s.\n", filename);
> +	ptr =3D strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
> +	igt_assert_f((ptr !=3D NULL), "cannot find residency string %s\n",
> link_state_sysfs[aspm_link_state].parse_str);
> +	if (ptr !=3D NULL) {
> +		sprintf(path, "%s%%llu",
> link_state_sysfs[aspm_link_state].parse_str);
> +		igt_debug("searching for-%s\n",
> link_state_sysfs[aspm_link_state].parse_str);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str),
> "%lu", &residency_pre);
> +		igt_info("Link residency before %"PRIu64"\n", residency_pre);
> +		igt_info("Waiting for link to enter idle....\n");
> +		sleep(5);
> +		ret =3D igt_debugfs_simple_read(fd_debugfs_dir, filename, buf,
> sizeof(buf));
> +		igt_assert_f(ret >=3D 0, "cannot read post %s.\n", filename);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str),
> "%lu", &residency_post);
> +	}
> +
> +	igt_info("Link residency after %"PRIu64"\n", residency_post);
> +	close(fd_debugfs_dir);
> +
> +	return (residency_post > residency_pre) ? true : false; }
> +
> +static void test_aspm_link_residency(int fd_xe, uint8_t
> +aspm_link_state) {
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp =3D 0;
> +	char name[PATH_MAX];
> +	int ret =3D 0;
> +	char path[256] =3D {0};
> +	bool aspm_entered =3D 0;
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev =3D igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev !=3D NULL, "Couldn't get pci device of upstream
> port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n",
> pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name),
> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev-
> >func);
> +	fd_pci_usp =3D open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >=3D 0), "Can't open link directory upstream
> +port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in
> D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not
> present\n", path);
> +	ret =3D igt_sysfs_scanf(fd_pci_usp, path, "%c",
> &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and enable on=
ly
> the one needed. */
> +	for (int i =3D 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to save\n", path);
> +			continue;
> +		}
> +		ret =3D igt_sysfs_scanf(fd_pci_usp, path, "%c",
> &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s =3D %c\n", link_state_sysfs[i].filename ,
> +link_state_sysfs[i].state);
> +
> +		if(i =3D=3D aspm_link_state) {
> +			igt_debug("Enabling %s\n",
> link_state_sysfs[i].filename);
> +			ret =3D igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +		}
> +		else {
> +			ret =3D igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		}
> +		igt_assert_lt(0, ret);
> +	}
> +
> +	aspm_entered =3D check_link_residency_entry(fd_xe,
> +"dgfx_pcie_link_residencies", aspm_link_state);
> +
> +	/* Restore states of L1 sysfs entries. */
> +	for (int i =3D 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to restore\n", path);
> +			continue;
> +		}
> +		ret =3D igt_sysfs_printf(fd_pci_usp, path, "%c",
> link_state_sysfs[i].state);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename ,
> link_state_sysfs[i].state);
> +	}
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +	igt_assert_f(aspm_entered , "ASPM Link idle entry failed!\n"); }
> +
>  igt_main
>  {
>  	uint32_t d3cold_allowed;
> @@ -444,6 +590,20 @@ igt_main
>  		cpg_gt_toggle(fd);
>  	}
>=20
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt =3D=3D hwe->gt_id && !hwe-
> >engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +
> xe_engine_class_string(hwe->engine_class))
> +						do_exec(fd, hwe);
This pretty basic stuff workload completed, and link will be idle.
We will be needing a one more during workload execution give opportunity fo=
r link to be idle.
After the test, the link state residencies. Let's plan this for a different=
 test.
Thanks,
Anshuman.
=20
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> --
> 2.25.1

