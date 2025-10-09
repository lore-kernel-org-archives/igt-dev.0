Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD410CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 22:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023710EB2F;
	Thu,  9 Oct 2025 22:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEvJR5MK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADD410EB2F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760049288; x=1791585288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GkEcLAox5NLjbBkaF3pjZZvETJeADRKTpE6fM5RnKLQ=;
 b=WEvJR5MKhJD1GLun4skefosxqaflAmUCFBRamLoZoNNyYbSuyR8l5y1j
 QkF8Yltl7gFpz9WVipMiYfHfrfpm+k9oRAvw8Qgn6buRJNjs9tex1RFg2
 vDSB2+8+UYeMfafL8HpImNpkZ+k4h8kiCNYskeJy8+wDhQbZo4Y4yhql8
 L9rEFQpDsJ8jQ9F1igiU53VhSTuNBHlfEBUJcp/vU146Yo1raGDeduvmr
 jOS8FJ56atxx0/7EggOEwBN0zsY9FDyj5hNxLbdbNVmgDG82yJsxbgglL
 wSXsNxtXzCXz8orQwe0yp6wicnjuD7omUaGWj0m8rolgJ9vn+rFoCjEh3 g==;
X-CSE-ConnectionGUID: 9Cz0Mx9DSYmTRiquyneYiA==
X-CSE-MsgGUID: v+uK8uK5TGy4F8U/lwFnjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62155480"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62155480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:34:47 -0700
X-CSE-ConnectionGUID: pumlO5V0Q1C6XSUJ8k2U9w==
X-CSE-MsgGUID: zPw9RhCdSYGTwdh3H5geAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181597442"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:34:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:34:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:34:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKqOrhAhWkKSccIxAcgkdbGdBv9rp975tF0DNsGgbxoNQzOagedxqem7kCXuPHzCT6qv9XOmBldCDHO+tlUCye0Nl/gXeJ04IvGEmzaOEft2MoiUipWg0Mb6dXnYrenrF24NmieC3plppHQTmC7yiMzd0DJCBTzpcVVvLx7vGU/0frTnwT7CqzoSKtgABGyD9SUxg/UY56/ILvnRYFkawDXBpt1PY3hTYO7YBPUTy5YYITxucjwTSpu8KSItwQFqMhVPllylNRuA7BQLdaZz0kRTlJCJOKSunQ4epmhG3DJwbzDdux6HCc34CO4NSaCjjlbXV5+kJ8dQinGtMbYbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NYY4PhSZGpj8hbdSCKOWZbhIB4AxLa5MG0vIVyowUA=;
 b=yJZL5qFVwROnXatLtTUwb7BRQpUaiX5ZA5v0QkCJSYAY3K7bY8FVnCSLproVKypMERuMpjc6LCfynIxUEK0hrv9w4z4hiZ2KtB9nGfH3iYFWUEoNRQ7pZSP0m0sIQxSQn4GVvI+vHMr8LBQ386FTA9By26LluvfLCg1eYeoTnNyYfCAWg5n723buGUB9jaaj/9Ec692Fp+/h7jnv/fuliCgvhqOElPZAdZXbIAUuREH7rWRumOpoMK5Jpct10lvm1lJSXLUHJSVKteVN+c3GzwaWvL9cCxl813ZCDfErHZ1djbhc0eUtLF4nmSLTRaDZuGD795KGH1tVhIPvZVHQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:34:44 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 22:34:43 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Goyal,
 Nakshtra" <nakshtra.goyal@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Topic: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Index: AQHcOJb96lf1XPb0XEKrmVpgjMaPKLS4zpEAgAGZfkA=
Date: Thu, 9 Oct 2025 22:34:43 +0000
Message-ID: <SA3PR11MB80467721C87A112436F620D886EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
 <DM4PR11MB5456F59526B8FDA217CDBADBEAE1A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456F59526B8FDA217CDBADBEAE1A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|CO1PR11MB4772:EE_
x-ms-office365-filtering-correlation-id: ece61dfe-8bb1-4d13-ccd3-08de07840b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qcoJUuj7jTrl0URI6DHD6U0L64oEvoJkECAQNVPvnmiKuwmWycCLeyeVXYiQ?=
 =?us-ascii?Q?An2A69TAM5cKALGXX91szdqSQnCvrlOE04TbN6aRgK0cvz3Zb3q7362tJLC7?=
 =?us-ascii?Q?U1DfTy1ci67PssaXNqe/J3qeX3bTrBvw1vtwmBu3f/HwUH62nfliGUBr4FLg?=
 =?us-ascii?Q?Q/s361uS/JjTNI6LXyLMtAiG0WQzPO3TJPhI0GcilW3Rv30jTIPesb0MRCf+?=
 =?us-ascii?Q?DWAYNpvobAueEEVEmPT/exrBwdZBrM0R5fQcnvMJ+J30TB/sUvoGuo3mecD2?=
 =?us-ascii?Q?2Zefz0LFDnhUfQI3MymsLwaOi1jhueeJw6IY5T6s+ZVOqST3X9j+/POFACFl?=
 =?us-ascii?Q?yOOw/VnHqYIKw8Z0ZHRWrGBZ/MWknGdCafIuc99zof77s93JvlO9nbUZ5ULY?=
 =?us-ascii?Q?mlXud8DnF8spI8UVbnXyOlE7oDGaaB1Vkayfp4UNceVoyVJy2HpY1lyhnRiG?=
 =?us-ascii?Q?ltJ093bAOZTtVz2YggFOhIH7I8HgoPjTAdz8qwVhnnI9BnZxQG9QiyQZpwKw?=
 =?us-ascii?Q?Q/FQhcLrckAFgYlkP3TOHwbwe+FQfkBSXGv37zTvtSYy5/q5WbxhL8V1uHzV?=
 =?us-ascii?Q?sh/rexOgUk7HVtYX/NTO9G+7k6k4BTX+VBnHNoNJ0OVPvlryUkAa2eIJh52P?=
 =?us-ascii?Q?hoDxyE/ImdPERJJgU5+40maKhqQyziNS+uapIUML43LedqPkdPvNQRuJT25x?=
 =?us-ascii?Q?pQjNsNooUuA+N9xCGxGIORYQyb4dlCQoBeOQH6HWgFTybVAytvouC4+PXz6R?=
 =?us-ascii?Q?xb/JcMDDyWo/vnIAykitSCI+T+1RujHY1dwbpwxPkqfipYUjZycsbuR3znOS?=
 =?us-ascii?Q?AFR99egiz7WCJhpQSwanfM6GgR3p4QzIy4E10ywt/b7KEcafI+LcXgAflp59?=
 =?us-ascii?Q?YMuLAtP1kzS+cY2f4YoIQXolkKCQTibvUAjglulCbRIqFglh85whtPA/m0km?=
 =?us-ascii?Q?7+aq4WA7+xL5mo9cm+nec08QzzjH/jGyd494tusaOwcQuucY8VIaDlOuufQ8?=
 =?us-ascii?Q?xu7g9HBEEjSiU78QoQi3vPO77Rjitx45/9YRfg84Gzj/Jt7mzB9gbtdQaBXm?=
 =?us-ascii?Q?+f4lC8SJK6Hkqb08oUYOetTLOyXsNrE2kkgXJ22C+HbgkdS94YGWFf/wMUh1?=
 =?us-ascii?Q?zyIULMaYXXhfMZ69bbCXVHcRfHQv9dv1uon0zAr4O07v+v2hPFgWZUx6yUzz?=
 =?us-ascii?Q?yxT6S4B5xEsL7pAePYEJYjTbkcQSJgTgnsPjlK2s25YS8KNtWrCKBbFEWacm?=
 =?us-ascii?Q?IuSS4lqEXst5HnwXWnNkTnnvE9fgoYzUQnXT/qaUsbxkyhBasfJibMX3ARb2?=
 =?us-ascii?Q?86XQNtEiatQlKRjKe8IyhiXHNd+UfUF1N4BjXZHUjj+KzTGLqZUDo4TwYhSR?=
 =?us-ascii?Q?/QARsIX7WUP59L6/4RY90mfR6ct7BFqqSmJvbZBQr0jeF2iZiz/6/BhchV/M?=
 =?us-ascii?Q?mKxX29ycIXQIOtaUqWqBQvHFUOO1+xKcmMIFK+0bohQQ+tcE3DFnyOJXsOwD?=
 =?us-ascii?Q?zO94VJfkUq9wjPifMOmvWqu4AcQ2u1T+FvVF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jfdeai+dwlAaItHlTfEmkYN74w1/qH+X5th5efTmR/8PUFB90/ZhmTtkPBHz?=
 =?us-ascii?Q?BZo6mSzTd0xM4G69yawuB9WmHtzblGU5H2T1yJWqkn10rQFmj3I7SWe+cogq?=
 =?us-ascii?Q?GHOVmrwijI7pUjKgP8zhlLuIFHaCkcR8QjeNiRxDKlof7IRfrzOG+VnbxWWN?=
 =?us-ascii?Q?ziKUDB5VLsQM7oKoz8t4GJT/ZD9RwCExeMgyWVize9lwwcWCFalbFT8K+MN+?=
 =?us-ascii?Q?XsOgbGdbiQnxXmDfZBUY59XCfD0HhyzPm+mGKv4RwYhc/r17lvMJgYaMNDJQ?=
 =?us-ascii?Q?yuwQfHOeMx+0az/bFPfew6SaCl/koTlzEqN2MeFT9LatcWOfbqELN7jXgNxR?=
 =?us-ascii?Q?kzVNh5M5Pm+a5kHqagEuDy4kP86CLv2i8ZeHMQ93/YFmTYdvSVmQ0S6tDOJE?=
 =?us-ascii?Q?6fpglwGLll+Ds4z53Gf/v7VKNPofV0T9cQWydrYz7+VHtyKPRCk0nStG0tvu?=
 =?us-ascii?Q?axbFVOUZO3Bpzz77+PXUPm2B+JXKmzGQAj4tcvnhKJ5IYNxBKZLfM2MsPqkj?=
 =?us-ascii?Q?+Kre59f0FymWW5rFc+juoOXe/puDF1l3xf0hrFet7P4/tfLlZG51ObUB2aYp?=
 =?us-ascii?Q?Pc1Qg3zKLD40RbRRniXz6+zBG+mdFF8D52TJppFO/iuGpwZbi9s27mr0GbYN?=
 =?us-ascii?Q?ygMpKRkE3YXTO0a8uCoRcVb/+ndUuG8444Avw0WdeIp6lm7BpkD5cGoNTksY?=
 =?us-ascii?Q?uIj+tkvuO8LgvVXCrUXa9sPqDnzs2s8Igf8HVswy+RuXf40EKPaICjU3ecxv?=
 =?us-ascii?Q?IvHz20z2ABhc0i+NAPfWWVEfc50ZMoPxmOeqLUDnZzg/d3MGbRrN7KS2JR/+?=
 =?us-ascii?Q?fzPOVSBlvaD7xeCabWWG89sY28uyEdHT9MdTI9SohuvIH63p2Wt9bvOQOsfE?=
 =?us-ascii?Q?UzaqVlH78rEbuoCYO5mXnY4zXjBgKKcFiT6/fL8oA9vpKNHrKKe+8WdBWZ3P?=
 =?us-ascii?Q?QZRfB9xPO3E5q1zsKU5z4nwGKFrb4WMSOaWpb8ypKTOk6RxNRmOAV0urCBGj?=
 =?us-ascii?Q?cP1SCMxslfxJgiHT8yaN7wxymvg47D8r/+Y1ttkm4CpCP2b429JZFzLKMTRW?=
 =?us-ascii?Q?L7sZmnT0VKlS+2XgFRt+exT+ZnjGGmkj/oJQedDVQbda+FYX2Yd9lwzo/iav?=
 =?us-ascii?Q?yOBRhuAeqoK2+b58WawR1CKuy/3Zl4u2dkcviSnWmbDmmQqDQ8GrBadHoZxQ?=
 =?us-ascii?Q?FD2WrJf6zy7AFl/grA4vgPkgVkbUZrV4ZlHh0kNC3vzTaAlylGL1MGqP2j69?=
 =?us-ascii?Q?jgu7ouEPUOrZacOES+rA0JZI1PX9C+w6hxoL6s3h4aoKU9SdOl6qHe9qfKPZ?=
 =?us-ascii?Q?+2ktiyOjJrTA101uEKWzYj5O25VKnRvKmhei4boiRLJlgOaNhO9VgrZInj7C?=
 =?us-ascii?Q?ry0Gow6gWyVD95iqsfylXl1blVIQd7G+ENlkGRq8Xd7RR8xKR8Lk8673ZnaW?=
 =?us-ascii?Q?Uku1aPS332j/NrEhUcuRmvRf/Yv1lKoewHC40W4jG1myfigrjsl7NjDfwyrJ?=
 =?us-ascii?Q?Wa9kDmQd+3X9szSnG2gCKXkDWoVjnuvVm4HECX/ofxAEQYKYOIgzkIBsTX/c?=
 =?us-ascii?Q?mYboL7PSrXLcAEkbpec=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece61dfe-8bb1-4d13-ccd3-08de07840b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 22:34:43.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roJE4tUPGM89uRdtC9BVOyZTdLtnQzW+aKkrQ9whZr117Oiz/Qh4Q9A1GkqSjT6vM+v4HcMXgTgiBZ2Ez6jHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Wednesday, October 8, 2025 15:07
> To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>; Nguyen, Brian3 <brian3.nguyen@intel.com>;
> Zuo, Alex <alex.zuo@intel.com>; Goyal, Nakshtra
> <nakshtra.goyal@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>; Sousa, Gustavo
> <gustavo.sousa@intel.com>
> Subject: RE: [PATCH v3 1/6] lib: Add runtime device info query APIs for x=
e
> devices
>=20
> On Wed, Oct 8, 2025 2:03 PM X Wang wrote:
> > Introduce new APIs to query device information at runtime for xe device=
s:
> > - intel_query_gen(int fd): Get graphics generation
> > - intel_query_graphics_ver(int fd): Get combined graphics version
> > - intel_query_device_info(int fd): Get device info structure
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
> > preserved
> > - New APIs fall back to traditional devid-based lookup for i915
> > devices
> >
> > This infrastructure enables accurate device capability detection and
> > avoids issues when adding new device IDs with varying graphics_rel valu=
es.
> >
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/intel_chipset.c | 63
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  lib/intel_chipset.h |  3 +++
> >  lib/xe/xe_query.c   | 19 ++++++++++++++
> >  lib/xe/xe_query.h   |  3 +++
> >  4 files changed, 88 insertions(+)
> >
> > diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c index
> > 760faede2..890b1e3fa
> > 100644
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
> > + * Returns device information structure for device @fd. For i915
> > +devices,
> > + * falls back to i915 device info lookup. This function caches the
> > +result
> > + * per file descriptor for performance.
> > + */
> > +const struct intel_device_info *intel_query_device_info(int fd) {
> > +	static __thread int cached_fd =3D -1;
> > +	static __thread const struct intel_device_info *cached_info;
> > +	struct xe_device *xe_dev;
> > +
> > +	if (cached_fd =3D=3D fd)
> > +		goto out;
> > +
> > +	if (is_i915_device(fd)) {
> > +		cached_info =3D
> intel_get_device_info(intel_get_drm_devid(fd));
> > +	} else {
> > +		xe_dev =3D xe_device_get(fd);
> > +		if (!xe_dev)
> > +			return NULL;
>=20
> This function may return NULL. But I see some caller does not handle the
> NULL case.
> Should NULL be allowed? If yes, you need check NULL for each caller.
> If not, please add an assert here if xe_dev is NULL.
>=20
> Shuicheng
>=20
> > +		cached_info =3D &xe_dev->info;
> > +	}
> > +
> > +	cached_fd =3D fd;
> > +
> > +out:
> > +	return cached_info;
>=20
> Maybe add an assert to check cached_info is not NULL here also.
>=20

Hi Shuicheng,

I will change to use the igt_assert here, it's not need to return NULL.

Thanks
Xin

> Shuicheng
>=20
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
> > +	return info ? info->graphics_ver : 0; }
> > +
> > +/**
> > + * intel_query_graphics_ver:
> > + * @fd: open i915/xe drm file descriptor
> > + *
> > + * Returns graphics IP version for device @fd. For i915 devices,
> > + * falls back to i915 graphics version lookup.
> > + */
> > +unsigned intel_query_graphics_ver(int fd) {
> > +	const struct intel_device_info *info =3D intel_query_device_info(fd);
> > +
> > +	if (!info)
> > +		return 0;
> > +
> > +	return IP_VER(info->graphics_ver, info->graphics_rel); }
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h index
> > 2f6bf788a..8f3ea0ce5 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -104,6 +104,9 @@ const struct intel_cmds_info
> > *intel_get_cmds_info(uint16_t devid) __attribute__(  unsigned
> > intel_gen(uint16_t devid) __attribute__((pure));  unsigned
> > intel_graphics_ver(uint16_t devid) __attribute__((pure));  unsigned
> > intel_display_ver(uint16_t devid) __attribute__((pure));
> > +const struct intel_device_info *intel_query_device_info(int fd);
> > +unsigned intel_query_gen(int fd); unsigned
> > +intel_query_graphics_ver(int fd);
> >
> >  extern enum pch_type intel_pch;
> >
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> > a89e0b980..3caeecf20
> > 100644
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
> > >info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> >  	xe_dev->gt_list =3D xe_query_gt_list_new(fd);
> >
> > +	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id),
> > +sizeof(xe_dev->info));
> > +
> >  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list-
> > >gt_list[gt].gt_id);
> >
> > +	/*
> > +	* Set graphics_rel based on the main GT's ip_ver_minor. We should
> > +	* use the hardcoded value for the none GMD_ID (ip_ver_major =3D=3D 0)
> > +	* platforms (e.g. DG2,ADL,ATSM)
> > +	*/
> > +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> > +		if (xe_dev->gt_list->gt_list[gt].type =3D=3D
> > DRM_XE_QUERY_GT_TYPE_MAIN &&
> > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > +			igt_debug("Setting graphics_ver to %u and
> > graphics_rel to %u\n",
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > +			igt_assert(xe_dev->info.graphics_ver =3D=3D xe_dev-
> > >gt_list->gt_list[gt].ip_ver_major);
> > +			xe_dev->info.graphics_rel =3D xe_dev->gt_list-
> > >gt_list[gt].ip_ver_minor;
> > +			break;
> > +		}
> > +
> >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->tile_mask |=3D (1ull << xe_dev->gt_list-
> > >gt_list[gt].tile_id);
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> > 715b64e2f..eefeb47dc
> > 100644
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

