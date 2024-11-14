Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D164D6A239
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 21:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F0310E06C;
	Thu, 14 Nov 2024 21:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZxenC8O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500110E06C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 21:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731620738; x=1763156738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X+QaSSqeE8dmxyYF7BJYV+vM8ii4FFOralBx1Af75Yg=;
 b=bZxenC8OFDjcWLCCbGY8yNBSHv1ELopj9zV1b+ihBz71Uw23g/wpuybW
 ACw8aTcoPZkGE4SyHLg7Ei0dMEU/4LIyGiI8VKNXekgewj3PwPbqxFpAH
 SfOoWFp8iESrBP+yW7G7AgTVkA42sBgMp93rJMZV2u80WlX09w4VjD2VR
 2OmSnkyb6CeRzjBufg6vI4ihZLtrxLZoFm/1tBLMWTTBcYD8jhFOQAY9M
 VOFxzS1zMvc3g4/aeA0ji5ePi6ngyJ495vG+uHI/EEbdUdmE15EUem7FH
 V5RwUMnudNxnLjpQKH+QAz5Mg7qexLw6EuOwmqfWicMStC1JhbICkJL+E w==;
X-CSE-ConnectionGUID: cLxxVhWKQzir7uNYGY0/ww==
X-CSE-MsgGUID: urrYTvUHREe/JZPw8p0L1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34460907"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34460907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 13:45:38 -0800
X-CSE-ConnectionGUID: n3V4nVXjRh23f62C/ZDk+Q==
X-CSE-MsgGUID: LXLGojqQRFWfPnSYTAnUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93165325"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 13:45:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 13:45:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 13:45:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 13:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4LwlI3B3DeiXcv/NOsFkHbenK6FnWCRA+c+x9sJe1U+jPVi3pvBaC3g5N+4smESm6+q9MfDnYU5Xk3xbjyl8QdeGJJQRENQOTTsynv8YSwmPUU55OEWA42fxSdm0t87Tl6dVixmWWKGzxHTo6HUd7VJq8MJ5b3Gux7IvjsqiF82pr12tcMUrOt1smGHt8DpSwRjV6RQqKU/GTufmcCfX6quCBCiL0uFlGUWBOIa9+JKqcDjWPQDumPxV9FNkT8hEKMdw4PINFzObiF6OXOTLqC9YFnfQQaw3/287soTP9qZvlkL8vHvyUQUDZUXxEs8YDny28UlnoQ3YyruZsOe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+FIHxOZICULFuDW1DIngQmh/uHw5yjbV8poYIhnz4k=;
 b=vPpL33FANDEOxz4LE9jjF3RgG8ITirGCT97PnoR8bTu7W4LHVMuI2AgLL1QmcwreKQ3MUHEWiy7u3Txu/Li8CVQ/Tb94MF8sNJRXKU+p+L+vfKz4W2ANjczyI5TU2nUOgw6D18RCxsv+Rs5q+w4y9GAHoGwdmua4rPN0ncQPgQXFhhgGXBlWT9VdPHpfRzwW+J5n0UuSikwy0PfN7y2aJ9ZZJ+PzcGF3XtdZ5NY5l+PGzeJRmNc7Apq1MlRY3SLDsajnp/5bjFGL8gQyllNEydsbukDVQNhPooF3wfwJnlLVMeSekwwdLQbFzvFirdF7q9vWbKWhm2S0MmDLBugYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 21:45:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 21:45:35 +0000
Date: Thu, 14 Nov 2024 15:45:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 3/6] lib/igt_kmod: Stop passing debugfs_dir around
Message-ID: <ifbkjfee5mxgsfd2cb2iujwsbvjs7ihcaawh5744rykp7iyauj@gkz37h7x2uhq>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <20241107055254.3129207-4-lucas.demarchi@intel.com>
 <6824673.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
 <yjqplst5ycsfcggndbipsgkeke75n6nqao3rthdja3273u5xju@agdth5sqx7pk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <yjqplst5ycsfcggndbipsgkeke75n6nqao3rthdja3273u5xju@agdth5sqx7pk>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4511bf8a-31d1-4cca-af0e-08dd04f5aba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xE5xeTTqfiEimfO4xeNtT6ETwTcxAl/OERZj7JCGxRzyEnDeVFtgxpjuOctk?=
 =?us-ascii?Q?8lutBds2pkSgPvz3Xrtgo3wetadObPaCcOV/jwfUhRoWzTa6bEh071cWyGE8?=
 =?us-ascii?Q?bQWSGduQQ55kQkgPTyLmEGoKRcLeOP7q/RKUdhW+d1XYjpQ37Mah/BGi1AlR?=
 =?us-ascii?Q?NKMKc7iVpkswoS5y2oFey72PsNQsJAQWSboaO+t0uFBW/H1OPDB3Lnutjteo?=
 =?us-ascii?Q?qUnkJMFfOfgJF3gOQtLYJSKjQXbzekUl1Xjte+/QcVGls+1bVdetK/Gycj2u?=
 =?us-ascii?Q?wiIoN1ful3o13eJDJr97BuyiKsy1xWnXtV/y6vecZsVdi70SGFv2L9TulJcQ?=
 =?us-ascii?Q?hqb97+XEVWSMY3osy5EpuwqZYKk0wxLaCnPsBqptTmradmovYh7r5iNvJm4+?=
 =?us-ascii?Q?ShmjRjKMZ2pQI/Pji/i0yOqzGCx56ndoWW/hUXzRUtUvnwFUhlsbZkK/j8rt?=
 =?us-ascii?Q?caAqRjibgXzY8T2BfYSbDGFUy3lLzKSsUnaeORVbPRVt6zT/ztDgzSBj15t/?=
 =?us-ascii?Q?YC2/JQgpIcfzCQN8iEwTqNoMIA/VzJvlhD2GuHUb+InYEpam2cwvTjOer8NB?=
 =?us-ascii?Q?Tjqnlx+FGvj02PNFZ6vjaXoYXJHSTI3y7E7yDCn2n76bnGbRydcARlshu8bS?=
 =?us-ascii?Q?kQk7fqZN1snWjy1JzDl8/TzYyAz06H/T+XQqUiP7NfDSnJuad/UHTtN3mWdl?=
 =?us-ascii?Q?yGsu4wGRa4b/dfBlTnQGeVJyztSjnVP9U9HAtbM+b4NOc6bmHBvjtElAN1mL?=
 =?us-ascii?Q?WCCso1TZ6TtokNwnWeg4ZvJephd1C0TIGvqKLvMADxCRwmisZ59l42QgLMa6?=
 =?us-ascii?Q?qRFyCtlUitmdUuHxHxCPzNzEFszJYg13o/UB6fUgRhWdqWEn+BT3Su1v91di?=
 =?us-ascii?Q?UK6qUA+sDBAuUaHBVZTuXAAqddYyHsKF/LBEyIE0wVXirHFvThlYjcDGc5/Y?=
 =?us-ascii?Q?IsgOWer1bKND09tutmUZEK9wBMAlBL8demsxXLXuYo3kt8DAjg6pGneku6pr?=
 =?us-ascii?Q?Xv69xQteW4tl+4HnxCD0dLFnmtGoUXK9xD/GsGMVuCLDoNf5s9mDz6oDfCJS?=
 =?us-ascii?Q?PkJvWUbo26GILKkIyScIbzf+M+4uDGNXEdsBsdTHkdCefUqQDAv7xr7vxY75?=
 =?us-ascii?Q?XfpFCVOipjmnztKe+EkC7YpC40JJZhqyfZ70OzMkM64b1sPTmZkSt9iwRphy?=
 =?us-ascii?Q?Z1rDtktKffpHckJ9BMpANGgFpo93O7plJtyV0pu5+vV2sZj5WYWn/OpQcQnO?=
 =?us-ascii?Q?CnbQYZVUFaAgi2OwJnsjNX4hgwQmZxjyNPgS5WZ5GR0jgcNt4sFx2gM6Z+Ec?=
 =?us-ascii?Q?W+8j7ZAH59+JqrbI40nFeCgG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k6laZDctfJJMLi15S632sj2agvBU3wEYDlKlcNkDvfsR83Vwem6GT4BZG2ik?=
 =?us-ascii?Q?HZGqsLc0IkHqFQw0xc+XjtZMlKqIc1ykD1pSGXCBG0ISuZdMPYbryZWALwQC?=
 =?us-ascii?Q?XLH231Dicv0m3eRSkpPQZINDPx3e/bhkae1DBGSgiF/NmmDiPnLeOIsMnp6g?=
 =?us-ascii?Q?aFVZsOoQJCCneoOPMGnKxDPrenZ/Wf9f0Da5f6rHD9W8XnvNhDc8jAMfbfUh?=
 =?us-ascii?Q?NJlG2pIcV4qZvUzisWUwNgmGEwdX/TVE5O2KsiALwhK9M2ekcjkc9jf6gUY5?=
 =?us-ascii?Q?jdii8gxz1L1PfnQHLHE2GDTxnLVa0E+0z928ewUD91jDrmSATKCmOTFHRPS0?=
 =?us-ascii?Q?EXRqjMMK8rGo7nPuLmCIrLNecY6HLemLZGE70RSvcF+TTfCiGU0lloxJ/6S2?=
 =?us-ascii?Q?TEbxMnqblWqgQC2Tr8dSYtQxq8lhlKnPaUA5H5v+k8OqL9evjoeoqAtZRTDp?=
 =?us-ascii?Q?mvSUSW0ApRFBdqGGLSzZiIFfRgQ+2wVLIHfQ2oqPLORvE9i1ypGYvJeznw7o?=
 =?us-ascii?Q?W+BaO+YrG80xAE1aVl/hslNi1cPp/+eC4/u6mJrGpKinsw9UCWxjKg/VRZTm?=
 =?us-ascii?Q?bJ1r02BhG3GhHgmHnA458TSiiLhPDZKwvnG6jMrMwqPyOfCqeY9UnyWTrP5u?=
 =?us-ascii?Q?oVplOGGErnoM6sSPtxkPtuYrgJSztIFhDBA9V0pvX0VsXP42LGzA6sdiHM8i?=
 =?us-ascii?Q?Vf5jik7STYkXYIGCsUYiKaoZMWqVX7cngp5muuIhFQIGkK32P3DQCeVpSq6c?=
 =?us-ascii?Q?WpZb0lMGLyRgdvpN+JKV0/fcvi18xNrLVGl5tCnjcr5FYGuoyA3A4Tthf25k?=
 =?us-ascii?Q?M4qLbFQmDuLRaF34UcBaqE6ypswmrKlwLP1snIe5jBRBtKfqbx60voobFV8C?=
 =?us-ascii?Q?c9/24EPYnBHZ8ZAT5cms4gsG3nHOw6zRyXbC8qi+hSHU/gI/E1t4c/cmsMAw?=
 =?us-ascii?Q?SjQSwoHF3xFxyLfx+1p2+xwxVrOTlPdoZ+2Rd9OXLDCa321zsyZFrlKF0q0t?=
 =?us-ascii?Q?JytxXoxC8qctb1AMcXPVopyeWtN806aD8OkSeQDz3bcX/GHrojjyjmvMt8Yx?=
 =?us-ascii?Q?sQUgkIupOmL8xjsIJWaHaC3OV4D9ORwQ2eaJMrFVjc+xQfKtixOHUZEb9XAS?=
 =?us-ascii?Q?FT67ndNXHrJdGHE19dt8PRod2WCSNZE43wdA2x+3FKc8qW3wzaEAQEOArjE+?=
 =?us-ascii?Q?bdxDR/8qXMNZE2jYJR9pPL3ZzyZEM8E3IhXokVAJW8zgDImu5Z9yBW4f0hhP?=
 =?us-ascii?Q?gvqFdWWNxqVTBGJW7rwfPQcnb/O9vmGEIicjnJrwMlObrmBeFtvgxAG32jxB?=
 =?us-ascii?Q?+8VJEG/GGMJc7h3dJL0QlAxXT0zpz0h/T+bSvGp8P/7PyBjjw5LNozs4mhGs?=
 =?us-ascii?Q?2rCh/VuL6/w/CxPYLhiOI5gV730MGt8VN2A/fpjP498XLxoH+hfRP0Rsw2mJ?=
 =?us-ascii?Q?NmsxiXs8WYwbn24O5qWxy8StVOE1b8HhBENQNeJOjpBZuXEA3XRYwTa+xrs5?=
 =?us-ascii?Q?h+3teNg+DrFoDLnPVX7QCKiJke972LD7i46GvnsbfEznDPmVOgLlFgUy3q4A?=
 =?us-ascii?Q?OHrpq5W+NQcHbJISKmqoM/cRyKoJKWTl44rZ4xwo0Td70PAURNnTPi5Dto7/?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4511bf8a-31d1-4cca-af0e-08dd04f5aba6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 21:45:35.1686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHyfriBamRUd4hG1AuA4pUId9IpNRtcpQuM0fsdrj9O9Znf6C32g26C/ARpdC5LfSyXelI+WgbVMPtw25dmhnKVlrtsIYqAGa3wY5heprKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Thu, Nov 14, 2024 at 02:58:49PM -0600, Lucas De Marchi wrote:
>On Thu, Nov 14, 2024 at 03:24:39PM +0100, Janusz Krzysztofik wrote:
>>Hi Lucas,
>>
>>On Thursday, 7 November 2024 06:52:51 CET Lucas De Marchi wrote:
>>>Just open and closes it while getting the list of tests.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> lib/igt_kmod.c | 27 ++++++++++++---------------
>>> 1 file changed, 12 insertions(+), 15 deletions(-)
>>>
>>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>>index 3729a053c..36578aa68 100644
>>>--- a/lib/igt_kmod.c
>>>+++ b/lib/igt_kmod.c
>>>@@ -1038,15 +1038,15 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>> 			    const char *suite,
>>> 			    const char *opts,
>>> 			    const char *debugfs_path,
>>>-			    DIR **debugfs_dir,
>>> 			    struct igt_ktap_results **ktap)
>>> {
>>> 	struct igt_ktap_result *r, *rn;
>>> 	struct dirent *subdir;
>>> 	unsigned long taints;
>>>+	DIR *debugfs_dir;
>>>
>>>-	*debugfs_dir = opendir(debugfs_path);
>>>-	if (igt_debug_on(!*debugfs_dir))
>>>+	debugfs_dir = opendir(debugfs_path);
>>>+	if (igt_debug_on(!debugfs_dir))
>>> 		return;
>>>
>>> 	/*
>>>@@ -1057,21 +1057,23 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>> 	 * we already can do perfectly -- seems to be more safe than extracting
>>> 	 * a free text list of unknown length from /dev/kmsg.
>>> 	 */
>>>-	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
>>>+	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip"))) {
>>>+		closedir(debugfs_dir);
>>> 		return;
>>>+	}
>>>
>>> 	if (!suite) {
>>>-		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
>>>+		seekdir(debugfs_dir, 2);	/* directory itself and its parent */
>>> 		errno = 0;
>>>-		igt_skip_on_f(readdir(*debugfs_dir) || errno,
>>>+		igt_skip_on_f(readdir(debugfs_dir) || errno,
>>> 			      "Require empty KUnit debugfs directory\n");
>>>-		rewinddir(*debugfs_dir);
>>>+		rewinddir(debugfs_dir);
>>> 	}
>>>
>>> 	igt_skip_on(modprobe(tst->kmod, opts));
>>> 	igt_skip_on(igt_kernel_tainted(&taints));
>>
>>How are we going to avoid leaking the open debugfs_dir descriptor if one of
>>those igt_skips triggers a longjmp?
>
>ugh, you're right. I hate these longjmp :(. I wish the require/assert
>would be left to the *tests* and lib code act as lib code :-/
>
>I will drop this.

humn.... what do you think about keeping open/close in the fixture and
just removing the pointer to pointer? Something like this:


diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 3729a053c..2b96d2c45 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1038,17 +1038,13 @@ static void kunit_get_tests(struct igt_list_head *tests,
  			    const char *suite,
  			    const char *opts,
  			    const char *debugfs_path,
-			    DIR **debugfs_dir,
+			    DIR *debugfs_dir,
  			    struct igt_ktap_results **ktap)
  {
  	struct igt_ktap_result *r, *rn;
  	struct dirent *subdir;
  	unsigned long taints;
  
-	*debugfs_dir = opendir(debugfs_path);
-	if (igt_debug_on(!*debugfs_dir))
-		return;
-
  	/*
  	 * To get a list of test cases provided by a kunit test module, ask the
  	 * generic kunit module to respond with SKIP result for each test found.
@@ -1061,17 +1057,17 @@ static void kunit_get_tests(struct igt_list_head *tests,
  		return;
  
  	if (!suite) {
-		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
+		seekdir(debugfs_dir, 2);	/* directory itself and its parent */
  		errno = 0;
-		igt_skip_on_f(readdir(*debugfs_dir) || errno,
+		igt_skip_on_f(readdir(debugfs_dir) || errno,
  			      "Require empty KUnit debugfs directory\n");
-		rewinddir(*debugfs_dir);
+		rewinddir(debugfs_dir);
  	}
  
  	igt_skip_on(modprobe(tst->kmod, opts));
  	igt_skip_on(igt_kernel_tainted(&taints));
  
-	while (subdir = readdir(*debugfs_dir), subdir) {
+	while (subdir = readdir(debugfs_dir), subdir) {
  		if (!(subdir->d_type & DT_DIR))
  			continue;
  
@@ -1089,9 +1085,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
  			break;
  	}
  
-	closedir(*debugfs_dir);
-	*debugfs_dir = NULL;
-
  	igt_list_for_each_entry_safe(r, rn, tests, link)
  		igt_require_f(r->code == IGT_EXIT_SKIP,
  			      "Unexpected non-SKIP result while listing test cases\n");
@@ -1232,6 +1225,9 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
  		igt_skip_on(igt_ktest_init(&tst, module_name));
  		igt_skip_on(igt_ktest_begin(&tst));
  
+		debugfs_dir = opendir(debugfs_path);
+		igt_skip_on(!debugfs_dir);
+
  		igt_assert(igt_list_empty(&tests));
  	}
  
@@ -1244,7 +1240,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
  	 */
  	igt_subtest_with_dynamic(subtest) {
  		kunit_get_tests(&tests, &tst, suite, opts,
-				debugfs_path, &debugfs_dir, &ktap);
+				debugfs_path, debugfs_dir, &ktap);
  		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
  	}
  
@@ -1255,8 +1251,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
  
  		kunit_results_free(&tests, &suite_name, &case_name);
  
-		if (debugfs_dir)
-			closedir(debugfs_dir);
+		closedir(debugfs_dir);
  
  		igt_ktest_end(&tst);
  	}



>
>Thanks
>Lucas De Marchi
>
>>
>>Thanks,
>>Janusz
>>
>>>
>>>-	while (subdir = readdir(*debugfs_dir), subdir) {
>>>+	while (subdir = readdir(debugfs_dir), subdir) {
>>> 		if (!(subdir->d_type & DT_DIR))
>>> 			continue;
>>>
>>>@@ -1089,8 +1091,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>> 			break;
>>> 	}
>>>
>>>-	closedir(*debugfs_dir);
>>>-	*debugfs_dir = NULL;
>>>+	closedir(debugfs_dir);
>>>
>>> 	igt_list_for_each_entry_safe(r, rn, tests, link)
>>> 		igt_require_f(r->code == IGT_EXIT_SKIP,
>>>@@ -1197,7 +1198,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>> 	char debugfs_path[PATH_MAX] = { '\0', };
>>> 	struct igt_ktest tst = { .kmsg = -1, };
>>> 	struct igt_ktap_results *ktap = NULL;
>>>-	DIR *debugfs_dir = NULL;
>>> 	char *subtest;
>>> 	IGT_LIST_HEAD(tests);
>>>
>>>@@ -1244,7 +1244,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>> 	 */
>>> 	igt_subtest_with_dynamic(subtest) {
>>> 		kunit_get_tests(&tests, &tst, suite, opts,
>>>-				debugfs_path, &debugfs_dir, &ktap);
>>>+				debugfs_path, &ktap);
>>> 		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>>> 	}
>>>
>>>@@ -1255,9 +1255,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>>
>>> 		kunit_results_free(&tests, &suite_name, &case_name);
>>>
>>>-		if (debugfs_dir)
>>>-			closedir(debugfs_dir);
>>>-
>>> 		igt_ktest_end(&tst);
>>> 	}
>>>
>>>
>>
>>
>>
>>
