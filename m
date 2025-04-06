Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7344C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6006310E083;
	Sun,  6 Apr 2025 16:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2FoTXPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0CB10E083
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743957977; x=1775493977;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ikomEWQroSeWBsS7LvEy1RkpYk3zPL7I3Mad1iCZtj8=;
 b=G2FoTXPCprr3DLPKfTevj5lv7ZbMVwNIFRvLCkG3KOdvWZG/o0MuzkuD
 lbDyRoJ00HNA3mX71IYATVI/rHCcHIvNepf4dyb7lApFHS5+6FlrV/EUP
 cCfHy7ZamaQLP0avPhzCZpa1N50jTgPHG/oWiOTno9J611YrB9/9lX9KE
 kewzHhiUFnjI1bR4om6NJu5v6f1ke+cNsYnjDbwlFUxWaa+K4bXLMlGcn
 mSlID+5VRgH5S3qqQxg5+Z1bkpjh3c7MYGpRtnGhGHdbbg0/yH7IEN7pp
 yOkbUU7Z9cUzRB/1WYQT5fy6tZCwwAPWcKaiU9LyxH3ZGdyuQZXeERPGn w==;
X-CSE-ConnectionGUID: 96QFe1KZRIKJSvLHkybTqA==
X-CSE-MsgGUID: hzE2rGDZSLiVNou7qB5xUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="48995320"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="48995320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 09:46:17 -0700
X-CSE-ConnectionGUID: jYC+clRISQqepmhxTaxWxw==
X-CSE-MsgGUID: enYKN/C8RU22NFk1g3OWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127582161"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 09:46:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 09:46:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 09:46:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 09:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ0r8YuX1hkJOjq80oFwCkvmAgMG3pvhOacgR8qlQAE2gfcdqzrGL+e11cmWSaQLla16fDLnXlvi8AdVz7YJ8niFGhxVyo7hQrO3CD4M38m+bamI+MHlHiet6in50y201O0s0Ck7yfg0DXyM1GEpslQjTATsCqNGP2v5EisU3TFSD+igoq/Lz91fn6mBTa7aM+5uKTmoDNsW8k9UsjUAbHDn0uaXyNYQwB5J37xTeUgdYIEmMTUB9NEg7nCIvMSzg/Mq5IdWnjG8iSRtXNpKrUqwheTH0IZ2rChfEVOCp2TGkesXEcMWDRNRlPurqXrsHUnWElTn9SPMnakIyI7qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVS/BcZ3WXFQiCM2xpqClAX7Ry2z4UEmEuUa8qjOoqA=;
 b=gQpSSqPX4oUFrZBZSBl5+Lsql3Ci+GHjr3ygP6o/kPEuT6GMAq19w3KjycLjAFDLTCzECER7a9lTzoeOF2B/B88Q1/+OaTXiYQyiU/r38sZN0w5r0lPCeFYBSQr+wocnjqsg8KA/AWNuO1q7oseAWuo6irNBrK3Sb5fAxSQhNqG2Uu6Xp9ukkTwBi+RaGhNa+9oX2hf+oWhWczBQQeZWi7/mWxfkJSHZAldrDNEE11Tupi2zht/tVSq707hBOagJg2eH7pKQ+/nB5fFr2Emf60cVnnj+7vlQfHT6x06LJZ0sDfnEIFZfg9gqO0rweP7YkFmwbjHwTqqF1g3UqdvYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sun, 6 Apr
 2025 16:46:11 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 16:46:11 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v8 4/4] tests/kms_async_flips: Remove allow_fail
 flag from async flip tests
Thread-Topic: [PATCH i-g-t v8 4/4] tests/kms_async_flips: Remove allow_fail
 flag from async flip tests
Thread-Index: AQHbnvjGxKZTsU7rAEyJcKl4nYyLrbOW6K2Q
Date: Sun, 6 Apr 2025 16:46:11 +0000
Message-ID: <SJ1PR11MB612977124BB32FCEAC368C12B9AB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
 <20250327090851.2740672-5-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250327090851.2740672-5-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA3PR11MB9062:EE_
x-ms-office365-filtering-correlation-id: d87667d9-3f63-47f2-9110-08dd752a89a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zY4EQCTSuAJrmbPSI/G4ZhsjWRl828KACwC3ZL6rRXJmmUXU0yG3O7yn4/P9?=
 =?us-ascii?Q?dlpNaI14Sdv96JFsKIjdwke3M51wYGVEoxM2cr8860VXNm7W20pGxaN+czwe?=
 =?us-ascii?Q?q6Z9T+U2DZDQ2KkhaQrCfXgcyEeq9PwNw8PubJAUpyEYmUZR8/1Pf5jhqPEw?=
 =?us-ascii?Q?hzsArzHvFfJM/hCDvEKPW5sJ9vtdLO/cE+RMzfQXhIcbJfrN+grJ2KhKDldT?=
 =?us-ascii?Q?dlTnp3gpAJ68rjftEcnsOP4+QlAokTlRj9Qw3NzAKXsWOusjws3lM4yVcZXi?=
 =?us-ascii?Q?uuDggtNR3W0bYMVmEAQbuYQgcfSS8AUijBk6sIT4H35jvPDINRGQInVeqxV9?=
 =?us-ascii?Q?hAwvbB9F3454BN6nM/U19l9flQdY822qcQ/cfDer3vH5MfdfYEaMxMkfieHb?=
 =?us-ascii?Q?vlBjNQJ6FCpMbqw1rIRcl82UzL+oE/am2syIGMAkaTCKof3HwcRPiRoCshG4?=
 =?us-ascii?Q?kiZjRTgmu40atj/bDx3B9noKskNqSdxF5eF34z7W9BPfzXc60Mpt5dgvokhG?=
 =?us-ascii?Q?uxWdIvdzssuJmC3petHftMPUkCQHOz5ijBQRfcpFDvN357VnWsDwOXoP5Tb6?=
 =?us-ascii?Q?oOO5TUTAMzRia4dmZsLtkuDpeeIqIjB9hIyiBx86KH/eLWjR6tYpwswUoNZ5?=
 =?us-ascii?Q?WCpGSgA6ktjRlJ0ppf1a9tRm09Va201rdNlIJvi+D//eqUyGi5C+cY1dS/6k?=
 =?us-ascii?Q?aBXe4UGkanoHgruaGC2k9wc/h7ny0hPBeYyuc/Ig6yRYlY8RtmNAAMz/imQO?=
 =?us-ascii?Q?Vg7aShrg4lfcIdmmKx2UopGELARp2xX+4i8NTQArJ9Sk0ynn6/0/x78gRmSZ?=
 =?us-ascii?Q?3iAw0IHTP1848p0CLX3BqTkmj3zMxYQF0osuigJLqwGP20n9gVFXvqGXq15y?=
 =?us-ascii?Q?RwPeZCtbKSLLj6a3lgK44enfj2k4557h2PlnNsTBT5BiN9CVl8LjegHs73xO?=
 =?us-ascii?Q?4/IWPtnvDRgVs1jneXeYAT6GBwut5WBORkEnzakLmRZMUd1ZI1V3vA3LczYC?=
 =?us-ascii?Q?N/fm9V4a2iTZJctR9DRBDFt6ICDpfHQ5un8/CS0lD0uxVpjJ7EHVS4ke/ZET?=
 =?us-ascii?Q?EwKuFeMEJoIHwqSsJWil5q5je4R5UFJun7223QCneV4bFxyw1BrVGPn2BEmF?=
 =?us-ascii?Q?W83SlbVQlwQ4299NvBaxM1lutYZgXOmNjKipQJwiAo5tr3gm5CENH8qh1tiV?=
 =?us-ascii?Q?yF63BnTU3sNh4TU+Rcx0fhzcFrTN96koWonkgQ7KoNKLkJuwtuap2VAe0YOh?=
 =?us-ascii?Q?+CNA6nrPZo9ztqEKW8mjOwWTUdJntSYxYxIdB3NW2/RxydGpmsQpV6w6jkth?=
 =?us-ascii?Q?UZDL3mnWflJ+TWrhWfBOJa7Rgu5YXxCWe9IEWo3a1V+EyzbwUAmizzCAj4mP?=
 =?us-ascii?Q?2ajrO+2UmrsWvK58pbmk2ox9+gAEfuJOtQ2DpC0Slq0gyFtGPGTZ82aPiNyb?=
 =?us-ascii?Q?+qQ9xpMWP88wRozP1DooYpF/uFDDvP8z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+8BS+m8RoFFgl/l+CVhN+rUnJ5M3uG9N4+olTjYVL3YwXjqS4YKWUGD+uPeN?=
 =?us-ascii?Q?HjYm3CSodtWwsrLUT8Awv7As+iPbfgaCJ8KyKQi0plW94+GzUFdartWx54IT?=
 =?us-ascii?Q?D+wK3nR9D4cCRAU2irnAy7deMsDWbzof9b5KB6M7DA1QI/esFBKWnmQFZSYG?=
 =?us-ascii?Q?LvLSHNppsxEqHLewLWZu5AxvhnLEz0X96wu3NlV/L7FE64Ve3NpDRRWAoLWn?=
 =?us-ascii?Q?1AaxXWLWekL+Z2BflOAonsJs8/hFFLq3FtoZSc2fVg7+nTf+rOMLiezfYUPy?=
 =?us-ascii?Q?ADCoyExhIA6e7jn1BfUxFFeGdVq6A7mm93FJTNtONOY4uytUBq0+amn7/FY9?=
 =?us-ascii?Q?ipON45CjnkFXc3FegNlAuwuO4ABNEdHeV3mPAUfwME9x2/w0dNTQeOaASQJa?=
 =?us-ascii?Q?MFWOpVkwk1ji9498BQuHfbYVXQ5QvGHX8Cq+wWV74aKk14L6CSQmYtIm/6Jb?=
 =?us-ascii?Q?fES19jVXpwx3Hc0mfUwsy81XDy2ClhTnT/1naiAc2hagxZ+mCIHEznjwYjmR?=
 =?us-ascii?Q?8/BB3Qi965HfdUl3fLx2najiB3FSfWSzPhkQWwvGdtsrWzfS5TK9WMeyfZnf?=
 =?us-ascii?Q?dNurh4ps6wThorDlCYm+fex964pzY8g7Urvg23/WbvVeqRz+hq9BipT1m70g?=
 =?us-ascii?Q?4PoKCUvJpN4E45+UHz1C8puSUtkHhzjGJ9O1DxacRFca2NzBl7bCSLVcVJ12?=
 =?us-ascii?Q?iMsNfWpcx1QdJqJ3pr1RCFjLgeruI9QxobjQhb1oQqZWKQ7XUrN8oERf1b1Q?=
 =?us-ascii?Q?lpWIMRvYIWUd1EVTKuY99Y1MpLr5pMuSq5COkKu4u97e6DJjPzWx407mlNnx?=
 =?us-ascii?Q?UfxCvBkMOsB+zl73ZhRTsjf5Xmrc6tF01svqrYKpYjxVjqaq40qG1OuE5lMY?=
 =?us-ascii?Q?+hgIZTF/mQl0hwmngexqzHNf5/4+UIZE4kXjJerncl27u0U5pw6e1ZF8HvWP?=
 =?us-ascii?Q?7QHgTRdTGLZ5LHXfrL8zxgnnmTwjykM5gTAuR537CRY41isGxBBaEDHvvgVU?=
 =?us-ascii?Q?KyeqqCLJp3SZiLPrPUQVgBH7UvVUtpHdNL4rDvxKK7GPTXU5V6KBRfyot82K?=
 =?us-ascii?Q?uG2h32eNawpjxHU7aT2ZooelYO0pH8lPFy1uxd3VH7EYk6b3HpHGNEuV1mbC?=
 =?us-ascii?Q?rvYepgsLksbxYmQZyTx5j9ACrtzYmIoZcXIfY8SGE0QAxy78Bo6RbhaIAzny?=
 =?us-ascii?Q?ccHhqLZ2qD+2RQrBBuotpQmGwi6PVQ4vCamtnDrrFS4Z62jETzzKqz52ZO93?=
 =?us-ascii?Q?RCuFA+m8oEhYLxxdmQqNoZXMkih7HSx5QIYj+MC5tGUJcVGL4eNuqtAJ/DID?=
 =?us-ascii?Q?ZCv4RURYlhXlwCUwwNnU8EhWj7CvuysPPzsMG7Om9sZn4vzYMmRI8dl0X75R?=
 =?us-ascii?Q?ysCXlV8R3INYXta1coaaKLufzxBv3PruhVhVNWsAvPj7S/+5HwiJjhbNtuxt?=
 =?us-ascii?Q?gvAt9Vn42kfEJGh5LNPiY1ci90wKIJ+pOB3Hn4E47WV6ZSeB2X1Z+5u7vsCr?=
 =?us-ascii?Q?4nCimN0PtPvTayJT7aHDOzbPapRnx8WVfs/6aLhfnN+kZ9g0xbVeKSiNrTzK?=
 =?us-ascii?Q?u9BJO/NyjtpD5oa8z2oWae1X/mmnO8JNZRCxXIbFwD4+J7BU4Bj7KpLeWdm+?=
 =?us-ascii?Q?Mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87667d9-3f63-47f2-9110-08dd752a89a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 16:46:11.4495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EiooxfQHSKHSbi7tKRs9CvpOXOVi5LKBIssn6IqC14CTNiE3tiqLB1qg1GugdRid12/tvX9j4gRVzYRT29yE74rcLjwFBK2hxTQzHCiW8oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, March 27, 2025 2:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v8 4/4] tests/kms_async_flips: Remove allow_fail fl=
ag
> from async flip tests
>=20
> Remove allow_fail flag as the async supported format modifiers are now
> known to the user space. The test now executes for all supported format
> modifiers.
>=20
> V2: Remove check for frame 1, as no longer needed now as valid
>     modifiers are being in use. (Chaitanya)
>=20

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> c3a875ced..233f54f0e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -123,7 +123,6 @@ typedef struct {
>  	enum pipe pipe;
>  	bool alternate_sync_async;
>  	bool suspend_resume;
> -	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
>  	unsigned int plane_format;
> @@ -346,11 +345,7 @@ static void test_async_flip(data_t *data)
>  		}
>=20
>  		ret =3D perform_flip(data, frame, flags);
> -
> -		if (frame =3D=3D 1 && data->allow_fail)
> -			igt_skip_on(ret =3D=3D -EINVAL);
> -		else
> -			igt_assert_eq(ret, 0);
> +		igt_assert_eq(ret, 0);
>=20
>  		wait_flip_event(data);
>=20
> @@ -724,7 +719,6 @@ static void run_test(data_t *data, void (*test)(data_=
t
> *))
>  			continue;
>=20
>  		test_init(data);
> -		data->allow_fail =3D false;
>  		data->modifier =3D default_modifier(data);
>  		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data-
> >pipe), data->output->name) {
>  			/*
> --
> 2.25.1

