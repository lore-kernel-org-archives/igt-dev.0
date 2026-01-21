Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ED1D262AD
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8B510E684;
	Wed, 21 Jan 2026 02:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMBRXGUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0088A10E684
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768962243; x=1800498243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TqqYSVsUJuDb8U8ZjJWVcPY4aKEeWv7j/joQ4fG0ku8=;
 b=gMBRXGUOjWTADw6AGBrB2PjQ2ThhGjKc4fhCSj12R07EEgptmj+TsCk3
 65PEoAiHAiZni+ndSkyNigox0MdL0sayVi1xLPRxduq44sfch7lnIPr/b
 h71eN6EltCKBi9W/TZ2KwGEc2BpS1RxLAi9t8S32b/wl9gF0lNxxZHkaR
 +cxIfnbK4kYjbjcmjQtfh0GOq+BBFXYrnKyMAQAWM1kLmIbhTz/xZd7k/
 GWhh7O3uSh/cKcH6z3harX9dMWPkZv5/Xt6NfIqcSBgl22xVatLp4WP2N
 ji7ejBqRk0WaXqdpbuMqGRC1Q1tMgR4VLiRkf7ubdHWkgVLW0EyTVlSrd A==;
X-CSE-ConnectionGUID: nZpp/kqLQB2YEXALQ4ksCw==
X-CSE-MsgGUID: GdX0vvdiTtCWXs1OORgxuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81293911"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81293911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:24:03 -0800
X-CSE-ConnectionGUID: hXArvHrRSTmyo8UwGLFixQ==
X-CSE-MsgGUID: YcI33TcUSEiAGx7+FgVyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="229258497"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:24:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:24:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:24:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLIoZp/GamS8dIA6el8XGOVPyFbNSYqB0UDaxujhujCPiYMoEV5p/XA3HQFIbLp3/aL+NrRzUPa/btoCKh/ABrJjp31EYEHMnFb02lyag/DMwQdCND3CAy471NIfF5KYzQzRolC2N/jzVzPuB+Y/zBd4g/LyTiP11gYo+6hoNiySvj9y1f5f1TOufmSNzBUbzBK6Vlryau0tirsYVzJ40R2GrNGYRvlwFxscNngX6N1dZT7mtK1OUYt2cAgUAqy0+zqBjFGjZVKQy/z5sAXYB9CS3kioQd07pOdg5t0mi7h750WV1fEBadijTh1LzcncDAtDoJAT9uJysD65xiGCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJxoxv4mDVMnd+NteXvYx3k8C/5JVld7LB0gNZDVF98=;
 b=BQIoN+Z1YyETGSGoVkjwY96+/afaZKAW7oIn5yOC+U8y0JfNiNwAWwc39JfhnyQYVkaUmEioheZ+YA5bhbB3u2d5oMg01R6T2kROyMHXAHC+30shqbPnM6c5RGo/5C3lNGAXofRaY8yQiuDzz+Ne/EjNefSW2sR1V3WnCTLaQRZB5WNNlFF5MYz65zTvnjXj3LdmXRyg/k2NgsiygneiKqg+GHJx6W+oKqY9E3aUC2WNeitbuts/lOidbkmXw19qSm5XMlo7KASW0VQVChjxBsEbfIfct21a6nW8koN30tUoYEty58w5h75Q57H5yxHGH//HqnJovy/N3SBcqB/8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPFCB5A2AEE2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:23:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:23:59 +0000
Date: Tue, 20 Jan 2026 18:23:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 3/9] tests/intel/xe_evict: Add multi-queue priority
 test
Message-ID: <aXA4vLjgp-hX3W_-@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-4-priyanka.dandamudi@intel.com>
 <aXA2oRN59ZJi87_l@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aXA2oRN59ZJi87_l@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPFCB5A2AEE2:EE_
X-MS-Office365-Filtering-Correlation-Id: 863602c6-41b3-4503-ebf4-08de58942283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7br/C0PL3FLFaNQMzLkPLdgfaKYtXjPzd3HguoWouJnY6SHWNa4Km0A3O5ky?=
 =?us-ascii?Q?/9kpFakjpcx0qMniQpFgChloOXB1GB/MECMOnO5odkJp/okoqcNjkqEOSKyy?=
 =?us-ascii?Q?7NLsuCQbX9XGnTAtqW4kMKCMMbom0a4KQ64oUTcS19JRqLz+Kbuv2HfBF4zl?=
 =?us-ascii?Q?EcViL7N40rk/pWwwgiKqBFCswx4PTptoTX3+2yFXgL9HpAX1DtHWrEWRDSdg?=
 =?us-ascii?Q?M7CvhM+MNCAMh27SvvQCYYOKB91XVBXiTjFFQbDT6Lo8eqG7Q9UEyVz/NMq/?=
 =?us-ascii?Q?Z9OXSJgUWkTwaXv44UTw14ljmDIizSshTapWAC+xGDHu0opyKbQpktHEFAsj?=
 =?us-ascii?Q?Ta8scj7t73cyeEacM9SgGHtGgOCBvtfrSvhL1HFP22UNQA7it0moTH6jmpfM?=
 =?us-ascii?Q?ojvwS6P5sOgCCkwz1pU8LW4uXLBL5G9bnIpuepZBwEFiGhjt4Zes5deRa36J?=
 =?us-ascii?Q?d9+99SFwIyFWB4gtVGBcjwQgUr/CD+ZwYAVrAbWVeawIM1w22m42Lev3URz+?=
 =?us-ascii?Q?Hw5lVQpqGdaksv/8yZHZSBcaUcB4ZtZp1NQ8xRKl05gfdDd4VLaukoJsBttj?=
 =?us-ascii?Q?LZV+mmzS5txF+m7hTeErAKrQkfwfTmQPSmwwFEuAhV8MWmekrzs4Q+GgTsAy?=
 =?us-ascii?Q?Ly+SPYz5VTxxUYennXBOfPEaN/nZ6c9u7LXzAEcZ1sCSJOmaVobHdWs5YxtY?=
 =?us-ascii?Q?oKESVv6MMwHgNr5VZ9AqJ7vJqz2l73UGY+AQ7tl29n1lUsZ1knQqo7tUmnVt?=
 =?us-ascii?Q?nBxjdIGp7juZMZaMNVv9I4AWbGxXXLCj3CiEBXhl09yL2Uq5KrRmYKVVAtd6?=
 =?us-ascii?Q?qKWr0Gp8L13+Uuk0R2dh5cVDK0G86f9If7QJ2ntAsR3lic54zR6FQH1hqQpD?=
 =?us-ascii?Q?YwQdLtR/2cwCl3U2zwj82n1uZoRKa2TlQ5l7coQFVc+3p+I8+LBdAPs7v/n7?=
 =?us-ascii?Q?4ApVQmQ0jcNmqwSDzLkQBYjol8Fqv9IhQDFcrp9HV3ofLTRMDoQld1ymf1Uf?=
 =?us-ascii?Q?6uXSW6zMEY6XKXASwxcvySIaqE7SzRbLvfE/FoRASW7wGtXtUNNnSzWaT3yO?=
 =?us-ascii?Q?HH/HNgKkMCG8cipCmRYYcKovpexwfLBR7G9wZd0OKTzalr/0nfEbYsO1WnHX?=
 =?us-ascii?Q?R+ddM5xhjGF6JTkQqcWcnNxQBBTFKS5NeyQXtUBtSPO8BcoMJ7thp/LVqK2A?=
 =?us-ascii?Q?vF0t5TgVP3dw+bhrwE1vxksxdL7NaouQRYO9QWEG78wu5IiKTXkzArgk14Q5?=
 =?us-ascii?Q?ISufBGNNDrSHCzmFW1Zo7s/jM8qT1xJ/K1BZSVo7IYPPlqlUyLyeVtcyqLdw?=
 =?us-ascii?Q?+au9Yb9QaGrhAowPgjiA+DDPkBhR82QGr/O1q2ky3Y2KDO3vfYY5FHU9pVwv?=
 =?us-ascii?Q?mCY48dekoXjQIYva7saNV5ELD+KAsc24BKTc969EkZIWR7yuTADF28AathDR?=
 =?us-ascii?Q?NZrguCrCXB9VvjhX5V+jXuOOIENoL0Mv+R8g2wo5SP7/BKDbw28TsiuT1DbS?=
 =?us-ascii?Q?MaTRNUIO1BbLUP4CcMLNGU8/IBPWdE7CkeP/7QNFhUrCdOv2uhsQC4TrwMEl?=
 =?us-ascii?Q?IQrEPk73u46T9Y5/F1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19DMdd8jsNiN54+eoLj3xn0jwJcj6QYw8hFn5XS+zufw35LgzUDmft0CEeu1?=
 =?us-ascii?Q?bkIGWRovzWPFUSLSQn5PBO19gdKqCOvJOLVrkUNVJV7EC2GJOCj3leBSvjFr?=
 =?us-ascii?Q?gw4kDBdT5eFDa+fvSh+5zwABhjbqg0dRJOYug2zhmQ86PDTJCGJ/HHAOWMwL?=
 =?us-ascii?Q?APJVdjL47smlG+XKY3KRscfYGKtjmX3Nghca9sJM8rzTCUKQzy9gPGGKDWcv?=
 =?us-ascii?Q?oFfCi8ZyMgn8UxGY+APCGdSk3FGLad7vDeNen0TkD3mRg2/Z9b4mmO9Bqd+m?=
 =?us-ascii?Q?GAx0tJGCbG/EfRddvGJ0Rcm/mgAzlt4fsRzEMMCbvNHNjDg5vAMMhQTVC0Sv?=
 =?us-ascii?Q?bp0q6uMUMu6OZcok4fVLK6JymPKdJXQBnwBaBvtkvnp+TCZK5cn5AtcH+4ej?=
 =?us-ascii?Q?8D1Cl+faBga381wD0U3KB8sHZ983XYiTL7SIEj5SeEl8wFZmo1znXT+LLHS8?=
 =?us-ascii?Q?CLhLIk43vwOkVcvUU8ClSP76psmI6LoHPUVlIyAAjOpv+KQXBjGda3oEQn3K?=
 =?us-ascii?Q?L4wafef+SieIm2bDcqfGn2ENxUEhJxBC70U7XblPX7OG2U9cm8lJXlPMEB5o?=
 =?us-ascii?Q?EQOq8FcZk4n+UFfa/A/fUGp7LJHzkCZ2h9cSVfYAOMz93ifc9fW95gPDn4dS?=
 =?us-ascii?Q?mNnHSg/P/pe3MGF/fOx/jqrtXYdem88AgijINew/B2SeTFnv+P1CRSa2IHCW?=
 =?us-ascii?Q?WaqD5wamAxbCQuDm+Q4HxCcM0+4tbnyU8ZHH+4R+GNibeLURp+XxKT89WYBC?=
 =?us-ascii?Q?IG9Dbwhyd0Bwlr1IUVxXkOQYdyo6odJJaKoWyTaXNz4ObK8o8FXkLsWxyn9t?=
 =?us-ascii?Q?aHwaeP59JuDMHbhWQWv8/h9fzfRZh8xGHw+AEfA0OAyDHNAcjs3xNC0s6jEA?=
 =?us-ascii?Q?UkyfmRN20bR4CBOukE43ztp2yY89SWZ/EWoFxd780e5Yq5Vv2Fu6YrVEB2ao?=
 =?us-ascii?Q?tXrzpKZeAzXZJ344tyrTLBDLxSqxLKyRKHZNpsjXUc2QR/F6IV6NHDKziz3c?=
 =?us-ascii?Q?LAQ7Mw9yxoxjNniKKIiJoTdlqPoQk87RhAATQr2OIFfHyFnO7UNASh1eijUR?=
 =?us-ascii?Q?pdP3UoIa0N0CJXk0XSgAH4GIC2gt6soIVmCDrISWfBqYkcLK7UGLxM635rbK?=
 =?us-ascii?Q?fMboqKwxZsVF5QmN95zM8rmxFHe1nJ6l+1RL/OW71oqJjnztjBRPVpEg5w9n?=
 =?us-ascii?Q?xbTmu9LR+NliZaC4ke+1B0VEqZlYJYgYEd80Mr4XTWqhFCTD1Ffkm/DlBp9R?=
 =?us-ascii?Q?bei3epdInr4VVqgxQg+aL06nd6aFLnOoOEYwd0S8idRVG4LPxbBR2nJAJrzo?=
 =?us-ascii?Q?WVY3AKS0ioOoovwUYexyqhF/tBMpnpzZ3TQkFoWqgU4O73bXb0MjMQUAi2Ey?=
 =?us-ascii?Q?2g97s9TEbxgdYqQHMCl7P//wQZ8+N0yFY7Y6f8YafwT5S72WEEjisBZ0+ox4?=
 =?us-ascii?Q?lDCu9Eixe2F2AiyIkaRKlgoJIj9Elqao9iem8aZNiWLIyOWOw3wAArGucqKU?=
 =?us-ascii?Q?rYxz77pfmh6jhxJ6h+/Vd+d/8YeIglhcjppDzT9AHmWSMZWcaw+mLrk2NFc+?=
 =?us-ascii?Q?YJ/pORns5QwT/P/YTU2+c6LG2QhwfWJ0aHbTpTkniBWGSZS+d+KfQmO9X3uB?=
 =?us-ascii?Q?ra9mj6opTWbQxLU+ZZrukN+XC4uS8bAgzRIIi+GJSJp//q62+Pzq8Te82xKB?=
 =?us-ascii?Q?4pV6YV3jADf+JTY76kfi8ipAi4jzQc9qAtODrFKrPjtgmRRCQ16RvUqLhhVy?=
 =?us-ascii?Q?bvEh98RIix05IONJH4vnVi7htZpxOD7Chx5hH0pio2SbZKzKXJlH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 863602c6-41b3-4503-ebf4-08de58942283
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:23:59.1899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBrVelbPTXs05VE5GQnJAuoGV7A0PpZFzyNyQJw+IYuLmkMWtuN6Fc32jk7YSctEWx5iriKQgsQjx9SBveocboo9TMWF04ZjFzrFjVnlLbrSN64wOT88UwGXZz6Hc/YM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCB5A2AEE2
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

On Tue, Jan 20, 2026 at 06:14:57PM -0800, Niranjana Vishwanathapura wrote:
>On Wed, Jan 14, 2026 at 12:29:19PM +0530, priyanka.dandamudi@intel.com wrote:
>>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>>Add 2 tests small-multiqueue-priority and small-multiqueue-priority-cm
>>which sets priority for multiqueue.
>>
>>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Minor comment...it should be 'small-multi-queue-priority' and
'small-multi-queue-priority-cm'.

Niranjana

>
>>---
>>tests/intel/xe_evict.c | 26 ++++++++++++++++++++++++++
>>1 file changed, 26 insertions(+)
>>
>>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>>index bcf13b8cf..2f23538fc 100644
>>--- a/tests/intel/xe_evict.c
>>+++ b/tests/intel/xe_evict.c
>>@@ -21,6 +21,7 @@
>>#include "xe/xe_query.h"
>>#include <string.h>
>>
>>+#define XE_EXEC_QUEUE_PRIORITY_NORMAL   1
>>#define MAX_N_EXEC_QUEUES	16
>>#define MULTI_VM			(0x1 << 0)
>>#define THREADED			(0x1 << 1)
>>@@ -30,6 +31,7 @@
>>#define EXTERNAL_OBJ		(0x1 << 5)
>>#define BIND_EXEC_QUEUE		(0x1 << 6)
>>#define MULTI_QUEUE		(0x1 << 7)
>>+#define PRIORITY		(0x1 << 8)
>>
>>static void
>>test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>>@@ -89,6 +91,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>>			};
>>			uint64_t ext = to_user_pointer(&multi_queue);
>>
>>+			if (flags & PRIORITY) {
>>+				struct drm_xe_ext_set_property mq_priority = {
>>+					.base.next_extension = 0,
>>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>>+				};
>>+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
>>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>>+			}
>>			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>>			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>>							     ext, &exec_queues[i]), 0);
>>@@ -279,6 +290,15 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>>			};
>>			uint64_t ext = to_user_pointer(&multi_queue);
>>
>>+			if (flags & PRIORITY) {
>>+				struct drm_xe_ext_set_property mq_priority = {
>>+					.base.next_extension = 0,
>>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>>+				};
>>+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
>>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>>+			}
>>			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>>			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>>							     ext, &exec_queues[i]), 0);
>>@@ -540,6 +560,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>> *
>> * @small:			small
>> * @small-multi-queue:		small multi queue
>>+ * @small-multi-queue-priority:
>>+ * 				small multi queue priority
>> * @small-external:		small external
>> * @small-multi-vm:		small multi VM
>> * @beng-small:			small bind exec_queue
>>@@ -571,6 +593,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>> *
>> * @small-cm:			small compute machine
>> * @small-multi-queue-cm:	small multi queue compute machine
>>+ * @small-multi-queue-priority-cm:
>>+ * 				small multi queue priority compute machine
>> * @small-external-cm:		small external compute machine
>> * @small-multi-vm-cm:		small multi VM compute machine
>> * @beng-small-cm:		small bind exec_queue compute machine
>>@@ -714,6 +738,7 @@ int igt_main()
>>	} sections[] = {
>>		{ "small", 16, 448, 1, 128, 0 },
>>		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
>>+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
>>		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
>>		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
>>		{ "large", 4, 16, 1, 4, 0 },
>>@@ -740,6 +765,7 @@ int igt_main()
>>	} sections_cm[] = {
>>		{ "small-cm", 16, 448, 1, 128, 0 },
>>		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
>>+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
>>		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
>>		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
>>		{ "large-cm", 4, 16, 1, 4, 0 },
>>-- 
>>2.43.0
>>
