Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB465CD98E3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 21:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B9A10E208;
	Thu, 13 Nov 2025 21:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBy3yWEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C8510E208
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763070064; x=1794606064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u8EvUg/Upp5IMCZVuPbZvK04pd20JLN2FXgEEl8T8YE=;
 b=CBy3yWEOD1KtzF1NXnjzvcwqQ8ysDCluwWD5zmhX4DhUZQ3mqrUKAasz
 7OWX8f3AOTP8k8MRdhZNk1c5akvCh/6MJjh1U/px5hI1Ll1qVoJkMQ8tD
 GABRIWr4LNniiWrVHuqPptX2og4asHjki2RohO5aDVhaNB+Wn38tIplsl
 hfyZXKkilRFe6Vagpng2MiI9nDvnphokKuF0FdXd4RRPLevcQ+hJ4VPT+
 J6ebOPBsiMgA5kLsYgaimXRS1BE1HnntOjKZ0MewrnS4IpbfvN58Ddfgl
 CqaPXAdoLS2mQ4NVLIgdxx9uVQe+Qcq6/PyzIN9mwCw+VNQsrVGgV/WmW A==;
X-CSE-ConnectionGUID: VZYoiGvmQA+tWIGr1wGheg==
X-CSE-MsgGUID: IsJ2tlJgRUe08pCg1L6ZMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="67763002"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="67763002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 13:41:03 -0800
X-CSE-ConnectionGUID: shRweA4oRfSj2K7oztQ0EQ==
X-CSE-MsgGUID: 1dTPhGMrS1Wt8pUlk7xDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="220243269"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 13:41:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 13:41:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 13:41:02 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 13:41:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib83YAltNE5waSyIx5a13f6qu6PgXpzYYTifEaWLzaZ5dBLGiMykoCF9Ov+2o6atmgTbl2j5+wL8VNlXzuuOjezvLhslRGxNk85efHKV1HA7prlWMBjfYxTcuhB3qcIxNA3qv21SxDTB7YovOGJgS+3s51aZKpkA+IRlmtIFydVsu1+9/3q4X3HWH4KjGI5wsYvyEtgcThra3jBD0X/RZ9VNTAR6wPAR5kqMYb4UP4baK/8uUlYkMS9VIIw2NLKCjEuzcls2XDkmUZaH4yHg2IZ8Z2UYfWo8do6sKgRYjPgvznXBVgdggnt+2rodha/7YLefk2bgsO+CLMxGumwzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU7mWmrFBtPlGZ/HYt7fGfAMIis9+WYjcymQwcmnY1A=;
 b=jKprqwWu2zp9jXytgiHFABOd9Gu1vA5CTpsjvCDSY0wu9IW8JI0upydAVW7tzf++jlj1zLuE/3eAdSNpKadNAxGFx74XXwlhLt1uKygZZhG93T3VxzjnsGgdqD0okS2++G5vLoDAvJvgaEQwX89F4ySBAQkFIF6qnsGjCRwQ7w0682g0kEcErZOCpeDvsKwhs0kHw/VPhy6C983KB4/ioSuH7ezKHEQFDZ2aMrWUQ4k/ETwWnDkvBU+Cb5NPFStpxaiNUL8JPHwz+ZjZbBuw6tfclT7OLHsBP7eZLi5IapGCfi4yP3aVuxcysYkwW+I1Jq54TRoDdSSfgm2IbO13fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 21:41:00 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 21:41:00 +0000
From: "Wang, X" <x.wang@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
Thread-Topic: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
Thread-Index: AQHcVGvsdljG6pYIG0qygDU2gXJq6rTxIsHA
Date: Thu, 13 Nov 2025 21:40:59 +0000
Message-ID: <SA3PR11MB80468A6B111318E2A32B5E7786CDA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
In-Reply-To: <20251113070502.2148615-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|CO1PR11MB4898:EE_
x-ms-office365-filtering-correlation-id: a7edbd2e-f16e-40f2-8950-08de22fd5621
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oXTQEx7WhReu9cl7818hTo9EdMAxmgyPK7Ay7mGmihn7i3wZW3aWyaHOjBmc?=
 =?us-ascii?Q?KfPUt4N8QW9gUGXDrnmOGFCVMJfV5qX4w+UbttCA9OJyI0pqp1sOmafeRAKz?=
 =?us-ascii?Q?LvfvI/4VejKPPgz9v91YvQEkg0op7K9Cmh9TenQAWHlXKAkDoQ33Y+sYWXW3?=
 =?us-ascii?Q?I7OMUJUa4+da27VD8yuKwJwXwExiXEX4Bbgz2z5YSSkE/YfTEnCi81efXdFb?=
 =?us-ascii?Q?xpKvViG2+D8nmd3Z+icv0kFI+eKKg5BjNC9ClwhAAX1c5oRQ7EMs9UP1KxXj?=
 =?us-ascii?Q?9lOzPldUMXvd8HIT5t5ly8rOKQ57bVGZbuCALdr4VBHEnek2uAjhngF9Wxhk?=
 =?us-ascii?Q?IZ/CWGXiRY/h847ZHlNehuF3aZH0AJBOpmwH0JlOV2Nj3Sa1yPRQIDE9oXvg?=
 =?us-ascii?Q?WI1RZlq8vuKQEPvD8UqSY/pwjTaCyZPmoEu/E40tiqABCoO7bWb2USjVacdr?=
 =?us-ascii?Q?ZA9pxdf/bYGHNzPr0+ZDx3VQxhxfjkzQR0CioWknQPlQ4UiYWzCnltx3UbSM?=
 =?us-ascii?Q?6OTZok5GCeRjFumn8/4orLyLMbYYe8jerrtiyV9kiRlcV4yGudzu5OXoUbIN?=
 =?us-ascii?Q?XMmid/oyMUsp2hM7lpLsnSUVn/3FYLQ9rFY8wY8jodMz6/WyDIzIlNT1r5dC?=
 =?us-ascii?Q?oEl9WC8eCYWd3moASE02DQFQ8rP9TzudwB1uO0NfAzV0Fx6ELO0xSOovoHg6?=
 =?us-ascii?Q?WptUfNJfFN6pygNkymkBkYOLrhgBF0ahNgIy0KnIBFd7z6X0Y8wYQQeA7Ti4?=
 =?us-ascii?Q?I0V++fGCJ8kFSf+8FlhUsJdbqZOtMb/L8n4OpPgxBA4ewGnXzM8g/IVok5U2?=
 =?us-ascii?Q?/LKIj3BCO9e2MYzXjX3aX7H/YVycoDzKk7zbsfhLg0gRxkwhiOqaA5IQx2Hc?=
 =?us-ascii?Q?Nf8HXT/FsiqOuiXU+KWuksjrpALSxjxgg4+CNeqiYDvrr7Y91wnOyoYhaWT9?=
 =?us-ascii?Q?F3jHVR/32Vf4teAQgtv2/UmQDFsEHPKDKIGVuK5KwyHGs0rvc8+mK1i6I4bG?=
 =?us-ascii?Q?YpHmTwBSS7qe8//FJ4VuRab3dmoBRv81FSLVL8yvU9rqkoeUfzzfwEMWty6M?=
 =?us-ascii?Q?ofkHg0eEtW9/FRSzhNVg/knlbgvYATYLcX4iadBJQtQjGteKdD0MN1u8SuBD?=
 =?us-ascii?Q?xcOHYLqXHdp6sqma2GsskdiJ1iIIUH9X8t9BFaMQEP1LHJNmuk4p2uYdweSu?=
 =?us-ascii?Q?97eKT6fAiBZiG8OU0CW/TIrMKFAtHnEEVACfyZYq0nhHYKMMEb27rZ0rn7Bg?=
 =?us-ascii?Q?dSnIgZsQcfHa/XOGerfqjQZ5Zb0CfcZrZpBnSJI2P7PeSo2LspUlQO+mNdBn?=
 =?us-ascii?Q?WCNknVjwQ2JVBzisOlh03w7HvSIEFci1J2cQvwQFiBpeprT9YeVL8zoCLmuU?=
 =?us-ascii?Q?+7nVRk+AVGoQn7myJMUcMVgXw3cmfGMT5vCQ4IG9/cX9ABpjZ/6RpaT5RGDQ?=
 =?us-ascii?Q?E0C50o0u9Y43Dg4CgBUbmmXrjx7xOp6eOq5ZYCB10r6vS5ZQ4O6Jcz06xTQh?=
 =?us-ascii?Q?FPzxxm+YjhXj2V6V337lPCTnSfolpO+6phjT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p+dQj0eBsIlzciwQAgYiR5oNiRwC9UmSvPOvpuvKKUzTauXDbMmrNN5W+g1D?=
 =?us-ascii?Q?6Ks0m4NFhyoITOAX1oOzdsX8WGa4a8l+YpFQdy+qPw83K1Hhu0+U+8G2UDA9?=
 =?us-ascii?Q?S17RnabQindZNRuynprX6sghpc8ZnwbWD1f/6tGFZ4ZakhdW61eS+mRfvRCC?=
 =?us-ascii?Q?aPrsUmAsZlzR/Vy4eSbIl/jd0pQpjyGif9m6P0fXTi6u2Qd5znkgq3ovuJJV?=
 =?us-ascii?Q?Fh0OOeaXsg5xXoPaWpmdtb9wVTiy570v2it9Z8VH6VrdD0FVMJMNVrw0P3D4?=
 =?us-ascii?Q?rGcr0PKqhJCmpWfajTcHKbBkC+pL7X5MblAFPTNlfqcAFMAzCItwH21PwWyH?=
 =?us-ascii?Q?8jlU23R/dVsHjaQputgpX4hCvu+xrQbfEW+V4BVax3xq8OZB6QV+3EEHw/le?=
 =?us-ascii?Q?iMYcdgd6Jfx/B9zIW5EKiWDBdvz1i8sTRwhLoyDX3lVybo6n9jDXdKY4RsYM?=
 =?us-ascii?Q?8djZX/qhmEQL1ZdCYAk+yNksl+UC+KarVPBRuXSr5q+ICeznC8i8J1wUvM4D?=
 =?us-ascii?Q?bRKdQNGLpZ5cFfKt7BYRmroouTRvF+fqciKDsDeptuDDCV5RRsCdGv7hBpE4?=
 =?us-ascii?Q?u03xi6IyrhOrn2gKB7QdlPLLDkJO3XyjUhOflvhPVqlu9cuD/r+nfrQZ1b/Z?=
 =?us-ascii?Q?L1YOYVuVMcGCDgbvYz1jegCpz648v4/TsRCZSPh+6tp+7a9LM2sksPCIFYSh?=
 =?us-ascii?Q?05xGbw0uPbqAJCVlIlXmJ+Z/MmDMfgic6WBsXAeC8FfTwP5jvoaCtk48Lgdm?=
 =?us-ascii?Q?zNBptC8+u5GXcpe7KqLdKDyQ81wKtiUX8PqNhfV61vFMlsxdxbTpCA8fa3Rq?=
 =?us-ascii?Q?Zsfi8swBueYLj1E5VVtSXonTmNaJpxkRipqxBJ92k9DT2nVwPvy3oJUiZdUf?=
 =?us-ascii?Q?H+HnnQIO5f7eRWLGJboUz1VChGeqMY+yMTkgcYrHC6XiDFUUhlJIGXAyeVG4?=
 =?us-ascii?Q?S/0C4p/TER/ycyOVvn3LKU8ui1ByCuSYYzosBsyzyrLwjKZumGCxjio5wMHx?=
 =?us-ascii?Q?+Ty791TWLAZgwjKG6a8uMVt7oz0/CV3KDS1J8l04WU/DHpU3Or5B2qFJsQ1m?=
 =?us-ascii?Q?gmP3cfpQfrq9QHJWyiRRyKzELl7b9VPeTxVtQPooxuCWPHpoK9X65hm/4s16?=
 =?us-ascii?Q?cM9+UvBEUT3fXYYKPfIvmV5rmQuLHpQ0S4xa9LzNYgNN+V/o0j72xiIM5t6Z?=
 =?us-ascii?Q?lOqo4dgdrK6PSfTN9+5ppiXPnVESIkPNa/NqD0YU9IjXJpSVzbvpLJqiCssE?=
 =?us-ascii?Q?d8OXrqd+18hTQHF7nV7c3KypdZp6z4/0xvY67+SSYz/davlNPlc47K/182rL?=
 =?us-ascii?Q?10b1qWaX3Zg+RBZ2/10ohFIKva0LZNj/CwK3Xx3M+lROtJlFgW3gfW/FPVr0?=
 =?us-ascii?Q?5at1gBstIbDBWfhCP89hbMvGQj6JMUMuP7BJepEOJP5gPL2tnzCDWZKn7/eE?=
 =?us-ascii?Q?+N/lciEXTqBUQnRF7fjrkpbhYO6BG5QX1mMvuvcxbqLkiW9rXce+ZAJIZIVJ?=
 =?us-ascii?Q?aJfPnwJN5FLiktTlxTyJnkmWjTq8+uvoQWmNiUavJMMM9AS3csROPqVKl7Ub?=
 =?us-ascii?Q?J4dWcuR5XDXSEFU/ovc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7edbd2e-f16e-40f2-8950-08de22fd5621
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 21:40:59.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKcU3Z2BoyBFvKzcIKDntnYjsBFAuoYN9ItWn2tOLEi330ZxCSYbWOH+YN/j+JQeg7LQPNHMy/AzyGEoNRXArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

The test is failed with VF . The gt0/pat is not existing on SRIOV VF tests,=
=20
I planned to add a   pat_swcfg debugfs file in KMD side to print out PAT ta=
ble for both VF / PF.=20

> -----Original Message-----
> From: Wang, X <x.wang@intel.com>
> Sent: Wednesday, November 12, 2025 23:05
> To: igt-dev@lists.freedesktop.org
> Cc: Wang, X <x.wang@intel.com>; Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
>=20
> Added a helper function to read and parse PAT entries from the debugfs fi=
le,
> including decoding of PAT fields and reserved entry info.
>=20
> Updates the pat_index_all test to utilize the parsed PAT table for more
> accurate detection of hardware-reserved PAT indices on Gen20+ devices, an=
d
> prints detailed PAT entry information for debugging.
>=20
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_pat.c | 118 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 59dfb6b11..36d429c97 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -77,6 +77,96 @@ static void userptr_coh_none(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +#define BITS_TO(n)		(n >=3D sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
> +#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
> +#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >>
> (low))
> +#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)
> +
> +#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
> +#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
> +#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
> +#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
> +#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
> +#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
> +
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_table_entry {
> +	uint32_t pat;
> +	bool reserved;
> +};
> +
> +/**
> + * xe_read_pat_table - Helper function to read PAT (Page Attribute
> +Table) entries
> + * from a debugfs file
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @debugfs_name: filename under device debugfs (e.g. "gt0/pat")
> + * @xe_pat_table: Pointer to an array where the read PAT entries will
> +be stored
> + * @max_entries: Maximum number of PAT entries to read into the table
> + *
> + * Returns: The number of PAT entries successfully read, or a negative e=
rror
> + *          code on failure (-EINVAL if debugfs_name is NULL, -ENOENT or=
 -errno
> otherwise)
> + */
> +static int32_t xe_read_pat_table(int drm_fd, const char *debugfs_name,
> +				 struct xe_pat_table_entry *xe_pat_table,
> uint8_t max_entries) {
> +	char *line =3D NULL;
> +	size_t len =3D 0;
> +	ssize_t read;
> +	int32_t parsed =3D 0;
> +	int fd;
> +	FILE *f =3D NULL;
> +
> +	if (!debugfs_name)
> +		return -EINVAL;
> +
> +	fd =3D igt_debugfs_open(drm_fd, debugfs_name, O_RDONLY);
> +	if (fd < 0)
> +		return -ENOENT;
> +	f =3D fdopen(fd, "r");
> +	if (!f) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	while ((read =3D getline(&line, &len, f)) !=3D -1) {
> +		char *p, *s;
> +		const char *patterns[] =3D {"]", "=3D", "[", ",", "]", "("};
> +		bool found_all =3D true;
> +		uint32_t hv =3D 0;
> +
> +		/* search the pattern: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) !=3D 0)
> +			continue;
> +
> +		s =3D line + 4;
> +		for (int i =3D 0; i < ARRAY_SIZE(patterns); i++) {
> +			p =3D strchr(s, patterns[i][0]);
> +			if (!p) {
> +				found_all =3D false;
> +				break;
> +			}
> +			s =3D p;
> +		}
> +
> +		if (!found_all)
> +			continue;
> +
> +		if (sscanf(s, "(%x", &hv) =3D=3D 1) {
> +			if (xe_pat_table && parsed < max_entries) {
> +				xe_pat_table[parsed].pat =3D hv;
> +				xe_pat_table[parsed++].reserved =3D strchr(s,
> '*') !=3D NULL;
> +			}
> +		}
> +	}
> +
> +	free(line);
> +	fclose(f);
> +
> +	return parsed;
> +}
> +
>  /**
>   * SUBTEST: pat-index-all
>   * Test category: functionality test
> @@ -86,6 +176,7 @@ static void pat_index_all(int fd)  {
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>  	size_t size =3D xe_get_default_alignment(fd);
> +	struct xe_pat_table_entry xe_pat_table[XE_PAT_MAX_ENTRIES] =3D {0};
>  	uint32_t vm, bo;
>  	uint8_t pat_index;
>=20
> @@ -114,10 +205,33 @@ static void pat_index_all(int fd)
>=20
>  	igt_assert(intel_get_max_pat_index(fd));
>=20
> +	if (intel_gen(dev_id) >=3D 20) {
> +		/* Read and decode the PAT entries from debugfs */
> +		int32_t pat_entries =3D xe_read_pat_table(fd, "gt0/pat",
> xe_pat_table, XE_PAT_MAX_ENTRIES);
> +		igt_assert(pat_entries > 0 && pat_entries <=3D
> XE_PAT_MAX_ENTRIES);
> +
> +		for (int i =3D 0; i < pat_entries; i++) {
> +			uint32_t pat =3D xe_pat_table[i].pat;
> +			igt_debug("PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u]
> (%#8x)%s\n", i,
> +				  XE_NO_PROMOTE(pat),
> +				  XE_COMP_EN(pat),
> +				  XE_L3_CLOS(pat),
> +				  XE_L3_POLICY(pat),
> +				  XE_L4_POLICY(pat),
> +				  XE_COH_MODE(pat),
> +				  pat,
> +				  xe_pat_table[i].reserved ? " *" : "");
> +		}
> +		igt_assert(pat_entries =3D=3D intel_get_max_pat_index(fd) + 1);
> +	}
> +
>  	for (pat_index =3D 0; pat_index <=3D intel_get_max_pat_index(fd);
>  	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver >=3D 20 &&
> -		    pat_index >=3D 16 && pat_index <=3D 19) { /* hw reserved */
> +
> +		bool hw_reserved =3D intel_gen(dev_id) >=3D 20 ?
> +			      xe_pat_table[pat_index].reserved : false;
> +
> +		if (hw_reserved) {
>  			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0,
> 0x40000,
>  						   size,
> DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>  						   pat_index, 0),
> --
> 2.43.0

