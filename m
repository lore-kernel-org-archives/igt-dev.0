Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6730CC27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 14:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0176B10E32E;
	Mon, 10 Jun 2024 14:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+bdlZSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A5C10E32E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718030193; x=1749566193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bi/4Q1hfRkwtQoq+allKJ7zTVX+wpQWUJg01lhrCuus=;
 b=T+bdlZSdawnjsOW6yXLyTkpWTPWPuh/PB6hIloFbSEFtMm1uCeozBBEl
 UG1FCm10OHmNZqQeFIFebTB8K3ALVyYASFIWCEaD+t7b934paspTtdCSQ
 VQKwa65AOlA1MGQ6yuDtjHgmBlO/nfggK2H/ljTcgnjlEkmMBg3cT2+4N
 thhmPjmJ6x6UVZktHHN/ggCljkBwHVuxTog+K1IbRK/A2m77ZKWMIq92+
 i/b6GlbDbpZdyRJZTN6sCs4BeQJHq7gQBV/9BBZmue/Y92DIQRFuubrTI
 tZi8KXMMZ+taXW7MIEz77svOJE+UFI97eCXQI5OdL4iBluaBIkj3TmyaJ A==;
X-CSE-ConnectionGUID: mhleyPvfQ5SVXAsFu3L55A==
X-CSE-MsgGUID: Q1NANg5ZTjq8AyJYradb8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14493686"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14493686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:36:32 -0700
X-CSE-ConnectionGUID: Tlbg/cOnR66aJtBvPrR5cA==
X-CSE-MsgGUID: d5i4Y7f7RGiBWqS4MeCenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43517156"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 07:36:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 07:36:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 07:36:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 07:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq2HQeqKwSWSESw//z97ivxM/9R+OXj0iO/TTdJDds7tp3nftlxjxfrCTg/3PxvakpYZyMulVijkfVLliV8179juJ2SPEwwg+WWnw/BPB4k8bCeU6MJA+II85Q9uL+x5C75kp0i0tp7arqZt5cN8rJTif645dKTKHrNZL1CXsGRRNpfsuBtQEOEp1cCykESAHpKzRZlSZf6+altvemk8hCm96g5uLDC1oDaXmT0dKPbWOR2ExQp2No/QcYkBOOMBkWlYfbBqMe6uJA8wohk/ExBHe+Bkz1/ieEeqwJPdFskoYFpPmChYtxX19h338lh6JurTadlX3rF5VGrCRpmGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0l8LY06s5sjQWXafYD/v3qCy8I1oKdphHKLdIwsE4Y=;
 b=EYBNTVDUtz2v/hO1zfV0RwOol+YyDhR9f9F8zPO7UtiKI/S4v/nlFn6CmOV/DyPv0cbVgFWRZb/tm8SXW1DgGuije+iy+ajDppvvqygy1sljO/bneMlW3f/F6rzG2cKOExGinbOKrbJCtFVM4QPR1pb2MQtyO5IQ4w6zew4IjxEew43ovqjaq0VYKwnt51mbA2oNgwYFhObpSpJw4xcQz68WEDtXVGGRdkUVKUO1NMv0DtAMI9778FX0G+daGbiLciNqQ3ck7xrbY0RQftas4rph35OS8DbMD4ZJgAOjdl/BEM4MnwZlwm2OhItoVmJVIbZW6DsTENSHkAlJKKuF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 14:36:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 14:36:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 4/5] tests/kms_dirtyfb: populate modeinfo before
 feature support check
Thread-Topic: [PATCH i-g-t v2 4/5] tests/kms_dirtyfb: populate modeinfo before
 feature support check
Thread-Index: AQHauy3Rru3L2lG2zEiojvGU6lnbHbHBEFSA
Date: Mon, 10 Jun 2024 14:36:29 +0000
Message-ID: <CH0PR11MB5444C97011859672174F294CE5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
 <20240610115941.35279-5-vinod.govindapillai@intel.com>
In-Reply-To: <20240610115941.35279-5-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7083:EE_
x-ms-office365-filtering-correlation-id: 4c8b85af-abb3-4ba4-9897-08dc895ab778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?aIR7WyWTUQIHQlm2vn95KYaufLnztVJBJmod9AOaaJw0GkAxdwjW0OptI7Xg?=
 =?us-ascii?Q?7XypyA936lwpHiE6qOJjlrDZIRnQiJujlhIe/D+nLYelIPTwJ/YHZBJtXrEE?=
 =?us-ascii?Q?J/49SBEEN2pIVkcbgo1bBIftqRICBftfkTZalFf8k0JuwfX3oll1NaOh2Vyz?=
 =?us-ascii?Q?NY8VUnlyKQlP6Xz9J68a1V17c1ce1BPVDxb70UIISnxMUpi5LZ1dFh4jJDFe?=
 =?us-ascii?Q?gthfKQ7JUbTY+wJVRp9RMOTImksyEfuJpD4ut3ohXnWTdrK/99BG5jVZf0ha?=
 =?us-ascii?Q?nEuYex6eCyOn7VEg6iv1SLedEwzMtR+EySVCxunpchD5WnSOOiGSnY9B9vyD?=
 =?us-ascii?Q?Jpmq3p4/5h3l6fLiLLMQXcxH06+C4O1VYz/yrmCtj6ggRWD1PsX6JvARXBpL?=
 =?us-ascii?Q?He06cHJ8s2MGdnwhp5ZF5jJXi+57vtuePTRGrv5qwqDz5uGAfABOO5ZVMOnv?=
 =?us-ascii?Q?pawvtu1apNEJoFEdWWI3UAw1enOFaMsJ0VbVUWeet0xPhp9V/3ToTCpvWtFT?=
 =?us-ascii?Q?/EAHa/94eZOHc17WCGT1G4AZejBNXtQdv1ece5WM6qudL+slKcmVew1Ku6/X?=
 =?us-ascii?Q?Uboj0g4HV8pydoSZyXBS2uKO32TlyFJFb3Wq1LkE3ySuLhyyWVQx29ZyDGbL?=
 =?us-ascii?Q?AfiM7id4onxAX9mwkkLpZbEFNNeov3JajP55crISerZnVP5Cct9PVYCKLwWx?=
 =?us-ascii?Q?6iNkdzC3QgY5R5LRfLMhUZFiXY/y1X1oqQz4hMZOdURBBZPb4OjKNw2QCpcy?=
 =?us-ascii?Q?fAlxPCRO+oDa8Up9i4owsuYMxJPygKzYbavBh7dDmJIxuRwEOgwnL4FhHGJl?=
 =?us-ascii?Q?2SUNYmDh5VyY4FzKCHQhowpwohQmzCQGclxIA5Z3AwPGvbP9NZQMLOJls6JW?=
 =?us-ascii?Q?xMKjpx52zR2EbYNpF0N5zCem7FjM63MXP7EFwovmvzR3vTRjLRpZqP473Ayd?=
 =?us-ascii?Q?jrx91VPC1k6tzbvJ9CHXO24wQRzkbwx8uB1KD+GO+yOBXRwo1ve/ixcfqqk3?=
 =?us-ascii?Q?UorqJhqsR/OL8CFeUYTR0n1s9IssEJsARn8lxPEWJAKx3C1pCV61hlaSjZbL?=
 =?us-ascii?Q?5qi05B7X7BH7cB4O8KREbVfH7U43xipuhspoVjHkWLmmeQKAxieV8ozpqjTa?=
 =?us-ascii?Q?EA0Mtkg8nfL2OGFPR4tSFk8NtO7JTK/XW9btzM48gaKQ8+tO3pahHeOFzKkp?=
 =?us-ascii?Q?fbZhM9+ubohjTQp/kVyCiCXNu7kCIbi140Wcm1OIdnh0zM7GLLuHKUoT/NZg?=
 =?us-ascii?Q?rx9ZTloNykIRwkWg8zHr6sdwnVTo6xQBikkruIvkq4457Qqim7QmOPgCpwPs?=
 =?us-ascii?Q?4Fqq7JXeRKWJd7hnrLuoP4t0gmXZknBCqchTgpmOKRuhx3SpzIQcnpB1HO7y?=
 =?us-ascii?Q?4/oJBic=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dhqqsLNbQyM92Lj3M2iiGT8b043jMyhMNFx5Gm7VW7CGG26cPBFrUGGL8UT+?=
 =?us-ascii?Q?tUREFv4O9eI3TvKUbq/Yq2GB8tW3M/INT2oHU5NhXcEndDtYhS2mj21uBN2c?=
 =?us-ascii?Q?/qHsZIebd6OUQ9syKLbhlYk4XLUro6SFAahXtV4bQX3Siw81vned7rDFDeNF?=
 =?us-ascii?Q?e1dqAMw/vTql076yHO46uL37mkU+sUpyREwo8czXNBQwqdjzSD9tD1ayIN1O?=
 =?us-ascii?Q?Urnot1In40B8cSp1Xzz7aGJj4bwpcu3q3Ppe07CSyJT8WHQydSeSECl7KJGJ?=
 =?us-ascii?Q?J9UJnP02ZgIvXxiG+mZ7NxvaySSKJrY1Bd+UYYIhsJuApUGE0/hM3DAqq0Ly?=
 =?us-ascii?Q?9v07Vfl+ovlPkm6/tf9iUrOyEuF4TgrjTRtideaERMgSErwApU9js5V1enNT?=
 =?us-ascii?Q?6tSHRwNY6WmvcLAdfwuwVr1WMhSzRGIAOl+KvyukYCrocujxwgvyhMHpkbM9?=
 =?us-ascii?Q?ZHO9bFIz2ZuZHp/1MyaDsDVXLYJfAUe0W0+opKfLOFlxCJaP63CL9/NDgbyx?=
 =?us-ascii?Q?68pkYwdpUF/PxW2wsVsTe+Afie2Vl/2ybnen3ACXoHzMecf9l2VMbZ1NsIxH?=
 =?us-ascii?Q?otj9iQ4B/zCyAsBFGf9GKKopE9U5qvp2cS/msNsk6AkMAhktYigTIngalZQF?=
 =?us-ascii?Q?iFE0sBtX8jmwYmpngQ2JeRwkVUSULkoGmyPu4ZvtZMdj5oFlB+yI/ziiII9C?=
 =?us-ascii?Q?dWuk1TVWB9hbMgiobCiMXNy24hRDccjyu5cpQ1yNy18yh8ZNCQOcgzloPJPe?=
 =?us-ascii?Q?mQNTKGEbW1pEaANN0+y/id9TneLT6hoiWfY2AzhvlFLBlx4txYi9CI7fcrNb?=
 =?us-ascii?Q?jo9Ctm2y4vmE0tmo43TIZkoGc0BDQ4t587+XBNPfXPoA5IHsbQt75Hr48mXk?=
 =?us-ascii?Q?YZSU9+QOMhBI9wvl4H3KGcCO9W27frpCKo68kytMbffdpdRypMcaf5pzq+0j?=
 =?us-ascii?Q?M9Je0f82Sr6qKVBqAywE0a5Q/nAIu+wp5vCqAG6Cmw1ZJus7Mqzf9V1LFUBG?=
 =?us-ascii?Q?AXLhUUj3T28x6e/idbC2g6Oy4hxssy9FYrk8JqD9K8e9H+KhdY2Fr6luO47u?=
 =?us-ascii?Q?YoAleBqh7ytZ6/fmfqBlBcAz7OsCFFxFiJA4RGxC0yPozsiRWLq6QjoNtT0b?=
 =?us-ascii?Q?61J+6HVwEXly2/h6D2cy08GAoIh14pahHFlj+f83JO+pUmQp/sjCrpAMFwlz?=
 =?us-ascii?Q?aHFRMe/nK9wLitdKLY3gUDyqff4S4tdyqvj0Rh9UcMF9wnwpIi7YsI5IdaYn?=
 =?us-ascii?Q?KUUUpG5QVF47fs64kMYVSZvETpeSk/0LxKWviRGmLfym4RiktY7tExIxOyWt?=
 =?us-ascii?Q?cLI6JDBeyp1IbxSORIKWXh3LQXFHyf4OHi9y4JKgnjagax6CdPicHE0LFh08?=
 =?us-ascii?Q?lOd3lnGeer4CGtXqapQ2GYRWlz8hCVwwQE1EsD3EvtHXbzY1YI+Grr+hyojh?=
 =?us-ascii?Q?LnB/Ijv1J/2znGCS05Arro4uy6YdUSXrfvD3q09Yfd11IN8lYs93wpw0jWkr?=
 =?us-ascii?Q?4X9SrZ5S+dvPKR4RiKL05aHEx0jXLrhNuanIqUZg1bHoWjeXN6PpZm9iIEn2?=
 =?us-ascii?Q?jLAu8eHeaDWqLuzytbDOPi/eEiCCe2BKOWJnHG7P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8b85af-abb3-4ba4-9897-08dc895ab778
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 14:36:29.7441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fLaxLWlsqZfZ0b8/dzyWb5vxIU1ERbwxa22v9SMd7RBQ1GjpT51iHEl7L0IJfUA3U2YlxZ9A06oD7DuYUq2BeG2aEFWY/eHhttAKv8sZUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

-----Original Message-----
From: Govindapillai, Vinod <vinod.govindapillai@intel.com>=20
Sent: Monday, June 10, 2024 5:00 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Heikkila, Juha-pe=
kka <juha-pekka.heikkila@intel.com>; Hogander, Jouni <jouni.hogander@intel.=
com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/kms_dirtyfb: populate modeinfo before f=
eature support check
>=20
> Drmmmodeinfo is required to identify if there are any FBC size
> restrictions applicable to identify FBC is supported for the
> required test. So update drmmodeinfo early for each vald output.

s/vald/valid
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 2a32fab56..c0eacda9b 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -180,8 +180,6 @@ static void prepare(data_t *data)
>  {
>  	igt_plane_t *primary;
> =20
> -	data->mode =3D igt_output_get_mode(data->output);
> -
>  	igt_output_set_pipe(data->output, data->pipe);
> =20
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> @@ -328,6 +326,8 @@ igt_main
>  				for_each_valid_output_on_pipe(&data.display,
>  							      data.pipe,
>  							      data.output) {
> +					data.mode =3D igt_output_get_mode(data.output);
> +
>  					if (!check_support(&data))
>  						continue;
> =20
> --=20
> 2.34.1
>=20
>=20
