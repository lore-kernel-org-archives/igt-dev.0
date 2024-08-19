Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE460C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B9B10E1A0;
	Mon, 19 Aug 2024 05:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adXmVxKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCBD10E1A0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724044639; x=1755580639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xk6B0LsyM3qgY3pVaqP9eSflOLNtz4FMzVUrl1bIpH0=;
 b=adXmVxKXPguY1kVbOdnh5UyB6QEmIljQeDa7wYlttIQi3KZmQ+S8njpH
 vrpCDSlFHZDj/OPYdszhwgEcQNhasFxUpdPaV/NIb/+dv1CYu5zo8yM6O
 rqSLgOH29NeNN0E2BZZ8DC5Yx4y4K8/jtdWwfvnPfzepNLtD9gFGMAVKm
 O15mn3IEbCWZqqOECrn/PBRr/Jy0fVgqELKCvEdxuhrHRL+XqgZHYBjhw
 hLD9QQ0UqjAXAo/h4SJsbXZ9rUBNJCUIHJLCv6lJCPGC/OKqMB0m9eEe5
 xjSgNK8fMssEtEA78N0gVS8kdDz7Juwk0megM5yN/HMPRE4ykIsL/8+wY Q==;
X-CSE-ConnectionGUID: lgAjyNlZS5ajb9B3hhcrIg==
X-CSE-MsgGUID: Aiz3cM8EQZKlH09NoRGCFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21808951"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="21808951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:17:18 -0700
X-CSE-ConnectionGUID: 1Vkr8rgERQ6r5/lZEse16A==
X-CSE-MsgGUID: JAjYB1vkTWOTbhsYm/F1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="91018438"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:17:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:17:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:17:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRZAtjoSanaNLW+P9de7E87l/QWRPxKLqm/vWPE+QpGccXtv8QkDz0cVgqY4TEa37bDKIhYxFfzv1L7PbMCCnx9FdKNcZKrbZ/5fhVSCmWyAFKKcrNhCqJCyjbwKJArZI8vxxEKp9AO3TYExdYRpT1d0LwFpuDiL2hxaYO1u5NCf4MTHO+tdBceaQdJMP/exyqIDbCc6zyOIjR8S/oHsS4fJ96bNO90H8AX0UNynN4vvwIxKCRezSyRfnNsjehYFgS72GwJZA5ZdNtkSad1nQHaK5KF4Vb7gzGZTqmDMFyhI3c/yBgfG41Ww0GGihKNw1t46agAxKU4v93X6RRhVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlYdgcsLmFBH4nIYgh78xaeY0Wp9h2KmFcUCkIHSuvU=;
 b=yWKdUa3aRqAlUdEk5U1BWyMmQ1BwBCgjzh4BU/9RouePJEwuG5W1pNCJkeNkGWQXVIqh8qBfQcKc1WB9y8vQ4YMtCYi7iCWrkaeTIfkmwVZNZKR7lPLGF1iAnMthwSb52Kyl5CVhnG2kizGjmIlhDzD8Ogko3aKqAIzK4dYNWEytozYPjANbVcNDEZ2OtGyNSJk/8UwcivOctDiMzBv91VfQBdabvIKGDHdbPFoo6efkkCXB7LBpIo+AOvpBi1JWBKs9cGIWXK18UHc8NmyQ3epSocEg0qFSvK6iW2QTxM3Mrrg3ZWf6utLa+8Y3AAe43ZmtY1c4Tpp0hvZP9IHENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 05:17:16 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 05:17:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Index: AQHa7Thp9GwTwfWrnkeSRXQ5Hz6O2bIuEcgw
Date: Mon, 19 Aug 2024 05:17:16 +0000
Message-ID: <DM4PR11MB6312FCF5B625747F25228255908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-4-suraj.kandpal@intel.com>
In-Reply-To: <20240813041936.4014668-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7552:EE_
x-ms-office365-filtering-correlation-id: 15a9797d-4d0a-4a63-00e5-08dcc00e3101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?i/2eT8rw9GwhZHQTNxWccGRAYksbMTEXkPFGgsdOMuEelfekcmKKtqxMYy3E?=
 =?us-ascii?Q?c1UnllnmJICfm4ki9I9uqGEo5xVwapkmcVvR1smNZlQjqCupEr20rwPAeUEx?=
 =?us-ascii?Q?uicp7B6uj3+gZDAmNJLuLo73KZnnSow49pSEgqHqISeJvp2lSvPPoSBZ4lM2?=
 =?us-ascii?Q?7idLH9g34UvzSxCsCULaeApzxITeS4XvRZh8RHvWXA7oG6QZshKBxjMj4gxr?=
 =?us-ascii?Q?k/N2CG/bsIYB3RV/eJXYHLLV8oNlJou9kP78+3pHjt53LRg8yIUWvbbV6/Iq?=
 =?us-ascii?Q?Nuw+qmgqQCAXeuLSDngp6IAkCOrgabb1ZmfAPfbQUcVtTuZCvgxHdFMbkfCj?=
 =?us-ascii?Q?PeR9f/dCVAAK7X67ayovlqgqhAkaUlpVkOaTeFjl1hcEyCpcnMyxut1ScoQm?=
 =?us-ascii?Q?aFbnEbQJ2LXcu6FioYmVN6bBz3yXVRPvsr+Bx/T+EAlR2hYPA9p87eW1OA5v?=
 =?us-ascii?Q?PAp/gs37iDTd4xUg+HzTtW3jCGhMjiql68nrswQUkvi1d9I8AYfy3y4jUv9M?=
 =?us-ascii?Q?ui6KUbWfq0Fyxj+MexVH0w6ApStObK3+R/uACnnaFeWGbWw5hTYdlYvR4Vfs?=
 =?us-ascii?Q?tJXgg23DGeqJupGckJeE1aDX+QsP1jh/fB4/mr3xAQs8ITNXLn0moiO0s+mU?=
 =?us-ascii?Q?i4e7dKD0LMMx5WqenNHB2woxx5FGzOkxdxiFs5TuO835ROR6vmmHoWjJP7bX?=
 =?us-ascii?Q?XCprFFlPN5Q2QnCfarXflbImGPTzmV7e9t3Pe/LLcQKoL3riEgxn4tlPjD+r?=
 =?us-ascii?Q?bKCW6iVcUnwIhgdTYOFYDO49ZHD8ssXiyCvuhoO/qSkUoYbjw3HTOV8WAOOR?=
 =?us-ascii?Q?opzsVm8fDfNZ/GsJnQ9IoXNnhoJifvgDBFuXmYRxPsUhnSO9x3PzS83qVb1y?=
 =?us-ascii?Q?OAoacdD2zblj8b824CJYn1QXBpnF+mRwC8JMr0gcITkXStUxH9f0p/xmGKva?=
 =?us-ascii?Q?LwxPNVPALhsDA/uZHig6wjZIvz5SkGjI++RVfYikJgksR95C791mR/iJuKU/?=
 =?us-ascii?Q?xMjmrVHVCjumWt5s56WuE+1Ci9B5YWwT8d7Zpjdw/uhzSZXFeV0tJBxADdgu?=
 =?us-ascii?Q?a2SUdBJ7Gd8wsPF3D/4/OCKDMN4PEgzXjDHXbHq1+/20AJEpHV8j1gbyqS10?=
 =?us-ascii?Q?SfmEWo5zNqiPXBO9uAD+9tOh4ScQouz1HYiqlrvRj9iWNQTLanZy84Aen+Rj?=
 =?us-ascii?Q?iMgwKtONIHZQDRI3HfJpSJ0o48xVmEPNBQ8Kt7hB3T1AnikeacLj4TKE1SNh?=
 =?us-ascii?Q?CQRSlMAHjASf6Pm16ek08KKNKNBV55kXiQ7ZOIE//QPVikkPen3dixaS0NBw?=
 =?us-ascii?Q?jzb/ZOp5KPgkFFppTseXgRTWJ9xSrnSeIeAIj93IyLVlF//91h5/BIeHMkUO?=
 =?us-ascii?Q?taWNIu6Y63btzlKDlR1usjTlOAtZl7zRzslHlXHkqFLXhllVQw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dxKGokFxkaj0tqp+OryCs+D+nWsCowzxFCCOWG7uMV6TWvcIunjiPjkpsEF9?=
 =?us-ascii?Q?pSPH3rtqx3OlcbZs00mfVN1AqhAz/oy9GY9EO1pDEeTgEoLwFW2pjLfUoDpj?=
 =?us-ascii?Q?kH1Sd7XU/HIxyC2IXjmBFyzB8Nr47ac19VvsB4r+3zzarFxSwUUzhRlrVd41?=
 =?us-ascii?Q?X+690eKTOYpRTyeM+wmJJx8wEMJqAhoVKbqGIHBwYXAGNyK1UBFjIc/P/b/8?=
 =?us-ascii?Q?A5UVprf0jKOQR2efP72Eher42GqoJ1+yIJ7FQRGXtj8L4fHTmA7EjeNkMvFR?=
 =?us-ascii?Q?QJXbybDvbv8WhusDJNPzRWPErW9HGqOE138RiXL0YiAvwtDrbEHwfFrHxbci?=
 =?us-ascii?Q?6q1qG/qO5RLVfwWJtqe8uM5tb7cPeaxPri0+QRvS2U1J3WbFZyzMEcSEPbkL?=
 =?us-ascii?Q?AQpVswYK+usnfnFSdh/RKTAWBp4Czi35jTL1HGBe2jBLol5lUuWb0t1zvIJH?=
 =?us-ascii?Q?r+TDoqQaBY3hQGN6SmaS32hgMJZbB0lKmVCj1MfEAy9N0yHnyKRxUxKjNzGH?=
 =?us-ascii?Q?3Yq6iMNCFySG+FYwpM/4Z9ZY5mvJP0HcMFyHz/gCN2VqPRC7bfc6po1xC0u2?=
 =?us-ascii?Q?rzgEdV89Yw6vUDoKMfVcLkP9QNd9BF5qJWXCV9vBqmCTQOmFBydGJgYyeOdf?=
 =?us-ascii?Q?t7aew40UrSLeAhrZAvQTEW9d7dm4CIDCB4x6II6zfjgO3mEg+cQNeRt8pTVs?=
 =?us-ascii?Q?EuohGfabSrb8U83GgKs5HKYVgsWMjZj4rKFPwJSxJhTn23VYpWqwNL7xfTJY?=
 =?us-ascii?Q?xZfRbIcpENOzvn0SJ/Q1O4fSjL0iF6bUjZN72ElPJeV1bsp+HUG1mNSeMHLy?=
 =?us-ascii?Q?FuyNDPCdGG4zYCLEHhGKQMD7ZPpHyvcxJkF4kEpujg5e/hWtb5NvC4IbtXbb?=
 =?us-ascii?Q?QL/ABAIwnJgAHQ61QcBxI58YBFacFev0abkc9B/Ow82yfp1LOh5NgKKtzUvP?=
 =?us-ascii?Q?0wXZORB5moA+QatWkRShCd01IlTklfXqggDkfAFHvV/nS+0+yVQsZDw4f4tJ?=
 =?us-ascii?Q?MbZYhY8/A5R/FrJJ69h10TGLEQAXZiOD34fE66ujlSMs3CZUF+w+jNsSr/YT?=
 =?us-ascii?Q?aaEWisbgoRhhrSk/RomgfmkY61jYcVbhy+H6MUmdhQDqNlLXvjTIvW1Bwp+G?=
 =?us-ascii?Q?WwuyM9d6ZlF3SMX8IDiG185JQ6j2fHb3hcCJ5ETdz6q/15g3UV2DQwx/7MHW?=
 =?us-ascii?Q?xBh1yv05O0ieqc7cZ3A1TNn4yFs88paiKiJF864OL2BMGMpmbsQo8Hnwho86?=
 =?us-ascii?Q?JgR6x+ev/yFDFWlWNbTrkaR8ME+GEk1pSjQBBwuHnmb9LqIMI6shH7c6lKbt?=
 =?us-ascii?Q?bFnSefJVJnUpQE3MBV0nky29GCl7BGW6vRSFfhoLzthtMX+3skJy136MERWo?=
 =?us-ascii?Q?FpBKlsKExEnh73sqeyyGJbWfipWV97DH/ehHS+TIgCdwu9Y58mvvQfzNnigm?=
 =?us-ascii?Q?bz8+aSOvxxj4/iANdOMmhpgcr+MHnoZgxZBroAwqORwkwFADf2SFpzK7y3QX?=
 =?us-ascii?Q?PMzHo7IgTk6agtTI3GtukNmFeC5H3w0t4yPvuhigMGkEzINxvyQiBnHTY5CP?=
 =?us-ascii?Q?VhSURJPgXTXN0x6NYjw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a9797d-4d0a-4a63-00e5-08dcc00e3101
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:17:16.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ty4/mRWGDBGJ74yaVbZQ8lvcLh0bSaRD1pyvkBjceZLh/YjVM/sLs4fDTS9Wc306433y1mdQQRj4vkDtbKMv5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Suraj
> Kandpal
> Sent: Tuesday, August 13, 2024 9:50 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic =
for mst
> usecase
>=20
> Add mst retry logic where it retries 3 times before failing the test.
> After every retry mst setup needs to be disabled so we need to add a func=
tion
> which disables mst in one commit.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 84 +++++++++++++++++++++++++++++-----
>  1 file changed, 73 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index db6dc17b1..82a56167b 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -278,6 +278,35 @@ static bool test_cp_enable(igt_output_t *output,
> enum igt_commit_style s,
>  	return ret;
>  }
>=20
> +static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[], enum
> igt_commit_style s,
Update enum from s to some proper name instead of a char. =20
> +				int valid_outputs)
> +{
> +	igt_display_t *display =3D &data.display;
> +	igt_plane_t *primary;
> +	bool ret;
> +	int count;
> +	u64 val;
> +
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		primary =3D igt_output_get_plane_type(hdcp_mst_output[count],
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &data.red);
> +		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION,
> +					  CP_UNDESIRED);
> +	}
> +
> +	igt_display_commit2(display, s);
> +
> +	ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
> +				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> +	for (count =3D 1; count < valid_outputs; count++) {
> +		val =3D igt_output_get_prop(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +		ret &=3D (val =3D=3D CP_UNDESIRED);
> +	}
> +
> +	igt_assert_f(ret, "Content Protection not cleared\n"); }
Suggest to update string to "Content Protection not cleared on all outputs"=
=20
> +
>  static void test_cp_disable(igt_output_t *output, enum igt_commit_style =
s)  {
>  	igt_display_t *display =3D &data.display; @@ -630,6 +659,49 @@ static
> void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
>  	}
>  }
>=20
> +static bool
> +test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
Here we are trying to enable mst with cp,  "test" should be removed.=20
> valid_outputs,
> +			      int retries, int content_type) {
> +	igt_display_t *display =3D &data.display;
> +	int retry_orig =3D retries, count;
> +	bool ret;
> +	u64 val;
> +
> +	do {
> +		if (retry_orig !=3D retries)
> +			test_mst_cp_disable(hdcp_mst_output,
> COMMIT_ATOMIC, valid_outputs);
> +
> +		for (count =3D 0; count < valid_outputs; count++) {
> +			igt_output_set_prop_value(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +
> +			if (hdcp_mst_output[count]-
> >props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +
> 	igt_output_set_prop_value(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_HDCP_CONTENT_TYPE,
> +							  content_type);
> +		}
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
> +
> KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		for (count =3D 1; count < valid_outputs; count++) {
> +			val =3D igt_output_get_prop(hdcp_mst_output[count],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +			ret &=3D (val =3D=3D CP_ENABLED);
> +		}
> +
> +		retries -=3D 1;
> +		if (!ret || retries)
> +			igt_debug("Retry %d/3\n", 3 - retries);
> +	} while (retries && !ret);
> +
> +	igt_assert_f(ret, "Content Protection not enabled on MST output\n");
> +
> +	return ret;
> +}
> +
>  static void
>  test_content_protection_mst(int content_type)  { @@ -684,19 +756,9 @@
> test_content_protection_mst(int content_type)
>  		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
>  	}
>=20
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> -
> -		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> -			igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> -	}
> -
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20
> -	for (count =3D 0; count < valid_outputs; count++) {
> -		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> -		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> hdcp_mst_output[count]->name);
> -	}
> +	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> 2,
> +content_type);
>=20
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> --
> 2.43.2

