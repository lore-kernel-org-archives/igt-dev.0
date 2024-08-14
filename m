Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02583C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF95B10E477;
	Wed, 14 Aug 2024 13:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7AixMcm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C310E477
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641590; x=1755177590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dy2cK0hx4viPZ7Fp1xlYzvSCOctN9hZjXSgm9XsZ5i4=;
 b=m7AixMcmZUcJ5dlcPAxZaJORaZDogoF+L73E0Zo/ACZaTkj37jtO4kSW
 syYplBBt/JYc06YKCzDrVjg6dbF/OmGvkaHB6Rh7O+c7Ii5X54/FV0aUy
 4iXRcxBYewEqvy+nawy5hzWgNv2ZPspW9VUKfjdyUePG8Hl/tfaIUzW17
 Cl5p4y0a2GAWbar9MvCjqlSfjc0Hn/88R1SzfcIdvbWhbhH4+1B2aLAeJ
 HgnqnsNI6Zpt7tI6gFjv9E6DE4JzRrDfN29TNLuWxzFZJQ4bCPvy3DkFF
 t+ypad3KHZR7RkvsO4emHtIhhSMYlq0Gz80OX80JDoSkZhADaXg51ct/R w==;
X-CSE-ConnectionGUID: hiEO6nG7Q+6dNAVgYqoWww==
X-CSE-MsgGUID: jtZ+qHEpQSqI2ZUNMOtxFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32532855"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="32532855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:19:47 -0700
X-CSE-ConnectionGUID: 7wFI9hRfQje6ne07NsBDow==
X-CSE-MsgGUID: 44ek+qMtSsileQjJGJxbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="82245187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 06:19:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 06:19:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 06:19:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 06:19:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 06:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke4Asbn+neL1iutjNpfR2j8V5B4QhV7/3Yb6qYh3a5GZBzNHXC9QN5mN5Lfd0wAx0MTIGhSemYeZ1nY2l4oTtNmo5cOJ93pMspLglcJ543ij02zwBXMWiFjZfqedfeA+N2ZE4IxY21JZthMqLcb02lxsAI+AI7iozRXd8BXUFlXj98Md6ONTHAushr1GPjmDhAY4o90OcLIqL8vYelc6bJHTqKt8PYTwF99p2y3R4vnihVFv15U3duVYvBBbgfoTZfHdmdJOqQw97hdDJ0bZ8tWqYtAuufs6lG19ftB1/Sisb4ArTGLQ8lTLE4szyPKbmvvKY4AfDFkq5rqMXeHzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wzmMXb004zRKl1QiGQlBstRoUe8AUmRzTD1OK0W6sk=;
 b=N/7Vfwr66f353itdz/4E8qEt7AH3hXB1adEbLUl1Eno/ISVHk6NkWtfjY2rils/O3o62B8yClCMNwAZmJHmvxD3BFH1KahE/VbZDFwh/5Av7arX87z5Nxp5+4UyIShsnFwIUWl/vMlfr1hlnUT7xIkmrC5ciGm6ep9oC8GOthARp1bEOn1uBt2Sbre776pB1a6tKY7CYRG3LC+vxjQus2urFhRmnHlNc32+QRyPX2zY0DZUamxu0Fpu04sU5EkveYJU08wIYGvvoHLpCa+d/vVWlTWNpfMkaEOSq5Yyesh3aK6F5WxdGUBBUDkXCTIdTb2etmjTFaU6mc/H4ZrGUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 14 Aug
 2024 13:19:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 13:19:42 +0000
Date: Wed, 14 Aug 2024 08:19:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t 2/2] intel-gfx-fw-info: Allow to print checksum
Message-ID: <vukt7rfbumvyzjywyqvbh3tjyrlu5azfvl47nywkz6ljqlgu4z@qbptnty5bnps>
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
 <20240813152141.3151865-2-lucas.demarchi@intel.com>
 <172363699168.1939.14120036984031801571@gjsousa-mobl2>
 <172363832409.1939.8138063044901716592@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172363832409.1939.8138063044901716592@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:303:6a::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 035305a6-0705-408c-31d5-08dcbc63c224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 68+iUQoOs2BJg25UqncsmHXPX6FcdROdsdDdZEEvSqwfBGlmloEvkoeTqlxya5rs5ulDltfHtiofJ/6EReo1pQjtzhsFzuh6WaGuS5tzcNI2yUmKPb+9uao+wo0RjDJ4Nn0QdnuRacTIn1fI72AKXgPrIKwf1/QQZnmTIrlr9ZDDNgK67UinNpXecUKHjoQShmFiwn8wtN7k26siSPTFmwZckf4iG3nh2baB2Oa3xPxxGwG4WtHnPkpBa2qnqDqV08HDEsvy88m1GgVM9bm8te7eUtrfLk03HrM+3jCHsfD/GZ6JD9/+JrzEA1W6K/4H8kO0TeHDVQDye0w8I5UnVglu7qzuvrZo5oa8GyNNcLQWdL0lPNwlTva98AiRoAPwjEqwOe9ACHILObSyaW+8eBMhFE+f1do5xx8EvCPfT+lCE4HlZZ4Weis1nhUYE4pgmLjWclSksauW05Ko3Z3XkHrOzuVFaUWu72akdgo5sAjCdzlymTJeIiJO/qMSxN1ZQyxo/08xFr9D4oKM8fyJA4jAkcAu4Nq9IDDsAjzszzKfJ6HPJZe0S+xCX+oMPTI1zlRYrWKF0u2irWAWSc+CN+HaOdZtbSqzBA5Y4WLnsIKJNvYZ/zMiwkVdruWqpvM9zchsfcLDyi7Hy9BS50xhnvRhYb5IGow+ag8bh1Nqzpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyxSXsC7IhaUBBfZTFheTY3htChmb6hzxqnbUSLM07wEbbLh03CC/8TRbP1v?=
 =?us-ascii?Q?0W+FhWY0mKA267cr9pe98U+iqWJHjtLnpzbVZZUi+yPfFqsN1AZ+sNMVWlpO?=
 =?us-ascii?Q?up5mEhMeOPuo5rIQrWd+iEmM88Spr6nZhhdpatVEmAu+O+YMljlJEOhp3q1Y?=
 =?us-ascii?Q?dDiYO3rBwgc88J/YcGOQcSqYdB8hZJls1gRqJct/h4cN5yDYkcf5+AMpSa5H?=
 =?us-ascii?Q?EIbLiTtBRLriL/5JQhTEvLuSNjxqols8fUYi9rUZdaKgYS3n6FXo9udkr9Kl?=
 =?us-ascii?Q?DiW+pvUBEiOb43f5cw2nCDfa25tde5DtvnesuEdUsn9p01BkmI1fNX84oXsl?=
 =?us-ascii?Q?s4NC2ZcShP1jBwoCZo+SYWEELNJg+KxGle4vHnJTa2Eje+LBtJj+wnAkynK/?=
 =?us-ascii?Q?E9pUyUoiJA4cU8OL0zQDl2Y9vXGCGT1d9A6ZdSUPnULBT9Gr6lV9J9C6m13L?=
 =?us-ascii?Q?tDYaQg8OZjDPlNybU/mSCRSGqfvMS0EP4JWHy8C40+4zJwEZAh7Bz6yRl6tw?=
 =?us-ascii?Q?pxS3sPmeWyWL1WM6B9a/r/QW7WvBR9wB/prOhtNOCM14yLIL0mMqJUUg64pd?=
 =?us-ascii?Q?33JiMJU/LFeA6+dC0g/PBx03KA8e72NWmGAoP5dPqRwknU1enIu6BNzi2sCa?=
 =?us-ascii?Q?iBz1ASXR8eL3kXKS+ecTmBDz8W5huTpKoFIjn/pxOptgq/9t2eojGHJCTAg3?=
 =?us-ascii?Q?1YNCsu37wMjcYkDIh7GH8LZcoJm2hAzhpQ8SKbUuq34WPnn+aYjNxpCA6rb5?=
 =?us-ascii?Q?nU+s1jLjxV+9EXrNHs2WmUbhIues7JlXMsdIu2Pr4o2lsxF91SLC3gSplHIJ?=
 =?us-ascii?Q?vkTP/9oNrWShvthH6+cwjukU9wIMbKHmmQzVIuvobXMLI7SzpzKijhf8jw/e?=
 =?us-ascii?Q?JOgXlLpCM1D2CuccFSyCrAiqRt+yyoi8OW36mnJDFxL5pv+jwg6GiBnIJzwU?=
 =?us-ascii?Q?aCkdzrwqSDmTWEq1dU7tqP07nYoEKELqvTnOV3ELAXsn87sMJONBbCiShBPI?=
 =?us-ascii?Q?gO04Dt8BURsMW9sMHL7hvHTremapZrAEMpmK7enWtfQLvg9684gDh0FdhvLp?=
 =?us-ascii?Q?FrRqcy/V3iAuBkUZy77pgyL00KOSS8TvG7BWfN+YzTwYZYb2sbWjvXtW6qb/?=
 =?us-ascii?Q?vSGX/lIUIe4myTn6FLbuRer5bf7RQAfDQQ6wx1Mm/VeAxf+pqWCRwmm3j0KY?=
 =?us-ascii?Q?bFOXO24XBGDGVJv0RSMdy1DdXkZ2yloU8lUYXZ0MZUMsKq83EPnyUZRAdz+Q?=
 =?us-ascii?Q?cCmBOBoUsF9RvJOVDQ9PJ+fQoEDKlKR01uNjIRi39/ohk4LmWtrQWX3waVHT?=
 =?us-ascii?Q?YbDNmOG9aPED5+lGzn8p+tR2T0tPlvfvUnsCx+7wDR//Gfq4Tc+vY10yFZN0?=
 =?us-ascii?Q?vy5ht031MLrFuC/nI64dtwLHmKov6zBwV6FsAw5Y+fLACUNFD2sP1/+LsBzH?=
 =?us-ascii?Q?4abyxsHEkxhPceGTXY8gMA3juURuw3l70r9GaGvN1p4rhOLZtVVwsef7YXSp?=
 =?us-ascii?Q?ofLlsGhQVQRLtyohig5u9IMpUeeJpaq3WCHNAN2/9i7YqlVDI/Rrg5kLngvj?=
 =?us-ascii?Q?RGB3UwdJf3JbZgSrMMNJwxaS1UEKNZ6xiqATvm+DSbHSdi+HPHv+Td6pN+Gf?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 035305a6-0705-408c-31d5-08dcbc63c224
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 13:19:42.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhGGGiIHc92W/CUx0ccOSEECTK7gTmqtXHmfbY/q4rUX0fIbJuAcOVwY/rME1Bdz9FIfhrBnyZNCh/RrFsaoSAtODCymS62MyAKMSO1tp6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
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

On Wed, Aug 14, 2024 at 09:25:24AM GMT, Gustavo Sousa wrote:
>Quoting Gustavo Sousa (2024-08-14 09:03:11-03:00)
>>Quoting Lucas De Marchi (2024-08-13 12:21:41-03:00)
>>>Choose a checksum algo and use it to print when parsing a firmware.
>>>This may be useful in CI to dump what is the exact firmware used
>>>and may also be useful when inspecting the firmware repo and making
>>>sure mistakes are not introduced. Configuring intel-gfx-fw-info a diff
>>>driver:
>>>
>>>        firmware $ echo "*.bin   diff=intelfw" >> .git/info/attributes
>>>        firmware $ git config --local \
>>>                diff.intelfw.textconv \
>>>                "<path-to-igt>/tools/intel-gfx-fw-info -c"
>>>
>>>Example for the LNL update that happened recently:
>>>
>>>        firmware $ git diff --text bc42cdc34bd8 b5bef5bdbab1 --  xe/lnl_guc_70.bin
>>>        diff --git a/xe/lnl_guc_70.bin b/xe/lnl_guc_70.bin
>>>        index 785763163..75a1958f7 100644
>>>        --- a/xe/lnl_guc_70.bin
>>>        +++ b/xe/lnl_guc_70.bin
>>>        @@ -1,3 +1,3 @@
>>>        -version: 70.20.0
>>>        -date: 2024-02-09
>>>        -checksum: 0809f459048a23716fd3019074f36812163e027835cbb43acfcfe72cd83fb0cc
>>>        +version: 70.29.2
>>>        +date: 2024-07-26
>>>        +checksum: e7ceae28b06bd71c53fe177f4f6787aac88956d8944fa02b1ab2ec53b1e961e4
>>>
>>>If for some reason there's only a checksum change, something went wrong,
>>>and without it we wouldn't notice when using this tool as a diff driver.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>By the way, "Dump GuC/HuC firmware header" is not a very accurate
>description for this command anymore, since we skip doing that after
>this. Maybe extend this patch to replace it with "Dump GuC/HuC firmware
>information"?

yep... I squashed this I'm going to push. Thanks.

Lucas De Marchi

>
>--
>Gustavo Sousa
>
>>
>>>---
>>> tools/intel-gfx-fw-info | 17 +++++++++++++++++
>>> 1 file changed, 17 insertions(+)
>>>
>>>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>>>index c0d9b00ac..31dc78776 100755
>>>--- a/tools/intel-gfx-fw-info
>>>+++ b/tools/intel-gfx-fw-info
>>>@@ -6,6 +6,7 @@
>>>
>>> import argparse
>>> import logging
>>>+import hashlib
>>> import sys
>>> import typing
>>>
>>>@@ -151,18 +152,26 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
>>>
>>>     parser.add_argument("-x", "--raw", action="store_true",
>>>                         help="Also print raw header content")
>>>+    parser.add_argument("-c", "--checksum", action="store_true",
>>>+                        help="Also print checksum")
>>>
>>>     parser.add_argument("filename", help="GuC/HuC firmware file")
>>>
>>>     return parser.parse_args(argv)
>>>
>>>
>>>+def calculate_checksum(f: typing.BinaryIO) -> str:
>>>+    return hashlib.sha256(f.read()).hexdigest()
>>>+
>>>+
>>> def main(argv: typing.List[str]) -> int:
>>>     args = parse_args(argv)
>>>
>>>     cparser = cstruct.cstruct()
>>>     cparser.load(CDEF)
>>>
>>>+    checksum = None
>>>+
>>>     try:
>>>         with open(args.filename, mode="rb") as f:
>>>             magic = cparser.magic(f)
>>>@@ -171,6 +180,11 @@ def main(argv: typing.List[str]) -> int:
>>>                 fw = FwGsc(cparser.uc_huc_gsc_header(f))
>>>             else:
>>>                 fw = FwCss(cparser.uc_css_header(f))
>>>+
>>>+            if args.checksum:
>>>+                f.seek(0, 0)
>>>+                checksum = calculate_checksum(f)
>>>+
>>>     except FileNotFoundError as e:
>>>         logging.fatal(e)
>>>         return 1
>>>@@ -181,6 +195,9 @@ def main(argv: typing.List[str]) -> int:
>>>         print("raw dump:", end="")
>>>         cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
>>>
>>>+    if checksum:
>>>+        print(f"checksum: {checksum}")
>>>+
>>>     return 0
>>>
>>>
>>>--
>>>2.43.0
>>>
