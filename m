Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7CC5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 13:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C33510E20B;
	Mon, 26 Aug 2024 13:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liwmEyKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0939810E20B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724680660; x=1756216660;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G3h+T38Z8+ZEyZD/psBM40IJv3MX5HD9ol79v3eEpTg=;
 b=liwmEyKWo9h0bMQyo1qi4NDAmWwBbux4NXWxyDyZhpMjHBPdf4KWxa90
 o8o9vy1dn4WP4cTgaESK0V3W2Z401/Td2ie//ANnJP+jnEeRL1qSkAo14
 OD78vKx5kU/pvOEmq4dM4HWrmJ54pTh4WLqaJuJmu8YiBfRb4Zzf217jJ
 G3Imt0AbNScColqqyT9Y1xysdrnkUfC82BuMQ2tB4NWb6YjLuAOJuBE4n
 YNcDWpLvSh6rVXTJFZI0gRmPkU4h36jxoHfgN3BEy28gIIYXsZQPHCyYP
 qvBPGIW7Sk52W9ZRjwMox8S8T51T3Hy/efywRzLAqrF2Drcz1jLA+daRE w==;
X-CSE-ConnectionGUID: WpiDDdfPQ7KML0tzHst+jw==
X-CSE-MsgGUID: SSDMOcaHQK+Z/kyTkr+z+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13211764"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="13211764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:57:40 -0700
X-CSE-ConnectionGUID: GNPQovAoQ/aVvNzEXhCEQw==
X-CSE-MsgGUID: Rf/RisteT6eivIhdEovvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62673821"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 06:57:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:57:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:57:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 06:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5/6Vl16C3EhcxEWNIUTsHDfM1TA3e3Pvg/c805pS6f/CavETYzI835aUlSqyBUWyxNlugCT1nHEraTbHgYGB3yqUVQkltV6o5BLiPr5aPD8LXU6gKcR5lPi+FtDx/qtCguuZ6T13Pk/+OHayhQwzfAXiactZ9d7PsTQ6qCXhYYaSHYEP1cWExjE7oX5rW/pPElXEsH8huZ3qLppkUPogDfYEO4ifkOw7UVAmekggTDahhx6m+HSVp41RdCJQ+t0xie82BwZ7Ov3+6EkdMwATGv51iciDfubf0ZMn60/1vxDrm//4fHAFA+ODqwtg9CMFwFbMV1MplvD0HU14WNA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJoB2Sp6y0TsdSrGUqY60lB6BSdo0Gp01GF1xN+Kkh0=;
 b=WMyb1hGzGriYIIFk/zl0XyObLbMS6CegzbuAi0/X2nU7epVshVcCfqn5SDoRFZFyd9sqZ/jAizJkeRAqODH9QlRKDM90lJb1gjSqNr6uF+r1p4WkNvQvvtzsErxyOBLF/GvCHyr637V11JOT0oOGejxD1iVyzDQ/6TNtKYDN3R28fF3iCwBYp+/97mHY15kqb75uCHZ6bGArvSHCb358yoVpgKcFDwKe5aet55J9F4ik7ybLjnn+w6hnMHyq4XsETitD93YCr6ECco8LxtRFtrvFsuz2FtKhHpPIkx24Irse505Q3Cqq6Dw1oNYVEVj0/H3tHR0GL3/U/DPQ2sjQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 13:57:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 13:57:35 +0000
Date: Mon, 26 Aug 2024 08:57:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
Message-ID: <cbce7zwah7pkzabb4npk52b3vxhdzot2kq2ivvrj6bzvcz2zut@5xqpkltx22no>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <d5cd630c-314c-4dde-9f4b-6a3e213f4587@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5cd630c-314c-4dde-9f4b-6a3e213f4587@intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 254d2985-55ac-460e-e520-08dcc5d70999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CZVAyafP5xtarU/3rhkLxaMQswEFIVBI5M7BEOdGwWm15Ud//bwAZE0Mj2?=
 =?iso-8859-1?Q?QuVkMyc2xNulRir/L/klIoFzERzmt6z1EMP4XtztRi1PTicAXw32AYa5oC?=
 =?iso-8859-1?Q?wvofixD2hQ/JFf05fO9s75FSnW3G7T/UEZH6EJG9F3vdWq0Em3pxdB65sz?=
 =?iso-8859-1?Q?JWEpId2dJ/S3iyqF+ahn8AbX1TRRGH/yM7jSOwFLraSRu+1aE6isZECZYu?=
 =?iso-8859-1?Q?bTadklzZsTTACNoAK8ZFZC75kB+20k7qpul7ENhTxHzIfwcBaA/Pc0A6oB?=
 =?iso-8859-1?Q?kl1X/6bn+7bKNyrd8dxGvAno61hf3W10Sb7y82vsanYXFFMlp7FHfsWXeB?=
 =?iso-8859-1?Q?sXQCAZ10y0FRkYnonKvwg53Cs2kwQ8cvS77Hyhi1pmV5MRPv4Gn3gym916?=
 =?iso-8859-1?Q?pNNmw2sUqdZkyn6fJjGhKNx4FCkk0xUhY1gLSzDAV474rDeqZ5vfoE1mJG?=
 =?iso-8859-1?Q?6usytW1vJjdW42YI9JunHa9WOmfEVfarGCNyUFYjeYoxheSXpR/FZaYLnY?=
 =?iso-8859-1?Q?5GNgOm1RmU0pS7WylrZVsT+OBnYX+LvPgNtnzHFe7ctcA+bbVHXfcB/Pkx?=
 =?iso-8859-1?Q?muYsiC8Be8BhbIjQpiiikaHIipkvqVgcUqd9qRD1g32AdCYZdOq2GalZeF?=
 =?iso-8859-1?Q?Vdt1bqnLNNIDNPhC5Am/tkeE57W6ZMfbLJLPALUGizz0oSuQv0E6XFDvvx?=
 =?iso-8859-1?Q?uA1OprK9ryxCKfLrw88h3m3yzGOuaQbLcDCxCDafJkg+tZcFV3+kE1QoQt?=
 =?iso-8859-1?Q?t+v7hIm6uIcj6ZvGO4AQlm3WtMek0G66SOvZnQX5Ed0LqNDNH9kutvqYEp?=
 =?iso-8859-1?Q?JWxm9bjZWHyjZeLpTYW/lbbBgUUNqco+KBuJwbMTB86RdHfCm9yWHC2mME?=
 =?iso-8859-1?Q?tmjKFoa2uIn7XMxE/af+VnH6/am1txTQXS6sNupeJxUzH1kj8YYJYooF/h?=
 =?iso-8859-1?Q?8JId7Ery8SL+o7dCVv7GlBCdLycDfKyBYL7ai/E8Pxu5XqbZGYlrl8cAtb?=
 =?iso-8859-1?Q?85no1cvHwvhUSVFKqXp3WQVLCXuB4ZgZ02UJPfNs+tvR5gaOw0E0bD6VmI?=
 =?iso-8859-1?Q?xGgtIPev5GiMFMfyyJhquUgBGBdK2gHnAjxIkLGLinDHj6IGfDOEVbby8C?=
 =?iso-8859-1?Q?LoIMap4EQsjdEzzNO5EiHdg+VqFrwNgA9YzNDHfubPPaAwLdcAQ7neF6nn?=
 =?iso-8859-1?Q?oyXxVATNnHKdHa16NVnuF5WICbnNsdZ72xw9yEjUEzY4vUuqIIT1dyg7pI?=
 =?iso-8859-1?Q?ur1NNaZE3wtTS0MrTuFkISykeOasiSetj9dQmS2qXyqgyo3iEN4xIdITXp?=
 =?iso-8859-1?Q?Nn1mJgdmF1ey9gxqO1dBIr0BU1Lo+2P/S1yh5wFXKjGQF7M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1Ajm6jLcFuhWNZu3G4ArP+aU72ZZtQYmLcXhQ7LFONmUGTt3tORQfTMwkT?=
 =?iso-8859-1?Q?H/oVG7RA6MYLjMdJP4Ct/KNchY29rk7mvB9b1EzRN7HYPkwIow3iUviTPQ?=
 =?iso-8859-1?Q?fCim9PnhAO3rkBx/rBnZ0B9HaZlvBJUjlR4QA44UPvxTwf4I96V+V1qw5S?=
 =?iso-8859-1?Q?0xgLhJKuvF1BvUQwqyULyZY/dh0VyYroQ+vio/QGHC7OsZ+oQafVPofNtD?=
 =?iso-8859-1?Q?Z6ScIvq/vKrXnrkJi3YRPtzrP30r+YlKyX4QVMLFxsIHXnI+TCNQME8+GC?=
 =?iso-8859-1?Q?QqJVhXgmvAiYBaC1Or2xTkkTudWv1N9z+D9krE3SvJq9D9F8Ku1k7+zopl?=
 =?iso-8859-1?Q?rhboyZ8QAzc1wjd6jJa1HiiVEjpXZigfh0A5I2w1LnGFHrJXG+AG0mcG1H?=
 =?iso-8859-1?Q?RvtMs6jVqO4UaZHMZCOfRB/aid+s7uo4RLN1cJNYUqtXfaHe99MCdl8X/X?=
 =?iso-8859-1?Q?SPWy1OakRLN8Y9WOjykIXrypLYzmfAjrL1UFg0bp1ElGjAkhKZaIBRB6RD?=
 =?iso-8859-1?Q?TbkwT1qJKJILHwVQCg1770ZiMTjONRhSjpnvAyBS8N+KjF/8u90ju2f22T?=
 =?iso-8859-1?Q?4wxtGSn4lS4JR9ejWpvJXIkUTAtpVjm6j1E9sDvcvM1L1vcJ6Bz2XCfL3y?=
 =?iso-8859-1?Q?516yfvjO7Qyo6qWyEg6eJ4/esytF6Ck9pwsLnZqYiLGlg8DCI+VI2TQ60r?=
 =?iso-8859-1?Q?f+4Ov1tSLQsVcxChaA67KDUWVEbH0gI3zvXADt6k3GXz2CNGnZJbYoZ1E9?=
 =?iso-8859-1?Q?iEWankBTpKp+c8ehNo2H7wKKrJnqnKtOAo1ukFImGJdAbVKceN2T2p8NPv?=
 =?iso-8859-1?Q?zdqJfz4n9hwKfrEzwzEM5aBw0ldorfGY2vOUzOeaP9iILaWblEdzNDHrxY?=
 =?iso-8859-1?Q?5WgeU/pCelO5VpCHsrfokajbdNwHOkwQ0zCUu1xWdeb2RDD0YHgrIOG0wL?=
 =?iso-8859-1?Q?eMew2BjvgdO74UpQVeQQljj9OSLKtReBg8QB9VeXYihbC3C3pwIdiHae2z?=
 =?iso-8859-1?Q?vgjM6SNqJcw2HssRHONW1Llt+CGRI0prnk/uartW3AB3peb3q/9aMfrEXv?=
 =?iso-8859-1?Q?uDD9z8i5WClOS6gZT3N5I068uNLwE3WuJObByuI9SiFqt446s4OQ7ablr5?=
 =?iso-8859-1?Q?oXhNio5VAqCQf/7d6xeOCPn2fRod7dm8vpGjJy3R69UbYGVPAOhOxo/SD1?=
 =?iso-8859-1?Q?V54PrHw7T1ODr964mZ1wt+ASfSZR6mjqBMfz7eJIVMid7FqnK90gJDUuv5?=
 =?iso-8859-1?Q?NYpITdcbEsH1TmGTA57Pn2M56MtWnZxGDuv+hMZyEeODN0G/6zzv+GPsuY?=
 =?iso-8859-1?Q?QsAhmZZ0DWn5aS6mtlIWXfgTDTf8MDCBNWByyDFXtvI0YsIiX5hSQ4cfTa?=
 =?iso-8859-1?Q?6MK276T48Gvd6KDuRd9tP+yqBg5zSZEDsnpbB3SbM3uayubnl7XXGA6AnX?=
 =?iso-8859-1?Q?uW3MtEg4TeFWGF5zngNl2prN27znVWGGzQl4pWZlfGPh/vAql+Q/qnNu7i?=
 =?iso-8859-1?Q?83RNdp5MMQaMdWMmKmUAdMyHV3rW4QJVZ1NVBCjXPh2FI5qNFAjdxx2pfH?=
 =?iso-8859-1?Q?XSt5JPK8K9Bo/j80yjpb7hLpkOHXO/OesxmC5Y03Uv80sY0ptb/wKtUF5z?=
 =?iso-8859-1?Q?fvGJ3zh54+lUjEE69U28KetietKtsq3f34IUyVRakA5Ge+3EDbOMRtDA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 254d2985-55ac-460e-e520-08dcc5d70999
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 13:57:35.1321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/KCMCduTlDEPyPwSoSoKnC0woXqqid+hQX56UgTnTzes0OxI/un8T1nKwWzul/4P6kwWOY8Oy4jEQLsbuf3j8prVGUua6gwvrS2Gcp+R90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
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

On Mon, Aug 26, 2024 at 04:42:06PM GMT, Sujaritha Sundaresan wrote:
>
>On 8/23/2024 2:31 AM, Lucas De Marchi wrote:
>>On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>>>Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>>>Hi Sujaritha,
>>>>On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>>>>Add tests to validate basic execution suspend/resume cycle
>>>>>without display module to rule out display related issues
>>>>>from the suspend/resume stack.
>>>>>
>>>>>v2: Add normal reload cycle after running test (Anshuman)
>>>>>
>>>>>v3: Rebase
>>>>>
>>>>>v4: Change commit name/header (Kamil)
>>>>>
>>>>>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>>Acked-by: Katarzyna Piecielska 
>>>>>Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
>>>>>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>---
>>>>> tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>> 1 file changed, 34 insertions(+)
>>>>>
>>>>>diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>>>index eee89428c..1623a56c7 100644
>>>>>--- a/tests/intel/xe_pm.c
>>>>>+++ b/tests/intel/xe_pm.c
>>>>>@@ -17,6 +17,7 @@
>>>>>
>>>>> #include "igt.h"
>>>>> #include "lib/igt_device.h"
>>>>>+#include "lib/igt_kmod.h"
>>>>> #include "lib/igt_pm.h"
>>>>> #include "lib/igt_sysfs.h"
>>>>> #include "lib/igt_syncobj.h"
>>>>>@@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>>  * Description: suspend/autoresume on %arg[1] state and exec 
>>>>>after RPM
>>>>>  * Functionality: pm - %arg[1]
>>>>>  *
>>>>>+ * SUBTEST: %s-without-display
>>>>>+ * Description: suspend/autoresume on %arg[1] state without display
>>>>>+ * Functionality: pm - %arg[1]
>>>>>+ *
>>>>>  * arg[1]:
>>>>>  *
>>>>>  * @s2idle:        s2idle
>>>>>@@ -681,6 +686,7 @@ igt_main
>>>>>         struct drm_xe_engine_class_instance *hwe;
>>>>>         device_t device;
>>>>>         uint32_t d3cold_allowed;
>>>>>+        const char *opts;
>>>>>         int sysfs_fd;
>>>>>
>>>>>         const struct s_state {
>>>>>@@ -757,6 +763,34 @@ igt_main
>>>>>                                           NO_RPM, 0);
>>>>>                 }
>>>>>
>>>>>+                igt_subtest_f("%s-without-display", s->name) {
>>>>>+
>>>>>+                        if (!drmModeGetResources(device.fd_xe))
>>>>>+                                return;
>>>>
>>>>This should be skip or save it (as global?) and run test on headless.
>>>>
>>>>>+
>>>>>+                        xe_for_each_engine(device.fd_xe, hwe) {
>>>>>+
>>>>>+                                igt_debug("Reload w/o display\n");
>>>>>+
>>>>>+                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>>+ igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>+
>>>>>+                                igt_kmsg(KMSG_INFO 
>>>>>"Re-loading Xe without display\n");
>>>>>+ igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>>
>>>>This param was renamed to probe_display, see
>>>>https://patchwork.freedesktop.org/series/137096/
>>>>tests/intel/xe_module_load: Rename enable_display module param
>>>>Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>>>
>>>>+Cc Lucas
>>>
>>>And disable_display=1 might be more appropriate, because probe_display
>>>would simply skip the probe for display?
>>
>>Good point. For platforms with display, is it expected that suspend works
>>if DMC is not loaded? Otherwise we will actually have to touch display
>>to disable it to be allowed to suspend.
>>
>>Lucas De Marchi
>
>Hi all,
>
>Thanks for all of the comments. The need for this test mostly stemmed from
>
>ruling out display as being the reason for a lot of the random 
>suspend/resume bugs we see.
>
>So what do you think should be the approach for this?

what are the suspend/resume bugs we are talking about? Without analyzing
them, it's hard to answer if they are caused by display or if
probe_display/disable_display will help at all.

Lucas De Marchi
