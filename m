Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52125C282D3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 07:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1399010E743;
	Wed,  5 Mar 2025 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huc+4Ts3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E54110E743
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741160511; x=1772696511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x9H3sMppc2QHN5pgNil4seZy8AQa0RpACHmXCdSKvZg=;
 b=huc+4Ts3W8BKqG4OYe6RatcWxgHYMEX7a51SzcdNefW0hJGLTpGdRr3K
 NUrhC0wxDxoJXWrJFL22ROUEoyOR0GUi1rD9jWJIRsenInPhgaF4jWvmu
 nqxjV5eRptSw8EdgZCRLyCh/cAnmHkoXIYwcmY9IQEk54jK8d1FCxHXoM
 t+IwPVKc7fXUT5KokpVus4XsyM4Kv9GYGmoay06BCxmIMU0Ka1hZnpL0/
 4N3vHEZyNbnay0bcIqftDtUmOrL9fbxCOg0CzuaqeDJ+WIMkf9NGMsRBN
 TxiV27UP1MwM4b1N3bC3Vx8NkVghWs6HOHtcyb2BGkkBJKA/Aaz7XV02P w==;
X-CSE-ConnectionGUID: /tvbLyFhT9aWwlJYDgmlTQ==
X-CSE-MsgGUID: 1czRk4cGR5iM/OayIh9EaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42233637"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42233637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 23:41:47 -0800
X-CSE-ConnectionGUID: fqP2xAJQS+OSAdlS1IeHlg==
X-CSE-MsgGUID: qhBMCWMXRf2ULzTkmH/1Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118519842"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 23:41:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 4 Mar 2025 23:41:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Mar 2025 23:41:27 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 23:41:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0ysrsmWr1fcXh5JJ62RWfX67am8zyOX7FVyFMgpCzYWW6G3ZWNuspVdf0yNzv6qLhLcQ5sT6Ro7zUHSuXm4grERLl0toJ5vuQgu2c7xYHgB02VWqZBaX7Hesc38JWeP1f49QdSVtMR0rklm8N5cakA5O8LSldIstxGSrCSakbH4hs0yghMFyHsTDcyC8RJ7qqV3Q3zWo4p0IQyeZNq3dLSpgmDQbcp5ZXxeThKhOakmeBymAGRUl1Az0tJqt3NE4pt2loKQeT/xSMrpTb9ylxZpLuTsBPDRCaG6KnQkgJIiVUsr/DDR5RbJ7tugdxPGkZcg2WGbsn2A9Zie9H8DxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT+LXe9bM2vVvDXYXsw4DtvGjN0UY+3/ZCcBm4B7pbA=;
 b=Xi4Oj7YS2ijlnJ6Fdj6O658LH3jExyfvR4B9KqjXW/4NyLn70cPckWAcVZLkFYcpzyMB8CJoHJn2oOoK0z6arJO+EK+vk2K0rdVeIEXGZmEKaTBWxZMSGGgIgSYGrehiPsLl33w4490YGZUMfagRm6uehyAYQAMFJWwEFkdsvDZjsODcysX/ojREgHdr+rNmfxnQzpWx/5DIOGrFMVT8AhQCTJ/WR9UvyamPYYDrqrIBkJs4QQ5E1FwWqmjhHpOhxwYngriKktj1JsD9bsKSfkTvoRJCQ+yPyMD+LPeS/Yzh/npox0snOHbCWsxvivYD8GkEnuLUEa5noJJAS1ff6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 by CH2PR11MB8833.namprd11.prod.outlook.com (2603:10b6:610:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 07:41:06 +0000
Received: from BN9PR11MB5273.namprd11.prod.outlook.com
 ([fe80::bf46:a273:e7a5:bf32]) by BN9PR11MB5273.namprd11.prod.outlook.com
 ([fe80::bf46:a273:e7a5:bf32%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 07:41:06 +0000
From: "Chauhan, Aditya" <aditya.chauhan@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
Thread-Topic: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
Thread-Index: AQHbiRgqs417c/mPHUSec4f7ag/Z47NkMMiQ
Date: Wed, 5 Mar 2025 07:41:06 +0000
Message-ID: <BN9PR11MB527371D6F6BCE7A47A406BA399CB2@BN9PR11MB5273.namprd11.prod.outlook.com>
References: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
 <20250227130354.1169897-2-katarzyna.piecielska@intel.com>
In-Reply-To: <20250227130354.1169897-2-katarzyna.piecielska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5273:EE_|CH2PR11MB8833:EE_
x-ms-office365-filtering-correlation-id: 29d9b8f3-8b9e-4cd9-1f05-08dd5bb9168c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Xl53Tv+Rl9v2dAoHp4SSgL8NVDdch5zq+C2pG/naKobxkBmd62AU/Zol70Kp?=
 =?us-ascii?Q?bhmLDSKnEMJi1pQ3M+yl4wid1A4LXCxuIJXSRtxW+QWhzhMGVIwM2Q+JVUqC?=
 =?us-ascii?Q?TugMLHeJld0GEvlIBoZU2EhYEhae8oA1E8q0BU7r7WEDX/ttJzbrYN3sDels?=
 =?us-ascii?Q?KEHiVyrbVeWteAX8/aWIewPJP39i/uq6a7acCXdBWFOOX6+7dRmn2HJd54Og?=
 =?us-ascii?Q?ZRhjs2jqbxLapYJPWIR7zFL6VeBcl5NeE7YYMcYUKm48T5Y19hRVqsNUtokH?=
 =?us-ascii?Q?TJOXnzlY89SY5q/4fUvxRZgc1lJtq+R9LwHayLoqLCqgDy8xMgsDr3vPiLQP?=
 =?us-ascii?Q?xJpTNG9JG6rEjYkG2uhO7wFqxGpwxCOT0ruc690b4ZRKiid6zz1nQWOYAmUM?=
 =?us-ascii?Q?LuS8k5t6pSM0X0j9EuEv1dzTDTqAm/5jsO1cbBbpoSYkgnF69HNVjRHUrCll?=
 =?us-ascii?Q?Vd0B1Y/85+rHnz4EtF1tNuLoxd/Vau32SM7E1LInEC5RnLa2BVtyZ74nrGMb?=
 =?us-ascii?Q?yLrWoKOGfa3b7eLehRdPvegraYor+Pu1aUA4JXZVk/uJ9h9ZplwLgumBJlIw?=
 =?us-ascii?Q?ahnh6RCod+SGOzYTlK5RosgzJIVlTmz8VynxmJZQFFLgorwncksNkOCjoDzC?=
 =?us-ascii?Q?8TOG8oxBNL75iUsP8aIc3oj6am3QKDLuILGD6dKgtpsPvzLKZDjP5RVyjy31?=
 =?us-ascii?Q?8BObY6kxMcez/63GnIMiq8J49IJoChBCRlZvMX8zFIJ05049ziqaCA8NU+jp?=
 =?us-ascii?Q?GUcIXMr9mA6T3i3guei6swmrC/8rbQ5Un6eP5/Xzy5veVcfH7IDSWUG9gJDI?=
 =?us-ascii?Q?6d4UN8+MNF2GOJEfNn5JPN7AZDUkaTDZovcdMnRyLZo39RSNzXoRKIDJtTYL?=
 =?us-ascii?Q?inRZuPCuuFJZBKkuI1B0rrUx7A/TR/ivC9R3TCIQmO9GED6labekL7GnA/wL?=
 =?us-ascii?Q?CocSkq1a968uj9qk91kJCbqHex1tzWuZZXju2PyaHvYxkRTpSaYe/fzqcQlt?=
 =?us-ascii?Q?RzJUrQ5shNv5EOcRVrTDL5b+v66eKpmgl2rUjeNAYGHffYpEz689WCWeUyco?=
 =?us-ascii?Q?2GrYUewkGzEhxNKWMeDCJCNDR5AVleiZxkJ1HRNFgecNBhTyzPmn1X2OXUND?=
 =?us-ascii?Q?SK5CvW/yFjhjZ387yYqA2wgVbkxgfCMBhBfotR7JvLjGHZR59l6ldHHGVIYu?=
 =?us-ascii?Q?KHLLa44hlPcKv3ObmeFYroOnE31MP/U85S/MzYNlNMVaHDMmR7ljJruiMkzc?=
 =?us-ascii?Q?5TMOgGkcjispOH0sPPKxpgTMJVpB6zUOFDwPawPnQ3jOtBmPp+ijHGQNSqZe?=
 =?us-ascii?Q?QV78H1aSpi1outCUB6ElIv0msuz+MFK81YbEVAaD+/FRDyrssI3NjoOryirU?=
 =?us-ascii?Q?v2OncqEixwInPYPcPT5HpGYkLluaqkwpKzHEBOb8+d6C0DlaJcfVl/AoCCUz?=
 =?us-ascii?Q?u5tao9KvChnxu7V56EeHs+kshSiiRGwa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZkGPiTPROj21ga97jhP84cZEm5eJBtzi+IN2XXZkq/GrfN9mec54098/45mj?=
 =?us-ascii?Q?e70dzbn2v6bdoTv3zQ6nP98fIuADBgWjTdFRgyZfdw8SQVHElRKHRoXXQCw5?=
 =?us-ascii?Q?gdJYzLRIwSCbscz7bdZjEZYbJ7Zhs3+nkSULcSVuG9VwF6Vxz8rw6NXTeEVU?=
 =?us-ascii?Q?YFpROYpiw76LTqs5U64m/Od2gyOVEDVoVCCf/B2Kr73gnlWIg8gtaqtwdKog?=
 =?us-ascii?Q?rWAuhmPaK3hxjD6x4QUzWsgUfRrOTiIYWAm2BJaj8gGszOfcfOsdeDRX+Edc?=
 =?us-ascii?Q?jx9NM2dBT/uSmelWKgexPRGHyXnGEagrDKALHnLCL2kPD8riI1buyhSULGy1?=
 =?us-ascii?Q?B7F7pUbghsrZImfZK/fv75kVYhV2Aq/tqY/H/lISjN1JBJXhgu/lrmXB41Q1?=
 =?us-ascii?Q?QnPqq1dCKtJG+hfYWLQpLEPckAOMg22i1Du/USiHA+egYqGdufNxsIm3bELR?=
 =?us-ascii?Q?bxtHaby0kiokthue+anlABYUG7o3a+6p84EUDZY1oVNqkRApRkQgF8GcWEc5?=
 =?us-ascii?Q?xHOqTzAjR2KjbmuafWbQXmoi8g62efGNchvnLDQ5urz8D8ax0kbvHZFY9oec?=
 =?us-ascii?Q?EV1y7rPseUPILo5m+UhT9mnrcNKNUJqZoeo2FkAOoMYqDBXWR2BFu5f6rwlj?=
 =?us-ascii?Q?HhW2xhB7sZtyr+NthjdVmCJccYHQysdUJPnjmoHSruLzOqONoaiI8Vx1jFyE?=
 =?us-ascii?Q?iX/ZqdTM+h1ZIKuUFUBlyZc2ZK0dIxM9TSno7aQj1AE/5gULo/BjIZGHhwli?=
 =?us-ascii?Q?HpLsmmtl4YlbyexV8WIq2xHRrvfiFa672NLMvsG8riNqlnsdBv2Rd+UYFOJ1?=
 =?us-ascii?Q?YQpBey8kcyKSGCMYIoL4mC/D9u+siavr0rpWtsOnv6uaghPxwmM+xw9XTU2f?=
 =?us-ascii?Q?mD806PBLIG0bfpifvjdPFUBcPCtuzct9Wlhi8KwFoS/LwoKX88ilRU/L4pPw?=
 =?us-ascii?Q?E+U/qnbXbgXfc65y5SsWoKW4kCmQS6wgGRM0uobLY05NKIPwKXWN/M4GBkxn?=
 =?us-ascii?Q?WKDrO7+snmLD92Owx3MFxpkEmojaz8v+sWWb6R2wfZtIv9zyzJRYOEGYZBUo?=
 =?us-ascii?Q?QyhtpFrYXinxFumZ2WNMTxBdIFF+0/3ECTPbANHhbIyen3dsgbo/8aMTYsXa?=
 =?us-ascii?Q?1WCIeluF0c7JLYDH5V63QoFsBaky1UFm9adsNqS8nh9db7KN26YOm3bH+VSs?=
 =?us-ascii?Q?v54vC5J0MOnpNgBl7kN7IZvn6MZYHoXwGado6X6h0hD46nO+wzMy2O6sc0AF?=
 =?us-ascii?Q?IZqiqpxYih1BZAfvEgb0GstiyGfzKOfoqXMK9qiklgIcMGrHWkdCNtgqroAZ?=
 =?us-ascii?Q?9gTEY/jJ+C/2F3YPPiFcSGzLvGHDbXxmyIYBBnmGsdTWqdSjFjS99TrPqXZ2?=
 =?us-ascii?Q?jKrx6sbBhqAqIm/2ygF0k1fFMvl4n1CgEgPToN6I8Ln9EmuwrxbfWNb54tpy?=
 =?us-ascii?Q?V5NWCOLMPG5p86GJyH2oR3QVjxnm76htFGeB6UoFxELQDwGrrCnuxbu+U7Gy?=
 =?us-ascii?Q?dxNZYcak1gMk/BiC1pj8FMGqHRyg1lIFzP4giEDnZ5LkhpB7ZT7k/d11Td0U?=
 =?us-ascii?Q?wOwcR9DaDe7a/Iilgm2fAGfTpJPgFe0nGmkMNCXV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d9b8f3-8b9e-4cd9-1f05-08dd5bb9168c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 07:41:06.1820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/j6Mi8rlL1Sqk1nkNdRehvdr279TS9PJU6a9jj+xDSF0CkmA3fS2CgYhcQstTfaGPi/V6cwdm13N12zUUDsGVQ2uw0Ci0TXPRdDuLpzM+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8833
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

LGTM=20
Reviewed-by: Aditya Chauhan <aditya.chauhan@intel.com>


> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Katarz=
yna
> Piecielska
> Sent: Thursday, February 27, 2025 6:34 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> Subject: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
>=20
> Our documentation scripts need to have unique pairs 'Mega feature - Sub-
> category', e.g. example below is causing warnings:
>=20
> Mega feature: WMTP
> Sub-category: CMD submission
> &&
> Mega feature: General Core features
> Sub-category: CMD submission
>=20
> There is a need to make sure that pairs are unique, so let's make change =
in
> xe_compute* tests.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> ---
>  tests/intel/xe_compute.c         | 4 +++-
>  tests/intel/xe_compute_preempt.c | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c index
> 558b46eba..7daf6209d 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -163,7 +163,9 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>=20
>  /**
>   * SUBTEST: compute-square
> - * Sub-category: Compute square tests
> + * Mega feature: WMTP
> + * Sub-category: wmtp tests
> + * Functionality: OpenCL kernel
>   * GPU requirement: TGL, PVC, LNL, PTL
>   * Description:
>   *	Run an openCL Kernel that returns output[i] =3D input[i] * input[i],
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index d4c243c16..876e53823 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -7,7 +7,7 @@
>   * TEST: Check compute-related preemption functionality
>   * Category: Core
>   * Mega feature: WMTP
> - * Sub-category: Compute tests
> + * Sub-category: wmtp tests
>   * Functionality: OpenCL kernel
>   * Test category: functionality test
>   */
> --
> 2.34.1

