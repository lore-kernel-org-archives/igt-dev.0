Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9492E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 03:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE2F10E046;
	Thu, 19 Dec 2024 03:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBUs8aUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4015510E046
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 03:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734580624; x=1766116624;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9asjc1Oc0US/FxKCVGI5e64DjaNnTUZDGAlPtQ7bDmA=;
 b=RBUs8aUX+7vTjjd2gpVshBfFCEBt0VIKVQTrrs/TWke0rPtydtl0j1qO
 xqnrXe7IkEZEXtYgVwM8h5wWRSWdPVJjQ3ADg137iUR7WpYEZFKWYuv9X
 UbbxLpD3rXRPPbO/Cq2I+wJ8aiARY2XhLVtyEepIH6xNzPIx4LiL4L2Ip
 SkrN2xckKhv3InnntE8xhXrdsT0rjaS7z3jNy8nrY8Fri3zEVUIk1XoHG
 K/VMOU3L5WnB99j0SQ3aIgE9xErUer+VufO47G7hNDV0prSo/XkfIQpfK
 6ghGxGZ6vC8l9cmpRXvefU2wjuxapIoCDHcxRwRxVLcOHCqi7rQzxAcaF w==;
X-CSE-ConnectionGUID: j0LbEQPITS+nC0B8bT+xPA==
X-CSE-MsgGUID: 1/QGsI7/Rji8U58ZEtTbZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52602997"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="52602997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:56:51 -0800
X-CSE-ConnectionGUID: Qo/juoNMTzOyo4f77jlS9w==
X-CSE-MsgGUID: 9GhGBsHaQX2OlU2bX0nQ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121336040"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 19:56:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 19:56:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 19:56:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 19:56:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWGtd8nCgu0h4nnSOW5VQggPC3O0FUe9j4MS9WbjeHikSWy07eOXzYSgpsJC8rBu7LNz6Cd+auOnUW2yeEUCjVkuQHXt2GI2gzDEbIYFJJirKKDn2XYEzug3xEWz+/G6L5/Gg91GmPPtP3Y0fgHkmiFwexjUAXv0FQHkEs7idt3Sej0HZPUvNsfKtYUQvVRCX9kVeb01ng1EC6zrupv7vVWYjgdhkQvDty5JuvfFI41Fs1Punf1MyIubWSaUoHeBxPo5W6N5VrYoZPcSEBxeVSE6c2xT3i3fJUJdczXGU1iLlYQNl+SgVm12TMVfmnYl5TWHXwlsZccH/TufIq3m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlZUWEUUU+MdS0dQcWiPEGe3RG99Irho3iEB6rNGvDc=;
 b=waUEqnsiXSaE6vmK45ehnbIE5eLgWe/SGbaR61w4V4GN4FXNdmCOrtz9cPfCTW2KJPSKfdgu1chtZLge3MF4kQ5jNkJUEApVDgB76FGCBIyG16Aym7i0LtxIsQIcUV8AwGIxZPhrQeHG9/C4MLgLIx7m0He0oVnNLyScrD8WO18HBD3nZfRSzmCu9jYVgu0YSCLdmr7xtwRY5wJOtJ/ezxKlnW8+G/Jwy4wcQSqFg1cJgfP0pk+vvScKSN0c4oTbB9UrAzsyGtOkUGCVG0s8tGqlk5SUra3zsgFp/OsTURU8cy0bMgB8Cz+7ptJ17HPEWF+v3pgB50DVnCkmTH7oZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Thu, 19 Dec
 2024 03:56:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 03:56:19 +0000
Date: Wed, 18 Dec 2024 19:57:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Message-ID: <Z2OZj5P6p1oQW/2e@lstrano-desk.jf.intel.com>
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
 <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
 <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
 <BL1PR11MB55254606B8D1785DBE18402E84052@BL1PR11MB5525.namprd11.prod.outlook.com>
 <BL1PR11MB55258BBC7DA922DF4D9DCC8C84052@BL1PR11MB5525.namprd11.prod.outlook.com>
 <34038e2e-b9c0-4a87-be51-6f3619b35ba4@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <34038e2e-b9c0-4a87-be51-6f3619b35ba4@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: c43ef9c0-c9fb-40b0-c2b0-08dd1fe11805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iE30jhnzJzl2eX2EUXQhREKx4piVQRTOoi2R18SZuvgmIWlokZtaBa1et723?=
 =?us-ascii?Q?zec4dTRMzX6Dox12k2nBdMZAvpHUKfXXGf7jXWWUFeX2t0g4Ead68/Ufsac2?=
 =?us-ascii?Q?hEp7HilRN8QrOBJ6LiUX3Y5j7IyiNueL3GWB3+fy77xiaXeuv1IHwm9Fk6Rf?=
 =?us-ascii?Q?r2Zd1NS06n9uVTFMGVsoThRrGFpxqQnFnBjFHwEVE9soaktJ3b8VWEmuzs6l?=
 =?us-ascii?Q?ik67cnaT/LcC9TJeRgEIclEAS1YvQsbZ4tsOpwqmtuYVJvtzi01YLr4i/q3B?=
 =?us-ascii?Q?wRpGj1WlY6y7B+4/A+mIAozesXhWspZ3PlJWe7XQOvrpujK7kmFEmI+JFJMP?=
 =?us-ascii?Q?w9gAS8jWE1QzmBGH36xUHhgwMqQID8CKaFVvbIp2cLuD5dMrBUTi5URsqOc2?=
 =?us-ascii?Q?nKP6SxfeQfFXg+wiQQUqJZbYxZ6AoisxhNp6cOrAvryxtA78WoQqzmsGUPrs?=
 =?us-ascii?Q?lI0ifmnhEY+qJmBPeMqipJWYJN/uY2WbKlo4aOkrLuvjeOdgRUfHUDps2Lqw?=
 =?us-ascii?Q?QUudmASnDw2eBoRy47rCZ+ma8cE7ItK/SgWm62lyrkTxX03cdWzVV5vyp55b?=
 =?us-ascii?Q?Ai1O8Mef+eT+r6UcoIRRM/gdpLKufbt04g9q3lV+HGK1/z8gs0I5lI/fQwry?=
 =?us-ascii?Q?zri9dmR7O/SXMeUSpV9kORzFqmhZUgIGHOkBaAp/Hhr8TWBbCxS+yvpB9Tir?=
 =?us-ascii?Q?bVZJmDgZNmL5Jeeu1lgibwZNF4zqJQAzcp6sO/5bdCT+r1u8FYoNOCDOp3CW?=
 =?us-ascii?Q?rlRWSaEwamUvUGHFF2LD2gQdgfsPoew9+n+fFXMBmImFzN/cEqteCHDWNFoX?=
 =?us-ascii?Q?d/LYJg97WbIGV5Honk/m5Xp3ybTLz2ORglsoS0BccXNl8YY9ntBLX0ZpOmY/?=
 =?us-ascii?Q?fQGYaW97Uv5nRn16DmMh3yMI8NVHaasydRoqjdTlO2zlzZw2skrGJESctLaN?=
 =?us-ascii?Q?qzM4hD5w8N/xJQM+2t9FfxLBY9qWvBJ7Lh4akt79JNz6ryuz2yUnpUPAlRyj?=
 =?us-ascii?Q?EK5EVaGQkJwZMYRa5Bha1IvjNCpZTv3DDsZus6yk3R8XnhBukfuCLoOmsw2e?=
 =?us-ascii?Q?Eog6H95Lb5yYqfRgdhrkrJMDHhth520DudBOuuMEeosJg71977kky9FenypZ?=
 =?us-ascii?Q?kcvy+kqsY8NNnEw5EYPsAjS2JhUSYLLhtGbmfw8Ep3+r19O23Ae+x4UKI4fQ?=
 =?us-ascii?Q?lMZeeaG2cGr0cuPkNuyd3RYHZ0VDMjXYWwsrvFSoQ58CA1AKIihBqodiHClv?=
 =?us-ascii?Q?eLnbLbJq4ILhNs0kP8iZ/+X8ON7CglYgpyN1sN06d0pyDF4dV1xbR1u+Gg2l?=
 =?us-ascii?Q?kP60nTNiv0GEUeszDjfkuDWSvdzfeQhkzksIRKfKzM4mBdYutqyM+NFI4dj/?=
 =?us-ascii?Q?PRIMpnmQGgQCI+1TxHCv7Uk4ZMWL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QgEmd4F0AbJ3Yq0OV3X8U0SuWHsVZmIN3MOUDaC/8fe+W4jVQC25IRv2EDUU?=
 =?us-ascii?Q?ZxC7Z1RCOdZHlEeA7wQytl5zbHbpePBV4hOTL/tSIXzsL4lzLheI8fOhhe6s?=
 =?us-ascii?Q?MQLTueBItc+rgtN3DGwwQhxTZSLCdWzaN6Miibi8+QI0UwMMp6yQPZfYOO9c?=
 =?us-ascii?Q?+StPw71/CemeWne03IqrS02JQSak/iDLMlYHuwCeLvlcXuP+GUCpOqV9TU6Y?=
 =?us-ascii?Q?XB7jjhwkpHumLKpeIGZhzXflS384PU4Z1ZaAqQDSOikxVprtV/4iWp+6xrSL?=
 =?us-ascii?Q?HGYSnOtAQF39Sv+gVXfsSwoDBxgnipi6Q5rfyawV0+3heciFb0Ar58eTEGQ7?=
 =?us-ascii?Q?+vYJrqWc7IwTgSZP0u5LIDiuq4yygAMFtVPzXYQnBJERCcPnZ6MKGplKxpJF?=
 =?us-ascii?Q?urVXZRXUNhsi3ic3LSfwG/jG3+Z3FyLG2bcHsPXzlSXfdgNB0lFbXqw9sWyv?=
 =?us-ascii?Q?b5ccX7RXK+TzDnV6vtsvYI/xlF3oUXrnrWVo2da8EhxjUBQqQWxog5TK5H5I?=
 =?us-ascii?Q?DEIzIxXgVIRD0JRL0eGKQrXyLg8NmSbzzqJ8yjQMkwHXYZReETOZSR6tkuW6?=
 =?us-ascii?Q?zl8xxIZp8DHvfuWhNvFXPc2xRuriwPWaMGh5bgJudATYi2xwqCguSuFu95LX?=
 =?us-ascii?Q?HFDd28S2T1xA0Ujl7dxfaa05jbaT+XLg4V3RNqsdjHZGfQ8/nDIFlx3S+Etu?=
 =?us-ascii?Q?JDArhYvc8cKYzg89Lt5cfCd5kchvZkq6Av2xGwxtfDuRiiA48dU6PTF7jG+l?=
 =?us-ascii?Q?07DRQO794+pHfITOxIUybG9ece0LzB6tU2xS07HK584d+lwgBkuNnYjzHXoL?=
 =?us-ascii?Q?1m3BcBww722DVkFNdkqop5/0XPSmUYo0NK/38bkhzSLMF2FQ9jybzS/Zf7Sv?=
 =?us-ascii?Q?W+qVUXLlfLhq7HjlJqqqfcUaVEsC7OmuGPEi2ki+bH6StHmWb34hQUdnnGHr?=
 =?us-ascii?Q?Vn3spnw2JW0YppkYkDk8mZXP1/yIw6Q/SMhQVUJETSPso2aahKUBI5lWbG3S?=
 =?us-ascii?Q?LI+GIvT4NOwwklPL2ZPo+uwC/FdihHsMhUh6q2nZt/3aIoThmQJle5kZHvdB?=
 =?us-ascii?Q?zNH7dqy+iC3Mg8kMNh5od0anJpAr6aY/JwTS+cjCizAoqBSsNsX8eIdI8xyX?=
 =?us-ascii?Q?sPEwVSJIw9irOdIr2IW62i5nt6vSI/YqMxcULXKwBXoVXSVbG+R8Q4C8ZPTI?=
 =?us-ascii?Q?421CcuYVa3y5fP5k+9E3FsiGAGqVagLB5H0i3j96i5WiDngWHTVQGuoaJlhO?=
 =?us-ascii?Q?Ff9s5B38uCKRcJC/KiOtUIhVqdWwYU/5XOP/by+ICvGuHgqXp74tvHx/VMUr?=
 =?us-ascii?Q?w0VJgCqALYNY/KCo5MjMoabfFPmqFw7sTfME9qCgQKxzpT34PBMjSmjbHuU9?=
 =?us-ascii?Q?pHHEBxEZmIrFigBn2QoB24Gs/R8ziqGyXrxtxScOPAz3hmXKFMqagzn39a+R?=
 =?us-ascii?Q?bczYzGZKZXiThvskEPKy4MbqhDBAm8GKctNmXHbNTiNsqleSf4j73BgO8z+j?=
 =?us-ascii?Q?Tjfy/IUjVM0siIZ01x4RXg3nUgyc43upRp64yXD/GzeiPlOq1B3esjMQ9j61?=
 =?us-ascii?Q?eUYfaAMrxfZA2PsWWzf07NW3jQNLja95gotNJyyZNIVx5NsRCo6LwDz7uw6D?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c43ef9c0-c9fb-40b0-c2b0-08dd1fe11805
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 03:56:18.8980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VER9DS9npykFtUoNi2w57xM9sGpzWD3SRsqYPnt4a51b2Ooq2ch+ZgXhR6TAE/gJQZCDMGqLYCV2k7v0yPB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
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

On Wed, Dec 18, 2024 at 03:32:06PM +0100, Peter Senna Tschudin wrote:
> 
> 
> On 18.12.2024 12:57, Gurram, Pravalika wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Gurram, Pravalika
> >> Sent: Wednesday, December 18, 2024 3:42 PM
> >> To: Peter Senna Tschudin <peter.senna@linux.intel.com>; igt-
> >> dev@lists.freedesktop.org
> >> Subject: RE: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
> >> debugfs entries
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >>> Sent: Wednesday, December 18, 2024 3:07 PM
> >>> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> >>> dev@lists.freedesktop.org
> >>> Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to
> >>> check few debugfs entries
> >>>
> >>> Hi Pravalika,
> >>>
> >>> Two more cents.
> >>>
> >>> On 18.12.2024 09:56, Peter Senna Tschudin wrote:
> >>>> Hi Pravalika,
> >>>>
> >>>> Please see my comment below.
> >>>>
> >>>> On 17.12.2024 14:56, Pravalika Gurram wrote:
> >>>>> Read and dump  below debugfs entries.
> >>>>> ggtt
> >>>>> register-save-restore
> >>>>> workarounds
> >>>>> default_lrc_rcs
> >>>>> default_lrc_ccs
> >>>>> default_lrc_bcs
> >>>>> default_lrc_vcs
> >>>>> default_lrc_vecs
> >>>>> hwconfig"
> >>>>>
> >>>>> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> >>>>> ---
> >>>>>  tests/intel/xe_debugfs.c | 46
> >>>>> ++++++++++++++++++++++++++++++++++++++++
> >>>>>  1 file changed, 46 insertions(+)
> >>>>>
> >>>>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> >>>>> index 700575031..bcbb5036a 100644
> >>>>> --- a/tests/intel/xe_debugfs.c
> >>>>> +++ b/tests/intel/xe_debugfs.c
> >>>>> @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
> >>>>>  		"pat",
> >>>>>  		"mocs",
> >>>>>  //		"force_reset"
> >>>>> +		"ggtt",
> >>>>> +		"register-save-restore",
> >>>>> +		"workarounds",
> >>>>> +		"default_lrc_rcs",
> >>>>> +		"default_lrc_ccs",
> >>>>> +		"default_lrc_bcs",
> >>>>> +		"default_lrc_vcs",
> >>>>> +		"default_lrc_vecs",
> >>>>> +		"hwconfig"
> >>>>> +
> >>>
> >>> 1. Are we confident that these will always be present? I am asking because
> >>>    of the igt_assert() that will abort when an entry is not found.
> >>>

If the driver has loaded those entries will be present with the current
code base. ofc, debugfs entries are not uAPI so can change at anytime.
With that, the IGT needs to be changed in step with the KMD. It seems
fine to me to have a hard coded in table in an IGT asserting entries are
present.

Matt

> >> From kernel code point of view these debugfs need to be created on device
> >> boot up
> >>
> >> static const struct drm_info_list debugfs_list[] = {
> >>         {"hw_engines", .show = xe_gt_debugfs_simple_show, .data =
> >> hw_engines},
> >>         {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
> >> force_reset},
> >>         {"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data =
> >> force_reset_sync},
> >>         {"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> >>         {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> >>         {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> >>         {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> >>         {"powergate_info", .show = xe_gt_debugfs_simple_show, .data =
> >> powergate_info},
> >>         {"register-save-restore", .show = xe_gt_debugfs_simple_show, .data =
> >> register_save_restore},
> >>         {"workarounds", .show = xe_gt_debugfs_simple_show, .data =
> >> workarounds},
> >>         {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> >>         {"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> >>         {"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data =
> >> rcs_default_lrc},
> >>         {"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data =
> >> ccs_default_lrc},
> >>         {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
> >> bcs_default_lrc},
> >>         {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
> >> vcs_default_lrc},
> >>         {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
> >> vecs_default_lrc},
> >>         {"stats", .show = xe_gt_debugfs_simple_show, .data =
> >> xe_gt_stats_print_info},
> >>         {"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig}, };
> >>> 2. Why don't we simply scan for available files instead of hard coding
> >>>    expected files?
> >>>
> >>> Thanks
> >> The test scope itself is like we need to check whether hard-coded entries
> >> that are created are present or not if not assert.
> >> and these changes are to improve the code coverage
> >>
> >> -- Pravlika
> > @Brost, Matthew could you please comment on question asked by peter
> 
> The problem is that the version of the kernel determines which files to create
> and IGT will always be lagging behind. If code coverage is the main objective,
> implementing something similar in C is likely to do the job:
> 
> $ cd /sys/kernel/debug/dri/0000:00:02.0/gt0
> $ find . -type f -exec cat {} \;
> 
> Matt, am I missing something or can we simply scan for files at the right
> directories?
