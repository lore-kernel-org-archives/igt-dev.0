Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3A3CD6E5D
	for <igt-dev@archiver.kernel.org>; Sun, 31 May 2026 15:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC23510E6A2;
	Sun, 31 May 2026 15:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9SuXaPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940010E6A7
 for <igt-dev@lists.freedesktop.org>; Sun, 31 May 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780243080; x=1811779080;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=SsyvyE0DObmfDaa31sPUiJY9/YxH/BUnlsnqVxOWSNI=;
 b=i9SuXaPDWlrnNexJ2ofk6EHxNa8l28HBI/HZImm8yu0svdfpxWGS+UIi
 1OOEQcfbze17k9lyN5tl1w4jowgwj8eJPHho/pIaX9VnHMsZM7JyFmhi3
 rkhqodJWsnoVl11lE07u/Lfw4xT2n//fHvPgv8lEDhy1TDr8CqbC+L4Fo
 kxol8DN2+7nSCn/LSDe3L9SAuLqD31ITWELXH3exeq0oDnDS4k5a0NxF0
 3qW9Q4lrYl0levSHmhDDGeHwwMCABs+hXeZBssc5HtaV2ilHAoxHWqFAP
 hOoIu8QHcxLBorzbtns/fkefjUjnakWWOJUuwsgpJD898u9yUb35EgFmd Q==;
X-CSE-ConnectionGUID: nOGUrGlOSmqJ622xfS06vw==
X-CSE-MsgGUID: 8cmWKnJJQEyMiPmd0tloyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84904776"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; d="scan'208,217";a="84904776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 08:57:59 -0700
X-CSE-ConnectionGUID: RhQz4KvuROGo/974gj8KGw==
X-CSE-MsgGUID: UUv7leo3R0S+YazCsdtdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
 d="scan'208,217";a="273635079"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 08:57:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 08:57:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 08:57:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 08:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlUc87jaPUT4C8kAP5CQ+WsTUuHFNsIOnahqbGzRm29papAALO7CnhAqJkwzGqqHOckJytKRcJQD6Q9StVCJHhdpJGHkgv4zFlzRAh6hG+evIwv5gQYzkf2JtmiTONGWs8xujNzRVuKtHq2r7AZ9HN8ITNA3F6ekCyjtTFOuF5wxPYhXO510KG4WfljiYRJyVcUuZLr/8XplR7r8jfBQMYgUOVQvFmSBDNlLh94VZmlP0vE3LXRGNqJ3OjS/iO+ySWvvWI9OvOcj3yFotmxlz4tJGBEvjrd6QJ0ntnIylu591sczjxValfwhv5CNVv3vZSQChIaiByN5PS7CytTOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjE2u7EXHd2PkKZ2h3J/W51T9IKthT+0h0hqNLjgVnE=;
 b=kXCx02jc/+nan34oXN4lXhbBUkATsTbvjkuB85+Lgov4GH33dgBEZf3gSqOlKDUg9r5wfuZO9ByQzhLwUTbpQ3pgm+YcXs1zRkaE0VQEYvPCD7lWDfObCtB2nVJ4ZqTcUyUksfgSWqoNPY7jRwM4tGFa5wpntgL3RSddeQkrWrC7gNv8nJ+IRw4t7ehvPYuNHTpgdE3nx0epbud7vHmu1AThxsBD/NM+5Qh4RFHkcgcylkfOl516upFi/Gu/9ob0M8uU80b4CFsAlDfrr7rLDZydpqYbhgZ58lu3tevXfRR+dihE0smzIUEr1Rs7nTbiUWVAYLweleu+tZinvDuSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 15:57:54 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0071.011; Sun, 31 May 2026
 15:57:54 +0000
Content-Type: multipart/alternative;
 boundary="------------oEJMrFBVcESV0IE94neuL5dg"
Message-ID: <c42f4242-fe10-4654-a762-1615c6bdb844@intel.com>
Date: Sun, 31 May 2026 21:27:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_hdr: Use non-modeset commit for HDR
 metadata swaps
To: <igt-dev@lists.freedesktop.org>
References: <20260527193104.2533212-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260527193104.2533212-1-swati2.sharma@intel.com>
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beccfe8-6b0c-44e9-7180-08debf2d6021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799007|56012099006|11063799006|6133799003|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lmatQvlZUJ0PA3epCMFFxpq7WSgGrpkXdaknVm5uY2E0shlAVhfELl8yelvvs+DgVpaSlUghyknuuFRTGQhwmhxyf7SpzEITErQLBCTe2LzDH1sfRXTmGjsu15BYTZdYveVAddNPluksgqPJMH5aKP8/ABqNi+GHj2EsyycBA1DtUTR8esOJVc5eRYMECSpZPc1OOnD+0gu9vTmyVKTuuWARsZdTxkr4nM6pqrC2/3cFMRhp3N4va43RdT97UZ7thMWRN/GeCNIqYKESpWoE99dyRUvBvkoGrgVqX2UPMO33gEbnv9cqs/wHGNYnrgRL1nsQjonNbwpRkoaX70kIQiC3QPviv/6c142lb3H3EdbPp/VCfou9ZN108alts4EJjCvxmyMxOyR7m7dXhUbtKebOcZPDaDXOEoh5q3GaF+OhefSrgkqzWS5r5io7Tj0makkQcDrhxa83PsVUQBzUMcG8hZcGfV0ZwXRs54jrgEGKx+c0836ucz3I8DZ6ckYnkwoG5gx/s4n2v8STHVuxHfJoOUqgsk00ePRSMGa4BsTeNSy5+Lu5frw+xhn3tnXkxxjKKAJZJZ37Jgnq5iFUMIhSdbhHf1xc1xNvNbizdMdP4d8vpmwTNpO9TeVgOMNr+pXLHu2dQ6diGxCevZdFLM9SXL7ksqIhaBs3hi89kKPIFOzEvaDqCX4LqiSc9Zj9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(6133799003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnEvT215YjlNWHVFTzArZ2VkQktyL1I3Z0IxVG9nM3piaVhkRzB1dENqenM5?=
 =?utf-8?B?bXdOT0ovUDljTWl5TXpYRHpzMVJVK1J6TGx6OU9uYUpmdW9DMnFvU0FuMjZU?=
 =?utf-8?B?M3A4cjl0eFdXdDJ5UFM5enk4VFNmdGZZTE5yekFHTEJIUWtKeFNrcm44bk5n?=
 =?utf-8?B?NW9YVEZwNjhISjhkcmZPWHhtaUlUUmlWWDk1RWV0QVZpRk9sRnNWMnN3QjND?=
 =?utf-8?B?VFAyMzFjY2hrVTJrUDVSRGhVemRmRWdvRkZEWGNiUXlEcFoxejhsRW1FM0ZQ?=
 =?utf-8?B?QnBTU0xIemVDRWVCY1V1ejlVN1piMWJqMUxTclZZaitXNml2N2Y0aWZNeXVh?=
 =?utf-8?B?SzFya0dTZ21IK2x2cjBXNk0yeWMxa0NJNUFGYXJ1Y09SbE8xN2VyZTRLa3dN?=
 =?utf-8?B?TU5MNWhaRkxDODE3bysvdVZySmc0MkJ0NU10VG1lMWxRQklvT3hQelNsZTFC?=
 =?utf-8?B?L3o3emN0dDBMbkp6a1NjU0lScUNRNWY3RXFxMGNJMkVoYWR0NTZhdXNyZTVx?=
 =?utf-8?B?TmxWSFlTK2d2S2VDa2txZkNOWTRzMmpaZnZqVzNCdEVvQU1VRHFyWWNPMndr?=
 =?utf-8?B?UkQxazBGdjhzaTMyRHFNQXJJQTFmcXlvUUVoWE1kY2RYMmVuaEFRTi9Odlhx?=
 =?utf-8?B?WVNIbTR0aUw2TUZXVkxvZXhoc2Mvdms3S1p3eERtdUhWSGVmcisvRGFMRGsx?=
 =?utf-8?B?M2pyQ09iS1BKNFFlYlRUMEJNSUhObzVJNDMyRWFEZ1lFTEVXK0JreDFmYmd3?=
 =?utf-8?B?ZjVKempFNEhza2JaYzZwVnR0N0o0N1lTcVhsUkx0aWVEQmdEOTgwemNGUTcy?=
 =?utf-8?B?aWhrTUZWU3JRWGFLVCtacXdxenh6SHVMSnZmWU9lOFNOajhXWkFHeStjMFBo?=
 =?utf-8?B?Tk1SaC91RXFPdXZ4Z0VlRGVEOFl4VElOemFzeStxa3E5NlVhdy9IK2Y2SkdX?=
 =?utf-8?B?TzFOUGhBRGN0UmRSYlg2WmNTYS83eVBpMU9haTdkcUdDa2diZEVIdHU1c0Vw?=
 =?utf-8?B?WEcrV0piQVVQc2RnU3RIMUN2aC9KZkFwc2VFTGZPK1NUY21DTlNvRVhHQ01H?=
 =?utf-8?B?QnplN09TUGs2RjkxalBXTnBrcWRpU2drK1diVkdrS2NXQ09oSnE0cXVuV3RO?=
 =?utf-8?B?SFdZNHFxT1hJQ2hqWk5uV2U1S2pJWjQ3aHhqaHJDWU8xTUZkWmJnODNjaDNm?=
 =?utf-8?B?NzdmZlNLZDh0UjlPUGhCdHpnSzZFVFVpcVNET3BTNndoVGtCVUJuRlc2Unlj?=
 =?utf-8?B?bzdkaG4wVDhvbUtENWVZaW9NSWRibmNIWWZlR24xbkFaYzdMRFozd05jR0hL?=
 =?utf-8?B?Wnd0OHhrRHZxMkYxc0lwdHV2L3VkeThMQWViZm9qK1RYN3JaNzc4cmdBd1pI?=
 =?utf-8?B?Y1pSaWVHQ0ZzZFFqcTNCd1ppOUpzdWQxVHdtUWpicmFJVHoxckk3T3hhQWpy?=
 =?utf-8?B?YjRaa0dhamtWVzR5WVNVODRVVnAxVEwzQ0JSMHNmU1B5WmQ2ZnJya0kwZGNF?=
 =?utf-8?B?Zk44TFdPM0NZMDZNbEtCSGpsZW80aGZiZ3NwT0lZMXk3OTBBQ0FBcHdhUmNi?=
 =?utf-8?B?a3FBVkMyNWtqQVJxNmdOaGNVamtoVzF4eVUwWjlQbGtWSTlXUGdiOGFkeFdT?=
 =?utf-8?B?UnlPaE1TaUt0TVhONmlSazVJeGNLdFA1MkpBTlJZRlBva01BL3llZVdqQ2ds?=
 =?utf-8?B?TENQbXAvNGFDdzNPemtxR2VWdlp5ZDdiUGlxNUY1clBkZDh0QnF1aDMwWHlx?=
 =?utf-8?B?QkYvWUdUYVdieHU1N1UrY2gzdFhYdkxLdzVKcU13ZjVMOGRvUXVUOFVKQnZj?=
 =?utf-8?B?NHVhL0JYeUpqcU9KYWYxVm5saWlMM21TMlZVdGJrUWdNcldHU3V5Y1ptd0Rt?=
 =?utf-8?B?QTJlWmxkRkxWTXd3azltNVhVNHprcWlrdGE2SFk2Nk4rZW52UUg2eVVHb2hk?=
 =?utf-8?B?QTdsS0FIVFVMVmRBd1dRZ1dONFN2ZWRWTHRydVl0QllMWHhiaVF1UXNnd0VX?=
 =?utf-8?B?WmNwbWhlbUtGeHdNNWNodCsxbWtJOVg2Z1NTMi92M0lLaDExc3FCNDN1S2xB?=
 =?utf-8?B?N0wySEJReHVkNVcxNHhnc3ROV3JxNmZDVnRZT2t1L2VUSklJc01ocDJydTJw?=
 =?utf-8?B?SmtVaUxySnZoc2lLSEZwRzJzSU1Rd1pkZjBwWVl1UFM1L3NvM3FUNTdTMTZa?=
 =?utf-8?B?NGtrclFhSWpGRGVpeGdSd1BzekZhUnMzQ0orMDJxM21VcEtscHFKWWdwblRS?=
 =?utf-8?B?a2ZDU2RmZlR1L015Y0R2VjM0YlB4NkRkdnMrMTZXZXpXVUxheEdOdjV5bCti?=
 =?utf-8?B?UjZRMmhBY2tNODMvNnBLY29jdVBibUJQekVOTzNoVWphOVZaZHVmVFE5eUhM?=
 =?utf-8?Q?7ZHh3zt3zTNVq6eY=3D?=
X-Exchange-RoutingPolicyChecked: oVMuCkD2rwVoIdeYAQwwL485JvDLLrCQeBkL4wbuh4SC/vlgmXw6QsiNpoEDbNaJufQN0kHpC4dmQfdqXD2t5xcux+XcDmfjlSlN21EAOb3bNFWZ6KJ/KbC5Y82v79usRh9JZuwDW6mYUPKIa28Z3GHU3ZMZvmm5TPCfhkP8rrdM5Rjfm5HuGFl9L4okEZ4fL691DGFkhlNN+hwTy7ucMkZkoMMrUB2dq2Zw64XL3ES5Wc/kpkh02w3W/yQ/4DKxAYYsXipTcc4Vx9F5i9fc+q27YBBijW9bW/msjix/NyVPDDhT9ePrhNGWjsm+G/VvWB5Bfex01jmz3RxxsM7bLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beccfe8-6b0c-44e9-7180-08debf2d6021
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 15:57:54.3992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJ3eWDFMQoMwgE1dbw72lnHAsfcWHfg3imGHBSrLLqTsXwf9ppuIAH7yUyXK6K7tAIcSIXgIW0vrLUmQsh21FJGwpZnimPdkFSTUyoV/gwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

--------------oEJMrFBVcESV0IE94neuL5dg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Swati,

On 5/28/2026 1:01 AM, Swati Sharma wrote:
> HDR metadata transitions (mastering info change within HDR, and
> HDR-to-SDR via metadata) should only update infoframe content and
> not require a full modeset. Remove the is_amdgpu_device() conditional
> and use flags=0 (no DRM_MODE_ATOMIC_ALLOW_MODESET) for both drivers.
>
> Known issue: static-swap subtest with TEST_NEEDS_DSC may fail on
> Intel when DSC is forced for the SDR transition. The forced DSC path
> computes a different compressed BPP compared to the natural DSC
> fallback path, causing DSC parameter mismatches that trigger
> 'fastset requirement not met' in the kernel. This may require a KMD
> fix to ensure consistent DSC BPP computation between forced and
> natural DSC selection paths.
>
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/kms_hdr.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..3a38ae8e2 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -459,32 +459,24 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>   
> -	/* Change the mastering information, no modeset allowed
> -	 * for amd driver, whereas a modeset is required for intel
> -	 * driver. */
> +	/* Change the mastering information, no modeset required
> +	 * as only infoframe content changes. */
>   	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
>   	hdr.hdmi_metadata_type1.max_fall = 200;
>   	hdr.hdmi_metadata_type1.max_cll = 100;
>   
>   	igt_hdr_set_metadata(data->output, &hdr);
> -	if (is_amdgpu_device(data->fd))
> -		igt_display_commit_atomic(display, 0, NULL);
> -	else
> -		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_display_commit_atomic(display, 0, NULL);
>   
>   	if (flags & TEST_NEEDS_DSC) {
>   		igt_force_dsc_enable(data->fd, data->output->name);
>   		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>   	}
> -	/* Enter SDR via metadata, no modeset allowed for
> -	 * amd driver, whereas a modeset is required for
> -	 * intel driver. */
> +	/* Enter SDR via metadata, no modeset required as only
> +	 * infoframe content changes. */
>   	igt_hdr_fill_sdr(&hdr);
>   	igt_hdr_set_metadata(data->output, &hdr);
> -	if (is_amdgpu_device(data->fd))
> -		igt_display_commit_atomic(display, 0, NULL);
> -	else
> -		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_display_commit_atomic(display, 0, NULL);
>   	igt_debug_interactive_mode_check("traditional-sdr",
>   					 "SDR pattern displayed with traditional SDR metadata");

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
--------------oEJMrFBVcESV0IE94neuL5dg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Swati,</p>
    <div class="moz-cite-prefix">On 5/28/2026 1:01 AM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260527193104.2533212-1-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">HDR metadata transitions (mastering info change within HDR, and
HDR-to-SDR via metadata) should only update infoframe content and
not require a full modeset. Remove the is_amdgpu_device() conditional
and use flags=0 (no DRM_MODE_ATOMIC_ALLOW_MODESET) for both drivers.

Known issue: static-swap subtest with TEST_NEEDS_DSC may fail on
Intel when DSC is forced for the SDR transition. The forced DSC path
computes a different compressed BPP compared to the natural DSC
fallback path, causing DSC parameter mismatches that trigger
'fastset requirement not met' in the kernel. This may require a KMD
fix to ensure consistent DSC BPP computation between forced and
natural DSC selection paths.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/kms_hdr.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index affd38887..3a38ae8e2 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -459,32 +459,24 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 
 	igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;ref_crc);
 
-	/* Change the mastering information, no modeset allowed
-	 * for amd driver, whereas a modeset is required for intel
-	 * driver. */
+	/* Change the mastering information, no modeset required
+	 * as only infoframe content changes. */
 	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
 	hdr.hdmi_metadata_type1.max_fall = 200;
 	hdr.hdmi_metadata_type1.max_cll = 100;
 
 	igt_hdr_set_metadata(data-&gt;output, &amp;hdr);
-	if (is_amdgpu_device(data-&gt;fd))
-		igt_display_commit_atomic(display, 0, NULL);
-	else
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(display, 0, NULL);
 
 	if (flags &amp; TEST_NEEDS_DSC) {
 		igt_force_dsc_enable(data-&gt;fd, data-&gt;output-&gt;name);
 		igt_assert(igt_is_force_dsc_enabled(data-&gt;fd, data-&gt;output-&gt;name));
 	}
-	/* Enter SDR via metadata, no modeset allowed for
-	 * amd driver, whereas a modeset is required for
-	 * intel driver. */
+	/* Enter SDR via metadata, no modeset required as only
+	 * infoframe content changes. */
 	igt_hdr_fill_sdr(&amp;hdr);
 	igt_hdr_set_metadata(data-&gt;output, &amp;hdr);
-	if (is_amdgpu_device(data-&gt;fd))
-		igt_display_commit_atomic(display, 0, NULL);
-	else
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(display, 0, NULL);
 	igt_debug_interactive_mode_check(&quot;traditional-sdr&quot;,
 					 &quot;SDR pattern displayed with traditional SDR metadata&quot;);</pre>
    </blockquote>
    <p>LGTM,&nbsp;&nbsp;</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260527193104.2533212-1-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
</pre>
    </blockquote>
  </body>
</html>

--------------oEJMrFBVcESV0IE94neuL5dg--
