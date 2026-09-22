Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99C1C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 10:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2EB10E694;
	Tue, 22 Sep 2026 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOORXypF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93F010E694
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790071900; x=1821607900;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WcX1zlESzLfexAG9D8UlM00VC8sea1IW7D5DLmEOLfQ=;
 b=BOORXypFvl69SDYZhf8MCniY9qjlHi2EZ1HIEFFzurtEN6MG0jlgYzPu
 ilU6uRwyaF3TidSeiiYkjKnA2pFL9wJ1C8jlOt2HmIJ+S+0O17lEdXNfM
 ogC38yKvdW5GsSXCah/M4GkJRlYppbr+5NPFNn+jxfVSfcgEgF1ah7kG3
 BR22zBtYMv3Ka3JCDxNFBYCMYsE317D3ERB6BWNXX+H14cvr3xIOQFwSX
 1vxDS7GHW4Q9PGBOPvBDIVZvkorA91kLOpDuwC9TZki+UiFIgnCCnbj/m
 RUPz2t+iqyhftjmFuLB1BZK+4dA/i2WGbzKQzoAeWsZd8RFEnsjuUZbE2 g==;
X-CSE-ConnectionGUID: OpuDAqnLRkqYodRg5LImmg==
X-CSE-MsgGUID: N8aX2FT4Q5Wr/fct/aY5kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89583662"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89583662"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:11:39 -0700
X-CSE-ConnectionGUID: W9gNm92kSxm/hrlMqdbMDQ==
X-CSE-MsgGUID: TUShLK26SYiBsUTpiH/www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4055760"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:11:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:11:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 03:11:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtFWOhGKYY0+42bC11VvfMdhXJyy10A0Pi8Ya166mv/agQG1zcS25RfFovdFdqduHQWzvhYQBeR3AB7tNWet/5TbOlwCj1lLwI7HjHtt4FsNgcaDbG9oc6ImxMd/VSqob6Y9GjBpJCTc13fjxzmOF5GPUJvrMwdUHsAQJKh+VlMIOxAVSkzGARIgRTOvEAnomsenaXuBjpKgqc8NwFK8ofRyfLBYmsdIkicYaq1lrUwxbI6nbuAig+LF4XCfHC/iCsQIcsBN8SBsmRbbGigV35qF7UOFGSmswBsG4wXzwjUd9gvJr10jIt6i4YWX2FBCv/C0c2fTUy9l5kKzZezmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrAu556jAFK2aGcePsTm/Dx/2h4IAUMjOgqWguFex88=;
 b=MXZegdI9Dik2SLQnZSSUXRjXNS5uAr73xy6mF5mxQNKPE0XlfFCClLUY5vP0Jw6Qq0tDIIaVILnUZS1YKvN+hNaBtIzQqpSPsafGiA63doYO8l7wt8UfGXmNf1B5GDpIG28Cd9vV1FbvrElkXGhJsNlfhd27Efbs42L9VrcYJU2Lzn6pn0H4R9Wn5IjnmfoxAaYPmJeKWEgIP1r+X//VM564j+srZ6loqzIFW6/OpiS/KPAhDhyF0vCLYVuEkQncRuWRezV5avVe4g/qBV9jqvXtFfy2DYci2fY1nMY8h67GcakLA/BqSxqwZxs2hU0X7NvEt5JwPj3ZFIq3ecx16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF77ABF615C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::836) by PH8PR11MB9535.namprd11.prod.outlook.com
 (2603:10b6:510:39f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:11:36 +0000
Received: from SJ5PPF77ABF615C.namprd11.prod.outlook.com
 ([fe80::883b:5d67:c21:9c7a]) by SJ5PPF77ABF615C.namprd11.prod.outlook.com
 ([fe80::883b:5d67:c21:9c7a%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 10:11:36 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>, "Girotra,
 Himanshu" <himanshu.girotra@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>
Subject: RE: [PATCH i-g-t] Revert "intel-ci: blocklist multi-queue tests on
 NVL"
Thread-Topic: [PATCH i-g-t] Revert "intel-ci: blocklist multi-queue tests on
 NVL"
Thread-Index: AQHdSnmNGbDKLqJNUESu+jqhkjbz87baYGKw
Date: Tue, 22 Sep 2026 10:11:36 +0000
Message-ID: <SJ5PPF77ABF615C4FA01BF0B6C0E5BE852185832@SJ5PPF77ABF615C.namprd11.prod.outlook.com>
References: <20260922100237.77456-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260922100237.77456-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF77ABF615C:EE_|PH8PR11MB9535:EE_
x-ms-office365-filtering-correlation-id: 221685a4-e7fb-4331-b208-08df1891e2c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: caWjevAWQ5yDqt/7HXD0Zn3vkDpUICN2qxL1SsKW8lQzvFp+me7E2Emp4AoFwDMMo38LXFdKLoO8I7yls9qG4DXlChhIUvOat7NWCEIAwyOqXuN8qkJjzECip6LDY1UWr/n9+rVE2q1jJio/LMhUoaKE4+BQ1CGMdqeMVUSeeXSOOHMKNe6YLPcGLAPjOB8kzsZoGmmoEAu6G/pLdMboFZVIipc/nCuAAG4dt5RgJjUF4WodlSoFrA0NLedy+oTlHGMZTDWSwVzg+42+ghoKzxwnalZohpqc4rX2mqDjowbRSh+Qihwgp2xqfit2X5Lpfn+McWg5kGo/xg6h+6uX9U2AEodK+b8DwiM5/1AeWL7uHsqDbLLVUQkTCGf1715zmQb+JlWO9VB7WwAUxrsjJgNpaYBCEVxjiiSQWdVxP8io3uECqajG/McN+an5tSs+ZXczWBjIEO9mAVsFhI/tIuVWPj3wfrZ2beQj8MaoyrMqMwwhzq/kbr5mpzYXFPaHHRYPDyfbJ8w9g5T2RpbHhFFVBCv2ILPWVUKVW1DlddTnQM+IeiA1pt831GddkveAFO3goFk8m+qMvLOv87m2Sx5bXrCw1QQgfbIfY9pUiawBAOf7VAbUbRizELeqEdDmbFkpCNfaQTyDtX39mF2UekbcEZx/YQmBs1OeiyhtQd9i1fRuIh0FvfMlde/qKRUIZyWHASET9xkZqFKIu6VncWuDokhIn1mY4mU4YU7mGsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF77ABF615C.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oj3WY7mJEZyko6BWPM8Xj2JzEx3F2v0nMlwdYfivW3B3Ms51kVBqel91EpyW?=
 =?us-ascii?Q?jis46Dd/bHtyX5VlqdgNIg42bkcMPmdjV9tZIloUVdJPvBUhsWC31GCo7mjr?=
 =?us-ascii?Q?Mewium/gfndKmiLKI6dRB/0glKpxN8F96I7aW60AqlfxufJmNHXX5B193R0q?=
 =?us-ascii?Q?i7FQgVGTJMsiTwZPHUVxYcmgHrF2mivgUuo2FD00n5KDSIXCQMdO28a0/04n?=
 =?us-ascii?Q?1Tdosgt0b9FImn6I4+KCAFIpfmlhL4QDdj0/Et3+J562UGfobV2cCrUY5Z5a?=
 =?us-ascii?Q?1nxdy9SG1zQwtZ544HM31lMOjfeFSSFxkc72btD6bzh3uU4FN8YF75kLkl1D?=
 =?us-ascii?Q?blw+XqOcqV/9FXgbnCeCTPgaNgwq6BKHvsJ9d9KG77IB6sIpF21wxZQDWgVW?=
 =?us-ascii?Q?7pTsz34Ys5v5ExgLf3IbAJ+g22HTPDZPqdcs4a5VXwFec/JvcjKxqBRTQOq/?=
 =?us-ascii?Q?1AWZeRZvqYuQgZupBHpAgQ2cadW9F/mg3x1ShGJEdALYB/u7CHN3sp4XNkvx?=
 =?us-ascii?Q?B5eJcMET2nPNznX5p+y3TmMW5OYi5Zz+5SOPHw9rjX7PhCD6qGOYArG80m4K?=
 =?us-ascii?Q?5Xe2rRCkNxwGcodN3zeTwtvCOlLPg8GMUsX6UukkqG8XvAAK3iduoWk2iNum?=
 =?us-ascii?Q?6G5xAH1773bei7lukPG1an5kX3kZmMz+5TNP+o1Ma8Ujj5jR38Z42UGhNp66?=
 =?us-ascii?Q?DSF769TlmjcNU1HdOxIT8+0nspPzMurTEZ4WQWpMHFQnLVYTPknJemRIXLt6?=
 =?us-ascii?Q?g63EEIxTK4ehqoqVwZPG01IwkwpQVQVq4c59jd/SAFksFuqH+7qtb1fVh4Tn?=
 =?us-ascii?Q?GEu5OiVmgrc5K0qawps8TlCMlTalFQ53Blnq5dAmvSbSVd0A1pHL9GUJV5rA?=
 =?us-ascii?Q?rMTNkxun+uM+cr8mpmFaCK4NtqUWUsyQoemV6gbW24Hu0qPjHmuc+4TE878Q?=
 =?us-ascii?Q?bxKg5Bi2LiKrH3I1ULQ6+WiFBuM1q+LODzRZX865jPUJX9OHJ2+k/lM5izo3?=
 =?us-ascii?Q?LH9rsnAL4OJDAUVStDy54nBzdZQ8boX57/W6Lm4qngPXX6fuMyyRNBSRw3FJ?=
 =?us-ascii?Q?HpDa9mn/rEBsoP+GI6f/F7mloz7c5qUPOydEjp74IAHqX5RLLpmPRSxRREpv?=
 =?us-ascii?Q?1FBv083eiCdjGxH1Wt/K+xJOdwGGIKSNPzFQ3CCiiVyXCPsuvJTK5y+IuRSz?=
 =?us-ascii?Q?0h5mswg1G3DpE/2ehIQ4UHQKQzkN3QEohJxzAbl1/WNO28vP0uhKIB6C3PrH?=
 =?us-ascii?Q?nfsikrRexKcaZUt1ZXzlHOIK7F6+QbgyVZ1XuQspPNFKY9+Wej84UiAQsF9Q?=
 =?us-ascii?Q?QjeJ5WGigEl2VPIc+8DzcEsJBBGP9wiTFkCq/b0udySRFsknGnbDG+3X6Yil?=
 =?us-ascii?Q?rBwPf+vFHYLznH9DplU3kzBkQUCXoneWVb+Rf/xfjaaUnkfa52m3xVdmSTdq?=
 =?us-ascii?Q?c16RiekeSrb4D/rNVwGuTQfffvbxRjLgzOi48gULe6W5zT7DVuGhaouP6Uef?=
 =?us-ascii?Q?nO30fvuczevdXNT8OEPACT9TXGquHu0GlynSihxWOii8ADzsfFh6AXRGqtKh?=
 =?us-ascii?Q?FNM1lN/hDmhD0/jyGYUQlCYz6ueecfC0F5iqhdh/wO3F5Hh23UzGgDjhq5LB?=
 =?us-ascii?Q?SsCDLHlK+ngd+MoheLC8dPLiDQyruZLVhQLCS8+G4kGd1Oo1zXJtvdKSSbwY?=
 =?us-ascii?Q?IVgf1VQu8+YUIhuAkIQF0OEt98Xpatt+KM9ql1n1CP+9fv16KWIfByOCI/xj?=
 =?us-ascii?Q?tqlgc4TCpA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qsgB9P3bdSnmRrr6oBdpF+X6Pt8BOkjtIwk2fYEe2tepogxRRORwWVXotoBa+slsbjEA39p8WiuFsZFnLClrCiW7h2vYWSLk0d7yvyHSl3sqNkMJHHEO63Wp5Q5kkT+5MFUYA//d6GqF8iMnv5BAgX1v54zucfjwe3sroC/JL/fUfDqXe6aPqR/IBX2o+OZ2G8Tkp983JqIeE+VOhIhgq7sd5yxYmBOsbfqKo5aH2C+P+GIhDfHUCmWqzjHxONSz3ix49Lb/R3ocfpQfzFtBXOf4ivLda/l3/XuhGJ/GvzDXCnbSjY2Ibef1To2SXvifjczic7HS2HjlYdJwt5Go3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF77ABF615C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221685a4-e7fb-4331-b208-08df1891e2c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:11:36.3630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BLb2/EWrCQbUnyX+GkTJX6mO+3ksHAxlFH0jgbHMwxwKr/5uEJDBl+4jRbTqrR6PqRyG8j26GdKj1oRKCE8A0zN3esLdWIfYAoj0+MBibe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9535
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Tuesday, September 22, 2026 3:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Patil, Shivtej Eknath
> <shivtej.eknath.patil@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>
> Subject: [PATCH i-g-t] Revert "intel-ci: blocklist multi-queue tests on N=
VL"
>=20
> This reverts commit 305e940627bdd8b1334ac009305881850a20c2ff.
>=20
> It turns out we need to test few multi-queue features so this change need=
s to
> be reverted.
>=20
> Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-
> ci/xe.nvl.core.blocklist.txt
> index 71715235b..7de332352 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,8 +107,3 @@ igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
>  ##################################################################
> -# Expected skip on NVL due to unsupported multi-queue capability -# Mult=
i-
> queue is not supported on platforms older than xe3p -
> ##################################################################
> -igt@.*multi.queue.*
> -##################################################################
> --
> 2.55.0

