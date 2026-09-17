Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7EBC982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F1110EF18;
	Thu, 17 Sep 2026 14:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtsYhjrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948D610EF13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789655383; x=1821191383;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NmO8P53ALrE/LZXhUaiR6w2OqQrqHmarTBV/TqAglEc=;
 b=gtsYhjrQDDEXOBSGipJoabKok1tfYSeJzwxxNpQIwJH7kO9og/WFxHQN
 00RvmR/r3XGCDp8xRUpzNANBZRCO1EkRSOEInhLNdOOdLyJSnHI1JQWUC
 82GaEJGnAMx3OZHsBwFDAunkKSVs82x5cg1sXOK0tdyWvqyyjhKvdaPPr
 BcgcCkzrM52mhpbobjJeUIFpwTlRnyDpS3Znlvyx0HBl+vIbtEgoy+wFZ
 7XsPG0XIN7rSEi3xdJtuYbW5gBd+vx1HmV8JktBdW60bmO27KYxVeWLEG
 WMXRs/aAPe0Uw/cl6mKdhdPK4pfgvhzOpFa6I8Mrc0PzQeJuDCFctopxO Q==;
X-CSE-ConnectionGUID: Ume+pNa2R+OAjh6OIQ9boQ==
X-CSE-MsgGUID: ZbOfD+mLSjilnruvG5faOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89216756"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89216756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:42 -0700
X-CSE-ConnectionGUID: ffFDxEFWR+m+KgB6yofvGQ==
X-CSE-MsgGUID: 1kndiUtZRHuYQSLfT7Bv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279052044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:29:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 07:29:41 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS27Fl6v5U4n57pgUgkgxeZkOFyUWUiQC0SrTOu8cOk8Gmqcmkwhe9oQd2VhLp9rUW0mcE8JtQs61J8ULliu8t8Q97mMHUwcd+C3/klQujBIOEQCn/BCUfgpgsYMTqiyJ8BwtY9iBTp5gNTHnhhQj+3OBByxqbcSSBB/NVVKLJyhkwKBpPEZSLCfImwEyMV43eqjZ9bCt8TUBPmL49mVgFNO5CFhYm+BGKQzFD4wFidZx+Y4mS2FO5llhHNEHYrBJlvR0AF5IRBTkOyvlSX70jhiWbjIxoMKkHkfzlmELSAMCKU24gofO1ZV6x2/C8f6Kje7DLD5w9UNkQtxb17qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1bdTVzMa5pTiSETm3W0tkJvdpdC2Ie3doiyHDskWK8=;
 b=WdJlPdM1AQVVwwvAITv2HH2GYfYqDzAcN2ADs82WZhrPCfwPqVYh2+hP4CgxOP3RAcSfkIkNLbFuIfpPHnTX9PJxMfvbw42cjw2Vgl7++gni42RPPZmhaf8TNv5g6nY04RuXuLK+s6rciv8TMPSe58S7F5xLlWe1lDl7BczuS9EedyhWKI04RMPxz9LMQoPn7frfW05PASk8hkozuxHs8FYq2KR83ARxSNcp+M/p6nTTtB12PUAIH7a70FVP5a3ykm2emmC1dH9sOyxitlAqdcoV+/HVWhs5KVH2cnw2x/V1uJrdfOjQUGYAARBvwzSz1/boHngFjOB6hGkdbvBJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 14:29:36 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 14:29:36 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t, v3 1/9] lib/dsc: Add
 igt_force_dsc_enable_compressed_bpp()
Thread-Topic: [PATCH i-g-t, v3 1/9] lib/dsc: Add
 igt_force_dsc_enable_compressed_bpp()
Thread-Index: AQHdQjB7YVi8OZ1Is0agi0s5sK6El7bS3WgQ
Date: Thu, 17 Sep 2026 14:29:36 +0000
Message-ID: <PH7PR11MB679611C6344A674ED71D94E6E5B82@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-2-swati2.sharma@intel.com>
In-Reply-To: <20260911210709.943683-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH7PR11MB7429:EE_
x-ms-office365-filtering-correlation-id: 68e17b82-15f5-4bf2-27c8-08df14c819b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|38070700021|11063799006|10067099003|4143699003|56012099006;
x-microsoft-antispam-message-info: Eg2eLgMEAcirsO0ccZm19cZFjC/Wtj4WLxKmBjPaAPX7CHwkRJeXC/YIcnnJQeLQ6csYrxbfkRBiExLeHXHl9FufOYqS2fexOUtHRPGU45gBE2zkN2i9ERaAcUUNJ+4haab1FsnEWy5pRcdm8I7kUrXGhgVHl95tO7zNMKhX1o2GqIdthv51rPtU4RA0UrXebIFbC6K0jRYxM3UD3dbxLbbHKPs2iFirt17wUM6HCHAtsGAEWqHQt1xHWz6bDcPPVpe9ANJiJMpuPYAqxRjApFD/6pvyDWGHjj+DYsxqvX641nijS26+ZzgTfmFwlIVKnXoIA/OR1hJO12P52b6t3t/Fvm1wSGoeSnEPELxKAK5MekI3cwqazgFKEvW51lhRKR1MD8DR+xCrNKWGN8aWM/gbxi6F3b5TrHigqD8nznZ+UBjNwpHT+OE7NptL2eqil6THcgWwLn9skAJwamylRV3XNjRL3snvQiHD9XQ7/VmXj83CkY7PZVGZjULRw1gUT+0p4r9136C8fQnfW1iGN65d0WRQhFBi7/XMKxwIwovvDVNFtSqs9Ql7j+dHAZXnacnjr1GmckxXqUB+7t1dOl6sth2axGCqRH72UpQ2FvrZUy7saSD+weO9fVr0cw33vOg4U9x552uc60WpQT+4PGkeRK+2k1cNtraVSZhx84yosBkopxH5mxqAkXRWWE+5RuBJyodedapUVHNJMJ2cUCx01YHt5trRulNf00jlVhQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n8snHUuo5Z7kOaPuk64NW15QXp7WBQle+RpTE8y5H/d5nzPU7ICcByyjnE3T?=
 =?us-ascii?Q?2RNB3TH5f8xdLLZKxPG+t5vqka2hGYKwdWLZaIl2VWdOUJyz4vLNHC0c0NcQ?=
 =?us-ascii?Q?DCZQlF3DoanvSkkydiKbMAcr/F2vcMy03UEvZEAWAOfuali2M9731r3YRa05?=
 =?us-ascii?Q?FWIOcrc1a63k1IoSS/XvO0ZEcaIsDkF7yQiM42c0hoVedKUslpMQLhOAxFUY?=
 =?us-ascii?Q?OrNEM336RrcGj6rW560p20J65EdiONauMgu/kz1gGvpMbfgEqt3wo73tLfNy?=
 =?us-ascii?Q?fzz9A3rx3v9j1bIDEjvpBVgtiJEzTfEYjAgew+/vrMQnmOgkO2KUEhpIwDE1?=
 =?us-ascii?Q?VTBws2ECGsaz3+oiz/XrLSq0qf9VLsjZ/QF8PZuBStiN7xVjnrVEKSSPuXAH?=
 =?us-ascii?Q?6tgppDZ/28uX/oATX6ilyagCTW2E6fU6sJOUmBWBn+BCYad0PV7uOrbe6C0V?=
 =?us-ascii?Q?VejsYrzWkPpIjOoeXDub3FNWd5k+1hrwAU0lWMACXBvaxFEP7dd4Eil5FBrY?=
 =?us-ascii?Q?2N+9IA1r2APSSS8H6Z8DvelBB6ukfJ4qnQxEsbmejknH/n5fet8mTq3CGHms?=
 =?us-ascii?Q?Cpd++PWazPJufy0xq1aByJ18/1OiQ0Wf1ACOTXUJiGHhSYIISC53DVQbpmmC?=
 =?us-ascii?Q?juxET08gL7lTuAFuDIQrq2jSjIyGNyhwVPe8jMqXgbRHUG0OeJJv+5Y4uQ2o?=
 =?us-ascii?Q?3+9TP1WgXOfW9+tWmLfHy+mv2xK1r/XIjnzr95TjlQ1RGCJaPcTsblKRuxvC?=
 =?us-ascii?Q?W5SVwwFmpBMMM3mzO0f7JSr8wFTTIwKwP8/7Hml5hT0v/IoJ8B6gb19KaHgr?=
 =?us-ascii?Q?NL5M1dENrrZOxxQbh+fzW0AtWQJ0RlpLle2ioVj0vJ21lT/Ign9Z5v3w3Tky?=
 =?us-ascii?Q?QjmN/pDQ0+b1GLtLThYEWI2cviqqhk8TKZykSphmn4iviRvG5TB86f8JZ0Te?=
 =?us-ascii?Q?LZKZcI+5QHHjKegbj4aFuTslu0dGdiRvq5cwnakwcIzpoSVih/H6V4dHlqLb?=
 =?us-ascii?Q?be/mpntxLjHBIELSjoV9Tp+6qxRkL5p3xMpTMUgtnBEUtxhMK2mbzYaat63J?=
 =?us-ascii?Q?CgTv0te8ocjbIbzkMOs3CF76tVi4hpLhmi40463/wNaMHXZ2ELX5TWIzSeg9?=
 =?us-ascii?Q?CEx80I92mJDmCiuTeuhRf8lpt5dcfj8Z79/MYl9JB8nP1e7MUmsg5XR4NYiW?=
 =?us-ascii?Q?7vV/2mQZrBPkPbHzQlwiI7aPAXT7jvsspW5WOdWcqYB0hpV/S9A6CQdBEENJ?=
 =?us-ascii?Q?HvfmlXvrtPL0MburYIUZsMWrZrkQwRCNej8Bw0S+1bW+otntPeBQHP9fjRD+?=
 =?us-ascii?Q?+RD04ToIjuBnNZiWxugSiiUbgDGBX85yM5wip3x8A5VZFuEAGqlh4mMP9Y+7?=
 =?us-ascii?Q?z5irS7wtI9A2r0T111vVUFZeTjN//dk2g1VHIy0sowKmWkX737s73bDheNZO?=
 =?us-ascii?Q?YQ3w2h0jpdJ/prg9swNy4AWXQw1UIttOS0id0BGV5koJHwSAXSqqndmeKYqI?=
 =?us-ascii?Q?bz99iVylU7AIlnvjk9VF6BkZ89vK9qK8+KwgRhMlWTRX2fe8/Kzz/PJUo1/R?=
 =?us-ascii?Q?b6NSjCJvV4dLtEOs9bEinSBAwekxvzf2M334pLid2CBkkNaAN6uJUNK82e8r?=
 =?us-ascii?Q?hwiDsgdShrGy7k4GxYNijM63onhLHVHXYXAobTRAMj0QxSl9v6gxalzwzHaT?=
 =?us-ascii?Q?o8+DdCOkEE1MxYy0kA1QaB98e3qdJSnAAQvOwRl3iM3TAJCK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yhkkb2WhJKz20vJ4+nKusLaSC5ITjkYqlMAoF8pj/TI6KbSf5+79uoRvRScXV/sXVf69Ww8e50L3qma2yjta3aMZS28gdIxTArq77+fWmC4JbFeFDEIfNAtcPeKtNnScKcwREPDHI2Ovpml5IYakjDsVrm3SR9HcDs57OycxGsChLXEavgGFuzN9CQ6cSTgDKYJ6x4fpRgg7rm1+nuKZvXcMmuu2C6ZbsIf99rZn7QthDBukPcMSjLA/wu4wWpdwZbcRfbg7BM/Adlvmm87FwS74fmMD4rJhsDFctWJBTKY5v6An39eBdMkOaweH4GH41pRcHVOaEPnQ4zHHFF1HpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e17b82-15f5-4bf2-27c8-08df14c819b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 14:29:36.6410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lwn3OfKl9+jfn0F5JjvgWvWm3t3ULmPc3YEViQnhl4J6cHlpqNeJOVxelg5fuPb0vcSnOPpocTCowUn/4MteYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 12 September 2026 02:37
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t, v3 1/9] lib/dsc: Add
> igt_force_dsc_enable_compressed_bpp()
>=20
> Function is added to force compressed bpp via debugfs intel_force_link_bp=
p.
>=20
> v2: Fix compressed bpp precision for 1/16 steps
>     by writing four fractional digits to debugfs (Sowmiya)
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM, Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_dsc.c | 21 +++++++++++++++++++++  lib/igt_dsc.h |  1 +
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c index 3754eef07..a1d98500a 100=
644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -6,6 +6,7 @@
>  #include <unistd.h>
>  #include <fcntl.h>
>  #include <string.h>
> +#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_dsc.h"
>  #include "igt_sysfs.h"
> @@ -166,6 +167,26 @@ int igt_force_dsc_enable_bpc(int drmfd, char
> *connector_name, int bpc)
>  	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc",
> buf);  }
>=20
> +/**
> + * igt_force_dsc_enable_compressed_bpp:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + * @bpp: Compressed BPP
> + *
> + * Returns: 0 on success or negative error code, in case of failure.
> + */
> +int igt_force_dsc_enable_compressed_bpp(int drmfd, char
> +*connector_name, float bpp) {
> +	char buf[20] =3D {0};
> +
> +	/* DSC compressed BPP steps are in 1/16 increments, so preserve the
> +	 * exact value with four fractional digits.
> +	 */
> +	snprintf(buf, sizeof(buf), "%.4f", bpp);
> +
> +	return write_dsc_debugfs(drmfd, connector_name,
> +"intel_force_link_bpp", buf); }
> +
>  /**
>   * igt_get_dsc_debugfs_fd:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h index f63345848..0ba06d8c5 100=
644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -17,6 +17,7 @@ bool igt_is_dsc_enabled(int drmfd, char
> *connector_name);  bool igt_is_force_dsc_enabled(int drmfd, char
> *connector_name);  int igt_force_dsc_enable(int drmfd, char
> *connector_name);  int igt_force_dsc_enable_bpc(int drmfd, char
> *connector_name, int bpc);
> +int igt_force_dsc_enable_compressed_bpp(int drmfd, char
> +*connector_name, float bpp);
>  int igt_force_dsc_disable(int drmfd, char *connector_name);  bool
> igt_is_force_dsc_disabled(int drmfd, char *connector_name);  int
> igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
> --
> 2.25.1

