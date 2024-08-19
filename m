Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFF7C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF410E1A9;
	Mon, 19 Aug 2024 05:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhUhQM3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8810E1A9
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724046404; x=1755582404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qSGKLPdJbaAyzDFFP4vhMs0bMm7R9QuY9dWVx+r2N4I=;
 b=lhUhQM3SavqXvgYnnF/d0FXKHYLiluCyUkasLZXHWHEw12vga1p/r/zU
 DGGnDnxPbubhp5U04qkOqTHKnaPPumRGhk0P9P+TkXfFPbe/FQaPgzXZ9
 4uxEksHNynoDTF13dtrCfQlr2p2s9JjC1cCmb0Cr6DgE/mxXtaLaa/t/x
 QmI0BoWf52dNV7LawOF//BjoezkMYTq46G2nYs5VAFMeaYbyeEI4bxz0I
 9Kv1YqFaxfxTL1rf0X66EzGu0tmZojqp/k5Tn81xy+3oyfIFyS9uFJAqm
 y5cIPoePjyodbds0NjwAvVrZDRYyPdQaVrE5+EKA6wozJomxtR2/ANOxM A==;
X-CSE-ConnectionGUID: Qy3wIjdoRZacgUTeN7kFyQ==
X-CSE-MsgGUID: OaUIjjMbRFOHF1m3cmsA6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22085788"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22085788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:32:33 -0700
X-CSE-ConnectionGUID: Y1drCLbbSgeP881WxX5bqA==
X-CSE-MsgGUID: NDsthQMIRD6NVj6D9o7IwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="59922698"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:32:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:32:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:32:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGSDKwkLE7l8RBlA/0/PsjmcrAYpQ4413Ete6si/ZJo1Hp7+DFbGoaMTCCAi+x7whmWfMzooiBwQIweJ3VIJdr+wcQux/dw/eBJXuAFDLHpJYssL4RQHKwhC9waRw7v3j6uXZzsMvmB/DGGQPgHAkRhci8Lbpg3INu2dM5xSmMJ5FQ6QH4CJHt97gpoGxt9ApfCw871KWXiS/dSMYvJJ9Zt9z19UIQAVs/TSVxaVTrTqZz4Y1jb3K2DHjhB5bqcimSRPtl4e0NrSIo7OtdovAWqL0w+8hFKFyWrCPD9gMA3jJjuaigotxAA5TLcD4cgvUhBlDGuhYIdkX7df+MbJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTE60HzsbxNTQiD2ExZJYLR7Jn85WFSpj2zwoCrP7H0=;
 b=BJUxATfytyZy15McXIw0OndVuSZb+wrc0+vWULwbNmfAB8dfjMAGNI73ggxr/rO4kYHQEA0iT4LeJCdxeybHdibADLgnX8ydSw5tkiGf2sGHIz9Nq5TSG9TTFXin1AQDhI7xnaPkjBtikG52riEytIP97t7eeMn7RHH9djKT5E4uNitW/y6c2Hq4bbxmfipRcunS184ZJYsTgHHQwDrg/mA79i33Kg8hezuaZDBsAyJ5RFjnBfncXA5COmG/Ha/BVdaCIhbA9gCJpQco8McNHg4DKd/umSMEjV7PLa/KqYU/KLsmqpy9nLUD47sXTIlZKty3GN2OEmtFJtlqTWOn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL2SPRMB0001.namprd11.prod.outlook.com (2603:10b6:208:412::10)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Mon, 19 Aug
 2024 05:32:09 +0000
Received: from BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7]) by BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7%3]) with mapi id 15.20.7875.016; Mon, 19 Aug 2024
 05:32:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Index: AQHa7ThjmQOK0ZbM6USkMhhtX5fTLbIuE6sAgAACIPA=
Date: Mon, 19 Aug 2024 05:32:09 +0000
Message-ID: <BL2SPRMB0001D76D5456C870A2413A7CE38C2@BL2SPRMB0001.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-4-suraj.kandpal@intel.com>
 <DM4PR11MB6312FCF5B625747F25228255908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312FCF5B625747F25228255908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL2SPRMB0001:EE_|CY8PR11MB6889:EE_
x-ms-office365-filtering-correlation-id: 24a4c016-1a22-4448-631d-08dcc0104528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?I3E498Lc2otEzMHMSJS1/C4/1k3/oJSmIVvrTg6nxMb55b29mJOe9lftP06w?=
 =?us-ascii?Q?JryQkOd813WNO+Cj2Seuib/WE3cYYQb1cGk1M2YVjq1KKkaVD51Pu32+H+FB?=
 =?us-ascii?Q?PrPKQPpNuQD286xH6H2zD4gcliwAydN1KuTJg1oaEkwbmxz+rEsXVvQYXl01?=
 =?us-ascii?Q?D6gjMbNc6MG2tZePSWd9PsBxd1F7MNhWxWNPWYmIR3t6vDZnYdD7GVIU1rhl?=
 =?us-ascii?Q?dEp1uXwajFP0exEIZ0CfVLJC6FdaO+AMCU+oNnBXFieMm+2pV5V9Nk3t9dK9?=
 =?us-ascii?Q?dlE9bQG9efls9szON5UaeBfYshifipFvDADDhkTQLk8PxFOrNjsBddvsIvvn?=
 =?us-ascii?Q?oEuGCvQkXb2p98AXMuEgthiwQGwjgdudKde7cVKGkSNJIQXS9ju7vcAt+3kb?=
 =?us-ascii?Q?AxAuX75a6CZYvysPmPCoEydkAydOnCggVK5LcrQdlpaR6w7LHWH6AJ4qQdRo?=
 =?us-ascii?Q?lBGNDUeu2yBaP2VGjJrBya8cr33arsEMfMiUfTse1/GG/kNpcZpHDwabvqeZ?=
 =?us-ascii?Q?ReoH8FzyBjGlTRwbWHl5ulQJyvNLp0dwmpKD3ZvdSQw6A/83sbXxlaS/INbC?=
 =?us-ascii?Q?VXzqaPdCm10nLS7J8BsKTMj4fxotelI/1vN3SH5L6dpcaS8y1+CkhHG4Dkjv?=
 =?us-ascii?Q?h+yZVaRkCOzbOPpKmyL5JNURCWyjFf8bfJkKWN/yo0ZOibDfL35AuvxVlcLE?=
 =?us-ascii?Q?t+ZxW1UXfVK002yvOu2xAO1gsfgVhWh0VHL7tqIvSrC+9h3256EpTC61vdpa?=
 =?us-ascii?Q?aQh08ar4y+hbb15RAJRB2cqJFU0ODAEcLs/LvGPQr54js8J/jB3VfFQK4eTH?=
 =?us-ascii?Q?OI20jZffWRAaZlcH7ufhdE0tMN99xskfLdsnbAnAt9+o89VLverdpTThpxNp?=
 =?us-ascii?Q?TG1Nd20mwvrTv9/JsxWViZC6Xt4DZoy1L2XKaf3XG53KYowouJm0D8lFd/04?=
 =?us-ascii?Q?yh0Ta9DpEbFkWrLTl86/TJe1HuKMjNAwdMrRUr51T0W6Wd3UDLYsuyKDMgy4?=
 =?us-ascii?Q?pWcWMrvI4YifwzZrowv6Jwd8+z1iKRNKSVeuVOGjRua90X873bhvmzv2cgw8?=
 =?us-ascii?Q?sS6VR2gHRShLGoZ8MYz05QyBBWQw1I8C+v3igPKj31DaSGoDx8O8f/VCgc+q?=
 =?us-ascii?Q?cWlj+3BsJQ0BxMlhXrU51HBEyXagCU5+xfsuWGRkeoJYr0UIOg/tVkhDUhHl?=
 =?us-ascii?Q?NBkYzSmksOpSYqWuC45kAbajnDo3XuAl7D4sPNev7IO4PbhAJbfjyu4nbLMm?=
 =?us-ascii?Q?nTNfKiEXiNcXKIiILbay3Suh7P2W3u6u2Fb+a16R+Q0z4P7nNv0mLOiX8EtS?=
 =?us-ascii?Q?E3n1BdqAMThGa3UT0+QOJ2BtzM6Rya7yV7xiANnVXrRxfKfxNh3TXT0iI77c?=
 =?us-ascii?Q?ZMXvxRVvLeDNjsc2Cgqg0Trzl0M7EtynJqhlFXHnAuQD4JIqtQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL2SPRMB0001.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LGWcZd7nMNp64cAHrY92TfmOyL4gW01ccP5TNglj+MjND+dB3bBXnlhqHewd?=
 =?us-ascii?Q?yJBDr51mlIa5JnkYEokRwx/DtQmjIPANNPT++UJDbgxzjQDIHHHKozgolT91?=
 =?us-ascii?Q?A5JrmbttpsTWyb30LcCa/Dy9FoQIKON7qi112fK4e1IeaU7EFJK4UoG5Nxc9?=
 =?us-ascii?Q?x4S9cgYdpxVtzLvtjztY+HFVcWCTUKHKG56t3pBv1Vus4GM/4PoTMxJeYwmf?=
 =?us-ascii?Q?Nn+mW9AJa71k7kqH0f189w27NnGITxtRgBRn5189rmvsvYKD+1sFWipiVX3+?=
 =?us-ascii?Q?7WoW0+8JIvt8DmFKnC+gN8Dr9ygM5BVOfXiX85elRBqToKKiapWa2Lzga6jn?=
 =?us-ascii?Q?4qu1NRJtDNdTlIAmHdfVg38lCRcXI5ch/adXkbiHHaraJsy2eVnIbsOAwdLb?=
 =?us-ascii?Q?amcyfY8lZHlM69MWviDHSgEO0zeKVLoaRHe/OSZ22MFF7TtocRDFk9yG7Nu1?=
 =?us-ascii?Q?m+5950kaa2nXaYVWR21wgu9tz8DgJ98hB9KtJCoH4ZzPLM2R2EF1KlLeQXS/?=
 =?us-ascii?Q?1Xi/AxZMtEu86PmcnOt5kttEiR4ojiQNxrgwXCu42y2Q02t/bBtHYHeM2qUY?=
 =?us-ascii?Q?TXA4nrHLhOufp6auJWYr606l0DjWsnBKzcmCRhs1/HszGLDiqn2wJK3X2VP5?=
 =?us-ascii?Q?BhrsvUDm2u6wG50U0EfSRX0FKJh/Ev8eKfnTKWlJQEFf9ZbstHRXkF+D2eez?=
 =?us-ascii?Q?UnxYyEAhN8tFOlLqf7Xxn8arBSL1YCEgSAKVLgbMgZ1wiXl0hSOS2SeLgh31?=
 =?us-ascii?Q?8nHLcDtmdcIrl3wTKi7FRe+yrRai2/5RqZedlHyLAClhnIgF513YSvrzAMrh?=
 =?us-ascii?Q?NhdF31wj6pDD3az7jeRLjZAiUWtubGMwj0ApkAPpFi9LS79H7VFVO2MS9Phh?=
 =?us-ascii?Q?gFbYKG3/VNuAD0mW6iIEm99Qn2kKAcS8R7G075Lz83LAwNr17m0621t4zSVh?=
 =?us-ascii?Q?gi2xbBtaOs7W5n6RQBK+IJt/0wIcMZ6giftOM5yyewzbS9J5nI/aeisyJk0n?=
 =?us-ascii?Q?L5IcVlFfDTQyRlJ5S79R7jxD0ZsvV2vH7/AFK7/FYdeC0mDkr+ehFBI+7ggW?=
 =?us-ascii?Q?i6FgDGiwdnSlErswPhsXLopwgeCgKCzkkhcaqxrZmr7T8afalS9mtyTdwpkt?=
 =?us-ascii?Q?mmqPsesE/y+fAncgWWqEZ7FhLoa0nhshqGQT8aPsjozfgqXM4CZREzxuVEPa?=
 =?us-ascii?Q?A9NcsDSW7dNBMpQhx3Uv7r74VHSKr8EOt+9wfdmjDoOT6KAtzIXF6WQnLCIR?=
 =?us-ascii?Q?TAotLk7SH29PBJISsQ7+5A/RqwWh8iNdg5MN728taNkX6rMl9Evsl9OgWhKP?=
 =?us-ascii?Q?Qu2QXrQDpHTisCwGgOVvnWwdjUN6dLWWN74LFd+crvN576HLr+2DgToRN4Gy?=
 =?us-ascii?Q?3qibTDesKvcRbKI+86LUBLMRYn0ml4btQ5NdtsKcQ6ZDO/r+rUN6hk6iwzL+?=
 =?us-ascii?Q?99MtgItjsoUz47jqqdp1cHxi8G9SNQbte10rQpFzrLGOJ5O7kaTZC0VST2V7?=
 =?us-ascii?Q?OYeQRMi90fTMTQU/1CCRFMKfqAmXwBFmQAq5+Ybo0E49JnHvgJMxudGY9+nQ?=
 =?us-ascii?Q?1UzY1IPUyvPz3DoDmVWBxmoBlpf+AC/lUTgbl5o+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL2SPRMB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a4c016-1a22-4448-631d-08dcc0104528
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:32:09.1743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJtQgH/VmEQEhXBeE0nSnTsapvPrkpYBj44DS0Y6/SZgyUx6iDdUA/ALmBOXKOCMKj7Od5GxxMgAIm7jpLFDaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, August 19, 2024 10:47 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry lo=
gic
> for mst usecase
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Tuesday, August 13, 2024 9:50 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> > <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry
> > logic for mst usecase
> >
> > Add mst retry logic where it retries 3 times before failing the test.
> > After every retry mst setup needs to be disabled so we need to add a
> > function which disables mst in one commit.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 84
> > +++++++++++++++++++++++++++++-----
> >  1 file changed, 73 insertions(+), 11 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index db6dc17b1..82a56167b 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -278,6 +278,35 @@ static bool test_cp_enable(igt_output_t *output,
> > enum igt_commit_style s,
> >  	return ret;
> >  }
> >
> > +static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[], enum
> > igt_commit_style s,
> Update enum from s to some proper name instead of a char.
> > +				int valid_outputs)
> > +{
> > +	igt_display_t *display =3D &data.display;
> > +	igt_plane_t *primary;
> > +	bool ret;
> > +	int count;
> > +	u64 val;
> > +
> > +	for (count =3D 0; count < valid_outputs; count++) {
> > +		primary =3D
> igt_output_get_plane_type(hdcp_mst_output[count],
> > DRM_PLANE_TYPE_PRIMARY);
> > +		igt_plane_set_fb(primary, &data.red);
> > +		igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_CONTENT_PROTECTION,
> > +					  CP_UNDESIRED);
> > +	}
> > +
> > +	igt_display_commit2(display, s);
> > +
> > +	ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
> > +				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> > +	for (count =3D 1; count < valid_outputs; count++) {
> > +		val =3D igt_output_get_prop(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION);
> > +		ret &=3D (val =3D=3D CP_UNDESIRED);
> > +	}
> > +
> > +	igt_assert_f(ret, "Content Protection not cleared\n"); }
> Suggest to update string to "Content Protection not cleared on all output=
s"

Sure will do.

> > +
> >  static void test_cp_disable(igt_output_t *output, enum igt_commit_styl=
e s)
> {
> >  	igt_display_t *display =3D &data.display; @@ -630,6 +659,49 @@ static
> > void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs,=
 b
> >  	}
> >  }
> >
> > +static bool
> > +test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> Here we are trying to enable mst with cp,  "test" should be removed.

I think test here seems appropriate since not only is enabling MST we also =
have assertions to=20
check if CP has been enabled or not also, this follows a similar style of n=
aming found in this
test when retrying for a single connector.
Also a suggestion maybe adding a new line before and after the review make =
the inline comments
more clearer to see I almost missed the two comments I address in the reply

Regards,
Suraj Kandpal

> > valid_outputs,
> > +			      int retries, int content_type) {
> > +	igt_display_t *display =3D &data.display;
> > +	int retry_orig =3D retries, count;
> > +	bool ret;
> > +	u64 val;
> > +
> > +	do {
> > +		if (retry_orig !=3D retries)
> > +			test_mst_cp_disable(hdcp_mst_output,
> > COMMIT_ATOMIC, valid_outputs);
> > +
> > +		for (count =3D 0; count < valid_outputs; count++) {
> > +			igt_output_set_prop_value(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> > +
> > +			if (hdcp_mst_output[count]-
> > >props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> > +
> > 	igt_output_set_prop_value(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_HDCP_CONTENT_TYPE,
> > +							  content_type);
> > +		}
> > +
> > +		igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +		ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
> > +
> > KERNEL_AUTH_TIME_ALLOWED_MSEC);
> > +		for (count =3D 1; count < valid_outputs; count++) {
> > +			val =3D igt_output_get_prop(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION);
> > +			ret &=3D (val =3D=3D CP_ENABLED);
> > +		}
> > +
> > +		retries -=3D 1;
> > +		if (!ret || retries)
> > +			igt_debug("Retry %d/3\n", 3 - retries);
> > +	} while (retries && !ret);
> > +
> > +	igt_assert_f(ret, "Content Protection not enabled on MST output\n");
> > +
> > +	return ret;
> > +}
> > +
> >  static void
> >  test_content_protection_mst(int content_type)  { @@ -684,19 +756,9 @@
> > test_content_protection_mst(int content_type)
> >  		igt_require_f(ret =3D=3D 0, "Commit failure during MST
> modeset\n");
> >  	}
> >
> > -	for (count =3D 0; count < valid_outputs; count++) {
> > -		igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> > -
> > -		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> > -			igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> > -	}
> > -
> >  	igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -	for (count =3D 0; count < valid_outputs; count++) {
> > -		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> > CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> > -		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> > hdcp_mst_output[count]->name);
> > -	}
> > +	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output,
> valid_outputs,
> > 2,
> > +content_type);
> >
> >  	if (data.cp_tests & CP_LIC)
> >  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> > --
> > 2.43.2

