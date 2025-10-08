Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FD9CCD184
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 22:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABD810E0D3;
	Wed,  8 Oct 2025 22:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHOCfpR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D71010E0D3
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759961242; x=1791497242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=shmAI29WzlAswDwvUrUJzMtX8Y79y+60cx8X1r5CNTk=;
 b=BHOCfpR2xV4qGkfTx9xc0IXVC9Q+IOHUSBkIZyrJ9vWRDKe3Mr5SkhrX
 pJvEa7d4LweRnmmI19Q3ZqpUDphLo505SKd/5WiJgIsM/huVY99SKUcdg
 X6NsyVkEJfu0qGAIsLZmZD1dwGkGtu300jxPN+fkwIpGKM/Bb9isxP9R3
 NgE6M+kIJ29vvkug91mzn7MWQDMwTuW4CvR9ShR4x7bpX5HG4k9A09gG3
 yhg1AnYyHwzujGk6W87nRj7bh6P1xS6eCZ+km83UxkTIJ6kE0WX+RLdiR
 54mxMa4UMNw0gFbCEMMkafKBXI2fw8w1hmDaVTA4HQp30Zxzk/fNJl/6g g==;
X-CSE-ConnectionGUID: dAvrM2AOTgO+bhwVPwx8wQ==
X-CSE-MsgGUID: sUACr2PLRQ6sfpkR1V0xtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61202671"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61202671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:07:06 -0700
X-CSE-ConnectionGUID: Zqsxg55rQAaM/n5ocWcapg==
X-CSE-MsgGUID: /pb7cQqXSBGSDY1pdq/q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="181309402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:07:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:07:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:07:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSanVETF26DbL9RhvpaPEdTpDk0J/jpQxHNQJ23Tbt+EANYXvh7BDjXTArVpWEyFm/KCHSRgPkDfdew6khezgc6gA26VCSi+GAGQsLvruNEPS5ui8Xy2LsCABEcnGLtEdL4wsU+wfseHQm4ZaCl3M9fY0WK+JHfj7nTTmvlTCrfaB4hNW3E+oaaBrGP9Be7myt+FHK232XzFwQ4iofz+UEZF8jGe2dHrZxVoIvGNs+k0jv4qN/WHnNOLfMUl9cA/L0X7QjOdqI7IT8mW1iE9UUahW+5qpvuOOI+9tvwyDBONzjwQ4qSvHBdEwrljFp2H3LzSRCcW03LdTiBYOurZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5naCcnYpatkIrZZ6s8wfQ2eVkh4+OPCbhMkufN4Ojs=;
 b=QKE2io9fAsW235Eb4ruFfZXJZfZLPyRvIsnykHYwa1cDi+ZfBrM3KqRgIO3kTLK47+IJWXjfqQDNiw4rqIb2UzXRt0+XvG2bcTYqZ/R21Yq2ZGAJUzo2/WSNyKrsaWCTUz84iKFSeogSS/HK1W614eFkJVrxXjxzcurBV8yCCgLV5IidD43l+mRpskfg2qpS81EXVHutM6CYq/HQVC9iSgSfY7qInJ68yEO7nd7WjUHUVL2AXsmuHCEzmWDdlUPPjH9TiMkvlUUtKUUIjAI77gLVTEc1w6Yqutjyh0bm8cWpaUNM4lBv/J02nfD7j0sM9Avf2Kid4NAd9WErTy8V4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 22:07:02 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:07:02 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Goyal,
 Nakshtra" <nakshtra.goyal@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Topic: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Index: AQHcOJb97R/Xi/pb/UyJWUlMNBi13rS4wXHw
Date: Wed, 8 Oct 2025 22:07:02 +0000
Message-ID: <DM4PR11MB5456F59526B8FDA217CDBADBEAE1A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
In-Reply-To: <20251008210236.396859-2-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY5PR11MB6092:EE_
x-ms-office365-filtering-correlation-id: ae2b52ee-7413-430f-f065-08de06b70263
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Wooem1PZIUg8J+9Jrz/QWXvYe6Opu0Of4N4oFcS4p0CekJRg83utP0fU0v3k?=
 =?us-ascii?Q?EmYLWkyYi0YjOZYA2ED0hWntqBSqRGdxRE/bhJzXFO+0iB4IpWdxppufli9Q?=
 =?us-ascii?Q?GDt+JffsKxfqMVcnYah/WIa27IcPCfzsJfMwSpcXM3uhxNfk6ruC1UOo4fnT?=
 =?us-ascii?Q?dwpxJg3jPH9b6JfqYIYEQwoKVxa4GVTw4DBguHwbiwRtMLWUKd04v78oSePz?=
 =?us-ascii?Q?elqvebwmDMZujmnaxIjrHpwq5qHetDIFfosqavUI45sYq8snAxTkjMLAv49E?=
 =?us-ascii?Q?UONidwSPOQNlsz8Kxf3MAYd/USDRaEgWcCRQOPxWcsMgOs8VuoPFQ9Udoc1L?=
 =?us-ascii?Q?Gv1ypLJspKqDia1MOVKhSGzZl3frp7ZjFKx7+hV0lPTsVOKDLuS/Io9PrLjQ?=
 =?us-ascii?Q?LsSad+9t96lVZBkb7Ez35m98tZSDTuRzWK2FtT8W7O89akKFAj/nyUM8U1B4?=
 =?us-ascii?Q?iV25IGoy56h7jusPuwea7iPZ74PLDF6Y40mcisVmecJQhHqkrxfMSMgBcaAi?=
 =?us-ascii?Q?WBa6hCfHgTo2LxVJgUeCIHrhoH2sAQDcKNaJjph0PCQM/L4isRzyVxekISxb?=
 =?us-ascii?Q?qEs95BTMeV1rld37y704Vqi9n1yuHB4Zv+fLJSjSUklXV1VHBGL0/CU+Ffoo?=
 =?us-ascii?Q?/G9YlMp+3xF///yl/IeDmJT/3rPvUHNBQ4NyJbZGdxTl02fwVOOQLrtPFJq5?=
 =?us-ascii?Q?iDbOquUOPVgNRZPsad4tNWHc+R0c2k2N7cEljrNLIjLaA0WFi59blqBaJT/v?=
 =?us-ascii?Q?F5RcNKQSKwxpab5H+/tdnUa6e+O2tcNa/BBRHYmYdmofD1ZPFeKkw7iJ3alA?=
 =?us-ascii?Q?s0/VF0NrceGO26ZjTRLmUZHh8n1ITyRNis7Vz1Bok1/tHxlxO4H2o9+zd3Z6?=
 =?us-ascii?Q?ithXvU+Ex/uHq4Dfsl0gx832U0Zu8hL116c+/6XmP9ekO36moQpG2Y0BMW6u?=
 =?us-ascii?Q?lIBCV5xvuRFB6WOCG1OeLdFxUgpU/TI84L3WWsqjXajaQA7wKSU3Y5DpOkVa?=
 =?us-ascii?Q?kog3eaB/jM4hDbcB1VbS2YlQYJ/Ds1N/juUiZEG3rgCSZbL5loHzlZP4fZGr?=
 =?us-ascii?Q?BbPyUnWNyRrimfeFxAjCIIld0ChNeM6pYQA7SNcMtlE6kEh0z9M0pNSPqfg6?=
 =?us-ascii?Q?4KsKPZt/QJ1c/VxdSwxrwTWBubwf/Q/JCMGzpJ5t6C7PuRhZXQSmYV9wS3a0?=
 =?us-ascii?Q?rMnr944vVTp+2zw8cTkqzl0NDoHNUdlKbV+t3rMxo4XUKWJ94fZdb/ByNQXi?=
 =?us-ascii?Q?uY45V+dVcJnDCHmvcx3e/d1mu909EIy8202XKigl/+9xGbPqkN99urp6bIaP?=
 =?us-ascii?Q?A9ISJtHQH9ofoysm0FmAWeE1R95D/DfMGKw6GDr1M1MV2WDrC+AiuFOfCGOd?=
 =?us-ascii?Q?S+sKmhZu15r8u2iNX4KxMZFbIhL0FDka2lhSCuV+J/WP+Oc/wkoQyOa1PD1W?=
 =?us-ascii?Q?alvzwVSRduzRqE1gkfQ07wNnNSd+GDh+18IyE3IaaDRj0GyHnNDW0A1V15rc?=
 =?us-ascii?Q?GTTNIqe8Nds4q72mg0DDnZBJ2vWJOWQIOWSX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6INVA1dipbip93To+euU54qV6t5vcMkC8UlC9xVGB8cbBNWrbe94u1vtDO3i?=
 =?us-ascii?Q?a21lC6vHkW0EYfJrEqxlLpyi63OFq271QHUUR0yGzYwiwn+wQPrz5G25ouQ5?=
 =?us-ascii?Q?XtyQ/OeqvFEmhxCRxvkPdRvKAwwtBkWrcrfEk0lH/xuvDbFzbXnwEPPkWsvA?=
 =?us-ascii?Q?+xlrzQuctkIZ1lOFJ/K7pkOGxQzhCcIa4tOQaRLMNYktCMgMsR7LvYTCgHiI?=
 =?us-ascii?Q?eHylR9ZeowLXXiXL0XOY1IexMdQ/04uE5KrtA8/Mdpc8QJDDWi2eHRbpTcow?=
 =?us-ascii?Q?0VtOhTdHfRdjjASK1pcdIfy1qjGGRNoE+Tu9XhamW4cTFgKsYD5TYwNRrXks?=
 =?us-ascii?Q?7JS5RrUpxcMMYq72VI48RG+punvBKDSLLuKgyiho6fNRi7wzjsrSgBYJ7J2f?=
 =?us-ascii?Q?R7HjcgrxPhbGXaBTu0RCDKcUnHNz9x3dABTlLBEIzus3lPkfPE69y8KhyOtJ?=
 =?us-ascii?Q?LePozY97kC++y2YN/ESIJCNeZSMG6vMvo5yJ07E8aC0fZfncxazao3Jc5ZPh?=
 =?us-ascii?Q?ndgjFgWneKRKEhWGiZch0EZPmf+WjsoLVD+7hOKiM4CeFbTASwJunpbldsAy?=
 =?us-ascii?Q?0s+CRmumhMdxHbisEW3CkzTuFQH6+Pl49S3dmj3foNMmVntdcYVsmgvqHyRa?=
 =?us-ascii?Q?ZAviPo66GPt1dnykGc/rLw3RKP0GaaUbUdBLaYI4eoSvnKyF3KsrHgUxPPM3?=
 =?us-ascii?Q?y3zSYc/BxS58DqHbDJujJFBdb+J+ahdEPvLPAL0iSJIhZy3X9A5yJun654Ah?=
 =?us-ascii?Q?+5IrCHKIDtu8v26zOjukiFRPkELXNvp622O0y0rfOTI8PdFtAFXnEmATr8SP?=
 =?us-ascii?Q?UdUxtrG0gUSVu15NCyfmj7W5wv0EHQcuFADj5PQx58f+MIFrISeOkgAVpAnK?=
 =?us-ascii?Q?R89rPShjCd1dFVOnKAU/vidkkI5Z3Ik1hfbDfZpRA44PXfIM0+/BceLLNk4S?=
 =?us-ascii?Q?pUQR3L3RgeeZ6Bo0kbPF6xwyPdbfi8Cl04PzWr/FW7kL6fT5t/Yi5e1fAcr4?=
 =?us-ascii?Q?IGAxx5o8F246+IG6lqXjttIkvkmqhCAc26yEvRVGg3BSpDAhw+zCLcHtLFqS?=
 =?us-ascii?Q?dprdQE+PPNxywN6xoERwsFOr38zaeExisPiXjiEnnNheu0jrR7m5g3xyUqog?=
 =?us-ascii?Q?hfj18pDwenx1Tf+EsWwT9EPyB5cBV+HLWz6eIXvpw8EJeJqi1/jY2dBccMSQ?=
 =?us-ascii?Q?pQNZ9pG7wBI36u7goEomgA9IJwYiPvcmF63E57qfVyQJxKoZyt4d9GQ8Kixz?=
 =?us-ascii?Q?DbE08sucj2eqi+3zMqgtrBIPiVfuz3L1IqRn5VSxnoIojZOyMqPPrqqhFwpZ?=
 =?us-ascii?Q?v/po3c9wsF+aUyI+WHYIoZ2HwxnfZOrjuZYQ4kLMHcDqTM/mkw0h4hxLnpXc?=
 =?us-ascii?Q?ZbGyoZF1Y/JQi9be+oIr5ea39/MGaJNgeUnotoLbqNOxymZ7XnfrpdCdFhRP?=
 =?us-ascii?Q?YHHnaWg9IjYmjUN/K915gJ7Jk1kl6wwNRFlZomAz8X0YGlXLz9+BE0LLGtIY?=
 =?us-ascii?Q?TV+ZUZMuczZdwwUjRnnLxod5E6nAsxRAVopaAF+mUfjjJ5ppneoTHPKI3xtD?=
 =?us-ascii?Q?wrkLU2JIvWxWwEkwF1a5UbEdJ3R6MHbcGaMiNr2e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2b52ee-7413-430f-f065-08de06b70263
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 22:07:02.1607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vj3PLvvmKvC4Dp+f+lMEQ7Dfi6EdGFbr+4LuRSTTKXeu5VkxGLAdbj64ZBj7i7s7Z4NSIEBwUYJofIkaNhVQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Wed, Oct 8, 2025 2:03 PM X Wang wrote:
> Introduce new APIs to query device information at runtime for xe devices:
> - intel_query_gen(int fd): Get graphics generation
> - intel_query_graphics_ver(int fd): Get combined graphics version
> - intel_query_device_info(int fd): Get device info structure
>=20
> For xe devices, graphics versions (both major and minor) can be accuratel=
y
> determined by retrieving GMD_ID via IOCTL, rather than relying on static
> intel_device_match table. Different device instances of the same type may
> have different graphics_rel (minor version) values.
>=20
> Implementation details:
> - xe_device struct now includes intel_device_info for compatibility
> - graphics_rel is populated from GMD_ID's ip_ver_minor at runtime
> - For non-GMD_ID platforms (ip_ver_major =3D=3D 0), hardcoded values are
> preserved
> - New APIs fall back to traditional devid-based lookup for i915 devices
>=20
> This infrastructure enables accurate device capability detection and avoi=
ds
> issues when adding new device IDs with varying graphics_rel values.
>=20
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_chipset.c | 63
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_chipset.h |  3 +++
>  lib/xe/xe_query.c   | 19 ++++++++++++++
>  lib/xe/xe_query.h   |  3 +++
>  4 files changed, 88 insertions(+)
>=20
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c index 760faede2..8=
90b1e3fa
> 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -189,3 +189,66 @@ intel_check_pch(void)
>  		return;
>  	}
>  }
> +
> +/**
> + * intel_query_device_info:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns device information structure for device @fd. For i915
> +devices,
> + * falls back to i915 device info lookup. This function caches the
> +result
> + * per file descriptor for performance.
> + */
> +const struct intel_device_info *intel_query_device_info(int fd) {
> +	static __thread int cached_fd =3D -1;
> +	static __thread const struct intel_device_info *cached_info;
> +	struct xe_device *xe_dev;
> +
> +	if (cached_fd =3D=3D fd)
> +		goto out;
> +
> +	if (is_i915_device(fd)) {
> +		cached_info =3D intel_get_device_info(intel_get_drm_devid(fd));
> +	} else {
> +		xe_dev =3D xe_device_get(fd);
> +		if (!xe_dev)
> +			return NULL;

This function may return NULL. But I see some caller does not handle the NU=
LL case.
Should NULL be allowed? If yes, you need check NULL for each caller.
If not, please add an assert here if xe_dev is NULL.

Shuicheng

> +		cached_info =3D &xe_dev->info;
> +	}
> +
> +	cached_fd =3D fd;
> +
> +out:
> +	return cached_info;

Maybe add an assert to check cached_info is not NULL here also.

Shuicheng

> +}
> +
> +/**
> + * intel_query_gen:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns gen IP version for device @fd. For i915 devices,
> + * falls back to i915 graphics version lookup.
> + */
> +unsigned intel_query_gen(int fd)
> +{
> +	const struct intel_device_info *info =3D intel_query_device_info(fd);
> +
> +	return info ? info->graphics_ver : 0;
> +}
> +
> +/**
> + * intel_query_graphics_ver:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns graphics IP version for device @fd. For i915 devices,
> + * falls back to i915 graphics version lookup.
> + */
> +unsigned intel_query_graphics_ver(int fd) {
> +	const struct intel_device_info *info =3D intel_query_device_info(fd);
> +
> +	if (!info)
> +		return 0;
> +
> +	return IP_VER(info->graphics_ver, info->graphics_rel); }
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h index
> 2f6bf788a..8f3ea0ce5 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -104,6 +104,9 @@ const struct intel_cmds_info
> *intel_get_cmds_info(uint16_t devid) __attribute__(  unsigned
> intel_gen(uint16_t devid) __attribute__((pure));  unsigned
> intel_graphics_ver(uint16_t devid) __attribute__((pure));  unsigned
> intel_display_ver(uint16_t devid) __attribute__((pure));
> +const struct intel_device_info *intel_query_device_info(int fd);
> +unsigned intel_query_gen(int fd); unsigned intel_query_graphics_ver(int
> +fd);
>=20
>  extern enum pch_type intel_pch;
>=20
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index a89e0b980..3caee=
cf20
> 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -20,6 +20,7 @@
>=20
>  #include "drmtest.h"
>  #include "ioctl_wrappers.h"
> +#include "igt_core.h"
>  #include "igt_map.h"
>=20
>  #include "xe_query.h"
> @@ -375,10 +376,28 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->dev_id =3D xe_dev->config-
> >info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
>  	xe_dev->gt_list =3D xe_query_gt_list_new(fd);
>=20
> +	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id),
> +sizeof(xe_dev->info));
> +
>  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].gt_id);
>=20
> +	/*
> +	* Set graphics_rel based on the main GT's ip_ver_minor. We should
> +	* use the hardcoded value for the none GMD_ID (ip_ver_major =3D=3D 0)
> +	* platforms (e.g. DG2,ADL,ATSM)
> +	*/
> +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		if (xe_dev->gt_list->gt_list[gt].type =3D=3D
> DRM_XE_QUERY_GT_TYPE_MAIN &&
> +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> +			igt_debug("Setting graphics_ver to %u and
> graphics_rel to %u\n",
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> +			igt_assert(xe_dev->info.graphics_ver =3D=3D xe_dev-
> >gt_list->gt_list[gt].ip_ver_major);
> +			xe_dev->info.graphics_rel =3D xe_dev->gt_list-
> >gt_list[gt].ip_ver_minor;
> +			break;
> +		}
> +
>  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->tile_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].tile_id);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index 715b64e2f..eefeb=
47dc
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -74,6 +74,9 @@ struct xe_device {
>=20
>  	/** @dev_id: Device id of xe device */
>  	uint16_t dev_id;
> +
> +	/** @info: Device information for compatibility with i915 */
> +	struct intel_device_info info;
>  };
>=20
>  #define xe_for_each_engine(__fd, __hwe) \
> --
> 2.43.0

