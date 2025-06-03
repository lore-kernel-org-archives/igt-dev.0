Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46358C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F3E10E03C;
	Tue,  3 Jun 2025 06:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv2vEy1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C06410E03C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748931705; x=1780467705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lQCi+MYqGerALOyfJmPBTIqsvicSqWz7bC85zI2hk7I=;
 b=Jv2vEy1K418iSt3iwbX+vN+trn5ReZob1rhKHZVe1u5uwOGEH7aIFUwB
 VHQuzKc4+egmL5TW08tI6Bxdfd4o00N7Eczd6KG7bTsxWv2rVq/9fYRso
 z5EL9k8SgYf6NH5DV/TbmBx9biB7B/VGS0UWNbYpQZIoA+CYknLKdd1a+
 LMTEg9sddTAf1k9nwOoRoLOWjg0cFngvEVo8D22QRlhQ8XzKLl1lD8nWK
 1+C++HuVcLiN3RAU6tWBegCuEkisgOLf33QR2JVdNgrwcq7aFFTEHYADG
 iuNKyETQPMvOX2RfW2JxubayJLrACgJ6hoCIPDkjzsos5C/8Xhfo1/TTG Q==;
X-CSE-ConnectionGUID: y34dIveFQIuys/BFhKjxoQ==
X-CSE-MsgGUID: JzBA3FTjSe2BNerfzO8j8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="38583156"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="38583156"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:21:42 -0700
X-CSE-ConnectionGUID: seiC70o6TTuukecwEVPYTA==
X-CSE-MsgGUID: Bpck7Sa7RLCi5skTC8XHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="145717993"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:21:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:21:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:21:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 23:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfqP9t6PAy2Rzo4SlyDE3H1QY1yr13QbLCl9io8PMk1OHVjErZXcgZjKS6aWuq6RcYGfxiUjBTvGrgX3zv6GzuXY1FoSsD0zmDkh1WWAWxtRTkkz5Fdp4dFg/Jgzf8zIMbdM3EfS9YR911CskFC95LxIQL7UTWNB8ORAWco/4I7KVlkaBHQAOTCa3SE4QMsnHswegXi5U2YN9aMItkQ9sHeMCoCRJCve41maBfniyqyVMuGf85qv/lwRo6li85kki80O9JAtJbdqRQJngYA9RxB6dTMQ11LeRqDhzujJuBY4ArBxkQaie+I+M7sw2rNlOT5pAqvjjCkfGc62G8qQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF8Cp3llsAEBrlz3QdUB8BwlLKCHTHKnSjDuI4Tj57U=;
 b=e/H0y6I7LCwSH4sdL8doJZHOnXzf3bRDnFAh9TEN5uvr2q74069RrFv64xjs0dEHkAptRC/KhcapXsJ61FmM76hs3TL1PqWoLo1cQsrSBpm9QRquYDZ7uDDO9ikdyFq7uvzs7ShgZTE8RqmBaPYHErqMyG9F70k9nbe6WiA+Hz6OtcVk7q7FumQEW0LvRq9JiWoI64/CZeIPid/Gyf+BBdH9N3eeZdO+O88O/TkYHuDvCZP0+G53gHCVyzm3i+Dzpgs0PUiMPQsnDvgWUHZb7KwtyUi08VKDXqfOp4VmsKd9CAYEkJJ9k0Avx6aDz58UKIHTzhBSZuJv3WfF8k7ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 06:21:06 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 06:21:06 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: Skip mode-transition subtest
 on eDP outputs with fixed modes
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: Skip mode-transition
 subtest on eDP outputs with fixed modes
Thread-Index: AQHby8Ks3BYGXyO04Uq0V3Wx4csct7PxBlhQ
Date: Tue, 3 Jun 2025 06:21:06 +0000
Message-ID: <DM4PR11MB6360C34026668A146A3BE32AF46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250523091652.1407070-1-swati2.sharma@intel.com>
In-Reply-To: <20250523091652.1407070-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB6882:EE_
x-ms-office365-filtering-correlation-id: 6e23b0d3-6f75-43f0-9cb2-08dda266d2c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HtxwG9AaNv7XPaWHYtwGpWP6RM+e+9haoAnxVr/TaTGEC6Lkz0QZUvFlb2fM?=
 =?us-ascii?Q?x78dVhEeIeE58gRIK+igHbJez3Qu54K3stLlqvP/SOXUNC08SM4KojTYUz6N?=
 =?us-ascii?Q?LXKLWdSQNlsgBS7wtOAErEZMK/ESE/jdc/SwpEUDmPH5WCovcFV2EqVYIesH?=
 =?us-ascii?Q?0wZK1r2AH4XCOYK6fBP2E92Pi/PelIS86NoD61LeWIz1yC7Oh5EVBfSLI7sW?=
 =?us-ascii?Q?ykHsKu6dkw0YBXZ6986b7S4DC8BlYHY8MDYT83F0Zzvmj9H+VMtLweTgZZxJ?=
 =?us-ascii?Q?sgxfqY4/YLyakTplVE/Pino1sl3mP1Lvh3XiRLwzsUU0a6OYF/iGI1q2/rzH?=
 =?us-ascii?Q?p5CIfDtus5pnveHMk6Fbo63NOCGQgMEAGSOF8/U4aa8jef2zf7FLckTVJPs4?=
 =?us-ascii?Q?0oz9rt12kzvM2M3KKgHxTC07aAAbXOAM3RhAxYrOg2sWVJO/YjUQlcaNh2NB?=
 =?us-ascii?Q?RPkDXZYtptqUREaGmra2fvKpmYbbVRuAwLV02kT+J5/C6cNXReOglxOUylY/?=
 =?us-ascii?Q?q2SJl0cpGUCkt71quMMgZNMxe3E4le6wJSNBS39VB5lvqoYvPez3iMzZ+cFK?=
 =?us-ascii?Q?+Nb5CmdGxxIe+DX/OtxZfswOX9HamgGYWg5yfUTkcjQ/yhkijK9Bd7LgO/3r?=
 =?us-ascii?Q?GTDMuA17xffhdcP0KIw+dUlvU9jSbvm0KSToCwF8wlZ+dhACE9TEZ9SkoF8k?=
 =?us-ascii?Q?tDMNl0fjTlOBddRJL3pzCuCflpNlGae8owYFEFxf7w+/SoSblVACzIfmOfli?=
 =?us-ascii?Q?s7KVA+5PtmupiOKxN+egSlw99vhja1Xhf+Ef+DKS9LEKM88KmVb0rFHSCm6z?=
 =?us-ascii?Q?WY43tVDBTgEJ4D5zbVlj5ggrfe4jrtVrPN96Lea42Ur2gSSfAEPiATTmU7I7?=
 =?us-ascii?Q?xEaT7r4rywcPl0doyXc5Bs61ptqEFv3XlE/ANvRqQp9vLxtznavyG1KIyNQ0?=
 =?us-ascii?Q?B+d8XaJmPAasYiTCfWJaijFkkWreAVdV/VLiBCX/6cTdvgjjnJPGePd2mPBI?=
 =?us-ascii?Q?Wk1cSMXtKXXJhF9Yyji6rUKA0TtG3gfmAWGqvXmvhc3HS/crUMiI4YKp2Ggi?=
 =?us-ascii?Q?VF+/eQXwANCkcmGKK96daqSr++yDUjrXYYsm/SbsvHsbKEbQbChbg5CegoOC?=
 =?us-ascii?Q?Pq01PbuoZK8JCLZXqY83yRVF5J5kbNgykstqNEgXeb0RVOsE/eVEabVbI2nH?=
 =?us-ascii?Q?kkuD0axvv24K7V58YkvFCPzx1mAkkzMiYhlLUwmg3wbqBOofCUt/goVUoZfj?=
 =?us-ascii?Q?cIFQHz5YpLNXHezlr2kL2crkbPZ/FhDW8gDHphIWw5B2nJqcrHHzWEVPQBCx?=
 =?us-ascii?Q?KqwKNRsGmL1ek2LgOBoed/rLLmZRTvHxs9z/fisZh+RcuOfNo1aiQUOD9eyO?=
 =?us-ascii?Q?ezWAeZ7CWg98A6NOhWek6mh1+FYRywPHW5zigZRucJthepHZ2ryRir3U7DZk?=
 =?us-ascii?Q?6WRHYNrAkpy4VxlSqS7t2eNRO58Nb38P9WW1tThZehX4+PJ3EZ9soqdJrWUn?=
 =?us-ascii?Q?bk3NgzHVx6WuakA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VogKOlmc8HMm7M+cEFHArwGqE4L/4YCWMfPWZYByNkonHcUxGweKFtEVBviH?=
 =?us-ascii?Q?mbbRUqPXq8oUeuvV8bGktbz08+6hkMLbnIZTyZ/t16xvRaNhT2OKAppqK3cQ?=
 =?us-ascii?Q?l1bk1uypPx1h+7w1t+inT5yAhoNo22UHF8yTwfWazZKwtQLUt+OeZvJMmlaS?=
 =?us-ascii?Q?RlB8EWvyVf0+XEIWNtN1tFbSFz/ndlqfvURbhioBidYhBmhX+84OU37DfnlO?=
 =?us-ascii?Q?T14cvZfBYeXzbGOThnhsrQfiW6exoD7ag4rP6FS2e/uvf5faMh4kI7OpRstA?=
 =?us-ascii?Q?KsKp5VNK4xFoS+2FUZe+Fc3QyuRfrGDF58sjsWG2YJUXJxGQM6MNf8BHmSiR?=
 =?us-ascii?Q?18Pzgs0ztTQvmnG/BEcuKk1MO452L7URIqMXfBHagOZXg6xf7+pXktZNesrE?=
 =?us-ascii?Q?wsKEm/GHbTIExY1rev/2xhgmI4eD46nClIk7zBi7LVZ2DxkMKNQAk4czZLls?=
 =?us-ascii?Q?JhR7ctxyY58aJTZL5vs20DM+ddn+osTcjuL4N1yeSi96ET1METJl8hDulexP?=
 =?us-ascii?Q?rqXo7bndwRQAPgBstRaIyGW6wM7TabyeQinZ3cWolit16kYN+n6nDy8LCvhE?=
 =?us-ascii?Q?pVjZ8jiGYuyiqTJ/CFFZP60He0ESM1z/kjdBoyMdsaC1n7WW3zUgubIi7fhu?=
 =?us-ascii?Q?23dNbJ64omlBlg9Omb2RCgs55b8RE6zqeQkPHZJGMUE7sZBc/50CiJV+CMaL?=
 =?us-ascii?Q?miGgilTX5NnUAGl+y2KCR89RLCH19clBp6Gvv4J7ChgxqdNDPa8zMbRXxg5B?=
 =?us-ascii?Q?tkDX7E4D/eMaxBPLadMsKTBiQz1bfhLvYiFJfZ7rBv29pFyiLgJYUQgFh1R6?=
 =?us-ascii?Q?ZLaw9wh25+9H4R2hPxC3lB+ca6p7x13H3LnQpr8ZMIqYbwcps4zXbjgeYZlD?=
 =?us-ascii?Q?u1FBnUzPyXPq4V5QBYMiFM/suoSpwNwbqkGWZkPQzMVW/cxvzqeaT/BdR8by?=
 =?us-ascii?Q?bUS1RJlRi9jC0LvYbaypKNAZbnBhstdc5FWort5tln/AirgiXeJUx3RAYzZa?=
 =?us-ascii?Q?DnvyFsejLOAgCxUVFlipcCdYqXzZvwVCe3mxwH9Lc/WVuf+FKlUmJh9WAPKx?=
 =?us-ascii?Q?LFbummu35tOC1d696CwpwM57ntBnhro4kvI6UlIK0OaDpjFxd57g8PowEfEF?=
 =?us-ascii?Q?XlbEfOUANeGWsnsA9zpXr/xTQGETePzzzUVvLbPHHCSn36qqyjmzr/RHrzjE?=
 =?us-ascii?Q?uThqrGzP5Xzc5L3+2a4bg027/ySMjnnbhqKUck4DhnWMpjrwO6PqGtjSwx4Q?=
 =?us-ascii?Q?556F9x6qvzZ+kxjjsGHyc/9slgZNvRp2YjZmPUGsglYcrdM/vVv1Sef+6mc4?=
 =?us-ascii?Q?TRG0qcIa/aLJPMol4p7gfEZNFJ+vECDueGG6FaiGrVPMWBOJzejQcffjmUCu?=
 =?us-ascii?Q?SwgluuhzrtD9JD3/oazU7a24bkzK1HLSY8OUZQipkUAOaNFmRIv6JFIdi4nd?=
 =?us-ascii?Q?FKNpkQHDvtO9xWKtpe4MdX0IwqHDMr1rp+IOhxFZnLo/Jtl8ThQbfBG8zLyK?=
 =?us-ascii?Q?kr1c2525pxLDKHucWKMxeiznjSEPwW6AnmD93BoqJSHJh95a4jPge91ZsGGd?=
 =?us-ascii?Q?ssFRCodI7Gq01O60lZJ/xtHNSME1/d9yLy2zNrLA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e23b0d3-6f75-43f0-9cb2-08dda266d2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 06:21:06.2413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2hq6avLqOvTet8bbyGRDMwoqB429m0yYgsrW+dU+sYMGulUfl5I4KTJ1blj/50cfQ13Og5Yq5fJtIKgdAgL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, May 23, 2025 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip mode-transition subtes=
t on eDP
> outputs with fixed modes
>=20
> eDP panels typically advertise a limited set of fixed modes, often with m=
inimal
> variation (e.g., only differing in refresh rate). As a result, the comput=
ed CDCLK
> frequency for both high and low refresh rate modes can be identical, prev=
enting a
> CDCLK bump and causing the test to fail unnecessarily.
>=20
> To avoid such false negatives, skip the CDCLK bump test on eDP outputs an=
d
> restrict testing to external outputs like DP and HDMI, where a wider rang=
e of
> modes is available and CDCLK bumps can be meaningfully validated.

I think its ok to drop eDP but we may have HDMI/DP panels as well where dif=
ference in
pixel clocks supported based on the modes may still be less to trigger mean=
ingful CD clock
changes. Example can be a FHD HDMI or DP monitor, so lets enhance this chec=
k and
introduce a minimum pixel clock delta as a IGT_REQUIRE condition.

Regards,
Uma Shankar

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_cdclk.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c index
> 0c7c235f3..4c6dd9276 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -325,6 +325,13 @@ static void run_cdclk_test(data_t *data, uint32_t fl=
ags)
>  	enum pipe pipe;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +		drmModeConnectorPtr c =3D output->config.connector;
> +
> +		/* Skip eDP outputs as they typically have fixed
> +		 * modes and won't trigger CDCLK bump. */
> +		if (c->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
>  		igt_output_set_pipe(output, pipe);
>  		if (!intel_pipe_output_combo_valid(display)) {
>  			igt_output_set_pipe(output, PIPE_NONE);
> --
> 2.25.1

