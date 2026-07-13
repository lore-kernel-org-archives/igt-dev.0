Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE79CC44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ACB10E56A;
	Mon, 13 Jul 2026 09:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxUxX1qW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C210E56A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783934829; x=1815470829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FDSAl9HXJwyEhSe29wPH6sJmOL69c9R53XiwnNVixz8=;
 b=HxUxX1qWU6/p+DDMb2fufs2+Ed2eX9QixlwgPKo45lWgtmlthuq2ljB4
 f1ftrtPb4+4m/gMAPPmTPgznuvFwUakSPab63uQI0Ea1+n7OPH5lm6N5K
 OrtLyZ3B24dlzx6cOl+GtYcgC25PFgwvh0UC9hwkE625izcsiDsZFTXH2
 K2uKtZMParBizbgBs8j11FvLsbrLI3aXGypLH/mYnQ0AaUqab+idpCj1y
 ZuduvwL90oiRTLMnW4RYTO/ap34ekKrDqNx46xvCK9CD4Pj/RA/UDrzn8
 C8gVAH7u5iEHUiADvcc2MJRAvzkN0Y7kOX4+2Xa7j6qcUyq3GZ2I+qq2O g==;
X-CSE-ConnectionGUID: SPOMSgs3R1SCauHJ3lTPaQ==
X-CSE-MsgGUID: MMBRKVCbR3CBipa0vFgDnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83655602"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83655602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:27:09 -0700
X-CSE-ConnectionGUID: 1eAcxjnpTBaarKWPpHOekw==
X-CSE-MsgGUID: I0GeS02xSVq99soZYwA4MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255576482"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:27:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 02:27:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 02:27:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 02:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/Qf5KH7/RrRl5MQtKd+osXcp1+Tvl3AsMa8Gcek8lV/SfUPaerWa/dc1GZz4z9uU+PlyDepxVFD/7u2SEyAuGwzvd7G8uc9hYhkIfdd0ndzKgl+g3gYYifqoZnJM5EHVo76m5dK8nIgsc1Y7EKwoAMvy2c/rlAuIl8HBKtQN0/+2S9V6KXOOc7O7HsFS/MHsHDOnkg1Qyg9HPh+6ErLy9xUG88aUfzDcFWIDCLMA0DKV3tUF7+VleUYfOKJ2ZY9Ej0xjMPEL+NRCLgcgKrH9MgwgTCwFREYbUliJvXj1ptDapaRXftTgGKJurTk8FEoKfFhWqd2WztgucYvGYInvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDSAl9HXJwyEhSe29wPH6sJmOL69c9R53XiwnNVixz8=;
 b=n1AxY0pAkFFeqdbFaVY0yLf19Dg9EGV4aChJtwJ1+/3YN3S3lMjbUg6KCEeIX2oK2bJKbp5eLXIuZGBYquUE7msKdzgMI+yg6EbVm2DgPYTRGnNjjIAzcuxfsygmsChvCUfegsTaM3acazZNRQOeQqw54yPAicFWUP6wGOJzBYHLSP2SZJdzoJ1SucQ7nvMPORctX7zA+qSYWnLI7S/I6hxtNQTnq92s8noLMcUk2rVNSvcUyzZGmF1qxogVokM3hG+oz9iKCchb9kOGj4Y6B+LlRaIvm4WvATK8qiambyASrTPuftGkju17qMzprHrjtfyElKeuCczwO3UM3GmnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by PH3PPF9E162731D.namprd11.prod.outlook.com (2603:10b6:518:1::d3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 13 Jul
 2026 09:27:05 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 09:27:05 +0000
Date: Mon, 13 Jul 2026 11:26:49 +0200
From: Jan Maslak <jan.maslak@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] lib/rendercopy: Convert pipeline emit commands to
 genxml
Message-ID: <alSvWQGtgJAYsEfS@ART-DEV-395>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
 <20260622035106.3023047-10-jan.maslak@intel.com>
 <jqde5hdoyqor6snkirq3xgs3itsrceiqumjprsvgf4qre5k4fu@dr6gzlzobn3k>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jqde5hdoyqor6snkirq3xgs3itsrceiqumjprsvgf4qre5k4fu@dr6gzlzobn3k>
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|PH3PPF9E162731D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0560070b-f312-4a5c-c853-08dee0c0e70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: yiFLBbB1ZkKRuBVTBnPhV2ydR9dQNVZerj0SZDtLNSS7pkd/DHFkUhIf0w09RiIGYd8q1DKQbaWCvJ4P18sL+K+/9F3yh9qAOOihOp6H93LquM4y5SwBWtknLLahaS30oKUhHzO1UBZfa6cLVU40Ge7ci8UfvQZN8xRi3DKYIbwvnwi/dlLkwy8h3eowg9Q8auGBd9fgcSy4VAC/AlJtmaWcy8KQsdTUcD1DQ+6TnNaHU8dWW3V9DuD9u9gJp/GrKTurXrI0XChqpeVo/vMoobdqG7ZE6s4FlmnEClSa6bb1jkqV9O2HbxiFCNEEFF1Q/0FccNaAX41BAEFRL2of/UctjWHb/4Yw1FoYbg35vW3BW7A0aXF/DhRFKTzYWuHmK8zzxWwYImOjRzgzBUqsgjCRHd1D81KSS9huQUHbg96wRNHeKGGmOkYLfbqW2uhCnFAzBiCywtOrtwflrSwTuxLevp/uCwRSROnCera6ja6OKtgqtHb9BEhar/34WAanpcmP9dwEctkmym8WQGJd38bBvML/cV1ChbC0xgmfRJl40w00y8tyEae/0PMIR4gmuj9ByfGL26cNAtELtUXDCncocuFp8VfTfexVr6hGnIqysCTB46cZ8D7vOnBLkMqIHNZgETzs/hcSDrfBXkkn7jRCKNxxb9H50TMmFLAbQL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CzfoJSdOi0man8wlV05TSOwD5bd2xyv5pTOHPGKrOEhzSw/Sst6A6o6f8BBV?=
 =?us-ascii?Q?NNHMG3Vp8WrBJ4+l9Q1SNIApxExXo7iZM1AiDEUqT9m2cTEA831Rk7kMxTMM?=
 =?us-ascii?Q?Js533W5741U1xKMPREgUp7z6Fbgd0feJCt4qguEmEmN2mJupGg2HCv05YNF6?=
 =?us-ascii?Q?yTSksQMXiC6QL1s0OAenoEdPJ1nxeqBQ8qi2Z6uR3RD8IxkpW4QT5DnFRnTZ?=
 =?us-ascii?Q?OTW4GYwYYAs4bYbbzZN7SMtHnr15Q8fyLpDB8eBEd9ZghiZMJhvfw4jvhdIa?=
 =?us-ascii?Q?SEocimGIHaobAPlFRXWLz/d1z6s+HZ/1NK8cO/Ya4a+mUgt3iRnOUvLvRGt3?=
 =?us-ascii?Q?FZVyv3wC9QjAN9EAZI7MAu1/Roii683BgIGxFm05INn4i51x+RTUaDekuj9K?=
 =?us-ascii?Q?d+st6IS8yTJUo7WzH5VufBgZOsWUm6qbtWa21wQ0JcwM5DdfefzcVMtH8T4d?=
 =?us-ascii?Q?nV+pozoybOYfsnuFmPk6Ef8YgC3+mTcxfnMuDUz65/MY0KhvKmJJTBkOxO+E?=
 =?us-ascii?Q?/t0ZijXQZF/0PrSR8H5YB4qiPFPzvZoosAcspJRScfW9BHSc85B5TiqUARSD?=
 =?us-ascii?Q?9mId/poS6XoMkG942t1GsmSX2OW4pk74dYFiJ/dSiYkI7ygu4rf30uGo0v1w?=
 =?us-ascii?Q?Z1IWleMss37nObhTJd9+zEB4/RRY30OMlLgGfyEM8N5TQrXqlSoQCQWu3dmu?=
 =?us-ascii?Q?2ggwXkElLoRQ77LWem+d0GDzJJ1RNd84nFFoK5fsMadp47zSdLZnNT2EDTYs?=
 =?us-ascii?Q?phQsfhpPPtlnCDBX7UIcTqqhb0mPfFLLJtUu4TGf3cp76uOxGJny1BygTgLw?=
 =?us-ascii?Q?W8EVrZeMy8tZK/bbeEA7h1nSkH6JVarx7fFCjcc21aQmpZ2Z8ZdKSiWGeEm9?=
 =?us-ascii?Q?waqgCsPRW/LJ/V93QfO0KjoJDJT3pbLxSx9t3qajrb4CmfRWUZ9FDNg/oRnb?=
 =?us-ascii?Q?vKtSMTg89p7GjrhEg4KTgtjQClDMLv0N1DzfNSQ1JpRnj4mf53dnA/BAIlqE?=
 =?us-ascii?Q?vLO4QQ+mDELLFIkCS6+YZQgrzTWR8AYbMRZ+9PV02CsJOqOjSImWVd4S++ne?=
 =?us-ascii?Q?0BwYC7qFo3yLRftN3nt0S1aXX+Pd32V7zhgiHnbvoQ2yGo3GlpeVQecRrtoi?=
 =?us-ascii?Q?laCCpn33eSdQQx9PpCTdddepTT9lcd8LJAdLCpGgiKsyUPyTO3NDGGvIc93a?=
 =?us-ascii?Q?c7zgQo2uIIyIMT8oA9LPKPDAiQBdzjsLombAdxUPty4xcUDBVKBeDlHrf1g6?=
 =?us-ascii?Q?xQ63obN1QCNCcmP3ekWziU9LVFc2tKkOcyoLeO2Z7Te++sHq0HK9XtjCMB4Q?=
 =?us-ascii?Q?LDtlfS2xwq5zyN26t0KBPkJ06TCce5Avbf8OFBSBQ3kDH1lLca/OerC+CVJB?=
 =?us-ascii?Q?GpzjFOx2WIKFvWpWotTDi6v8Pf3WQfRjOC5R5CGjf0rIdGd32VwXTJZWVvxM?=
 =?us-ascii?Q?RisLxXzijZDnUi9CZJdePv3VJYSMRSo5AJofkSwM/jkNgPunS4ssa37z8epz?=
 =?us-ascii?Q?pyn9gwmeOOoEyVIDD91lMDSeIls2mcrbBmyC2bhcHDgmogxbszD+fmTp8UfW?=
 =?us-ascii?Q?YIcFMtuvrQ5jnUl0nPyOZbQYIXCZX/XAnzzcU0BERWpF6baQw8141KVFM21Y?=
 =?us-ascii?Q?RZ373E7WzkbsRfVEElRaITzf6jQnbyo28VrJrDSx2sSZ6bDsjzlcdsTSn3i8?=
 =?us-ascii?Q?taksKo0sZoaa3VFZj+41PRuQciIpD/NCKzbx4FLwCL+vijTv8LPHtxqSb3Mf?=
 =?us-ascii?Q?OyZi+eNbTQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: XmW1tj2QYvwQd1310cLkFeuWkL7y5HMXcy61grVHx4dMAhgBSEYjUjA27Ai3LJJFFKrPvMWXihckGZZeH9Ss8JEus+l8Z8Qw/9LUfNCgYiFMqhObikVbv23Y/RUIcBKEmPKuJOfm9R4qB30areH+B0An6yAMkssc0TucW8kvlEIUAXk/Kaisa9IRizKIYesYkAHK/ARCLjuQ1SJM17LmAWnnvLiY/ChBHtK8TUiB2ZuwJVu6CMJym8ubk+U6fBl/KOryL98DMoor6YhUFb9dZ+h7XhBYItET+EvaF65MtBrB+IrgNJGz51cve8dBRogMfkuxsN3W+vvTjqPnwkbcBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0560070b-f312-4a5c-c853-08dee0c0e70e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 09:27:05.0031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CubUt5g92AhLPwT3EEDWpeHWO2aAxV6OVBS9IPevrecDVkExk8vHGyKCzh10eKK/pOB5iT3aUjzyoxqhBosvqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9E162731D
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

> There's only one nit I got for this patch. Why HAS_4TILE() is necessary
> and > 12 is not enough? Have CI complained without this before?

Both plain Gen12 LP (TGL/ADL/DG1) and Gen12.5 (DG2/ATS-M/MTL) return intel_gen() == 12.
Gen12 LP wants GFX11 STATE_BASE_ADDRESS, while Gen12.5 platforms want GFX125.
We need to differentiate between the two, and HAS_4TILE() is a way to do that.

Pre-genxml code also used this logic for differentiation so I kept it for consistency.
No CI failures were tied to it either way.

--
Jan
