Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85245C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 15:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453DA10E41C;
	Mon, 29 Jul 2024 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww/tHg5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A410E41C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722267614; x=1753803614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sv/opfsuAPnZndz6MAl0lam+Kq1/3h/mdly/I3+yhPY=;
 b=Ww/tHg5oB5q9uA9cLll15pjgqNdfxFjBplsGvIDnndkuPJwDr/J0553P
 rLquvOTrHZURurQ85VxPYE9zP1YJF4A6LSRO2s2XVrttS0juz06tM+sDr
 YHU99EYx71Yrq8KK8CK+htggIc76FBozjdE+9lEZ8HKlXVtdBigBQvkcT
 nl7jrrXPsKDWgU5h+gcv5+rWCkrwbMnPEzTrl79+7xcJGesOrlawRyypQ
 1dG0XHsSXyc7/Sr4nbQrQl3EHWPWoGHw+CEnk0IIG7fo/53IW4v1GVu83
 Xveqc43ioX6CP+o7k0isBAhBfRnB38dSWcxJl6IMER21B/aV02kgghQx6 A==;
X-CSE-ConnectionGUID: ZwYPJ9ZbSaujozQYWzeyfA==
X-CSE-MsgGUID: IRwPTrxcSnOM+YDoucLmCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12772058"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="12772058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 08:40:09 -0700
X-CSE-ConnectionGUID: 03t0yGjJQL+PtkqjrwEdeA==
X-CSE-MsgGUID: iXG2MiTaRuO5rGPqdgH6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53732643"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 08:40:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 08:40:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 08:40:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 08:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXOOpohPy73DdGr+kmaMpFCYY34r0QJhpIO+6JPShBqAvNMZRwF7jTIM9wgI6dJbrk2IIxIIboDPV9WA0btZM3u/AZQuS2DYPWBysZPD6pGvhgmM9QZ7kPTZv+4t+HKTJGwpLRCCMK6vCcw/Depp1y1zzy+P5+HrVS6havqorCdbi7Ll9Bg2nfgh7m916YcwxgYbce6ChtXKw7Re0v9dR38cgVqky6uoVIm7J5LVBw1myYBVAFUapKMhadqpCbySJIlxP+fV4/eKkGB46xXnTt8YLAvsronDukEl8MShJyRVpV8FrAVba2eDBHdgpH2rvcY0tW6SmbaHVgVqGGne9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJq9bQ1OOl2zwsYJRlybYnNA6X3aPZd0lVEZ1BySMQk=;
 b=SUxm5rXKPvbSTo8tr3HMJnk7mxRSwtL6eHAlXPzG4EwqEtWQxsHRTDfUL5kYnHtJFIb48nEPNr1jn2twnGwcQzTbcCfV+mg8yilsddj0Bx/xImFUzegDuMWLTIR3pS5q+bxvGVHllyTwRbCohGzLTi7gzzM9xG03P520VXz7jgriB4tpnoqYH88zGYZVHxzuvlxhyy3WyIdZ+ib8VRkSHxf1AoHho8TDwgtXRfDn0Noz3oKMnvxtWXQPSvu8HucvzA7brnv8L9JCkaDijK+msZhN0lG6mn3B214jjUXFeAk9A5viZQxKhrYrguHHQ/OkOYggeCjVjazm4otdv7zVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 15:40:05 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 15:40:05 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_exec_store: Modify test for Priority Mem
 Read feature
Thread-Topic: [PATCH] tests/intel/xe_exec_store: Modify test for Priority Mem
 Read feature
Thread-Index: AQHa3gAZKejMxUeW+kafGGvywK02vbIJiccAgARVAkA=
Date: Mon, 29 Jul 2024 15:40:05 +0000
Message-ID: <PH0PR11MB5782430603C29CD3AF33F6AE82B72@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240724194006.1201429-1-pallavi.mishra@intel.com>
 <20240726212926.GA2906448@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240726212926.GA2906448@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SN7PR11MB7019:EE_
x-ms-office365-filtering-correlation-id: af3c8680-f2a8-4ebc-b288-08dcafe4b801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vN2LqcpPjKr6n6Hl2nqedSvCMYlUlZHEAhPhBtF/woS4lQE2KAqY3ubDQ+IN?=
 =?us-ascii?Q?A56hNvH2zisezRtRjKbNMFE0ahy21sJFdL7xHH3p+jSFDfgG9fsfBPPDXhGp?=
 =?us-ascii?Q?EHZuMbLFvc4iB01FsaL5fLmj1ARFdYKCyCKrjXmE77tQjpuHFyZJ1uNV1euH?=
 =?us-ascii?Q?Wg4eW5ek4Fh26Vq2Bjj/H0KZIwWRS5c+XhSSIk6aAXNkkxXW5zxdEkKwX5mL?=
 =?us-ascii?Q?gBFqKLIBcKbt7wE03M6A4YpKZBy/dmZkzqj+QZItxAqudQKShf9tPDjDLkzq?=
 =?us-ascii?Q?f/SaudSvvxOsZshEdNw4omuY4hYI5sVXfad1itYAG1G4NeHOlB3qKGOjIFZ8?=
 =?us-ascii?Q?OXBiI7F+kWBK9Yk+Eq0TFTjRgH5MgGnRW9kTAyHX8HicgP2VpghvDa97pHZJ?=
 =?us-ascii?Q?G0uQrrXH42Zrn5IC+EDu6ul05ss6clt/sax/N1L0FRUsHHes086YO36HiWgW?=
 =?us-ascii?Q?OKaB5vlnHbaXgyPoLaM4K1s6CKsstStrTMeUfEmznoj4uhpSEDtbEsjcEotW?=
 =?us-ascii?Q?P5vPmXZ7z1OjQ0/+QtMI2s2svNB0oq/SnawLlpZCp/yKLFFzm8arSr9+yIr2?=
 =?us-ascii?Q?IMLcp2fPJ7fLrBGrVe0apK3vqYSrMy52KTcm6ZzFFVRdKsft0mblAaxczLo7?=
 =?us-ascii?Q?7HGqAmwrJpnswIi6c77yqO35F+HuUTdRYvciFT92fZHYiER0OtMFTA36jm6a?=
 =?us-ascii?Q?fq0l51vGZ2xv4anihjpPreq04P6t1LbJEdoAFBaCcjj2OPE+AWsdwzhK/RBb?=
 =?us-ascii?Q?SDl2hCbYhTePZkeI8Z574iscYnPw+cmhzNNdAhXwB7lGeKVrKVfLoslEfPsw?=
 =?us-ascii?Q?vJeO+ntPCuXFQWFhQv2YMCZc5hJ0cNUoW01UtxcTGjmL4MPH2LYn9e3PSC+z?=
 =?us-ascii?Q?q0YK9Djga5M4W9OdYDwwPVCbJYFeGmvjkZ7lPYkTIDCcclp4SiSjHFRSHclb?=
 =?us-ascii?Q?+pUmogpxtMyMOnRTkd23jwfHU9TkEn3sP4dhWr0R1eCKdOqGzEbEcQqtQbNj?=
 =?us-ascii?Q?7AJiqcazzFf8qoabGdfU5zb4bOxdjB2hIVhakQpz2NBMHV1l33em3edpm6VS?=
 =?us-ascii?Q?IA6bdwTNuEmP4fQeArAJ5Rv1VZq9fxa0NXtF5yyvNHOyF+qhp2zs4vHRrY5T?=
 =?us-ascii?Q?QSc1OtBqaErv8EIC9g+h8i0huLHUp8K7rTmvaVbjjgK+NqfLVwTD7EMORLuD?=
 =?us-ascii?Q?r3O5JUgtIoSnqv3TITdn7QZzGa8bIn6LIU8F7IbyP4tSGfHNTNp5ErWV7a5K?=
 =?us-ascii?Q?QmOUCAuagiTiQ04D1pWwauiciWqCZwjSBhRU33Jb/awbsIeqKGBbhbMFQeum?=
 =?us-ascii?Q?jDuwCDSAgle7g9MyMcOYxTfbaSzh6HiH1GgtqOkaJ38jOMH7K172TasDH84t?=
 =?us-ascii?Q?F/9pRWo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FWifp/RW7iK/e+SAHoExZtN3G0ucZJQvmqTDyZqjE5suZ0UZOJNt6ZeipFZ/?=
 =?us-ascii?Q?EaUCLFd6aFKRXRqoymCEPXLRURqeYz+DllmrPtsT26AcWxJ5GnHIr+CA6nG9?=
 =?us-ascii?Q?xzd2x+1p1qWVAsG0KkB2dxXvdS6ySmPvsdV930CmvY+Cldq4fx3gd2o5pQ4j?=
 =?us-ascii?Q?8bl447mGmvJ2iaQscVZfLxzFYpZdEL7BkEv2Rd7oHYQQDOw4VGTYYSU4fuh9?=
 =?us-ascii?Q?aSVHcS2tVugucqCPEEqqsQTOzZ1XYwbdp/GCKMDnX9ggKT9ULOw7x2YntY3s?=
 =?us-ascii?Q?pYzKedIH7niR3L6DdBBt5cmGCmfKiAUlwGV1D+qjG1AeEp/EnzYC09xlvSLS?=
 =?us-ascii?Q?ueiJ7mJuAMp7vrZH8zC2XYLx2gpGVDCwMjKU1WxWmZYpA307hUO3ZDbXNTPv?=
 =?us-ascii?Q?w9lqNMCpfkgZbABvhOSrsG19xNt3iVV+ErVjxZzzTpuZsTEqG22zANDUYWRF?=
 =?us-ascii?Q?2y0c61DkjmZ72qt3wUlupEmg3wjpXlUB+D6YQi59Rt3VHGzWchSbk6MvTpYQ?=
 =?us-ascii?Q?BaMCM29SOUUWjQxPH2eJlN/0Sgn/Nlkfmgc6TlfvUObREBo6rf9oGATk+wHD?=
 =?us-ascii?Q?JThm/8KYEIivLjgVHiJC5Hks0N+dmBahmD67OuKAjBWQaZx3dkESRp7/y1NG?=
 =?us-ascii?Q?iPNa/oNQg9Z9ALz9ehcPPFdBr7d3vJP02a5aMVNubNKvQ/mXK8LujDPpnr3b?=
 =?us-ascii?Q?PozuetvJw+3gwH9DpJGG96LycB06CPF8KmgThrgxE7Gw59mc8dycIJ0iAJDT?=
 =?us-ascii?Q?IKiYe4kUe/4cMjXhwo3/jubxqt78qSH41JMYT5OPCnq8hM8tIuuJ7XG/2ttf?=
 =?us-ascii?Q?Gr//7tduTe9/JSfZDTS36eKwRckfigOTyROynXDIscmQKDZHKvMKQXxFnK0W?=
 =?us-ascii?Q?v4nU+Y+4erNe0aHYc//mthYobSm+9IverYj5U/dOfG3L9RgR8Th/EbgBAGwd?=
 =?us-ascii?Q?GGN9wYFHx6Kdm0zbmK3LJev4QzfxRLR0jbWa3HbtZI2TfYohUWPqp99mUP/+?=
 =?us-ascii?Q?7lktTXWlYERXiNcpnv7FRfYLd4PYdkZK3jNki/xFElAPLVrzTfzrjt41m0Q7?=
 =?us-ascii?Q?5SHMIhUtby6yVHq2+8h2lgerIAhBXUjZr0W8B1q0Deb8nsknd9QZ/9NT8omS?=
 =?us-ascii?Q?3rcowXGfJd/BuL1H/JUNQSeHqd3nSCxs/4uEaFL5LltyCoSk5RatvmGesouG?=
 =?us-ascii?Q?uGjZSjw8r1Le3j3Zrh+wGbCaueiGdqChzhEgxWiKyo1cJzE0fYj56aIOyG5U?=
 =?us-ascii?Q?rZ+BTEoyRq44eDAX9A+uHSKCu/P3pRKXG3AcGoXhZXRjpfBZoEzSK7Xv9mtb?=
 =?us-ascii?Q?JoqJsWuHo5SnpKG/3S9MSX5yNdDazHSUyJQNdT47oRSSTGAjSVp56ipS5T07?=
 =?us-ascii?Q?+lYmiRYdSYnj0oNmisrlPBvPMb61uCSwp8tVhIhzSgT2pnE/GqDLd+SPbuA2?=
 =?us-ascii?Q?WL2lm5kNZIBDrFQqaHYxPAdrjh2bqqp4LMKK2JAYvEPPwdHUjjrEOpo0/9Fl?=
 =?us-ascii?Q?WQ8d4sRl6eTgiYc3maAZYPJmSdKYF5KkpG/zoCyh2bqK0hzT59yCS1DSFoeA?=
 =?us-ascii?Q?lWrkWiV/BN4SrmS3mRC4eXp3Bczo8B/kHtbvjeBA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3c8680-f2a8-4ebc-b288-08dcafe4b801
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 15:40:05.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biHC82Z36VT7r3PGgmj7J+D7OT1SLOgLtJb7hOpPAaj6pPy7MpJbtRS8INkiRz5NVb6UdpgKP4hzHP2SbZ5IUV6z4p20hgxqePIbG66ZPms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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
From: Roper, Matthew D <matthew.d.roper@intel.com>=20
Sent: Friday, July 26, 2024 2:29 PM
To: Mishra, Pallavi <pallavi.mishra@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_store: Modify test for Priority Me=
m Read feature

On Thu, Jul 25, 2024 at 01:10:06AM +0530, Pallavi Mishra wrote:
> Now that KMD supports Priority Mem Read feature, care needs to be=20
> taken to avoid RAW hazards which may get introduced due to unordered=20
> read and writes. Inorder to prevent this insert MI_MEM_FENCE which=20
> will ensure data coherency in such scenarios.
>=20
> KMD patch to enable Priority Mem Read:
> https://patchwork.freedesktop.org/series/134038/
>=20
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  include/intel_gpu_commands.h | 2 ++
>  tests/intel/xe_exec_store.c  | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/include/intel_gpu_commands.h=20
> b/include/intel_gpu_commands.h index fe734c4bb..cd281ba89 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -89,6 +89,7 @@
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_A	(7 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_B	(8 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_C	(9 << 8)
> +#define   MI_MEM_FENCE		MI_INSTR(0x09, 0)
>  #define MI_SEMAPHORE_MBOX	MI_INSTR(0x16, 1) /* gen6, gen7 */
>  #define   MI_SEMAPHORE_GLOBAL_GTT    (1<<22)
>  #define   MI_SEMAPHORE_UPDATE	    (1<<21)
> @@ -192,6 +193,7 @@
>  #define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
>  #define IS_MI_LRI_CMD(x)	(MI_OPCODE(x) =3D=3D MI_OPCODE(MI_INSTR(0x22, 0=
)))
>  #define MI_LRI_LEN(x)		(((x) & 0xff) + 1)
> +#define MI_WRITE_FENCE			(3 << 0)
> =20
>  /*
>   * 3D instructions used by the kernel diff --git=20
> a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c index=20
> c872c22d5..fb99e53b7 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -63,6 +63,7 @@ static void cond_batch(struct data *data, uint64_t addr=
, int value)
>  	data->batch[b++] =3D MI_ATOMIC | MI_ATOMIC_INC;
>  	data->batch[b++] =3D sdi_addr;
>  	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D MI_MEM_FENCE | MI_WRITE_FENCE;

Does this need to be conditional?  I don't think the MI_MEM_FENCE instructi=
on existed before PVC, so I'm not sure what will happen if the test execute=
s this opcode on an older platform.

Will add a platform check here.

Thanks,
Pallavi


Matt

>  	data->batch[b++] =3D MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | =
5 << 12 | 2;
>  	data->batch[b++] =3D value;
>  	data->batch[b++] =3D sdi_addr;
> --
> 2.25.1
>=20

--=20
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
