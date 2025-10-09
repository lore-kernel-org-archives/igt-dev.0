Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEED5CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 18:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A873F10EADD;
	Thu,  9 Oct 2025 18:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itIKSE2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0AE10EADD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760032861; x=1791568861;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bYjF6Wux3LP0AopytJz8UCpezD9CdSaf3p7Ppyk/nBE=;
 b=itIKSE2WiGgfouIsmwvv5vvHHyPLX6PgTF4ghyUQdOAIZ/83GG7ADCnu
 385hYKGdYsUsxuDv/fw1HyAqjCPt+iiPxEMdxx0YVfQgeMDcz6MRsmINe
 /BPWkfTSAkmdDHyNfXr5SSDqrLxPnkNlYCsuSOjUHNp6FjMovW0MYlh3z
 VMhZMFxTrIQnzAbsopUrxTD3G/PbiQmrnHw8mWo02zjQQM4kQLTo5Y99V
 kmvVaf2U04bM3LH7+qMmcj0s7UY5mnlW+/r2EDRxUyqcYzbTSdV9CgdtS
 6sF4Lm5YNfhv1CsUfbvYegJJ8spqLZu5zcxNoXIY3deWn5nK9P+m8SJmf A==;
X-CSE-ConnectionGUID: IWtwo6mIQpCKAU1TPAFPXA==
X-CSE-MsgGUID: 6XkglcEMRrm+qHzpJDI5/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64873614"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="64873614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:01:01 -0700
X-CSE-ConnectionGUID: g/tqewklSa2O6VjVz84/Qw==
X-CSE-MsgGUID: GTl17d3sS0K4QziUORd0zQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:01:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:01:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 11:01:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:00:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBODWX94C+dwWaBtlwYyVOzc17x9mnlMS/MerXsbOhM2mYDfM3msuJHyoOXw6QHABJaUCGX8nYhI0CqN9qcmMgSmuj/OUngcwXsEEhzmpuqfSCdPm0iUihpicWOalNHzqlyXJtuX674MRkno8iSvefRSHyT8G8yN6WozDBqaK4Fdp6rhZYQGAipnwgKJsC0RSpohJV9Srq3Vggxr8vfMwjxE4rpKQwRyINBFIusem3FfYGFZTqwd+G5l4ajlm32FXaSqk+qlVvHmRS6WGmEuPx1IeurVAcgo+GIkp2ogCEsYZGH3UA1k6nXCyepuVJ70MLrbC/p+mXRgQfLIbYEmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tFyp1IC4dzEqVgQL3ITupBbuqZidf/ccwUCfK1qYHQ=;
 b=GoMiX0I3qszIqgWzt/u3fyn7echAlk1LqlTzU9lNN6bPGD0/rW3JGrp04dEZuXpD13KzKhCricSmIHYjA/FGTR9HQMxeErYH0Cs/nK4ySGqt8/PoMD2F+L6mRqvFc7I0GqaxYh9IAvr1NGFLCcg47rBzkZoik+nHCQDGmtpbVxthO3ayZrq4H21DdOdFm+lr57z06P38rK4KJ5lDOwzVtc8s9xDHwXiSQEx8GPTCrU56iQjnEOrQsnWbpYpHqiuqNSvVYCZ7385WS8JA7rKaLTyJrIIZWL8pUaxKKpcUfNU/5c+DE1+QnV5gBcqsbQzlG0iJt2tLRRak7wQrk+Ih6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 18:00:57 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 18:00:57 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Goyal,
 Nakshtra" <nakshtra.goyal@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Topic: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Index: AQHcOJb96lf1XPb0XEKrmVpgjMaPKLS4zQ0AgAFDtaA=
Date: Thu, 9 Oct 2025 18:00:57 +0000
Message-ID: <SA3PR11MB8046071C5781D386651043FC86EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
 <20251008220136.GC1207432@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251008220136.GC1207432@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB7964:EE_
x-ms-office365-filtering-correlation-id: 04203f90-6cc7-4bb5-268a-08de075dcc65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lCRJsj6DR9qnFAfIGA2VMbPjLD3n6J0MHqhcqjXk1PJlPjAciZOtHqtpKgVs?=
 =?us-ascii?Q?DtVICLIjODJnLxyqMDqnpgTvNMaEAhjPzCKa30GzMihNOPtV8l0NBA3mtWV/?=
 =?us-ascii?Q?amqt7y9P2pr+5s+n7XnYg49FPxTEt2ihjlrRPg0AzwB8+3Y9eCF+T8pQ2Rkc?=
 =?us-ascii?Q?DCLeBgFHv6v53J6duqL0JSBThCTUsU31Vocbhxhn5VNsWtwp8ARwuNgGRL/T?=
 =?us-ascii?Q?0o1aRTh1V8Wnumjt8rW83N3ao/e/C2qrwF1nircA328zDwrTHgKxpO43F63E?=
 =?us-ascii?Q?5r4ZWwa4i6HTDukUBQlVgFNecG0msj6O8pCRJDAv5u9XoDvuKuENTpWeb7Di?=
 =?us-ascii?Q?WuTEdAbqJINOX2ifcQ2V5V4grQwYJIL5+UVlcimqVA+8ojzwlPabRHHufMpC?=
 =?us-ascii?Q?vV1oFzmHyex2weR04cmPYGytqNQv1Z7XYkrsX/0AkV+5DeArziGkbOcZSFSM?=
 =?us-ascii?Q?pAC33Zc+9m8yAxq4tG4QBbTc2XaYI4i5IAeNL66vAtn5AQgevXhz44rClvUa?=
 =?us-ascii?Q?AuAm6v75JdjMBj+pPVBZI7yL30kI6V7JN/1aH0Lhc86VZmWlzRKB7TdYRw63?=
 =?us-ascii?Q?YxdWljEIJhLSZJWtgJRb4Z2gn7kDDWY1v9vF3WO+iffx9WI4/lGc32UIKz1F?=
 =?us-ascii?Q?d6Fx1GqbWA5Bgo56XZyNpU9e886yc1xiurPSYToXVVyl6V7yR26MHPXDzblK?=
 =?us-ascii?Q?BYQCQn/k3mCIPIs3aLt2dRW4XQ2WEpONCO/8cAg7DkGkXAXh8wpTnhCOyv5b?=
 =?us-ascii?Q?ykvSgZy07OCQUMdGilrDwc3EFyuWPIWsP9DzlYBvJPgqg8m4XynNBVRPRu3+?=
 =?us-ascii?Q?17Uhj/N1fPMb/KQKDJvMLoLrOa4OD4tWAFeAhHgoMr5EyCTEGeag8aLajOSv?=
 =?us-ascii?Q?um0TwU9ZJqFUPGlT5FnJxiux4NurDPxGhuk8RBj8b1uCPXb32XUR/CnRteGT?=
 =?us-ascii?Q?7qSJVs6NHQW1j55e9iyH+A7MnI+umezFl1E9u6IblrDTiRaGyoRS+euXjNcp?=
 =?us-ascii?Q?meO6aAAcarBzQp53WW7lGgBvwZ3yHKBRBbQJYa2nvuXvwLosU6/OHVrF5zPz?=
 =?us-ascii?Q?+qlDFmRwCVkq37j24ORjDW8EPbq/IKK68wKVeCcvWuI/mcAlhuuwglVWi0Tn?=
 =?us-ascii?Q?YS/i3nxNLOtNWAJfk2Oa/vRLmHzoBPeH8FjdZdsXYAucEmZ1BHwMaMz1ETjo?=
 =?us-ascii?Q?v7NwmOdHcv+lSvHw/YKIIOBPiBhe/1AwSq+faatUaH/E43+FkNJS5zaB5gSV?=
 =?us-ascii?Q?B4XoZbJmxZM0R7EKvzGYx5e35IpmHRC1lpfO6l86kpKNkGZUdkNbhq+oo4ao?=
 =?us-ascii?Q?phbcfKdbbUppmwL5vVmZ3YajPABXsKcYlcbDhZaqO7oLw+2Mr6SdO7QnP+OM?=
 =?us-ascii?Q?PTJfWIvAQVA0UDXeMFWrmlTLs8hAsP+pPmh9vPOXGaj+DLoWJh9Eq1MmNl5f?=
 =?us-ascii?Q?f/X74XuFIVB9LoyfC2d5MDtl3vh9Sa5Vz7NQqyCdmIjJF0iIogGdpogV3SoP?=
 =?us-ascii?Q?e2VRVFBhySipdAPlgC4V6L+WNnO3pGfxmMSq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gu3h1nQ8uGla7IshbJgCLRxqLLyFBBO6MRFtugUV7clu7xfm6ZBuAiLdq4kb?=
 =?us-ascii?Q?UFaYV7YVwNEK2SnfD1fxNr+HSwcs18LpUGdxG1Pl7lp3sZPPt9wtqD8gth46?=
 =?us-ascii?Q?SXSVHy+OgQzVuOTsM4iCb3dRyX2UKoQfImeM7/NX2DE6PoP33DSuj984lY34?=
 =?us-ascii?Q?5hcieGwJ//ng0X6zvcrC5avHYMw/U5aag/cpd+vUMkVdPI5/l2jCDvunL6zJ?=
 =?us-ascii?Q?7/JSGlEYw//yQNxa7oDliu4VZKSrFVN5pWs5y3xkDxcHPtJyY++/dH5NtuzP?=
 =?us-ascii?Q?qBvCqJBfKKPWN1UcCMsdc6fuApOiTe1L0B8gefXWYKTUzb0zyuxnu48/PdiM?=
 =?us-ascii?Q?LnLk8mooDcmGolcfG33XgdZbjKFfFxo5igoVs1Mb2H9q8Q7n2MsQLj5o0z8z?=
 =?us-ascii?Q?I2De286pk+yUgec1G8SPJTKS06vi2/w8DyjWgubMRBkxWxKRgw96xX06A6QI?=
 =?us-ascii?Q?icvyobuYCptvWuyXz91JvjRqBJPjqk75imKxesy6M57ZNci7bFjYH7+BG+Lc?=
 =?us-ascii?Q?PgZUk1DrTndl+Zs4tgB4mT9wAwaZ37AScGVUsoSA55XuvQrfnKPs+sAdQb/z?=
 =?us-ascii?Q?VeEdUvgHnjJC7/JAbScHsdmPq84U1KfXqZoAhrqHXU3BS4FwobBaoVQ48IO4?=
 =?us-ascii?Q?F0GvKMWvhcG3X2WNgeZnxV9OMSLAPYfG3ixUQ7R8vIMpQPrUh7Hid8Z76N6E?=
 =?us-ascii?Q?2h0MfkysllZ470NWLlxwffyK/HSFkypjfES8bIyak8fJxCnV9xmeODLFW3Pn?=
 =?us-ascii?Q?R85Ghmf/5zcnZcZN/vbU2R2XttiQPd1hd1/mbACpIkePSWpOapOBIjZkMHic?=
 =?us-ascii?Q?oSuj5JJqhhmA86tRvxrZwzbQf8uKt47cKfPehk8CR0YZfLCXcYmkakY7QlID?=
 =?us-ascii?Q?3IOiNeXJHibv9y0LMqJkLsDmgMXMtcwHgwrQ3JQGrEBBezgCtCKLv3wQO/Pg?=
 =?us-ascii?Q?IT2cCt2S2RIspR0C8BIfdlUeOIcF8UZRBBYYcnzKiEJckuMAIUtZVkYEmXIL?=
 =?us-ascii?Q?tzGgjJ7hH9ajztIX1GlLa3goZH3CLl3YPIrLEo99fq9buMiTquY6hp9mm6dc?=
 =?us-ascii?Q?FjAY5e1IHgsAQNAeT5bJYQFVRxywPHQyPUaKkIeMU3JeNmxNtCeTFEHDmy7r?=
 =?us-ascii?Q?6YlWCQGTITCmVpHtSwN62OnHlMKLQfTP4uHCLILsP+fYr6eQCtm6FIDQDRC6?=
 =?us-ascii?Q?XHK4jm+C2AYi38LnpFlNjIS3UAxUcjn3tbzOqluI2oQ7hbl3SU2aT2WQTJ6U?=
 =?us-ascii?Q?ShQhBtiQ5YzS5x9yO3KEWCoq+liP5ArHAonO7isEgWRVrf/5n3A0hz2OcGWD?=
 =?us-ascii?Q?kI5rcLygD6626Tj2R4p9yPh4i9faZQZqLpPjhM7wvk2SNb+ohqOE4PjXgAKQ?=
 =?us-ascii?Q?FAPveYF8T4Tt1/wAXAqJv95u4DokCgclh9jazwmucYTNRYrwmTKiT7XUynSQ?=
 =?us-ascii?Q?BRVypOY8L3SiIN0CNPpQBJUbZBgJSbmfBq2npsUgIbTDcrl/qDjCS7YMLnTm?=
 =?us-ascii?Q?A8rUYLLjxi47HNQcBmaKIimsBf3qXcfstHNBjBBX1+7+Il9gfRmJYKMDqIgI?=
 =?us-ascii?Q?SpbZujt/R8K3E2QqERs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04203f90-6cc7-4bb5-268a-08de075dcc65
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 18:00:57.5323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjBE+AdxB1p0yzcRK4Rsjwm7Zur3uFBbLVf8+I0DPumvMlU3CKNDKgbA1njoN5T2lX9JKctAuA1Rfg2ATXPzYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, October 8, 2025 15:02
> To: Wang, X <x.wang@intel.com>
> Cc: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Lin,
> Shuicheng <shuicheng.lin@intel.com>; Nguyen, Brian3
> <brian3.nguyen@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Goyal, Nakshtr=
a
> <nakshtra.goyal@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for x=
e devices
>=20
> On Wed, Oct 08, 2025 at 09:02:31PM +0000, Xin Wang wrote:
> > Introduce new APIs to query device information at runtime for xe device=
s:
> > - intel_query_gen(int fd): Get graphics generation
> > - intel_query_graphics_ver(int fd): Get combined graphics version
> > - intel_query_device_info(int fd): Get device info structure
>=20
> High-level question:  across our existing IGT codebase, how many places
> in the code truly need to lookup IP versions based solely on the PCI ID
> and don't have any access to an actual device (in the form of an fd)?
> From a quick skim, it seems like the vast majority of our code has some
> pattern along the lines of
>=20
>         int fd =3D ...;
>         uint16_t devid =3D intel_get_drm_devid(fd);
>=20
>         if (intel_graphics_ver(devid) >=3D ...)
>                 ...
>=20
> Aside from a few exceptions[*] it seems like the path of least
> resistance would be to adjust the signature of our existing intel_gen()
> and intel_graphics_ver() functions to just take an fd instead of a
> devid.  Initially those functions could call intel_get_drm_devid()
> internally to get a device ID and do a device info lookup, and then
> subsequent patches could add additional logic to do a proper ioctl query
> first, and then only fall back to the device info in cases where the
> query isn't possible (i.e., i915 driver and/or pre-GMD_ID platform).
>=20
> [*] From a quick skim of the code, the main exceptions that jumped out
> at me as truly needing a devid rather than an fd were:
>=20
>  - The printing/dumping functions in lib/instdone.c that get called by
>    tools/intel_error_decode.c.  These wind up being a bit different
>    because they're specifically used by a tool that analyzes error
>    dumps; the device ID used during error dump processing either comes
>    from the error dump file on disk or from the tool's command line.
>    The device itself isn't opened and may not even be available since
>    the error decoding can be executed on a different platform than the
>    dump itself originally came from.
>=20
>  - Tools like intel_reg, intel_gtt, etc. that scan the list of PCI
>    devices and use libpciaccess to map+access BARs without ever
>    opening the DRM file handle.  In fact, these tools can potentially
>    run without the driver loaded at all since all they care about is PCI
>    device enumeration and raw access to the BARs.
>=20
> Since the exceptions noted above are all tools (and mostly old tools
> that nobody actively updates anymore), I'd be inclined to let the tests
> and other parts of the codebase that are actively developed continue
> using the existing function names (intel_gen, intel_graphics_ver, etc.),
> just with a signature change to take an fd instead of devid.  Then We
> can create a separate set of dedicated functions (e.g.,
> "i915_graphics_ver_from_devid()") for the special cases where lookups by
> device ID are unavoidable.  Since lookups by device ID simply aren't
> possible going forward, this will also help us figure out if there are
> cases where our current tools are simply going to stop working and need
>=20
>=20
> Matt
>=20
Project-Wide Replacement Analysis
If we search the entire project for intel_get_device_info|intel_gen|intel_g=
raphics_ver, we find:

136 files
483 occurrences

Option 1: Keep Function Names, Change Parameters
If we choose to keep the original function names but change their parameter=
s to use FD instead of devid, we would need to:

Modify all 136 files
Update every usage
I understand that keeping the function names unchanged would be more conven=
ient for developers.

Option 2: Introduce New API Names for XE and make compatible with i915
If we instead introduce new API names - intel_query_device_info|intel_query=
_gen|intel_query_graphics_ver - and only modify files related to XE testing=
, then:

We only need to modify 36 files
With 127 occurrences

I suggest we should not modify the legacy i915 code, because our goal is so=
lely to fix issues on XE hardware. The i915 code has been running stably fo=
r many years, and it's better to leave it untouched.

Xin
> >
> > For xe devices, graphics versions (both major and minor) can be
> > accurately determined by retrieving GMD_ID via IOCTL, rather than
> > relying on static intel_device_match table. Different device instances
> > of the same type may have different graphics_rel (minor version) values=
.
> >
> > Implementation details:
> > - xe_device struct now includes intel_device_info for compatibility
> > - graphics_rel is populated from GMD_ID's ip_ver_minor at runtime
> > - For non-GMD_ID platforms (ip_ver_major =3D=3D 0), hardcoded values ar=
e
> preserved
> > - New APIs fall back to traditional devid-based lookup for i915 devices
> >
> > This infrastructure enables accurate device capability detection and
> > avoids issues when adding new device IDs with varying graphics_rel valu=
es.
> >
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/intel_chipset.c | 63
> +++++++++++++++++++++++++++++++++++++++++++++
> >  lib/intel_chipset.h |  3 +++
> >  lib/xe/xe_query.c   | 19 ++++++++++++++
> >  lib/xe/xe_query.h   |  3 +++
> >  4 files changed, 88 insertions(+)
> >
> > diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> > index 760faede2..890b1e3fa 100644
> > --- a/lib/intel_chipset.c
> > +++ b/lib/intel_chipset.c
> > @@ -189,3 +189,66 @@ intel_check_pch(void)
> >  		return;
> >  	}
> >  }
> > +
> > +/**
> > + * intel_query_device_info:
> > + * @fd: open i915/xe drm file descriptor
> > + *
> > + * Returns device information structure for device @fd. For i915 devic=
es,
> > + * falls back to i915 device info lookup. This function caches the res=
ult
> > + * per file descriptor for performance.
> > + */
> > +const struct intel_device_info *intel_query_device_info(int fd)
> > +{
> > +	static __thread int cached_fd =3D -1;
> > +	static __thread const struct intel_device_info *cached_info;
> > +	struct xe_device *xe_dev;
> > +
> > +	if (cached_fd =3D=3D fd)
> > +		goto out;
> > +
> > +	if (is_i915_device(fd)) {
> > +		cached_info =3D intel_get_device_info(intel_get_drm_devid(fd));
> > +	} else {
> > +		xe_dev =3D xe_device_get(fd);
> > +		if (!xe_dev)
> > +			return NULL;
> > +		cached_info =3D &xe_dev->info;
> > +	}
> > +
> > +	cached_fd =3D fd;
> > +
> > +out:
> > +	return cached_info;
> > +}
> > +
> > +/**
> > + * intel_query_gen:
> > + * @fd: open i915/xe drm file descriptor
> > + *
> > + * Returns gen IP version for device @fd. For i915 devices,
> > + * falls back to i915 graphics version lookup.
> > + */
> > +unsigned intel_query_gen(int fd)
> > +{
> > +	const struct intel_device_info *info =3D intel_query_device_info(fd);
> > +
> > +	return info ? info->graphics_ver : 0;
> > +}
> > +
> > +/**
> > + * intel_query_graphics_ver:
> > + * @fd: open i915/xe drm file descriptor
> > + *
> > + * Returns graphics IP version for device @fd. For i915 devices,
> > + * falls back to i915 graphics version lookup.
> > + */
> > +unsigned intel_query_graphics_ver(int fd)
> > +{
> > +	const struct intel_device_info *info =3D intel_query_device_info(fd);
> > +
> > +	if (!info)
> > +		return 0;
> > +
> > +	return IP_VER(info->graphics_ver, info->graphics_rel);
> > +}
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index 2f6bf788a..8f3ea0ce5 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -104,6 +104,9 @@ const struct intel_cmds_info
> *intel_get_cmds_info(uint16_t devid) __attribute__(
> >  unsigned intel_gen(uint16_t devid) __attribute__((pure));
> >  unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
> >  unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
> > +const struct intel_device_info *intel_query_device_info(int fd);
> > +unsigned intel_query_gen(int fd);
> > +unsigned intel_query_graphics_ver(int fd);
> >
> >  extern enum pch_type intel_pch;
> >
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index a89e0b980..3caeecf20 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -20,6 +20,7 @@
> >
> >  #include "drmtest.h"
> >  #include "ioctl_wrappers.h"
> > +#include "igt_core.h"
> >  #include "igt_map.h"
> >
> >  #include "xe_query.h"
> > @@ -375,10 +376,28 @@ struct xe_device *xe_device_get(int fd)
> >  	xe_dev->dev_id =3D xe_dev->config-
> >info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> >  	xe_dev->gt_list =3D xe_query_gt_list_new(fd);
> >
> > +	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id),
> sizeof(xe_dev->info));
> > +
> >  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
> >
> > +	/*
> > +	* Set graphics_rel based on the main GT's ip_ver_minor. We should
> > +	* use the hardcoded value for the none GMD_ID (ip_ver_major =3D=3D 0)
> > +	* platforms (e.g. DG2,ADL,ATSM)
> > +	*/
> > +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> > +		if (xe_dev->gt_list->gt_list[gt].type =3D=3D
> DRM_XE_QUERY_GT_TYPE_MAIN &&
> > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > +			igt_debug("Setting graphics_ver to %u and graphics_rel
> to %u\n",
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > +			igt_assert(xe_dev->info.graphics_ver =3D=3D xe_dev->gt_list-
> >gt_list[gt].ip_ver_major);
> > +			xe_dev->info.graphics_rel =3D xe_dev->gt_list-
> >gt_list[gt].ip_ver_minor;
> > +			break;
> > +		}
> > +
> >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->tile_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].tile_id);
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 715b64e2f..eefeb47dc 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -74,6 +74,9 @@ struct xe_device {
> >
> >  	/** @dev_id: Device id of xe device */
> >  	uint16_t dev_id;
> > +
> > +	/** @info: Device information for compatibility with i915 */
> > +	struct intel_device_info info;
> >  };
> >
> >  #define xe_for_each_engine(__fd, __hwe) \
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
