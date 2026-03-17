Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F95FB5EBE
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7A110E3CC;
	Tue, 17 Mar 2026 05:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5QNr+uu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5B10E3CC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773725055; x=1805261055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ocQk/RCYmH6c5Zll6qG1eNRgQvwSWKefjjn/vrn89Vg=;
 b=g5QNr+uuhGQh6b0uhFZWmCxXmwx/7CSfNkG2ZIurj+dHEBXwrckgt9QN
 /KMwSjYmfd9x1RyGefaY6hcyC9RVJmMyWh3ok4W8VKfiTD0IlG59XJPP+
 cKlBb/9F8qcnhBF3hquIOmZT5fm2ABCUDfxkhjWP6t0c2DTU6sszGlY/J
 3+6za3sqxyW+XUcJ8v/XMfJ+DeW8ej4774Pady9WoeXDHeZwx3ylXg3ta
 adwSlfOucr0ZADcaU6xMSwq9Ox0PDFQ3N6z3RG/u2HPOrMhUf+pEJQndT
 fi0UQT3qYo7Z+FT4DrZwFpCbM1kHjjdD+pJmfsB7yfCJjQ+8dDhUpD8dd w==;
X-CSE-ConnectionGUID: K3cjWFXjRFeQUTARpZifEg==
X-CSE-MsgGUID: 4G70rjBTTq+tGpe9VSxinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74932384"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74932384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:24:14 -0700
X-CSE-ConnectionGUID: tF/ecz+QS/yOmxybRRW1pA==
X-CSE-MsgGUID: 1KB3C1u1QAuk2b9SUS9s9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="245169096"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:24:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:24:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:24:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwffFIbOT0Gos13EZ9kqUxZ80HnLrdw6fzB7xhzRzFglJNl3a6PMvmMA6L+xOKlI2MqYo3QLG/7sEWG/9mirfSh+mXp1i1yWJtJFa8F2XdFrEbHQfgXQDk3l91qUmhQQAaePNIB8nIN5VLHdzhH40QD5yHar8yuR/WHsNqQ263qsMJkFtU6rzOwxe1J1TI+mVzmM5lKvhP3J5848oyS465JZ0IKjhWv+b1eT1cEq531hVfLOp0rX98/kh+1nyXJcDmxMlARfNEAxEt3p45TXyE37isvsipU2cpnZEM6UZRGDGGNjM19RKJy8Fmi/Xd0V+0gAS58euBadUhTG4uht6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkK+lf1Pb6dr52AP7QCrrc4RYblLB9VnGoU9UpHfL1E=;
 b=RKoQtQFLJBXSo9c5G4zYDyq7y3UKnhLsJz/uEsQirvACAVMzhb418dP/diOsSG9oRKlZNw2aRKoVNlnsF7kr5ipPzMsA5xdiTac6DZfU5DOJQL7jnoZCqd0hLrf63czaMCc/sAmhtsW9Y8h7/PjP+aGxMqAAbgwy1uk6CVXSCTDANebgYTSCjEHvxPNua7e2tzqY6DUI1QTIEVirSpqtB5dHB6f4K78osNExxgDMKGMx/9uh6NSWklX877wG/bENB//9r74wvNicG45/WtDX6aMWMnyTqQRawZ4pLg83ablD1JLFAKKo2cI/TnAajDUy2ZNrhSMaTcMpAm5G9jxMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 05:24:09 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 05:24:09 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Topic: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Index: AQHctR2lLrvgrNU6MkGjxaKxc7R8DrWyLw9A
Date: Tue, 17 Mar 2026 05:24:09 +0000
Message-ID: <PH7PR11MB6053E0D8A4F03905886786AEE741A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
 <20260316084021.419580-2-sowmiya.s@intel.com>
In-Reply-To: <20260316084021.419580-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA0PR11MB4766:EE_
x-ms-office365-filtering-correlation-id: 8633fceb-9f21-4b4e-03ab-08de83e56a8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 5j0KclCcpUsDEqJ3cFef37WseXi6E8Etq1epTz1TmQi1uMJsdBySnnAnj9d1XxeXj/aZ/eu8nHmGDAgTwYrJ1tXDoos1gfxNVMb+KNEqLwv1E/3YjZQB23hLE/aBwBnVDkazZOd+pNNxfHzt24VyQlQQZ4tb4gnbHEeU27OryF9iXr4TkDu5g+51FAgdQ+Zz4DxUkvgzyWFSHiLnqbJ20XzZDd0BHJp3gE1QOdYMqZ4hVpcTHH24aFt/cAZsazbcvYKEne7dWZaZhmVArvtOb1Ksr/ZY+UuWQkUnzn3HIoijgsP/v3B4zY2/w5AcpQWM1oPBhVR5kOzKxKuxbrtxaKOFBxVWCg6yYXKjPhkwJ6e7f3K9ZYFlyfnvf48d55NX+4H2re9ljB37dq9uYchHGg1ed8zCq0pJigiCarunwmUaGRxUgPioNo6uCAvVPpqoc5saV6TNRqpMMOtfr+EqVo9jBNM7jGZrMJiLhyRHfzj/waMQNsVjKXKvy7qnWvGu0SE30lv/su9mNSHko/0Sri7/FZqkqejdDPLk5+VKV0foNUTiHMzHwlY0QG94WmkPRoe4zN1eMCuzOS+u3nRcc8UOGK/DACJPDbdKuW/qC19QwqQEbv4MywlsjXEbTMr1wGy7rnUPdAfBZPObmWinLkrUncdUrIzFo4YOmnTFOKupDFDryqhDGuAorifO6iWeeYEvsgE4+3SedUcn8nsEIkxJb+Gfm1kg2YbumNtKG8sMEf/romGluSPeCQM43XP66yzOBqeN8TSL0S4Fr32Xts2j7tbitQ0sIhxkOys7B3A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y5sSWGtitI5+XWDiJsL6Wt1XdZiSqjUkHqUJsxJxNWsdmpWwWcQmwlZ7KgVI?=
 =?us-ascii?Q?QXhlo2rqkGJED9/6zd1x3eTDVoNmRCcW1T70vMIgM0Ai+Xv6gQDUZ+ZhbV1i?=
 =?us-ascii?Q?c4VjGTTkTBQ9Skt6+whSOWv4XoK4R8+fYRx0GOnbyQju2Waq/rHvwGFT1YtJ?=
 =?us-ascii?Q?/YsSmwnU0sgZwqjMxK39lA5preFxhuocvfGzQPw0trvHQe240yNtepu5Ma7y?=
 =?us-ascii?Q?O7sW/ShvQhb0TnnUoBNY2E/vlptbUlHpmUrelq5w6FRPDjRyYxQdw4mgYxu9?=
 =?us-ascii?Q?GdvyEAHHbx5r2LyUJ9ZYr0A8RlZ0Lz0WNcjlqOWGQruQRPtpPsIc1bKUDvdo?=
 =?us-ascii?Q?r2XK0ZGDN5GXW6DQB3FZqBRI0uslY57Lk22h2WoZTdlmkm/wBd53PLqX37tI?=
 =?us-ascii?Q?EBDfiiIFKLZhgmCexGcCKNzdXamv58hfl05XngINsdmRiMiDX5/jNcyIcjpt?=
 =?us-ascii?Q?0GAIxJg6COdBWKvo+REhCEpBpM3KfH2zaBsezFjoV5r4UU7jJnfYkHlf5945?=
 =?us-ascii?Q?QMQ0tvcfaboiWZIXWyc4KcZBW7qmLRS0bcpD81nTHEnjuJxgabZbwjJLM6Js?=
 =?us-ascii?Q?74R4W0jvQWUq99S+2sOEvi90YvN36kcz0rxYqCAwaGShh9NuHkxafCyRyHbh?=
 =?us-ascii?Q?gF9frlQZ7oLVn89zcncBXRCk6rvbIIOZbmaOw83CDFwCJH59cG651dNQWua4?=
 =?us-ascii?Q?ZGvYZxojhaCsaC3s4Z8lx97R37XFv098jDP4arOvrQ/cyfZzaORrQMC/VRCf?=
 =?us-ascii?Q?wiFxhHzIyeySzcIzpm1sQb8JWymxhZCCJ8M+5zsCobS2Y4t8KWi4Ssk4745y?=
 =?us-ascii?Q?a/R8Tk7Dw3AcL0DpV0/R4GB048wewHfoUTKYcqJ8Am1lWG0z2sbrwPJFQM28?=
 =?us-ascii?Q?4AO0rtv0SB7Sl/wHLjmp8sgUpSukHK1S+/ZL3mtQzk2KJc16KQ+UxaGTNjB1?=
 =?us-ascii?Q?KIqGKpL/FaJXPXgHpQy5LurrARAiLzuMhxFDs4tFONN1QZvGb1Nkv/6Rob0Y?=
 =?us-ascii?Q?uxZOjizwf6h+r4MWmu1RkTsmkgU3GmiuIO1XPHUlIQpkXn4SBMYDDhBGuacg?=
 =?us-ascii?Q?H+XU8FXIfH63IKGcfU6WtTOwe8kkxcq4bSOQFkrh/LDMGqUvrRaL8NKsq6ma?=
 =?us-ascii?Q?NbjdshvldluBAVlD2DZtijtcEafBA9S+9KHwtj4l7qsEUznhOsBfb5M2vyAw?=
 =?us-ascii?Q?XTAmflr5iqHLpEUntEZXiGdhviHobhOjscXFsFsBDT/DJ/nBK6aOuTs7fZNL?=
 =?us-ascii?Q?vkTuHAtWZlv2Viwsscc9cK5gsWDL5iIRb/mW0WoVi1LDLsQ+GGDH/SMdxy4L?=
 =?us-ascii?Q?RgE3zbQtbVfJR19VG8jhHsvGQopSjdv4oBo2JsmHPW8eBO/1xa+Kqnws66tn?=
 =?us-ascii?Q?RO6qMC4vRwErt6DzkPG0BguRwpO0xb1torrlxJeLKUK6bV88rKFZqulKTrfF?=
 =?us-ascii?Q?azsBgVdvFWc4xRj3VFl/YuvTAPfSJAgijMYv0zHazRM1fqlww43PX+Opt8yi?=
 =?us-ascii?Q?5XdVr/RwHjW7MxhIWzDKCb//1WgZZD215C5MbA0KItAclZVMN9pJuHrMMvoi?=
 =?us-ascii?Q?Icc0U4v/eA40oWtCRSbmYcom6JfvOV7o71FJnoThtB5qdhYZKgFetfFzum9j?=
 =?us-ascii?Q?B3kGpkgOxoFc1lX2nk5xX2k52rn/nNnOiB149oZ6j2gbrF9+fIU0e7yuEyhC?=
 =?us-ascii?Q?rDGuWgbp/0VfDiDk7gOcH6ByUzsuWWaPIC6Lk/AA5Gxc9r6N5OR4SolAYc4q?=
 =?us-ascii?Q?pLOcPDxhyQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: skYVwoUt7Z06m/ApQDHhEGMdv4LuJlF3Sjo0zS20ys+V1Ne2jNzRF+HkB7GncQySRdSQ7x2YQ51BHUrUyhTcq+bmxOaGHi798DQftEdNkhlpWYvn6Kcvy8OlN8f4kE72JeSsaTNftGDPd3qDV2xMfdXYdBN+x/gs4WptdZ2w82hCvSpymO9mjk5AYt2oJElJYzA/vbgQYzT6w4ZEu4E6pPW5rLQJ0jYep33+b1dJdWw2BBtznZD/Ff3yEpM+RODxp2dtWz8reXq7kVoHLBVfrFujyBCaUEsFzHiR7q1Ab+a1xcxxr2r2E7JyMNVUwgWiSba+wgpNI5yDA2ERT1bfdA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8633fceb-9f21-4b4e-03ab-08de83e56a8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 05:24:09.1012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KAQJ1h2WqcF4f0hR6gyNG2vheS0AmX5oM9TBQA8wYu5vVHLe6gz2SJcQvl9zXaqGunbbGyoR1/k4FV9G5NCi8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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


Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Monday, March 16, 2026 2:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
> assertion and cleanup helper
>=20
> Introduce two new helper functions to improve CRC-based test robustness:
>=20
> - igt_assert_crc_equal_stop_on_fail(): Wraps igt_check_crc_equal() with
>   automatic pipe CRC stop on failure. Stops CRC collection before asserti=
ng
>   to prevent test hangs and resource leaks when a CRC mismatch is detecte=
d.
>=20
> - igt_pipe_crc_cleanup(): Safe cleanup helper that takes a double pointer=
,
>   stops CRC collection if active, frees the pipe_crc object and sets
>   caller's pointer to NULL. Handles NULL and uninitialized pointers
>   gracefully, making it suitable for use in test fixtures and teardown.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_pipe_crc.c | 50
> ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pipe_crc.h |  4 ++++
>  2 files changed, 54 insertions(+)
>=20
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c index
> 9a79edd51..12f13cd62 100644
> --- a/lib/igt_pipe_crc.c
> +++ b/lib/igt_pipe_crc.c
> @@ -134,6 +134,30 @@ bool igt_check_crc_equal(const igt_crc_t *a, const
> igt_crc_t *b)
>  	return !mismatch;
>  }
>=20
> +/**
> + * igt_assert_crc_equal_stop_on_fail:
> + * @pipe_crc: pipe CRC object to stop on assertion failure
> + * @a: first pipe CRC value
> + * @b: second pipe CRC value
> + *
> + * Compares two CRC values and asserts they match. Unlike
> +igt_assert_crc_equal(),
> + * this function automatically stops the pipe CRC collection on
> +failure, preventing
> + * test hangs and resource leaks.
> + *
> + * The pipe CRC is stopped before the assertion fails, ensuring clean
> +test
> + * termination. Detailed debug information (CRC index and values) is
> +printed via
> + * igt_check_crc_equal().
> + */
> +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> +				       const igt_crc_t *a,
> +				       const igt_crc_t *b)
> +{
> +	if (!igt_check_crc_equal(a, b) && !igt_skip_crc_compare) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_assert_f(false, "CRC mismatch\n");
> +	}
> +}

In my opinion this helper is not really needed. It does two things at once =
(check + cleanup), which can be confusing.
I feel existing helper igt_assert_crc_equal() is enough and clear, and test=
s can do cleanup where needed.

Regards,
Pranay

> +
>  /**
>   * igt_crc_to_string_extended:
>   * @crc: pipe CRC value to print
> @@ -407,6 +431,32 @@ void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
>  	pipe_crc->crc_fd =3D -1;
>  }
>=20
> +/**
> + * igt_pipe_crc_cleanup:
> + * @pipe_crc: pointer to pipe CRC object to clean up
> + *
> + * Safely cleans up a pipe CRC object by stopping CRC collection if
> +active,
> + * freeing the associated resources, and setting the pointer to NULL.
> + *
> + * Takes a double pointer to allow the caller's reference to be
> +cleared,
> + * preventing potential use-after-free bugs. This function safely
> +handles
> + * NULL pointers and uninitialized CRC objects.
> + *
> + * This is the recommended cleanup function for use in test fixtures
> +and
> + * test teardown code.
> + */
> +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc) {
> +	if (!pipe_crc || !*pipe_crc)
> +		return;
> +
> +	if ((*pipe_crc)->crc_fd !=3D -1)
> +		igt_pipe_crc_stop(*pipe_crc);
> +
> +	igt_pipe_crc_free(*pipe_crc);
> +	*pipe_crc =3D NULL;
> +}
> +
>  /**
>   * igt_pipe_crc_get_crcs:
>   * @pipe_crc: pipe CRC object
> diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h index
> f648b2c92..1863edc14 100644
> --- a/lib/igt_pipe_crc.h
> +++ b/lib/igt_pipe_crc.h
> @@ -41,6 +41,10 @@ typedef struct _igt_crc igt_crc_t;  bool
> igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index)=
;
> void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);  bool
> igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
> +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> +				       const igt_crc_t *a,
> +				       const igt_crc_t *b);
> +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc);
>  char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc=
_size);
> char *igt_crc_to_string(igt_crc_t *crc);
>=20
> --
> 2.43.0

