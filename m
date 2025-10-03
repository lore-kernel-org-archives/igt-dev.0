Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DB9CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 09:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E6210E0D2;
	Fri,  3 Oct 2025 09:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxSasent";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C9210E0D2
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759483069; x=1791019069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tRUckugmXH1TbheMcAqUTq45HJ2R04H97YYZqG/0N20=;
 b=SxSasentlh8oFrDFztxZV5WiTVQpNoJ6QmHeD3Ba5BtwI24vm0t8CQVj
 x4AT/g9LUZwxDOfEQYRNpeS9pEHUvfaZ+0ogNrOo7tS4DtVe/L7w1vZVH
 OAOJxWVyKZ0dUgeiCEw7nVnPVaiSVLShROQ7Nun4ornNWZg6FQskof4Rk
 2dHWfjWeZah40tdPT4C6I4M1FzazDdKkcTXO4saI3spNKmMWPLy434xhm
 9pxxnMfEZCRotc/Ayudk2Bg3p8vlmI8S4MXWVMNr5cdyL+zyqO1PD/ykF
 xIbjeq0NTQQMNEfGIjFKX8L6yxiV/bmLmq9RUJz17RxpuScRlHy3bXgJx w==;
X-CSE-ConnectionGUID: M8853OH7TMi0PqsF7/o/pA==
X-CSE-MsgGUID: 7v144T1jS6+HdH3BZgtpmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73117735"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="73117735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 02:17:48 -0700
X-CSE-ConnectionGUID: 99nnS073RcKpiBwk8KQ8MQ==
X-CSE-MsgGUID: 8bwkz+ztQ3qVlMSjN6XG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178376510"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 02:17:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 02:17:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 02:17:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 02:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXN6U734AzZz4+kOi63hbiuShJpMpGF6kfuVEDm+Z6s1isqPRJgmk2zE+ZtD6DC1H3TldqAd4VYPo79SLlKOaiTHgjGheQobyFFgagktFNKOpnm5wMtzkrGx8DBvptMdkoIGyQlTbEE/madfsIZCfmbGt7cu6GLXFTMv4MOdmgheY4wHoGJypSBCfpsY/MMw1IA60hHP17ZwWkgDiLZ9opcfOhKXntPVTIDARndzH+RvD3zBW8FBxTWEjx/XG64fisPNx+IhEfMk2FnCVP+0okzSIYNUB0rVxX4WZL5fohrp3Tk14lJRi/qlA+WzbWce+nV6XW1fXI2Iz6avvwz46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29m+kXtD5pNC+cV7nW7kpxlzLaVloHqzi/BqA7nW7cY=;
 b=OALdpOmgbWDkRgclw7daeyXeT1+/IQDaSRRmtwKeWAoKUu8/O/urEnqOYDYr5qQ6rcQGbnqFnRFcp74nrJ9vuXeYE3ntBt1Xa0XjcElmJ38vlGMkPzVATiXdpb8rR4Zu1EWdNFRUBjSSxgankPRqWUqn/IBKhovpdso/2I2iF/Vd6AbaVnB3+ky9oaH6s6/nUPxwH4/hOso+AXW0RZnBw4YfMVv6+OXVBwVY9ZOcsgs1hZkuSM8bsbH0df2h7fyTs+7KAOjVNoxJF3oXvAkzRmgnBw4asg4q732v7KBiD9s+l7h+Us1S5jlUZOXSe1RYa/AYXnBZPLEprLxePJZ7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS7PR11MB8782.namprd11.prod.outlook.com (2603:10b6:8:253::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Fri, 3 Oct 2025 09:17:42 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 09:17:42 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Index: AQHcNDTuOLaux4gdAUeNn6AyOLwFvbSwCmDQgAAZtLA=
Date: Fri, 3 Oct 2025 09:17:42 +0000
Message-ID: <DM4PR11MB6312BC7FFC3FCB4E65CDAD8990E4A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251003070747.566921-1-santhosh.reddy.guddati@intel.com>
 <DM4PR11MB6312433659EC563FE7435BF990E4A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312433659EC563FE7435BF990E4A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS7PR11MB8782:EE_
x-ms-office365-filtering-correlation-id: 15ee4a75-ceb0-429d-4ba3-08de025db533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VeWt7ufCD1dIZBniDXyl/rdk99w+NFdkirz7r4MKqBWIp3joxa/pxaQ/Opeq?=
 =?us-ascii?Q?6J8s+bRYixuHv9EGKHpNmxupUUmjgQSWcr1sPfYxG6QP3Rrh6ns3uks8GaiH?=
 =?us-ascii?Q?rO/uW3GI+ETG2BdRy5pGj/VoAulEtAGzQTmmYbvywRVKdjBL16zM8VgD6k2U?=
 =?us-ascii?Q?JTfjJNB6upwAWbRbV3pQA5LOc4rWU0itAFiJLxvh87YvAu35BbslLgJECyro?=
 =?us-ascii?Q?QUTyalCLAdcucelzzOU3BZ18OLFURXMiou48TPGMzF+NqCeX3DNqRP60m3C2?=
 =?us-ascii?Q?p31qno+/ZlsBQmevtyZifVMztWzloxKzpuFx/FZSAty+Gj4WxQKJV2S5cziK?=
 =?us-ascii?Q?Fq5ygHk4pY3bACGun2URqvZdpIrXmUATDlXCvRV5bzpad2BUQ9NRy8giGOYm?=
 =?us-ascii?Q?8SMswtK2A18yLA+4cXd/tsuCVJpy2T2uO3nL22/AzvMyAxSNKMF5ORJjKLA3?=
 =?us-ascii?Q?eGzKLhwbh/0LcPUNt0u/Lgrq7s1NZt5KCYN/ruRagvWNSQRZqm/FFVz4IJk8?=
 =?us-ascii?Q?9+kvJ+899jYLQdGuNyu1UvL6JxYZtZt82hrULk/ieWHfSmqdUqbUTsQuUGQ1?=
 =?us-ascii?Q?t3YJAzKZQnKHI4zfWcDHfXLo/4hrdusKxl9+a4deAL5Evna2z0L5BCoBLZu7?=
 =?us-ascii?Q?qcblazq7ABzZ1uiJoCu+e2Kzzn4LlPJK0MEzoNCmh49c/2utKgDjfV6XTbim?=
 =?us-ascii?Q?QFArEXC3tl+L1ULH3nXa2w1mWtzFDfUOkP0+yQHLjxGZ2Ps6zG/PJ3fYQHTD?=
 =?us-ascii?Q?Bsh1uh8J4hUe/sahVMzKglnOOhJCPLnuDwM/IeI3Djoz9wGLa8iP9222jaeF?=
 =?us-ascii?Q?BOqyEnAers4PsSJPInvCwWUhbolAC2q/tpNDMskvDNtctapJxcvku5QdWAdB?=
 =?us-ascii?Q?8ICYus/xNBH7Pd7IX0ERo3O5vPjuzye+I5qX+MMEbr/+enBcD2lbcky6lhuO?=
 =?us-ascii?Q?EFZOsk+4ROcpZYin2r62MvzDLby2db+Tf/69utXrCqnCmYrRqHjQv8PHw2E+?=
 =?us-ascii?Q?ZUog6lkqnlreOiz00bUl6R1/TIsirZDZOfv4+/29gREqZaYjUeBnOJFbX/eL?=
 =?us-ascii?Q?IJjuFoAghgop+cUqkJ+XPMQAGvVPRkEUOaNpcFFzCUcQbgW/CPvsL6JjFDLe?=
 =?us-ascii?Q?C5tCsG+nM/CtEWMvP3WTSlPoaxpQH40BXkxNONqzS3rnqE1bPER21C0sMaYx?=
 =?us-ascii?Q?xgyqSmsclabxvOzwJqcI1JdY1tmdGY+MHvNmNUFxry9HLnzKLakjuiQaKjCg?=
 =?us-ascii?Q?/ZabhO2+RTdBod+CLBINH6hipvk/hKV1EI6XVqR/UyefKYBNFSJzvGjgd5ur?=
 =?us-ascii?Q?x7ndCRGt0+WfNvlkJLQYrlzgb9PyeD3bvsDzknbCRAZqNg7XpBqdmXK517XB?=
 =?us-ascii?Q?iRzsuB+xlVODUT6cQQNcCQUfVx68aQdAIxBqDJnlzqW0jYpRT4sxZ8+klOBI?=
 =?us-ascii?Q?7ZFcuhOt9svJthV+tBJBPjZ0uRWRv+k3SMwamGuUNIFO++GhbNZXLg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vFdc2Z/MlvanB71RtO2770siTptz0d51s4XIGeSpFYsoFVT2FzTUOCo/gO9a?=
 =?us-ascii?Q?3UWOf9GE7xjjTArK6g/Y+xyvFdXi6SCA5AeeFy1BMPBZERhQ6MSWSH6q5jCS?=
 =?us-ascii?Q?l/3XpIY/oI4MrGIb+i1sZIU3CNHbGqdnUqYi8VfbaL9wHLkG2BmUdIEqWJov?=
 =?us-ascii?Q?jMMaGvqmc9vZpdVgTDliSh8jO70OyJ4PlWdFWjfhvLCjwgHZh9FsqbzIhaUZ?=
 =?us-ascii?Q?EHeoS5C4wxy+LIYYAqhmEFFzkje5FM4W0YzWQNs8M7SGkTH2tfK1M9emrT14?=
 =?us-ascii?Q?wfS14ktzqKLtms+U9DBRbwVa5WUQ/3hqh8LTWGI3d85zJMLvePnCgB65f7+S?=
 =?us-ascii?Q?VKMtSqc/NpAo9UevLyQEG/F+lMKHlJZ9o8qeDjbcFhyyUpw2vnPcUdOnxDhv?=
 =?us-ascii?Q?bNlipooUfTrldL3lIpaJf2GqYP8FFO6dJUk2KN4/yUcUY2T3PXeS+bCp+4KI?=
 =?us-ascii?Q?LJkvbruE5kG/CCsGry/ez2cPTKv0Qy90gOl1msN1CFTmqghWQtkRnU+9ub81?=
 =?us-ascii?Q?2jgF7QqSu9Oo25muRlyG+ofbsRetHt2k6EygcBHP6gkzsmyl+GUGfhANU+vc?=
 =?us-ascii?Q?XyABv6kaeWpSBBWxySURteuryLNoed3bVvASiFlzNJQ2bmFOCUgGODn8JUXe?=
 =?us-ascii?Q?F/iMyNVoC/r75UBvy5drQzMqa/pp9xE1Tk8h5fiF3sSkweV6UPJI+A6SkG0o?=
 =?us-ascii?Q?eQfqbCbUFiWGOzKKHj63LJqjEYWx9lfcth6K1i5iRm5IDPaVwH7ntjLltxMr?=
 =?us-ascii?Q?JkSO80JPNie50nIZAOu9MTKnH0JLgWeR5aJlE6Tf77lWNRAxS2dKB6QD7Sln?=
 =?us-ascii?Q?YTIFQNRWoqeEg7RjH7dkcyKFrn7vwxu7SApGx2c7MruFAbdPCFHdOMWQ2p00?=
 =?us-ascii?Q?Rt02mDbYlcqhggINsPrLoRJ0utvx8goryobpnX124qf7BpnMMi/kWaLHm3fJ?=
 =?us-ascii?Q?fmb9//ocJos2uqrGvQMxrB8c0s+FSqH5jEULDPEEzlrDLk8WlbEFHzoksboJ?=
 =?us-ascii?Q?pSg+sJ+VkeVoUQEHB8xwCCtxviIlQWhgZCqvuG4VETumEP7clXtYk6THm+7I?=
 =?us-ascii?Q?8WKD9HEHFQWLKFQSTFYapvXHCQRy7N/pL7L2Nv9FaG+s1HtkozvIXvrylSt6?=
 =?us-ascii?Q?xszkAjosRXEu975Tqy9SlxstUAcnTBBZ7QsPhJ4leDvVxWI1WZL6dZFmHrDk?=
 =?us-ascii?Q?ABd8ns1TWU3IwpePn4VlGRkr0CM9Qe4hzFgpcdBEDjUFB2zOQzbKykopkDWp?=
 =?us-ascii?Q?TdfytuMqNA9mbGUZr/3gOui8H8DaGTpNtotJ0MTYR75fgLxf6X+TSa31T/sh?=
 =?us-ascii?Q?BboqvgteC0Sdp/Nr7kbaonkv0cnvFpELvwWdgQM3L6pcpnCCnsJ04gOH4XAZ?=
 =?us-ascii?Q?lyYJnmEUP4a/wZCW/RY3zFAv1yrA5ab7i8ro1YZVmbKdFn82StF7qsFidDJZ?=
 =?us-ascii?Q?dwJFaGGSUGjB6RWdG81Lq4EXUvyI5OwBQeqsHzSyd1XsQv0Eh6pi3WTBxXL/?=
 =?us-ascii?Q?leiG8zTXsYTwZnfEhH1pGtuJGVps40gVRN1HGjOX+bNQ80YD5IHLadrFC/0j?=
 =?us-ascii?Q?ZEezCgyx3y7uoZRitnk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ee4a75-ceb0-429d-4ba3-08de025db533
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 09:17:42.8067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0UHT8/Tk0LJgPWsTk1wNO9p922aPNWIVLubTZjR0yppDLchUEXx+khYWYO3VH5JI31TZ6pQe3bKDkKAj3o3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8782
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

PFA for dmesg from older execution. https://jira.devtools.intel.com/secure/=
attachment/5596348/5596348_dmesg_ptl3_with_tcss_display.log

[   81.907010] xe 0000:00:02.0: [drm:intel_bios_init [xe]] Port A VBT info:=
 CRT:0 DVI:0 HDMI:0 DP:1 eDP:1 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0 DSC=
:0
[   81.907104] xe 0000:00:02.0: [drm:intel_bios_init [xe]] Port B VBT info:=
 CRT:0 DVI:0 HDMI:0 DP:1 eDP:1 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0 DSC=
:0
[   81.907197] xe 0000:00:02.0: [drm:intel_bios_init [xe]] Port E VBT info:=
 CRT:0 DVI:1 HDMI:1 DP:0 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0 DSC=
:0
[   81.907287] xe 0000:00:02.0: [drm:intel_bios_init [xe]] Port F VBT info:=
 CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:1 TBT:1 DSC=
:0
[   81.907379] xe 0000:00:02.0: [drm:intel_bios_init [xe]] Port G VBT info:=
 CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:1 TBT:1 DSC=
:0



> -----Original Message-----
> From: B, Jeevan
> Sent: Friday, October 3, 2025 1:15 PM
> To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
> cursor check on simulation
>=20
> > -----Original Message-----
> > From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> > Sent: Friday, October 3, 2025 12:38 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Sharma,
> > Swati2 <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> > Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
> > cursor check on simulation
> >
> > Skip fbc_check_cursor_blinking on simulation as it involves CRC
> > operations which may cause hangs or false negatives during test executi=
on.
> >
> > Signed-off-by: Santhosh Reddy Guddati
> > <santhosh.reddy.guddati@intel.com>
> > ---
> >  tests/intel/kms_fbcon_fbt.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> > index
> > f3843cdb0..7ba31cd86 100644
> > --- a/tests/intel/kms_fbcon_fbt.c
> > +++ b/tests/intel/kms_fbcon_fbt.c
> > @@ -149,6 +149,14 @@ static bool fbc_check_cursor_blinking(struct
> > drm_info *drm)
> >  	bool ret;
> >  	int i, pipe;
> >
> > +	/*
> > +	 * Skip cursor blinking check when running in simulation mode.
> > +	 * CRC operations are significantly slower in simulation,
> > +	 * so CRC checks are avoided to prevent false negatives.
> > +	 */
> > +	if (igt_run_in_simulation())
> > +		return true;
> > +
> Can we just do this before even calling this fbc_check_cursor_blinking fu=
nction
> ?
>=20
> if (intel_gen(intel_get_drm_devid(drm->fd)) >=3D 9) {
> 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
> 			return false;
>=20
>  +		if (igt_run_in_simulation())
>  +			return true;
>=20
> 		return fbc_check_cursor_blinking(drm);
> >  	pipe =3D kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
> >  	pipe_crc =3D igt_pipe_crc_new(drm->fd, pipe,
> > IGT_PIPE_CRC_SOURCE_AUTO);
> >
> > --
> > 2.34.1

