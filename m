Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD160C04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 02:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4942F10E071;
	Sat, 18 May 2024 02:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F00zBFCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CB610E071
 for <igt-dev@lists.freedesktop.org>; Sat, 18 May 2024 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715999227; x=1747535227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iNl1R4wZOVCabVc/mXwQ/Ef1Mh9PQM1How32JtyWND4=;
 b=F00zBFCEOC33+0K8+5w4EkaZDZ9oXpulGQ+waZu/Jpdu5Pv4BJ/Pk3i4
 XwYdTGbzgdq3GQtJuVK/sGxffiFi9SoClQSaDHeKngW3qO3MvxxDPpa/4
 S1VzjxbFNTJO+2HW9XZYr3P1wzBzcK+EEP1KvyqtXjmn29V1QUxZfJvB/
 OKPQwl96prQh/qHZdCm3QpUrjF3hPy6Qu70P4N346ByW4AnwHa2oKhoKi
 uIKVeI5hHFPM862FChEafUpfAmMsjIx4XfA+hR+SyuWVIIeASYVXUnwbo
 mSuBuVed9sIcUxdJdnx6NP8zSgVdRbyg+xnNdrHgrYxcsJzJceCmDURLS g==;
X-CSE-ConnectionGUID: 8S2c9zxJQASiG7II5gmGhA==
X-CSE-MsgGUID: N8FNM+xWSzejs+/Qp5edAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23607302"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="23607302"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:27:07 -0700
X-CSE-ConnectionGUID: 1dnfibgLTqS/+IjaBUVleg==
X-CSE-MsgGUID: tRMBcX3rQLWAOAM+dmjx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="31964667"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:27:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:27:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:27:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:27:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:27:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqX3y9HukqtnwG5N1tkQsGIUq4kl87o5040Zv5ihBiwp+aukObWE8mt9j/QZ3YUyRtOdUzPW3pQ++C0t2u8v6fmF0qSSS/bzcdp53mFisVx0l4l2kKZFl+t0KcQis77tP07r/soMmkg19i3R2CKbXjjcHPvXCobyTZgvEM1J7eBUgA4i8fD8sw7u885I+smrxfC3ZMwsqBqAP6RnX5pKEIVMbSQkqaHTgZqF3/4ElvnBPjY6I+S98jDj9aVG2XlpmUHwc0vKsJvyKxibnjdb74pKMhiOdDAX+UnqB7CzakUTezm1TADStp/8X5zd5k7gMMsL/0Lz1Quompg9KtdHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkPQN1AT77JMcg7VBr1D7nlV62RTGQLSgaPI4q53Bbc=;
 b=bZCG6JIHmDPrTvkbJsW7BFcjIgPVq3fkGwgCDonX2vfXZnc/WHmIx0y7h63/ZXf2y7zp2JeY4esQN4y4F8tI+8bUrzzLFeOolZQim4NOpRsc/a0WtdYlVAaVg9W5C2dFnLDcrI3lG1w+Ln6D74i9oXwaZj/SLlCOanknCbxXFncBu5Bl/BdXUN8LC3H5F/TEGX+LCxMD/ooUCdnTErok3fKU1IzfqYYcN0/ZJBnTAoYaRYVlZBQppN5uG+2jz1zHKR76HF4IeJrFn7aCVEx0FUgA1BmMUf/Ye4tVYWUDWxwX8V2ef2pPpszYZBbP7scaQgRSAP7Nc3pL70MSkjHacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Sat, 18 May
 2024 02:27:03 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:27:03 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 08/10] tests/intel/xe_svm: Add svm-benchmark test
 to measure SVM performance with a simple benchmark
Thread-Topic: [PATCH i-g-t v3 08/10] tests/intel/xe_svm: Add svm-benchmark
 test to measure SVM performance with a simple benchmark
Thread-Index: AQHaqE/qY8q9siSRTUSLF8WEYRHBPrGcQ03A
Date: Sat, 18 May 2024 02:27:03 +0000
Message-ID: <SA1PR11MB6991ECFCEA6DAE8C12A6734C92EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-9-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-9-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: a46506cd-ac58-4497-16ab-08dc76e2010a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?nvoyL5J4IyDh7r3lFneOQomah5NQwwtu8U1ykhaFVmAq00UzpAdKCC2M51o4?=
 =?us-ascii?Q?qNmAHXbyoPCk8YhIZItvTNhdwoBdJ2O5uEyVNE1qC+aiP+gDLP7FjieErF4Q?=
 =?us-ascii?Q?PWYnwdZg7kHjr3M8eT/4oN5EJpAtWbmHsPP1XCPPax9dOOitU5a8R1Qo9L8U?=
 =?us-ascii?Q?BKU+huGI3MW40cl1I+nrLPbj7lcCWR+8fjzl9gw9S2Jdb1xHqhNwxRtiJwTj?=
 =?us-ascii?Q?cHsYrympAiSVRRVZcDJ1AiFOkTKoR8uzB8/9bxLApv6lNDtq/IuvEUtaEx5H?=
 =?us-ascii?Q?dpMPaums0j3/0vlFPDtaJZCMeyR0QEg/EuGsm2KIjIreCZWUZl5U8i4WmIgT?=
 =?us-ascii?Q?jefbls605iozLDM338s+Tab1HmUQTflk+LY2yCi2neRqNwoJmFkUiT/uTEDl?=
 =?us-ascii?Q?QRhHWAVwHmeRekNByrJiaKuqX4ZDLfReyoFH/dB+DX04z2FWiMT2vz8ol4Rf?=
 =?us-ascii?Q?AlpzG7upe8rpJRpDXzrBv9jeMswgNH6xiLxJLtDcbu8kLoTbP90CkPntW1vb?=
 =?us-ascii?Q?0PXhVW+9VHSzt7fRctiDKCrOe2QXCwaCppVjDAJ7nwJqiNr1EcT8Qy7xqbiJ?=
 =?us-ascii?Q?5HGyylCEfKPPxdV2NGUt4e0k4+XtrnkLJK7OqeqKiCMtPsyvJEtoT5rT5Bjo?=
 =?us-ascii?Q?7j/jyxm0uBfkobJIlyIo6+i39OJXcDI9z2cuGkFJHmiUFeXnBpJpUBu0Y7F1?=
 =?us-ascii?Q?Q8fLq8ulnNOgOHkEmoD0N2KkF1zpQvb3+jNhRqyVUEtfFA484ySfKCjn3cF8?=
 =?us-ascii?Q?JTNhnHUkMHE2bQ8eF4yiNQ4EHD2QpQPwHITKTT3L40L2ZToZgpRiJ++VLhuX?=
 =?us-ascii?Q?b6ZXt7sdHlB/WIwwkzV/shoVvvSbmJN7329y7k+SZyNv18Fzzr++u69TtefE?=
 =?us-ascii?Q?2GDVs6fMyk0+Y1nOhLqlwKmkYbOSI637L3TxaE3ANZ+4NgPk0EgoAQ96IncK?=
 =?us-ascii?Q?0+nAiE0P1LD353sxTQavxGuRLm8Z0bkJNMzhIknFOXlGKH/u4cO+EC/tHzK/?=
 =?us-ascii?Q?qZET2BE9+ck1XksFNrz/VFPO4dhCQNKpycPiABVFFX3F8K6elLXqv4ScCOZV?=
 =?us-ascii?Q?VJvt/YYDhBjXgYEcClgFFFcJq/DY8SFmG7s7YdicMgrluZyXOmq7IPRjUb3C?=
 =?us-ascii?Q?1PnHkryd+yaKgWihh1dCy4SwmAg9RMG4+GGjFQSdUc4MEzvNqtuwIRn5U2T6?=
 =?us-ascii?Q?U9fVhtytQzuSERTzMzqAv77Q7IzQJshfq5+IiveiGORW/6g7CvXTQKQeiKIq?=
 =?us-ascii?Q?NFyAAJjhojcOTcIY3BhdLxMFZgB9Wb8B8MiKgwXqSZzufcFzlnYji7y3Lf+O?=
 =?us-ascii?Q?hmSikntOQA4ocxpySwQ7THcbEr3OvkvAkW8vmgCIJ4iY6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BzaT603o9Fe2VLQSuxyCOmMlSTpB7mn7ldsdwa32rsaD7RAhirawDUFj8J2K?=
 =?us-ascii?Q?4EIJS4Gm0xUzjcjcw8ZDDJ24mY5rQ40bTWKS1DuUan1552OykQ9Pypc8onJY?=
 =?us-ascii?Q?OS6MfiRA9KOoOAYegMlnv8SWKUDu13Tiy4rosJiGYdumOpJmjSIdvA+ccgSn?=
 =?us-ascii?Q?HZMXcRdJ1vBCgZxgvWvyLUH8g4k4a8YYHeICIB67lHLyKdmodXeyIHqZRNGf?=
 =?us-ascii?Q?0IACq9/IE94B8kbAtacgxEVYPOdzWMWQeiI9LVFyDbUrVw4emPWfjLHh2EYW?=
 =?us-ascii?Q?PdkIL+Y5XNKA7sq/GBmYIBc9bC0LJN90JcpRXzIUyCyqNnE1z1IS7aVLCoiM?=
 =?us-ascii?Q?QWGo+9LMvpbn0Z5RDCKbkKjrrBdnx4xbLu7p8mFkeZRn+xeLOsOddccCQtE4?=
 =?us-ascii?Q?CwchgjZ+jV2/TBFOyXJNHhv2t66rMNdyyb2YeuS5oJ2NR4OzpzWgxJxGhiWf?=
 =?us-ascii?Q?pIwOI230oAtT9YRY+WDAhcobwXx5KIrc52T8r6Nc6qj6+FmTDLnfcwKyfarx?=
 =?us-ascii?Q?5RDkrpyOJZn0aayC8pm921OU++jyOLeevOqUXvQvb9Kt/iIHor/+uiesvrM9?=
 =?us-ascii?Q?ezMkJ4xAeuvgnbqHpWFis6RPJTxbO1zNObII3bVKVrp5hSp7/Ry9bCQRf5TW?=
 =?us-ascii?Q?PZLeLPAU3gVJi6xSUJgwVDhpqWXBOfQnCi0Rc9Z2PpXZ96FFNUALD7H8GyhU?=
 =?us-ascii?Q?4LKgSi1ZLrH8YkvC0KHQO6M1aj+A/+fad9r0RXsVzCn67ZjOijyAHZvRB/n9?=
 =?us-ascii?Q?buMNy6hn69M+balGr4gJv1BG3OnFLZbl0fggHVY9UEpIsh57HYmf8uuxOcE9?=
 =?us-ascii?Q?NvUOiOXSsZ0/KlFey0Ansd/kXhFmKPmagpNVocDx+h3DsaFVBEmiGoYHr6sL?=
 =?us-ascii?Q?4MLmZVaooHDbbI5DoBixBRuqI0vpRq6O2nNkj9oHvzsFVB75sZL69dlhupx+?=
 =?us-ascii?Q?IS5TRExAShNzkR9BfV9OsIUDq9YrE14t247hOMON5e7A/e62U06gFHcQAYMz?=
 =?us-ascii?Q?EiaJAzDnacNPhQfCdXZeKrxj0c65Bsl5OyaShRctVATac6+FKO4Pt8ng2xcy?=
 =?us-ascii?Q?Tq0trYOzm3CVR1g8hbhfHPptp+NHyquphKG/Wfngg+POGrBHMSLvklREpo/B?=
 =?us-ascii?Q?rLyEa0M2n1txAHkSy09/GfMOZJUuRl86Y44WPdbixJMZtsbCmUCtO1qe4EcX?=
 =?us-ascii?Q?OZGG+7G4VY9hNqu9bCyWbBo95Y9+7at5tnsYLVhEcYof3a8uI9AMwGhYbwT1?=
 =?us-ascii?Q?F0qg6y1375Zis/081X4JfMYtnkSABJmhXwzc2L9ds/j8psmZM4phkMM1wKm8?=
 =?us-ascii?Q?VMF/EaPTFimcOv+6j7DB06gaZkbjyf2c3RI6CKxtku6h5rpB08ydb7QXwdDH?=
 =?us-ascii?Q?Lz9ozbVxquOFAHTUspQt1Ww0vFKKOKgVzo3Bwz37FF5Ebwc2v6RUr1YM3q9U?=
 =?us-ascii?Q?z2LNwUIuFXQdBDYhMAtkgq7FOJ5VUevNHnVcktJcwKZIHw1XNnYU1bT1PHFY?=
 =?us-ascii?Q?exa5rS5xWo7xSyVIcK8UPQBj1rpd2xBgumRoycHaNeoPXDHUhWSLEaXtbdpg?=
 =?us-ascii?Q?D0nr1jmJYnT+Dh+ng1nCzZdpUff7kFqXB0zohlSR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46506cd-ac58-4497-16ab-08dc76e2010a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:27:03.1684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDl4o2wf6aLwLRiSDlZIUn0tsNGbhUPN2Fv8RA51rEe29Dhwj3hFJKamZrZxF3npqKGR+Hh8tDMEgCI4PQIi2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Friday, May 17, 2024 7:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH i-g-t v3 08/10] tests/intel/xe_svm: Add svm-benchmark tes=
t to
> measure SVM performance with a simple benchmark
>=20
> svm-benchmark test provides a basic benchmark to compare the performance
> of
> system allocators against runtime allocators in SVM scenarios.

In the i915 igt, we have a similar benchmark test for runtime allocator, th=
us above description.

In xekmd igt, right now we don't have a corresponding runtime allocator ben=
chmark test. So we need to modify above description.=20

>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/xe/xe_util.c     | 34 +++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h     |  5 +++++
>  tests/intel/xe_svm.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 672e9dcef..c19cdae0c 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -128,6 +128,24 @@ void insert_atomic_inc(uint32_t *batch, uint64_t
> dst_va, uint32_t val)
>  	batch[++i] =3D MI_BATCH_BUFFER_END;
>  }
>=20
> +/** Insert commands to batch buffer to memset dst_va buffer with val
> + */
> +void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint=
32_t
> val)
> +{
> +#define PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> +#define MS_MATRIX		(1 << 17)
> +	const int page_shift =3D 12;
> +
> +	*batch++ =3D PVC_MEM_SET_CMD | MS_MATRIX | (7 - 2);
> +	*batch++ =3D BIT(page_shift) - 1;
> +	*batch++ =3D (size >> page_shift) - 1;
> +	*batch++ =3D BIT(page_shift) - 1;
> +	*batch++ =3D lower_32_bits(dst_va);
> +	*batch++ =3D upper_32_bits(dst_va);
> +	*batch++ =3D (uint32_t)val << 24;
> +	*batch++ =3D MI_BATCH_BUFFER_END;
> +}
> +
>  /**
>   * Creates a command buffer, fills it with commands using the provided f=
ill
>   * function, and sets up the execution queue for submission.
> @@ -143,6 +161,22 @@ void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> cmdbuf_fill_func_t fill_func, u
>  	fill_func(cmd_buf->cpu_addr, dst_va, val);
>  }
>=20
> +/**
> + * Create a command buffer and fill it with a two-DW command function.
> + */
> +void xe_create_cmdbuf_fill_two_dw(struct xe_buffer *cmd_buf,
> cmdbuf_fill_two_dw_func_t fill_func,
> +		uint64_t dst_va, uint64_t dst_va1, uint32_t val, struct
> drm_xe_engine_class_instance *eci)
> +{
> +	//make some room for a exec_ufence, which will be used to sync the
> +	//submission of this command....
> +
> +	cmd_buf->size =3D xe_bb_size(cmd_buf->fd, cmd_buf->size +
> PAGE_ALIGN_UFENCE);
> +	xe_create_buffer(cmd_buf);
> +	cmd_buf->exec_queue =3D xe_exec_queue_create(cmd_buf->fd,
> cmd_buf->vm, eci, 0);
> +	fill_func(cmd_buf->cpu_addr, dst_va, dst_va1, val);
> +}
> +
> +
>  /**
>   * Destroys a command buffer created by xe_create_cmdbuf and releases
>   * associated resources.
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 46e1ccc9a..50f2a4bc4 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -34,13 +34,18 @@ struct xe_buffer {
>  };
>=20
>  typedef void (*cmdbuf_fill_func_t) (uint32_t *batch, uint64_t dst_gpu_va=
,
> uint32_t val);
> +typedef void (*cmdbuf_fill_two_dw_func_t) (uint32_t *batch, uint64_t
> dst_gpu_va,
> +		uint64_t dst_gpu_va1, uint32_t val);
>  void xe_create_buffer(struct xe_buffer *buffer);
>  void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill=
_func,
>  		uint64_t dst_va, uint32_t val, struct
> drm_xe_engine_class_instance *eci);
> +void xe_create_cmdbuf_fill_two_dw(struct xe_buffer *cmd_buf,
> cmdbuf_fill_two_dw_func_t fill_func,
> +		uint64_t dst_va, uint64_t dst_va1, uint32_t val, struct
> drm_xe_engine_class_instance *eci);
>  uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
>  uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
>  void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
>  void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val);
> +void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint=
32_t
> val);
>  void xe_submit_cmd(struct xe_buffer *cmdbuf);
>  int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
>  void xe_destroy_buffer(struct xe_buffer *buffer);
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index 895cf26ac..072a602b1 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -39,6 +39,9 @@
>   *
>   * SUBTEST: svm-invalid-va
>   * Description: Verify SVM functionality while accessing an invalid addr=
ess.
> + *
> + * SUBTEST: svm-benchmark
> + * Description: Verify SVM performance with a simple benchmark test.
>   */
>=20
>  #include <fcntl.h>
> @@ -301,6 +304,47 @@ static void svm_invalid_va(int fd, uint32_t vm, stru=
ct
> drm_xe_engine_class_insta
>  	free(dst);
>  }
>=20
> +/**
> + * A simple benchmark test.
> + * Uses the GPU to memset a buffer with a specific value and measures th=
e
> end-to-end bandwidth.
> + * This provides a basic comparison of the performance between the syste=
m
> allocator and the runtime allocator.

Change the description as well, remove runtme allocator

Oak
> + *
> + * By comparing the output of those two tests, we can have
> + * a very basic concept of the performance of sytem allocator
> + * compared to runtime allocator.
> + */
> +static void svm_benchmark(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *eci)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t *dst, size =3D 1 << 26;
> +	struct timespec start_time;
> +	double bandwidth;
> +
> +	struct xe_buffer cmd_buf =3D {
> +			.fd =3D fd,
> +			.gpu_addr =3D (void *)(uintptr_t)gpu_va,
> +			.vm =3D vm,
> +			.size =3D bo_size,
> +			.placement =3D vram_if_possible(fd, eci->gt_id),
> +			.flag =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	igt_gettime(&start_time);
> +	dst =3D aligned_alloc(xe_get_default_alignment(fd), size);
> +
> +	xe_create_cmdbuf_fill_two_dw(&cmd_buf, insert_memset,
> (uint64_t)dst, (uint64_t)size, 0x12, eci);
> +	xe_submit_cmd(&cmd_buf);
> +
> +	igt_assert_eq(*dst, 0x12121212);
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +	free(dst);
> +
> +	bandwidth =3D
> (double)(size>>20)*NSEC_PER_SEC/igt_nsec_elapsed(&start_time);
> +	igt_info("engine class %d, engine id %d memset E2E bandwidth(include
> sync overhead) %.3f MiB/s\n", eci->engine_class, eci->engine_instance,
> bandwidth);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -341,6 +385,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			svm_invalid_va(fd, vm, hwe);
>=20
> +	igt_subtest_f("svm-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			svm_benchmark(fd, vm, hwe);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

