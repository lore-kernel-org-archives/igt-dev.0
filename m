Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506BCCDB479
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 11:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCCB10E202;
	Thu, 25 Jun 2026 11:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUulrxvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5FE10E202
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782386131; x=1813922131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aqvTi9K3+LU5QyXxr/n9kqjx8aFPi8q+mAiET2uIhlI=;
 b=NUulrxvA4qvQamTEnlTD3lSzNfEeJzFfYETOtNP6il1qlUrBCAszTIMM
 1+E9PjoU7nlVSTLcESKZ6LvHKlrYjcP4jpqV5rRytitHz/W1i0KOjmRb1
 TXXgsvjWk088kNM6coB8OlC/Dsea5uN9c1D1Td2sf3nXGRB+6zSW9skdI
 yGrH1WkrqpZF59VDgPvceZcZc99FVjf8ucZ/dN2BImXJpu+eBEjJVotvK
 TVtJV0q+ZXVE5il54pS8IbpWAvF2Az0u3n0M/TnxD0ifEncPxW74PkLmw
 X/rvXrWeKqxUXjdX5jDIlYDeamtIYJHq/KgJFLWWFB0jlaafklcEwmSxd w==;
X-CSE-ConnectionGUID: dr68cYgKQ82CO+MsATD9Tg==
X-CSE-MsgGUID: DOOIyxdDQQCvoby80JMG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83350372"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83350372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 04:15:30 -0700
X-CSE-ConnectionGUID: wLNC8WmfRM+yTeSkTvX8cg==
X-CSE-MsgGUID: DmgxvORIQZS4DAsTotfTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="248080930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 04:15:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 04:15:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 04:15:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 04:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC6TOP3g0YONiUTTkJpEMzk5Asw3c+VKVVEkma6mIbsXIwpjq02K5FtLTLrbi6qp++x3x++XXZNEeRQWghkAm+NHD0gT4grytrBiNktqvSpByUev7cUojlranRgpBUzj+Y+ez1YkOjsyqvl6ULvlutuYTiax27Sc9QA+d7gPV65YboYqHL3Ix5gdMPKowWR9iWzs/WFajyUaJWyz/oRP+717S8qfOb2g3S2fgbwht/CmV39XMJyQ/YURKnIlBZnmHEtYnGh6mV7OWZQXaq8+TIfqw8bw1OI8EUkDenThq0HKE95eEZZFcBo9egMd+PJSM4ybh6EmzJS6fayaonn7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10P2nktTftxXHd5sgY5ZKMdniiA0Z2uxl0nfQRDycBE=;
 b=eqOW/G9Z3M8GnUamccmIToYUtPG0ZjuBiMe/ldmUQbcq9pPKumpnBKDyL3VDMTxxhEQ0Cvp+L8zw/ZNHQi/kythDXVU00G8A2si+VZldcsqn+XqO84CB3Y6TtXlpEHnr9WG1SvWP0DhuJ/4McLnxcsc/WeBKLPvIy3c/A1Kk12FHJKi7kdVPl+x+S1PRXz2LDUdxLkCGB61BpjrNcxY5535HjD1SfUfCg9OlUzj8PrFufYWojJFLbaHYBXNkNPnGWL2w1dJexPYncXe42mrZdqRxZIfNnQsyjs/YNBXliVkUY/1fWJrBmEWAEOFEAHVPcVJNZT2LDMsUoRwYoLyo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 11:12:20 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901%5]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 11:12:20 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ramadeva, Dwarakanath" <dwarakanath.ramadeva@intel.com>, Oak Zeng
 <oak.zeng@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/xe_exec_fault_mode: Revive atomic
 tests
Thread-Topic: [PATCH i-g-t v1] tests/intel/xe_exec_fault_mode: Revive atomic
 tests
Thread-Index: AQHdBEf68Xgj59ecjUyBaLqu7Yn7CbZPHgDw
Date: Thu, 25 Jun 2026 11:12:20 +0000
Message-ID: <SN7PR11MB7489D260747D3544A1A21EC685EC2@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20260625021127.70430-2-gajendra.uttamchand@intel.com>
In-Reply-To: <20260625021127.70430-2-gajendra.uttamchand@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|SJ5PPF4990C6B9D:EE_
x-ms-office365-filtering-correlation-id: f8a1a346-bef3-449f-8cd0-08ded2aaa034
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10070799003|38070700021|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: s0KL8zRpoiI3nX+P5w6iaVMXB73ibP5kVDlxwqVW6e1tq+RmtbUmBiYPCNYNVP9RCHL1H5M7fHWmOKFZGFS4ppEnmgZzqwDe4F10i0ZqMSjdS8XNwanh2XrN0xaTu+Vn/4HfIOZz/KcvhH+MqC40XJrIIQTUVYhca1jGdYrCVF8AHSE5mvDLPOrMBLXOFPx5zY0EJeYs1SOtsUTLLz9O79G0Vqz2ESf+2c+0WLwblq6/nDfP6vFbUxYJqvfOsa+EY5vawCyg9UA5tT0v2jiesWv9aQV5WCa5C3VXXRqzHSCvo9K6x12ayxjBnfIAJmg3I1IK+XUE7SCta4DhOOSmzEIlTuihXKHbhfPZnn6K80dybpDAOq3B8GrgN8oDf+6i9qJYrNgcEolJjpOsYWPt+eKcPURy/ZnjlIvUJbIapuKH0EGhbAP8xjlIovv//Q87ttgN+HtoLrS3iSiFlubTIckpG+GH6MJ1BihWYhLtdQ5YBMEQLFT0jRH3HjKRUrXGqAmWAwasdBPP6RymyxHt21SWxAKyYFa1JWcTSZazDh2RBFtkFeBxovl3VKh1wZ37DbL+w3lUjh/yPu2qmdy3No0cymjuz/W+gDSVcVQsbKgdYQewgubICAMkdr2ZEKv2ImbHP5KFcfWebC7xhsGP3sZZtXNUA24K8RdLxPJprcgqJYrZ35IoCyndanymnuUOcy8Ng6n5a6ZqClp+z015TTi+9DTbCLbdM5DH5tpEpRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(38070700021)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WJ8DmtqBxX6ggneA17gkN3ZgryWgjJ2HRdDbo9kwWmSLqMIgz2k69HPSC8Ea?=
 =?us-ascii?Q?SQugOeIq+DXy5/lGuPbGxfiB0WJ0VqyNq+hAXmqOhuX+0gWF2WMh3h9FHGmK?=
 =?us-ascii?Q?QQqJsIEPC5ViBEpN/raSHRegfEHYey4q751jh0y7xmsWUIWJyf4VVZQCSvvq?=
 =?us-ascii?Q?H6aCC418vQK+FZ3F1DOCTn1YOuCNsMt+xdixqWnisBcvBud0dtoHEbdnGpko?=
 =?us-ascii?Q?bpVPDwMSKYbRWPXvRKkjjtvUL3nku1B+XJPcGaU9yx45+j4y0m+lNW3/0lJ4?=
 =?us-ascii?Q?4Z5XvHQTiiABFbxtZPd11/CVaQvi1hj9/sE28zpKcU8OA+Qx2qEKCMAW+FeM?=
 =?us-ascii?Q?gu5B2J5GZWpl1ITUltq7qk0m87m1AZ5dQzTH8FeoVSQmvTm4Jr93h82m8Rpc?=
 =?us-ascii?Q?lGrWOZ62AXC2vMmC5pWf11jmr+xbfp8THBJURlxAruw8agtFRG3WQvAhOcuy?=
 =?us-ascii?Q?AMWkad3uogH6aENPkAX3ezSnmW5N/gR9r6NZCgF2rDMDhhDUlR5/A06LMy5l?=
 =?us-ascii?Q?YaE3vNbDd7qr3XrQAY6dM8pK7bKQiewPQ093Rz/msnfTeXf6rZiP1yvKkw9E?=
 =?us-ascii?Q?5Bbxn8q8y5RYXaVESwQvvIjk7WejT5mfm4Jtqngq7If8m9Azcpp8y6t9ZAsb?=
 =?us-ascii?Q?0PclGXEx2ylQaljxmLFJ57jVueqQpMfXUNpG2sTv4zdhqMRIiki6u92f9D1T?=
 =?us-ascii?Q?pQ9cqj/XEtSdHGmPpM3rMBdwxwjro+R2ejlb5I5bLR9dtI0alvJbjxc1uMFk?=
 =?us-ascii?Q?e72HfP5/o4wKbK1XpEMErkiaUfMqdpyUh2hfXpPEL+7YC3h7/LF28OCwb0J1?=
 =?us-ascii?Q?QcNAC68UawC23dGx+rn7p+6hxiF/+0QeXD+xraG/jzsudI1onEpJnN81lwkb?=
 =?us-ascii?Q?Ej8lNnmhJaPMW0qTELk0bwZpFjjgu4kmqC1iObUSQSDAcGET8frDIbJW5A7l?=
 =?us-ascii?Q?8TcgZL7Ba+2YGF4bij5oSsZ/Anl2fAMfaMZ5P/QFsO8jGozTkgEwd2+Dgbdd?=
 =?us-ascii?Q?SI7PxEh6aDmdCf7OKByA2K398l2KHFcxlrcm31jRgX0IbwHdFQCzCBBWFRHk?=
 =?us-ascii?Q?3n+frNalI5xR6JSgfR7+NAWm5jSJWmFUrhNsn+GZ5XEaACLPHKJTJp7W1VtT?=
 =?us-ascii?Q?3lDPUuG4wdCYROogiRS5B0fVcdEBSTp37SD+EVALch+0YVtcgomiY7iNUWJ0?=
 =?us-ascii?Q?tGrRx5CVgWyDDhFzNj13G29Ow1YGXQpcPJvjKH+q1N75iEn5dAT0TkmWPTId?=
 =?us-ascii?Q?CLhnEU2Qq3s9lmTiwslECHGLgDjqwXUSu5uNXblnM3FrOO9OAT0uWMjk2UMz?=
 =?us-ascii?Q?9G38W0HccfPoMWATt3b5fUvpfCJxMHb3Ys+9Okg/SPhO4fRNLZdH+2FCShTS?=
 =?us-ascii?Q?4wBzVll+yjQWBB3sN1r7ypZg3ZEV5MASVNrTSDFr/uV9DaFQKxK2ro8xJIl0?=
 =?us-ascii?Q?C+CQ9SWAOnYi9GYac1CknOIpiejRxuQ/9wVxmn5BykCKTuDXXTv5mQ3FSHiM?=
 =?us-ascii?Q?SrU+6Qtpufv/aUZI62t0EJxvrnKKri+ELfCqIR+/SYfBTqTpuZRAIzlg3pRc?=
 =?us-ascii?Q?IZCzmdYM/EYPra4rZJqK5Tb7Go0Ou6zKq4kQDBdlmH8sM+6YQ/PixUnYbtD1?=
 =?us-ascii?Q?XB0MZ7ltjkWAxLw51YXVEYxCtPdNSQmXWslHo2JsYF7Db/R9Pb+U5iShVtCK?=
 =?us-ascii?Q?2+O1jeu0AUIepTNjy5xVxSIUW8QQm1GJORRgA4plP7/1Xq3iY3DwW/9cM1AH?=
 =?us-ascii?Q?Nvu8nMYxWsTzv8q8Apu3muVPp2KSQdiSX4OA2/y1PwjGeCy8qCGOj9fh5NQ8?=
x-ms-exchange-antispam-messagedata-1: tUdTRUvadO5Icg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aHsO4FH/xpCQQGQ5JFJbZFpkg74BLnh1mBrffQRn+6MLvemUUQtC/R1INCu1Xj634DjmBgxJVKJBHPCgeQYgemiMdOM82BWAU3W8ZwWe4YhiKIs7vkMUOeXuJVRH8q3R5o1jUa2TuBx8tnHqnyb8MPpNDKlIgNzfsvyHK95u0b4Xl/XdPM+D8lk1NVy04zKbaUu8qAwK47Fa4ci6lFhaa2Vf9E3r6lwi/tXolhw0Jv9RK1K7cdReN3ZXSolNK4FP2u1lc0qRAsexSlfATyK4fsEgDo8/6bZfrhGx5AoFuNc9LcHdyZp7bbyw5L+yN7f5aP3DjCD2d5J3QHNFYZqdng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a1a346-bef3-449f-8cd0-08ded2aaa034
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 11:12:20.7113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfZ7Rwrv7pZACxhYvwvtnBLh8PFe888nvedmSYob9Olb7qzpXR2NP86hjSjS7ynBP5qa8S4hNcPP0wioK3zdbbyDaz3wBc2Si0xkkCwVqrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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
> From: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
> Sent: 25 June 2026 07:41
> To: igt-dev@lists.freedesktop.org; Goyal, Nakshtra
> <nakshtra.goyal@intel.com>
> Cc: Dugast, Francois <francois.dugast@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Ramadeva, Dwarakanath <dwarakanath.ramadeva@intel.com>; Oak Zeng
> <oak.zeng@intel.com>; Uttamchand, Gajendra
> <gajendra.uttamchand@intel.com>
> Subject: [PATCH i-g-t v1] tests/intel/xe_exec_fault_mode: Revive atomic t=
ests
>=20
> From: Oak Zeng <oak.zeng@intel.com>
>=20
> This partially reverts "drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic
> tests" ( commit 3557bb1215d5d57a4fbad50537272e96f37d71ce on
> upstream).
>=20
> We revive the atomic tests on igt with fixes
>     use xe_bb_size
>     calculate wait bo size separately
>     wait fences for none WAIT_ATOMIC cases.
>=20
> v1:
> 	remove the additional description (Nakshtra)
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_exec_fault_mode.c | 158 +++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 7277eb007..51c7ee67b 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -36,6 +36,7 @@
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
>  #define MULTI_QUEUE	(0x1 << 10)
> +#define WAIT_ATOMIC	(0x1 << 11)
>=20
>  /**
>   * SUBTEST: invalid-va
> @@ -467,6 +468,147 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> +#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
> +#define   MI_ATOMIC_ADD                 (0x7 << 8)
> +
> +/**
> + * SUBTEST: atomic-once
> + * Description: Run atomic fault mode test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-once-wait
> + * Description: Run atomic wait fault mode test once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many
> + * Description: Run atomic fault mode test many times
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many-wait
> + * Description: Run atomic wait fault mode test many times
> + * Test category: functionality test
> + *
> + */
> +static void
> +test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
> +	    int n_atomic, unsigned int flags)
> +{
> +	uint32_t vm;
> +	uint64_t addr =3D 0x1a0000, addr_wait;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +	          .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	uint32_t exec_queue;
> +	size_t bo_size, bo_wait_size;
> +	uint32_t bo, bo_wait;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *data;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *wait;
> +	uint32_t *ptr;
> +	int i, b, wait_idx =3D 0;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	bo_size =3D sizeof(*data) * n_atomic;
> +	bo_size =3D xe_bb_size(fd, bo_size);
> +	bo_wait_size =3D sizeof(*wait) * (n_atomic > 4 ? n_atomic : 4);
> +	bo_wait_size =3D xe_bb_size(fd, bo_wait_size);
> +	addr_wait =3D addr + bo_size;
> +
> +	bo =3D xe_bo_create(fd, vm, bo_size,
> +			  all_memory_regions(fd),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo_wait =3D xe_bo_create(fd, vm, bo_wait_size,
> +			       vram_if_possible(fd, eci->gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	wait =3D xe_bo_map(fd, bo_wait, bo_wait_size);
> +	ptr =3D &data[0].data;
> +	memset(data, 0, bo_size);
> +	memset(wait, 0, bo_wait_size);
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +#define ONE_SEC 1000000000
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_wait_size,
> sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	for (i =3D 0; i < n_atomic; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[0].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +		b =3D 0;
> +		data[i].batch[b++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		data[i].batch[b++] =3D sdi_addr;
> +		data[i].batch[b++] =3D sdi_addr >> 32;
> +		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +
> +		sync[0].addr =3D addr_wait +
> +			(char *)&wait[i].exec_sync - (char *)wait;
> +
> +		exec.exec_queue_id =3D exec_queue;
> +		exec.address =3D batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		if (flags & WAIT_ATOMIC)
> +			xe_wait_ufence(fd, &wait[i].exec_sync,
> USER_FENCE_VALUE,
> +				       exec_queue, ONE_SEC);
> +		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
> +	}
> +
> +	if (!(flags & WAIT_ATOMIC)) {
> +		for (i =3D 0; i < n_atomic; i++) {
> +			xe_wait_ufence(fd, &wait[i].exec_sync,
> USER_FENCE_VALUE,
> +					exec_queue, ONE_SEC);
> +		}
> +	}
> +	igt_assert(*ptr =3D=3D n_atomic * 2);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_wait_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(data, bo_size);
> +	munmap(wait, bo_wait_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, bo_wait);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  static void
>  test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flag=
s)  {
> @@ -618,6 +760,22 @@ int igt_main()
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> INVALID_VA);
>=20
> +	igt_subtest("atomic-once")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, 0);
> +
> +	igt_subtest("atomic-once-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
> +
> +	igt_subtest("atomic-many")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, 0);
> +
> +	igt_subtest("atomic-many-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> --
> 2.43.0

