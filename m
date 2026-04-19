Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E658BEA7197
	for <igt-dev@archiver.kernel.org>; Sun, 19 Apr 2026 18:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341A210E011;
	Sun, 19 Apr 2026 18:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWF9TNX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06510E011
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2026 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776624238; x=1808160238;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mHAC/TYSYb9zwyKWvo6NPgHG+ILrZOHh0wMKe66k820=;
 b=TWF9TNX+UoujDxBek/IPaTo23c/PX6jDer1p6WwRTKvJzt6yVtyufYrg
 lbN/I1OES8lRCDlqkGrSvj5YthZtG6aJ6U1TSrucd+3K5zPU2FTuNXNZv
 uZNRREGejkGHYT0lNv2ToZJ3mWcVyCmKZSoTgp+GZyw4iP3rb3fOySpDZ
 TuipKaJPAozF+QT96rsP8thjAlIJZ2S2PP/VPkGo9YAJXXyKpPG4hsB17
 sZPG/n3o2DghGB6gOkjlVKmXxsLH2WlQfjDuOBRq2Ds3FwNsJMEeN/bZE
 o5rIwaeiLt0O79JWupKo5TL0qQnShRUtbEsOnloKdV5L48S+irDr9Mzs0 Q==;
X-CSE-ConnectionGUID: rr+yX6o7RTqWGV4hRRD4eA==
X-CSE-MsgGUID: yg/i1BTqSKSv5uqnLmLhBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77419518"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208";a="77419518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 11:43:57 -0700
X-CSE-ConnectionGUID: XWdk8b6GT7KikS3KSJCpgQ==
X-CSE-MsgGUID: NnNopb6gQF6s1V67JtnRyA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 11:43:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 11:43:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 11:43:57 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 11:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kad5MPwATSADbpD3PBhxs96iS7Bfy8Jobf+ZG1DCjFgRF0EZDo7YpTtpKDNH1KAMb7hWLD6okUE8jA51Yx0crrImh2BumUY9Zs4yD1c8zUz07mxC1A1s2ZUY99jD+NPjC2nSrgefbT0D27BfVZkuupHBbPjPyB5g2lmjgzeWNBNSKzEkPhY3mig4sxE1RgLclWZLeh1tmiC7/aFxeuznp2da3rTmPsSTK633bpi6sao6dcbnRIHABXlGkJR4PkFvv/mypWDk/8OJbCy7nDWA2emadho30D5XftPpctHjacWO7B+/Iuk+nfyoX94X4VtoGnl3GE/NxiSEzMNzdy2eeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoJD62hHKK3m1szIuy3dKuZgePDC0p4md02N0qfz1eA=;
 b=k4C5JwbS4AlPHHN8MBRoGNRko1IJYN1VnqvRjbaVMI1pyIIuovljjrfM5HsUTDq2M1k1j00nfmXl3EACb7+aRamKcipWU9FhUvEPfs1//gwNaTwlkP77dg69wOGt6wEa79ZOF7AP2n4WSIMMlya1Rx3GRrShHKcTsV7iVcleJhOzsqbFViqhAvBoTFMnwUwl/cM5wrT636ku4WvMT752m0/aESSFkYD0+B65UmxBPSDCPz3EOoSkD8t/cWJgbq75yZsMRHYXkMv/+7ZQAtVfH5CEXk8ZweYvuWJuic7YVPJBoqGgdj6+tw1dPDtQYYVDRrXuMY8NR4R8KzfRpWF4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Sun, 19 Apr
 2026 18:43:54 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9846.011; Sun, 19 Apr 2026
 18:43:54 +0000
Message-ID: <6db9ce20-bd93-44c0-8f1a-54104b76432e@intel.com>
Date: Mon, 20 Apr 2026 00:13:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to
 use specific engine and gt
To: <igt-dev@lists.freedesktop.org>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-7-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260323162911.1912755-7-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To PH7PR11MB7148.namprd11.prod.outlook.com
 (2603:10b6:510:1ef::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d63711-e595-4202-0baa-08de9e439ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6m1cDaQuB/3QnuMuRxt/3vmJrKgLalPWMtk1PbHO9uUdjyXSjaueKKDMdaBbmAhAv9aksa+Kag+rungiXzaV94EnO55zJNN+Z/MR6a/tQpShIEATsnq2fkMQxUrJ9y6Td17lliVeV+Wb3c6f6U215Q1QphtxyJJb/zoFvcrpzyLs2UylD8S27BTe7Rr4XaPcINop+1iM3bKz+T7zqAQqnwt0wxKyrYif3/1nw/pipbWf+hb+4MnErTjBkZeCKzuv2diIfvi47vn9bHl5MvaF6NTh2RIms0Kko0B1vTWW47uY8DJaLuUEEoyJRHtBQ4clAoALJHqMnXbifH5IjpktpV7f5AFZ4WFNMr2GdkK7MQiOajw+Bq1jVEaYImoeXun5RfpoevR48BAmYD/kWMXvKSApmG2jDcG8Ag8WrhBlCeG2zlOmxGfLo4Rc6fpFNuIXvUv1YFgZiXlt/zoXhrLBSX+b6WKrwalAbI475H3mM2dDVsl6oY66HI5VzppDSx3e0Rx8nshWnrXp7oyxhcQOWFBOkdHGO4VtyTM5aotNB15OC2uywKJsdzpfyRx6nxY2dQf6BOZclRDXMywxVrrhek5ieMe3HQp0YZRH01l+YQ5ZiAKkiGLheCNQqW7cTT9pAZkL0spUolwp8VzdGndgCrOwvtxQapGzM6SZTPZqRyTClwyDu/1IMoNVek0iBhpQ31uhJugUl9Z2ea1+WPmT7jU42ZFkkrh16CYFsvqpSu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVaUW9YT2JvRnBIZzhwOFBlSEw2UFhFVzNneDZ1cE9ZRzIvU1FKMCtiT0RE?=
 =?utf-8?B?TE9OelFlcGdwcldCbm9EQnNCQ3JCZ2kvdlFTeWdMNmxhanMvbXVrTGRSOFQ4?=
 =?utf-8?B?by9ranBIWmNxajlIVFo0NnEzTU05NVRVZmp3Vy93TGh6VTZQK2p3T1RMMU9q?=
 =?utf-8?B?Y3d1SVBCV0FIcE0wSlNrWUNNQTNycVhRR2pSNTlJSVdxSHQ2TlhvcElsMSs5?=
 =?utf-8?B?WDdUczVWaVdhVjljSEZrU1pOTU9hMUx5dkQ3L0k2aDQ4aDd6TXk3YjFuSGZv?=
 =?utf-8?B?WnY2NURjL2MzZDE3Yk9SMUcvOUZNSjUzUi9WRVlmbE9idi9aR2Q0M2xPU25Y?=
 =?utf-8?B?WVc3UFpub0xuMFFraFhFSlF5ekdINXRraW9SKzg1TWF0aGxTMmR2VXczSm9B?=
 =?utf-8?B?eGMxc0xGS1dwT0hiYXRLZG9EOTRrWFVyMWZUY1U5bUtBL1JleDhuYkFqYjNl?=
 =?utf-8?B?Y09Sa2dpV1FZZnZKWExPMzRFQU03VW5lSjhPSUYyd2szWGQzUUh4UmFDYkF1?=
 =?utf-8?B?bHNYQlNDL0dLenpKQXNLSjNodExSMStBak0yODZoaHRRSFN1RityQ3hJSzAz?=
 =?utf-8?B?cC8xdVFZVmIzV01pVDhOQTdqVno3cnlpNkdaQjdIZWtMeVNkY2toUlRHUy9T?=
 =?utf-8?B?eWJWS0lFSjBXV1Q1RmQ4T1Ixa0lzSUdiZ1hYN2JVWDBrR3F5KzU5TGp2UkZZ?=
 =?utf-8?B?WmtqTFlyME1TNGJrVW1JSENjZ1QwTm1vNDJBNHdxQjhIZXNMOW1xNWYzQWtF?=
 =?utf-8?B?eE96UHpDakNaeXlncFU5NTF6UlVnMHQ3Njd0TXFyY3JSc3c5cFB6UmR5Y2pQ?=
 =?utf-8?B?R1ZJK3ZlVlBiVVlCSFRuZkFYdHc3WGpnOVQrNTZkTFIwdUxSNDZlRjc3TUIw?=
 =?utf-8?B?RXJtQ3ZvOHR5dlNJN3FHaXYxWCtlRHRTN0RSWUdPQTBBd0J1SDBzWTZOWXRz?=
 =?utf-8?B?cFpYb1JyUFovT3UrTXZKL1VpSWhvQmFDUjVuUTFpS2RXQS9ERWU2NVZFbVY0?=
 =?utf-8?B?SUVCRnF3VTNvelQyZVd0VTdWY2RMUW5zT1NnWkZGU3lhUGNCTDZlbjFselNx?=
 =?utf-8?B?Q1p6bUZCeEt2WStiWUYxVHZURUd5bWs5aFZsbzQ2OGJTcGU4ZFpxbTA0cHFo?=
 =?utf-8?B?RTk0WGdhRm43UnFadmhQdklobXg2NVlVOUNxbDdJT0MreEtLODRtSk81NjdD?=
 =?utf-8?B?ek5qUXkvaWFmRFo4a3VTZi9yU1JJcll5bVVlMG4rUGVZTU1KZ0MvREtSbk53?=
 =?utf-8?B?dWpBMWhBNEc1d1pyVkRqRFdDYlpjNFVCdGZoWmlONm41VkJvNlRkU0lZVmRt?=
 =?utf-8?B?djRNMzJoRjFTeXlMalEvQmFEbGRmeEM1U2M0WW5vSjY3RERTY3EyQk9haUFC?=
 =?utf-8?B?azRqaExLU3FIcWd6OTA4WHhDSE5rcVV0MVZlcmpmcFJGS3BuK0tyckkzdUR1?=
 =?utf-8?B?MGpkZ3hHdHNsN0NVWFYvZU9hY2w1NW1ZOEtwNmdpakdkbzJRL2VzZmlYSWwr?=
 =?utf-8?B?aG5IckRUMVNZQWwvOG9wQm84V0tKbUxEblVBRHZISTgvWEJ1UVVOYXBoZ2pj?=
 =?utf-8?B?ZHBxcUx4UVRaU0dxcFFFT3NkZGxJZ0hybzF5RVBVMDNZSDB1S2c4WTQrNzh1?=
 =?utf-8?B?S1BuWU5yblh4VENnQVVRY0lhVlY1L2hHQ0x5L0xRbkFOU1VBK3pEMTc5MHNJ?=
 =?utf-8?B?Uy9kV2NRTDZmak1ickxNb3huY1pmbU1OcENjVmhPb3JNT0Rad2QyS0Q2RnV5?=
 =?utf-8?B?bHJOSEFPbXNjZVZ3aTRZZWhuNTk1Q0orTjV0TGVEL3krR3lZOWg1YzNTMnp4?=
 =?utf-8?B?cFJNTmJBa0NjY0IrclhnVTBXRDVOa2FyMDlETzQwWFhiSFI5eXRJWjNBcWNo?=
 =?utf-8?B?OUZpSHZUQmlFeTN3bW41aWZVanVXU1ZJR011M2RHTGRucG5mVHRyU0pEMDNY?=
 =?utf-8?B?a3BCai9JeTZleEFGTUpwNVhQMmF1VmxHT0p2RFBJQ2VKUXl5bHRtMTZkanFz?=
 =?utf-8?B?K0JnYXQ3bjdZaFo1OXFRVVo2NFhSMFpoSnZHNjRmQ0dCZVlhOFV4K25lK0Jx?=
 =?utf-8?B?NDBwNmxxM25SYXpPcDAxQ3ROOXNJY3NtVzRrREw4MUJEeUJ4L0xqSGlnRlNz?=
 =?utf-8?B?SE1LRWxTUThKK1pPNXVQZCtXcmtzTmZOd2RIQ3VRdTlIQ1Y5WktYTVVHY1FQ?=
 =?utf-8?B?ZXZnSkQzdm5wc2ROV1l5bFBSU2ZDNGRmdHlTaERCck1aTVJMNkJBTkxIVmRZ?=
 =?utf-8?B?M2NnbkJJckNiUSthVzdrL1JPeUJ1UzBVWDB6enVOQXhPMk10c2ltQnV1RVh1?=
 =?utf-8?B?a0xpcjlSK0pDODZ6UWsybDZjWWI2V2lIcVBqOE5zWTdkMFFmbWttcmhQUFhN?=
 =?utf-8?Q?R3/+IR0APgGIaUJU=3D?=
X-Exchange-RoutingPolicyChecked: VA+dPKhl9YG1muQDS/CpUuYFdgcPIe+++Lzh9jwAdlrCEJ0RrkxM+RSH22GCg1Ksr2WLFiVDYI3XBfMRcDPBbvKOeNCBEnzb1uxXkztQCspsJYpFnoZCKFZk7GgLn3BFHvDw/kSLm2jl0jQHku3Hml5P33YQWLChkw6f2Fluoxe/nedOYizNdfdpoAkuhSw7iWuikL9HexbQUpHWMMfNARfG1DBUA+Tpjfxz/YxFuf9OkdLbS5mlaME5jRXoJxRB4+yvUTfLS6Bct4V+4XzDgZNu6ygRt7+y1eaXyC2zzA1XuHEmkTOw2gCHElEgOulKs1To3G0Qy82RX7PCbWjf+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d63711-e595-4202-0baa-08de9e439ae7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 18:43:54.4674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdWsgv5FxYJH8kwIAYk6F2IECB/LkuPVV/xnoOr1o6MsV7VpiK3j/G1BQH46xd0rKiSeqsYWfroUaf69lLTyFV+b0BzUT0plbaeSuuORfyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

Hi JP,

On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
> Add __xe_bb_exec path to use specific engine/class/gt
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index a3fa58b4f..5c0597869 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2522,7 +2522,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>   	igt_assert_eq(ibb->num_relocs, 0);
>   	igt_assert_eq(ibb->xe_bound, false);
>   
> -	if (ibb->ctx) {
> +	if (ibb->gt_id) {
> +		unsigned short class = get_engine_class(ibb->fd, flags);
> +
> +		if (ibb->engine_id)
> +			xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
> +
> +		ibb->engine_id = engine_id = xe_exec_queue_create_class_gt(ibb->fd,
> +									   ibb->vm_id,
> +									   class,
> +									   ibb->gt_id);
> +	} else if (ibb->ctx) {
>   		engine_id = ibb->ctx;
>   	} else if (ibb->last_engine != engine) {
>   		struct drm_xe_engine_class_instance inst = { };

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

